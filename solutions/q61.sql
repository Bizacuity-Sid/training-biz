WITH Pay_in_2003 AS
(
  SELECT c.customerName,
         SUM(pay.amount) AS payment_recieved
  FROM payments pay
  inner join customers c on c.customerNumber= pay.customerNumber
  WHERE EXTRACT(YEAR FROM pay.paymentDate) = 2003
  group by c.customerName
),
pay_in_2004 AS
(
    SELECT c.customerName,
         SUM(pay.amount) AS payment_recieved
  FROM payments pay 
  inner join customers c on c.customerNumber= pay.customerNumber
  WHERE EXTRACT(YEAR FROM pay.paymentDate) = 2004
  group by c.customerName
)
SELECT Pay_in_2003.customername,
 (Pay_in_2003.payment_recieved)/(pay_in_2004.payment_recieved) as ratio
  FROM Pay_in_2003
  INNER JOIN pay_in_2004 ON Pay_in_2003.customerName = pay_in_2004.customerName