SELECT customerNumber,
       customerName
FROM customers
WHERE REGEXP_LIKE (customerName,'\d');