WITH total_amount_2003 AS
(
  SELECT EXTRACT(MONTH FROM paymentdate) AS Month_payment_2003,
         SUM(amount) AS tot_amount_2003
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2003
  GROUP BY EXTRACT(MONTH FROM paymentdate)
),
total_amount_2004 AS
(
  SELECT EXTRACT(MONTH FROM paymentdate) AS Month_payment_2004,
         SUM(amount) AS tot_amount_2004
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2004
  GROUP BY EXTRACT(MONTH FROM paymentdate)
)
SELECT t1.Month_payment_2004 AS Months,
       t1.tot_amount_2004,
       t2.tot_amount_2003,
       (t1.tot_amount_2004 - t2.tot_amount_2003) AS Difference
FROM total_amount_2004 t1
  JOIN total_amount_2003 t2 ON t1.Month_payment_2004 = t2.Month_payment_2003
ORDER BY t1.Month_payment_2004