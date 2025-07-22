--create table g23siddharth.products 
--as(select * from classicmodels.products);
ALTER SESSION SET CURRENT_SCHEMA=g23siddharth;
CREATE OR REPLACE PROCEDURE increasedprice (percentage NUMBER,ProdCode varchar2)
AS
BEGIN UPDATE products
   SET msrp = msrp + msrp*percentage/100
WHERE ProdCode = products.ProductCode; END;
/
execute increasedprice(5,'S10_1678');

select * from products
where productcode='S10_1678';