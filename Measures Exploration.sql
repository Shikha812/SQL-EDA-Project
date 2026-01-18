-- =====================================================
-- Exploratory Data Analysis (EDA)
-- Section: Measures Exploration
-- =====================================================
-- Purpose:
-- 1. Calculate high-level (big number) business metrics
-- 2. Understand the overall scale of sales, customers, and products
-- =====================================================


-- =====================================================
-- Overall Sales Metrics
-- =====================================================

-- Total Sales Amount
SELECT
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Total Quantity of Items Sold
SELECT
    SUM(quantity) AS total_items_sold
FROM gold.fact_sales;

-- Average Selling Price
SELECT
    AVG(price) AS average_selling_price
FROM gold.fact_sales;

-- Total Number of Orders
SELECT
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;


-- =====================================================
-- Master Data Metrics
-- =====================================================

-- Total Number of Products
SELECT
    COUNT(DISTINCT product_number) AS total_products
FROM gold.dim_products;

-- Total Number of Customers
SELECT
    COUNT(DISTINCT customer_key) AS total_customers
FROM gold.dim_customers;

-- Total Number of Customers Who Placed Orders
SELECT
    COUNT(DISTINCT customer_key) AS customers_with_orders
FROM gold.fact_sales;


-- =====================================================
-- Consolidated Business Metrics Report
-- =====================================================

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Quantity Sold' AS measure_name, SUM(quantity) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Average Selling Price' AS measure_name, AVG(price) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Number of Orders' AS measure_name, COUNT(DISTINCT order_number) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Number of Products' AS measure_name, COUNT(DISTINCT product_number) AS measure_value
FROM gold.dim_products

UNION ALL

SELECT 'Total Number of Customers' AS measure_name, COUNT(DISTINCT customer_key) AS measure_value
FROM gold.dim_customers

UNION ALL

SELECT 'Customers Placed Orders' AS measure_name, COUNT(DISTINCT customer_key) AS measure_value
FROM gold.fact_sales;


-- =====================================================
-- Derived Metrics (Business Behavior Insights)
-- =====================================================

SELECT
    SUM(sales_amount) * 1.0 / COUNT(DISTINCT order_number) AS average_order_value,
    SUM(quantity) * 1.0 / COUNT(DISTINCT order_number) AS average_items_per_order
FROM gold.fact_sales;


-- =====================================================
-- Insights:
-- 1. The business has generated approximately 29.3 million in total sales
--    across 27,659 orders, indicating a healthy transaction volume.
-- 2. Customers typically purchase more than one item per order, with
--    an average of ~2.18 items per order.
-- 3. The average order value is approximately 1,060, reflecting
--    moderate customer spending behavior.
-- 4. All registered customers have placed at least one order,
--    suggesting the customer dimension contains only active customers.
-- =====================================================
