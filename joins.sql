use hef_shine;
select * from employees;
select E.first_name,E.last_name,D.department_name from employees as E inner join departments as D
on E.department_id=D.department_id;



-- 2. left join list all employees and their department names..
select E.first_name,E.last_name,D.department_name from employees as E left join departments as D
on E.department_id=D.department_id;


-- 3.right join   ...list all department and employee working in them.
select D.department_name,E.first_name,E.last_name from employees as E right join departments as D
on D.department_id=E.department_id;

-- 4. full outer join: list all employees and all departments
select E.first_name,E.last_name,D.department_name from employees as E left join departments as D
on E.department_id=D.department_id union select D.department_name,E.first_name,E.last_name from employees as E right join departments as D
on D.department_id=E.department_id;


-- 5.Join Employees to Managers: List employees along with their manager’s name
select E.first_name,E.Last_name,D.manager_id from employees as E left join departments as D
on E.manager_id=D.department_id;

-- 6. Employees in a Specific Department: List employees who belong to department with ID 10
select D.department_id,D.department_name,E.first_name,E.last_name from employees as E  join departments as D
on D.department_id=E.department_id
where d.department_id=10;


-- 7.department manager: list departments with their respective manager
select E.department_id,E.first_name,E.last_name,D.department_name from employees as E left join departments as D
on D.department_id=E.department_id;


-- 8. Employees Without a Manager: List employees who don't have a manager
select E.department_id,E.first_name,E.last_name from employees as E join departments as D
on D.department_id=E.department_id
where D.manager_id=Null;

-- 9.Departments with Employees: List departments that have employees
select E.department_id,D.department_name,E.first_name from employees as E inner join departments as D
on D.department_id=E.department_id;

-- 10. Employees with Same Job in Same Department: List employees with the same job in the same department.
SELECT e1.FIRST_NAME, e1.LAST_NAME, e1.JOB_ID, e2.FIRST_NAME AS Other_Employee, e2.LAST_NAME AS Other_Employee_Last_Name
FROM employees e1
INNER JOIN employees e2 ON e1.DEPARTMENT_ID = e2.DEPARTMENT_ID AND e1.JOB_ID = e2.JOB_ID AND e1.EMPLOYEE_ID != e2.EMPLOYEE_ID;




-- 11.Employees with Highest Salary in Each Department
select e.first_name,e.last_name,d.department_name,max(E.salary)
from employees e join departments d
on  D.department_id=E.department_id
group by d.department_name;


SELECT e.DEPARTMENT_ID, e.FIRST_NAME, e.LAST_NAME, e.SALARY
FROM employees e
WHERE e.SALARY = (
  SELECT MAX(SALARY)
  FROM employees
  WHERE DEPARTMENT_ID = e.DEPARTMENT_ID
);


select e.department_id,max(e.salary)
from employees e
group by e.department_id;


-- 12. List of Employees and Their Salary Rank in Each Department
SELECT e.DEPARTMENT_ID, e.FIRST_NAME, e.LAST_NAME, e.SALARY,
  RANK() OVER (PARTITION BY e.DEPARTMENT_ID ORDER BY e.SALARY DESC) AS Salary_Rank
FROM employees e;

-- 13. Employees Who Report to the Same Manager: List employees who report to the same manager
SELECT e1.FIRST_NAME, e1.LAST_NAME, e2.FIRST_NAME AS Manager_First_Name, e2.LAST_NAME AS Manager_Last_Name
FROM employees e1
INNER JOIN employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID
WHERE e1.MANAGER_ID = 100;

-- 14. Department Locations: List all departments with their locations
SELECT d.DEPARTMENT_NAME, d.LOCATION_ID
FROM departments d;


-- 15. Employees Who Are Managers: List employees who are also managers
SELECT e.FIRST_NAME, e.LAST_NAME
FROM employees e
WHERE e.EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID FROM employees WHERE MANAGER_ID IS NOT NULL);

select * from employees where employee_id in (select distinct manager_id from employees where manager_id is not null);

-- 16. Departments Without Managers: List departments without a manager
SELECT d.DEPARTMENT_NAME
FROM departments d
left JOIN employees e ON d.MANAGER_ID = e.EMPLOYEE_ID
WHERE e.EMPLOYEE_ID IS NULL;
use hef_shine;


-- 17. Employees with Commission: List employees who have a commission
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, e.COMMISSION_PCT
FROM employees e
WHERE e.COMMISSION_PCT>0; 


-- 18. List All Employees and Their Department Location
SELECT e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME, d.LOCATION_ID
FROM employees e
LEFT JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- 19. Employees in a Specific Job Category: List employees in a specific job category (e.g., "SA_REP")
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, e.JOB_ID
FROM employees e
WHERE e.JOB_ID = 'SA_REP';


-- 20. Department with Highest Number of Employees
SELECT d.DEPARTMENT_NAME, COUNT(e.EMPLOYEE_ID) AS Employee_Count
FROM departments d
LEFT JOIN employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID
ORDER BY Employee_Count DESC
LIMIT 1;
use hef_shine;

select d.department_name,count(e.employee_id) as counts
from departments d
left join employees e
on d.department_id=e.department_id
group by department_name
order by counts desc
limit 1; 



select * from Employees E1
join Employees e2
where E1.salary=E2.salary and E1.Employee_id!=e2.Employee_id;


select e.department_id,e.First_name,e.salary,
rank() over (partition by e.department_id order by salary desc) as salary_rank
from employees e; 





-- 3.right join   ...list all department and employee working in them.
select d.Department_name,e.first_name,e.last_name from employees e right join departments d on e.department_id=d.department_id;

-- 20. Department with Highest Number of Employees
select d.department_name,count(e.employee_id) from departments d left join employees e on d.department_id=e.department_id
group by department_name
order by count(e.employee_id) desc
limit 1;
 
 
  -- 11.Employees with Highest Salary in Each Department
  select d.department_name,max(salary) as s from departments d left join employees e on d.department_id=e.department_id
  group by d.department_name;
  

select max(salary) from employees e
where department_id=(select department_id from departments where department_name="IT");




