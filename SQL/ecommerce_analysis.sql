-- =========================
-- 1. TABLE CREATION
-- =========================

CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(20),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);

-- =========================
-- 2. DATA LOADING
-- =========================

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_items.csv"
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv"
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payments.csv"
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv"
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =========================
-- 3. DATA CLEANING
-- =========================


TRUNCATE TABLE orders;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
order_id,
customer_id,
order_status,
@order_purchase_timestamp,
@order_approved_at,
@order_delivered_carrier_date,
@order_delivered_customer_date,
@order_estimated_delivery_date
)
SET
order_purchase_timestamp = NULLIF(@order_purchase_timestamp,''),
order_approved_at = NULLIF(@order_approved_at,''),
order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date,''),
order_delivered_customer_date = NULLIF(@order_delivered_customer_date,''),
order_estimated_delivery_date = NULLIF(@order_estimated_delivery_date,'');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
product_id,
product_category_name,
@product_name_lenght,
@product_description_lenght,
@product_photos_qty,
@product_weight_g,
@product_length_cm,
@product_height_cm,
@product_width_cm
)
SET
product_name_lenght = NULLIF(@product_name_lenght,''),
product_description_lenght = NULLIF(@product_description_lenght,''),
product_photos_qty = NULLIF(@product_photos_qty,''),
product_weight_g = NULLIF(@product_weight_g,''),
product_length_cm = NULLIF(@product_length_cm,''),
product_height_cm = NULLIF(@product_height_cm,''),
product_width_cm = NULLIF(@product_width_cm,'');


-- =========================
-- 4. EXPLORATORY ANALYSIS
-- =========================

-- This script is for counting total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- This script is for obtaining unique customers
SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;

-- This script is for counting orders with products
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_items;

-- This script is for counting products per order
SELECT 
AVG(items_per_order)
FROM
(
SELECT order_id, COUNT(*) AS items_per_order
FROM order_items
GROUP BY order_id
) t;

-- This script is for obtaining the total revenue (Revenue = price + freight_value)
SELECT 
	SUM(price) AS total_price_revenue,
    SUM(freight_value) AS total_freight,
    SUM(price) + SUM(freight_value) AS total_revenue
FROM order_items;

-- This script is for obtaining the total revenue(price + freight) and group it by year-month
SELECT 
	DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(order_items.price) + SUM(order_items.freight_value) AS revenue
FROM orders
INNER JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m')
ORDER BY month DESC;

-- This script is for obtaining the highest earning months
SELECT 
	DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(order_items.price) + SUM(order_items.freight_value) AS revenue
FROM orders
INNER JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m')
ORDER BY revenue DESC;

-- This script is for obtaining number of orders per year-month
SELECT 
	DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(DISTINCT order_items.order_id) AS total_orders
FROM orders
INNER JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m')
ORDER BY total_orders DESC;

-- =========================
-- 5. BUSINESS ANALYSIS
-- =========================
/*
Consolidate query. This script is for obtaining the Average Order Value (AOV), number of orders and total revenue (Revenue = price + freight_value) all per year-month
Sales Overview 
*/
SELECT 
	DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(price) + SUM(freight_value) AS revenue,
    COUNT(DISTINCT order_items.order_id) AS total_orders,
	(SUM(price) + SUM(freight_value)) / COUNT(DISTINCT order_items.order_id) AS AOV
FROM orders
INNER JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m')
ORDER BY month;

-- This script is for obtaining the 10 first products with the most revenue
SELECT 
	p.product_id,
    COUNT(oi.order_id) AS items_sold,
    SUM(oi.price) + SUM(oi.freight_value) AS revenue
FROM products p
INNER JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY revenue DESC
LIMIT 10;

-- This script is for obtaining the total_percentage_top10_revenue
WITH rank_table AS (
    SELECT 
        product_id,
        SUM(price) + SUM(freight_value) AS revenue,
        RANK() OVER (ORDER BY SUM(price) + SUM(freight_value) DESC) AS rank_position
    FROM order_items
    GROUP BY product_id	
)
SELECT 
	SUM(revenue) AS total_revenue,
	SUM(CASE WHEN rank_position <= 10 THEN revenue ELSE 0 END) AS top10_revenue,
    (SUM(CASE WHEN rank_position <= 10 THEN revenue ELSE 0 END)/SUM(revenue)) * 100 AS total_percentage_top10_revenue
FROM rank_table;

-- This script is for obtaining the repeat_customer_rate
WITH customers_table AS (
	SELECT 
		customers.customer_unique_id,
		COUNT(orders.order_id) AS total_orders
	FROM customers
	INNER JOIN orders 
		ON customers.customer_id = orders.customer_id
	GROUP BY customers.customer_unique_id
	HAVING COUNT(orders.order_id) > 1
)
SELECT COUNT(*) AS repeat_customers,
(COUNT(*) * 100) / 
(SELECT COUNT(DISTINCT customer_unique_id) FROM customers) AS repeat_customer_rate -- Divided total repear_customers / total_unique_customers
FROM customers_table;

-- This script is for obtaining the customer revenue compared with the total
WITH revenue_table AS (
	SELECT 
		customers.customer_unique_id,
		COUNT(DISTINCT orders.order_id) AS total_orders,
		SUM(order_items.price) + SUM(order_items.freight_value) AS revenue
	FROM customers
	INNER JOIN orders ON customers.customer_id = orders.customer_id
	INNER JOIN order_items ON orders.order_id = order_items.order_id
	GROUP BY customers.customer_unique_id
)
SELECT 
	SUM(revenue) AS total_revenue,
    SUM(CASE WHEN total_orders > 1 THEN revenue ELSE 0 END) AS repeat_customer_revenue,
    (SUM(CASE WHEN total_orders > 1 THEN revenue ELSE 0 END) / SUM(revenue)) * 100 AS customer_revenue
FROM revenue_table;

WITH customer_orders AS (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.price) + SUM(oi.freight_value) AS revenue
    FROM customers c
    JOIN orders o 
        ON c.customer_id = o.customer_id
    JOIN order_items oi 
        ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    COUNT(DISTINCT customer_unique_id) AS total_customers,
    SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    SUM(revenue) AS total_revenue,
    SUM(CASE WHEN total_orders > 1 THEN revenue ELSE 0 END) AS repeat_customer_revenue
FROM customer_orders;
