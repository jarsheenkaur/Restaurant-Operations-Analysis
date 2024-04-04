-- -- CHECKING menu_items and order_details TABLES FOR NULL VALUES (EXCLUDED COLUMNS WITH NOT NULL ATTRIBUTE) -- --

SELECT * FROM menu_items WHERE item_name IS NULL; 
SELECT * FROM menu_items WHERE category IS NULL; 
SELECT * FROM menu_items WHERE price IS NULL; 
-- There are no NULL values in the Menu Table --

SELECT * FROM order_details WHERE order_date IS NULL;
SELECT * FROM order_details WHERE order_time IS NULL;
SELECT * FROM order_details WHERE item_id IS NULL;
-- There are 137 NULL values in the item_id column of order_details Table. Other columns don't have any NULL values --

-- Deleting rows with NULL values because orders with no items are not required --
DELETE FROM order_details WHERE item_id IS NULL;
-- From 12234 rows, 137 rows with NULL values were deleted. Now, total rows in order_details table is 12097 --