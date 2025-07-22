WITH paid2004 AS
(
  SELECT EXTRACT(MONTH FROM p.paymentDate) AS MONTH,
         SUM(p.amount) AS totalpaid
  FROM payments p
  WHERE EXTRACT(YEAR FROM p.paymentDate) = 2004
  GROUP BY EXTRACT(MONTH FROM p.paymentDate)
  ORDER BY MONTH
),
paid2003 AS
(
  SELECT EXTRACT(MONTH FROM p.paymentDate) AS MONTH,
         SUM(p.amount) AS totalpaid
  FROM payments p
  WHERE EXTRACT(YEAR FROM p.paymentDate) = 2003
  GROUP BY EXTRACT(MONTH FROM p.paymentDate)
  ORDER BY MONTH
)
SELECT ct1.month,
       (ct1.totalpaid - ct2.totalpaid) AS diff
FROM paid2004 ct1
  JOIN paid2003 ct2 ON ct1.month = ct2.month;