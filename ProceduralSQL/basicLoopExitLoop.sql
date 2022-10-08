create or replace procedure procedure3()
language plpgsql
as $$
DECLARE  
i int = 1;  
BEGIN  
LOOP  
raise notice 'I am inside the loop'; --line 1
EXIT WHEN i>10;  
--check the condition to exit,
--if not true then don't exit
raise notice 'i = %',i; --line 2
i = i+1;  
END LOOP;  
END;  
$$

call procedure3()