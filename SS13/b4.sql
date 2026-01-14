USE social_trigger;

CREATE TABLE post_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    old_content TEXT,
    new_content TEXT,
    changed_at DATETIME,
    changed_by_user_id INT,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER trg_before_update_posts
BEFORE UPDATE ON posts
FOR EACH ROW
BEGIN
    IF OLD.content <> NEW.content THEN
        INSERT INTO post_history
        (post_id, old_content, new_content, changed_at, changed_by_user_id)
        VALUES
        (OLD.post_id, OLD.content, NEW.content, NOW(), OLD.user_id);
    END IF;
END;
//

CREATE TRIGGER trg_after_delete_posts_log
AFTER DELETE ON posts
FOR EACH ROW
BEGIN
    INSERT INTO post_history
    (post_id, old_content, new_content, changed_at, changed_by_user_id)
    VALUES
    (OLD.post_id, OLD.content, NULL, NOW(), OLD.user_id);
END;
//

DELIMITER ;

UPDATE posts
SET content = 'Updated content of Alice first post'
WHERE post_id = 1;

UPDATE posts
SET content = 'Bob updated his first post'
WHERE post_id = 3;

SELECT * FROM post_history;

SELECT post_id, like_count FROM posts;

SELECT * FROM user_statistics;
