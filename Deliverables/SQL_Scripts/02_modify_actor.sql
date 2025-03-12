-- Insertar una nueva fila en la tabla actor
insert into actor (actor_id, first_name, last_name, last_update)
values (201, 'Mati', 'Peluso', now());

-- Actualizar el nombre de un actor existente
update actor set first_name='Nati' where actor_id=201;

-- Borrar un actor de la tabla
delete from actor where actor_id=201;
