SELECT SUM(amount) AS Total_Payments
FROM Payments
WHERE EXTRACT(year FROM paymentDate) = 2004
AND   EXTRACT(month FROM paymentDate) = 10
AND   EXTRACT(day FROM paymentDate) = 28