SELECT productline,
       COUNT(productcode) AS No_Of_Products
FROM products
GROUP BY productline