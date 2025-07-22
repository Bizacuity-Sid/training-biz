SELECT concat(e1.firstName,e1.lastName) AS fullname
FROM employees e1
  JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
WHERE e2.firstName = 'Mary'
AND   e2.lastName = 'Patterson';