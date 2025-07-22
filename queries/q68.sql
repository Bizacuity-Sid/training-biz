WITH products_ordered
AS
(SELECT orderNumber,
       SUM(quantityOrdered*priceEach) AS total
FROM orderdetails
GROUP BY orderNumber
HAVING COUNT(productCode) > 2) 
SELECT od.orderNumber,
       od.productCode,
       (quantityOrdered*priceEach) AS product_value,
       c1.total,
       ((quantityOrdered*priceEach) / c1.total)*100 AS percentage
FROM orderdetails od
  JOIN products_ordered c1 ON od.orderNumber = c1.orderNumber
WHERE (quantityOrdered*priceEach) > c1.total*0.5;