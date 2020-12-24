
DROP VIEW IF EXISTS vista_viajes_detalles;

CREATE VIEW vista_viajes_detalles AS 

SELECT vd.id_viaje_detalle, vd.fecha AS fecha_detalle, vp.*, ca.nombre AS categoria, u.nombre AS unidad_medida,
c.nombre_completo AS cliente, s.name AS servicio,
la.nombre AS local_actual,
ld.nombre AS local_detalle,
ee.nombre AS estado_envio,
us.nombre_usuario,
p.nombre_completo AS usuario_nombre_completo
FROM viajes_detalles vd
JOIN viajes vj ON vj.id_viaje = vd.id_viaje
JOIN ventas_productos vp ON vp.id_venta_producto = vd.id_venta_producto
JOIN ventas v ON v.id_venta = vp.id_venta
JOIN categorias ca ON ca.id_categoria = vp.id_categoria
JOIN unidad_medida u ON u.id_unidad_medida = vp.id_unidad_medida
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
JOIN estado_envio ee ON ee.id_estado_envio = vd.id_estado_envio
JOIN usuarios us ON us.id_usuario = vd.id_usuario
JOIN personas p ON p.id_persona = us.id_persona
JOIN locales ld ON ld.id_local = vj.id_local
LEFT JOIN locales la ON la.id_local = vp.id_local_actual