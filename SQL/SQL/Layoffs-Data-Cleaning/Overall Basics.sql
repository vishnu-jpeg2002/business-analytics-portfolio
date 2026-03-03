#Built strong SQL foundations covering SELECT, WHERE, GROUP BY, ORDER BY, HAVING, joins and unions, string functions like SUBSTRING, CASE statements, subqueries, window functions, CTEs, and hands on work with tables, stored procedures, triggers, and events for structured data management and analysis.
select *
from employee_demographics;

select age, (age + 10) * 10 as age_10
from employee_demographics;

select distinct gender
from employee_demographics;

select *
from employee_salary
where salary > 50000;

select *
from employee_demographics
where gender = 'male' and age > 40;

select *
from employee_salary
where occupation like '%manager%';

select gender, avg(age), min(age), max(age), count(age)
from employee_demographics
group by gender;

select *
from employee_salary
order by salary desc;

select occupation, avg(salary), min(salary), max(salary), count(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 50000;

select *
from employee_demographics
order by age desc
limit 5;

select *
from employee_demographics  as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
select *
from employee_demographics  as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
select *
from employee_salary as dem1
join employee_salary as dem2
	on dem1.employee_id + 1 = dem2.employee_id;
    
select *
from employee_demographics  as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
select *
from employee_salary;

select *
from employee_demographics
inner join employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id
inner join parks_departments
	on employee_salary.dept_id = parks_departments.department_id;
    
SELECT *
FROM employee_demographics AS emp1
JOIN employee_demographics AS emp2
    ON emp1.employee_id + 1 = emp2.employee_id;

WITH cte1 AS (
    SELECT first_name, last_name
    FROM employee_demographics
    WHERE age > 35
    
    UNION ALL
    
    SELECT first_name, last_name
    FROM employee_salary
    WHERE salary > 50000
),
cte2 AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY first_name, last_name ORDER BY first_name) AS row_num
    FROM cte1
)
SELECT *
FROM cte2
WHERE row_num > 1;

select first_name, length(first_name), upper(first_name), substring(birth_date, 6,2), locate('a', first_name), replace(first_name, 'a', 'b'), concat(first_name, ' ', last_name)
from employee_demographics;

select first_name, last_name, age,
case
	when age <= 35 then 'young'
    when age > 35 then 'old'
end as age_label
from employee_demographics;

select *
from employee_demographics
where employee_id in (select employee_id
					  from employee_salary
                      where dept_id = 1);
                      
select *,
(select avg(salary)
from employee_salary)
from employee_demographics;

select gender, avg(age)
from employee_demographics
group by gender;

select avg(egg)
from(select gender, avg(age) as egg
from employee_demographics
group by gender) as geny;

select dem.first_name, dem.gender, sal.salary, sum(salary) over(partition by gender order by salary desc) as rolling_num,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as ranky,
dense_rank() over(partition by gender order by salary desc) as densy
from employee_demographics dem
inner join employee_salary sal
	on dem.employee_id = sal.employee_id;
    
create temporary table vishnu
select *
from employee_demographics;

select *
from vishnu;

create temporary table vishnu1
(films varchar(50),
rating varchar(50));

select *
from vishnu1;

insert into vishnu1
values('janeman', 'fantastic');

select *
from employee_salary;

delimiter $$
create trigger vish
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics(employee_id, first_name, last_name)
    values(new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
values('14', 'vishnu', 'jpeg', 'photo', 5000, null);

select *
from employee_demographics;

delimiter $$
create event event1
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age > 50;
end $$
delimiter ;


