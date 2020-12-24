DROP VIEW IF EXISTS vista_tramite;
CREATE VIEW vista_tramite AS
SELECT t.*, o.nombre AS oficina, c.nombre AS cargo, p.nombre_completo, e.nombre_completo AS empresa, 
e.tipo_documento AS tipos_documento_empresa, e.numero_documento AS numero_documento_empresa, 
td.nombre AS tipo_documento, td.periodo_max, a.nombre AS accion ,
ure.nombre_usuario AS reemplazo_nombre_usuario,
pre.nombre_completo AS reemplazo_nombre_completo
FROM tramite t
JOIN oficinas o ON o.id_oficina = t.id_oficina
JOIN cargos_usuarios cu ON cu.id_cargo_usuario = t.id_cargo_usuario
JOIN usuarios u ON u.id_usuario = cu.id_usuario
JOIN personas p ON p.id_persona = u.id_persona
JOIN cargos c ON c.id_cargo = cu.id_cargo
JOIN acciones a ON a.id_accion = t.id_accion
JOIN personas e ON e.id_persona = t.id_empresa_externo
JOIN tipos_documento td ON td.id_tipo_documento = t.id_tipo_documento
LEFT JOIN usuarios_reemplazo re ON re.id_usuario_reemplazo = t.id_usuario_reemplazo 
LEFT JOIN usuarios ure ON ure.id_usuario = re.id_usuario
LEFT JOIN personas pre ON pre.id_persona = ure.id_persona
