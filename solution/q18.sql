select customername 
from customers
where REGEXP_LIKE(customerName,'[[:digit:]]');