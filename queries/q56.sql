WITH total_ordered AS
(
  SELECT o.customernumber,
         SUM(od.priceeach*od.quantityordered) AS tot_ordered
  FROM orderdetails od
    JOIN orders o ON od.ordernumber = o.ordernumber
  WHERE EXTRACT(YEAR FROM o.orderdate) = 2004
  AND   EXTRACT(MONTH FROM o.orderdate) = 05
  GROUP BY o.customernumber
),
total_amount AS
(
  SELECT customernumber,
         SUM(amount) AS tot_amount
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2004
  AND   EXTRACT(MONTH FROM paymentdate) = 05
  GROUP BY customernumber
)
SELECT c.customernumber,
       NVL(c1.tot_ordered,0),
       NVL(c2.tot_amount,0),
       NVL(c1.tot_ordered,0) - NVL(c2.tot_amount,0) AS difference
FROM customers c
  LEFT JOIN total_ordered c1 ON c.customernumber = c1.customernumber
  LEFT JOIN total_amount c2 ON c.customernumber = c2.customernumber