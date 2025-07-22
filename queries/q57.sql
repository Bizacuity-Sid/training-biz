WITH total_ordered AS
(
  SELECT EXTRACT(MONTH FROM o.orderdate) AS Month_order,
         SUM(od.priceeach*od.quantityordered) AS tot_ordered
  FROM orderdetails od
    JOIN orders o ON od.ordernumber = o.ordernumber
  WHERE EXTRACT(YEAR FROM o.orderdate) = 2004
  GROUP BY EXTRACT(MONTH FROM o.orderdate)
),
total_amount AS
(
  SELECT EXTRACT(MONTH FROM paymentdate) AS Month_payment,
         SUM(amount) AS tot_amount
  FROM payments
  WHERE EXTRACT(YEAR FROM paymentdate) = 2004
  GROUP BY EXTRACT(MONTH FROM paymentdate)
)
SELECT t1.Month_order,
       t1.tot_ordered,
       t2.tot_amount,
       (t2.tot_amount / t1.tot_ordered) AS ratio
FROM total_ordered t1
  JOIN total_amount t2 ON t1.Month_order = t2.Month_payment
ORDER BY t1.Month_order