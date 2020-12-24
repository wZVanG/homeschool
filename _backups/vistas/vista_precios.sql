
DROP VIEW IF EXISTS vista_precios;

CREATE VIEW vista_precios AS 
SELECT p.*, u.nombre AS nombre_unidad_medida
FROM precios p 
LEFT JOIN clientes c ON c.id_cliente = p.id_cliente
LEFT JOIN categorias k ON k.id_categoria = p.id_categoria
LEFT JOIN unidad_medida u ON u.id_unidad_medida = p.id_unidad_medida