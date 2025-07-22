SELECT c.customerName,
       p.amount
FROM customers c
  JOIN payments p ON p.customerNumber = c.customerNumber
WHERE p.amount > 100000
ORDER BY p.amount DESC;