SELECT DISTINCT p.productname
FROM products p
  INNER JOIN orderdetails od ON p.productcode = od.productcode
  INNER JOIN orders o ON od.ordernumber = o.ordernumber
WHERE TO_CHAR(o.orderdate,'DY') = 'MON';