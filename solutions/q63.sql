WITH tot_value AS
(
  SELECT SUM(buyprice*quantityInStock) AS tval FROM products
)
SELECT prod.productCode,prod.productName,prod.productLine,
       prod.buyprice*prod.quantityInStock AS Stockvalue,
       tot_value.tval AS TotalStockvalue,
       100.0 *prod.buyprice*prod.quantityInStock / tot_value.tval AS percent_value
FROM products prod,
     tot_value
ORDER BY 100.0 *prod.buyprice*prod.quantityInStock / tot_value.tval DESC