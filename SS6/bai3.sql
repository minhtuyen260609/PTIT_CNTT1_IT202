CREATE DATABASE session6_bai3;
USE session6_bai3;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    status ENUM('pending','completed','cancelled'),
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, order_date, status, total_amount) VALUES
(1,'2024-03-01','completed',5000000),
(2,'2024-03-01','completed',7000000),
(3,'2024-03-02','completed',3000000),
(4,'2024-03-02','completed',9000000),
(5,'2024-03-03','completed',15000000),
(6,'2024-03-03','completed',2000000);

SELECT
    order_date,
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'completed'
GROUP BY order_date;

SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM orders
WHERE status = 'completed'
GROUP BY order_date;

SELECT
    order_date,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders
WHERE status = 'completed'
GROUP BY order_date
HAVING SUM(total_amount) > 10000000;
