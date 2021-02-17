 
 drop procedure if exists actionmovies;
 delimiter //
  create procedure actionmovies (in param1 char(20))
  begin
	
  select first_name, last_name, email 
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name COLLATE utf8mb4_general_ci = param1 
  group by first_name, last_name, email;
  
  end;

//
delimiter ;

call actionmovies("children");

create procedure releses (in releseyear int)
begin


End;

Select count(title) as releses from film as f
join film_category as fc
using(film_id)
join category as c
using (category_id)
group by c.name; 


delimiter //
create procedure popcats(in num int)
begin
select name,releses from (Select c.name,count(title) as releses from film as f
join film_category as fc
using(film_id)
join category as c
using (category_id)
group by c.name) as sub1
where releses > num;
end ;
//
delimiter ;

call popcats(40)