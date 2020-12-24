
DROP VIEW IF EXISTS vista_ventas_productos;

CREATE VIEW vista_ventas_productos AS 
SELECT vp.*, ca.nombre AS categoria, u.nombre AS unidad_medida,
c.nombre_completo AS cliente, c.numero_documento, c.tipo_documento,
s.name AS servicio,
la.nombre AS local_actual,
ee.nombre AS estado_envio
FROM ventas_productos vp
JOIN ventas v ON v.id_venta = vp.id_venta
JOIN categorias ca ON ca.id_categoria = vp.id_categoria
JOIN unidad_medida u ON u.id_unidad_medida = vp.id_unidad_medida
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
JOIN estado_envio ee ON ee.id_estado_envio = vp.id_estado_envio
LEFT JOIN locales la ON la.id_local = vp.id_local_actual