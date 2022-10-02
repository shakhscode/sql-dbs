select * from film

select title, rating, replacement_cost ,
last_value(title)
over (partition by rating order by replacement_cost desc 
range between unbounded preceding and unbounded following )  as worst_one
from film 