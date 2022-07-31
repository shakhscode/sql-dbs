select rating,round(avg(replacement_cost),2) from film
group by rating
order by avg(replacement_cost)