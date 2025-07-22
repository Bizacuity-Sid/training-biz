WITH Prod_sales_2003 AS
(
SELECT prod.productname,
sum(ord.quantityOrdered) AS quantity
FROM products prod
INNER JOIN orderdetails ord ON prod.productCode = ord.productCode
INNER JOIN Orders O ON O.orderNumber = ord.orderNumber
WHERE EXTRACT(YEAR FROM o.orderDate) = 2003
GROUP BY prod.productname
),
prod_sales_2004 AS
(
SELECT prod.productname,
sum(ord.quantityOrdered) AS quantity
FROM products prod
INNER JOIN orderdetails ord ON prod.productCode = ord.productCode
INNER JOIN Orders O ON o.orderNumber = ord.orderNumber
WHERE EXTRACT(YEAR FROM o.orderDate) = 2004
GROUP BY prod.productname
)
SELECT Prod_sales_2003.productname,
Prod_sales_2003.quantity as qty_in_2003,
prod_sales_2004.quantity as qty_in_2004,
Prod_sales_2003.quantity/prod_sales_2004.quantity as ratio_of_sale
FROM Prod_sales_2003
INNER JOIN prod_sales_2004 ON Prod_sales_2003.productname = prod_sales_2004.productname