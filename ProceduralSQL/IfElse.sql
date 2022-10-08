create or replace procedure procedure_2()
language plpgsql 
as $$
declare 
var1 integer = 78;
begin 
if var1>100
then 
raise notice '% is grater than 100', var1;
elseif var1=100
then
raise notice '% is equal to 100', var1;
else
raise notice '% is less than 100', var1;
end if;
end ;
$$

call procedure_2()