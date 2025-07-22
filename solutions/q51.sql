SELECT emp.lastname|| ' ' || emp.firstname as employeename,
       sum(0.05*od.priceeach*od.quantityordered) as ordervalue
from employees emp
  INNER JOIN customers cust on emp.employeenumber = cust.salesrepemployeenumber
  INNER JOIN orders ord on cust.customernumber = ord.customernumber
  INNER JOIN orderdetails od on ord.ordernumber = od.ordernumber
group by emp.lastname,
         emp.firstname
order by emp.lastname,
         emp.firstname;