CREATE OR REPLACE FUNCTION g23siddharth.mpg_to_l_per_100km(mpg NUMBER) RETURN NUMBER IS
BEGIN
  RETURN 235.214583 / mpg;
END;
/
SELECT g23siddharth.mpg_to_l_per_100km(75) FROM dual;