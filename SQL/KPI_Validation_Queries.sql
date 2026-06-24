                                          -- ==========================================
-- KPI VALIDATION QUERIES
-- SliceHub Sales Intelligence Dashboard
-- ==========================================


 -- 1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
 
--2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

--3. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

--4. Online Sales %
SELECT
    SUM(CASE
            WHEN order_channel = 'Online'
            THEN total_price
            ELSE 0
        END) * 100.0 /
    SUM(total_price) AS Online_Sales_Percentage
FROM pizza_sales;

--5. Revenue by Branch
SELECT
    branch,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY branch
ORDER BY Revenue DESC;

--6. Highest Revenue Product
SELECT TOP 1
    product_name,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY product_name
ORDER BY Revenue DESC;

--7. Highest Selling Product
SELECT TOP 1
    product_name,
    SUM(quantity) AS Quantity_Sold
FROM pizza_sales
GROUP BY product_name
ORDER BY Quantity_Sold DESC;

--8. Peak Sales Day
SELECT TOP 1
    DATENAME(WEEKDAY, order_date) AS Day_Name,
    COUNT(DISTINCT order_id) AS Orders_Count
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY Orders_Count DESC;

--9. Peak Sales Month

SELECT TOP 1
    DATENAME(MONTH, order_date) AS Month_Name,
    COUNT(DISTINCT order_id) AS Orders_Count
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Orders_Count DESC;

--10. Top 5 Products by Revenue

SELECT TOP 5
    product_name,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY product_name
ORDER BY Revenue DESC;
