WITH product2003 AS
(
  SELECT od.productCode,
         SUM(od.quantityOrdered*od.priceEach) AS saled2003
  FROM orderdetails od
    JOIN orders o ON od.orderNumber = o.orderNumber
  WHERE EXTRACT(YEAR FROM o.orderDate) = 2003
  GROUP BY od.productCode
),
product2004 AS
(
  SELECT od.productCode,
         SUM(od.quantityOrdered*od.priceEach) AS saled2004
  FROM orderdetails od
    JOIN orders o ON od.orderNumber = o.orderNumber
  WHERE EXTRACT(YEAR FROM o.orderDate) = 2004
  GROUP BY od.productCode
)
SELECT p.productCode,
       COALESCE(c1.saled2003,0) AS saled2003,
       COALESCE(c2.saled2004,0) AS saled2004,
       CASE
         WHEN c2.saled2004 IS NULL OR c2.saled2004 = 0 THEN COALESCE(c1.saled2003 / c2.saled2004,0)
         ELSE c1.saled2003 / c2.saled2004
       END AS ratio
FROM products p
  LEFT JOIN product2003 c1 ON p.productCode = c1.productCode
  LEFT JOIN product2004 c2 ON c1.productCode = c2.productCode
ORDER BY ratio DESC;