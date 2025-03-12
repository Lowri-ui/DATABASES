-- Crear una tabla llamada recent_films con películas estrenadas después de 2005
CREATE TABLE recentFilms AS
SELECT * FROM film WHERE release_year > 2005;

-- Seleccionar todos los datos de la tabla recent_films
select * from recent_films;