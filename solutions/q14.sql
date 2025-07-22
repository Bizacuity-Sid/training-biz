SELECT prod.ProductName
FROM products prod
  INNER JOIN orderDetails ord ON ord.productCode = prod.productCode
WHERE ord.priceeach >= 2*prod.buyprice





