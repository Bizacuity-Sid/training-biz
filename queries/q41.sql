SELECT p.productname,
       p.quantityinstock
FROM products p
  JOIN orderdetails od ON p.productcode = od.productcode
  JOIN orders o ON od.ordernumber = o.ordernumber
WHERE o.status = 'On Hold';