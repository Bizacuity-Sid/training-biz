SELECT o.orderdate
FROM orders o
  INNER JOIN orderdetails od ON o.ordernumber = od.ordernumber
  INNER JOIN products p ON od.productcode = p.productcode
WHERE p.productName = '1940 Ford Pickup Truck'
ORDER BY o.orderdate DESC;