create database Session07_bai3;
use Session07_bai3;
create table orders(
id int primary key,
customer_id int,
order_date date,
total_amount decimal(10,2)
);

insert into orders values
(1,1,'2024-01-05',1200000),
(2,2,'2024-01-10',850000),
(3,1,'2024-02-01',430000),
(4,3,'2024-02-15',990000),
(5,4,'2024-03-01',1500000),
(6,2,'2024-03-10',670000);

select * from orders
where total_amount > ( select avg(total_amount) from orders );
