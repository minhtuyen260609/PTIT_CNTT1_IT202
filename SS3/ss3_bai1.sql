
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Student (student_id, full_name, date_of_birth, email)
VALUES
(1, 'Nguyễn Văn A', '2003-05-12', 'a.nguyen@gmail.com'),
(2, 'Trần Thị B', '2002-11-20', 'b.tran@gmail.com'),
(3, 'Lê Văn C', '2003-01-08', 'c.le@gmail.com');

SELECT * FROM Student;

SELECT student_id, full_name FROM Student;
