DROP DATABASE notespace;
CREATE DATABASE IF NOT EXISTS notespace;
USE notespace;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios(
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
	PRIMARY KEY(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES usuarios WRITE;
INSERT INTO usuarios (nombre, email) VALUES ('Kylie Quinn','kyliequinn@gmail.com'), ('Esperanza Gomez','esperanzagomez@gmail.com'), ('Mia Marín','miamarin@gmail.com'), ('Alexis Texas', 'alexistexas@gmail.com'), ('Lily Adams', 'lilyadams@gmail.com'), ('Juan Perez', 'juanperez@gmail.com'), ('Arturo Benitez', 'arturobenitez@gmail.com'), ('Ruben Mendoza', 'rubenmendoza@gmail.com'), ('Jorge Camacho', 'jorgecamacho@gmail.com'), ('Andres Montes', 'andresmontes@gmail.com');
UNLOCK TABLES;

DROP TABLE IF EXISTS notas;
CREATE TABLE notas(
	id_nota INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    fecha_creacion DATE NOT NULL,
    fecha_modificacion DATE NOT NULL,
    descripcion TEXT NOT NULL,
    eliminacion BOOLEAN NOT NULL,
	PRIMARY KEY(id_nota),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES notas WRITE;
INSERT INTO notas (id_usuario, titulo, fecha_creacion, fecha_modificacion, descripcion, eliminacion) VALUES 
	(10, 'Cita dentista', '2021-10-05', '2021-10-06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (9, 'Compras super', '2021-10-04', '2021-10-05', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (8, 'Pendientes mañana', '2021-10-03', '2021-10-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (7, 'Puntos exposición', '2021-10-02', '2021-10-03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (6, 'Observaciones junta', '2021-10-01', '2021-10-02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (5, 'Ideas proyecto', '2021-09-30', '2021-10-01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (4, 'Material de laboratorio', '2021-09-29', '2021-09-30', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (3, 'Recordatorios de la semana', '2021-09-28', '2021-09-29', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (2, 'Pendientes lunes', '2021-09-05', '2021-09-28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false),
    (1, 'Cumpleaños hermano', '2021-09-05', '2021-09-27', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false);
UNLOCK TABLES;

DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
	PRIMARY KEY(id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES categorias WRITE;
INSERT INTO categorias (nombre) VALUES ('observaciones'), ('escuela'), ('pendientes'), ('materiales'), ('reuniones'), ('recados'), ('recordatorios'), ('compras'), ('cumpleaños'), ('citas');
UNLOCK TABLES;

DROP TABLE IF EXISTS nota_categoria;
CREATE TABLE nota_categoria(
	id_nota_categoria INT NOT NULL AUTO_INCREMENT,
    id_nota INT NOT NULL,
    id_categoria INT NOT NULL,
	PRIMARY KEY(id_nota_categoria),
    FOREIGN KEY(id_nota) REFERENCES notas(id_nota),
    FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES nota_categoria WRITE;
INSERT INTO nota_categoria (id_nota, id_categoria) VALUES (1, 7), (1, 10), (2, 3), (2, 8), (3, 3), (4, 2), (4, 7), (5, 1), (5, 5), (6, 2), (6, 7), (7, 2), (7, 4), (8, 3), (8, 7), (9, 3), (10, 3), (10, 7), (10, 9);
UNLOCK TABLES;

/*SELECT * FROM usuarios;
SELECT * FROM notas;
SELECT * FROM categorias;
SELECT * FROM nota_categoria;*/