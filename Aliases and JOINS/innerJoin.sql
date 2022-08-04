select customer.customer_id, payment.amount, customer.first_name from customer 
INNER join payment on payment.customer_id = customer.customer_id