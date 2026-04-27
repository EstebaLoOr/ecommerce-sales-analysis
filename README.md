# 📊 E-commerce Sales Analysis (SQL + Power BI)

## 📌 Project Overview

This project analyzes an e-commerce transactional dataset to uncover valuable business insights related to **sales performance, product contribution, customer retention, and revenue trends**.

Using **SQL (MySQL)** for data extraction and transformation, and **Power BI** for visualization, the objective was to simulate a real-world business intelligence workflow and transform raw data into actionable decisions.

---

## 🧠 Business Problem / Justification

E-commerce businesses generate thousands of transactions, but raw data alone does not explain performance.

This analysis was developed to answer critical business questions such as:

- Is revenue growing consistently over time?
- Which products generate the highest revenue?
- Is the business dependent on a few best-selling products?
- How valuable are repeat customers?
- What retention opportunities exist?

### 🎯 Who Benefits from This Analysis?

- Business owners  
- Sales managers  
- Marketing teams  
- Data analysts  
- Growth strategists

---

## 📈 Dashboard Preview

This interactive dashboard summarizes key KPIs such as revenue, orders, AOV, top-performing products, monthly growth trends, and repeat customer contribution.

![Dashboard Preview](images/dashboard_preview.PNG)

---

## 📂 Dataset Information

**Source:** Brazilian E-commerce Public Dataset by Olist (Kaggle)  
**Format:** CSV files loaded into MySQL  
**Tables Used:**

- `orders`
- `customers`
- `products`
- `order_items`
- `payments`

**Approximate Size:**

- 100k+ orders
- 95k+ customers
- 30k+ products

### Key Variables

| Variable | Description |
|--------|-------------|
| order_id | Unique identifier for each order |
| customer_unique_id | Unique customer identifier |
| order_purchase_timestamp | Purchase date/time |
| product_id | Unique product |
| price | Product sale value |
| freight_value | Shipping cost |

### Notes

- Missing values were cleaned using `NULLIF()`
- Revenue calculated as: `price + freight_value`
- Some product metadata fields contained null values

---

## 🔍 Analytical Process

## 1️⃣ Data Cleaning

- Imported multiple CSV tables into MySQL
- Converted blank values to NULL
- Validated data types (dates, decimals, integers)
- Standardized tables for joins

## 2️⃣ Exploratory Data Analysis (EDA)

- Total orders and customers
- Average items per order
- Monthly order trends
- Revenue validation
- Product sales distribution

## 3️⃣ Business Analysis

- Monthly revenue growth
- Average Order Value (AOV)
- Top 10 products by revenue
- Revenue concentration analysis
- Repeat customer rate
- Revenue from returning customers

---

## 💡 Key Findings

### 📌 1. Strong Revenue Growth Trend

Revenue increased steadily from 2017 through mid-2018, indicating healthy business expansion.

### 📌 2. Seasonal Peak in November

The highest revenue month was **November 2017**, likely influenced by Black Friday promotions and seasonal demand.

### 📌 3. Long-Tail Product Model

The **Top 10 products contributed only ~3.18% of total revenue**, meaning sales were widely distributed across many products instead of relying on a few winners.

### 📌 4. Low Retention, High Value Customers

Only **~3.05% of customers were repeat buyers**, but they generated a disproportionately higher share of revenue.

### 📌 5. Opportunity for CRM & Loyalty Programs

Increasing repeat purchase rate could significantly improve profitability with lower acquisition costs.

---

## 🛠️ Tools & Technologies

- **SQL (MySQL)**
- **Power BI**
- **Data Cleaning**
- **Exploratory Data Analysis**
- **Business Intelligence**
- **Dashboard Design**
- **Data Storytelling**

---

## 📁 Repository Structure

```bash
📦 ecommerce-sales-analysis
┣ 📂 SQL
┃ ┗ 📄 ecommerce_analysis.sql
┣ 📂 data
┃ ┣ 📄 sales_monthly.csv
┃ ┣ 📄 top_products.csv
┃ ┗ 📄 customer_metrics.csv
┣ 📂 dashboard
┃ ┗ 📄 ecommerce_dashboard.pbix
┣ 📂 images
┃ ┗ 📄 dashboard_preview.PNG
┣ 📄 README.md
┗ 📄 LICENSE
```

# 🚀 How to Use This Project
## Clone Repository
- git clone https://github.com/EstebaLoOr/ecommerce-sales-analysis.git
- cd ecommerce-sales-analysis

# 🧠 SQL Skills Demonstrated
- JOINs
- CTEs
- Aggregations
- Window Functions
- Date Functions
- Revenue Calculations
- Customer Segmentation

# 👤 Author
## Esteban López Ortega
- Github (https://github.com/EstebaLoOr)

⭐ Future Improvements
Add profit margin analysis
Customer cohort retention analysis
Category-level product insights
Geographic sales heatmaps
Predictive sales forecasting
Improved dashboard UX/UI

🤖 Notes

This project was created as part of my Data Analytics portfolio to demonstrate end-to-end analytical thinking:

Raw Data → SQL Analysis → Business Insights → Dashboard Storytelling

AI tools were used as learning support for workflow validation, documentation refinement, and best practices.
