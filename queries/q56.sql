SELECT p.productLine,
       SUM((od.priceEach - p.buyPrice)*od.quantityOrdered) AS profit
FROM products p
  JOIN orderdetails od ON od.productCode = p.productCode
GROUP BY p.productLine
ORDER BY profit DESC;