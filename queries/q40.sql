SELECT COUNT(o.orderNumber) AS total
FROM orders o
  JOIN customers c ON c.customerNumber = o.customerNumber
WHERE c.customerName = 'Herkku Gifts';