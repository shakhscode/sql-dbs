create or replace procedure procedure_1()
language plpgsql 
as $$
declare 

var1 varchar(200)='First procedure by Shakh' ;
begin 
raise notice 'Value assigned to the variable: %', var1;
end ;
$$

--Call the procedure
call procedure_1();