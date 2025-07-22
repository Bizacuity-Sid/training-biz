SELECT orderNumber,
       SUM(quantityordered*priceEach) AS amount
FROM orderDetails
GROUP BY orderNumber
HAVING SUM(quantityordered*priceEach) > 5000