--create tbale 1
create table emp(
id serial primary key,
name varchar(20),
salary int,
addId int);

select * from emp
-- insert data to table 1
insert into emp(name,salary,addId)
values 
('Joe',85000,1 ),
('Henry',80000, 2 ) ,        
('Sam',60000 , 2 )   ,        
('Max', 90000, 1   ),        
 ('Janet',69000, 1 ),          
('Randy', 85000 , 1 ),           
( 'Will', 70000, 1) 

select * from emp

-- create table 2
create table dep(
depid serial,
name varchar(20))

--insert data to table 2
insert into dep(depid, name)
values 
(1,'IT'),
(2,'Sales')
-- see the table dep
select * from dep


--solve the problem
select dep.name as Department, t1.name as Employee, t1.salary as Salary
from (select *, 
DENSE_RANK() OVER(PARTITION BY addId order by salary desc) as top
from emp
order by addid, top) as t1
join 
(select *, 
DENSE_RANK() OVER(PARTITION BY addId order by salary desc) as top
from emp
order by addid, top)  t2
on t1.id = t2.id
join dep 
on t1.addId = dep.depid

where t1.top <=3
order by t1.salary desc


select dep.name as Department, t1.name as Employee, t1.salary as Salary
from (select *, 
DENSE_RANK() OVER(PARTITION BY addId order by salary desc) as top
from emp
order by addid, top) as t1
join dep 
on t1.addId = dep.depid
where t1.top <=3



-- Final Solution submitted to Leetcode
select Department.name as Department, t1.name as Employee, t1.salary as Salary
from (select *, 
DENSE_RANK() OVER(PARTITION BY departmentId order by salary desc) as top
from Employee
order by top) as t1
join Department
on t1.departmentId = Department.id
where t1.top <=3

