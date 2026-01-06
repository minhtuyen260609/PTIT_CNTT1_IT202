create database Session07_bai1;
use Session07_bai1;
create table customers(
id int primary key,
name varchar(100),
email varchar(100)
);

create table orders(
id int primary key,
customer_id int,
order_date date,
total_amount decimal(10,2)
);

insert into customers values
(1,'nguyen van a','a@gmail.com'),
(2,'tran thi b','b@gmail.com'),
(3,'le van c','c@gmail.com'),
(4,'pham thi d','d@gmail.com'),
(5,'hoang van e','e@gmail.com'),
(6,'do thi f','f@gmail.com'),
(7,'vu van g','g@gmail.com');

insert into orders values
(1,1,'2024-01-05',1200000),
(2,2,'2024-01-10',850000),
(3,1,'2024-02-01',430000),
(4,3,'2024-02-15',990000),
(5,5,'2024-03-01',1500000),
(6,2,'2024-03-10',670000),
(7,6,'2024-03-20',300000);

select * from customers
where id in ( select customer_id from orders );
