SELECT c.salesrepemployeenumber,
       SUM((od.priceeach - p.buyprice)*od.quantityordered) AS profit
FROM orderdetails od
  JOIN orders o ON od.ordernumber = o.ordernumber
  JOIN customers c ON o.customernumber = c.customernumber
  JOIN products p ON od.productcode = p.productcode
GROUP BY c.salesrepemployeenumber
ORDER BY profit desc