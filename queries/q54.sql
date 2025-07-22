SELECT e.employeeNumber,
       e.firstName,
       e.lastName,
       SUM((od.priceEach - p.buyPrice)*od.quantityOrdered) AS totalProfit
FROM Employees e
  JOIN Customers c ON e.employeeNumber = c.salesRepEmployeeNumber
  JOIN Orders o ON c.customerNumber = o.customerNumber
  JOIN OrderDetails od ON o.orderNumber = od.orderNumber
  JOIN Products p ON od.productCode = p.productCode
GROUP BY e.employeeNumber,
         e.firstName,
         e.lastName
ORDER BY totalProfit DESC;