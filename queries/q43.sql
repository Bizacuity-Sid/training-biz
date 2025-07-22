SELECT country,
       COUNT(customerNumber) AS no_of_customers
FROM customers
WHERE country = 'Denmark'
OR    country = 'Norway'
OR    country = 'Sweden'
GROUP BY country;