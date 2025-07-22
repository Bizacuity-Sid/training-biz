SELECT productline,
       COUNT(productCode) AS total
FROM products
GROUP BY productline
ORDER BY productline;