SELECT COUNT(ord.orderNumber) AS No_Of_Order
FROM customers custom
  INNER JOIN orders ord ON ord.customerNumber = custom.customerNumber
WHERE custom.customerName = 'Herkku Gifts'