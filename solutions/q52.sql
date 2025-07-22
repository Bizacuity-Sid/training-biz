SELECT customerNumber,
       avg(shippedDate - orderDate) AS averagetime
FROM orders
GROUP BY customerNumber
ORDER BY avg(shippedDate - orderDate) DESC