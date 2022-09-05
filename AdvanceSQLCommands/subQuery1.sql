select count(title) from film 
where rental_rate > (select avg(rental_rate) from film)