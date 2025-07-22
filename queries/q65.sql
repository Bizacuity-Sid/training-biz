WITH each_profit
AS
(SELECT o.customerNumber,
       SUM((od.priceEach - p.buyPrice)*od.quantityOrdered) AS profit
FROM products p
  JOIN orderdetails od ON p.productCode = od.productCode
  JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY o.customerNumber),
         total_profit AS (SELECT SUM(profit) AS total FROM each_profit)
SELECT c.customerNumber,
       c.customerName,
       COALESCE(c1.profit,0) AS profit,
       COALESCE((c1.profit / c2.total)*100,0) AS percentage
FROM total_profit c2,
     customers c
  LEFT JOIN each_profit c1 ON c.customerNumber = c1.customerNumber
ORDER BY percentage DESC;