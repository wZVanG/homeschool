DROP VIEW IF EXISTS vista_tipos_negocio;

CREATE VIEW vista_tipos_negocio AS 
SELECT t.*, (SELECT COUNT(*) FROM personas WHERE tipo_negocio = t.id_tipo_negocio AND estado <> 0) AS total_tipos 
FROM tipos_negocio t
ORDER BY t.orden ASC