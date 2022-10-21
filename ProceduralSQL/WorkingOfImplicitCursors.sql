select * from emp

--Write a procedure that increase the salary of all employees 
-- And see how many rows are affected using an implicit cursor.

create or replace procedure updateSalary()
language plpgsql 
as 
$$
declare number_of_rows_affected integer;

begin

update emp 
set salary = salary + 10000;

IF not found THEN  
   raise notice 'no customers updated';  
ELSIF found THEN  
   GET DIAGNOSTICS number_of_rows_affected = row_count; 
   raise notice '% rows updated',number_of_rows_affected;
END IF;   

end
$$

--Now call the procedure
call updateSalary();

--Now chack the updated table
select * from emp