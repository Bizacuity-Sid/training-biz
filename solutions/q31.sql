SELECT firstname, lastname
FROM employees
WHERE reportsto IN (SELECT employeenumber
                    FROM employees
                    WHERE firstname = 'Mary'
                    AND   lastname = 'Patterson')