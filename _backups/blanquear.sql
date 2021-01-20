TRUNCATE TABLE periodos_matriculas;
TRUNCATE TABLE periodos_detalles;
TRUNCATE TABLE periodos;
TRUNCATE TABLE bloques;
TRUNCATE TABLE libros;

INSERT INTO periodos (nombre, fecha_inicio, fecha_fin)
VALUES ('2021-1', '2021-01-01 00:00:00', '2021-03-31 16:19:05');


INSERT INTO bloques (nombre) VALUES ('Bloque General');

INSERT INTO libros (nombre, descripcion, foto, usuario_registro, usuario_actualizacion)
VALUES ('Bloque General', '-', '3b6457a0abd05c9b218f1db6a58dfb8c.webp', 1, 1)

