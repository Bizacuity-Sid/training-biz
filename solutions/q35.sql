SELECT count(o.ordernumber) AS total_orders
FROM orders o
  INNER JOIN customers c ON o.customernumber = c.customernumber
WHERE c.customername = 'Herkku Gifts';


42.List the value of 'On Hold' orders
SELECT sum(od.priceeach*od.quantityordered) AS total_value
FROM orderdetails od
  INNER JOIN orders o ON od.ordernumber = o.ordernumber
WHERE o.status = 'On Hold';


43.What is the quantity on hand for products listed on 'On Hold' orders?
SELECT SUM(p.quantityinstock) AS total_quantity
FROM products p
  INNER JOIN orderdetails od ON p.productcode = od.productcode
  INNER JOIN orders o ON od.ordernumber = o.ordernumber
WHERE o.status = 'On Hold';


44.Report the number of customers in Denmark, Norway, and Sweden.
SELECT SUM(customernumber) AS total_customers
FROM customers
WHERE country = 'Denmark' OR country = 'Norway' OR country = 'Sweden';



45.What is the difference in days between the most recent and oldest order date in the Orders file?
SELECT (MAX(orderdate) -MIN(orderdate)) AS total_days 
FROM orders;


46.What is the value of orders shipped in August 2004? (Hint).
SELECT SUM(od.priceeach*od.quantityordered) AS total_value
FROM orderdetails od
  INNER JOIN orders o ON od.ordernumber = o.ordernumber
WHERE EXTRACT(YEAR FROM o.shippeddate) = 2004
AND   EXTRACT(MONTH FROM o.shippeddate) = 8;