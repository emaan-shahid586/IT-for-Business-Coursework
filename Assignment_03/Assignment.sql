-- =====================================================
-- SQL Assignment 3 - CS-103 IT for Business
-- MySQL Workbench 8.0 CE Compatible Script
-- =====================================================

-- SECTION A - Database Setup
-- -----------------------------------------------------
-- Task 1: Create Database
DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Task 2: Create Table
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
city VARCHAR(50)
);

-- Task 3: Insert Data
INSERT INTO employees(emp_id, emp_name, department, salary, city) VALUES
(1, 'Alice Johnson', 'IT', 78000, 'New York'),
(2, 'Bob Smith', 'HR', 45000, 'Los Angeles'),
(3, 'Carol Davis', 'Sales', 62000, 'Chicago'),
(4, 'David Wilson', 'IT', 89000, 'Houston'),
(5, 'Emma Thompson', 'HR', 55000, 'Phoenix'),
(6, 'Frank Miller', 'Sales', 39000, 'Philadelphia'),
(7, 'Grace Lee', 'IT', 71000, 'San Diego'),
(8, 'Henry Clark', 'HR', 49000, 'Dallas'),
(9, 'Ivy Adams', 'Sales', 93000, 'Austin'),
(10, 'Jack White', 'IT', 66000, 'San Jose'),
(11, 'Katherine Green', 'Sales', 52000, 'New York'),
(12, 'Liam Brown', 'HR', 84000, 'Seattle');

-- =====================================================
-- SECTION B - Basic Queries 
-- -----------------------------------------------------
-- 1. Display all records
SELECT * FROM employees;

-- 2. Show only emp_name and salary
SELECT emp_name, salary FROM employees;

-- 3. Display unique departments
SELECT DISTINCT department FROM employees;

-- ==================================================
-- SECTION C - Filtering
-- --------------------------------------------------
-- 4. Employees with salary > 50,000
SELECT * FROM employees WHERE salary > 50000;

-- 5. Employees from a specific department (IT)
SELECT * FROM employees WHERE department = 'IT';

-- 6. Employees with salary between two values (40,000 and 70,000)
SELECT * FROM employees WHERE salary BETWEEN 40000 AND 70000;

-- ==================================================
-- SECTIION D - Logical Operators
-- --------------------------------------------------
-- 7. Employees form a department and salary > value (IT and salary > 70,0000)
SELECT * FROM employees WHERE department = 'IT' AND salary > 70000;

-- 8. Employees from two different departments (OR condition) (HR or sales)
SELECT * FROM employees WHERE department = 'HR' OR department = 'sales';

-- ==================================================
-- SECTION E - Pattern Matching
-- --------------------------------------------------
-- 9. Names starting with a letter (A)
SELECT * FROM employees WHERE emp_name LIKE 'A%';

-- 10. Names containing a specific character (e)
SELECT * FROM employees WHERE emp_name LIKE '%E%';

-- ==================================================
-- SECTION F - Aggregation
-- --------------------------------------------------
-- 11. Count employees per department
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;

-- 12. Average salary per department
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department;

-- ==================================================
-- SECTION G - Sorting
-- 13. Sort by salary (highest first)
SELECT * FROM employees ORDER BY salary DESC;

-- 14. Sort by name (A-Z)
SELECT * FROM employees ORDER BY emp_name ASC;

-- ==================================================
-- BONUS 
-- --------------------------------------------------
-- 15. Highest salary in each department
SELECT department, MAX(salary) AS highest_salary FROM employees GROUP BY department;

-- 16. Top 3 highest-paid employees
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;











