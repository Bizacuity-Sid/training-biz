select *
 from products 
where substr(productcode,2,3)='700' AND TO_NUMBER(substr(productcode,6))>=1000 AND TO_NUMBER(substr(productcode,6))<1500;