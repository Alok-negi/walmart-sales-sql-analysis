
--  Feature Engineering: Add time_of_day, day_name, month_name
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales
SET time_of_day = (
    CASE 
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
);

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);
UPDATE sales
SET day_name = DAYNAME(date);

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);
UPDATE sales
SET month_name = MONTHNAME(date);


ALTER TABLE sales CHANGE `Product line` product_line VARCHAR(100) NOT NULL;

ALTER TABLE sales CHANGE `Customer type` customer_type VARCHAR(100) NOT NULL;

-- Add product_category based on average sales
ALTER TABLE sales ADD COLUMN product_category VARCHAR(20);
UPDATE sales 
SET product_category = (
    CASE 
        WHEN total >= (SELECT AVG(total) FROM sales) THEN 'Good'
        ELSE 'Bad'
    END
);

select * from sales;

-- Distinct cities
SELECT DISTINCT city FROM sales;

-- Branch locations
SELECT DISTINCT branch, city FROM sales;

-- Count product lines
SELECT COUNT(DISTINCT product_line) FROM sales;

-- Most common payment method
SELECT payment, COUNT(*) AS count 
FROM sales 
GROUP BY payment 
ORDER BY count DESC 

-- Most sold product line
SELECT product_line, COUNT(*) AS total_sold
FROM sales 
GROUP BY product_line 
ORDER BY total_sold DESC 

-- Total revenue by month
SELECT month_name, SUM(total) AS total_revenue
FROM sales 
GROUP BY month_name 
ORDER BY total_revenue DESC;

-- Highest COGS month
SELECT month_name, SUM(cogs) AS total_cogs
FROM sales 
GROUP BY month_name 
ORDER BY total_cogs DESC 

-- Product line with highest revenue
SELECT product_line, SUM(total) AS total_revenue
FROM sales 
GROUP BY product_line 
ORDER BY total_revenue DESC 

-- City with highest revenue
SELECT city, SUM(total) AS total_revenue
FROM sales 
GROUP BY city 
ORDER BY total_revenue DESC 

-- Product line with highest VAT (tax_5_percent)
SELECT product_line, SUM(tax_5_percent) AS total_vat
FROM sales 
GROUP BY product_line 
ORDER BY total_vat DESC 

-- Branches selling above average quantity
SELECT branch, SUM(quantity) AS total_quantity
FROM sales 
GROUP BY branch
HAVING total_quantity > (SELECT AVG(quantity) FROM sales);

-- Most common product line by gender
SELECT gender, product_line, COUNT(*) AS total
FROM sales 
GROUP BY gender, product_line 
ORDER BY total DESC;

-- Average rating per product line
SELECT product_line, ROUND(AVG(rating), 2) AS avg_rating
FROM sales 
GROUP BY product_line 
ORDER BY avg_rating DESC;

-- Sales by time_of_day per weekday
SELECT day_name, time_of_day, COUNT(*) AS total_sales
FROM sales 
WHERE day_name NOT IN ('Saturday', 'Sunday')
GROUP BY day_name, time_of_day;

-- Customer type with highest revenue
SELECT customer_type, SUM(total) AS total_revenue
FROM sales 
GROUP BY customer_type 
ORDER BY total_revenue DESC 

-- City with highest VAT
SELECT city, SUM(tax_5_percent) AS total_vat
FROM sales 
GROUP BY city 
ORDER BY total_vat DESC 

-- Customer type with highest VAT
SELECT customer_type, SUM(tax_5_percent) AS total_vat
FROM sales 
GROUP BY customer_type 
ORDER BY total_vat DESC 

-- Unique customer types
SELECT COUNT(DISTINCT customer_type) FROM sales;

-- Unique payment methods
SELECT COUNT(DISTINCT payment) FROM sales;

-- Most common customer type
SELECT customer_type, COUNT(*) AS count
FROM sales 
GROUP BY customer_type 
ORDER BY count DESC 

-- Customer type with highest number of purchases
SELECT customer_type, COUNT(*) AS purchase_count
FROM sales 
GROUP BY customer_type 
ORDER BY purchase_count DESC 

-- Gender distribution
SELECT gender, COUNT(*) AS count
FROM sales 
GROUP BY gender 
ORDER BY count DESC;

-- Gender distribution per branch
SELECT branch, gender, COUNT(*) AS count
FROM sales 
GROUP BY branch, gender 
ORDER BY branch;

-- Time of day with highest average rating
SELECT time_of_day, AVG(rating) AS avg_rating
FROM sales 
GROUP BY time_of_day 
ORDER BY avg_rating DESC 

-- Highest average rating by branch and time_of_day
SELECT branch, time_of_day, AVG(rating) AS avg_rating
FROM sales 
GROUP BY branch, time_of_day 
ORDER BY avg_rating DESC;

-- Day with highest average rating
SELECT day_name, AVG(rating) AS avg_rating
FROM sales 
GROUP BY day_name 
ORDER BY avg_rating DESC 

-- Day with highest average rating per branch
SELECT branch, day_name, AVG(rating) AS avg_rating
FROM sales 
GROUP BY branch, day_name 
ORDER BY avg_rating DESC;

