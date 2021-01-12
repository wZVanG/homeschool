

CREATE TABLE `bloques` (
  `id_bloque` int(11) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `usuario_registro` int(11) NOT NULL,
  `usuario_actualizacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `bloques`
  ADD PRIMARY KEY (`id_bloque`),
  ADD KEY `usuario_registro` (`usuario_registro`),
  ADD KEY `usuario_actualizacion` (`usuario_actualizacion`);

ALTER TABLE `bloques`
  MODIFY `id_bloque` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
