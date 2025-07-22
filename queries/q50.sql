SELECT e.employeenumber,
       e.firstname,
       e.lastname,
       SUM(0.05*(od.priceeach*quantityordered)) AS tot_amount
FROM orderdetails od
  JOIN orders o ON od.ordernumber = o.ordernumber
  JOIN customers c ON o.customernumber = c.customernumber
  JOIN employees e ON c.salesrepemployeenumber = e.employeenumber
GROUP BY e.employeenumber,
         e.firstname,
         e.lastname
ORDER BY e.lastname,
         e.firstname;