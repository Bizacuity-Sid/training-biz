select (firstname||' '||lastname)AS fullname 
from employees
where firstname = 'Dianne' OR firstName = 'Diane' OR lastname = 'Dianne' OR lastname='Diane';