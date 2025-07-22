WITH prodlinestock AS
(
  SELECT SUM(quantityinstock*buyprice) AS ps,productline
  FROM products
  GROUP BY productline
)
SELECT p.productname,
       p.productline,
       (SUM(p.quantityinstock*p.buyprice) / avg(prodlinestock.ps)*100) AS percentage_share
from products p left join prodlinestock on p.productline=prodlinestock.productline
group by p.productname,p.productline
order by p.productline,(SUM(p.quantityinstock*p.buyprice) / avg(prodlinestock.ps)*100)DESC;