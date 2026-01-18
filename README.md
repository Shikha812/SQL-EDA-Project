# SQL EDA Project: Retail Sales Analysis

## Project Overview
This project demonstrates a **comprehensive Exploratory Data Analysis (EDA)** on a retail sales dataset using **SQL (SSMS)**.  
The purpose is to analyze customer, product, and sales data to extract actionable business insights, identify high-value products and markets, and demonstrate proficiency in SQL including **aggregations, joins, and window functions**.

---

## Dataset
- **Fact Table:** `fact_sales` — Contains all sales transactions with quantity and sales amount.  
- **Dimension Tables:**  
  - `dim_customers` — Customer demographic information.  
  - `dim_products` — Product information including category, subcategory, cost, and price.

**Dataset Summary:**
- Total Customers: 18,484  
- Total Products: 295  
- Total Sales Transactions: 60,398  

**Insights:**  
- The dataset follows a **star schema**: fact table connected to customer and product dimensions.  
- Customers and products appear multiple times in the sales table, indicating **repeat transactions**.

---

## Analysis Components

### 1️⃣ Dimensions Exploration
- **Objective:** Explore key categorical variables to understand diversity in customers and products.
- **Findings:**
  - Customers belong to multiple countries; 7,630–20,481 customers in top countries.  
  - Gender distribution: ~9,341 males, ~9,128 females, 15 unknown.  
  - Product categories include Bikes, Components, Clothing, and Accessories.  
  - Some categories or subcategories are missing (`NULL`), indicating potential data quality issues.

---

### 2️⃣ Date Exploration
- **Objective:** Understand the sales timeline and customer ages.
- **Findings:**
  - Sales span **4 years (37 months)** — sufficient for trend and seasonal analysis.  
  - Customer ages range from **40 to 110**.  
  - 19 customers are over 100 years old, indicating **data anomalies** that should be validated or cleaned.

---

### 3️⃣ Measures Exploration
- **Objective:** Calculate high-level business metrics.
- **Key Metrics:**
  - **Total Sales:** 29,356,250  
  - **Total Quantity Sold:** 60,423  
  - **Average Selling Price:** 486  
  - **Total Orders:** 27,659  
  - **Total Products:** 295  
  - **Total Customers:** 18,484  

**Insights:**  
- Provides a clear **snapshot of business scale**.  
- Helps identify top-performing products and customer segments.

---

### 4️⃣ Magnitude Analysis
- **Objective:** Analyze distribution of customers, revenue, and products across dimensions.
- **Findings:**
  - **Customers by Country:**  
    - US leads with 20,481 customers; Australia next with 13,346.  
    - European markets (UK, Germany, France) form mid-tier segments.  
    - 'n/a' indicates missing country data.
  - **Revenue by Country:**  
    - US highest total revenue, Australia highest **average revenue per customer**.  
    - Focus marketing on high-volume (US) and high-value (Australia) markets.
  - **Products by Category:**  
    - Bikes generate the highest revenue; Accessories and Clothing moderate.  
    - Some `NULL` categories indicate missing or unclassified products.
  - **Gender Distribution:** Male and Female customers are almost evenly distributed.

---

### 5️⃣ Ranking Analysis
- **Objective:** Identify top and bottom products and customers using **window functions** (`ROW_NUMBER`, `RANK`).
- **Findings:**
  - **Top 5 Products by Revenue:** Mountain-200 Black/Silver dominate sales.  
  - **Bottom 5 Products by Revenue:** Low-performing products can be targeted for promotions or removed.  
  - **Top 10 Customers by Revenue:** Nichole Nara, Kaitlyn Henderson, and Margaret He contribute most revenue.  
  - **Bottom 3 Customers by Number of Orders:** Low-activity customers could be targeted for engagement campaigns.

---

## Tools & Techniques
- SQL (SSMS)  
- Joins, aggregations, `GROUP BY`, window functions (`ROW_NUMBER`, `RANK`)  
- Data quality checks for missing or anomalous values  
- KPI calculation and business insights extraction

---

## Key Business Insights
1. Focus marketing and sales strategies on **US (volume)** and **Australia (high-value)**.  
2. Top products (Bikes, Mountain-200 series) should be prioritized for **inventory and promotions**.  
3. Bottom-performing products and low-activity customers should be targeted for **growth campaigns**.  
4. Address **data quality issues**: customers over 100 years old, missing product categories, and missing countries.  
5. Customer age, gender, and country distribution can guide **segmentation and personalization** strategies.

---

## Next Steps
- Clean missing or anomalous data.  
- Visualize trends and rankings in **Power BI or Excel dashboards**.  
- Perform deeper **seasonal, cohort, and segmentation analyses**.

---

## Author
**Shikha Srivastava**  
- GitHub: [https://github.com/Shikha812](https://github.com/Shikha812)  
- SQL-focused EDA projects for retail and business analytics.
