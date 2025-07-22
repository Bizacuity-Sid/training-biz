SELECT SUM(amount),
       customernumber
FROM payments
GROUP BY customernumber
ORDER BY customernumber;