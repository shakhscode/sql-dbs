--create a table and insert data into it.
drop table if exists cars;
create table if not exists cars
(
    id      int,
    model   varchar(50),
    brand   varchar(40),
    color   varchar(30),
    make    int
);

--insert data
insert into cars values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into cars values (2, 'EQS', 'Mercedes-Benz', 'Black', 2022);
insert into cars values (3, 'iX', 'BMW', 'Red', 2022);
insert into cars values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);
insert into cars values (5, 'Model S', 'Tesla', 'Silver', 2018);
insert into cars values (6, 'Ioniq 5', 'Hyundai', 'Green', 2021);
insert into cars values (7, 'Ioniq 5', 'Hyundai', 'White', 2021);
insert into cars values (8, 'Model S', 'Tesla', 'Silver', 2018);
insert into cars values (9, 'Ioniq 5', 'Hyundai', 'Green', 2021);


select * from cars
order by model, brand;


--See is there any duplicate data

select model,brand , count(*)
from cars
group by model, brand


--Now considering the car with id 4 and 6 as duplicate, 
--keep only one, and remove the rest of duplicates.

--Way 1
--Using normal logic with the help of a subquery.
-- Select all the ids that repeated model and keep only one of them
-- and remove the rest.
select * from cars
order by model, id

delete from cars
where id not in
         (select min(id) from cars 
	         group by model, brand)
	  

--Now check if there is any duplicate models or car ?
select model,brand , count(*)
from cars
group by model, brand

***So the above logic worked***

--Way 2: Self CROSS join 
-- Again drop the table, create the table, insert values
select * from cars
order by id

--Check if three are duplicates
select model,brand , count(*)
from cars
group by model, brand

--Now remove the rows with duplicate model. (Keep only one and remove the rest)
delete from cars
where id in (select t1.id
            from cars t1, cars t2
            where t1.id > t2.id and t1.model = t2.model)


--Now check if there is any duplicate models or car ?
select model,brand , count(*)
from cars
group by model, brand
