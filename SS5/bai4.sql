CREATE DATABASE product_management;
USE product_management;

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(255),
price DECIMAL(10,2),
stock INT,
sold_quantity INT,
status ENUM('active','inactive')
);

INSERT INTO products VALUES
(1,'Laptop Dell',15000000,10,120,'active'),
(2,'Laptop HP',14000000,8,95,'active'),
(3,'Chuột Logitech',350000,50,300,'active'),
(4,'Bàn phím cơ',1200000,30,220,'active'),
(5,'Tai nghe Sony',1800000,25,180,'active'),
(6,'Màn hình LG',3500000,12,160,'active'),
(7,'USB 64GB',250000,100,400,'active'),
(8,'Ổ cứng SSD',2500000,20,140,'active'),
(9,'Webcam',900000,15,110,'active'),
(10,'Loa Bluetooth',1300000,18,200,'active'),
(11,'Sạc dự phòng',700000,40,260,'active'),
(12,'Router Wifi',2200000,10,90,'active');

SELECT * FROM products ORDER BY sold_quantity DESC LIMIT 10;

SELECT * FROM products ORDER BY sold_quantity DESC LIMIT 5 OFFSET 10;

SELECT * FROM products WHERE price<2000000 ORDER BY sold_quantity DESC;
