SELECT concat(firstName,lastName) AS fullName
FROM employees
WHERE firstName LIKE '%Dianne%'
OR    lastName LIKE '%Diane%'
OR    firstName LIKE '%Diane%'
OR    lastName LIKE '%Dianne%';