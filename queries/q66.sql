WITH avg_pay
AS
(SELECT EXTRACT(year FROM paymentDate) AS year,
       EXTRACT(month FROM paymentDate) AS month,
       AVG(amount) AS average
FROM payments
GROUP BY EXTRACT(year FROM paymentDate),
         EXTRACT(month FROM paymentDate)
ORDER BY year,
         month) SELECT p.checkNumber,
         p.paymentDate,
         p.amount FROM payments p 
         JOIN avg_pay p1 ON p1.year = EXTRACT(year FROM p.paymentDate) AND p1.month = EXTRACT(month FROM p.paymentDate) 
         WHERE p.amount > 2*p1.average 
         ORDER BY p.paymentDate;