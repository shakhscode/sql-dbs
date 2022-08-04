-- unique to either table 1 or unique to table 2
-- a full outer join without any common element
select * from customer
full outer join payment
on payment.customer_id = customer.customer_id
where  customer.customer_id is null or payment.payment_id is null
--answer shows that there is no customer who didnot do any payment and there is no payment that 
-- is not done by a customer.