select customer_id, first_name, last_name, email ,

case
when customer_id <= 100 then 'Premium'
when customer_id between 101 and 200 then 'Plus Member'
else 'Normal'
end as CusType --this will be the column name returned by the case statement.
from customer

order by customer_id
