SELECT COUNT(o.ordernumber) AS Total_Orders
FROM orders o
  JOIN customers c ON o.customernumber = c.customernumber
WHERE c.customername = 'Herkku Gifts';