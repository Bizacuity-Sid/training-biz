SELECT concat(e1.firstname,e1.lastname) AS fullname,
       concat(e2.firstname,e2.lastname) AS reportingPerson,
       e3.firstname AS President
FROM employees e1
  JOIN employees e2 ON e1.reportsto = e2.employeenumber
  JOIN employees e3 ON e2.reportsto = e3.employeenumber
WHERE concat(e3.firstname,concat(' ',e3.lastname)) = 'Diane Murphy';