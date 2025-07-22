SELECT prod.*
FROM products prod
  INNER JOIN orderdetails ordet ON prod.productCode = ordet.productCode
  INNER JOIN orders ord ON ord.orderNumber = ordet.orderNumber
ORDER BY ord.orderDate