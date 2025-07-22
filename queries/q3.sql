SELECT c.customerName,
       concat(e.firstName,e.lastName) AS accountRep
FROM customers c
  JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;