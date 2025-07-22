WITH payment_2003 AS
(
  SELECT DISTINCT customernumber
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = '2003'
)
SELECT c.customername
FROM payment_2003 p
  RIGHT JOIN customers c ON p.customernumber = c.customernumber
WHERE p.customernumber IS NULL;