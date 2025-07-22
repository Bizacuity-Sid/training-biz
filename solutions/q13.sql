SELECT prod.ProductName,
       orddet.priceeach
FROM products prod
  INNER JOIN orderDetails orddet ON orddet.productCode = prod.productCode
WHERE orddet.priceeach < 0.8*prod.MSRP