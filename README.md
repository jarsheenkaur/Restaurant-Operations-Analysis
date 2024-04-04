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

-

