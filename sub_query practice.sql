use movie;
-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary INT,
    HireDate DATE
);

-- Insert records into the Employees table
INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'Alice Smith', 'HR', 55000, '2015-05-21'),
(2, 'Bob Johnson', 'IT', 70000, '2017-02-15'),
(3, 'Charlie Davis', 'IT', 68000, '2019-07-11'),
(4, 'David Harris', 'Finance', 75000, '2018-03-05'),
(5, 'Eva Brown', 'Marketing', 54000, '2020-01-22'),
(6, 'Frank Miller', 'HR', 50000, '2016-09-30'),
(7, 'Grace Wilson', 'Finance', 90000, '2014-08-13'),
(8, 'Henry Moore', 'IT', 60000, '2021-11-17'),
(9, 'Irene Taylor', 'Marketing', 63000, '2016-05-02'),
(10, 'Jack Anderson', 'HR', 65000, '2017-10-09'),
(11, 'Karen Thomas', 'Marketing', 48000, '2019-12-04'),
(12, 'Leo Jackson', 'Finance', 77000, '2020-06-13'),
(13, 'Mia Martinez', 'IT', 72000, '2021-01-01'),
(14, 'Nathan White', 'HR', 59000, '2018-05-30'),
(15, 'Olivia Lee', 'Marketing', 55000, '2022-03-23'),
(16, 'Paul Walker', 'IT', 72000, '2019-09-16'),
(17, 'Quinn Scott', 'Finance', 82000, '2021-04-27'),
(18, 'Rachel Moore', 'HR', 60000, '2015-01-19'),
(19, 'Steve King', 'Marketing', 54000, '2022-07-15'),
(20, 'Tina Clark', 'IT', 69000, '2018-02-10'),
(21, 'Ursula Harris', 'Marketing', 50000, '2017-12-18'),
(22, 'Victor Adams', 'HR', 54000, '2019-11-09'),
(23, 'Wendy Robinson', 'Finance', 85000, '2020-04-10'),
(24, 'Xander Allen', 'Marketing', 51000, '2021-02-20'),
(25, 'Yolanda Lee', 'IT', 67000, '2016-08-14'),
(26, 'Zachary Collins', 'Finance', 80000, '2018-06-12'),
(27, 'Amelia Johnson', 'HR', 53000, '2020-05-19'),
(28, 'Benjamin Young', 'Marketing', 56000, '2021-06-28'),
(29, 'Charlotte Moore', 'IT', 71000, '2022-04-01'),
(30, 'Dylan Green', 'Finance', 78000, '2021-03-03');
select * from employees;
#1.Find the employees who have the highest salary in each department.
select  Name ,salary,department from employees where salary in(select max(salary) from employees group by department );

#2.Find the department with the most employees.
SELECT Department, COUNT(EmployeeID) AS emp
FROM Employees
GROUP BY Department
ORDER BY emp DESC
LIMIT 1;

#3.Find employees whose salary is above the average salary of their department.
select name,salary,department from employees as e1 where salary>(select avg(salary) from employees as e2 
where e1.department=e2.department);

#4.List employees who were hired after the average hire date of the entire company.
select name,hiredate from employees  where hiredate>(select avg(hiredate) from employees );

#5.Find employees who have a higher salary than the average salary in the company.
select name ,salary from employees where salary>(select  avg(salary) from employees);

#6.List the employees who are earning the highest salary in the company.
select name,salary from employees where salary=(select max(salary) from employees);

#7.Find employees who have a salary greater than all employees in the "Marketing" department.
select name,salary,department from employees where salary>(select max(salary) from employees where department="marketing");

#8.Find employees whose salary is lower than the highest salary in the "IT" department.
select name ,salary,department from employees where salary<(select max(salary) from employees where department="IT");

#9.Find departments with more than 5 employees.
select distinct department from employees  where department in(select department from employees  group by department
having count(employeeid)>5 );

#10.Find employees who earn less than the employee with the highest salary in the "Finance" department.
select name,salary from employees where salary<(select max(salary) from employees where department="finance");

#11.List employees who have a salary higher than the average salary of employees hired before 2018.
select name,salary,hiredate from employees where salary>(select avg(salary) from employees where year(hiredate)<"2018");

