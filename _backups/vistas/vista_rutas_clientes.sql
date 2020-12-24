DROP VIEW IF EXISTS vista_rutas_clientes;

CREATE VIEW vista_rutas_clientes AS 
SELECT p.numero_documento, p.nombre_completo,
r.*, 
p.tipo_documento,
p.nombres,
p.apellido_paterno,
p.apellido_materno,
p.fecha_nacimiento,
p.direccion,
p.direccion_referencia,
p.email,
p.celular
FROM rutas_clientes r 
JOIN clientes c ON c.id_cliente = r.id_cliente
JOIN personas p ON p.id_persona = c.id_persona;
