select *
from layoffs;

create table layoffs1
like layoffs;

insert into layoffs1
select *
from layoffs;

select *
from layoffs1;

update layoffs1
set company = trim(company);

update layoffs1
set industry = 'Crypto'
where industry like 'Crypto%';

select date, str_to_date(`date`, '%m/%d/%Y')
from layoffs1;

update layoffs1
set date = str_to_date(`date`, '%m/%d/%Y');

update layoffs1
set country = 'United States'
where country like 'United States%';

alter table layoffs1
modify column `date` date;

select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs1;

with duplicate_cte as
(select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs1)
select *
from duplicate_cte
where row_num > 1;

CREATE TABLE `layoffs2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` date DEFAULT NULL,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs2;

insert into layoffs2
select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs1;

select *
from layoffs2
where row_num > 1;

delete
from layoffs2
where row_num > 1;

select *
from layoffs2;

select *
from layoffs2
where industry is null;

update layoffs2
set industry = null
where industry = '';

select *
from layoffs2
where company = 'airbnb';

select t1.industry, t2.industry
from layoffs2 t1
join layoffs2 t2
	on t1.company =t2.company
where t1.industry is null and t2.industry is not null;

update layoffs2 t1
join layoffs2 t2
	on t1.company =t2.company
set t1.industry = t2.industry
where t1.industry is null and t2.industry is not null;

select *
from layoffs2;

delete
from layoffs2
where total_laid_off is null and percentage_laid_off is null;

alter table layoffs2
drop column row_num;

select *
from layoffs2;

with cte11 as
(select substring(`date`,1,7) as monthy, sum(total_laid_off) as total_off
from layoffs2
group by monthy)
select *, sum(total_off) over(order by monthy) as rolling_total
from cte11
where monthy is not null;

select *
from layoffs2;

with cteeee as 
(SELECT YEAR(`date`), company, SUM(total_laid_off), DENSE_RANK() OVER ( PARTITION BY YEAR(`date`) ORDER BY SUM(total_laid_off) DESC) as densyy
FROM layoffs2
where year(`date`) is not null
GROUP BY YEAR(`date`), company)
select *
from cteeee
where densyy <=5;

select *
from layoffs2;