SELECT concat(concat (emp1.firstname,' '),emp1.lastname) as employee_name
FROM employees emp1
  JOIN employees emp2 on emp1.reportsto = emp2.employeenumber
  JOIN employees emp3 on emp2.reportsto = emp3.employeenumber
WHERE concat(concat(emp3.firstname,' '),emp3.lastname) = 'Diane Murphy';