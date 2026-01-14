USE social_trigger;

INSERT INTO posts (user_id, content, created_at)
SELECT 1,'Extra post for test','2025-01-13 08:00:00'
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE post_id = 5);

DELIMITER //

CREATE TRIGGER trg_before_insert_likes
BEFORE INSERT ON likes
FOR EACH ROW
BEGIN
    DECLARE post_owner INT;
    SELECT user_id INTO post_owner FROM posts WHERE post_id = NEW.post_id;
    IF NEW.user_id = post_owner THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User khong duoc like bai dang cua chinh minh';
    END IF;
END;
//

CREATE TRIGGER trg_after_insert_likes_v2
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
    UPDATE posts
    SET like_count = like_count + 1
    WHERE post_id = NEW.post_id;
END;
//

CREATE TRIGGER trg_after_delete_likes_v2
AFTER DELETE ON likes
FOR EACH ROW
BEGIN
    UPDATE posts
    SET like_count = like_count - 1
    WHERE post_id = OLD.post_id;
END;
//

CREATE TRIGGER trg_after_update_likes
AFTER UPDATE ON likes
FOR EACH ROW
BEGIN
    IF OLD.post_id <> NEW.post_id THEN
        UPDATE posts
        SET like_count = like_count - 1
        WHERE post_id = OLD.post_id;
        UPDATE posts
        SET like_count = like_count + 1
        WHERE post_id = NEW.post_id;
    END IF;
END;
//
DELIMITER ;
INSERT INTO likes (user_id, post_id) VALUES (1,1);
INSERT INTO likes (user_id, post_id) VALUES (2,2);
SELECT post_id, like_count FROM posts WHERE post_id = 2;
UPDATE likes
SET post_id = 3
WHERE user_id = 2 AND post_id = 2
LIMIT 1;
SELECT post_id, like_count FROM posts WHERE post_id IN (2,3);
DELETE FROM likes
WHERE user_id = 2 AND post_id = 3
LIMIT 1;
SELECT post_id, like_count FROM posts WHERE post_id = 3;
SELECT * FROM user_statistics;