select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) DESC
limit 5