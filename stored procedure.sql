-- store procedures are set of precompiled one or more sql statements.      



use hef_shine;
DELIMITER $$
CREATE PROCEDURE getdetails()
begin
select * from employees;
end $$
delimiter ;
call getdetails();



DELIMITER $$
CREATE PROCEDURE getdetails1(in emp_id int)
begin
select * from employees where employee_id=emp_id;
end $$
delimiter ;
call getdetails1(101);




DELIMITER $$
CREATE PROCEDURE Addition(in a int,b int)
begin
declare result int;
set result=a+b;
select result;
end $$
delimiter ;
call Addition(2,3);
select "record inserted successfully...";



DELIMITER $$
CREATE PROCEDURE Evenodd(in num int)
begin
declare result varchar(20);
if mod(num,2)=0 then
	set result="even";
else
    set result="odd";
end if;
select result;
end $$
delimiter ;
call Evenodd(5);



delimiter $$
create procedure Sub(in a int,b int)
begin
declare result  int;
set result=a-b;
select result;
end $$
delimiter ;
call Sub(4,2);


delimiter $$
create procedure mult(in a int,b int)
begin
declare result int;
set result=a*b;
select result;
end $$
delimiter ;
call mult(2,4);


delimiter $
create procedure multi(in a int,b int)
begin
declare result int;
set result=a*b;
select result;
end $
delimiter ;
call multi(2,4);
use hef_shine;

delimiter $$
create procedure Totalsal(in dept_id int)
begin
select sum(salary) as total from employees
where department_id=dept_id;
end $$
delimiter ;
call Totalsal(90);


# write a stored procedure that updates salry of an employee

delimiter $$
create procedure updatesalary(in emp_id int,in new_salary int)
begin
update employees
set salary=new_salary
where employee_id=emp_id;
end $$
delimiter ;
call updatesalary(101,50000);

-- write stored procedure that takes emp id end return emp name ane department.


delimiter $$
create procedure emp_details(in empid int)
begin
select e.first_name,d.department_name
from employees as e join departments as d
where e.employee_id=empid;
end $$
delimiter ;
call emp_details(101);



-- 7.write a stored procedures that takes a department id and return highest paid employee name in that department.

delimiter $$
create procedure emp3(in dep_id int)
begin
select * from employees
where salary=(select max(salary) from employees where department_id=dep_id);
end $$
delimiter ;
call emp3(20);

delimiter $$
create procedure emp4(in dep_id int)
begin
select * from employees
where salary=(select max(salary) from employees where department_id=dep_id);
end $$
delimiter ;
call emp4(20);



delimiter $$
create procedure maxsal(in dept_id int)
begin
select salary from employees
where department_id=dept_id
order by salary desc
limit 1;
end $$
delimiter ;
call maxsal(20);




-- write a stored procedure that calculates and returns the average salary of all employees

delimiter $$
create procedure avgsalary()
begin
select avg(salary) as avg
from employees;
end $$
delimiter $$;
call avgsalary();

-- 9.write a stored procedure that accept date range and return a list of all employees hired within the date range.

delimiter $$
create procedure hdate(in start_date date,in end_date date)
begin
select * from employees
where hire_date between start_date and end_date;
end $$
delimiter ;
call hdate("1987-01-01","1987-12-31");




delimiter $$
create procedure divisions(in a int,in b int)
begin
declare result float;
set result=a/b;
select result;
end $$
delimiter ;
call divisions(10,5);



# OUT PARAMETERS..........

delimiter $$
create procedure gettotalusers(out total int)
begin
select count(*) into total from employees;
end $$
delimiter ;
call gettotalusers(@total);
select @total;


-- INOUT PARAMETERS......

delimiter $$
create procedure DoubleValue(inout num int)
begin
set num=num*2;
end $$
delimiter ;
set @x=5;
call DoubleValue(@x);
select @x;



