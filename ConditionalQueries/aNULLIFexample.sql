select 
nullif(sum(case when rating = 'PG' then 1  else 0 end), 
	 sum(case when rating ='PG-13' then 1 else 0 end))
	  from film 
	  
