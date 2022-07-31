select store_id, count(customer_id) from customer
group by store_id
having count(customer_id)>300