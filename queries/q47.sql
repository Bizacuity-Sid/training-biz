SELECT customernumber,
       SUM(amount) AS total_amount
FROM payments
GROUP BY customernumber;