SELECT o.orderDate,
       p.productName
FROM orders o
  JOIN orderdetails od ON o.orderNumber = od.orderNumber
  JOIN products p ON od.productCode = p.productCode
ORDER BY o.orderDate;