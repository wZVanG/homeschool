DROP VIEW IF EXISTS vista_videos;

CREATE VIEW vista_videos AS 
SELECT v.*, g.nombre AS genero, c.nombre AS categoria, c.url AS categoria_url
FROM videos v 
JOIN genero g ON g.id_genero = v.id_genero
JOIN categorias c ON c.id_categoria = v.id_categoria;