create database online_sales;
use online_sales;

create table customers (
    customer_id int auto_increment primary key,
    customer_name varchar(100) not null,
    email varchar(100) not null unique,
    phone varchar(10) not null unique
);

create table categories (
    category_id int auto_increment primary key,
    category_name varchar(255) not null unique
);

create table products (
    product_id int auto_increment primary key,
    product_name varchar(255) not null,
    price decimal(10,2) not null,
    category_id int not null,
    foreign key (category_id) references categories(category_id)
);

create table orders (
    order_id int auto_increment primary key,
    customer_id int not null,
    order_date datetime default current_timestamp,
    status enum('Pending','Completed','Cancel') default 'Pending',
    foreign key (customer_id) references customers(customer_id)
);

create table order_items (
    order_item_id int auto_increment primary key,
    order_id int,
    product_id int,
    quantity int not null,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

insert into customers values
(1,'an','an@gmail.com','0901'),
(2,'binh','binh@gmail.com','0902'),
(3,'chi','chi@gmail.com','0903');

insert into categories values
(1,'dien thoai'),
(2,'laptop');

insert into products values
(1,'iphone',25000000,1),
(2,'samsung',20000000,1),
(3,'macbook',35000000,2);

insert into orders values
(1,1,now(),'Completed'),
(2,1,now(),'Completed'),
(3,2,now(),'Pending');

insert into order_items values
(1,1,1,1),
(2,1,3,1),
(3,2,2,2);

select * from categories;

select * from orders
where status = 'Completed';

select * from products
order by price desc;

select * from products
order by price desc
limit 5 offset 2;

select p.product_name,c.category_name
from products p
join categories c on p.category_id = c.category_id;

select o.order_id,c.customer_name,o.status
from orders o
join customers c on o.customer_id = c.customer_id;

select order_id,sum(quantity) as total_quantity
from order_items
group by order_id;

select c.customer_name,count(o.order_id) as total_orders
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_name
having count(o.order_id) >= 2;

select category_id,
avg(price) as avg_price,
min(price) as min_price,
max(price) as max_price
from products
group by category_id;

select *
from products
where price > (select avg(price) from products);

select *
from customers
where customer_id in (select customer_id from orders);

select order_id,sum(quantity) as total_quantity
from order_items
group by order_id
having sum(quantity) = (
    select max(t.total)
    from (
        select sum(quantity) as total
        from order_items
        group by order_id
    ) t
);

select *
from products
where price = (select max(price) from products);
