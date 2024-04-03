-- -- -- OBJECTIVE 1 -- -- --
-- -- EXPLORE THE menu_items TABLE TO GET AN IDEA OF WHAT'S ON THE NEW MENU -- --

-- 1. View the menu_items table.
SELECT * FROM menu_items;

-- 2. Find the number of items on the menu.
SELECT COUNT(*) AS "Number of Menu Items" FROM menu_items;

-- 3. How many types of cuisine are served? Also, how many items are there within each cuisine?
SELECT category AS Cuisine, COUNT(item_name) AS "Total Number of Items"
FROM menu_items
GROUP BY category
ORDER BY COUNT(item_name) DESC;

-- 4. What are the least and most expensive items on the menu? 
-- LEAST EXPENSIVE ITEMS --
SELECT item_name AS "Item Name", price AS Price, category AS Cuisine
FROM menu_items
ORDER BY price ASC
LIMIT 1;
-- MOST EXPENSIVE ITEMS --
SELECT item_name AS "Item Name", price AS Price, category AS Cuisine
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- 5. What are the least and most expensive cuisine on the menu according to average price per cuisine? 
SELECT category AS Cuisine, ROUND(AVG(price),2) AS "Average Item Price", COUNT(item_name) AS "Total Number of Items"
FROM menu_items
GROUP BY category
ORDER BY AVG(price) DESC;

-- 6. What are the least and most expensive items on the menu cuisine-wise? 
-- ITALIAN CUISINE --
SELECT item_name AS "Item Name", price AS Price, category AS Cuisine
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;
-- ASIAN CUISINE --
SELECT item_name AS "Item Name", price AS Price, category AS Cuisine
FROM menu_items
WHERE category = 'Asian'
ORDER BY price DESC;
-- MEXICAN CUISINE --
SELECT item_name AS "Item Name", price AS Price, category AS Cuisine
FROM menu_items
WHERE category = 'Mexican'
ORDER BY price DESC;
-- AMERICAN CUISINE --
SELECT item_name AS "Item Name", price AS Price, category AS Cuisine
FROM menu_items
WHERE category = 'American'
ORDER BY price DESC;


-- -- -- OBJECTIVE 2 -- -- --
-- -- EXPLORE THE order_details TABLE TO GET AN IDEA OF THE DATA THAT HAS BEEN COLLECTED -- --

-- 1. View the order_details table. 
SELECT * FROM order_details;

-- 2. Find total number of orders
SELECT COUNT(DISTINCT order_id) AS "Total Orders" 
FROM order_details; 

-- 3. What is the date range of the table?
SELECT MIN(order_date) AS "First Order Date", MAX(order_date) AS "Last Order Date" 
FROM order_details; 

-- 4. How many orders were made within this data range? 
SELECT COUNT(DISTINCT order_id) "Number of Orders between 01-01-23 & 31-03-23" 
FROM order_details  
WHERE order_date BETWEEN "2023-01-01" AND "2023-03-31";

-- 5. How many items were ordered within this data range?
SELECT COUNT(order_details_id) "Number of Items Ordered between 01-01-23 & 31-03-23" 
FROM order_details  
WHERE order_date BETWEEN "2023-01-01" AND "2023-03-31";

-- 6. Which orders had the most number of items?
SELECT order_id AS "Order ID", COUNT(item_id) AS "Number of Items Ordered"
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC
LIMIT 10;

-- 7. What are average number of items ordered per order?
SELECT AVG(Item_Count) AS "Average Number of Items Ordered" FROM 
(
SELECT order_id AS Order_ID, COUNT(item_id) AS Item_Count
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id)
) AS ItemCount;

-- 8. Find Restaurant Opening and Closing Time.
SELECT order_time
FROM order_details
ORDER BY order_time ASC
LIMIT 10;
-- It can be assumed that the restaurant may open from 10:30 am --
SELECT order_time
FROM order_details
ORDER BY order_time DESC
LIMIT 10;
-- It can be assumed that the restaurant may close around 11:30 pm --

