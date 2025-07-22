SELECT COUNT(amount) AS total_payments
FROM payments
WHERE paymentdate = TO_DATE('2004-10-28','YYYY-MM-DD');