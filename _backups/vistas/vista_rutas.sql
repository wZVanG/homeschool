DROP VIEW IF EXISTS vista_rutas;

CREATE VIEW vista_rutas AS 
SELECT r.*, p.tipo_documento, p.numero_documento, p.nombre_completo, u.nombre_usuario 
FROM rutas r 
JOIN usuarios u ON u.id_usuario = r.id_usuario
JOIN personas p ON p.id_persona = u.id_persona;