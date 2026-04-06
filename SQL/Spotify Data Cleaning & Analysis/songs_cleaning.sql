# Data Cleaning - songs table
select *
from songs;

select count(*), count(distinct song_id)
from songs;

with cte as
(select *, row_number() over(partition by title, artist, release_date) as row_num
from songs)
select *
from cte
where row_num > 1;

CREATE TABLE `songs_clean` (
  `song_id` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `artist` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `album` varchar(100) DEFAULT NULL,
  `release_date` varchar(50) DEFAULT NULL,
  `duration_seconds` varchar(20) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `explicit` varchar(10) DEFAULT NULL,
  `popularity_score` varchar(20) DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into songs_clean
select *, row_number() over(partition by title, artist, release_date) as row_num
from songs;

select *
from songs_clean;

SELECT COUNT(*) 
FROM songs_clean;

delete
from songs_clean
where row_num > 1;

ALTER TABLE songs_clean 
DROP COLUMN row_num;

select *
from songs_clean;

UPDATE songs_clean
SET title = CONCAT(
    UPPER(LEFT(title, 1)),
    LOWER(SUBSTRING(title, 2))
);

SELECT title 
from songs_clean 
limit 10;

UPDATE songs_clean
SET artist = CONCAT(
    UPPER(LEFT(title, 1)),
    LOWER(SUBSTRING(title, 2))
);

UPDATE songs_clean sc
JOIN songs s ON sc.song_id = s.song_id
SET sc.artist = CONCAT(
    UPPER(LEFT(s.artist, 1)),
    LOWER(SUBSTRING(s.artist, 2))
);

select *
from songs_clean;

update songs_clean
set genre = lower(genre);

select count(*)
from songs_clean
where album = 'NULL';

UPDATE songs_clean
SET album = NULL
WHERE album = 'NULL';

SELECT COUNT(*) 
FROM songs_clean;

update songs_clean
set language = lower(language);

update songs_clean
set explicit = lower(explicit);

SELECT * 
FROM songs_clean 
WHERE duration_seconds REGEXP '[^0-9]';

UPDATE songs_clean
SET duration_seconds = CASE
    WHEN song_id = 'S115' THEN '185'
    WHEN song_id = 'S203' THEN '354'
END
WHERE duration_seconds REGEXP '[^0-9]';

alter table songs_clean
modify column duration_seconds int;

alter table songs_clean
modify column popularity_score int;

alter table songs_clean
modify column release_date date;

DESCRIBE songs_clean;