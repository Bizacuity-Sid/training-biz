WITH cte1 AS
(
  SELECT productline,
         SUM(quantityinstock) AS productline_stock
  FROM products
  GROUP BY productline
)
SELECT p.productcode,
       p.productline,
       p.quantityinstock,
       ROUND(p.quantityinstock / c.productline_stock*100,2) AS percentage
FROM products p
  JOIN cte1 c ON p.productline = c.productline
ORDER BY p.productline,
         percentage DESC