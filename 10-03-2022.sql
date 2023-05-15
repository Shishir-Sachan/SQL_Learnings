USE eduin_data
go

SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM regions

SELECT e.department,SUM(salary) 
FROM employees e 
INNER JOIN departments d
ON e.department = d.department
INNER JOIN regions r 
ON e.region_id = r.region_id
GROUP BY e.department
ORDER BY SUM(salary) DESC
