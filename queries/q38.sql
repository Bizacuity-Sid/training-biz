SELECT COUNT(p.amount) AS Total_payments,
       SUM(p.amount) AS Total_Amount
FROM payments p
  JOIN customers c ON p.customernumber = c.customernumber
WHERE c.customername = 'Atelier graphique';