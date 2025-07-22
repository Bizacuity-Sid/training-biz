select (firstname||' '||lastname)AS fullname 
from employees
where firstname = 'Larry' OR firstName = 'Barry' OR lastname = 'Larry' OR lastname='Barry';