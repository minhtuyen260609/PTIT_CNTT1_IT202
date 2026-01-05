CREATE DATABASE session_join_bai4;
USE session_join_bai4;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1,'Laptop',20000000),
(2,'Smartphone',10000000),
(3,'Tablet',8000000),
(4,'Headphone',2000000),
(5,'Keyboard',1500000);

INSERT INTO orders (order_id, order_date) VALUES
(101,'2024-04-01'),
(102,'2024-04-02'),
(103,'2024-04-03'),
(104,'2024-04-04'),
(105,'2024-04-05');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101,1,1),
(101,4,2),
(102,2,1),
(103,3,2),
(104,1,1),
(105,2,2),
(105,5,3);

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity * p.price) > 5000000;
