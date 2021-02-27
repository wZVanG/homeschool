  SET FOREIGN_KEY_CHECKS = 1;

TRUNCATE table periodos_detalles_tareas_resolve;
TRUNCATE table periodos_detalles_tareas;
TRUNCATE table periodos_detalles;
TRUNCATE table periodos_matriculas;
TRUNCATE table libros_detalles;
TRUNCATE table libros;
TRUNCATE table periodos;
TRUNCATE table bloques;

  SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO periodos (nombre, fecha_inicio, fecha_fin)
VALUES ('2021-1', '2021-01-01 00:00:00', '2021-03-31 16:19:05');


INSERT INTO bloques (nombre, usuario_registro, usuario_actualizacion, fecha_registro, fecha_actualizacion) 
VALUES ('Bloque General', 1, 1, '2020-12-02 02:31:12', '2020-12-02 02:31:12');

INSERT INTO libros (nombre, descripcion, foto, usuario_registro, usuario_actualizacion, fecha_registro, fecha_actualizacion)
VALUES ('Proyecto 1', '-', '3b6457a0abd05c9b218f1db6a58dfb8c.webp', 1, 1, '2020-12-02 02:31:12', '2020-12-02 02:31:12')

