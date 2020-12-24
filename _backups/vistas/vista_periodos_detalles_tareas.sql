DROP VIEW IF EXISTS vista_periodos_detalles_tareas;
CREATE VIEW vista_periodos_detalles_tareas as
SELECT pdt.*, p.nombre AS nombre_periodo, l.nombre AS nombre_libro
FROM periodos_detalles_tareas pdt
JOIN periodos_detalles pd ON pd.id_periodo_detalle = pdt.id_periodo_detalle
JOIN periodos p ON p.id_periodo = pd.id_periodo
JOIN libros l ON l.id_libro = pd.id_libro