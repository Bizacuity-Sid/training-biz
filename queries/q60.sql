WITH total_payments AS
(
  SELECT customernumber,
         EXTRACT(YEAR FROM paymentdate) AS payment_year,
         SUM(amount) AS total_amount
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2003
  OR    EXTRACT(YEAR FROM paymentdate) = 2004
  GROUP BY customernumber,
           EXTRACT(YEAR FROM paymentdate)
),
payment_2003 AS
(
  SELECT customernumber,
         payment_year,
         total_amount
  FROM total_payments
  WHERE payment_year = 2003
),
payment_2004 AS
(
  SELECT customernumber,
         payment_year,
         total_amount
  FROM total_payments
  WHERE payment_year = 2004
)
SELECT c.customernumber,
       nvl(p1.total_amount,0) as amount2003,
       nvl(p2.total_amount,0) as amount2004,
       nvl((p1.total_amount/p2.total_amount),0) as ratio 
FROM customers c
  left  JOIN payment_2003 p1 ON c.customernumber = p1.customernumber
  left JOIN payment_2004 p2 ON c.customernumber = p2.customernumber 
order by c.customernumber