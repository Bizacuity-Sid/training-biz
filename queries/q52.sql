SELECT e.employeenumber,
       SUM(od.priceeach*od.quantityordered) AS revenue
FROM orderdetails od
  JOIN orders o ON od.ordernumber = o.ordernumber
  JOIN customers c ON o.customernumber = c.customernumber
  JOIN employees e ON c.salesrepemployeenumber = e.employeenumber
GROUP BY e.employeenumber;