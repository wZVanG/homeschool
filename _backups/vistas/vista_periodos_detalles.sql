DROP VIEW IF EXISTS vista_periodos_detalles;
CREATE VIEW vista_periodos_detalles as
SELECT pd.*, l.nombre, l.descripcion, l.foto, p.nombre AS nombre_periodo,
b.nombre AS nombre_bloque
FROM periodos_detalles pd
JOIN libros l ON l.id_libro = pd.id_libro
JOIN bloques b ON b.id_bloque = pd.id_bloque
JOIN periodos p ON p.id_periodo = pd.id_periodo