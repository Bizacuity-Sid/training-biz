WITH pay2004 AS
(
  SELECT SUM(amount) AS totalpaid,
         customernumber
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2004
  GROUP BY customernumber
),
pay2003 AS
(
  SELECT SUM(amount) AS totalpaid,
         customernumber
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2003
  GROUP BY customernumber
)
SELECT c.customernumber,
       (pay2004.totalpaid / pay2003.totalpaid) AS ratio_of_payments
FROM customers c left join pay2004 on c.customernumber=pay2004.customernumber
  left JOIN pay2003 ON pay2004.customernumber = pay2003.customernumber
ORDER BY c.customernumber;