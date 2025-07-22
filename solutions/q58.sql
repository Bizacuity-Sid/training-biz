WITH payments_per_month as
(
SELECT extract(MONTH from paymentdate)as m,sum(amount)as totalpaid
FROM payments
WHERE extract(YEAR from paymentdate)=2004
GROUP BY extract(MONTH from paymentdate)
),
orders_per_month as
(
SELECT extract(MONTH from o.orderdate)as m,sum(od.priceeach*od.quantityordered)as totalvalue
FROM orderdetails od inner join orders o on od.ordernumber=o.ordernumber
WHERE extract(YEAR from o.orderdate)=2004
GROUP BY extract(MONTH from o.orderdate)
)

SELECT orders_per_month.m,
       sum(payments_per_month.totalpaid) as paid_amt,
       sum(orders_per_month.totalvalue)as order_amt,
       sum(payments_per_month.totalpaid)/sum(orders_per_month.totalvalue)as ratio
FROM orders_per_month 
INNER JOIN payments_per_month on orders_per_month.m=payments_per_month.m
GROUP BY orders_per_month.m
ORDER BY orders_per_month.m;