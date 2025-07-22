SELECT custom.customerName,
       pay.amount
FROM payments pay
 INNER JOIN customers custom ON pay.customerNumber= custom.customerNumber
WHERE pay.amount > 100000
ORDER BY pay.amount DESC