-- =====================================================
-- Exploratory Data Analysis (EDA)
-- Section: Date Exploration & Customer Demographics
-- =====================================================


-- =====================================================
-- Date Exploration: Sales Time Coverage
-- Purpose:
-- 1. Identify the first and last available sales dates
-- 2. Understand the overall time span of the dataset
--    to assess suitability for trend and seasonality analysis
-- =====================================================

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS year_difference,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS month_difference
FROM gold.fact_sales;

-- Insight:
-- Sales data spans approximately 4 years (37 months),
-- providing sufficient historical depth for analyzing
-- long-term trends, seasonality, and year-over-year performance.
--
-- Note:
-- Year and month differences represent boundary differences,
-- not exact completed years.


-- =====================================================
-- Customer Demographics: Youngest and Oldest Customers
-- Purpose:
-- 1. Understand the customer age range
-- 2. Identify potential demographic segmentation boundaries
-- =====================================================

SELECT
    MIN(birthdate) AS oldest_customer_birthdate,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_customer_age,
    MAX(birthdate) AS youngest_customer_birthdate,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_customer_age
FROM gold.dim_customers;

-- Insight:
-- Customer age ranges from approximately 40 to 110 years,
-- indicating a broad demographic spread.
-- The extremely high age suggests potential data quality issues
-- (e.g., incorrect or default birthdates), which should be
-- validated before demographic-based analysis.


-- =====================================================
-- Data Quality Check: Identify Unusually Old Customers
-- =====================================================

SELECT
    customer_id,
    birthdate,
    DATEDIFF(YEAR, birthdate, GETDATE()) AS age
FROM gold.dim_customers
WHERE DATEDIFF(YEAR, birthdate, GETDATE()) > 100;

-- Insight:
-- 19 customers have an age greater than 100 years.
-- This is highly unlikely in a typical retail dataset and
-- indicates potential data quality issues such as incorrect
-- birthdates or placeholder values.
--
-- Next Steps:
-- Before using customer age for segmentation, these records
-- should be validated with the source system, capped at a
-- realistic threshold, or excluded to ensure analytical accuracy.
