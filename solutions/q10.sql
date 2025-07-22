SELECT (e.firstname|| ' ' ||e.lastname) AS employeename
FROM employees e
  INNER JOIN offices o ON e.officecode = o.officecode
WHERE o.city = 'Boston';