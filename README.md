


## 🛠️ Technologies Used

* **Database:** MySQL
* **Language:** SQL
* **Tool:** MySQL Workbench
* **Version Control:** Git & GitHub



## 🗄️ Database Concepts Covered

### 1. Table Creation

Created tables to store employee-related information and establish relationships between different entities.

Examples of concepts:

* `CREATE DATABASE`
* `CREATE TABLE`
* Primary Keys
* Foreign Keys
* Constraints
* Data Types

---

### 2. Data Manipulation

Used SQL commands to insert and modify employee data.

```sql
INSERT
UPDATE
DELETE
SELECT
```

---

### 3. Aggregation

Used aggregate functions to analyze employee data.

Examples:

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

Combined with:

```sql
GROUP BY
HAVING
ORDER BY


---

### 4. Joins

Implemented different types of SQL joins to combine information from multiple tables.

Covered:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* SELF JOIN

Example use cases:

* Employees with their department details
* Employees and managers
* Department-wise employee information

---

### 5. Subqueries

Used subqueries to solve analytical problems involving nested queries.

Examples include:

* Employees earning more than the average salary
* Employees with the highest salary
* Comparing employee salary with department averages

---

### 6. Common Table Expressions (CTEs)

Used **CTEs** to make complex queries easier to read and maintain.

```sql
WITH employee_data AS (
    SELECT ...
)
SELECT *
FROM employee_data;
```

CTEs were used for multi-step employee analysis and filtering.

---

### 7. SQL Functions

Created and used SQL functions for reusable calculations and data processing.

Functions can be used to:

* Perform calculations
* Format values
* Return derived results
* Simplify repeated logic

---

### 8. Indexes

Created indexes to improve query performance.

```sql
CREATE INDEX index_name
ON table_name(column_name);
```

Indexes were explored for frequently searched or filtered columns.

---

### 9. Views

Created SQL views to simplify complex queries and provide reusable datasets.

```sql
CREATE VIEW employee_view AS
SELECT ...
FROM employees;
```

Views can be useful for:

* Reporting
* Reusable analysis
* Simplifying complex queries
* Providing controlled access to data

---

### 10. Stored Procedures

Created stored procedures to execute reusable SQL operations.

```sql
CREATE PROCEDURE procedure_name()
BEGIN
    SELECT ...
END;
```

Stored procedures were used to organize and reuse SQL logic.

---

### 11. Transactions

Practiced SQL transactions to understand data consistency and controlled execution.

Concepts covered:

```sql
START TRANSACTION;
COMMIT;
ROLLBACK;
```

Transactions help ensure that related database operations are completed safely.

---

### 12. Triggers

Implemented triggers to automatically execute actions when specific database events occur.

Examples:

```sql
AFTER INSERT
AFTER UPDATE
BEFORE DELETE
```
Triggers were used to understand automated database operations and data auditing concepts.



## 💡 Key SQL Skills Demonstrated

* SQL Data Definition Language (DDL)
* SQL Data Manipulation Language (DML)
* SELECT queries
* Filtering and sorting
* Aggregate functions
* GROUP BY and HAVING
* Joins
* Subqueries
* CTEs
* SQL Functions
* Indexes
* Views
* Stored Procedures
* Transactions
* Triggers
* Database constraints
* Relational database concepts

---

## ▶️ How to Run the Project

### Step 1: Install MySQL

Install **MySQL Server** and **MySQL Workbench**.

### Step 2: Create the Database

Open MySQL Workbench and execute the database/table creation script.

```sql
CREATE DATABASE Database_Name
USE Database_Name;
```

### Step 3: Execute the SQL Files

Run the SQL scripts in the appropriate order:

```text
1. Table Creation
2. Data Insertion
3. Aggregation
4. Joins
5. Subqueries
6. CTE
7. Functions
8. Indexes
9. Views
10. Stored Procedures
11. Transactions
12. Triggers


It strengthened my understanding of:

* Writing analytical SQL queries
* Working with multiple related tables
* Solving business questions using SQL
* Optimizing queries with indexes
* Creating reusable database objects
* Implementing database automation using triggers and procedures

---


## ⭐ Skills Demonstrated

```text
MySQL
SQL
Data Analysis
Database Management
Data Cleaning
Data Aggregation
Joins
CTEs
Subqueries
Views
Indexes
Stored Procedures
Functions
Transactions
Triggers
```
