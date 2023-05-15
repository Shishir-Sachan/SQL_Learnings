
SELECT * FROM employees

SELECT * FROM departments

SELECT * FROM regions

SELECT first_name, country
FROM employees, regions
WHERE employees.region_id = regions.region_id;

SELECT first_name, email, division, country, e.department Dd, d.department Ed
FROM employees e, departments d, regions r
WHERE e.department = d.department
AND e.region_id = r.region_id
AND email IS NOT NULL

SELECT country, count(employee_id)
FROM employees e, regions r
WHERE e.region_id = r.region_id
--AND email IS NOT NUll
GROUP BY country 
order by country desc


SELECT first_name, country
FROM employees INNER JOIN regions
ON employees.region_id = regions.region_id

SELECT first_name, email, division, country
FROM employees e INNER JOIN departments d 
ON e.department = d.department
INNER JOIN regions r ON e.region_id = r.region_id

SELECT email, first_name, division, country
FROM departments d INNER JOIN employees e  
ON d.department = e.department 
INNER JOIN regions r ON e.region_id = r.region_id
WHERE email IS NOT NULL

SELECT distinct department FROM employees
-- 27 department

SELECT distinct department FROM departments
-- 24 department

SELECT distinct employees.department, departments.department
FROM employees RIGHT JOIN departments ON employees.department = departments.department

-- departments present in employees table but not in department table

SELECT distinct e.department
FROM employees e LEFT JOIN departments d 
ON e.department =d.department
WHERE d.department IS NULL

SELECT distinct e.department
FROM employees e FULL OUTER JOIN departments d 
ON e.department =d.department

---------Union --------

SELECT DISTINCT department
FROM employees
UNION
SELECT  department
FROM departments

SELECT DISTINCT department
FROM employees
UNION ALL
SELECT  department
FROM departments

SELECT distinct department
FROM employees
EXCEPT
SELECT department
FROM departments

------departments and total no, of employees working into that department

SELECT department, Count(employee_id)
FROM employees
group by department
UNION ALL
SELECT 'TOTAL' , Count(*)
FROM employees


SELECT TOP(2) first_name,department,hire_date, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MAX(hire_date) FROM employees e2)
OR hire_date = (SELECT MIN(hire_date) FROM employees e2)
ORDER BY hire_date desc

SELECT first_name,department,hire_date, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MAX(hire_date) FROM employees e2)
UNION ALL
SELECT TOP(1) first_name,department,hire_date, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT Min(hire_date) FROM employees e2)

------------------------------------------------------------------------------------------------------

SELECT first_name, hire_date,DATEADD(day, -3, hire_date) as PreviousDate30
FROM employees

SELECT first_name, hire_date,DATEADD(day, -3, hire_date) 
FROM employees
------------------------------------------------------------------------------------------------------

SELECT e.first_name, e.hire_date, (SELECT SUM(salary) 
								   FROM employees e2 
								   WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date)
FROM employees e 
order by hire_date
--------------------------------------------------------------------------------------------------

SELECT e.first_name, e.hire_date,e.salary, (SELECT SUM(salary) 
								   FROM employees e2 
								   WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date)
FROM employees e 
ORDER BY hire_date

-----------------------------------------------------------------------------------------------

SELECT e.first_name, e.hire_date,e.salary, (SELECT COUNT(employee_id) 
								   FROM employees e2 
								   WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date) AS Count_of_numbers,
								   (SELECT SUM(salary) 
								   FROM employees e2 
								   WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date) AS sum_of_the_salary
FROM employees e 
ORDER BY hire_date

--------------------------------------------------------------------------------------------------

SELECT MAX(sum_of_the_salary) FROM
                              (SELECT e.hire_date,e.salary, (SELECT COUNT(employee_id) 
								        FROM employees e2 
								        WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date) AS Count_of_numbers,
							 (SELECT SUM(salary) 
								        FROM employees e2 
								        WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date) AS sum_of_the_salary
                                    FROM employees e 
) AS a

-------------------------------------------------------------------------------------------------------------
CREATE VIEW v_Demo AS
SELECT e.first_name, e.hire_date,e.salary, (SELECT COUNT(employee_id) 
								   FROM employees e2 
								   WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date) AS Count_of_numbers,
								   (SELECT SUM(salary) 
								   FROM employees e2 
								   WHERE e2.hire_date Between   DATEADD(day, -90, e.hire_date) AND e.hire_date) AS sum_of_the_salary
FROM employees e 
-------------------------------------------------------------------------------------------------------------
SELECT first_name, department, (SELECT COUNT(*) FROM employees e2 WHERE e2.department = e1.department)
FROM employees e1


--Both the queries are same 
SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department)
FROM employees

---------Windowing functions---------------------------------------------------------------------------------

SELECT first_name, department, 
COUNT(*) OVER()
FROM  employees

--------------------------------------------------------------------------------------------------------------
SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department)
FROM employees

--------------------------------------------------------------------------------------------------------------
SELECT first_name, department, SUM(salary) OVER(PARTITION BY department) AS Departmental_Salary, 
								COUNT(*) OVER(PARTITION BY department) AS Departmental_people
