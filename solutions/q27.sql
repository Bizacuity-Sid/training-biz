SELECT Prod.productName
FROM customers custom
  INNER JOIN orders ON orders.customerNumber = custom.customerNumber
  INNER JOIN orderDetails ON orderDetails.orderNumber = orders.orderNumber
  INNER JOIN products prod ON prod.productCode = orderDetails.productCode
WHERE custom.customerName = 'Herkku Gifts'