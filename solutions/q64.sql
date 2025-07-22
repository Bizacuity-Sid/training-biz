with total_rev as
(
  select sum(quantityordered*priceeach) as total_revenue
  from orderdetails
),
cust_rev as
(
  select c.customernumber,
         c.customername,
         sum(coalesce(od.quantityordered*od.priceeach,0)) as cust_revenue
  from customers c
    inner join orders o on c.customernumber = o.customernumber
    inner join orderdetails od on o.ordernumber = od.ordernumber
  group by c.customernumber,
           c.customernamewith 
)
select cr.*,
       tr.*,
       ((cr.cust_revenue / tr.total_revenue)*100) as perc_revenue
from cust_rev cr,
     total_rev tr
order by cr.customername;