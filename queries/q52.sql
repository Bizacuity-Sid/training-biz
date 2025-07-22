SELECT c.customerNumber,
       c.customerName,
       AVG(o.shippedDate - o.orderDate) AS avgdaysToShip
FROM Customers c
  JOIN Orders o ON c.customerNumber = o.customerNumber
WHERE o.shippedDate IS NOT NULL
GROUP BY c.customerNumber,
         c.customerName
ORDER BY avgdaysToShip DESC;