select staff_id, customer_id, sum(amount) from payment 
group by staff_id, customer_id
order by sum(amount)