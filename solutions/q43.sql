SELECT country,
       COUNT(1) AS no_of_customer
FROM customers
WHERE country IN ('Denmark','Norway','Sweden')
GROUP BY country