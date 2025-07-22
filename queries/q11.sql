SELECT o.orderdate
FROM orderdetails od 
  JOIN orders o ON od.ordernumber = o.ordernumber
  JOIN products p ON od.productcode = p.productcode
WHERE p.productname = '1940 Ford Pickup Truck'
ORDER BY o.orderdate DESC;