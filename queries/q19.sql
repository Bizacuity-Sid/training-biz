SELECT productname
FROM products
WHERE lower(productname) LIKE '%ship%'
OR    lower(productname) LIKE '%boat%';