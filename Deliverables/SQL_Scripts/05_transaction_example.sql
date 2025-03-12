-- Iniciar una transacción
START TRANSACTION;
-- Insertar un nuevo registro de alquiler
INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update) VALUES (NOW(), 5, 1, NULL, 2, NOW());
-- Actualizar el inventario para reflejar el alquiler
UPDATE inventory SET last_update = NOW() WHERE inventory_id = 5;
-- Confirmar la transacción
COMMIT;