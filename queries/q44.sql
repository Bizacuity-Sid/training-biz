SELECT SUM(od.priceeach*od.quantityordered) AS Total_value
FROM calendar c
  JOIN orders o ON c.calendar_date = o.shippeddate
  JOIN orderdetails od ON o.ordernumber = od.ordernumber
WHERE year_month IN '2004-08';