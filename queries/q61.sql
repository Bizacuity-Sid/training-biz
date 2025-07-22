WITH pay2003 AS
(
  SELECT customerNumber,
         SUM(amount) AS pay
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentDate) = 2003
  GROUP BY customerNumber
),
pay2004 AS
(
  SELECT customerNumber,
         SUM(amount) AS pay
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentDate) = 2004
  GROUP BY customerNumber
)
SELECT c.customerNumber,
       COALESCE(c1.pay,0) AS pay03,
       COALESCE(c2.pay,0) AS pay04,
       CASE
         WHEN c2.pay IS NULL OR c2.pay = 0 THEN COALESCE(c1.pay / c2.pay,0)
         ELSE COALESCE(c1.pay / c2.pay,0)
       END AS ratio
FROM customers c
  LEFT JOIN pay2003 c1 ON c.customerNumber = c1.customerNumber
  LEFT JOIN pay2004 c2 ON c.customerNumber = c2.customerNumber
ORDER BY ratio DESC;