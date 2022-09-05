select count(*)
from payment
where extract(dow from payment_date) = 1

--dow = date of the week