select *
from stock_prices;

select *
from stock_transactions;

select ticker, sum(volume)
from stock_prices
group by ticker;

select company_name, avg(close_price)
from stock_prices
group by company_name;

select broker_name, sum(total_amount)
from stock_transactions
group by broker_name;

select substring(trade_date, 6,7) as monthy, sum(total_amount)
from stock_transactions
group by substring(trade_date, 6,7);

select month(trade_date) as monthy, sum(total_amount)
from stock_transactions
group by month(trade_date)
order by 1;

select ticker, sum(quantity)
from stock_transactions
group by ticker
order by 2 desc
limit 5;

select*
from stock_prices;

select company_name, avg(close_price) over(partition by company_name order by trade_date)
from stock_prices;

select *
from stock_transactions;

with cte as
(select ticker, year(trade_date) as yearr, sum(total_amount) as totally
from stock_transactions
group by ticker, year(trade_date))
select *, rank() over(partition by yearr order by totally desc)
from cte;

select *
from stock_prices;

select company_name, max((close_price - open_price)) as diff
from stock_prices
group by company_name;

select *
from stock_transactions;

select ticker, transaction_type, sum(total_amount)
from stock_transactions
group by ticker, transaction_type
order by 1;