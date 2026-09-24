use db;
select * from student;

start transaction;
insert into student(name,roll) values ("s", 4);
commit;

start transaction;
rollback;

begin ;
insert into student(name,roll) values ("x", 10);
rollback ;
begin ;
insert into student(name,roll) values ("x", 10);
rollback;

begin ;
delete from student;
rollback;

create table emp(id int,name varchar(10),salary int,city varchar(10));
insert into emp values (101,"ram",10000,"pune"),(102,"sham",20000,"nagar"),(103,"varad",30000,"nashik");
select * from emp;
begin;
update emp
set salary=50000 where id=101;
rollback;


begin ;
insert into emp values (104,"ram",10000,"pune");
begin ;
rollback;

select * from student;
begin;
update student set roll=20 where name="abc";
commit;
