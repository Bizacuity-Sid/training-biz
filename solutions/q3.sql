SELECT e.firstname,
       e.lastname,
       c.customername
FROM employees e
  INNER JOIN customers c ON e.employeenumber = c.salesrepemployeenumber
;