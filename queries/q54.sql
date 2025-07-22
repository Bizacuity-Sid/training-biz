SELECT p.productname,
       SUM(od.priceeach*od.quantityordered) AS total_revenue
FROM orderdetails od
  JOIN products p ON od.productcode = p.productcode
GROUP BY p.productname
ORDER BY p.productname;