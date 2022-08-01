select customer_id, count(payment) as no_of_transactions
from payment
group by customer_id 
having count(payment) > 30
order by count(payment) DESC  
--can't use the name 'no_of_transactions' as aliases are created executing all commands.
							  
