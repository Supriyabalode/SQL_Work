use hef_shine;
delimiter $$
CREATE FUNCTION square(x INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN x * x;
END $$
delimiter ;
SELECT square(5);


delimiter $$
CREATE FUNCTION get_fullname(fname VARCHAR(50), lname VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
 RETURN CONCAT(fname, ' ', lname);
END $$
delimiter ;
SELECT get_fullname('John', 'Doe');


delimiter $$
CREATE FUNCTION is_even(num INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
 RETURN (num % 2=0);
END $$
delimiter ;

SELECT is_even(8);


delimiter $$
CREATE FUNCTION get_age1(birthdate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
 RETURN TIMESTAMPDIFF(YEAR, birthdate, CURDATE());
END $$
delimiter ;
SELECT get_age1('2000-01-01');



-- 5. UDF to calculate simple interest
delimiter $$
CREATE FUNCTION simple_interest(p DECIMAL(10,2), r DECIMAL(5,2), t INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
 RETURN (p * r * t) / 100;
END $$
delimiter ;
select simple_interest(1000,5,3);



delimiter $$
CREATE FUNCTION is_palindrome(str VARCHAR(100))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
 RETURN str = REVERSE(str);
END $$
delimiter ;
SELECT is_palindrome('madam');


delimiter $$
CREATE FUNCTION km_to_miles(km DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
 RETURN km * 0.621371;
END $$
delimiter ;
SELECT km_to_miles(10);



-- UDF to get first letter of a name (capitalized)

delimiter $$
CREATE FUNCTION first_letter(name VARCHAR(50))
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
 RETURN UPPER(LEFT(name, 1));
END $$
delimiter ;
SELECT first_letter('charlie');



-- UDF to calculate factorial
delimiter $$
CREATE FUNCTION factorial(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
 DECLARE result INT DEFAULT 1;
 WHILE n > 1 DO
 SET result = result * n;
 SET n = n - 1;
 END WHILE;
 RETURN result;
END $$
delimiter ;

SELECT factorial(5); 


delimiter $$
create function fact2(a int)
returns int
deterministic
begin
declare res int default 1;
while a>1 do
set res=res*a;
set a=a-1;
end while;
return res;
end $$
delimiter ;


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



-- UDF TO DISPLAY NAME OF EMP WHOSE SALARY IS 4 TH HIGHEST
DELIMITER $$
create function Fsalary()
returns varchar(20)
deterministic
begin
declare n varchar(20);
select first_name into n from employees
order by salary desc
limit 1
offset 3;
return n;
end $$
delimiter ;
select Fsalary();
select * from employees order by salary desc;


select first_name,salary from employees where salary=(select max(salary) from employees);

select first_name from employees where salary=(select max(salary) from employees 
where salary<(select max(salary) from employees));








