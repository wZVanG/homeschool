
DROP VIEW IF EXISTS vista_actor;

CREATE VIEW vista_actor AS 
SELECT a.*, act.nombre AS tipo
FROM actor a 
JOIN actor_tipo act ON act.id_actor_tipo = a.id_tipo