SELECT c.customerName,
       p.amount
FROM customers c
  LEFT JOIN payments p
         ON p.customerNumber = c.customerNumber
        AND EXTRACT (year FROM p.paymentDate) = 2003
WHERE p.customerNumber IS NULL;