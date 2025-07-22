WITH total_revenue AS
(
  SELECT SUM(quantityordered*priceeach) AS revenue
  FROM orderdetails
),
customer_revenue AS
(
  SELECT o.customernumber,
         SUM(od.quantityordered*od.priceeach) AS revenue_value
  FROM orderdetails od
    JOIN orders o ON od.ordernumber = o.ordernumber
  GROUP BY o.customernumber
)
SELECT c.customernumber,
       c.customername,
       COALESCE(cr.revenue_value,0) AS c_revenue,
       ROUND((COALESCE(cr.revenue_value,0) / tr.revenue)*100,2) AS revenue_percentage
FROM customers c
  CROSS JOIN total_revenue tr
  LEFT JOIN customer_revenue cr ON c.customernumber = cr.customernumber
ORDER BY c.customername;