WITH cte1 AS
(
  SELECT o.customernumber,
         SUM((od.quantityordered*od.priceeach) -(od.quantityordered*p.buyprice)) AS profit
  FROM orderdetails od
    JOIN products p ON od.productcode = p.productcode
    JOIN orders o ON od.ordernumber = o.ordernumber
  GROUP BY o.customernumber
),
cte2 AS
(
  SELECT SUM((od.quantityordered*od.priceeach) -(od.quantityordered*p.buyprice)) AS total_profit
  FROM orderdetails od
    JOIN products p ON od.productcode = p.productcode
)
SELECT c.customernumber,
       COALESCE(c1.profit,0) AS Profit,
       ROUND(COALESCE(c1.profit,0) / c2.total_profit*100,2) AS percentage
FROM customers c
  CROSS JOIN cte2 c2
  LEFT JOIN cte1 c1 ON c.customernumber = c1.customernumber
ORDER BY Profit DESC