FROM employees
ORDER BY Departmental_Salary DESC
--------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------
SELECT first_name, department,salary, SUM(salary) OVER(PARTITION BY department) AS Departmental_Salary, 
								COUNT(*) OVER(PARTITION BY department) AS Departmental_people, SUM(Salary) OVER()
FROM employees
ORDER BY Departmental_Salary DESC
---------------------------------------------------------------------------------------------------------------
SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department) as Dep_count,
COUNT(*) OVER(PARTITION BY region_id) as Reg_count
FROM employees
--------------------------------------------------------------------------------------------------------------
Select first_name,hire_date, salary, 
Sum(salary) over(order by hire_date range between unbounded preceding and current  row) as running_total_of_salaries
from employees
-------------------------------------------------------------------------------------------------------------------
Select first_name,hire_date, salary, 
Sum(salary) over(order by hire_date) as running_total_of_salaries
from employees
----------------------------------------------------------------------------------
Select first_name,hire_date,department, salary, 
Sum(salary) over(partition by department order by hire_date) as running_total_of_salaries
from employees
----------------------------------------------------------------------
Select first_name,hire_date,department, salary, 
Sum(salary) over(partition by department order by hire_date desc) as running_total_of_salaries
from employees
----------------------------------------------------------------------------------------------
Select first_name,hire_date,department, salary, 
Sum(salary) over(partition by department order by hire_date) as running_total_of_salaries
from employees
order by hire_date
----------------------------------------------------------------------------------------------
select first_name, hire_date, department, salary, 
Sum(salary) over (order by hire_date rows between 1 preceding and current row)
From employees
---------------------------------------------------------------------------------------------
select first_name, hire_date, department, salary, 
Sum(salary) over (order by hire_date rows between 3 preceding and current row)
From employees
------------------------------------------------------------------------------------------------
select first_name, hire_date, department, salary, 
sum(salary) over (order by hire_date rows between 1000 preceding and current row)
From employees
---------------------------------------------------------------------------------------------------------------
select first_name, hire_date, department, salary,
rank() over(partition by department order by salary desc)
from employees
----------------------------------------------------------------------------------------------
Select a.* from
(select first_name, hire_date, department, salary,
rank() over(partition by department order by salary desc) as ranking
from employees) a
where a.ranking = 8 and department = 'Books'
--------------------------------------------------------------------------------------------------
Select a.* from
(select first_name, hire_date, department, salary,
rank() over(partition by department order by salary desc) as ranking
from employees) a
where a.ranking > 8 and a.ranking <= 10 and department like '%mpin%'
----------------------------------------------------------------------------------------------------
select first_name, email, department, salary,
ntile(5) over(partition by department order by salary desc)
from employees
--------------------------------------------------------------------------------------------------------
select first_name, email, department, salary,
first_value(salary) over(partition by department order by salary desc)
from employees
------------------------------------------------------------------------------------------------------
select first_name, email, department, salary,
Max(salary) over(partition by department order by salary desc)
from employees
------------------------------------------------------------------------------
select first_name, email, department, salary,
nth_value(salary, 5) over(partition by department order by salary desc)
from employees
------------------------------------------------------------------------------------------------
Select * 
from (select first_name, email, department, salary,
row_number() over(partition by department order by salary desc) as RN
from employees) a
where rn = 8
-----------------------------------------------------------------------------------------------------------
------------------LEAD and LAG Function-------------------------------------------------
SELECT first_name, last_name, salary, 
Lead(salary) over(order by hire_date) next_salary
From employees
--------------------------------------------------------------------------------------
SELECT first_name, last_name, department,salary, 
Lead(salary) over(order by department) next_salary
From employees
------------------------------------------------------------------------------------------
SELECT first_name, last_name, hire_date, salary, 
Lag(salary) over(order by hire_date) previous_salary
From employees
---------------------------------------------------------------------------------------------
SELECT department, last_name, salary,
lag(salary) over(order by salary desc) next_higher_salary
from employees
----------------------------------------------------------------------------------------------
SELECT department, last_name, salary,
lag(salary) over(order by salary desc) closest_higher_salary
from employees
------------------------------------------------------------------------------------------------
SELECT department, last_name, salary,
LEAD(salary) OVER (partition BY department ORDER BY salary desc) closest_lower_salary
FROM employees
--------------------------------------------------------------------------------------------------
-------Rollups and cube-----------------
SELECT * From sales
order by continent, country, city

SELECT continent, sum(units_sold)
FROM sales
GROUP BY continent

SELECT country, sum(units_sold)
FROM sales
GROUP BY country

SELECT city, sum(units_sold)
FROM sales
GROUP BY city

SELECT continent, country, city, sum(units_sold)
From sales
group by grouping sets(continent, country, city)
----------------------------------------------------------------------------------------------------------
SELECT continent, country, city, sum(units_sold)
From sales
group by grouping sets(continent, country, city, ())
------------------------------------------------------------------------------------------
SELECT continent, country, city, sum(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city)
-------------------------------------------------
SELECT continent, country, city, sum(units_sold)
FROM sales
GROUP BY CUBE(continent, country, city)
--------------------------------------------------------------------------------------------------
SELECT first_name, country
FROM employees INNER JOIN regions
ON employees.region_id = regions.region_id
ORDER BY country
---------------------------------------------------------------------------------------------------










