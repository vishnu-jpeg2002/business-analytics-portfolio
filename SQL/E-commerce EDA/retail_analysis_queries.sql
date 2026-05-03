# Question 1: Find the total number of orders placed by each customer. Show customer name and their order count, ordered by order count descending.

select customer_name, count(order_id) as order_count
from customers
join orders
	on customers.customer_id = orders.customer_id
group by customer_name
order by 2 desc;

# Question 2: Find all customers who have never placed an order. Show their customer name and city.

select customer_name, city
from customers
where customer_id not in (select customer_id
						  from orders);
                          
# Question 3: Find the top 5 most selling products by total quantity sold. Show product name and total quantity.

select product_name, sum(quantity)
from products
join order_items
	on products.product_id = order_items.product_id
group by product_name
order by 2 desc
limit 5;

# Question 4: Find the total revenue generated per category. Show category and total revenue, ordered by revenue descending.

select category, round(sum(quantity * unit_price),2) as revenue
from products
join order_items
	on products.product_id = order_items.product_id
group by category
order by 2 desc;

# Question 5: Find the monthly revenue for the year 2022. Show month and total revenue ordered by month.

with cte as
(select substr(order_date,1,7) as month_2022, round(sum(quantity * unit_price),2) as revenue
from orders
join order_items
	on orders.order_id = order_items.order_id
group by substr(order_date,1,7))
select *
from cte
where month_2022 like '2022%'
order by 1;

# Question 6: Find customers who have placed more than 10 orders. Show customer name and order count.

select customer_name, count(order_id)
from customers
join orders
	on customers.customer_id = orders.customer_id
group by customer_name
having count(order_id) > 10
order by 2 desc;

# Question 7: Find the most expensive product in each category. Show category, product name and price.

with cte as
(select category, product_name, price, rank() over(partition by category order by price desc) as rankky
from products),
cte2 as
(select *
from cte
where rankky = 1)
select category, product_name, price
from cte2;

# Question 8: Find the average order value per city. Show city and average order value rounded to 2 decimal places, ordered by average order value descending.

select city, avg(total_amount)
from customers
join orders
	on customers.customer_id = orders.customer_id
group by city
order by 2 desc;

# Question 9: Find the running total of revenue month by month for the entire dataset. Show month, monthly revenue and running total.

with cte as
(select substr(order_date,1,7) as year_monthy, sum(quantity * unit_price) as revenue
from orders
join order_items
	on orders.order_id = order_items.order_id
group by substr(order_date,1,7))
select *, sum(revenue) over(order by year_monthy)
from cte;

# Question 10: Find the top 3 customers by revenue generated in each city. Show city, customer name and total revenue.

with cte as
(select city, customer_name, sum(quantity * unit_price) as revenue
from customers
join orders
	on customers.customer_id = orders.customer_id
join order_items
	on order_items.order_id = orders.order_id
group by city, customer_name),
cte2 as
(select *, rank() over(partition by city order by revenue desc) as rankky
from cte),
cte3 as
(select *
from cte2
where rankky < 4)
select city, customer_name, revenue
from cte3;

# Question 11: Find all orders where the status is Cancelled and the total amount is greater than 10000. Show order id, customer name, total amount and order date.

select order_id, customer_name, total_amount, order_date
from customers
join orders
	on customers.customer_id = orders.customer_id
where `status` = 'Cancelled' and total_amount > 10000;

# Question 12: Find the percentage contribution of each category to the total revenue. Show category, total revenue and percentage rounded to 2 decimal places.

SELECT category, 
       SUM(quantity * unit_price) AS revenue,
       ROUND((SUM(quantity * unit_price) / (SELECT SUM(quantity * unit_price) FROM order_items)) * 100, 2) AS percentage
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY category;