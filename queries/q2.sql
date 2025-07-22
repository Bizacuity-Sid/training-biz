SELECT c.customername,
       concat(e.firstname,e.lastname) AS accountRepresentative
FROM Customers c
  LEFT JOIN Employees e ON c.salesrepemployeenumber = e.employeenumber;