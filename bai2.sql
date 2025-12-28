CREATE DATABASE IF NOT EXISTS school_db_session02;
USE school_db_session02;

CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    UNIQUE (student_id)
);

CREATE TABLE Subject (
    subject_id VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    CHECK (credits > 0),
    UNIQUE (subject_id)
);
