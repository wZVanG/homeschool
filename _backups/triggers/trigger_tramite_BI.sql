BEGIN 
DECLARE v_tipo_numeracion CHAR(3) DEFAULT 'TRA';
DECLARE v_numero INT DEFAULT NULL;
DECLARE v_anho CHAR(4) DEFAULT NULL;

SET v_anho = YEAR(CURRENT_DATE);

-- Buscamos numeracion del anho
SELECT numero INTO v_numero FROM numeracion WHERE anho = v_anho AND tipo = v_tipo_numeracion;

-- Si no la encuentra, la creamos desde el 1
IF(v_numero IS NULL) THEN
    INSERT INTO numeracion (tipo, anho, numero) VALUES (v_tipo_numeracion, v_anho, 1);
    SET v_numero = 1;
END IF;

SET NEW.codigo = CONCAT(v_anho, LPAD(v_numero, 6, '0'));

UPDATE numeracion SET numero = v_numero + 1 WHERE anho = v_anho AND tipo = v_tipo_numeracion;

END