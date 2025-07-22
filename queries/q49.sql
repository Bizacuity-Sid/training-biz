SELECT c.customerName,
       COUNT(o.status) AS on_hold
FROM customers c
  JOIN orders o ON o.customerNumber = c.customerNumber
WHERE o.status = 'On Hold'
GROUP BY customerName
ORDER BY customerName;