SELECT SUM(pay.amount) AS Total_Amount
FROM payments pay
  INNER JOIN customers custom ON custom.customerNumber = pay.customerNumber
WHERE custom.customerName = 'Atelier graphique'