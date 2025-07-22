select * 
from products
where lower(productname) LIKE '%ship%' OR lower(productName) LIKE '%boat%';