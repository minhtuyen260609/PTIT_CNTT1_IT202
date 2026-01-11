use social_network_pro;

-- Truy vấn tìm các bài viết năm 2026 của user_id = 1 (TRƯỚC KHI TẠO INDEX)
explain analyze
select post_id, content, created_at
from posts
where user_id = 1
  and created_at >= '2026-01-01'
  and created_at < '2027-01-01';

-- Tạo chỉ mục phức hợp
create index idx_created_at_user_id
on posts(created_at, user_id);

-- Truy vấn lại SAU KHI TẠO INDEX
explain analyze
select post_id, content, created_at
from posts
where user_id = 1
  and created_at >= '2026-01-01'
  and created_at < '2027-01-01';

-- Truy vấn tìm user có email = 'an@gmail.com' (TRƯỚC KHI TẠO INDEX)
explain analyze
select user_id, username, email
from users
where email = 'an@gmail.com';

-- Tạo chỉ mục duy nhất
create unique index idx_email
on users(email);

-- Truy vấn lại SAU KHI TẠO INDEX
explain analyze
select user_id, username, email
from users
where email = 'an@gmail.com';


drop index idx_created_at_user_id on posts;
drop index idx_email on users;