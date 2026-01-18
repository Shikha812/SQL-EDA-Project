/*
Understand the size of the database by counting records
in each core table.
*/

-- Total number of customers
SELECT COUNT(*) AS total_customers FROM gold.dim_customers;

-- Total number of products
SELECT COUNT(*) AS total_products FROM gold.dim_products;

-- Total number of sales transactions
SELECT COUNT(*) AS total_sales FROM gold.fact_sales;


/*
Results:
- Total Customers: 18,484
- Total Products: 295
- Total Sales Transactions: 60,398

Insights:
- The dataset follows a star schema with dimension tables
  for customers and products and a fact table for sales.
- Each customer and product appears multiple times in the
  sales table, indicating repeat transactions.
*/