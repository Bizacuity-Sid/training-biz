SELECT customerNumber,
       SUM(amount) Payment_by_customer
FROM Payments
GROUP BY customerNumber