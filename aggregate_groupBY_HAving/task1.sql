select staff_id, count(payment_id) from payment
group by staff_id