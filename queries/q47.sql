SELECT paymentDate,
       SUM(amount) AS total
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate;