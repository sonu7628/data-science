use my_database;
create table emp(
eid int PRIMARY key,
ename varchar(30),
salary decimal(10,2),
age int );

insert into emp
(eid,ename,salary,age)
values
(101,"sonu",4000,28),
(102,"akhilesh",9000,23),
(103,"haish",2000,21),
(104,"radha",10000,22)
;
select * from emp;
alter table emp add taxes int ;
UPDATE emp 
SET taxes = 
    CASE 
        WHEN eid = 101 THEN 100
        WHEN eid = 102 THEN 200
        WHEN eid = 103 THEN 300
        WHEN eid = 104 THEN 400
    END;
set sql_safe

select salary+100 from emp;
select * from emp where age in (28,22,21,30);
select * from emp where salary!=9000 and salary<9000;
select * from emp where binary ename="radha";
insert into emp
(ename,salary,age)
values
(105,"sejal",4000,28,300),
(106,"komL",2000,22,100);
drop table emp;







