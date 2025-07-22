select productName 
from products
where buyprice<0.8*MSRP;


 14. Reports those products that have been sold with a markup of 100% or more (i.e., the priceEach is at least twice the buyPrice
SELECT p.productname
FROM products p
  INNER JOIN orderdetails od ON p.productcode = od.productcode
WHERE od.priceeach >= 2*p.buyprice;