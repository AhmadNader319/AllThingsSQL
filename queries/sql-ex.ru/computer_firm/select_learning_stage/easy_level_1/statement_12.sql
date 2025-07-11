/*
https://sql-ex.ru/learn_exercises.php?LN=12
Find out the average speed of the laptops priced over $1000.
*/

SELECT avg(speed) as Avg_speed from laptop where price > 1000
