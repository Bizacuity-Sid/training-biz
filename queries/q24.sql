SELECT employeenumber,
       concat(firstname,lastname) AS Employee
FROM employees
WHERE reportsto IS NULL;