SELECT ordDet.productCode,
       (ordDet.quantityOrdered*ordDet.priceEach) AS value_of_order
FROM orders ord
  INNER JOIN orderDetails ordDet ON ordDet.orderNumber = ord.OrderNumber
WHERE ord.status = 'On Hold'