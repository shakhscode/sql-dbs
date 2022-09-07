select f1.title, f1.length, f2.title
from film as f1
inner join film as f2
on f1.title != f2.title
AND f1.length = f2.length