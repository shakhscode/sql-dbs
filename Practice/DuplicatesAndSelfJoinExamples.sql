--Qn1. Write a SQL query to fetch all the duplicate records from a table.

--Tables Structure:

drop table users;

--Create the table
create table users
(user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

--Insert the data
insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

select * from users

--Solution 1
select min(user_id), min(user_name), email, count(*)
from users
group by email
having count(*)>1

--Qn.2 From the doctors table, fetch the details of doctors who work in the same hospital
--but in different specialty.

--Doctors table

drop table doctors;

create table doctors
(
id int primary key,
name varchar(50) not null,
speciality varchar(100),
hospital varchar(50),
city varchar(50),
consultation_fee int
);

insert into doctors values
(1, 'Dr. Shashank', 'Ayurveda', 'Apollo Hospital', 'Bangalore', 2500),
(2, 'Dr. Abdul', 'Homeopathy', 'Fortis Hospital', 'Bangalore', 2000),
(3, 'Dr. Shwetha', 'Homeopathy', 'KMC Hospital', 'Manipal', 1000),
(4, 'Dr. Murphy', 'Dermatology', 'KMC Hospital', 'Manipal', 1500),
(5, 'Dr. Farhana', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1700),
(6, 'Dr. Maryam', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1500);

select * from doctors;


--Solution 1:
select d1.name, d1.hospital, d1.speciality
from doctors d1 , doctors d2
where d1.hospital = d2.hospital and d1.speciality <> d2.speciality
order by d1.name


--Qn. 3 From the login_details table, fetch the users who logged in consecutively 3 or more times.

drop table login_details;

create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

delete from login_details;

insert into login_details values
(101, 'Michael', current_date),
(102, 'James', current_date),
(103, 'Stewart', current_date+1),
(104, 'Stewart', current_date+1),
(105, 'Stewart', current_date+1),
(106, 'Michael', current_date+2),
(107, 'Michael', current_date+2),
(108, 'Stewart', current_date+3),
(109, 'Stewart', current_date+3),
(110, 'James', current_date+4),
(111, 'James', current_date+4),
(112, 'James', current_date+5),
(113, 'James', current_date+6);

select * from login_details;

select l1.user_name
from login_details l1 , login_details l2
where l1.login_id <> l2.login_id and l1.user_name = l2.user_name  and l1.login_date -l2.login_date >= 2
group by l1.user_name
having count(l2.login_date)>=3



--Qn. 6. From the students table, write a SQL query to interchange the adjacent student names.
drop table students;

create table students
(
id int primary key,
student_name varchar(50) not null
);

insert into students values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin');

select * from students


--Solution
select *,
     case 
	 when id%2 = 0 then lag(student_name,1) over(order by id)
	 when id%2 != 0 then lead(student_name,1,student_name) over(order by id)
     end as adjacent_student
from students 
order by id

-- Query 7:

From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.

Note: Weather is considered to be extremely cold then its temperature is less than zero.

--Table Structure:
drop table weather;

create table weather
(
id int,
city varchar(50),
temperature int,
day date
);

delete from weather;

insert into weather values
(1, 'London', -1, to_date('2021-01-01','yyyy-mm-dd')),
(2, 'London', -2, to_date('2021-01-02','yyyy-mm-dd')),
(3, 'London', 4, to_date('2021-01-03','yyyy-mm-dd')),
(4, 'London', 1, to_date('2021-01-04','yyyy-mm-dd')),
(5, 'London', -2, to_date('2021-01-05','yyyy-mm-dd')),
(6, 'London', -5, to_date('2021-01-06','yyyy-mm-dd')),
(7, 'London', -7, to_date('2021-01-07','yyyy-mm-dd')),
(8, 'London', 5, to_date('2021-01-08','yyyy-mm-dd'));

select * from weather;


--Try 1

select * 

     from (select *, 
          lead(temperature,1) over (order by day) as second_day,
		  lead(temperature,2) over (order by day) as third_day
          from weather) as x
where x.temperature < 0 
      and (x.second_day is not null and x.second_day<0)
	  and (x.third_day is not null and x.third_day<0)
-- This is not perfect

--Second try
select * from
(select *, 
       case 
	   when temperature < 0 then 'Yes' 
	   end as today,
	   
	   case
	   when lag(temperature,1) over (order by day)<0  then 'Yes'
	   end as yester,
	   
	   case
	   when lead(temperature,1) over (order by day)<0  then 'Yes'
	   end as tom,
	   
	   case
	   when lag(temperature,2) over (order by day)<0   then 'Yes'
	   end as two_days_before,
	   
	   case
	   when lead(temperature,2) over (order by day)<0   then 'Yes'
	   end as two_days_after
from weather) as x

where 
     (x.today = 'Yes' and  x.yester = 'Yes'  and  x.tom = 'Yes')
	 or 
	 (x.today = 'Yes' and  x.yester = 'Yes'  and  x.two_days_before = 'Yes')
	 or 
	 (x.today = 'Yes' and  x.tom = 'Yes'  and  x.two_days_after = 'Yes')
	 
	 
--The shortest solution

select * 
from 
   (select *, 
    case 
	   when 
	   temperature < 0 
	   and lag(temperature,1) over (order by day)<0
	   and lead(temperature,1) over (order by day)<0 
	   then 'Yes'
	    
	   when 
	   temperature < 0 
	   and lag(temperature,1) over (order by day)<0
	   and lag(temperature,2) over (order by day)<0 
	   then 'Yes'

	    when 
	   temperature < 0 
	   and lead(temperature,1) over (order by day)<0
	   and lead(temperature,2) over (order by day)<0 
	   then 'Yes'
     end as Result
   from weather) as x
 where x.result is not null
	  