#12.Find employees hired on the same date as the maximum hire date in the company.
select name,hiredate from employees where hiredate=(select max(hiredate) from employees );

#13.Find employees who earn the same as the median salary in their department.
select name,salary,department from employees as e1 where salary=(select avg(salary) from employees as e2 
where e1.department=e2.department);#(incorrect)

WITH OrderedSalaries AS (
    SELECT 
        Name, 
        Salary, 
        Department,
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary) AS RowAsc,
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RowDesc
    FROM Employees
)
SELECT Name, Salary, Department 
FROM OrderedSalaries
WHERE RowAsc = RowDesc OR RowAsc + 1 = RowDesc;

#14.List the employees who earn more than the average salary in the company but less than the maximum salary.
select name,salary from employees where salary > (select avg(salary) from employees )and salary <(select max(salary) from employees);

#15.Find employees who were hired before the average hire date of all employees.
select name from employees where hiredate <(select avg(hiredate) from employees);

#16.Find the average salary of the "HR" department, then list employees with a salary above this average.
select name,salary,department from employees where department="HR" 
and salary>(select avg(salary) from employees where department="HR");

#17.Find the names of employees whose salary is greater than the 
#salary of the employee with the lowest salary in the "Marketing" department.
select name from employees where salary>(select min(salary) from employees where department="marketing");

#18.Find the employee who has been with the company the longest in each department.
SELECT EmployeeID, Name, Department, HireDate
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) = (
    SELECT MAX(TIMESTAMPDIFF(YEAR, HireDate, CURDATE()))
    FROM Employees GROUP BY Department
);
#19.Find employees who have the same salary as the employee who has the most recent hire date.
select Name ,salary ,hiredate from Employees where salary=(select salary from employees order by hiredate desc limit 1) ;

#20.Find departments where the average salary is higher than the company’s average salary.
select department from Employees group by department 
having avg(salary)>(select avg(salary) from employees ) ;

#21.Find employees who earn more than the average salary in their department, but less than the highest salary in that department.
select name,salary from employees e where salary>(select avg(salary) from employees where department=e.department) 
and salary <(select max(salary) from employees where department=e.department) ;

#22.Find employees whose hire date is later than the average hire date in the company.
select Name ,hiredate from Employees where hiredate>(select avg(hiredate) from employees ) ;

#23.List all employees whose hire date is after the latest hire date in the "HR" department.
select Name ,hiredate,department from Employees where hiredate>(select max(hiredate) from employees where department="HR") ;

#24.Find employees who earn more than 75% of the employees in their department.(imp)
select name ,department,salary from employees e1 
where (select count(*) from employees e2 where e1.department=e2.department and e1.salary>e2.salary)>
(select count(*)*0.75 from employees e2 where e1.department=e2.department);

#25.Find employees who have a salary higher than the employee with the lowest salary in their department.
select e1.* from employees e1 where salary>(select min(salary) from employees e2 where e1.department=e2.department);

#26.Find the department with the least number of employees.
select department from employees group by department order by count(*) asc limit 1;

#27.Find the department with the average salary above the highest salary in the "HR" department.
select department from employees e1 where avg(salary)>(select max(salary) from employees where department="HR");

#28.Find employees whose salary is greater than the average salary in the "IT" department, but less than the maximum salary in that department.
select * from employees where salary >(select avg(salary) from employees  where department="IT") 
and salary <(select max(salary) from employees where department="IT");

#29.Find the employee with the highest salary and return the department they belong to.
select name,department from employees where salary=(select max(salary) from employees) ;

#30.Find the total number of employees in each department.
select count(*) as number_of_emp,department from employees 
group by department;

#31.Find the names of employees who earn more than the average salary in the "Finance" department.
select name,salary from employees where salary>(select avg(salary) from employees where department="Finance");

#32.Find the employees who have been hired before the latest employee in the "Marketing" department.
select name,hiredate from employees where hiredate<(select max(hiredate) from employees where department="Marketing");

#33.Find the number of employees who have the highest salary in the company.
select count(*) as number_of_emp from employees where salary=(select max(salary) from employees);

#34.Find employees who earn the same as the average salary in the "Finance" department.
select name,salary from employees where salary=(select avg(salary) from employees where department="Finance");

