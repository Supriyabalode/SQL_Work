-- view - temporary table contain data like real table
-- simple view-->   doesnt store data physically, it store query. when we query a view , sql query is executed
-- when we drop base table simple view doesnt exist
-- created using only one table.

-- complex view --> created using multiple table 

-- materialized view--> does not support in mysql
-- it contain data physically, when we drop base table materialized view still exist...  



create database hefshine1;
use hefshine1;

create table student(id int primary key,
roll int,
name varchar(20),
city varchar(20)
);
insert into student values(1,10,"supriya","nagar"),
(2,21,"zeenat","satara"),
(3,22,"ram","pune");
select * from student;

create view std as
select * from student where city="pune";
select * from std;

create view stdinfo as
select id,name from student where roll>20;
select * from stdinfo;
describe stdinfo;


create table employee(id int primary key,
salary int,
name varchar(20),
city varchar(20)
);
insert into employee values(1,10000,"varad","nagar"),
(2,21000,"shyam","mumbai"),
(3,22000,"ram","pune");
select * from employee;

create view emp as
select * from employee;

select * from emp;

create view employee1 as
select * from employee ;



CREATE TABLE Cust (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);

INSERT INTO Cust(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
(6, 'Bottom-Dollar Marketse', 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada'),
(7, 'Brazilian Exporters', 'Carlos Souza', 'Rua do Comércio 45', 'Rio de Janeiro', '20000-000', 'Brazil'),
(8, 'Central do Brasil', 'Fernanda Lima', 'Avenida Paulista, 1234', 'São Paulo', '01310-100', 'Brazil'),
(9, 'Casa do Café', 'João Pereira', 'Rua das Flores, 321', 'Belo Horizonte', '30130-010', 'Brazil'),
(10, 'Delícias Tropicais', 'Luciana Costa', 'Avenida Atlântica, 456', 'Rio de Janeiro', '22010-000', 'Brazil'),
(11, 'Panificadora Pão Quente', 'Marcos Dias', 'Rua do Pão, 77', 'Curitiba', '80010-050', 'Brazil'),
(12, 'Exportadora Amazon', 'Rita Silva', 'Rua Manaus, 89', 'Manaus', '69000-000', 'Brazil'),
(13, 'Nordic Goods AB', 'Petra Karlsson', 'Södergatan 12', 'Stockholm', '111 23', 'Sweden'),
(14, 'Tokyo Trading Co.', 'Akira Yamamoto', 'Chuo-ku, 3-14-5', 'Tokyo', '104-0061', 'Japan'),
(15, 'Pasta Bella', 'Giovanni Rossi', 'Via Roma 22', 'Milan', '20100',"Italy");

create view brazil_customers as
select * from Cust where country="Brazil";

select * from brazil_customers;

create view ViewDemos as
select customerName,contactname,city
from Cust
where city="Berlin";

select * from ViewDemos;

create or replace view View1 as
select customerName,contactname,city,Country
from Cust
where city="Berlin";

select * from view1;

drop view View1 ;

create view View2 as
select employee_id,department_id
from employees,department;
select * from View2;

use hef_shine;

 













