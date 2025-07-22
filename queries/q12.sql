SELECT o.orderDate,
       p.productName
FROM orders o
  JOIN orderdetails od ON od.orderNumber = o.orderNumber
  JOIN products p ON p.productCode = od.productCode
WHERE p.productName = '1940 Ford Pickup Truck'
ORDER BY o.orderDate DESC;