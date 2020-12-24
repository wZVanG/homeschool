DROP VIEW IF EXISTS vista_creditos;

CREATE VIEW vista_creditos AS 
SELECT p.numero_documento, p.nombre_completo,
c.*, 
r.nombre AS ruta,
p.tipo_documento,
pr.nombre  AS nombre_credito
FROM creditos c 
JOIN clientes cl ON cl.id_cliente = c.id_cliente
JOIN rutas r ON r.id_ruta = c.id_ruta
JOIN personas p ON p.id_persona = c.id_persona
JOIN tipos_creditos pr ON pr.id_tipo_credito = c.id_tipo_credito;
