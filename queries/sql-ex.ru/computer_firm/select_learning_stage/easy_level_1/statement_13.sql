/*
https://sql-ex.ru/learn_exercises.php?LN=13
Find out the average speed of the PCs produced by maker A.
*/


select AVG(speed) as Avg_speed from PC inner join Product on PC.model = Product.model where Product.maker = 'A'
