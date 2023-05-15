SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM regions

SELECT first_name, department, (SELECT COUNT(*) FROM employees e1 WHERE (e1.department = e2.department))
FROM employees e2
GROUP BY department, first_name

SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department) --ORDER BY first_name)
FROM employees e2


SELECT first_name, department, (SELECT COUNT(*) FROM employees e1 WHERE (e1.department = e2.department))
FROM employees e2
GROUP BY department, first_name
EXCEPT
SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department) --ORDER BY first_name)
FROM employees e2

SELECT first_name, department,
SUM(salary) OVER(PARTITION BY department) --ORDER BY first_name)
FROM employees e2

SELECT first_name, department,
SUM(salary) OVER() --ORDER BY first_name)
FROM employees e2

SELECT  department,
SUM(salary) OVER(PARTITION BY department),
COUNT(*) OVER(PARTITION BY region_id )
FROM employees e2
GROUP BY department


SELECT first_name,gender,department,Count(*) FROM employees
GROUP BY gender,department, first_name
ORDER BY COUNT(*) DESC




SELECT First_name + ' '+ last_name, department, salary,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees
WHERE department IN ('Automotive', 'Beauty') AND salary > ALL(SELECT AVG(salary) FROM employees GROUP BY  department)

SELECT department, AVG(salary) FROM employees 
GROUP BY  department
ORDER BY department

SELECT  department,
SUM(salary) OVER(PARTITION BY department),
COUNT(*) OVER(PARTITION BY region_id )
FROM employees e2



SELECT first_name, department --,COUNT(*) OVER ()
FROM employees
WHERE region_id = 3


SELECT first_name, department ,COUNT(*) OVER (PARTITION BY department ORDER BY department)
FROM employees
WHERE region_id = 3

SELECT first_name, department ,COUNT(*) OVER (PARTITION BY department ORDER BY first_name)
FROM employees
WHERE region_id = 3

SELECT first_name, hire_date, salary,
SUM(salary) OVER( ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_of_salary
FROM employees
ORDER BY hire_date

SELECT first_name, hire_date,department,  salary,
SUM(salary) OVER(PARTITION BY department ORDER BY hire_date ) AS running_total_of_salary
FROM employees
--ORDER BY department

SELECT first_name, hire_date, salary,
SUM(salary) OVER( ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_of_salary
FROM employees
ORDER BY hire_date


SELECT first_name, hire_date, salary,
SUM(salary) OVER( ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS running_total_of_salary
FROM employees

SELECT first_name, hire_date, salary,
SUM(salary) OVER( ORDER BY hire_date ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS running_total_of_salary
FROM employees


-- Rank function

SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

SELECT * 
FROM (
	SELECT first_name, email, department, salary,
	RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranking
	FROM employees
	)a
WHERE ranking = 8

/*
SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) as r
FROM employees
WHERE r = 8 --error--first where clause will execute after that select clause

*/

SELECT first_name, email, department, salary,
NTILE(5) OVER(PARTITION BY department ORDER BY salary DESC) salary_bracket
FROM employees

SELECT first_name, email, department, salary,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC) first_value
FROM employees

SELECT first_name, email, department, salary,
MAX(salary) OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees


SELECT first_name, email, department, salary,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC) first_value
FROM employees
EXCEPT
SELECT first_name, email, department, salary,
MAX(salary) OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

/*
SELECT first_name, email, department, salary,
NTH_VALUE(salary,5) OVER(PARTITION BY department ORDER BY first_name ASC) first_value
FROM employees */  --not exist

-- LEAD AND LAG FUNCTIONS

SELECT first_name,last_name,department, salary,
LEAD(salary) OVER( ORDER BY department) next_salary
FROM employees

SELECT first_name,last_name,department, salary,
LAG(salary) OVER( ORDER BY department) previous_salary
FROM employees

SELECT department, last_name,salary,
LAG(salary) OVER(ORDER BY salary DESC) next_higher_salary
FROM employees

SELECT department, last_name,salary,
LEAD(salary) OVER(ORDER BY salary DESC) closest_lower_salary
FROM employees

SELECT department, last_name,salary,
LEAD(salary) OVER(PARTITION BY department ORDER BY salary DESC) closest_lower_salary
FROM employees

---- Rollups and cubes

CREATE TABLE sales
(
	continent varchar(20),
	country varchar(20),
	city varchar(20),
	units_sold integer
);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);

SELECT * FROM sales
ORDER BY  continent,country,city

SELECT continent, SUM(units_sold)
FROM sales
GROUP BY continent

SELECT country, SUM(units_sold)
FROM sales
GROUP BY country

SELECT city, SUM(units_sold)
FROM sales
GROUP BY city

-- know in single queries

SELECT continent,country,city,SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS (continent,country,city)

SELECT continent,country,city,SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS (continent,country,city,())

SELECT * FROM sales;
SELECT continent,country,city,SUM(units_sold)
FROM sales
GROUP BY ROLLUP (continent,country,city);

SELECT * FROM sales;
SELECT continent,country,city,SUM(units_sold)
FROM sales
GROUP BY CUBE (continent,country,city);

SELECT first_name, email, department, salary,
ROW_NUMBER() OVER (ORDER BY department ) rh,
RANK() OVER(ORDER BY department ) rk, -- rank has gaps
DENSE_RANK() OVER(ORDER BY department) dr -- no gaps
FROM employees





