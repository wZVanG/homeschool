DROP VIEW IF EXISTS vista_usuarios_reemplazo;

CREATE VIEW vista_usuarios_reemplazo AS 

SELECT 

ur.*,

cu.id_usuario AS cargo_id_usuario,

cau.nombre_usuario AS cargo_nombre_usuario,
re.nombre_usuario AS reemplazo_nombre_usuario,

cap.nombre_completo AS cargo_nombre_completo,
rep.nombre_completo AS reemplazo_nombre_completo,

cap.numero_documento AS cargo_numero_documento,
rep.numero_documento AS reemplazo_numero_documento,

c.nombre AS cargo,
o.nombre AS oficina

FROM usuarios_reemplazo ur 
JOIN usuarios re ON re.id_usuario = ur.id_usuario
JOIN cargos_usuarios cu ON cu.id_cargo_usuario = ur.id_cargo_usuario
JOIN cargos c ON c.id_cargo = cu.id_cargo
JOIN oficinas o ON o.id_oficina = cu.id_oficina
JOIN usuarios cau ON cau.id_usuario = cu.id_usuario
JOIN personas rep ON rep.id_persona = re.id_persona
JOIN personas cap ON cap.id_persona = cau.id_persona


