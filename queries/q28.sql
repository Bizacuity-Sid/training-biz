SELECT concat(e1.firstName,e1.lastName) AS fullname
FROM employees e1
  JOIN employees e2 ON e2.employeeNumber = e1.reportsTo
  JOIN employees e3 ON e3.employeeNumber = e2.reportsTo
WHERE e3.firstName = 'Diane'
AND   e3.lastName = 'Murphy';