select *
from customers;

update customers
set join_date = str_to_date(`join_date`, '%Y-%m-%d');

ALTER TABLE customers
MODIFY COLUMN join_date DATE;

select *
from sales;

update sales
set sale_date = str_to_date(`sale_date`, '%Y-%m-%d');

ALTER TABLE sales
MODIFY COLUMN sale_date DATE;

SELECT DISTINCT order_status FROM sales;
SELECT DISTINCT payment_mode FROM sales;
SELECT DISTINCT segment FROM customers;

#EDA
# 1. What is the total revenue by each region, only for delivered orders? (highest to lowest)
select region_name, round(sum(total_amount),2) as revenue
from regions
join sales
	on regions.region_id = sales.region_id
where order_status = 'Delivered'
group by region_name
order by 2 desc;

# 2. What is the top 10 products by revenue, only for delivered orders?
select product_name, round(sum(total_amount),2) as revenue
from products
join sales
	on products.product_id = sales.product_id
where order_status = 'Delivered'
group by product_name
order by 2 desc
limit 10;

# 3. What is the total revenue by each month, only for delivered orders? Tell the highest and lowest month.
select month(sale_date), round(sum(total_amount),2) as revenue
from sales
where order_status = 'Delivered'
group by month(sale_date)
order by 2 desc;

# 4. What is the total orders and total revenue by each customer segment, only for delivered orders?
select segment, count(sale_id) as total_orders, round(sum(total_amount),2) as revenue
from customers
join sales
	on customers.customer_id = sales.customer_id
where order_status = 'Delivered'
group by segment;

# 5. Who are the top 5 sales reps by total revenue, only for delivered orders?
select rep_name, round(sum(total_amount),2) as revenue
from sales_reps
join sales
	on sales_reps.rep_id = sales.rep_id
where order_status = 'Delivered'
group by rep_name
order by 2 desc
limit 5;

# 6.  What is the total revenue by each category, only for delivered orders?
select category, round(sum(total_amount),2) as revenue
from products
join sales
	on products.product_id = sales.product_id
where order_status = 'Delivered'
group by category
order by 2 desc;

# 7. What is the revenue by category and region combined, only for delivered orders? Give me just the top 5 combinations.
select region_name, category, round(sum(total_amount),2) as revenue
from products
join sales
	 on products.product_id = sales. product_id
join regions
	on regions.region_id = sales.region_id
where order_status = 'Delivered'
group by region_name, category
order by 3 desc;
