SELECT firstname, lastname
 FROM employees
 WHERE REGEXP_LIKE(firstname, '[^A-Za-z]') or 
 REGEXP_LIKE(lastname, '[^A-Za-z]');