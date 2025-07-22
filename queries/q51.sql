SELECT e.employeeNumber,
       e.firstName,
       e.lastName,
       SUM(od.quantityOrdered*od.priceEach)*0.05 AS commission
FROM Employees e
  JOIN Customers c ON e.employeeNumber = c.salesRepEmployeeNumber
  JOIN Orders o ON c.customerNumber = o.customerNumber
  JOIN OrderDetails od ON o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber,
         e.firstName,
         e.lastName
ORDER BY e.lastName,
         e.firstName;