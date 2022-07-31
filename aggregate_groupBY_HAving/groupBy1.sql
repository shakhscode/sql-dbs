select customer_id, count(amount) from payment 
group by customer_id
order by count(amount) desc
limit 10