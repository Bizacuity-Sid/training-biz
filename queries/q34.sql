SELECT SUM(amount) AS total
FROM payments
WHERE EXTRACT(YEAR FROM paymentDate) = 2004
AND   EXTRACT(MONTH FROM paymentDate) = 10
AND   EXTRACT(DAY FROM paymentDate) = 28;