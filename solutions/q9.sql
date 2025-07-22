SELECT products.*
FROM products
WHERE productCode NOT IN (SELECT productCode FROM orderDetails)