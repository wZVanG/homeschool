DROP VIEW IF EXISTS vista_personas;

CREATE VIEW vista_personas AS 
SELECT p.*, u.distrito, u.provincia, u.departamento FROM personas p
LEFT JOIN ubigeo u ON u.id_ubigeo = p.ubigeo
;