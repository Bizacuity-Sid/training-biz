WITH totalpaid AS
(
  SELECT cust.customerNumber,
         SUM(pay.amount) AS payment_recieved
  FROM customers cust
    INNER JOIN payments pay ON pay.customerNumber = cust.customerNumber
  WHERE EXTRACT(YEAR FROM pay.paymentDate) = 2004 AND EXTRACT(MONTH FROM pay.paymentDate) = 5
  GROUP BY cust.customerNumber
),
totalorder AS
(
  SELECT cust.customerNumber,
         SUM(ordDet.quantityOrdered*ordDet.priceEach) AS order_amount
  FROM customers cust
    INNER JOIN orders ord ON ord.customerNumber = cust.customerNumber
    INNER JOIN orderDetails ordDet ON ordDet.ordernumber = ord.ordernumber
  WHERE EXTRACT(YEAR FROM ord.orderDate) = 2004 AND EXTRACT(MONTH FROM ord.orderDate) = 5
  GROUP BY cust.customerNumber
)
SELECT totalorder.customerNumber,
       totalorder.order_amount,
       totalpaid.payment_recieved,
       (totalorder.order_amount - totalpaid.payment_recieved) AS difference
FROM totalorder
  INNER JOIN totalpaid ON totalpaid.customerNumber = totalorder.customerNumber
  ORDER BY totalorder.customerNumber




CORRECTED QUERY:
WITH total_ordered as
(
  SELECT c.customernumber,
         c.customername,
         sum(od.priceeach*od.quantityordered) as order_amt
  FROM customers c
    JOIN orders o on c.customernumber = o.customernumber
    JOIN orderdetails od on o.ordernumber = od.ordernumber
  WHERE to_char(o.orderdate,'fmmonth yyyy') = 'may 2004'
  GROUP BY c.customernumber,
           c.customername
),
total_paid as
(
  SELECT c.customernumber,
         c.customername,
         sum(p.amount) as paid_amt
  FROM customers c
    JOIN payments p on c.customernumber = p.customernumber
  WHERE to_char(p.paymentdate,'fmmonth yyyy') = 'may 2004'
  GROUP BY c.customernumber,
           c.customername
)
SELECT coalesce(tor.customernumber,tpay.customernumber) as customernumber,
       coalesce(tor.customername,tpay.customername) as customername,
       coalesce(tor.order_amt,0) as order_amount,
       coalesce(tpay.paid_amt,0) as paid_amount,
       (coalesce(tor.order_amt,0) -coalesce(tpay.paid_amt,0)) as diff_amount
FROM total_ordered tor
  FULL JOIN total_paid tpay on tor.customernumber = tpay.customernumber
ORDER BY customernumber;