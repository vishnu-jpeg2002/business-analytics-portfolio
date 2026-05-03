**RetailCart E-Commerce Database — SQL Analysis Project**

**Overview**
This project involves analyzing an e-commerce database using SQL. The goal is to answer key business questions around customer behavior, product performance, and revenue trends using structured query language.

**Database Structure**
**The database consists of four tables:**
**customers** — Contains customer details such as name, city, and the date they signed up. The table has 200 records covering customers from 15 major Indian cities.
**products** — Contains the product catalog with product name, category, and price. The table has 50 products across 8 categories including Electronics, Clothing, Footwear, Grocery, Kitchen, Personal Care, Furniture, and Stationery.
**orders** — Contains order level information including the customer who placed the order, order date, total amount, and order status. The table has 1000 orders with statuses such as Completed, Pending, Cancelled, and Returned.
**order_items** — Contains the product level breakdown of each order, including quantity and unit price at the time of purchase. The table has 1200+ records.

**What Was Done**
Twelve business questions were solved using SQL covering a range of concepts including joins, subqueries, common table expressions, window functions, and aggregate functions. The questions ranged from basic reporting to advanced analysis such as ranking customers within cities and calculating running totals.

**Key Findings**

1. Electronics contributes the highest share of total revenue due to high unit prices, even though Grocery has more frequent orders.
2. A small group of customers account for a large portion of total revenue, which is a common pattern in retail businesses.
3. Some high value orders above 10,000 were cancelled, which could indicate payment failures or customer dissatisfaction worth investigating.
4. Revenue shows a consistent growth trend across months in the dataset.
5. Average order value differs across cities, suggesting different spending patterns by region.
6. Several customers in the database have never placed an order, which presents an opportunity for re-engagement.
