SELECT concat(firstName,lastName) AS fullname
FROM employees
WHERE firstName LIKE '%Larry%'
OR    firstName LIKE '%Barry%'
OR    lastName LIKE '%Larry%'
OR    lastName LIKE '%Barry%';