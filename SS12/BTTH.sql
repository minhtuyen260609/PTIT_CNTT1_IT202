drop database if exists social_network_pro;
create database social_network_pro;
use social_network_pro;

create table users(
user_id int auto_increment primary key,
username varchar(50) not null unique,
password varchar(255) not null,
email varchar(100) not null unique,
created_at datetime default current_timestamp
);

create table posts(
post_id int auto_increment primary key,
user_id int,
content text not null,
created_at datetime default current_timestamp,
foreign key(user_id) references users(user_id)
);

create table comments(
comment_id int auto_increment primary key,
post_id int,
user_id int,
content text not null,
created_at datetime default current_timestamp,
foreign key(post_id) references posts(post_id),
foreign key(user_id) references users(user_id)
);

create table friends(
user_id int,
friend_id int,
status varchar(20),
check(status in('pending','accepted')),
foreign key(user_id) references users(user_id),
foreign key(friend_id) references users(user_id)
);

create table likes(
user_id int,
post_id int,
foreign key(user_id) references users(user_id),
foreign key(post_id) references posts(post_id)
);

insert into users(username,password,email) values
('an','123','an@gmail.com'),
('binh','123','binh@gmail.com'),
('cuong','123','cuong@gmail.com'),
('dung','123','dung@gmail.com'),
('hoa','123','hoa@gmail.com');

create view vw_public_users as
select user_id,username,created_at from users;

create index idx_username on users(username);

delimiter //
create procedure sp_create_post(
in p_user_id int,
in p_content text
)
begin
if exists(select 1 from users where user_id=p_user_id) then
insert into posts(user_id,content) values(p_user_id,p_content);
else
signal sqlstate '45000' set message_text='user not found';
end if;
end//
delimiter ;

call sp_create_post(1,'hello database');
call sp_create_post(2,'mysql view index');
call sp_create_post(3,'stored procedure');

create view vw_recent_posts as
select * from posts
where created_at>=date_sub(now(),interval 7 day);

create index idx_posts_user on posts(user_id);
create index idx_posts_user_time on posts(user_id,created_at);

delimiter //
create procedure sp_count_posts(
in p_user_id int,
out p_total int
)
begin
select count(*) into p_total from posts where user_id=p_user_id;
end//
delimiter ;

delimiter //
create procedure sp_add_friend(
in p_user_id int,
in p_friend_id int
)
begin
if p_user_id=p_friend_id then
signal sqlstate '45000' set message_text='cannot add yourself';
else
insert into friends(user_id,friend_id,status)
values(p_user_id,p_friend_id,'pending');
end if;
end//
delimiter ;

call sp_add_friend(1,2);
call sp_add_friend(1,3);

delimiter //
create procedure sp_suggest_friends(
in p_user_id int,
inout p_limit int
)
begin
declare i int default 0;
while i<p_limit do
select user_id from users
where user_id<>p_user_id
limit i,1;
set i=i+1;
end while;
end//
delimiter ;

create index idx_likes_post on likes(post_id);

create view vw_top_posts as
select post_id,count(*) total_likes
from likes
group by post_id
order by total_likes desc
limit 5;

delimiter //
create procedure sp_add_comment(
in p_user_id int,
in p_post_id int,
in p_content text
)
begin
if not exists(select 1 from users where user_id=p_user_id) then
signal sqlstate '45000' set message_text='user not found';
elseif not exists(select 1 from posts where post_id=p_post_id) then
signal sqlstate '45000' set message_text='post not found';
else
insert into comments(user_id,post_id,content)
values(p_user_id,p_post_id,p_content);
end if;
end//
delimiter ;

create view vw_post_comments as
select c.content,u.username,c.created_at
from comments c join users u
on c.user_id=u.user_id;

delimiter //
create procedure sp_like_post(
in p_user_id int,
in p_post_id int
)
begin
if exists(select 1 from likes where user_id=p_user_id and post_id=p_post_id) then
signal sqlstate '45000' set message_text='already liked';
else
insert into likes(user_id,post_id) values(p_user_id,p_post_id);
end if;
end//
delimiter ;

create view vw_post_likes as
select post_id,count(*) total_likes
from likes
group by post_id;

delimiter //
create procedure sp_search_social(
in p_option int,
in p_keyword varchar(100)
)
begin
if p_option=1 then
select * from users where username like concat('%',p_keyword,'%');
elseif p_option=2 then
select * from posts where content like concat('%',p_keyword,'%');
else
signal sqlstate '45000' set message_text='invalid option';
end if;
end//
delimiter ;
