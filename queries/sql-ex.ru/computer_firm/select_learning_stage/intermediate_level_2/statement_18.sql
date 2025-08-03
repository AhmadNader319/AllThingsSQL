/*
https://sql-ex.ru/learn_exercises.php?LN=18
Find the makers of the cheapest color printers.
*/


SELECT T1.maker, T2.price
FROM Product AS T1
JOIN Printer AS T2 ON T1.model = T2.model
WHERE T2.color = 'y' AND T2.price = (
  SELECT MIN(price)
  FROM Printer
  WHERE color = 'y'
)
GROUP BY T1.maker, T2.price;
