SELECT p.quantityInStock,
       od.quantityOrdered,
       o.status
FROM products p
  JOIN orderdetails od ON od.productCode = p.productCode
  JOIN orders o ON o.orderNumber = od.orderNumber
WHERE o.status = 'On Hold';