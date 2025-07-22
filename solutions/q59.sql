WITH Pay_in_2004 AS
(
  SELECT EXTRACT(MONTH FROM paymentdate) AS m,
         SUM(amount) AS totalpaid
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2004
  GROUP BY EXTRACT(MONTH FROM paymentdate)
),
Pay_in_2003 AS
(
  SELECT EXTRACT(MONTH FROM paymentdate) AS m,
         SUM(amount) AS totalpaid
         FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2003
  GROUP BY EXTRACT(MONTH FROM paymentdate)
)
SELECT Pay_in_2004.m,
      (Pay_in_2004.totalpaid - Pay_in_2003.totalpaid) AS diffrence    
FROM Pay_in_2004
  INNER JOIN Pay_in_2003 ON Pay_in_2004.m = Pay_in_2003.m
  ORDER BY m;