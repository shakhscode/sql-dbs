select customer_id, first_name, last_name, email ,

case customer_id
when 122/2 then '1st winner'
when  1678/4 then '2nd winner'
else 'Normal'
end as LDresult --this will be the column name returned by the case statement.
from customer
order by LDresult