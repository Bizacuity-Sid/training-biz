SELECT firstname || ' ' || lastname AS Employee
FROM employees
WHERE firstname = 'Larry'
OR    lastname = 'Larry'
OR    firstname = 'Barry'
OR    lastname = 'Barry'