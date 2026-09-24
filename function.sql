SELECT CONCAT('Hello', ' ', 'World');
select length("mysql");
SELECT LENGTH('MySQL'); 
SELECT CHAR_LENGTH('MySQL');
SELECT UPPER('mysql'), LOWER('MYSQL'); 
SELECT SUBSTRING('Hello World', 7, 5);
SELECT TRIM(' MySQL '); 
SELECT ROUND(12.3456, 2); 
SELECT CEIL(12.9);
SELECT FLOOR(12.3);
SELECT ABS(-50);
SELECT MOD(10, 3);


SELECT CURDATE(); 
SELECT CURTIME();
SELECT DATE_ADD('2025-04-01', INTERVAL 10 DAY);
SELECT DATEDIFF('2025-04-15', '2025-04-01'); 
SELECT MONTH('2025-04-15'), YEAR('2025-04-15'); 



-- user defined function...
-- syntax:
-- create function function_name(parameter datatype)
-- returns datatype
-- deterministic/non deterministic
-- begin
-- function logic
-- return value;
-- end


delimiter $$
create function get_disc(price decimal(10,2),discount int)
returns decimal(10,2)
deterministic
begin
declare discount_price decimal(10,2);
set discount_price=price-(price*discount/100);
return discount_price;
end $$
delimiter ;
select get_disc(1000,10); 



delimiter $$
create function secondmax()
returns int
deterministic
begin 
declare sal int;
select salary into sal from employees
order by salary desc
limit 1
offset 1;
return sal;
end $$
delimiter ;
select secondmax();



delimiter $$
create function secmaxn()
returns int
deterministic
begin
declare sal int;
select salary into sal
from employees
order by salary desc
limit 1
offset 1;
return sal;
end $$
delimiter ;
select secmaxn();





use hef_shine;
delimiter $$
create function highsal(dept_id int)
returns int
deterministic
begin
declare maxsal int;
select max(salary) into maxsal from employees
where department_id=dept_id;
return maxsal;
end $$
delimiter ;
select highsal(90);




-- 1. UDF to calculate the square of a number
delimiter $$
CREATE FUNCTION square(x INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN x * x;
END $$
delimiter ;
select square(5);





delimiter $$
create function fun()
returns int
deterministic
begin
declare result int;
set result=2+4;
return result;
end $$
delimiter ;
select fun();




delimiter $$
create function addition(a int,b int)
returns int
deterministic
begin
declare result int;
set result=a*b;
return result;
end $$
delimiter ;

set @a=2;
set @b=3;
select addition(@a,@b);

delimiter $$
create function findmax(a int,b int)
returns int
deterministic
begin
declare z int;
if a>b then
set z=a;
else
set z=b;
return z;
end if;
end $$
delimiter ;
select findmax(5,10);

delimiter $$
create function countCustomer1()
returns int
deterministic
begin
declare cnt int;
select count(*) from employees into cnt;
return cnt;
end$$
delimiter ;

select countcustomer1();
use hef_shine;
select * from employees;


delimiter $$
create function fact(x int)
returns int 
deterministic
begin
declare f int;
set f= x*fact(x-1);
return f;
end $$;
delimiter ;
select fact(5); 



delimiter $$
create function facttttt(x int)
returns int
deterministic
begin
declare y int default 1;
while x>1 do
set y=y*x;
set x= x-1;
end while;
return y;
end $$ 
delimiter ;
select facttttt(5);


use hef_shine;
delimiter $$
CREATE FUNCTION random_number()
RETURNS FLOAT
NOT DETERMINISTIC
NO SQL
BEGIN
    RETURN RAND() ;
END $$
delimiter ;
SELECT random_number();


delimiter $$
CREATE FUNCTION timen()
RETURNS datetime
NOT DETERMINISTIC
NO SQL
BEGIN
    RETURN NOW() ;
END $$
delimiter ;
SELECT timen();


-- udf to calculate square of number.
use hef_shine;
delimiter $$
create function sq(num int)
returns int
deterministic
begin
return num*num;
end $$
delimiter ;
select sq(5);

-- udf to return full name.
delimiter $$
create function fullname()
returns varchar(20)
deterministic
begin
declare n varchar(20);
select concat(first_name," ",last_name) from employees into n;
return n;
end $$
delimiter ;
select fullname()


-- udf to check if a number is even or odd

delimiter $$
create function evenoddd(num int)
returns varchar(100)
deterministic
begin
if mod(num,2)=0 then
return "Even";
else
return "Odd";
end if;
end $$
delimiter ;
select evenoddd(5);

-- UDF to get age from birthdate..

delimiter $$
create function getages(d date)
returns int
deterministic
begin
    return timestampdiff(year,d,curdate());
end $$
delimiter ;

select getages("2000-01-01");


-- UDF TO CALCULATE SIMPLE INTEREST.

delimiter $$
create function simpleInterest(p int ,r int,t int)
returns float
deterministic
begin

return (p*r*t)/100;
end $$
delimiter ;
select simpleInterest(10000,8,1);

select datediff("2025-02-02","2003-05-12");


-- UDF TO CHECK IF A STRING IS PALINDROME..
delimiter $$
create function is_palindromes(str varchar(100))
returns varchar(20)
deterministic
begin
if str=reverse(str) then
return "Palindrome";
else
return "Not Palindrome";
end if ;
end $$
delimiter ;
select is_palindromes("abc");

-- UDF TO MASK A PHONE NUMBER (E.G, 1234567890 -> ******7890)

DELIMITER $$
create function mask_phone(phone varchar(20))
returns varchar(20)
deterministic
begin
return concat(repeat("*",length(phone)-4),right(phone,4));
end $$
delimiter ;
select mask_phone("1234567890");



delimiter $$
create function ph(phone varchar(20))
returns varchar(20)
deterministic
begin
return concat(repeat("*",length(phone)-4),right(phone,4));
end $$
delimiter ;

select ph("1234567890") as mask;



#   ranking fuctions  .........

select *,rank() over(partition by department_id order by salary asc) as ranks from employees;

select *,dense_rank() over(partition by department_id order by salary asc) as ranks from employees;

select *,row_number() over(order by salary) from employees;

select *,rank() over(partition by department_id order by salary asc) as ranks from employees;


select *,count(*) over(partition by department_id) as count from employees;




create table Demo(id int,name varchar(30),salary int);
insert into Demo values(1,"Ram",20000),(2,"sham",20000),(3,"seeta",34000),(4,"Geeta",78000);
select * from Demo;




















