/*
https://sql-ex.ru/learn_exercises.php?LN=19
For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
*/


Select product.maker, avg(laptop.screen) from product
join laptop
on laptop.model = product.model
group by product.maker
