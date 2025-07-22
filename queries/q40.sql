SELECT SUM(od.priceeach*od.QUANTITYORDERED) AS Total_value
FROM orders o
  JOIN orderdetails od ON o.ordernumber = od.ordernumber
WHERE o.status = 'On Hold';