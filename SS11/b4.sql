USE social_network_pro;

DELIMITER $$

CREATE PROCEDURE CreatePostWithValidation(
    IN p_user_id INT,
    IN p_content TEXT,
    OUT result_message VARCHAR(255)
)
BEGIN
    IF CHAR_LENGTH(p_content) < 5 THEN
        SET result_message = 'Nội dung quá ngắn';
    ELSE
        INSERT INTO posts(user_id,content,created_at)
        VALUES(p_user_id,p_content,NOW());
        SET result_message = 'Thêm bài viết thành công';
    END IF;
END$$

DELIMITER ;

CALL CreatePostWithValidation(1,'Hi',@result_message);
SELECT @result_message AS result_message;

CALL CreatePostWithValidation(1,'Đây là bài viết hợp lệ',@result_message);
SELECT @result_message AS result_message;

SELECT post_id,content,created_at
FROM posts
WHERE user_id=1
ORDER BY post_id DESC;

DROP PROCEDURE IF EXISTS CreatePostWithValidation;
