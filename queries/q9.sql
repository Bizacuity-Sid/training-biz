SELECT p.productName
FROM products p
  LEFT JOIN orderdetails od ON od.productCode = p.productCode
WHERE od.productCode IS NULL;