select * from emp

drop trigger validate_salary
on emp
-- create a trigger
create trigger validate_salary
before insert on emp
for each row 
execute procedure checksalaryEntry();


--Create a trigger action function that  stops the wrong entry of salary data
create or replace function checksalaryEntry()
returns trigger 
as 
$$
declare 
begin 

-- define the trigger action
   if new.salary <= 0  then
   raise notice 'Salary can not be negative';
   return null;
   end if;
   return new;
end;
$$
LANGUAGE plpgsql;

--Now test how trigger works

select * from emp
--Enter a normal salary
insert into emp(id,name,salary)
values(14,'W00okoma',120000)

select * from emp

--Enter a wrong salary
insert into emp(id,name,salary)
values(12,'Lokoma',0)

select * from emp
--That means the trigger worked.