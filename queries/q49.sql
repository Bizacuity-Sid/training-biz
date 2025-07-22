SELECT c.customername,
       o.ordernumber,
       SUM(od.priceeach*od.quantityordered) AS total
FROM orderdetails od
  JOIN orders o ON od.ordernumber = o.ordernumber
  JOIN customers c ON o.customernumber = c.customernumber
GROUP BY c.customername,
         o.ordernumber
HAVING SUM(od.priceeach*od.quantityordered) > 25000
ORDER BY c.customername;