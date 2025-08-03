/*
https://sql-ex.ru/learn_exercises.php?LN=23
Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
*/


SELECT maker
FROM product
JOIN pc
  ON product.model = pc.model
WHERE pc.speed >= 750
INTERSECT
SELECT maker
FROM product
JOIN laptop
  ON product.model = laptop.model
WHERE laptop.speed >= 750;
