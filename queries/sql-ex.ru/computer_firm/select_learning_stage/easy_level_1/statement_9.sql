/*
https://sql-ex.ru/exercises/index.php?act=learn&LN=9
Find the makers of PCs with a processor speed of 450 MHz or more.
*/

SELECT DISTINCT maker FROM product WHERE model IN (SELECT model FROM pc WHERE speed >= 450)
