select * from emp

1) In built exceptions and exception handling

create or replace procedure ImplicitExeptionEx(givenid int)
language plpgsql
as $$
DECLARE  
   emp_id int = givenid;  
   emp_name emp.name%type;
   sal emp.salary%type;
  
BEGIN  
   SELECT  name, salary  INTO  emp_name, sal
   FROM emp
   WHERE id = emp_id ; 
   raise notice 'Name: % Salary: %', emp_name,sal;
END
$$

--Call the procedure for givenid = 5
 call ImplicitExeptionEx(5)
 
--Call the procedure for givenid = 50
 call ImplicitExeptionEx(50)
 
--So this will return null.
-- Instead of returning null we can return a message using Exception handling
create or replace procedure ImplicitExeptionEx(givenid int)
language plpgsql
as $$
DECLARE  
   emp_id int = givenid;  
   emp_name emp.name%type;
   sal emp.salary%type;
  
BEGIN  
   SELECT  name, salary  INTO strict emp_name, sal
   FROM emp
   WHERE id = emp_id ; 
   raise notice 'Name: % Salary: %', emp_name,sal;
   
  exception 
  when no_data_found then  --we are catching a pre-defined exception
  --if this pre-defined exception happens do the following.
  raise notice 'Sorry! no data found';
  -- or
  --raise exception 'Sorry ! no data found';
  
END;
$$

--Call the procedure for givenid = 5
 call ImplicitExeptionEx(5)
 
--Call the procedure for givenid = 50
 call ImplicitExeptionEx(50)



2) User defined exception and exception handling

--select * from emp
create or replace procedure userExeptionEx(givenid int)
language plpgsql
as $$
DECLARE  
   emp_id int = givenid;  
   emp_name emp.name%type;
   sal emp.salary%type;
BEGIN  
   SELECT  name, salary  INTO strict emp_name, sal
   FROM emp
   WHERE id = emp_id ; 
   
   if sal < 90000 then
   raise  exception using errcode =50001;
   else 
   raise notice 'Name: % Salary: %', emp_name,sal;
   end if;
   
   exception 
   when no_data_found then  --the implicit exception
   raise notice 'Implicit exception message: No data found';
   when sqlstate '50001' then 
   raise exception 'Explicit exception: Ah! Poor guy';

END;
$$

--Now check how it works
call userExeptionEx(4);

call userExeptionEx(7);

call userExeptionEx(70);

 