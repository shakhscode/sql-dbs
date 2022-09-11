

CREATE TABLE teachers(
	teacher_id serial primary key,
	first_name varchar(100),
	last_name varchar(100),
	department varchar(100),
	homeroom_number int references students(homeroom_number)
	
)