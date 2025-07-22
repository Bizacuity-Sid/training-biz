WITH each_revenue
AS
(SELECT o.customerNumber,
       SUM(od.quantityOrdered*od.priceEach) AS revenue
FROM orderdetails od
  JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY o.customerNumber),
         total_revenue AS (SELECT SUM(revenue) AS total FROM each_revenue)
SELECT c.customerNumber,
       c.customerName,
       COALESCE(c1.revenue,0) AS revenue,
       COALESCE((c1.revenue / c2.total)*100,0) AS percentage
FROM total_revenue c2,
     customers c
  LEFT JOIN each_revenue c1 ON c.customerNumber = c1.customerNumber
ORDER BY c.customerName;