CREATE DATABASE session6_bai2;
USE session6_bai2;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending','completed','cancelled'),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1,'Nguyen Van An','Hanoi'),
(2,'Tran Thi Binh','HCM'),
(3,'Le Van Cuong','Hanoi'),
(4,'Pham Thi Dung','Danang'),
(5,'Hoang Van Em','HCM');

INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(101,1,'2024-01-10','completed',1500000),
(102,1,'2024-01-15','pending',800000),
(103,2,'2024-02-01','completed',2300000),
(104,3,'2024-02-05','cancelled',1200000),
(105,3,'2024-03-01','completed',3100000);

SELECT
    c.customer_id,
    c.full_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT
    c.customer_id,
    c.full_name,
    MAX(o.total_amount) AS max_order_value
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT
    c.customer_id,
    c.full_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_spent DESC;
