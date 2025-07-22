SELECT concat(firstname,lastname) AS Employee
FROM Employees
WHERE lower(firstname) LIKE '%dianne%'
OR    lower(firstname) LIKE '%diane%'
OR    lower(lastname) LIKE '%dianne%'
OR    lower(lastname) LIKE '%diane%';