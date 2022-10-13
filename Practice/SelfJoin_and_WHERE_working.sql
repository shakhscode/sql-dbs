--Exploring self join  and working of Where clause

--create a table
drop table if exists car2;
create table if not exists car2
(
    id      int,
    model   varchar(50),
    brand   varchar(40),
    color   varchar(30),
    make    int
);

Select * from car2

--Insert only unique values
insert into car2 values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into car2 values (2, 'EQS', 'Mercedes-Benz', 'Black', 2022);
insert into car2 values (3, 'iX', 'BMW', 'Red', 2022);
insert into car2 values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);
insert into car2 values (5, 'Model S', 'Tesla', 'Silver', 2018);
insert into car2 values (6, 'Ioniq 5', 'Hyundai', 'Green', 2021);

select distinct(id) from car2
order by id


--Real way of self join
select * 
from car2 as t1
left join car2 AS t2 
--does not matter self join, outer join,inner join, left join or right join
on t1.id = t2.id
-- This gives the exact copy of the table if the joining column has only unique values.

--Self CROSS join
select * from 
car2 t1, car2 t2   --THIS WAY IS BETTER TO COMPARE values ROW BY ROW
--this self join works as
--lets say table 1 has row 1,2,3
--table 2 has row 4,5,6
--Result will be 1-4,1-5,1-5,2-4,2-5,2-6,3-4,3-5,3-6 because CROSS JOIN follow cartesian product.
-- n*n = n^2 

-- This is like self Cross JOIN
select * 
from   car2 AS t1
cross join car2 as t2


*** Working of WHERE in a single table **
--Checks ROWS one by one and returns that satisfy the conditions.
select * from car2 
where id>3

--Working of WHERE for two tables
--Once a table is formed by joins, the resultant table is considered as single table
--and then each row is checked one by one. So basically working is same for single table as well as joned table
select * 
from car2 t1, car2 t2
where t1.id = t2.id
