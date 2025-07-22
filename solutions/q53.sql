SELECT cust.salesrepemployeenumber,
       sum(od.quantityordered*od.priceeach) as revenue       
FROM orderdetails od
  INNER JOIN orders ord on od.ordernumber = ord.ordernumber
  INNER JOIN customers cust on ord.customernumber = cust.customernumber
  INNER JOIN employees emp on cust.salesrepemployeenumber = emp.employeenumber
GROUP BY cust.salesrepemployeenumber;