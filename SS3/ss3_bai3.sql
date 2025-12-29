CREATE TABLE IF NOT EXISTS Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT CHECK (credit > 0)
);
INSERT INTO Subject (subject_id, subject_name, credit)
VALUES
(1, 'Cơ sở dữ liệu', 3),
(2, 'Lập trình Java', 4),
(3, 'Kỹ thuật phần mềm', 3);
UPDATE Subject
SET credit = 5
WHERE subject_id = 2;
UPDATE Subject
SET subject_name = 'Công nghệ phần mềm'
WHERE subject_id = 3;
SELECT * FROM Subject;
