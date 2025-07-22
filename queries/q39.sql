SELECT SUM(p.amount) AS totalpay
FROM payments p
  JOIN customers c ON c.customerNumber = p.customerNumber
WHERE c.customerName = 'Atelier graphique';