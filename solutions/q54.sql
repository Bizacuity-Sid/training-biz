SELECT cus.salesrepemployeenumber, 
       SUM(od.quantityordered*(od.priceeach - prod.buyprice)) AS profit      
FROM orderdetails od
  INNER JOIN orders ord ON od.ordernumber = ord.ordernumber
  INNER JOIN customers cus ON ord.customernumber = cus.customernumber
  INNER JOIN employees emp ON cus.salesrepemployeenumber = emp.employeenumber
  INNER JOIN products prod ON od.productcode = prod.productcode
GROUP BY cus.salesrepemployeenumber
order by profit desc;