SELECT p.productCode,
       p.productName,
       SUM(od.quantityOrdered*od.priceEach) AS revenue
FROM products p
  JOIN orderdetails od ON od.productCode = p.productCode
GROUP BY p.productCode,
         p.productName
ORDER BY p.productCode;