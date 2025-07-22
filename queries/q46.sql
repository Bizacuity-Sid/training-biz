SELECT orderNumber,
       SUM(quantityOrdered*priceEach) AS amt
FROM orderdetails
HAVING SUM(quantityOrdered*priceEach) > 5000
GROUP BY orderNumber
ORDER BY amt DESC;