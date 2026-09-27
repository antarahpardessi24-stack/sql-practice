DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary NUMERIC(10,2)
);

INSERT INTO departments VALUES
(1,'Data','Pune'),
(2,'IT','Mumbai'),
(3,'HR','Delhi'),
(4,'Finance','Pune');

INSERT INTO employees VALUES
(1,'Aarav',1,65000),
(2,'Diya',3,52000),
(3,'Rohan',2,72000),
(4,'Meera',4,68000),
(5,'Kabir',1,75000),
(6,'Anaya',2,58000),
(7,'Vihaan',3,48000),
(8,'Sara',4,62000),
(9,'Arjun',1,81000),
(10,'Isha',2,70000);

-- Q1. Display employees with their department names.
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Q2. Display employee name, department and location.
SELECT e.employee_name, d.department_name, d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- Q3. Display employees working in the Data department.
SELECT e.employee_name, e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Data';

-- Q4. Display employees working in departments located in Pune.
SELECT e.employee_name, d.department_name, d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.location = 'Pune';

-- Q5. Display all departments and their employees.
SELECT d.department_name, e.employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
ORDER BY d.department_name;

-- Q6. Display departments that have no employees.
SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Q7. Display employee names and salaries for Data and IT departments.
SELECT e.employee_name, e.salary, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name IN ('Data','IT');

-- Q8. Find the average salary for each department.
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Q9. Find the highest salary in each department.
SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Q10. Count employees in each department.
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
