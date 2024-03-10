-- -- -- OBJECTIVE 1 -- -- --
-- -- EXPLORE THE menu_items TABLE TO GET AN IDEA OF WHAT'S ON THE NEW MENU -- --

-- 1. View the menu_items table.
SELECT * FROM menu_items;

-- 2. Find the number of items on the menu.
SELECT COUNT(*) AS "Number of Menu Items" FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
-- LEAST EXPENSIVE ITEMS --
SELECT item_name AS "Item Name", price AS Price
FROM menu_items
ORDER BY price ASC
LIMIT 1;
-- MOST EXPENSIVE ITEMS --
SELECT item_name AS "Item Name", price AS Price
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*) AS "Number of Italian Dishes on Menu" FROM menu_items WHERE category = "Italian";

-- 5. What are the least and most expensive Italian dishes on the menu?
-- LEAST EXPENSIVE ITALIAN DISHES --
SELECT item_name AS "Item Name", category AS Category, price AS Price
FROM menu_items
WHERE category = "Italian"
ORDER BY price ASC
LIMIT 1;
-- MOST EXPENSIVE ITALIAN DISHES --
SELECT item_name AS "Item Name", category AS Category, price AS Price
FROM menu_items
WHERE category = "Italian"
ORDER BY price DESC
LIMIT 1;

-- 6. How many dishes are there in each category?
SELECT category AS Category, COUNT(*) AS "Number of Dishes"
FROM menu_items
GROUP BY category
ORDER BY COUNT(*) DESC;

-- 7. What is the average dish price within each category?
SELECT category AS Category, ROUND(AVG(price),2) AS "Average Price"
FROM menu_items
GROUP BY category
ORDER BY AVG(price) DESC;

-- 7. What is the average dish price within each category?
SELECT category AS Category, ROUND(AVG(price),2) AS "Average Price"
FROM menu_items
GROUP BY category
ORDER BY AVG(price) DESC;


-- -- -- OBJECTIVE 2 -- -- --
-- -- EXPLORE THE order_details TABLE TO GET AN IDEA OF THE DATA THAT HAS BEEN COLLECTED -- --

-- 1. View the order_details table. 
SELECT * FROM order_details;

-- 2. What is the date range of the table?
SELECT MIN(order_date) AS "First Order Date", MAX(order_date) AS "Last Order Date" 
FROM order_details; 

-- 3. How many orders were made within this data range? 
SELECT COUNT(DISTINCT order_id) "Number of Orders between 01-01-23 & 31-03-23" 
FROM order_details  
WHERE order_date BETWEEN "2023-01-01" AND "2023-03-31";

-- 4. How many items were ordered within this data range?
SELECT COUNT(order_details_id) "Number of Items Ordered between 01-01-23 & 31-03-23" 
FROM order_details  
WHERE order_date BETWEEN "2023-01-01" AND "2023-03-31";

-- 5. Which orders had the most number of items?
SELECT order_id AS "Order ID", COUNT(item_id) AS "Number of Items Ordered"
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC;

-- 6. How many orders had more than 12 items? 
SELECT COUNT(*) AS "Number of Orders with more than 12 Items" FROM 
(SELECT order_id AS "Order ID", COUNT(item_id) AS "Number of Items Ordered"
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12
ORDER BY COUNT(item_id) DESC
) AS ORDERCOUNT;


-- -- -- OBJECTIVE 3 -- -- --
-- -- USE BOTH THE TABLES TO UNDERSTAND HOW CUSTOMERS ARE REACTING TO THE NEW MENU -- --

-- 1. Combine the menu_items and order_details tables into a single table.
SELECT * FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered item? What categories were they in?
-- LEAST ORDERED ITEM --
SELECT item_name AS "Name of Menu Item", category AS Category, COUNT(item_id) AS "Number of Times Ordered"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY COUNT(item_id) ASC
LIMIT 1; 
-- MOST ORDERED ITEM --
SELECT item_name AS "Name of Menu Item", category AS Category, COUNT(item_id) AS "Number of Times Ordered"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY COUNT(item_id) DESC
LIMIT 1; 

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id AS "Order ID", SUM(price) AS "Total Amount Spent"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY SUM(price) DESC
LIMIT 5; 

-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT order_id AS "Order ID", item_id AS "Item ID", item_name AS "Name of Item", category AS Category, order_date AS "Date of Order", order_time AS "Time of Order",price AS "Item Price"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY order_id, item_id, item_name, category, order_date, order_time;

-- BONUS. View the details of the top 5 highest spend orders. What insights can you gather from the results?
SELECT order_id AS "Order ID", item_id AS "Item ID", item_name AS "Name of Item", category AS Category, order_date AS "Date of Order", order_time AS "Time of Order",price AS "Item Price"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, item_id, item_name, category, order_date, order_time;