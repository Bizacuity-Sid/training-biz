WITH cte1 AS
(
  SELECT od.productcode,o.orderdate
  FROM orderdetails od
    JOIN orders o ON od.ordernumber = o.ordernumber
  WHERE (EXTRACT(YEAR FROM o.orderdate) = 2003
  OR    EXTRACT(YEAR FROM o.orderdate) = 2004)
  AND   EXTRACT(MONTH FROM o.orderdate) =05
),
may_03 AS
(
  SELECT productcode
  FROM cte1
  WHERE EXTRACT(YEAR FROM orderdate) = 2003
),
may_04 AS
(
  SELECT productcode
  FROM cte1
  WHERE EXTRACT(YEAR FROM orderdate) = 2004
)
SELECT m3.productcode
FROM may_03 m3
LEFT JOIN may_04 m4 ON m3.productcode = m4.productcode
WHERE m4.productcode IS NULL;
 

SELECT od.productcode
FROM orderdetails od
  JOIN orders o ON od.ordernumber = o.ordernumber
WHERE (EXTRACT(YEAR FROM o.orderdate) = 2003 OR EXTRACT(YEAR FROM o.orderdate) = 2004)
AND   EXTRACT(MONTH FROM o.orderdate) = 05
GROUP BY od.productcode
HAVING MAX(EXTRACT(YEAR FROM o.orderdate)) = 2003