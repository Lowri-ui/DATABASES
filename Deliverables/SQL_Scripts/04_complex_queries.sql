-- Listar todos los clientes que han alquilado una película en los últimos 30 días
SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
WHERE rental_date > CURDATE() - INTERVAL 30 DAY;

-- Identificar la película más alquilada
SELECT film.film_id, film.title, COUNT(rental.rental_id) AS rental_count
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id, film.title
ORDER BY rental_count DESC
LIMIT 1;

-- Mostrar los ingresos totales generados por tienda
SELECT store.store_id, SUM(payment.amount) AS total_revenue
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;
