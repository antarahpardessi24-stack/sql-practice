DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);

INSERT INTO employees VALUES
(1,'Aarav','Data',65000),
(2,'Diya','HR',52000),
(3,'Rohan','IT',72000),
(4,'Meera','Finance',68000),
(5,'Kabir','Data',75000),
(6,'Anaya','IT',58000),
(7,'Vihaan','HR',48000),
(8,'Sara','Finance',62000),
(9,'Arjun','Data',81000),
(10,'Isha','IT',70000);

-- Q1. Find employees earning more than the overall average salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Q2. Find the employee with the highest salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Q3. Find the employee with the lowest salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- Q4. Find employees earning more than the average Data department salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = 'Data'
);

-- Q5. Find employees belonging to departments whose average salary is above 60000.
SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 60000
);

-- Q6. Find the second-highest salary.
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- Q7. Find employees earning the same salary as someone in the IT department.
SELECT *
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    WHERE department = 'IT'
);

-- Q8. Find employees who earn more than every HR employee.
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);

-- Q9. Find departments that have at least one employee earning above 70000.
SELECT DISTINCT department
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.department = e.department
      AND e2.salary > 70000
);

-- Q10. Find the highest-paid employee in each department.
SELECT e.*
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);
