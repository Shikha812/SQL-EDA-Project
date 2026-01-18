-- =====================================================
-- Ranking Analysis: Top and Bottom Performers
-- =====================================================
-- Purpose:
-- 1. Identify top and bottom products by revenue
-- 2. Identify top customers by revenue and customers with fewest orders
-- 3. Mix of basic SQL and window functions to demonstrate skills
-- =====================================================

-- Top 5 Products by Revenue (Basic SQL)
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Bottom 5 Products by Revenue (Window Function)
SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) ASC) AS product_rank
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    GROUP BY p.product_name
) t
WHERE product_rank <= 5;

-- Top 10 Customers by Revenue (Window Function with RANK)
SELECT *
FROM (
    SELECT
        c.customer_key,
        c.first_name,
        c.last_name,
        SUM(f.sales_amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS customer_rank
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key, c.first_name, c.last_name
) t
WHERE customer_rank <= 10;

-- Bottom 3 Customers by Number of Orders (Basic SQL)
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders ASC;

-- =====================================================
-- Insights:
-- 1. Top products drive most of the revenue; focus inventory and marketing here.
-- 2. Bottom products may need promotions or review for discontinuation.
-- 3. Top customers contribute significantly to revenue; loyalty and retention strategies can be applied.
-- 4. Customers with very few orders can be targeted for engagement campaigns.
