-- Dataset
drop table emp_input;

--create the table
create table emp_input
(
id      int,
name    varchar(40)
);

--insert data
insert into emp_input values (1, 'Emp1');
insert into emp_input values (2, 'Emp2');
insert into emp_input values (3, 'Emp3');
insert into emp_input values (4, 'Emp4');
insert into emp_input values (5, 'Emp5');
insert into emp_input values (6, 'Emp6');
insert into emp_input values (7, 'Emp7');
insert into emp_input values (8, 'Emp8');

select * from emp_input;

--Way 1: Using concat, ntile, and string_agg()

--Step 1) Concat
select concat(id,' ', name) as Result
from emp_input

-- Step 2) Form bucket
select concat(id, ' ' , name) as nam, ntile(4) over() as bucket
from emp_input

--Step 3) Form the final result
select string_agg(name, ',') as Result 
from (select 
	  concat(id, ' ' , name) as name, 
	  ntile(4) over() as bucket
      from emp_input) as innertable
group by bucket
order by bucket

--Way 2: Using CTE
With cte as 
      (select 
	  concat(id, ' ' , name) as name, 
	  ntile(4) over() as buckets
      from emp_input)

select string_agg(name, ',')
from cte
group by buckets
order by buckets


