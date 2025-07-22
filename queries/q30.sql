SELECT concat(e1.firstname,concat (' ',e1.lastname)) AS EmployeeName
FROM employees e1
  JOIN employees e2 ON e1.reportsto = e2.employeenumber
WHERE concat(e2.firstname,concat(' ',e2.lastname)) = 'Mary Patterson';