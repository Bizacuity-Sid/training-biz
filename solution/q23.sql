select (firstname||' '||lastname) as fullname 
from employees e
where firstname LIKE '%[^a-z]%'
or lastname LIKE '%[^a-z]%';