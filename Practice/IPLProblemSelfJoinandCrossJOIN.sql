just once. */

drop table teams;
create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders');
insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');
commit;

select * from teams



select * from teams t1             --Self join Syntax 1 
join teams t2
on t1.team_code = t2.team_code    --Will give exact copy of the table if 

select * 
from teams t1, teams t2             -- Self join syntax 2 (shortcut)
where t1.team_code = t2.team_code  

select * 
from teams t1, teams t2   --Cross join syntax 1
                                                 --Cross join does not require a common column
select * from teams t1    --Cross join syntax 2
cross join teams t2


 -- Final answer to the problem: Play only once
select t1.team_name as team, t2.team_name as opponent
from teams t1, teams t2
where t1.ctid < t2.ctid
order by t1.team_name;


--Play twice
select t1.team_name as team, t2.team_name as opponent
from teams t1, teams t2
where t1.ctid = t2.ctid
order by t1.team_name;


