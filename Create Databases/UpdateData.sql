--select * from accounts
update accounts
set lastlogin = current_timestamp 
returning *