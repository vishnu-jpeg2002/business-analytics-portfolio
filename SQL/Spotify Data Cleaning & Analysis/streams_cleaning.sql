select *
from streams;

select count(*), count(distinct stream_id)
from streams;

with cte as
(select *, row_number() over(partition by song_id, user_id, stream_date) as row_num
from streams)
select count(*)
from cte
where row_num > 1;

SELECT * FROM streams WHERE stream_duration_seconds REGEXP '[^0-9]';

UPDATE streams
SET stream_duration_seconds = CASE
    WHEN stream_id = 'ST003' THEN '200'
    WHEN stream_id = 'ST203' THEN '354'
END
WHERE stream_duration_seconds REGEXP '[^0-9]';

SELECT * FROM streams WHERE stream_duration_seconds REGEXP '[^0-9]';

select *
from streams;

alter table streams
modify column stream_duration_seconds int;

alter table streams
modify column stream_date date;

SELECT DISTINCT device, country, subscription_type, completed
FROM streams;

select *
from streams;