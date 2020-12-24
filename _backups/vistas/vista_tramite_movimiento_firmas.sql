DROP VIEW IF EXISTS vista_tramite_movimiento_firmas;
CREATE VIEW vista_tramite_movimiento_firmas AS

SELECT f.*, p.nombre_completo, p.numero_documento, u.nombre_usuario FROM
tramite_movimiento_firmas f 
JOIN usuarios u ON u.id_usuario = f.id_usuario
JOIN personas p ON p.id_persona = u.id_persona