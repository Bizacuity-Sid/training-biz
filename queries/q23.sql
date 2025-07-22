SELECT productvendor
FROM products
WHERE productvendor LIKE '%Diecast'
GROUP BY productvendor;