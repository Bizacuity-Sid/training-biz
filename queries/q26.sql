SELECT p.productname
FROM customers c
  JOIN orders o ON c.customernumber = o.customernumber
  JOIN orderdetails od ON o.ordernumber = od.ordernumber
  JOIN products p ON od.productcode = p.productcode
WHERE c.customername = 'Herkku Gifts';



WITH cte1 AS
(
  SELECT customernumber
  FROM customers
  WHERE LOWER(customername) = 'herkku gifts'
),
cte2 AS
(
  SELECT o.ordernumber
  FROM orders o
    JOIN cte1 c1 ON o.customernumber = c1.customernumber
),
cte3 AS
(
  SELECT od.productcode
  FROM orderdetails od
    JOIN cte2 c2 ON od.ordernumber = c2.ordernumber
  GROUP BY od.productcode
)
SELECT p.productcode,
       p.productname
FROM products p
  JOIN cte3 c3 ON p.productcode = c3.productcode