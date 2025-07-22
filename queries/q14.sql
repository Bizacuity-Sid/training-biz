SELECT DISTINCT p.productName
FROM orderdetails od
  JOIN products p ON p.productCode = od.productCode
WHERE od.priceEach >= 2*p.buyPrice;