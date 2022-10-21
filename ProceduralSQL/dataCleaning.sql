-- Data cleaning

select * from bookings

--Step 1) Check for missing values.


create or replace procedure dynamicColumn(lim int)
language plpgsql
as $$
declare return_lim int = lim;
columnName varchar(50);
begin 
SELECT Column_name into columnName
FROM information_schema.columns
where table_name = 'bookings'
limit lim;
raise notice 'Column : %', columnName;
end;
$$

call dynamicColumn(2)