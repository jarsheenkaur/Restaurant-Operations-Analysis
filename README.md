# Restaurant Operations Analysis

This data analysis project for Taste of the World Cafe aims to assess the performance of the new menu. By exploring menu items and order details through MySQL queries, the analysis focuses on identifying popular dishes, customer preferences, and trends. To enhance insights, used various Python libraries to create compelling visual representations of the data. The final deliverable will include actionable insights to optimize the menu and enhance overall customer satisfaction.

## Project Aim

The Taste of the World Cafe, a restaurant that has diverse menu offerings and serves generous portions, debuted a new menu at the start of the year. The aim of this project is to dig into the customer data to see which menu items are doing well/not well and what the top customers seem to like the best.

## About Data

The dataset was obtained from Maven Analytics (https://mavenanalytics.io/data-playground?page=2&pageSize=10). The dataset consists of a quarter's worth of orders from a fictitious restaurant serving international cuisine, including the date and time of each order, the items ordered, and additional details on the type, name and price of the items. There are two tables in this dataset - menu_items and order_details. 

Table menu_items contains 4 columns and 32 rows.
| Column              | Description                                         | Data Type      |
| :-------------------| :---------------------------------------------------| :------------- |
| menu_item_id        | Unique ID of a menu item                            | SMALLINT       |
| item_name           | Name of a menu item                                 | VARCHAR(45)    |
| category            | Type of cuisine of the menu item                    | VARCHAR(45)    |
| price               | Price of the menu item (US Dollars $)               | DECIMAL(5,2)   |

Table order_details contains 5 columns and 12234 rows.
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
- Asian cuisine was the most ordered and Italian cuisine had the highest sales.
- Top 3 Items according to Number of Orders --> Hamburger, Edamame and Korean Beef Bowl.
- Top 3 Items according to Sales Price Earned --> Korean Beef Bowl, Spaghetti & Meatballs and Tofu Pad Thai.
- Bottom 3 Items according to Number of Orders --> Cheese Lasagna, Potstickers and Chicken Tacos.
- Bottom 3 Items according to Sales Price Earned --> Chips & Guacamole, Potstickers and Chicken Tacos.
- A whole working day at the restaurant was divided into 5 sections [Brunch, Lunch, Snack Time, Happy Hour and Dinner] by assuming 10:30 am as opening time and 11:30 pm as closing time. Brunch time section accounted for the least and Happy Hour time section accounted for the most number of orders. Lunch time section made the highest sales.
- Average sales made per order was $26.80.
- $192 were the highest amount spent on an order for 14 items and $5 were the least amount spent on an order for 1 item.
- There have been total 5343 Orders since the introduction of new menu and restaurant has made Total Sales of about $160,000. Hence, it can be said that the new restaurant menu has performed well for the first quarter. If there is a need to eliminate some items from the menu then Potstickers and Chicken Tacos can be removed as they have lowest number of orders as well as lowest amount of sales.

## Data Visualization using Python

![1](https://github.com/user-attachments/assets/d43be6be-94fe-4161-a014-76a477acf358)

![2](https://github.com/user-attachments/assets/d2fd1134-0e81-4c44-9bef-485416c1abad)

![3](https://github.com/user-attachments/assets/8f882d4f-e29a-4b88-8d20-7b75f6f3ca97)

![4](https://github.com/user-attachments/assets/d4be4d3e-f9b7-42b7-b5bb-e77e7f293de2)

![5](https://github.com/user-attachments/assets/e8661aa6-dc72-471a-9255-f44d25b15954)

![6](https://github.com/user-attachments/assets/fa11d25a-bac4-45ee-8c6e-0f569fcab805)

![7](https://github.com/user-attachments/assets/d69d2b0b-40a2-4e5d-b9e4-c4d75ec4ae94)

![8](https://github.com/user-attachments/assets/1901c5a0-0d3a-42ba-bfda-bcc863139375)

![9](https://github.com/user-attachments/assets/ac3e5c6e-ff31-4036-8638-7372e05c7de3)

![10](https://github.com/user-attachments/assets/c66e5e15-dc63-4f9a-838d-02449152a4c4)

![11](https://github.com/user-attachments/assets/942e88d1-f1d8-4642-8a3e-f71c72383acd)

![12](https://github.com/user-attachments/assets/02388c7b-7bbc-4bf3-a472-decae75f7f55)

![13](https://github.com/user-attachments/assets/22389403-9cea-4329-ba4f-d92071b76101)

![14](https://github.com/user-attachments/assets/20744b9b-cc69-49fb-8755-f2a665acce01)

![15](https://github.com/user-attachments/assets/278a4452-9f91-454f-993f-d6618d448cc6)

![16](https://github.com/user-attachments/assets/543dff05-f398-4b72-8f4e-5c21d149fbe2)

![17](https://github.com/user-attachments/assets/e8889256-8eba-426c-baac-6ad832371b24)

![18](https://github.com/user-attachments/assets/781276da-7331-4b9d-ba88-d71ab8cfd77b)

![19](https://github.com/user-attachments/assets/7ffef7bf-4617-49ba-bffe-053d9f7e05c0)

![20](https://github.com/user-attachments/assets/6445489d-adb0-4fae-9abf-96aeae4899c3)

![21](https://github.com/user-attachments/assets/7e117881-9d45-43e6-97b0-36b359e33f50)
