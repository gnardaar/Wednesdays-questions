--1

select customer.customer_id, first_name, last_name, store_id, active, district
from customer 
inner join address 
on customer.address_id = address.address_id 
where district = 'Texas'

--2
select customer.customer_id, first_name, last_name, payment_id, amount
from customer,payment 
where customer.customer_id  = payment.customer_id  
and amount > 6.99

--3
select customer.customer_id, first_name, last_name, email, amount
from customer, payment
where customer.customer_id in (
		select customer_id
		from payment
		group by customer_id
		having sum(amount) > 175)
order by customer.customer_id, amount

--4
select customer.customer_id, first_name, last_name, email, store_id, active, city.country_id, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

--5
select rental.staff_id, first_name, last_name, count(rental.rental_id)
from rental, staff
where rental.staff_id = staff.staff_id
group by rental.staff_id, staff.first_name, staff.last_name
order by rental.staff_id;


--6
select rating, count(film_id)
from film
group by rating
order by rating;

--7
select payment.customer_id, first_name, last_name, email, amount
from customer, payment
where amount in 
		(select amount
		from payment
		where amount > 6.99)


--8
select store_id, count(amount)
from store, payment
where payment.staff_id = store.manager_staff_id
and amount = 0
group by store_id;
