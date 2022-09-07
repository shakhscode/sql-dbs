select firstname,surname,starttime from cd.members
inner join cd.bookings
on members.memid= bookings.memid
where firstname = 'David' and surname = 'Farrell'

order by starttime

