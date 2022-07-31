select date(payment_date),sum(amount) from payment 
group by date(payment_date)
order by date(payment_date)
