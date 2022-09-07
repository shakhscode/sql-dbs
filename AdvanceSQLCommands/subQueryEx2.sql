select film_id, title 
from film 
where film_id in
(select inventory.film_id 
from rental 
inner join inventory on rental.inventory_id = inventory.inventory_id
where return_date between '2005-05-29' and '2005-05-30')
order by film_id