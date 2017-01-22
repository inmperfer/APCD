CREATE SCHEMA videoclub;
USE videoclub;

# tabla user
CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(256),
phone VARCHAR(10) NOT NULL,
address VARCHAR(256) NOT NULL,
PRIMARY KEY (id));

# tabla movie
CREATE TABLE movie (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
year INT NOT NULL,
PRIMARY KEY (id));

# 4 usuarios
INSERT INTO users (name, phone, address) VALUES
('Elena', '678345672', 'Avenida Reina Mercedes, 4, bloque 5, bajo C'),
('Inmaculada', '665443322', 'Avenida Reino Unido, 2'),
('Daniel', '678239874', 'Avenida de andalucia, 23, escalera 8, 2º'),
('Fernando', '6124422', 'Paseo de la Palmera, 8, puerta C');


# 6 peliculas
INSERT INTO movie (title, year) VALUES
('Villaviciosa de al lado', 2016),
('Animales fantasticos', 2016),
('El padrino', 1972),
('La lista de Shindler', 1993),
('La vida es bella', 1997),
('Amelie', 2001);


# Tabla rental
CREATE TABLE rental (
user_id INT NOT NULL,
movie_id INT NOT NULL,
start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
deadline DATETIME default NULL,
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE CASCADE);

# 2 alquileres entregados
INSERT INTO rental (user_id, movie_id, start_date, deadline) VALUES
(1, 2, '2016-12-02 22:24:00', '2016-12-06 20:12:00'),
(3, 1, '2016-12-03 13:02:00', '2016-12-15 09:54:00');


# 2 alquileres por entregar
INSERT INTO rental (user_id, movie_id, start_date, deadline) VALUES
(1, 3, '2016-12-02 22:24:00', NULL),
(2, 6, '2016-12-03 13:02:00', NULL);