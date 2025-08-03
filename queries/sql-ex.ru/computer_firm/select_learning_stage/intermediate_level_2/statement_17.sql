/*
https://sql-ex.ru/learn_exercises.php?LN=17
Get the laptop models that have a speed smaller than the speed of any PC.
*/


SELECT DISTINCT type, product.model, laptop.speed
FROM product JOIN laptop ON (laptop.model=product.model)
WHERE speed < (SELECT MIN(speed) from pc)
