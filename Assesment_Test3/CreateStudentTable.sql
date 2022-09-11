create table students(
	student_id serial unique ,
	first_name varchar(100) not null,
	last_name varchar(100) not null, 
	homeroom_number int primary key,
	phone varchar(16) unique,
	email varchar(150) unique, 
	graduation_year timestamp,
	check (graduation_year>'1-1-2020')
)