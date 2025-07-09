/*
https://sql-ex.ru/exercises/index.php?act=learn&LN=6
For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops.
*/


SELECT DISTINCT product.maker, laptop.speed FROM laptop INNER JOIN product on laptop.model = product.model WHERE laptop.hd >= 10;
