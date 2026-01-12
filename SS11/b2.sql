USE social_network_pro;

DELIMITER $$

CREATE PROCEDURE CalculatePostLikes(
    IN p_post_id INT,
    OUT total_likes INT
)
BEGIN
    SELECT COUNT(*) INTO total_likes
    FROM likes
    WHERE post_id = p_post_id;
END$$

DELIMITER ;
