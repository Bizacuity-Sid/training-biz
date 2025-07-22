SELECT o.orderdate,
       p.productname
FROM orderdetails od
  JOIN orders ON od.ordernumber = o.ordernumber
  JOIN products p ON od.productcode = p.productcode
ORDER BY o.orderdate;