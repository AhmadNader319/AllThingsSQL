/*
https://sql-ex.ru/learn_exercises.php?LN=21
Find out the maximum PC price for each maker having models in the PC table.
*/


SELECT
  product.maker,
  MAX(pc.price)
FROM product
JOIN pc
  ON product.model = pc.model
GROUP BY
  product.maker;
