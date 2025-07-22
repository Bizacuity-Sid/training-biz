SELECT  p.productname
FROM orderdetails od
  JOIN products p ON p.productcode = od.productcode
WHERE od.priceeach <(0.8*p.msrp) group by p.productname;