SELECT concat(firstName,lastName) AS fullname
FROM employees
WHERE REGEXP_LIKE (firstName,'[^a-zA-Z]')
OR    REGEXP_LIKE (lastName,'[^a-zA-Z]')