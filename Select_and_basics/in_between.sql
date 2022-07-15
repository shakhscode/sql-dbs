select title, rating, release_year from film 
where rating in('R','PG')
order by rating 
limit 20
