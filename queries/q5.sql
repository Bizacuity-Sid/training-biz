SELECT customernumber,
       checknumber,
       amount
FROM payments
WHERE amount > 100000;