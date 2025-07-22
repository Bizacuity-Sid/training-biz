SELECT c.customername,
       p.amount
FROM payments p
  JOIN customers c ON p.customernumber = c.customernumber
WHERE p.amount > 100000
ORDER BY p.amount DESC;