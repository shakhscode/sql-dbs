select * from film

--Task: Select films which rental rate is higher than avg rental rate

--Way 1: Using subquery

select title, rental_rate from film 
where rental_rate > (select avg(rental_rate) from film)




--Way 2: Using WITH clause 
with rental_rate(AvgRentalRate) as 
(select avg(rental_rate) from film)

select title, rental_rate, cast(rr.AvgRentalRate  as int)
from film f, rental_rate rr
where f.rental_rate > rr.AvgRentalRate