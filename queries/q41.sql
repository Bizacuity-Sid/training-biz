SELECT SUM(od.quantityOrdered*od.priceEach) AS on_hold_value
FROM orderdetails od
  JOIN orders o ON o.orderNumber = od.orderNumber
WHERE o.status = 'On Hold';