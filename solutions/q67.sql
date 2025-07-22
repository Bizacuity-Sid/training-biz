WITH plstock as
(
  SELECT productline,
         SUM(quantityinstock*buyprice) as pl_stock_value
  FROM products
  GROUP BY productline
)
SELECT prod.productline,
       prod.productcode,
       prod.productname,
       prod.quantityinstock*prod.buyprice as stock_value,
       pls.pl_stock_value,
       round((prod.quantityinstock*prod.buyprice*100) / pls.pl_stock_value,2) as pl_stock_pct
FROM products prod
  JOIN plstock pls on prod.productline = pls.productline
ORDER BY prod.productline,
         pl_stock_pct desc;