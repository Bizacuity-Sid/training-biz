WITH monthlyavg AS
(
  SELECT EXTRACT(MONTH FROM paymentdate) AS MONTH,
         EXTRACT(YEAR FROM paymentdate) AS YEAR,
         AVG(amount) AS avgamount
  FROM payments
  GROUP BY EXTRACT(MONTH FROM paymentdate),
           EXTRACT(YEAR FROM paymentdate)
)
SELECT p.paymentdate,p.amount,
       monthlyavg.avgamount
FROM payments p
  INNER JOIN monthlyavg 
          ON extract (MONTH FROM p.paymentdate) = monthlyavg.month
         AND extract (YEAR FROM p.paymentdate) = monthlyavg.year
where p.amount>2*monthlyavg.avgamount
order by p.paymentdate;