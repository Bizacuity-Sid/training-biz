SELECT SUM(od.quantityOrdered*od.priceEach) AS value_shipped
FROM orderdetails od
  JOIN orders o ON o.orderNumber = od.orderNumber
WHERE EXTRACT(year FROM o.orderDate) = 2004
AND   EXTRACT(month FROM o.orderDate) = 8
AND   o.status = 'Shipped';