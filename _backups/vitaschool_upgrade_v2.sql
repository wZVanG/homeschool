-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2021 a las 13:59:01
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `homeschool`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_bloques`
--

CREATE TABLE `usuarios_bloques` (
  `id_usuario_bloque` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_bloque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios_bloques`
--
ALTER TABLE `usuarios_bloques`
  ADD PRIMARY KEY (`id_usuario_bloque`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_bloque` (`id_bloque`),
  ADD KEY `id_periodo` (`id_periodo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios_bloques`
--
ALTER TABLE `usuarios_bloques`
  MODIFY `id_usuario_bloque` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios_bloques`
--
ALTER TABLE `usuarios_bloques`
  ADD CONSTRAINT `for_id_bloque_b` FOREIGN KEY (`id_bloque`) REFERENCES `bloques` (`id_bloque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `for_id_periodo_p` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `for_id_usuario_b` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
