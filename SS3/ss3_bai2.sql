DROP TABLE Student;
CREATE TABLE IF NOT EXISTS Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);
INSERT INTO Student (student_id, full_name, date_of_birth, email)
VALUES
(1, 'Nguyễn Văn A', '2003-05-12', 'a.nguyen@gmail.com'),
(2, 'Trần Thị B', '2002-11-20', 'b.tran@gmail.com'),
(3, 'Lê Văn C', '2003-01-08', 'c.le@gmail.com'),
(5, 'Phạm Văn D', '2001-09-10', 'd.pham@gmail.com');
UPDATE Student
SET email = 'c.le_new@gmail.com'
WHERE student_id = 3;
UPDATE Student
SET date_of_birth = '2002-10-15'
WHERE student_id = 2;
DELETE FROM Student
WHERE student_id = 5;
SELECT * FROM Student;
