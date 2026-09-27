DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES
(1,'Aarav','Data',65000,'2022-01-15'),
(2,'Diya','HR',52000,'2021-06-10'),
(3,'Rohan','IT',72000,'2020-03-20'),
(4,'Meera','Finance',68000,'2023-02-01'),
(5,'Kabir','Data',75000,'2019-11-12'),
(6,'Anaya','IT',58000,'2024-01-08'),
(7,'Vihaan','HR',48000,'2022-08-19'),
(8,'Sara','Finance',62000,'2021-12-05'),
(9,'Arjun','Data',81000,'2018-07-25'),
(10,'Isha','IT',70000,'2023-09-14');

-- Q1. Rank all employees by salary.
SELECT employee_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q2. Rank employees within each department by salary.
SELECT employee_name, department, salary,
       RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS department_rank
FROM employees;

-- Q3. Assign a row number to employees ordered by salary.
SELECT employee_name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- Q4. Find the average salary of each employee's department alongside their salary.
SELECT employee_name, department, salary,
       AVG(salary) OVER (
           PARTITION BY department
       ) AS department_average_salary
FROM employees;

-- Q5. Calculate the difference between employee salary and department average.
SELECT employee_name, department, salary,
       salary - AVG(salary) OVER (
           PARTITION BY department
       ) AS difference_from_department_average
FROM employees;

-- Q6. Find the highest-paid employee in each department.
SELECT employee_name, department, salary
FROM (
    SELECT employee_name, department, salary,
           ROW_NUMBER() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
) ranked
WHERE rn = 1;

-- Q7. Find the second-highest-paid employee in each department.
SELECT employee_name, department, salary
FROM (
    SELECT employee_name, department, salary,
           DENSE_RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
) ranked
WHERE salary_rank = 2;

-- Q8. Calculate running average salary ordered by hire date.
SELECT employee_name, hire_date, salary,
       AVG(salary) OVER (
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_average_salary
FROM employees;

-- Q9. Compare each employee's salary with the previous employee's salary.
SELECT employee_name, salary,
       LAG(salary) OVER (
           ORDER BY salary
       ) AS previous_salary
FROM employees;

-- Q10. Compare each employee's salary with the next employee's salary.
SELECT employee_name, salary,
       LEAD(salary) OVER (
           ORDER BY salary
       ) AS next_salary
FROM employees;
