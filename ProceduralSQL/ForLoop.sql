create or replace procedure testForloop()
language plpgsql
as $$
DECLARE   
BEGIN  
for i in 1..10
LOOP   
raise notice 'i = %',i;
END LOOP;  
END;  
$$

call testForloop()