create database Session07_bai2;
use Session07_bai2;
create table products(
id int primary key,
name varchar(100),
price decimal(10,2)
);

create table order_items(
order_id int,
product_id int,
quantity int
);

insert into products values
(1,'laptop',15000000),
(2,'mouse',200000),
(3,'keyboard',500000),
(4,'monitor',3000000),
(5,'headphone',800000),
(6,'usb',150000),
(7,'printer',4500000);

insert into order_items values
(1,1,1),
(1,2,2),
(2,3,1),
(3,1,1),
(3,5,1),
(4,4,2),
(5,6,3);

select * from products
where id in ( select product_id from order_items );
