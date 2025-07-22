SELECT emp.firstName || ' ' || emp.Lastname AS Employee_Name
FROM employees emp
  INNER JOIN offices ofc ON emp.officecode = ofc.officecode
WHERE ofc.city = 'Boston'