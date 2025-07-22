select *  
from employees 
where reportsto=(select employeenumber from employees where firstname='William' AND lastname='Patterson');