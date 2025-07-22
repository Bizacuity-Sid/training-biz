SELECT custom.customerName,
       ord.orderNumber
FROM OrderDetails ordDet
  INNER JOIN orders ord ON ord.orderNumber = ordDet.orderNumber
  INNER JOIN Customers custom ON custom.customerNumber = ord.customerNumber
  group by  ord.orderNumber, custom.customerName
having sum(ordDet.quantityOrdered*ordDet.priceEach) > 25000