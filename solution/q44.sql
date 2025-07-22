WITH twoorder AS
(
  SELECT SUM(quantityordered*priceeach) AS totvalueorder,
         ordernumber
  FROM orderdetails
  GROUP BY ordernumber
  HAVING COUNT(productcode) > 2
  ORDER BY ordernumber
)
SELECT od.productcode,
       od.ordernumber
FROM orderdetails od
  INNER JOIN twoorder ON od.ordernumber = twoorder.ordernumber
WHERE ((od.quantityordered*od.priceeach) / twoorder.totvalueorder) > 0.5;