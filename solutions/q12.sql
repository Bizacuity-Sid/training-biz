SELECT prod.ProductName,
       ord.orderDate
FROM products prod
  INNER JOIN orderDetails ON orderDetails.productCode = prod.productCode
  INNER JOIN orders ord ON ord.orderNumber = orderDetails.orderNumber
WHERE prod.productname LIKE '1940 Ford%'
ORDER BY ord.orderDate DESC