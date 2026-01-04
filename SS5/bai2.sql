CREATE DATABASE customer_management;
USE customer_management;

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
full_name VARCHAR(255),
email VARCHAR(255),
city VARCHAR(255),
status ENUM('active','inactive')
);

INSERT INTO customers VALUES
(1,'Nguyen Minh Tuan','tuan@gmail.com','TP.HCM','active'),
(2,'Tran Hoai Nam','nam@gmail.com','Ha Noi','inactive'),
(3,'Le Thu Trang','trang@gmail.com','Ha Noi','active'),
(4,'Pham Quoc Huy','huy@gmail.com','Da Nang','active'),
(5,'Vo Thi Lan','lan@gmail.com','TP.HCM','inactive');

SELECT * FROM customers;

SELECT * FROM customers WHERE city='TP.HCM';

SELECT * FROM customers WHERE status='active' AND city='Ha Noi';

SELECT * FROM customers ORDER BY full_name ASC;
