DROP VIEW IF EXISTS vista_usuarios;

CREATE VIEW vista_usuarios AS 
SELECT u.*, p.nombres, p.apellido_paterno, 
p.apellido_materno, p.nombre_completo, p.foto, p.archivo_1, p.archivo_2, p.clave_publica,
P.tipo_documento, p.numero_documento, p.tipo_persona, p.email, p.celular, p.direccion,
ub.distrito, ub.provincia, ub.departamento
FROM usuarios u 
JOIN personas p ON p.id_persona = u.id_persona
JOIN ubigeo ub ON ub.id_ubigeo = p.ubigeo;