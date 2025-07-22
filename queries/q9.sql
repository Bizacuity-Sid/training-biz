SELECT concat(e.firstname,e.lastname) AS Employee
FROM Employees e
  JOIN Offices o ON e.officecode = o.officecode
WHERE LOWER(o.city) = 'boston';