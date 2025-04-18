create database college3;
use college3;
create table student(
roll_no INT PRIMARY KEY,
name VARCHAR(50),
marks INT,
grade VARCHAR(1),
city VARCHAR(20));
INSERT INTO student
(roll_no,name,marks,grade,city)
VALUES
(101,"sonu",90,"A","ctc"),
(102,"akhi",56,"C","nagpur"),
(103,"komal",78,"B","nagpur"),
(104,"priya",34,"D","hyderabad"),
(105,"harsh",79,"B","mumbai"),
(106,"kiran",75,"B","hyderabad");
SELECT * FROM student WHERE city="ctc";