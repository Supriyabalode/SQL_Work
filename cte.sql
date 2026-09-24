-- cte (common table expression)
--  it behaves like temporary table
--  it is used to make code more readable

use hef_shine;
with CTE1 as (select * from employees where salary >4000)
select count(*) from CTE1;
select * from employees;                                                                   




-- With salary above company average
-- Also show department-wise count for those employees”

with CTE2 as(select * from employees where salary>avg(salary))
select count(*) from cte2 group by department_id;

with avg_salary as (select avg(salary) as avg_sal from employees),
cte3 as (select * from employees where salary>(select avg_sal from avg_salary))
select department_id,count(*) from cte3 group by department_id;




