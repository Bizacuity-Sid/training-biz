SELECT ordernumber
FROM orderdetails
GROUP BY ordernumber
HAVING SUM(priceeach*quantityordered) > 5000;