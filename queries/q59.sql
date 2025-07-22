WITH full_product AS
(
  SELECT od.productcode,
         EXTRACT(YEAR FROM o.orderdate) AS YEAR,
         SUM(od.priceeach*od.quantityordered) AS total_value
  FROM orderdetails od
    JOIN orders o ON od.ordernumber = o.ordernumber
  WHERE EXTRACT(YEAR FROM o.orderdate) = 2003
  OR    EXTRACT(YEAR FROM o.orderdate) = 2004
  GROUP BY od.productcode,
           EXTRACT(YEAR FROM o.orderdate)
),
product_2004 AS
(
  SELECT productcode,
         total_value AS value_2004
  FROM full_product
  WHERE YEAR = 2004
),
product_2003 AS
(
  SELECT productcode,
         total_value AS value_2003
  FROM full_product
  WHERE YEAR = 2003
)
SELECT p.productcode,
       t1.value_2004,
       t2.value_2003,
       (t2.value_2003 / t1.value_2004) AS ratio
FROM products p
  LEFT JOIN product_2004 t1 ON p.productcode = t1.productcode
  LEFT JOIN product_2003 t2 ON p.productcode = t2.productcode
ORDER BY p.productcode