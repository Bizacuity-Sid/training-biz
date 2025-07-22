SELECT SUM(amount) AS total_payment
FROM payments
WHERE EXTRACT(YEAR FROM paymentdate) = 2004
AND   EXTRACT(MONTH FROM paymentdate) = 10
AND   EXTRACT(DAY FROM paymentdate) = 28;


36.How many products in each product line?
SELECT COUNT(productcode) AS total_products,
       productLine
FROM products
GROUP BY productline;