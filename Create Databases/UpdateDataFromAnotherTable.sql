UPDATE jobaccount
set hiredate = accounts.lastlogin
from accounts
where jobaccount.user_id = accounts.user_id