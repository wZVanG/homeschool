DROP VIEW IF EXISTS vista_tipos_creditos;

CREATE VIEW vista_tipos_creditos AS 
SELECT t.*, (SELECT COUNT(*) FROM clientes WHERE id_tipo_credito = t.id_tipo_credito AND estado <> 0) AS total_creditos 
FROM tipos_creditos t
ORDER BY t.orden ASC