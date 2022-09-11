CREATE table accounts(
	user_id serial PRIMARY KEY,
	name varchar(60) not null,
	email varchar(100) unique not null,
	password varchar(16) not null,
	signupTime timestamp not null,
	lastLogin timestamp 
)