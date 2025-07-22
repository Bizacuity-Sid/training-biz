1.Prepare a list of offices sorted by country, state, city.

SELECT officecode,
       city,
       state,
       country
FROM offices
ORDER BY country,
         state,
         city;



2.List the products in each product line

SELECT productname,
       productline
FROM products
ORDER BY productline;