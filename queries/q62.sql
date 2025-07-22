WITH avg_amt AS
(
  SELECT AVG(amount) AS avg_pay FROM payments
)
SELECT p.customerNumber,
       p.amount
FROM payments p
  CROSS JOIN avg_amt c1
WHERE p.amount > 2*c1.avg_pay
order by p.amount;