DROP VIEW IF EXISTS vista_oficinas;

CREATE VIEW vista_oficinas AS 
SELECT o.*, s.nombre AS nombre_sede FROM oficinas o 
JOIN sedes s ON s.id_sede = o.id_sede;

