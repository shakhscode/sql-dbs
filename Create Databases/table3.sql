create table jobAccount(
	user_id integer references accounts(user_id), --dont need to specify the constrain as it is referencing another table
	jodid integer references job(jodid),
	hireDate timestamp
)