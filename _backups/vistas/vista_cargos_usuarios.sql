DROP VIEW IF EXISTS vista_cargos_usuarios;
CREATE VIEW vista_cargos_usuarios as
SELECT cu.*, s.id_sede, s.nombre AS sede, o.nombre AS oficina, c.nombre AS cargo, u.nombre_usuario, p.nombre_completo FROM cargos_usuarios cu
JOIN cargos c ON c.id_cargo = cu.id_cargo
JOIN usuarios u ON u.id_usuario = cu.id_usuario
JOIN personas p ON p.id_persona = u.id_persona 
JOIN oficinas o ON o.id_oficina = cu.id_oficina
JOIN sedes s ON s.id_sede = o.id_sede