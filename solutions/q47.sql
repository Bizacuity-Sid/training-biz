SELECT paymentDate, SUM(amount) Payment_by_date
FROM Payments
GROUP BY paymentDate