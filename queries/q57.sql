WITH value_ordered AS
(
  SELECT o.customerNumber,
         SUM(od.quantityOrdered*od.priceEach) AS orderedval
  FROM orders o
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
  WHERE EXTRACT(YEAR FROM o.orderDate) = 2004
  AND   EXTRACT(MONTH FROM o.orderDate) = 5
  GROUP BY o.customerNumber
),
paid AS
(
  SELECT p.customerNumber,
         SUM(p.amount) AS totalpaid
  FROM payments p
  WHERE EXTRACT(YEAR FROM p.paymentDate) = 2004
  AND   EXTRACT(MONTH FROM p.paymentDate) = 5
  GROUP BY p.customerNumber
)
SELECT c.customerNumber,
       c.customerName,
       COALESCE(o.orderedval,0) AS orderedval,
       COALESCE(p.totalpaid,0) AS totalpaid,
       COALESCE(o.orderedval,0) -COALESCE(p.totalpaid,0) AS diff
       FROM Customers c
  LEFT JOIN value_ordered o ON c.customerNumber = o.customerNumber
  LEFT JOIN paid p ON c.customerNumber = p.customerNumber
ORDER BY diff DESC;