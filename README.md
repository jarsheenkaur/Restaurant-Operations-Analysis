# Restaurant Operations Analysis

This data analysis project for Taste of the World Cafe aims to assess the performance of the new menu. By exploring menu items and order details through MySQL queries, the analysis focuses on identifying popular dishes, customer preferences, and trends. The final deliverable will include actionable insights to optimize the menu and enhance overall customer satisfaction.

## Project Aim

The Taste of the World Cafe, a restaurant that has diverse menu offerings and serves generous portions, debuted a new menu at the start of the year. The aim of this project is to dig into the customer data to see which menu items are doing well/not well and what the top customers seem to like the best.

## About Data

The dataset was obtained from Maven Analytics (https://mavenanalytics.io/data-playground?page=2&pageSize=10). The dataset consists of a quarter's worth of orders from a fictitious restaurant serving international cuisine, including the date and time of each order, the items ordered, and additional details on the type, name and price of the items. There are two tables in this dataset - menu_items and order_details. 

Table menu_items contains 4 columns and 32 rows:-
| Column              | Description                                         | Data Type      |
| :-------------------| :---------------------------------------------------| :------------- |
| menu_item_id        | Unique ID of a menu item                            | SMALLINT       |
| item_name           | Name of a menu item                                 | VARCHAR(45)    |
| category            | Type of cuisine of the menu item                    | VARCHAR(45)    |
| price               | Price of the menu item (US Dollars $)               | DECIMAL(5,2)   |

Table order_details contains 5 columns and 12234 rows:-
| Column              | Description                                         | Data Type      |
| :-------------------| :---------------------------------------------------| :------------- |
| order_details_id    | Unique ID of an item in an order                    | SMALLINT       |
| item_name           | ID of an order                                      | SMALLINT       |
| category            | Date an order was put in (MM/DD/YY)                 | DATE           |
| price               | Time an order was put in (HH:MM:SS AM/PM)           | TIME           |
| price               | Matches the menu_item_id in the menu_items table    | SMALLINT       |

## Objectives

1. Explore the menu_items table to get an idea of what's on the new menu.
2. Explore the order_details table to get an idea of the data that has been collected.
3. Use both the tables to understand how customers are reacting to the new menu.

## Analysis Results

- The menu consists of 32 items belonging to 4 cuisines - 9 Mexican, 9 Italian, 8 Asian and 6 American dishes. Edamame of Asian Cuisine is the least expensive and Shrimp Scampi of Italian Cuisine is the most expensive item on the menu.
- Italian is the most expensive and American is the least expensive cuisine on the menu with average item price per cuisine of $16.75 and $10.07 respectively.
- Total 12097 Items were ordered from the menu of which Chicken Tacos were ordered the least at 123 times (Still, ordered good amount of times for being at last position) and Hamburger was ordered the most at 622 times.
- March recived the highest number of orders as well as made the most Sales.
- Italian cuisine was the most ordered and had the highest sales.
- A whole working day at the restaurant was divided into 5 sections [Brunch, Lunch, Snack Time, Happy Hour and Dinner] by assuming 10:30 am as opening time and 11:30 pm as closing time. Brunch time section accounted for least and Happy Hour time section accounted for most orders. Lunch time section made the highest sales.
- There is an average sales of $26.80 per order.
- $192 were the highest amount spent on an order for 14 items and $5 were the least amount spent on an order for 1 item.
- There have been total 5343 Orders since the introduction of new menu and restaurant has made Total Sales of about $160,000. Hence, it can be said that the new restaurant menu is performing well.
