SELECT paymentdate,
       SUM(amount) as Total
FROM payments
GROUP BY paymentdate
ORDER BY paymentdate;