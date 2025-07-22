with ordval as
(
  select ordernumber,
         count(productcode) as no_of_product,
         sum(quantityordered*priceeach) as order_value
  from orderdetails
  group by ordernumber
  having count(productcode) > 2
)
select ord.ordernumber,
       ord.productcode,
       ord.quantityordered*ord.priceeach as prod_order_value,
       ocv.order_value,
       ocv.no_of_product
from orderdetails ord
  join ordval ocv on ord.ordernumber = ocv.ordernumber
where (ord.quantityordered*ord.priceeach) >(0.5*ocv.order_value);