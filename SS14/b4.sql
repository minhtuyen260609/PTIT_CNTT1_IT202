use social_network;

create table if not exists comments(
comment_id int primary key auto_increment,
post_id int not null,
user_id int not null,
content text not null,
created_at datetime default current_timestamp,
foreign key(post_id) references posts(post_id),
foreign key(user_id) references users(user_id)
);

alter table posts add column comments_count int default 0;

delimiter $$

create procedure sp_post_comment(
in p_post_id int,
in p_user_id int,
in p_content text,
in p_force_error int
)
begin
declare exit handler for sqlexception
begin
rollback;
end;

start transaction;

insert into comments(post_id,user_id,content)
values(p_post_id,p_user_id,p_content);

savepoint after_insert;

if p_force_error = 1 then
update posts set comments_count = comments_count + 1 / 0
where post_id = p_post_id;
else
update posts set comments_count = comments_count + 1
where post_id = p_post_id;
end if;

commit;
end$$

delimiter ;

call sp_post_comment(1,1,'binh luan thanh cong',0);

call sp_post_comment(1,1,'binh luan bi loi update',1);

select * from comments;
select post_id,comments_count from posts;
