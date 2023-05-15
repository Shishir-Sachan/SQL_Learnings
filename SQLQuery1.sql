use eduin_data
go

--select * from employees

select employee_id,department, salary, first_name,
	FIRST_VALUE ( salary ) over (order by department) first_value_by_weight,
	last_value ( salary ) over (order by department) range,
	lag ( salary ) over (partition by department order by salary) as lag_salary_sumation,
	lead ( salary ) over (partition by department order by salary) as lead_salary_sumation,
	rank() over (partition by department order by salary) as " rank by salary" ,
	salary - lag ( salary ) over (partition by department order by salary) 
from employees 

DESCRIBE employees