-- 9. Divide the Restaurant opening duration into 5 Sections - Brunch, Lunch, Snack Time, Happy Hour, Dinner. 
-- Store this data in a new column in the order_details table.
SELECT order_id AS "Order Id", order_time AS "Time of Order", (
	CASE 
		WHEN `order_time` BETWEEN "10:30:00" AND "11:59:59" THEN "Brunch"
		WHEN `order_time` BETWEEN "12:00:00" AND "14:59:59" THEN "Lunch"
        WHEN `order_time` BETWEEN "15:00:00" AND "16:59:59" THEN "Snack Time"
        WHEN `order_time` BETWEEN "17:00:00" AND "19:59:59" THEN "Happy Hour"
		ELSE "Dinner" 
	END
) AS "Order Time Section"
FROM order_Details
GROUP BY order_id, order_time
ORDER BY order_id;

ALTER TABLE order_details ADD COLUMN order_section VARCHAR(10);
UPDATE order_details
SET order_section = (
	CASE 
		WHEN `order_time` BETWEEN "10:30:00" AND "11:59:59" THEN "Brunch"
		WHEN `order_time` BETWEEN "12:00:00" AND "14:59:59" THEN "Lunch"
        WHEN `order_time` BETWEEN "15:00:00" AND "16:59:59" THEN "Snack Time"
        WHEN `order_time` BETWEEN "17:00:00" AND "19:59:59" THEN "Happy Hour"
		ELSE "Dinner" 
	END
);

-- 10. Find total number of orders within each order section.
SELECT order_section AS "Order Time Section", COUNT(DISTINCT order_id) AS "Total Number of Orders"
FROM order_details
GROUP BY order_section
ORDER BY COUNT(DISTINCT order_id);

-- 11. Find Time Sections with Least and Most Number of Orders made.
-- TIME SECTION WITH LEAST ORDERS --
SELECT order_section AS "Order Time Section", COUNT(DISTINCT order_id) AS "Total Number of Orders"
FROM order_details
GROUP BY order_section
ORDER BY COUNT(DISTINCT order_id) ASC
LIMIT 1;
-- TIME SECTION WITH MOST ORDERS --
SELECT order_section AS "Order Time Section", COUNT(DISTINCT order_id) AS "Total Number of Orders"
FROM order_details
GROUP BY order_section
ORDER BY COUNT(DISTINCT order_id) DESC
LIMIT 1;

-- 12. Find monthwise distribution of total number of orders.
ALTER TABLE order_details ADD COLUMN order_month VARCHAR(10);
UPDATE order_details SET order_month = MONTHNAME(order_date);
SELECT order_month AS "Month Name", COUNT(order_id) AS "Total Number of Orders"
FROM order_details
GROUP BY order_month
ORDER BY COUNT(order_id) DESC;


-- -- -- OBJECTIVE 3 -- -- --
-- -- USE BOTH THE TABLES TO UNDERSTAND HOW CUSTOMERS ARE REACTING TO THE NEW MENU -- --

-- 1. View the menu_items and order_details tables together.
SELECT * FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id;

-- 2. How many times each item was ordered? Also, find Item wise Sales
SELECT menu_item_id AS "Item ID", item_name AS "Name of Item", category AS Cuisine, price AS Price, COUNT(item_id) AS "Number of Times Ordered", price * COUNT(item_id) AS "Total Sales"
FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY menu_item_id, item_name
ORDER BY menu_item_id;

-- 3. Find Total Sales.
SELECT SUM(Item_Sales) AS "Total Sales" FROM
(
SELECT menu_item_id, item_name, price AS Price, COUNT(item_id), price * COUNT(item_id) AS Item_Sales
FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY menu_item_id, item_name
) AS ItemSales;

-- 4. Find Month wise Total Sales.
SELECT order_month AS "Month of Order", SUM(Item_Sales) AS "Total Sales" FROM
(
SELECT menu_item_id, item_name, order_month, price AS Price, COUNT(item_id), price * COUNT(item_id) AS Item_Sales
FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY menu_item_id, item_name, order_month
) AS ItemSales
GROUP BY order_month
ORDER BY SUM(Item_Sales) DESC;

-- 5. Find Time Section wise Total Sales.
SELECT order_section AS "Order Time Section", SUM(Item_Sales) AS "Total Sales" FROM
(
SELECT menu_item_id, item_name, order_section, price AS Price, COUNT(item_id), price * COUNT(item_id) AS Item_Sales
FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY menu_item_id, item_name, order_section
) AS ItemSales
GROUP BY order_section
ORDER BY SUM(Item_Sales) DESC;

