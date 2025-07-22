SELECT (firstname|| ' ' ||lastname) AS fullname,
       jobtitle
FROM employees
WHERE jobtitle LIKE '%VP%'
OR    jobtitle LIKE '%Manager%';

;


Could not do with concat function as it was not giving space between names and i could not find correct syntax for it on net.