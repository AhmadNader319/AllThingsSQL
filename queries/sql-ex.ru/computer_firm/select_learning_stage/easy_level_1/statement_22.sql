/*
https://sql-ex.ru/learn_exercises.php?LN=22
For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
*/


SELECT
  speed,
  AVG(price)
FROM pc
WHERE
  speed > 600
GROUP BY
  speed;
