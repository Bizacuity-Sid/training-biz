WITH avg_pay AS
(
  SELECT AVG(amount) AS average FROM payments
)
SELECT p.checknumber,
       p.amount,
       a.average
FROM payments p
  CROSS JOIN avg_pay a
WHERE p.amount >(2*a.average)