use hefshine;
create table emp1(id int,name varchar(20),salary int);
delimiter $$
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON emp1
FOR EACH ROW
BEGIN
   IF NEW.salary < 0 THEN
      SET NEW.salary = 0;
   END IF;
END $$
delimiter ;

select * from emp1;


insert into emp1 values(3,"ram",-4);
select * from emp1;


delimiter $$
create trigger Abc
before insert on emp
for each row
begin
if new.salary<0 then
set new.salary=0;
end if; 
end $$
delimiter ;
insert into emp values(3,"ram",-4);
select * from emp;



CREATE TABLE empl (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(100),
    salary int
); 

CREATE TABLE audit_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    action VARCHAR(50),
    action_time DATETIME
);

delimiter $$
CREATE TRIGGER after_empl_insert
AFTER INSERT ON empl
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (employee_id, action, action_time)
    VALUES (NEW.employee_id, 'INSERT', NOW());
END $$
delimiter ;

INSERT INTO empl(employee_id,name, position, salary)
VALUES (3,'John Doe', 'Software Engineer', 75000.00);
select * from empl;
select * from audit_log;



-- 2. Q: How can you prevent inserting employees into a non-existing department

create table emp2(department_id int,name varchar(20));


delimiter $$
CREATE TRIGGER check_department_exists
BEFORE INSERT ON emp2
FOR EACH ROW
BEGIN
IF NOT EXISTS (SELECT 1 FROM departments WHERE DEPARTMENT_ID =
NEW.DEPARTMENT_ID) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid department ID';
END IF;
end $$
delimiter ;



delimiter $$
CREATE TRIGGER check_department_exists
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
IF NOT EXISTS (SELECT 1 FROM departments WHERE DEPARTMENT_ID =
NEW.DEPARTMENT_ID) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid department ID';
END IF;
END $$
delimiter ;



use hef_shine;
create table empl(id int,name varchar(20),salary int);

delimiter $$
create trigger before_insert
before insert on empl
for each row
begin
if new.salary<0 then
    set new.salary=0;
end if;
end $$
delimiter ;


insert into empl values(101,"John",-20000);
select * from empl;

create table emp_audit(emp_id int,action_type varchar(20),action_date varchar(30));

delimiter $$
create trigger after_insert
after insert
on empl
for each row
begin
 insert into emp_audit values(new.id,"Insert",now());
end $$
delimiter ;

insert into empl values(103,"Ram",30000);
select * from emp_audit;

create table empl_changes(emp_id int,
 old_salary decimal(10,2),
 new_salary decimal(10,2),
 changed_on varchar(30)
 );
 
 delimiter $$
 create trigger before_employee_updates
 before update 
 on empl
 for each row
 begin
 insert into empl_changes values(old.id,old.salary,new.salary,now());
 end $$
 delimiter ;
 

 
 
 delimiter $$
 create trigger after_employee_updates
 after update 
 on empl
 for each row
 begin
 insert into empl_changes values(old.id,old.salary,new.salary,now());
 end $$
 delimiter ;
 
 update empl set salary=10000 where name="Ram";
 select * from empl_changes;
 
 
 
 
 
 
 
 

 update empl
 set salary=30000
 where name="John";
 select * from empl_changes;
 use hef_shine;

create table deleted_emp(emp_id int,name varchar(20),deleted_at varchar(20));

delimiter $$
create trigger After_delete
after delete
on empl
for each row
begin
insert into deleted_emp values(old.id,old.name,now());
end $$
delimiter ;
select * from empl;
delete from empl where name="John";

select * from deleted_emp;

delimiter $$
create trigger salary_check_before_insert
before insert on empl
for each row
begin
if new.salary > 40000 then
signal sqlstate "45000" set message_text="salary exceeds limit";
end if ;
end $$
delimiter ;

insert into empl values(104,"Lisa",80000);


use hef_shine;
create table tb(employee_id int);
 
delimiter $$
create trigger after_update
after update on employees
for each row
begin
     insert into tb values(old.employee_id);
end $$
delimiter ;

update employees
set employee_id=10000
where employee_id=100;

select * from tb;








select employee_id from employees;




















