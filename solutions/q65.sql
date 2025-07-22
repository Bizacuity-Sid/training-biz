WITH profit as
(
  SELECT sum(od.quantityordered*od.priceeach - od.quantityordered*prod.buyprice) as total_profit
  FROM orderdetails od
    JOIN products prod on od.productcode = prod.productcode
),
cust_profit as
(
  SELECT c.customernumber,
         c.customername,
         sum(od.quantityordered*od.priceeach - od.quantityordered*prod.buyprice) as customer_profit
  FROM customers c
    JOIN orders o on c.customernumber = o.customernumber
    JOIN orderdetails od on o.ordernumber = od.ordernumber
    JOIN products prod on od.productcode = prod.productcode
  GROUP BY c.customernumber,
           c.customername
)
SELECT cp.*, p.*,
       ((cp.customer_profit / p.total_profit)*100) as perc_profit
FROM cust_profit cp,
     profit p
ORDER BY cp.customer_profit desc;