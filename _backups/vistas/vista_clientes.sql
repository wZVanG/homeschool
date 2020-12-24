DROP VIEW IF EXISTS vista_clientes;

CREATE VIEW vista_clientes AS 
SELECT p.numero_documento, p.nombre_completo,
c.*, 
r.nombre AS ruta,
p.tipo_documento,
p.nombres,
p.apellido_paterno,
p.apellido_materno,
p.fecha_nacimiento,
p.sexo,
p.foto,
p.ubigeo,
p.direccion,
p.direccion_referencia,
p.direccion_2,
p.email,
p.email_2,
p.celular,
p.celular_2,
p.tipo_negocio,
p.tipo_negocio_otro,
ub.departamento,
ub.provincia,
ub.distrito,
pr.nombre  AS nombre_credito,
(SELECT COUNT(*) FROM creditos WHERE id_tipo_credito = 1 AND id_cliente = c.id_cliente) AS total_creditos_diario
FROM clientes c 
JOIN rutas r ON r.id_ruta = c.id_ruta
JOIN personas p ON p.id_persona = c.id_persona
JOIN ubigeo ub ON ub.id_ubigeo = p.ubigeo
JOIN tipos_creditos pr ON pr.id_tipo_credito = c.id_tipo_credito;
