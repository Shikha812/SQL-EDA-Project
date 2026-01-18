-- =====================================================
-- Magnitude Analysis: Customers, Products, and Revenue
-- =====================================================
-- Purpose:
-- Understand the scale of customers, products, and revenue
-- Identify high-value markets, top categories, and data quality issues
-- =====================================================

--  Customers by Country with Revenue Insights
SELECT
    c.country,
    COUNT(DISTINCT c.customer_key) AS total_customers,
    SUM(f.sales_amount) AS total_revenue,
    SUM(f.sales_amount) * 1.0 / COUNT(DISTINCT c.customer_key) AS avg_revenue_per_customer
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY c.country
ORDER BY total_revenue DESC;

-- Insights:
-- - United States has the largest customer base and high total revenue
-- - Australia has fewer customers but higher revenue per customer (premium market)
-- - European countries have moderate customer counts and revenue
-- - 'n/a' indicates missing country data; clean for accurate reporting
-- - Focus marketing on high-volume and high-value markets while improving data quality

--  Customers by Gender
SELECT
    gender,
    COUNT(DISTINCT customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC;

-- Insights:
-- - Male and Female customers are almost evenly distributed
-- - Some customers have missing gender data ('n/a')
-- - Gender distribution can inform targeted marketing and personalization

--  Products by Category
SELECT
    category,
    COUNT(DISTINCT product_key) AS total_products,
    AVG(cost) AS avg_product_cost
FROM gold.dim_products
GROUP BY category
ORDER BY total_products DESC;

-- Insights:
-- - Bikes and Components have the highest number of products
-- - Clothing and Accessories have fewer products, targeting niche markets
-- - NULL category indicates missing or unclassified products; review or clean

--  Revenue by Product Category
SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Insights:
-- - Bikes generate the highest revenue, forming the core business category
-- - Accessories and Clothing generate moderate revenue, providing additional sales streams
-- - Low or NULL categories should be checked for data quality or low-performing products
