-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 31-03-2015 a las 19:14:17
-- Versión del servidor: 5.6.22-log
-- Versión de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_daluca`
--
CREATE DATABASE IF NOT EXISTS `db_daluca` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_daluca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `ID_departamento` varchar(70) NOT NULL,
  `nombre_dpto` varchar(70) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`ID_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID_departamento`, `nombre_dpto`, `descripcion`) VALUES
('DALU_ECO', 'Departamento de Economia y Finanzas', 'El departamento encargado de la administración financiera de esta institución cuyo proposito no se ha definido.'),
('DALU_SIS', 'Sistemas e Informatica', 'Gestiona todo lo referente al area de IT de la organización.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_atiende_solicitud`
--

CREATE TABLE IF NOT EXISTS `departamento_atiende_solicitud` (
  `ID_departamento` varchar(70) NOT NULL,
  `numero_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`ID_departamento`,`numero_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_ticket`
--

CREATE TABLE IF NOT EXISTS `solicitud_ticket` (
  `numero_solicitud` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha_cierre` date NOT NULL,
  `estatus` varchar(70) NOT NULL,
  `tipo_incidente` varchar(70) NOT NULL,
  `prioridad` varchar(70) NOT NULL,
  `descripcion_solucion` varchar(500) NOT NULL,
  `tiempo_requerido` time NOT NULL,
  PRIMARY KEY (`numero_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuario`
--

CREATE TABLE IF NOT EXISTS `tipos_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `tipo_nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE KEY `id_tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_usuario`
--

INSERT INTO `tipos_usuario` (`id_tipo_usuario`, `tipo_nombre`) VALUES
(1, 'Administrador'),
(2, 'Analista'),
(3, 'Gerente'),
(4, 'Solicitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `tipo_usuario` int(11) NOT NULL,
  `cedula` bigint(20) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `ID_usuario` varchar(70) NOT NULL DEFAULT '',
  `ID_password` varchar(70) NOT NULL COMMENT 'constraseña del usuario',
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`ID_usuario`),
  KEY `tipo_usuario` (`tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`tipo_usuario`, `cedula`, `nombre`, `apellido`, `ID_usuario`, `ID_password`, `fecha_nacimiento`) VALUES
(2, 23765789, 'Diana', 'Acevedo', 'dacevedo', 'dacevedo', '2010-08-11'),
(3, 20938475, 'Daniel', 'Aguilar', 'daguilar', 'daguilar', '2015-03-31'),
(1, 19919468, 'Luis', 'Pérez', 'lperez', 'lperez', '1992-03-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_genera_solicitud`
--

CREATE TABLE IF NOT EXISTS `usuario_genera_solicitud` (
  `ID_usuario` varchar(70) NOT NULL,
  `numero_solicitud` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  PRIMARY KEY (`ID_usuario`,`numero_solicitud`),
  KEY `numero_solicitud` (`numero_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_pertenece_departamento`
--

CREATE TABLE IF NOT EXISTS `usuario_pertenece_departamento` (
  `ID_departamento` varchar(70) NOT NULL,
  `ID_usuario` varchar(70) NOT NULL,
  PRIMARY KEY (`ID_usuario`,`ID_departamento`),
  KEY `ID_departamento` (`ID_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_pertenece_departamento`
--

INSERT INTO `usuario_pertenece_departamento` (`ID_departamento`, `ID_usuario`) VALUES
('DALU_ECO', 'daguilar'),
('DALU_SIS', 'dacevedo'),
('DALU_SIS', 'lperez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tiene_telefono`
--

CREATE TABLE IF NOT EXISTS `usuario_tiene_telefono` (
  `ID_usuario` varchar(70) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_usuario`,`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_tiene_telefono`
--

INSERT INTO `usuario_tiene_telefono` (`ID_usuario`, `telefono`) VALUES
('lperez', 4144415939);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipos_usuario` (`id_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_genera_solicitud`
--
ALTER TABLE `usuario_genera_solicitud`
  ADD CONSTRAINT `usuario_genera_solicitud_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `usuario_genera_solicitud_ibfk_2` FOREIGN KEY (`numero_solicitud`) REFERENCES `solicitud_ticket` (`numero_solicitud`);

--
-- Filtros para la tabla `usuario_pertenece_departamento`
--
ALTER TABLE `usuario_pertenece_departamento`
  ADD CONSTRAINT `usuario_pertenece_departamento_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `usuario_pertenece_departamento_ibfk_2` FOREIGN KEY (`ID_departamento`) REFERENCES `departamento` (`ID_departamento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