delimiter $$
create procedure checkeligibility(in age int)
begin
if age>=18 then 
select "eligible";
else 
select "Not eligible";
end if;
end $$
delimiter ;
call checkeligibility(50);


delimiter $$
create procedure addnumbers(in n int,out total int)
begin
declare i int default 1;
set total=0;
while i<=n do
set total=total+i;
set i=i+1;
end while;
end $$
delimiter ;
call addnumbers(5,@total);
select @total;




delimiter $$
create procedure add1(in a int,in b int)
begin
declare result int;
set result=a+b;
select result;
end $$
delimiter ;
call add1(2,3);
                        
						
delimiter $$
create procedure a1(out sal int)
begin
select max(salary) into sal from employees;
end $$
delimiter ;
call a1(@sal1);
select @sal1;

delimiter $$
create procedure add2(inout num int)
begin
declare result int;
set result=(num*2);
select result;
end $$
delimiter ;
set @a=5;
call add2(@a);
select @a;




delimiter $$
create procedure Ab(in a int,out b int)
begin
declare result int;
declare result1 int;
set result=a+5;
-- set result1=a*2;
select result;
end $$
delimiter ;

set @c=6;
call Ab(@c,@b);




delimiter $$
create procedure addition1()
begin
declare result int;
set result=3+4;
select result;
end $$
delimiter ;
call addition1();

delimiter $$
create procedure addition2(in a int,in b int)
begin
declare result int;
set result=a+b;
select result;
end $$
delimiter ;
set @a=5;
set @b=6;
call addition2(@a,@b);



delimiter $$
create procedure addition44(out result int)
begin
declare result int;
set result=2+3;
select result;

end $$
delimiter ;

call addition44(@result);



delimiter $$
create procedure addition5(in a int,out result int)
begin
declare result int;
set result=a*2;
select result;
end $$
delimiter ;
set @a=5;
call addition5(@a,@result);





delimiter $$
create procedure addition66(inout b int)
begin
declare result int;
set result=b*2;
select result;
end $$
delimiter ;
set @c=5;
call addition66(@c);




use hef_shine;

delimiter $$
create procedure checkeligibility1(in age int)
begin
if age>=18 then
    select "Eligible";
else
    select "Not eligible";
end if;
end $$
delimiter ;
set @age=19;
call checkeligibility1(@age);



delimiter $$
create procedure oddeven(in num int)
begin
if mod(num,2)=0 then
    select "even";
else
    select "odd";
end if;
end $$
delimiter ;
set @num=5;
call oddeven(@num);



delimiter $$
create procedure sumuptonnums(in num int,out total int)
begin
declare i int default 1;
set total=0;
while i<=num do
set total=total+i;
set i=i+1;

end while;
select total;
end $$
delimiter ;

call sumuptonnums(10,@total);





delimiter $$
create procedure sumofdigs(in num int,out total int)
begin
declare rem int;
set total=0;

while num>0 do
set rem=mod(num,10);
set total=total+rem;
set num=floor(num/10);                       -- num div 100  
end while;
select total;
end $$
delimiter ;

call sumofdigs(123,@total);

delimiter $$
create procedure AddnewUser(
in username varchar(50),
in userEmail varchar(100)
)
begin
insert into users(name,email)
values(username,userEmail);
end $$
delimiter ;

call  AddnewUser("Alice","alice@example");

use hef_shine;

delimiter $$
create procedure Count_Emp_deptwise()
begin
select d.department_name,count(*)
from employees e inner join
departments d on e.department_id=d.department_id
group by department_name;
end $$
delimiter ;
call Count_Emp_deptwise();




delimiter $$
create function count_emps(dept_name varchar(20))
returns int
deterministic
begin
declare total int;
select count(*) into total from employees e inner join
departments d on e.department_id=d.department_id
where department_name=dept_name;
return total;
end $$

select count_emps("Sales") as TotalCount;




 









