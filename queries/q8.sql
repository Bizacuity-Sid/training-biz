WITH soldProducts AS
(
  SELECT DISTINCT od.productcode
  FROM orderdetails od
    JOIN orders o ON od.ordernumber = o.ordernumber
  WHERE o.status != 'Cancelled'
)
SELECT p.productcode,
       p.productname
FROM products p
  LEFT JOIN soldProducts sp ON p.productcode = sp.productcode
WHERE sp.productcode IS NULL;