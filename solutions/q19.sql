SELECT FirstName || ' ' || LastName as Employee
 FROM employees
 WHERE FirstName= 'Diane' OR LastName = 'Diane'
 OR FirstName= 'Dianne' OR LastName = 'Dianne'