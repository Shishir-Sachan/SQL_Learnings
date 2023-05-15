Select * from employees
Select * from departments
Select * from regions

Select first_name, country
From employees, regions
where employees.region_id = regions.region_id

