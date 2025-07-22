SELECT productline,
       COUNT(productcode) AS total_products
FROM products
GROUP BY productline;