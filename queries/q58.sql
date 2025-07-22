(i.e., divide the value of payments made by the orders received)?* 
WITH value_ordered AS
(
  SELECT EXTRACT(MONTH FROM o.orderDate) AS MONTH,
         SUM(od.quantityOrdered*od.priceEach) AS orderedval
  FROM orders o
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
  WHERE EXTRACT(YEAR FROM o.orderDate) = 2004
  GROUP BY EXTRACT(MONTH FROM o.orderDate)
  ORDER BY MONTH
),
paid AS
(
  SELECT EXTRACT(MONTH FROM p.paymentDate) AS MONTH,
         SUM(p.amount) AS totalpaid
  FROM payments p
  WHERE EXTRACT(YEAR FROM p.paymentDate) = 2004
  GROUP BY EXTRACT(MONTH FROM p.paymentDate)
  ORDER BY MONTH
)
SELECT ct1.month,
       (ct2.totalpaid / ct1.orderedval) AS ratio
FROM paid ct2
  JOIN value_ordered ct1 ON ct1.month = ct2.month;