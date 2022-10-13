create or replace procedure procedure4()
language plpgsql
as $$
DECLARE  
i int = 1;  
BEGIN  
while i<=10
LOOP   
raise notice 'i = %',i;
i = i+1;  
END LOOP;  
END;  
$$

call procedure4()