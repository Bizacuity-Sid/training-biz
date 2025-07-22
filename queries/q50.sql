SELECT c.customerName,
       o.orderNumber,
       SUM(od.quantityOrdered*od.priceEach) AS amt
FROM customers c
  JOIN orders o ON o.customerNumber = c.customerNumber
  JOIN orderdetails od ON od.orderNumber = o.orderNumber
GROUP BY o.orderNumber,
         c.customerName
HAVING SUM(od.quantityOrdered*od.priceEach) > 25000
ORDER BY amt DESC;