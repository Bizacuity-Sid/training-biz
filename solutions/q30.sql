SELECT custom.customername
FROM customers custom
  INNER JOIN Payments pay ON pay.customerNumber = custom.customerNumber 
  MINUS 
  SELECT custom.customername FROM customers custom
  INNER JOIN Payments pay ON pay.customerNumber = custom.customerNumber
WHERE EXTRACT(year FROM pay.paymentDate) = 2003