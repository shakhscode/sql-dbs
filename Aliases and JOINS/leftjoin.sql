select film.film_id, title, inventory_id 
from film
left join inventory ON
inventory.film_id = film.film_id
where inventory.film_id is NULL