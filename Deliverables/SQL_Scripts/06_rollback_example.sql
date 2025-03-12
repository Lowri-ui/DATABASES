-- Verificar si el inventory_id existe y está disponible
SELECT COUNT(*) FROM inventory WHERE inventory_id = 100;

-- Iniciar una transacción para un rollback
START TRANSACTION;

-- Insertar un nuevo registro de alquiler (para rollback):
INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (NOW(), 108, 1, NULL, 2, NOW());

-- Seleccionar el conteo de un inventory_id en una variable (para rollback)
SELECT COUNT(*) INTO @Inventory_exists FROM inventory WHERE inventory_id = 100;

-- Realizar un rollback de la transacción:
ROLLBACK;