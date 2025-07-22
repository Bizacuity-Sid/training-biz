SELECT p.productname,
       o.orderdate
FROM products p
  INNER JOIN orderdetails od ON p.productcode = od.productcode
  INNER JOIN orders o ON od.ordernumber = o.ordernumber;