SELECT prod.ProductName
FROM products prod
  INNER JOIN orderDetails ord ON ord.productCode = prod.productCode
WHERE ord.priceeach >= 2*prod.buyprice






List the products ordered on a Monday.
SELECT products.ProductName,
 orders.orderDate
FROM products
  INNER JOIN orderDetails ON orderDetails.productCode = products.productCode
  INNER JOIN orders ON orders.orderNumber = orderDetails.orderNumber
WHERE TO_CHAR(orders.orderDate,'D') = 2