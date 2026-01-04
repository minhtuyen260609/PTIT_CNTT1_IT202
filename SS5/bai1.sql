CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(255),
price DECIMAL(10,2),
stock INT,
status ENUM('active','inactive')
);


INSERT INTO products VALUES
(1,'Laptop Dell',15000000,10,'active'),
(2,'Chuột không dây',300000,50,'active'),
(3,'Bàn phím cơ',1200000,20,'active'),
(4,'Tai nghe',800000,15,'inactive'),
(5,'Màn hình LG',3500000,8,'active');

SELECT * FROM products;

SELECT * FROM products WHERE status='active';

SELECT * FROM products WHERE price>1000000;

SELECT * FROM products WHERE status='active' ORDER BY price ASC;
