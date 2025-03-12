-- Consulta para verificar registros huérfanos
SELECT r.rental_id
FROM rental r
LEFT JOIN customer c ON r.customer_id = c.customer_id
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE c.customer_id IS NULL OR i.inventory_id IS NULL;

-- Consulta para verificar las restricciones de clave externa
SELECT table_name, constraint_name, referenced_table_name
FROM information_schema.key_column_usage
WHERE table_schema = 'sakila' AND referenced_table_name IS NOT NULL;

-- Consulta para verificar registros duplicados en la tabla customer
SELECT first_name, last_name, email, COUNT(*)
FROM customer
GROUP BY first_name, last_name, email
HAVING COUNT(*) > 1;

-- Crear un trigger para validar la fecha de alquiler
DELIMITER $$
CREATE TRIGGER validate_rental_date BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
IF NEW.rental_date > CURDATE() THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rental date cannot be in the future';
END IF;
END $$
DELIMITER ;

 -- Agregar una restricción de clave externa para inventory_id en la tabla rental
ALTER TABLE rental
ADD CONSTRAINT fk_inventory FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id)
ON DELETE CASCADE;

-- Agregar una restricción de clave externa para customer_id en la tabla rental
ALTER TABLE rental
ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
ON DELETE CASCADE;

-- Intento de insertar un alquiler con una fecha futura (para probar el trigger)
INSERT INTO rental (rental_date, inventory_id, customer_id)
VALUES ('2025-03-12', 1, 1);