-- 6. Find the Top 5 least and most ordered/sold Items on the menu with their cuisines.
-- TOP 5 LEAST SOLD ITEMS ON THE MENU --
SELECT menu_item_id AS "Item ID", item_name AS "Name of Item", category AS Cuisine, price AS Price, COUNT(item_id) AS "Number of Times Ordered", price * COUNT(item_id) AS "Total Sales"
FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY menu_item_id, item_name
ORDER BY COUNT(item_id) ASC
LIMIT 5;
-- TOP 5 MOST SOLD ITEMS ON THE MENU --
SELECT menu_item_id AS "Item ID", item_name AS "Name of Item", category AS Cuisine, price AS Price, COUNT(item_id) AS "Number of Times Ordered", price * COUNT(item_id) AS "Total Sales"
FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY menu_item_id, item_name
ORDER BY COUNT(item_id) DESC
LIMIT 5;

-- 7. Find Cuisine wise Total Sales.
SELECT category AS Cuisine, SUM(Item_Sales) AS "Total Sales" FROM
(
SELECT menu_item_id, item_name, category, price AS Price, COUNT(item_id), price * COUNT(item_id) AS Item_Sales
FROM order_details od JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY menu_item_id, item_name, category
) AS ItemSales
GROUP BY category
ORDER BY SUM(Item_Sales) DESC;

-- 8. What were the top 10 orders that spent the most money?
SELECT order_id AS "Order ID", COUNT(item_id) AS "Number of Items Ordered", SUM(price) AS "Total Amount Spent"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY SUM(price) DESC
LIMIT 10; 
-- Checking if Total Amount Spent is calculated Correctly --
SELECT order_id AS "Order ID", SUM(price) AS "Total Amount Spent" 
FROM (
SELECT order_id, item_name, price AS Price
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
) AS OrderSummary;

-- 9. View the details of the first three highest spend orders.
-- FIRST HIGHEST PAID ORDER --
SELECT order_id AS "Order ID", item_id AS "Item ID", item_name AS "Name of Item", category AS Cuisine, COUNT(item_id) AS Quantity, order_date AS "Date of Order", order_time AS "Time of Order", order_section AS "	Order Time Section", price AS "Item Price", price * COUNT(item_id) AS "Item Total"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY order_id, item_id, item_name, category, price, order_date, order_time, order_section
ORDER BY COUNT(item_id) DESC;
-- SECOND HIGHEST PAID ORDER --
SELECT order_id AS "Order ID", item_id AS "Item ID", item_name AS "Name of Item", category AS Cuisine, COUNT(item_id) AS Quantity, order_date AS "Date of Order", order_time AS "Time of Order", order_section AS "	Order Time Section", price AS "Item Price", price * COUNT(item_id) AS "Item Total"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
WHERE order_id = 2075
GROUP BY order_id, item_id, item_name, category, price, order_date, order_time, order_section
ORDER BY COUNT(item_id) DESC;
-- THIRD HIGHEST PAID ORDER --
SELECT order_id AS "Order ID", item_id AS "Item ID", item_name AS "Name of Item", category AS Cuisine, COUNT(item_id) AS Quantity, order_date AS "Date of Order", order_time AS "Time of Order", order_section AS "	Order Time Section", price AS "Item Price", price * COUNT(item_id) AS "Item Total"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
WHERE order_id = 1957
GROUP BY order_id, item_id, item_name, category, price, order_date, order_time, order_section
ORDER BY COUNT(item_id) DESC;

-- 10. How much money the middle 100 orders spent?
SELECT order_id AS "Order ID", COUNT(item_id) AS "Number of Items Ordered", order_month AS "Month of Order", order_time AS "Time of Order", order_section AS "Order Time Section", SUM(price) AS "Total Amount Spent"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
GROUP BY order_id, order_month, order_time, order_section
ORDER BY SUM(price) DESC
LIMIT 100 OFFSET 2635; 

-- 11. What were the top 10 orders that spent the least money?
SELECT order_id AS "Order ID", COUNT(item_id) AS "Number of Items Ordered", SUM(price) AS "Total Amount Spent"
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY SUM(price) ASC
LIMIT 10; 

-- 12. What is the average amount earned from an order?
SELECT ROUND(AVG(OrderAmt),2) AS "Average Sales" FROM
(
SELECT order_id, COUNT(item_id), SUM(price) AS OrderAmt
FROM order_details od JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
GROUP BY order_id
) AS OrderSales;