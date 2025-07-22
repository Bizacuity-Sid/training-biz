WITH instock
AS
(SELECT productLine,
       SUM(quantityInStock) AS totalstock
FROM products
GROUP BY productLine)
SELECT p.productName,
       p.productLine,
       (p.quantityInStock / p1.totalstock)*100 AS percentage
FROM products p
  JOIN instock p1 ON p.productLine = p1.productLine
ORDER BY p.productLine,
         percentage DESC;