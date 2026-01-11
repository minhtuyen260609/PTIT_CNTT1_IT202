use social_network_pro;
explain analyze
select *
from users
where hometown = 'Hà Nội';

-- (3) Tạo chỉ mục idx_hometown cho cột hometown
create index idx_hometown
on users(hometown);

-- (4) Truy vấn lại sau khi đánh index
explain analyze
select *
from users
where hometown = 'Hà Nội';

-- (6) Xóa chỉ mục idx_hometown
drop index idx_hometown
on users;