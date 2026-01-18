/*
Objective:
Explore key categorical variables (dimensions) in the dataset 
to understand the diversity of customers and products.
*/

/*------------------------------------------
1. Explore all unique countries customers come from
-------------------------------------------*/
SELECT DISTINCT country  
FROM gold.dim_customers;

/* Count of unique countries */
SELECT COUNT(DISTINCT country) AS num_countries
FROM gold.dim_customers;

/*------------------------------------------
2. Explore all product categories, subcategories, and product names
-------------------------------------------*/
SELECT DISTINCT category, subcategory, product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;

/*------------------------------------------
3. Count of subcategories per category (ignoring NULLs)
-------------------------------------------*/
SELECT 
    category, 
    COUNT(DISTINCT subcategory) AS num_subcategories
FROM gold.dim_products
WHERE subcategory IS NOT NULL
GROUP BY category
ORDER BY category;

/*------------------------------------------
4. Count of subcategories per category (label NULLs as 'No Subcategory')
   – fixed for MySQL: GROUP BY repeats the COALESCE expression
-------------------------------------------*/
SELECT 
    category, 
    COALESCE(subcategory, 'No Subcategory') AS subcategory_label,
    COUNT(*) AS num_products
FROM gold.dim_products
GROUP BY category, COALESCE(subcategory, 'No Subcategory')
ORDER BY category, subcategory_label;

