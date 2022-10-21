select * from emp

--Write a procedure using cursor that will update 
--the status of the emp if salary >100000 then 'Elite' else 'normal'

--add a column to the employee table
alter table emp 
add salStatus  varchar(10);


--Now create a procedure to update the salary Status
create or replace procedure updateStatus()
language plpgsql
as 
$$
declare 
row_ emp%rowtype; --this variable will contain the row returned by the cursor

--define cursor
cur cursor for select * from emp;
status varchar(10);
begin

--open the cursor 
open cur;

--make a loop to refer to row at a time
   loop
 --fetche the row to row_
   fetch cur into row_;
   exit when not found;
   if row_.salary >= 100000 then 
       status = 'Elite';
   elseif row_.salary > 80000 and row_.salary<100000 then 
       status = 'Good';
   else 
       status = 'Normal';
   end if;
--Now update the database
  update emp set Salstatus = status where current of cur;
  end loop;

--close the cursor 
close cur;

end;
$$

--call the procedure
call updateStatus()

--Now check the result
select * from emp