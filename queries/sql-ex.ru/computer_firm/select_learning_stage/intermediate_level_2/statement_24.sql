/*
https://sql-ex.ru/learn_exercises.php?LN=24
List the models of any type having the highest price of all products present in the databas
*/


WITH products AS ( SELECT MODEL,PRICE FROM PC
UNION
SELECT MODEL,PRICE FROM LAPTOP
UNION
SELECT MODEL,PRICE FROM PRINTER)

SELECT MODEL FROM products

WHERE price = (SELECT MAX(PRICE) FROM products)

