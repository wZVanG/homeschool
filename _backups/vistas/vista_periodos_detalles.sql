DROP VIEW IF EXISTS vista_periodos_detalles;
CREATE VIEW vista_periodos_detalles as
SELECT pd.*, l.nombre, l.foto, p.nombre AS nombre_periodo
FROM periodos_detalles pd
JOIN libros l ON l.id_libro = pd.id_libro
JOIN periodos p ON p.id_periodo = pd.id_periodo