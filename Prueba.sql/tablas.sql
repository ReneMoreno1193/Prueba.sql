CREATE DATABASE prueba_parte_1;

USE prueba_parte_1;

CREATE TABLE peliculas (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        nombre VARCHAR(255) NOT NULL ,
                        anno INT NOT NULL
);

CREATE TABLE tags (
                  id INT AUTO_INCREMENT PRIMARY KEY,
                  tag VARCHAR(32)
);


CREATE TABLE vinculadas (
                         id_peliculas INT NOT NULL,
                         id_tags INT NOT NULL,
                         FOREIGN KEY (id_peliculas) REFERENCES peliculas(id),
                         FOREIGN KEY (id_tags) REFERENCES tags(id)



);

INSERT INTO peliculas (nombre, anno)
     VALUES           ('Casablanca', 1942),
                      ('Nosferatu', 1922 ),
                      ('Los 400 golpes', 1959),
                      ('Requiem for a dream', 2000),
                      ('El niño y la garza', 2023);

INSERT INTO tags (tag)
VALUES           ('Cine clasico'),
                 ('Cine moderno'),
                 ('Cine contemporaneo'),
                 ('blanco y negro'),
                 ('Drama');

INSERT INTO vinculadas (id_peliculas, id_tags)
VALUES                  (1,1),
                        (1,4),
                        (1,5),
                        (2,1),
                        (2,4),
                        (3,2),
                        (4,3),
                        (4,5);


SELECT peliculas.id,
       peliculas.nombre,
       COUNT(vinculadas.id_tags) AS cantidad_tags
FROM peliculas
         LEFT JOIN vinculadas ON peliculas.id = vinculadas.id_peliculas
GROUP BY peliculas.id, peliculas.nombre;

-- parte 2 --

CREATE TABLE preguntas (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        pregunta VARCHAR(255) UNIQUE ,
                        respuesta_correcta VARCHAR(255)
);

CREATE TABLE respuestas (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         respuestas VARCHAR(255),
                         usuario_id INT,
                         preguntas_id INT

);  