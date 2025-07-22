SELECT c.customerNumber,
       SUM(p.amount) AS paid
FROM customers c
  LEFT JOIN payments p ON p.customerNumber = c.customerNumber
GROUP BY c.customerNumber
ORDER BY customerNumber;