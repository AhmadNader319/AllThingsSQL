/*
https://sql-ex.ru/exercises/index.php?act=learn&LN=7
Get the models and prices for all commercially available products (of any type) produced by maker B.
*/

select model, price from pc where model in (select model from product where maker = 'B')
union
select model, price from laptop where model in (select model from product where maker = 'B')
union
select model, price from printer where model in (select model from product where maker = 'B')


-- after clearning the code of the redundancy

select product.model, models.price from (
select model, price from pc
union
select model, price from laptop
union
select model, price from printer
) as models
inner join product
on models.model = product.model
where product.maker = 'B'
