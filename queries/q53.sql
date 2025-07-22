SELECT e.employeeNumber,
       e.firstName,
       e.lastName,
       SUM(od.quantityOrdered*od.priceEach) AS totalRevenue
FROM Employees e
  JOIN Customers c ON e.employeeNumber = c.salesRepEmployeeNumber
  JOIN Orders o ON c.customerNumber = o.customerNumber
  JOIN OrderDetails od ON o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber,
         e.firstName,
         e.lastName
ORDER BY totalRevenue;