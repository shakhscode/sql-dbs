create or replace procedure procedure_1()
language plpgsql 
as $$
declare 
var1 varchar(200)='First procedure by Shakh' ;

var2 varchar(30) DEFAULT 'Default Value';
var3 constant float = 3.14;

--var2 = 'Value changed'


begin 
var1 = 'Value is different then first assigned';
var2= 'Value changed';
raise notice 'Value assigned to the variable: %', var1;
raise notice 'Value assigned to the variable: %', var2;
end ;
$$

call procedure_1()