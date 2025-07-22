SELECT prod.productcode,
        prod.productname,
       SUM(od.quantityordered*(od.priceeach - prod.buyprice)) AS profit
FROM orderdetails od
  INNER JOIN products prod ON od.productcode = prod.productcode
GROUP BY prod.productline,
         prod.productcode,
         prod.productname
ORDER BY profit DESC;