WITH may2003 AS
(
  SELECT p.productName,
         p.productCode
  FROM products p
    JOIN orderdetails od ON od.productCode = p.productCode
    JOIN orders o ON o.orderNumber = od.orderNumber
  WHERE EXTRACT(YEAR FROM o.orderDate) = 2003
  AND   EXTRACT(MONTH FROM o.orderDate) = 5
),
may2004 AS
(
  SELECT p1.productName,
         p1.productCode
  FROM products p1
    JOIN orderdetails od1 ON od1.productCode = p1.productCode
    JOIN orders o1 ON o1.orderNumber = od1.orderNumber
  WHERE EXTRACT(YEAR FROM o1.orderDate) = 2004
  AND   EXTRACT(MONTH FROM o1.orderDate) = 5
)
SELECT p1.productCode,
       p1.productName
FROM may2003 p1
  LEFT JOIN may2004 p2 ON p1.productCode = p2.productCode
WHERE p2.productCode IS NULL;