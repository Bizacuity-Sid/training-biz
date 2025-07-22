--create table g23siddharth.customers 
--as(select * from classicmodels.customers);
ALTER SESSION SET CURRENT_SCHEMA=g23siddharth;
CREATE OR REPLACE PROCEDURE increasedlimit (percentage NUMBER,country varchar2)
AS
BEGIN UPDATE customers
   SET creditlimit = creditlimit + creditlimit*percentage/100
WHERE country = customers.country; END;
/
execute increasedlimit(5,'Denmark');

select * from customers
where country = 'Denmark';