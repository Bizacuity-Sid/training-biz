WITH cte1 AS
(
  SELECT EXTRACT(MONTH FROM paymentdate) AS MONTH,
         EXTRACT(YEAR FROM paymentdate) AS YEAR,
         AVG(amount) AS average
  FROM payments
  GROUP BY EXTRACT(MONTH FROM paymentdate),
           EXTRACT(YEAR FROM paymentdate)
)
SELECT p.checknumber,
       p.amount,
       c1.Month,
       c1.Year,
       c1.average
FROM payments p
  JOIN cte1 c1 ON EXTRACT (MONTH FROM p.paymentdate) = c1.Month
WHERE p.amount > 2*c1.average
AND   EXTRACT(YEAR FROM p.paymentdate) = c1.Year
ORDER BY p.paymentdate;