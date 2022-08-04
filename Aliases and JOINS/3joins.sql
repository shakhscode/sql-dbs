select film.film_id,title,film_actor.film_id, film_actor.actor_id, first_name,last_name
from film
inner join film_actor ON
film.film_id = film_actor.film_id 
inner join actor on 
actor.actor_id = film_actor.actor_id
where actor.actor_id = 2