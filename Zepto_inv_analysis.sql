-- =========================
-- DATA EXPLORATION
-- =========================

-- Count of rows
SELECT COUNT(*) FROM zepto;

-- Sample data
SELECT * FROM zepto
LIMIT 10;

-- Null values
SELECT * FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;

-- Different product categories
SELECT DISTINCT Category
FROM zepto
ORDER BY Category;

-- Products in stock vs out of stock
SELECT outOfStock, COUNT(Category) AS total_products
FROM zepto
GROUP BY outOfStock;

-- Product names present multiple times
SELECT name, COUNT(Category) AS Number_of_Categories
FROM zepto
GROUP BY name
HAVING COUNT(Category) > 1
ORDER BY COUNT(Category) DESC;

-- =========================
-- DATA CLEANING
-- =========================

-- Products with price = 0
SET SQL_SAFE_UPDATES = 0;
SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;

-- Delete products with MRP = 0
DELETE FROM zepto
WHERE mrp = 0;

-- Convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100,
    discountedSellingPrice = discountedSellingPrice / 100;
    
SET SQL_SAFE_UPDATES = 1;

SELECT mrp, discountedSellingPrice
FROM zepto;

-- =========================
-- DATA ANALYSIS
-- =========================

-- Q1. Top 10 best-value products based on discount percentage
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. Products with high MRP but out of stock
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;

-- Q3. Estimated revenue for each category
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4. Products where MRP > 500 and discount < 10%
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Top 5 categories with highest average discount
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Price per gram for products above 100g
SELECT DISTINCT name,
       weightInGms,
       discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7. Group products into Low, Medium, Bulk
SELECT DISTINCT name,
       weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto;

-- Q8. Total inventory weight per category
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;