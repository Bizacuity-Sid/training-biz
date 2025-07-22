WITH cte1 AS
(
  SELECT ordernumber,
         SUM(quantityordered*priceeach) AS total
  FROM orderdetails
  GROUP BY ordernumber
  HAVING COUNT(ordernumber) > 2
)
SELECT c.ordernumber,
       od.productcode,
       (od.quantityordered*od.priceeach) AS amount,
       c.total
FROM orderdetails od
  JOIN cte1 c ON od.ordernumber = c.ordernumber
WHERE (od.quantityordered*od.priceeach) >(c.total / 2)