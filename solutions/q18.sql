SELECT customerName
 FROM customers
  WHERE REGEXP_LIKE(customerName, '[[:digit:]]');