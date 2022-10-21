drop function cursorEx()

create or replace procedure cursorEx()
language plpgsql 
as
$$
declare  
--declare the variable and the cursor
c1 cursor for select * from emp;
--CursorName cursor (c1 ia a variable and its type is cursor.)
--for which query ?? for this query --> select * from cars;

r1 record;

begin

--Now open the cursor
   open c1;

--fetch a row using the cursor
   fetch first from c1 into r1;
--fetch the first row
--assign the fetch data into the variable.
--So r1 contains the first row of the returned query

--Use the fetched data for some tasks

   raise notice 'Employee name: % ' , r1.name;
   raise notice 'Salary % ', r1.salary;

--Now close the cursor 
   close c1;

end
$$



--Now call the function

call cursorEx();