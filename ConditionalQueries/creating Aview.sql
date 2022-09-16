--CREATE VIEW cusAddjoin  as 
--(select first_name,last_name,address from customer
--inner join address
--on customer.address_id = address.address_id)

select first_name, address from cusAddjoin
where first_name ilike 'A%'