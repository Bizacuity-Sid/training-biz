SELECT concat(firstName,lastName) AS fullname,
       jobTitle
FROM employees
WHERE jobTitle LIKE '%VP%'
OR    jobTitle LIKE '%Manager%'
ORDER BY jobTitle;