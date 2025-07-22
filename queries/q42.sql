SELECT country,
       COUNT(customernumber) AS count_customer
FROM customers
WHERE REGEXP_LIKE (country,'Denmark|Norway|Sweden')
GROUP BY country;