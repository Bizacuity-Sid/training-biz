WITH inventory AS
(
  SELECT SUM(quantityinstock*buyprice) AS total_inventory
  FROM products
)
SELECT p.productcode,
       (p.quantityinstock*p.buyprice) AS inventory_value,
       ROUND((p.quantityinstock*p.buyprice) / i.total_inventory*100,2) AS inventory_percentage
FROM products p
  CROSS JOIN inventory i
ORDER BY inventory_percentage DESC;