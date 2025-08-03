/*
https://sql-ex.ru/learn_exercises.php?LN=20
Find the makers producing at least three distinct models of PCs.
*/


SELECT
  MAKER,
  COUNT(MODEL)
FROM PRODUCT
WHERE
  TYPE = 'PC'
GROUP BY
  MAKER
HAVING
  COUNT(MODEL) >= 3;
