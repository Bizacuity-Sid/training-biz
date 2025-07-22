SELECT *
FROM payments 
  WHERE amount > (SELECT AVG(amount)*2 FROM payments);