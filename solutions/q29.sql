SELECT prod.productcode,
       prod.productname
FROM products prod
  INNER JOIN orderdetails od on prod.productcode = od.productcode
  INNER JOIN orders o on od.ordernumber = o.ordernumber
WHERE to_char(o.orderdate,'fmmonth yyyy') = 'may 2003'
MINUS
SELECT prod.productcode,
       prod.productname
FROM products prod
  INNER JOIN orderdetails od on prod.productcode = od.productcode
  INNER JOIN orders o on od.ordernumber = o.ordernumber
WHERE to_char(o.orderdate,'fmmonth yyyy') = 'may 2004';