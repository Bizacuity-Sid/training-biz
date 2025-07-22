SELECT concat(firstname,concat(' ',lastname)) as EmployeeName 
FROM employees
WHERE REGEXP_LIKE (concat(firstname,lastname),'[^a-zA-Z]');