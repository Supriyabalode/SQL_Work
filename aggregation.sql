use hef_shine;

-- find maximum salary
select max(salary) from employees;

-- find average salary
select avg(salary)from employees;

-- find employee count
select count(employee_id) from employees;

-- find total departments
select count(department_id) from employees;

-- find total locations
select count(location_id) from locations;

-- select distinct job roles
select distinct job_Title from jobs;

-- Show employee name and job title.-- 
select e.first_name,e.last_name,j.job_title from employees e join jobs j 
on e.job_id=j.job_id;


-- employee count departmentwise
select count(e.employee_id) as Total_employee,d.department_name from employees e join departments d
on e.department_id=d.department_id
group by e.department_id;

-- Total salary departmentwise
select sum(e.salary) as Total_sal,d.department_name from employees e join departments d
on e.department_id=d.department_id
group by e.department_id;


--  employee name, department name, and city.-- 
select e.first_name,e.last_name, d.department_name,l.city
from employees e join departments d
on e.department_id=d.department_id 
join locations l
on d.location_id=l.location_id;


-- find second highest salary
select * from (select *,dense_rank() over(order by salary desc) as sal_rank  from employees) t
where sal_rank=2;



