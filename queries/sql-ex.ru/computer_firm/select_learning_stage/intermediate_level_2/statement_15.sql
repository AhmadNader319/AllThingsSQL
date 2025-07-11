/*
https://sql-ex.ru/learn_exercises.php?LN=15
Get hard drive capacities that are identical for two or more PCs.
*/

Select hd from pc group by hd having count(hd) >= 2
