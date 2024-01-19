use mavenmovies;
-- 1.Write a SQL query to count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names.
select * from actor;
select actor_id,concat(first_name,last_name) as full_name, 
length(concat(first_name,last_name)) as full_name from actor;
SELECT 
    actor_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    LENGTH(CONCAT(first_name, ' ', last_name)) AS length_of_name
FROM
    actor
LIMIT 10;

-- 2.List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.
select * from actor_award;
select actor_id,actor_award_id,concat(first_name,' ',last_name) as full_name,length(concat(first_name,last_name)) as name_length 
from actor_award 
where awards like "%oscar%";

-- 3.Find the actors who have acted in the film ‘Frost Head.’
select * from actor;
select * from film;
select * from film_actor;
select actor.actor_id,concat(actor.first_name,' ',actor.last_name) as full_name,film.film_id from actor inner join
film_actor on actor.actor_id = film_actor.actor_id inner join film on 
film.film_id = film_actor.film_id where film.title = "Frost Head";

-- 4.Pull all the films acted by the actor ‘Will Wilson.’
select * from actor;
select * from film;
select * from film_actor;
select actor.actor_id,film.film_id,concat(actor.first_name," ",actor.last_name) as actor_name,
film.title from actor inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film.film_id = film_actor.film_id where actor.first_name = 'Will' or actor.last_name = 'Wilson';

-- 5.Pull all the films which were rented and return them in the month of May.
select * from film;
select * from rental;
select film.film_id,film.title,rental.rental_id,rental.rental_date,rental.return_date from film
inner join rental on film.film_id = rental.rental_id where monthname(rental.return_date) = 'May';

-- 6.Pull all the films with ‘Comedy’ category.
select * from film;
select * from category;
select * from film_category;
select film.film_id,film.title,category.name 
from film inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
 where category.name = "Comedy";
