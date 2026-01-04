CREATE DATABASE order_management;
USE order_management;

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
total_amount DECIMAL(10,2),
order_date DATE,
status ENUM('pending','completed','cancelled')
);

INSERT INTO orders VALUES
(1,101,3200000,'2024-12-01','completed'),
(2,102,7800000,'2024-12-03','pending'),
(3,103,15000000,'2024-12-05','completed'),
(4,104,4500000,'2024-12-07','cancelled'),
(5,105,6200000,'2024-12-10','completed'),
(6,106,9800000,'2024-12-12','completed'),
(7,107,2100000,'2024-12-15','pending');

SELECT * FROM orders WHERE status='completed';

SELECT * FROM orders WHERE total_amount>5000000;

SELECT * FROM orders ORDER BY order_date DESC LIMIT 5;

SELECT * FROM orders WHERE status='completed' ORDER BY total_amount DESC;
