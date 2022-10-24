drop table comments_and_translations;
--create the table

create table comments_and_translations
(
	id				int,
	comment			varchar(100),
	translation		varchar(100)
);

--insert data
insert into comments_and_translations values
(1, 'very good', null),
(2, 'good', null),
(3, 'bad', null),
(4, 'ordinary', null),
(5, 'cdcdcdcd', 'very bad'),
(6, 'excellent', null),
(7, 'ababab', 'not satisfied'),
(8, 'satisfied', null),
(9, 'aabbaabb', 'extraordinary'),
(10, 'ccddccbb', 'medium');
commit;

select * from comments_and_translations

--Solution 1
select 
   (case 
   when translation is null then comment
   else translation
   end) as Output
from comments_and_translations;

--Solution 2
select coalesce(translation, comment) as Output
from  comments_and_translations;



--Problem 2

DROP TABLE source;
CREATE TABLE source
    (
        id      int,
        name    varchar(1)
    );

DROP TABLE target;
CREATE TABLE target
    (
        id      int,
        name    varchar(1)
    );

INSERT INTO source VALUES (1, 'A');
INSERT INTO source VALUES (2, 'B');
INSERT INTO source VALUES (3, 'C');
INSERT INTO source VALUES (4, 'D');

INSERT INTO target VALUES (1, 'A');
INSERT INTO target VALUES (2, 'B');
INSERT INTO target VALUES (4, 'X');
INSERT INTO target VALUES (5, 'F');

COMMIT;


select * from source
select * from target 


Solution 1: Using full join & multiple case statements

select 
--first case for the id
  case 
     when s.id is not null and t.id is null then s.id
     when s.id is null and t.id is not null then t.id
     when s.id = t.id and s.name != t.name then s.id
  end as id,
--Second case for the comment
  case 
    when s.id is not null and t.id is null then 'New in source'
    when s.id is null and t.id is not null then 'New in trarget'
    when s.id = t.id and s.name != t.name then 'Mismatched'
end as id
from source s 
     full join target t
on s.id=t.id
where s.id is null or t.id is null or s.name !=t.name
order by 1
--The above solution is better.

Solution 2: Using union

--Find those are new in source table
select s.id, 'New in Source' as Comment
from source s
left join target t
on s.id = t.id
where t.id is null

union 
--Find the mismatched 
select s.id, 'Mismatched'  as Comment
from source s
inner join target t
on s.id = t.id
where s.name !=t.name

union 
select t.id, 'New in target' as Comment
from source s
right join target t
on s.id = t.id
where s.id is null

order by id;



--Problem 3


