# Objective 1 - Restaurant Operation Analysis
-- 1. View the menu items from the table
select *
from menu_items;

-- 2. Find the number of items on the menu
select count(menu_item_id)
from menu_items;

-- 3. what are the least and the most expensive items of the menu?
select *
from menu_items
order by price;

select *
from menu_items
order by price desc;

-- 4.How many italian dishes in the meny?
select count(*)
from menu_items
where category = 'Italian';

select *
from menu_items
where category = 'Italian'
order by price;

-- 5. How many dishes are in each category?
select category, count(category)
from menu_items
group by category;

-- 6. What is the average dish price within each category?
select category, avg(price)
from menu_items
group by category;

# Objective 2
-- 1. View the order details table
select *
from order_details;

-- 2. what is the date range of the table
select min(order_date), max(order_date)
from order_details;

-- 3. How many orders are made within this date range
select count(distinct order_id)
from order_details;

-- 4. How many items are ordered within this date range?
select count(*)
from order_details;

-- 5. Which order has the most number of items?
select order_id, count(item_id)
from order_details
group by order_id
order by 2 desc;

-- 6. How many orders have more than 12 items?
select order_id, count(item_id)
from order_details
group by order_id
having count(item_id) > 12
order by 2 desc;

with cte as
(select order_id, count(item_id)
from order_details
group by order_id
having count(item_id) > 12
order by 2 desc)
select count(*)
from cte;

# Objective 3 - Analyse customer behaviour

-- 1. combine the menu_items and order_details tables into a single table 
-- 2. what are the least and most ordered items? what categories were they in?
select *
from menu_items;

select *
from order_details;

select item_name, count(order_details_id)
from order_details as od
left join menu_items as mi
	on od.item_id = mi.menu_item_id;
group by item_name
order by 2;

select item_name, category, count(order_details_id)
from order_details as od
left join menu_items as mi
	on od.item_id = mi.menu_item_id
where item_name is not null
group by item_name, category
order by 3;

-- 3. what were the top 5 orders that spend the most money
select order_id, sum(price) as total_spend
from order_details as od
left join menu_items as mi
	on od.item_id = mi.menu_item_id
group by order_id
order by 2 desc
Limit 5;

-- 4. View the details of the highest spend order. What insights can you gather from it
select category, count(item_id) as num_items
from order_details as od
left join menu_items as mi
	on od.item_id = mi.menu_item_id
where order_id = 440
group by category;

-- 5. what are the details of the top 5 spend order? what insights can you gather from the data?
select order_id, category, count(item_id) as num_items
from order_details as od
left join menu_items as mi
	on od.item_id = mi.menu_item_id
where order_id in (440, 2075, 1957, 330, 2675)
group by order_id, category;


    


    


