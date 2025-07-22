SELECT distinct ordernumber
FROM orderdetails
WHERE priceeach*quantityordered > 5000;


48.Report the total payments by date date
SELECT SUM(amount),
       paymentdate
FROM payments
GROUP BY paymentdate
ORDER BY paymentdate;