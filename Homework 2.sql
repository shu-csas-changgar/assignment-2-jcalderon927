-- 1. List each customer’s customer id, first and last name, 
-- sorted alphabetically by last name and the total amount spent on rentals. 
-- The name of the total amount column should be TOTAL SPENT.
select c.customer_id,c.last_name,c.first_name, 
	sum(p.amount) as 'Total Spent'
from customer c
join payment p
	on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name, sum(p.amount);

-- 2. List the unique (no duplicates) District and city name where the postal
--  code is null or empty.

select distinct a.district, c.city 
from city c
join address a
	on a.city_id = c.city_id
where a.postal_code is null or a.postal_code = '';

-- 3. List all the films have the words DOCTOR or FIRE in their title?

select f.title
from film f
where f.title like '%DOCTOR%'
	or f.title like '%FIRE%';
    
-- 4. List each actor’s actor id, first and last name, sorted alphabetically 
-- by last name and the total number of films they have been in. There should 
-- be no duplicates. You should have one row per actor. The name of the number
--  of films column should be NUMBER OF MOVIES.

select distinct a.actor_id, a.last_name, a.first_name, 
	count(f.film_id) as 'Number of Films'
from actor a
	join film_actor fa
		on fa.actor_id = a.actor_id
        join film f
			on fa.film_id = f.film_id
	group by a.actor_id
    order by a.last_name, count(film_id);

-- 5. What is the average run time of each film by category? Order the results
--  by the average run time lowest to highest

select c.name, avg(f.length) as "Average Run Time"
from category c
	join film_category fc
		on fc.category_id = c.category_id
		join film f
			on f.film_id = fc.film_id
	group by c.name
    order by avg(f.length);
    
-- 6. How much business (in dollars) did each store bring in? There should be no 
-- duplicates. Just list of each store id and the total dollar amount. Order the 
-- result by dollar amount greatest to lowest.

select distinct s.store_id, sum(p.amount) as 'Business'
from store s
	join staff st 
		on st.store_id = s.store_id
        join payment p 
			on p.staff_id = st.staff_id
	group by s.store_id
    order by sum(p.amount) desc;
    
-- 7. What is the first and last name, email and total amount spent on movies by
--  customers in Canada? Order alphabetically by their last name.

-- 8. MATHEW BOLIN would like to rent the movie HUNGER ROOF from staff JON STEPHENS 
-- at store 2 today. The rental fee is 2.99. Insert this rental and payment into the 
-- database.

-- 9. TRACY COLE would like to return the movie ALI FOREVER. Update the rental table
--  to reflect this. You can write multiple queries to get the IDs before writing the
--  update statement. You can also do it in a single update statement using joins or 
-- sub queries.

-- 10. Change the original language id for all films in the category ANIMATION to JAPANESE.
