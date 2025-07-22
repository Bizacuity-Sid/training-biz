SELECT od.productcode, prod.productname,
       SUM(od.quantityordered*od.priceeach) AS revenue      
FROM orderdetails od
  JOIN products prod ON od.productcode = prod.productcode
GROUP BY od.productcode,
         prod.productname
ORDER BY prod.productname;