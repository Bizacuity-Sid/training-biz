SELECT SUM(od.priceeach*od.quantityOrdered) AS price
FROM orders ord
  INNER JOIN OrderDetails od ON od.orderNumber = ord.orderNumber
WHERE EXTRACT(month FROM ord.shippedDate) = 8
AND   EXTRACT(year FROM ord.shippedDate) = 2004