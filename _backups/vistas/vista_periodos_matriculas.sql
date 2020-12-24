DROP VIEW IF EXISTS vista_periodos_matriculas;
CREATE VIEW vista_periodos_matriculas as
SELECT pm.*, l.nombre AS nombre_libro, l.descripcion, l.foto,
per.id_periodo, per.nombre AS nombre_periodo,
u.nombre_usuario, p.nombre_completo 
FROM periodos_matriculas pm
JOIN periodos_detalles pd ON pd.id_periodo_detalle = pm.id_periodo_detalle
JOIN periodos per ON per.id_periodo = pd.id_periodo
JOIN libros l ON l.id_libro = pd.id_libro
JOIN usuarios u ON u.id_usuario = pm.id_usuario
JOIN personas p ON p.id_persona = u.id_persona