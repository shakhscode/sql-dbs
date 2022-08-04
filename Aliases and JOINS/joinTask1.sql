select district, email from address
inner join customer ON
address.address_id = customer.address_id
where district = 'California'