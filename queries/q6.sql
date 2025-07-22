SELECT concat(firstname,lastname) AS Employee,jobtitle
FROM Employees
WHERE jobtitle LIKE '%VP%'
OR    jobtitle LIKE '%Manager%';