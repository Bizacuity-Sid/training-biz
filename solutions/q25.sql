SELECT (firstname|| ' ' ||lastname) as Top_employee
FROM employees
WHERE reportsTo IS NULL;