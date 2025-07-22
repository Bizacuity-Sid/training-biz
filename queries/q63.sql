WITH inventoryVal AS
(
  SELECT productCode,
         productName,
         quantityInStock*buyPrice AS inventory_value
  FROM Products
),
totalValue AS
(
  SELECT SUM(inventory_value) AS total_inventory_value
  FROM inventoryVal
)
SELECT c1.productCode,
       c1.productName,
       c1.inventory_value,
       (c1.inventory_value / c2.total_inventory_value)*100 AS percentage
FROM inventoryVal c1,
     totalValue c2
ORDER BY percentage DESC;