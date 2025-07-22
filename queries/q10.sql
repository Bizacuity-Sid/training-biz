SELECT concat(e.firstName,e.lastName) AS fullname
FROM employees e
  JOIN offices o ON o.officeCode = e.officeCode
WHERE o.city = 'Boston';