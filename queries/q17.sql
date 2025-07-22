SELECT customername
FROM customers
WHERE REGEXP_LIKE (customername,'[0-9]');