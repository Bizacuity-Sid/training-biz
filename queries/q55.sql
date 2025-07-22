SELECT p.productline,
       SUM((od.priceeach - p.buyprice)*od.quantityordered) AS profit
FROM orderdetails od
  JOIN products p ON od.productcode = p.productcode
GROUP BY p.productline
ORDER BY profit DESC,
         Productline