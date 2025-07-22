SELECT (e1.firstname||' '||e1.lastname) AS employeename
FROM Employees e1 inner join employees e2 on e1.reportsto=e2.employeenumber
inner join employees e3 on e2.reportsto=e3.employeenumber 
where e3.firstname='Diane' And e3.lastname='Murphy';




30 . Find the products sold in may,2003 but not may,2004.
WITH proc2003 AS
(
  SELECT DISTINCT p.productname
  FROM products p
    INNER JOIN orderdetails od ON p.productcode = od.productcode
    INNER JOIN orders o ON od.ordernumber = o.ordernumber
  WHERE EXTRACT(YEAR FROM o.orderdate) = 2003
  AND EXTRACT(MONTH FROM o.orderdate) = 5
)
SELECT proc2003.productname
FROM proc2003
WHERE proc2003.productname NOT IN (SELECT DISTINCT p.productname
                            FROM products p
                              INNER JOIN orderdetails od ON p.productcode = od.productcode
                              INNER JOIN orders o ON od.ordernumber = o.ordernumber
                            WHERE EXTRACT(YEAR FROM o.orderdate) = 2004
                            AND EXTRACT(MONTH FROM o.orderdate)=5);





31.Find the customers without payments in 2003.
SELECT DISTINCT c.customername
FROM customers c
WHERE c.customername NOT IN (SELECT DISTINCT c.customername
                             FROM customers c
                               INNER JOIN payments p ON c.customernumber = p.customernumber
                             WHERE EXTRACT(YEAR FROM p.paymentdate) = 2003);



32.Who reports to Mary Patterson?
SELECT *
FROM employees
WHERE reportsto = (SELECT employeenumber
                   FROM employees
                   WHERE firstname = 'Mary'
                   AND   lastname = 'Patterson');




33.How many employees are there in the company?
SELECT COUNT(employeenumber) AS total_employees
FROM employees;