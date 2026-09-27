DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    salesperson VARCHAR(100),
    region VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    unit_price NUMERIC(10,2),
    sale_date DATE
);

INSERT INTO sales VALUES
(1,'Aarav','West','Laptop',2,60000,'2026-01-10'),
(2,'Diya','West','Phone',5,25000,'2026-01-12'),
(3,'Rohan','North','Laptop',1,60000,'2026-01-15'),
(4,'Meera','South','Tablet',4,30000,'2026-01-18'),
(5,'Kabir','West','Laptop',3,60000,'2026-02-02'),
(6,'Anaya','North','Phone',2,25000,'2026-02-08'),
(7,'Vihaan','South','Phone',6,25000,'2026-02-12'),
(8,'Sara','West','Tablet',3,30000,'2026-02-20'),
(9,'Arjun','North','Laptop',2,60000,'2026-03-05'),
(10,'Isha','South','Laptop',1,60000,'2026-03-11');

-- Q1. Find total quantity sold.
SELECT SUM(quantity) AS total_quantity
FROM sales;

-- Q2. Find total sales revenue.
SELECT SUM(quantity * unit_price) AS total_revenue
FROM sales;

-- Q3. Find average unit price.
SELECT AVG(unit_price) AS average_unit_price
FROM sales;

-- Q4. Find total revenue by region.
SELECT region, SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY region;

-- Q5. Find total quantity sold by product.
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;

-- Q6. Find average revenue per sale by salesperson.
SELECT salesperson,
       AVG(quantity * unit_price) AS average_sale_value
FROM sales
GROUP BY salesperson;

-- Q7. Find regions with total revenue greater than 200000.
SELECT region, SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY region
HAVING SUM(quantity * unit_price) > 200000;

-- Q8. Find products with total quantity greater than 5.
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
HAVING SUM(quantity) > 5;

-- Q9. Find the highest-value sale in each region.
SELECT region, MAX(quantity * unit_price) AS highest_sale_value
FROM sales
GROUP BY region;

-- Q10. Find monthly revenue.
SELECT DATE_TRUNC('month', sale_date) AS month,
       SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;
