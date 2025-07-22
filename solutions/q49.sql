SELECT customerNumber,
       COUNT(1) AS No_Of_Orders
FROM orders
WHERE status = 'On Hold'
GROUP BY customerNumber