#35.Find the department where the most recently hired employee belongs.
select department from employees where hiredate=(select max(hiredate) from employees );

#36.Find the employee with the second-highest salary in the company.
select name from employees where salary =(select salary from employees order by salary desc limit 1 offset 1);

#37.Find the employee with the highest salary who was hired before 2019.
select name,salary,hiredate from employees where salary =(select max(salary) from employees where year(hiredate)<"2019");

#38.Find employees with a salary greater than the average salary in the "Marketing" department.
select name,salary from employees where salary>(select avg(salary) from employees where department="Marketing");

#39.Find employees whose salary is greater than the average salary in the "HR" department but less than the highest salary in the "Finance" department.
select name ,salary from employees where salary >(select avg(salary) from employees where department="HR")
 and salary <(select max(salary) from employees where department="Finance");
 
 #40.Find the employee who has the longest tenure but earns less than the average salary in the company.
 select name,salary from employees where salary <(select avg(salary) from employees) and  hiredate=(select min(hiredate) from employees);

#41.Find the department with the lowest average salary and list all employees in it.
select * from employees where department =(select department from employees group by department order by avg(salary) asc limit 1);

#42.Find employees whose salary is equal to the highest salary in the "HR" department.
select * from employees where salary=(select max(salary) from employees where department="HR");

#43.Find employees who earn the same as the employee who has been with the company the shortest.
select * from employees where salary=(select salary from employees where hiredate=(select max(hiredate) from employees));

#44.Find employees with a salary greater than the average salary of employees hired after 2020.
select * from employees where salary >(select avg(salary) from employees where hiredate>"2020-12-31");

#45.Find the department with the most recent hire.
select department,hiredate from employees where hiredate=(select max(hiredate) from employees);

#46.Find employees who earn more than the average salary of those hired before 2019.
select * from employees where salary>(select avg(salary) from employees where hiredate<"2019-01-01");

#47.Find employees whose salary is the same as the lowest salary in the company.
select * from employees where salary =(select min(salary) from employees );

#48.Find employees who were hired before the average hire date in the "Marketing" department.
select * from employees where hiredate>(select avg(hiredate) from employees where department ="Marketing");

#49.List employees whose salary is greater than the highest salary in the "Finance" department.
select * from employees where salary>(select max(salary) from employees where department ="Finance");

#50.Find departments that have an employee whose salary is greater than the average salary of the company.
select distinct department from employees where salary >(select avg(salary) from employees);

#51.Find employees whose salary is equal to the average salary in the company.
select * from employees where salary=(select avg(salary) from employees);

#52.Find employees who earn more than 75% of the employees in their department, but less than the highest salary in the department.
select e1.* from employees e1 where (select count(*) from employees e2 where e2.department=e1.department and e2.Salary<e1.Salary)>
(select count(*)*0.75 from employees e2 where e1.department=e2.department) and e1.salary<(select max(Salary) from employees e2 where e1.department=e2.department);

#53.Find the departments where the average salary is above the median salary in the company.
select distinct department from employees e1  where (select avg(salary) from employees e2 where e1.department=e2.department)>(select avg(salary) from employees e2);

#54.Find employees who earn less than the average salary of the company, but more than the lowest salary in the "HR" department.
select * from employees where (salary < (select avg(salary) from employees ) and salary >(select min(salary) from employees where department="HR"));

#55.Find employees who were hired on the same day as the employee with the highest salary.
select * from employees where hiredate=(select hiredate from employees where salary=(select max(salary) from employees ));

#56.Find the department where the average salary is equal to the average salary of all employees in the company.
select department from employees group by department having avg(salary)=(select avg(salary) from employees);

#57.Find employees who earn the same as the average salary of the "IT" department.
select * from employees where salary=(select avg(salary) from employees where department="IT");

#58.Find employees whose salary is higher than the average salary of employees hired before 2020.
select * from employees where salary > (select avg(salary) from employees where hiredate <"2020-01-01");

#59.Find employees who earn more than the average salary of their department, but less than the highest salary in the company.
select * from employees e1 having salary> (select avg(salary) from employees e2 where e1.department=e2.department) and salary < 
(select max(salary) from employees); 

#60.Find employees with a salary higher than the highest salary in the "IT" department.
select * from employees where salary > (select max(salary) from employees where department="IT");