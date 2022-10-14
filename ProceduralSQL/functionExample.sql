--create a function to know how many rows are there in a table.
CREATE OR REPLACE FUNCTION totalRecords()
RETURNS integer 
AS
$$ 

declare
	total integer;
BEGIN
   SELECT count(*) into total --way to assign value if not assigned during declaration
   FROM film;
   RETURN total;
END;
$$
LANGUAGE plpgsql;


--Now call the function.
select totalRecords();

--verify
select count(*) from film 




--Write a function to cheack a number is prime or not
create or replace function primeornot(num integer)
returns varchar(30)
as $$
declare 
num int = num; 
decision varchar(30) ;
onefound int = 0;
begin 

for i in 2..num/2
loop 
   if num % i =0
   then
   onefound = 1;
   exit; --exit the for loop
   end if;
end loop;
   
if onefound = 1
then 
decision = 'Is not a prime number.';
else 
decision = 'Is a prime number.';
end if;

return decision; 

end
$$
language plpgsql


--try it
select primeornot(17);


drop function primeornot;