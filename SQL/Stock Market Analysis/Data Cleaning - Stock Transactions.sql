# Data Cleaning - stock_transactions

select *
from stock_transactions;

with cte
as (select distinct ticker
from stock_transactions
order by 1)
select count(*)
from cte;

UPDATE stock_transactions
SET trade_date = STR_TO_DATE(trade_date, '%Y-%m-%d')
WHERE trade_date LIKE '____-__-__';

UPDATE stock_transactions
SET trade_date = STR_TO_DATE(trade_date, '%m/%d/%Y')
WHERE trade_date LIKE '__/__/____';

UPDATE stock_transactions
SET trade_date = STR_TO_DATE(trade_date, '%d-%m-%Y')
WHERE trade_date LIKE '__-__-____';

UPDATE stock_transactions
SET trade_date = STR_TO_DATE(trade_date, '%m-%d-%Y')
WHERE trade_date LIKE '__-__-____';

UPDATE stock_transactions
SET trade_date = CASE
    WHEN CAST(SUBSTRING(trade_date, 1, 2) AS UNSIGNED) > 12
        THEN STR_TO_DATE(trade_date, '%d-%m-%Y')
    ELSE
        STR_TO_DATE(trade_date, '%m-%d-%Y')
    END
WHERE trade_date LIKE '__-__-____';

SELECT DISTINCT trade_date
FROM stock_transactions
WHERE STR_TO_DATE(trade_date, '%Y-%m-%d') IS NULL
AND STR_TO_DATE(trade_date, '%m/%d/%Y') IS NULL
AND STR_TO_DATE(trade_date, '%d-%m-%Y') IS NULL;

SELECT DISTINCT trade_date
FROM stock_transactions
WHERE trade_date LIKE '__-__-____';

UPDATE stock_transactions
SET trade_date = STR_TO_DATE(trade_date, '%m/%d/%Y')
WHERE trade_date LIKE '__/__/____';

SELECT DISTINCT trade_date
FROM stock_transactions
WHERE trade_date NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

ALTER TABLE stock_transactions
MODIFY COLUMN trade_date DATE;

select *
from stock_transactions;

update stock_transactions
set transaction_type = 'SELL'
where transaction_type like 'S%' or transaction_type LIKE 's%';

update stock_transactions
set transaction_type = 'BUY'
where transaction_type like 'B%' or transaction_type LIKE 'b%';

select *
from stock_transactions;

delete
from stock_transactions
where quantity is NULL;

update stock_transactions
set quantity = replace(quantity, ' shares', '');

alter table stock_transactions
modify column quantity int;

update stock_transactions
set price_per_share = total_amount / quantity
where price_per_share is null;

update stock_transactions
set price_per_share = replace(price_per_share, '$','');

alter table stock_transactions
modify column price_per_share decimal(10,2);

select *
from stock_transactions;

SELECT COUNT(*)
FROM stock_transactions
WHERE total_amount IS NULL;

update stock_transactions
set broker_name = trim(broker_name);

UPDATE stock_transactions
SET broker_name = CONCAT(UPPER(SUBSTRING(broker_name, 1, 1)), 
                         LOWER(SUBSTRING(broker_name, 2)));
                         
delete
from stock_transactions
where status is NULL;

update stock_transactions
set status = 'FAILED'
where `status` like 'F%' or `status` like 'f%';

update stock_transactions
set status = 'COMPLETED'
where `status` like 'C%' or `status` like 'c%';

update stock_transactions
set status = 'PENDING'
where `status` like 'P%' or `status` like 'p%';

SELECT DISTINCT trader_id
FROM stock_transactions
ORDER BY trader_id;