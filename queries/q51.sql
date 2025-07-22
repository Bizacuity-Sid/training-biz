SELECT customernumber,
       AVG(shippeddate - orderdate) AS avgtime
FROM orders
GROUP BY customernumber
ORDER BY avgtime DESC;