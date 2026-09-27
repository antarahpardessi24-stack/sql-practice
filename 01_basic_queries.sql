CREATE DATABASE sql_practice;
-- PostgreSQL

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1,'Aarav','Data',65000,'2022-01-15','Pune'),
(2,'Diya','HR',52000,'2021-06-10','Mumbai'),
(3,'Rohan','IT',72000,'2020-03-20','Pune'),
(4,'Meera','Finance',68000,'2023-02-01','Delhi'),
(5,'Kabir','Data',75000,'2019-11-12','Mumbai'),
(6,'Anaya','IT',58000,'2024-01-08','Pune'),
(7,'Vihaan','HR',48000,'2022-08-19','Delhi'),
(8,'Sara','Finance',62000,'2021-12-05','Mumbai'),
(9,'Arjun','Data',81000,'2018-07-25','Delhi'),
(10,'Isha','IT',70000,'2023-09-14','Pune');

-- Q1. Display all employees.
SELECT * FROM employees;

-- Q2. Display employee names and salaries.
SELECT employee_name, salary
FROM employees;

-- Q3. Display employees earning more than 60000.
SELECT *
FROM employees
WHERE salary > 60000;

-- Q4. Display employees from Pune.
SELECT *
FROM employees
WHERE city = 'Pune';

-- Q5. Display employees hired after 2022-01-01.
SELECT *
FROM employees
WHERE hire_date > '2022-01-01';

-- Q6. Display employees earning between 55000 and 75000.
SELECT *
FROM employees
WHERE salary BETWEEN 55000 AND 75000;

-- Q7. Display employees from Data or IT departments.
SELECT *
FROM employees
WHERE department IN ('Data','IT');

-- Q8. Display employees whose names start with A.
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- Q9. Display employees ordered by salary from highest to lowest.
SELECT *
FROM employees
ORDER BY salary DESC;

-- Q10. Display the five highest-paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
