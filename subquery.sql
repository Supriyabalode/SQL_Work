use hef_shine;


-- employee with max salary

select first_name,last_name,salary from employees where salary=(select max(salary) from employees);
select first_name,last_name,salary from employees order by salary desc limit 1;

-- employee with second highest salary.
select first_name,last_name,salary from employees order by salary desc limit 1 offset 1;
select first_name,last_name,salary from employees where salary=(select max(salary) as scsalary from employees
where salary<(select max(salary) from employees)) limit 1;
create index first on employees(salary);
desc employees;
show index from employees;


create table department(dept_id int primary key,dept_name varchar(50));
insert into department values(1,"HR"),(2,"Finance"),(3,"Engineering"),(4,"sales"),(5,"Marketing");


create table employee(emp_id int primary key,
emp_name varchar(50),
salary decimal(10,2),
dept_id int,
manager_id int,
foreign key(dept_id) references department(dept_id));

insert into employee(emp_id,emp_name,salary,dept_id,manager_id) values
(101,"Alice",75000,3,null),
(102,"Bob",50000,3,101),
(103,"Charlie",60000,3,101),
(104,"David",45000,1,null),
(105,"Eve",50000,1,104),
(106,"Frank",52000,2,null),
(107,"Grace",48000,2,106),
(108,"Heidi",62000,4,null),
(109,"Ivan",55000,4,108),
(110,"Judy",58000,5,null);

select * from employee;

-- find the employee who earn more than average salary

select * from employee where salary>(select avg(salary) from employee);

select dept_name,dept_id from department
where dept_id in (select dept_id from employee group by dept_id having count(emp_id)>1);


-- find employee who is manageer...

select emp_name from employee
where emp_id in (select manager_id from employee where manager_id is not null);
select * from employee;

select emp_name 
from employee 
where salary=(select max(salary) from employee);

select emp_name,salary
from employee
where salary=(select max(salary) from employee where salary<(select max(salary) from employee));

select * from employee where salary=(select max(salary) from employee where salary<(select max(salary) from employee));



-- find the department with more than 5 employee...

select dept_id,dept_name from department where
dept_id in (select dept_id from employee group by dept_id having count(*)>5);

-- find all employee who work in the same department as "Grace"

select emp_name,dept_id from employee where dept_id = (select dept_id from employee where emp_name="Grace");

-- find employees who earn more than any employee in departmen 3..


create table em(id int, name varchar(20), mail varchar(20));
insert into em values(1,"Ram","ab@12"),  
(2,"sham","bc@12"),
(3,"seeta","cd@12"),                         
(4,"Ram","ab@12");


use hef_shine;

select e1.id,e1.name,e1.mail from em e1 join em e2
on e1.name=e2.name and e1.mail=e2.mail and e1.id>e2.id;
