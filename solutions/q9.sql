select *
from products
where products.productcode NOT IN (select  productcode from orderdetails);