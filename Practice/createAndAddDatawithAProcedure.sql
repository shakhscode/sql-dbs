create or replace procedure create_add_data()
language plpgsql
as $$
begin

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
end;
$$