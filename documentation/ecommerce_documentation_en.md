\# 📊 E-commerce Sales Analysis (SQL \+ Power BI)

\# 🧾 Executive Summary

The analysis identified consistent revenue growth, strong reliance on new customer acquisition, and a significant profitability opportunity through higher repeat purchase rates and customer retention strategies.

\#\#\# Business Value Delivered:

💰 \*\*Economic Impact:\*\* Estimated revenue upside of \*\*5% to 12%\*\* by improving repeat purchase rate and increasing average spend from returning customers.  

📈 \*\*KPI Improvement Opportunities:\*\* Repeat Purchase Rate, Customer Lifetime Value (CLV), Revenue per Customer, and Customer Retention.  

🎯 \*\*Business Decision Enabled:\*\* Shift budget allocation toward CRM, lifecycle marketing, loyalty programs, and remarketing instead of relying primarily on paid acquisition.

\---

\# 🧠 Business Context & Problem Statement

An e-commerce company processes thousands of monthly orders, but lacks clear visibility into what drives growth, which products sustain revenue, and how profitable its current customer base truly is.

\#\#\# 🏢 Industry / Business Area:

Retail / E-commerce / Business Intelligence

\#\#\# ⚠️ Core Business Problem:

Sales are growing, but customer retention is low and revenue concentration across products is unclear.

\#\#\# ❓ Key Business Question:

How can the business drive sustainable revenue growth: by acquiring more new customers or by improving retention of existing ones?

\---

\# 🎯 Project Objectives

\#\#\# 🎯 Objective 1:

Measure monthly revenue and order trends to identify growth patterns and seasonality.

\#\#\# 🎯 Objective 2:

Identify top revenue-generating products and evaluate sales concentration risk.

\#\#\# 🎯 Objective 3:

Quantify the impact of repeat customers to uncover retention opportunities.

\---

\# 📂 Data Sources & Data Dictionary

\#\# Data Sources:

📁 \*\*Source 1:\*\* Public Olist E-commerce Dataset (Kaggle) in CSV format  

📁 \*\*Source 2:\*\* MySQL relational database for SQL analysis

\#\# Dataset Overview:

\*\*Records:\*\* 100k+ orders, 95k+ customers, 30k+ products  

\*\*Time Period:\*\* September 2016 – September 2018

\#\# Data Dictionary:

| Variable | Type | Description |  
|--------|------|-------------|  
| order\_id | string | Unique order identifier |  
| customer\_unique\_id | string | Unique customer identifier |  
| order\_purchase\_timestamp | datetime | Purchase timestamp |  
| product\_id | string | Unique product identifier |  
| price | numeric | Product sale price |  
| freight\_value | numeric | Shipping cost |  
| revenue | numeric | price \+ freight\_value |

\---

\# 🛠️ ETL / Data Cleaning Process

\#\# Key Transformations:

🧹 \*\*Missing Data Handling:\*\* Converted blank fields to \`NULL\` using \`NULLIF()\`.

🔄 \*\*Transformations Performed:\*\*

\- Joined multiple tables (\`orders\`, \`customers\`, \`products\`, \`order\_items\`)  
\- Created revenue metrics  
\- Aggregated monthly sales performance  
\- Counted unique orders and customers

🧩 \*\*Feature Engineering:\*\*

\- Total Revenue \= Product Price \+ Shipping Cost    
\- Average Order Value (AOV)    
\- Repeat Customer Rate    
\- Revenue from Returning Customers

⚠️ \*\*Key Analytical Decision:\*\*

Used \`customer\_unique\_id\` to measure true customer recurrence and avoid duplicate counting across multiple accounts.

\---

\# 🔍 Exploratory Data Analysis (EDA) & Key Findings

\#\# Analysis Performed:

📊 \*\*Distributions:\*\*

\- Monthly sales volume  
\- Revenue by product  
\- Orders per customer

🔗 \*\*Observed Relationships:\*\*

\- Higher order volume strongly aligned with higher monthly revenue  
\- Returning customers showed higher average value than one-time buyers

🚨 \*\*Anomalies Identified:\*\*

\- Significant revenue spike in November 2017  
\- Sharp decline in final month due to partial period data cutoff

\---

\#\# Key Insights:

📌 Revenue increased steadily throughout 2017 and 2018, indicating healthy business expansion.  

📌 November 2017 was the strongest sales month, likely driven by Black Friday and seasonal promotions.  

📌 Top 10 products generated only \*\*\~3.18% of total revenue\*\*, revealing a diversified long-tail sales model rather than dependence on a few SKUs.  

📌 Only \*\*\~3.05% of customers were repeat buyers\*\*, signaling a major retention opportunity.  

📌 Returning customers generated disproportionately higher value versus first-time customers.

\---

\# 📈 Dashboard & Visualization

\#\# Dashboard Overview:

An executive Power BI dashboard was built to monitor revenue, orders, AOV, top-performing products, and repeat customer contribution.

It enables fast decision-making around:

\- Are sales growing?  
\- Which products drive revenue?  
\- How strong is customer retention?  
\- Where should growth efforts be focused?

\#\# Key KPIs:

📊 \*\*KPI 1:\*\* Total Revenue \= 15.84M  

📊 \*\*KPI 2:\*\* Total Orders \= 99K  

📊 \*\*KPI 3:\*\* Average Order Value \= 155.01  

📊 \*\*KPI 4:\*\* Repeat Customer Rate \= 3.05%

\#\# Tools Used:

\- SQL (MySQL)  
\- Power BI

\---

\# 💡 Conclusions & Business Recommendations

\#\# Conclusions:

🧠 The business shows strong commercial traction, but depends heavily on continuous new customer acquisition.  

🧠 There is a clear path to more profitable growth through stronger retention and increased customer lifetime value.

\#\# Recommendations:

✅ Launch post-purchase email automation flows.  

✅ Build a loyalty program incentivizing second and third purchases.  

✅ Run segmented remarketing campaigns for inactive customers.  

✅ Identify high-repeat categories to promote bundles and cross-sell offers.  

✅ Implement monthly retention cohort tracking.

\---

\# ⚠️ Limitations & Next Steps

\#\# Limitations:

⚠️ Product cost data was not available, so profit margin analysis could not be performed.  

⚠️ Acquisition channels (Paid Search, Meta Ads, Organic, Email, etc.) were not included.  

⚠️ Final reporting period appears partial, affecting end-of-period comparisons.

\#\# Next Steps:

🚀 Add gross margin and profit analysis by product/category.  

🚀 Build customer retention cohort analysis.  

🚀 Develop monthly sales forecasting models.  

🚀 Segment customers using RFM (Recency, Frequency, Monetary).

\---

\# 👤 Author

\*\*Esteban López Ortega\*\*  

LinkedIn: https://www.linkedin.com/in/esteban-lopez-711527102/  

GitHub: https://github.com/EstebaLoOr