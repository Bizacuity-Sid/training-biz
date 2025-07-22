SELECT p.productName
FROM orderdetails od
  JOIN products p ON od.productCode = p.productCode
WHERE od.priceEach < p.MSRP*0.8;