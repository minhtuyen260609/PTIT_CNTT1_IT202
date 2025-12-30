DROP DATABASE IF EXISTS online_learning;
CREATE DATABASE online_learning;
USE online_learning;

CREATE TABLE Student(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Instructor(
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Course(
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    total_sessions INT NOT NULL CHECK(total_sessions > 0),
    instructor_id INT NOT NULL,
    FOREIGN KEY(instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment(
    student_id INT,
    course_id INT,
    enroll_date DATE NOT NULL,
    PRIMARY KEY(student_id, course_id),
    FOREIGN KEY(student_id) REFERENCES Student(student_id),
    FOREIGN KEY(course_id) REFERENCES Course(course_id)
);

CREATE TABLE Result(
    student_id INT,
    course_id INT,
    mid_score DECIMAL(3,1) CHECK(mid_score BETWEEN 0 AND 10),
    final_score DECIMAL(3,1) CHECK(final_score BETWEEN 0 AND 10),
    PRIMARY KEY(student_id, course_id),
    FOREIGN KEY(student_id, course_id)
        REFERENCES Enrollment(student_id, course_id)
);

INSERT INTO Student(full_name, birth_date, email) VALUES
('Nguyen Van A','2002-03-15','a@gmail.com'),
('Tran Thi B','2001-07-22','b@gmail.com'),
('Le Van C','2003-01-10','c@gmail.com'),
('Pham Thi D','2002-11-05','d@gmail.com'),
('Hoang Van E','2001-09-18','e@gmail.com');

INSERT INTO Instructor(full_name, email) VALUES
('Thay Nguyen','nguyen@uni.edu'),
('Co Tran','tran@uni.edu'),
('Thay Le','le@uni.edu'),
('Co Pham','pham@uni.edu'),
('Thay Hoang','hoang@uni.edu');

INSERT INTO Course(course_name, description, total_sessions, instructor_id) VALUES
('SQL Basics','Co so du lieu SQL',30,1),
('Java Programming','Lap trinh Java',45,2),
('Web Development','HTML CSS JS',40,3),
('Software Engineering','Quy trinh phan mem',35,4),
('Data Structures','Cau truc du lieu',50,5);

INSERT INTO Enrollment(student_id, course_id, enroll_date) VALUES
(1,1,'2024-01-10'),
(1,2,'2024-01-12'),
(2,1,'2024-01-11'),
(3,3,'2024-01-15'),
(4,4,'2024-01-20');

INSERT INTO Result(student_id, course_id, mid_score, final_score) VALUES
(1,1,7.5,8.0),
(1,2,6.5,7.0),
(2,1,8.0,8.5),
(3,3,7.0,7.5),
(4,4,6.0,6.5);

UPDATE Student
SET email='a_new@gmail.com'
WHERE student_id=1;

UPDATE Course
SET description='Lap trinh Java nang cao'
WHERE course_id=2;

UPDATE Result
SET final_score=8.5
WHERE student_id=1 AND course_id=1;

DELETE FROM Result
WHERE student_id=4 AND course_id=4;

DELETE FROM Enrollment
WHERE student_id=4 AND course_id=4;

SELECT * FROM Student;

SELECT * FROM Instructor;

SELECT * FROM Course;

SELECT
    student_id,
    full_name,
    course_id,
    course_name,
    enroll_date
FROM Enrollment
JOIN Student USING(student_id)
JOIN Course USING(course_id);

SELECT
    student_id,
    full_name,
    course_id,
    course_name,
    mid_score,
    final_score
FROM Result
JOIN Student USING(student_id)
JOIN Course USING(course_id);
