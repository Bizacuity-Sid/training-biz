SELECT customernumber,
       COUNT(status) AS count_onhold
FROM orders
WHERE status = 'On Hold'
GROUP BY customernumber;