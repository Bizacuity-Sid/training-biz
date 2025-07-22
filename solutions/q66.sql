WITH avg_payment as
(
  SELECT avg(amount) as average_amount,
         to_char(paymentdate,'yyyy-mm') as month_year
  FROM payments
  GROUP BY to_char(paymentdate,'yyyy-mm')
)
SELECT pay.*,
       avgpay.*
FROM payments pay
  JOIN avg_payment avgpay on to_char (pay.paymentdate,'yyyy-mm') = avgpay.month_year
WHERE pay.amount > 2*avgpay.average_amount
ORDER BY pay.paymentdate;