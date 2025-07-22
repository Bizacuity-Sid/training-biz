SELECT SUM(p.amount) AS total_amount
FROM payments p
  INNER JOIN customers c ON p.customernumber = c.customernumber
WHERE c.customername = 'Atelier graphique';