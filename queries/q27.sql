SELECT c.customerName,
       p.productName
FROM customers c
  JOIN orders o ON o.customerNumber = c.customerNumber
  JOIN orderdetails od ON od.orderNumber = o.orderNumber
  JOIN products p ON p.productCode = od.productCode
WHERE c.customerName = 'Herkku Gifts';