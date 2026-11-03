
-- Customer Shopping Behavior Analytics
-- SQL Analysis using MySQL

USE customer_shopping;

-- 1. Check total records
SELECT COUNT(*) AS total_records
FROM customer_shopping_data;

-- 2. Check product category distribution
SELECT category, COUNT(*) AS total_purchases
FROM customer_shopping_data
GROUP BY category
ORDER BY total_purchases DESC;

-- 3. Customer distribution by gender
SELECT gender, COUNT(*) AS total_customers
FROM customer_shopping_data
GROUP BY gender;

-- 4. Total sales by gender
SELECT gender,
       SUM(purchase_amount_usd) AS total_sales
FROM customer_shopping_data
GROUP BY gender;

-- 5. Average purchase amount by gender
SELECT gender,
       AVG(purchase_amount_usd) AS average_purchase
FROM customer_shopping_data
GROUP BY gender;

-- 6. Payment method distribution
SELECT payment_method,
       COUNT(*) AS payment_count
FROM customer_shopping_data
GROUP BY payment_method
ORDER BY payment_count DESC;

-- 7. Subscription status analysis
SELECT subscription_status,
       COUNT(*) AS total_customers,
       SUM(purchase_amount_usd) AS total_sales,
       AVG(purchase_amount_usd) AS average_purchase
FROM customer_shopping_data
GROUP BY subscription_status;

-- 8. Average customer review rating
SELECT AVG(review_rating) AS average_rating
FROM customer_shopping_data;

-- 9. Sales by product category
SELECT category,
       SUM(purchase_amount_usd) AS total_sales
FROM customer_shopping_data
GROUP BY category
ORDER BY total_sales DESC;

-- 10. Sales by season
SELECT season,
       SUM(purchase_amount_usd) AS total_sales
FROM customer_shopping_data
GROUP BY season
ORDER BY total_sales DESC;

-- 11. Customer age group analysis
SELECT
    CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS age_group,
    SUM(purchase_amount_usd) AS total_sales
FROM customer_shopping_data
GROUP BY age_group
ORDER BY total_sales DESC;
