SELECT p.productname
FROM products p
  INNER JOIN orderdetails od ON p.productcode = od.productcode
  INNER JOIN orders o ON od.ordernumber = o.ordernumber
  INNER JOIN customers c ON o.customernumber = c.customernumber
WHERE c.customername = 'Herkku Gifts';