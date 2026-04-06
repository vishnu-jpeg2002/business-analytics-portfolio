# Each question is directly relevant to how Spotify's business and growth team actually thinks. 

# Question 1: Which genre generates the most streams? Show genre and total stream count, sorted descending.
select genre, count(stream_id) as total_streams
from songs_clean
join streams
	on songs_clean.song_id = streams.song_id
group by genre
order by 2 desc;

# Question 2: Who are the top 5 most streamed artists?
select artist, count(stream_id)
from songs_clean
join streams
	on songs_clean.song_id = streams.song_id
group by artist
order by 2 desc
limit 5;

# Question 3: Which country has the highest number of streams? Show country and stream count, sorted descending.
select country, count(stream_id)
from songs_clean
join streams
	on songs_clean.song_id = streams.song_id
group by country
order by 2 desc
limit 1;

# Question 4: What is the monthly stream trend in 2024? Show month and total stream count, sorted by month.
select substring(stream_date, 1,7) as '2024_month', count(stream_id) as no_of_streams
from streams
group by substring(stream_date, 1,7)
order by 1;

# Question 5: Which songs have the highest completion rate? Completion rate = percentage of streams where completed = 'Yes', rounded to 2 decimal places. Show song title and completion rate, sorted descending.
SELECT s.title,
       ROUND(SUM(CASE WHEN st.completed = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(st.stream_id), 2) as completion_rate
FROM songs_clean s
JOIN streams st ON s.song_id = st.song_id
GROUP BY s.title
ORDER BY completion_rate DESC;

# Question 6: What is the Premium vs Free user streaming behaviour? Show subscription type, total streams, average stream duration and completion rate, sorted by total streams descending.
select subscription_type, count(stream_id), round(avg(stream_duration_seconds),2), round(sum(case when completed = 'Yes' then 1 else 0 end) * 100 / count(stream_id),2) as completion_rate
from streams
group by subscription_type;

# Question 7: Which device is most used for streaming? Show device, total streams and percentage of total streams, sorted by total streams descending.
select device, count(stream_id), round((count(stream_id) *100/(select count(*) from streams)),2)
from streams
group by device
order by 2;

# Question 8: Who are the top 10 most streamed songs? Show song title, artist and total stream count, sorted descending.
select title, artist, count(stream_id)
from songs_clean
join streams
	on songs_clean.song_id = streams.song_id
group by title, artist
order by 3 desc
limit 10;

# Question 9: Which artist has the highest average popularity score? Show artist name and average popularity score rounded to 2 decimal places, sorted descending.
select artist, round(avg(popularity_score),2) as popul_score
from songs_clean
join streams
	on songs_clean.song_id = streams.song_id
group by artist
order by 2 desc
limit 1;

# Question 10: What is the average stream duration vs actual song duration by genre? Show genre, average song duration, average stream duration and the difference between them, rounded to 2 decimal places, sorted by difference descending.
select genre, round(avg(duration_seconds),2), round(avg(stream_duration_seconds),2), round((avg(duration_seconds) - avg(stream_duration_seconds)),2) as diff_duration_streams
from songs_clean
join streams
	on songs_clean.song_id = streams.song_id
group by genre
order by 4 desc;