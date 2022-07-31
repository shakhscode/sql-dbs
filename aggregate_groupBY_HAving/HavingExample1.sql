select customer_id,sum(amount)
from payment
group by customer_id
having sum(amount) > 180