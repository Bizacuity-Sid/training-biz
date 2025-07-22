SELECT p.productname,
       c.day_of_the_week
FROM calendar c
  JOIN orders o ON c.calendar_date = o.orderdate
  JOIN orderdetails od ON o.ordernumber = od.ordernumber
  JOIN products p ON od.productcode = p.productcode
WHERE od.priceeach >= (2*p.buyprice)
AND   c.day_of_the_week like '%Monday%' group by p.productname, c.day_of_the_week ;






SELECT p.productname,
       TO_CHAR(o.orderdate,'Day') AS Day
FROM orderdetails od
  JOIN orders o ON o.ordernumber = od.ordernumber
  JOIN products p ON od.productcode = p.productcode
WHERE od.priceeach >= (2*p.buyprice)
AND   LOWER(TO_CHAR(o.orderdate,'Day')) LIKE '%monday%'
GROUP BY p.productname,
         TO_CHAR(o.orderdate,'Day');