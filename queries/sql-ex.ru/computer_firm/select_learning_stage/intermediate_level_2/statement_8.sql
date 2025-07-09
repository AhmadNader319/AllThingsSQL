/*
https://sql-ex.ru/exercises/index.php?act=learn&LN=8
Find the makers producing PCs but not laptops.
*/

SELECT DISTINCT MAKER FROM product WHERE type = 'PC' AND maker NOT IN (SELECT maker FROM product WHERE type = 'Laptop');

-- Use of Except for refinement

SELECT DISTINCT MAKER FROM product WHERE type = 'PC'
except
SELECT maker FROM product WHERE type = 'Laptop'
