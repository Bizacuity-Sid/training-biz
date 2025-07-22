CREATE OR REPLACE FUNCTION g23pratyaksha.miles(mpg IN NUMBER)
  RETURN  NUMBER
IS
  ltper100km NUMBER;
BEGIN
    ltper100km:= 235.214583 / mpg; 
  RETURN  ltper100km;
END;
/
SELECT g23pratyaksha.miles(30) as ltper100km FROM dual;