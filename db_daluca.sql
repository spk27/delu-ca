-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-04-2015 a las 00:35:24
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
('DALU_SIS', 'Sistemas e Informatica', 'Gestiona todo lo referente al area de IT de la organización.'),
('DELU_SHOW', 'Departamento de Espectaculos', 'Hahahaha no puej, tiene que haber uno para los showceros de la empresa.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_ticket`
--

CREATE TABLE IF NOT EXISTS `solicitud_ticket` (
  `numero_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `generada_por` varchar(70) NOT NULL,
  `descripcion` text NOT NULL,
  `estatus` set('Atendido','En Espera','En Proceso') NOT NULL,
  `tipo_incidente` set('Hardware','Software','Desarrollo') NOT NULL,
  `prioridad` set('1','2','3') NOT NULL,
  `tiempo_max_respuesta` int(11) NOT NULL COMMENT 'cantidad de días máximo que se puede tardar un analista en responder',
  `imagen` varchar(500) DEFAULT NULL COMMENT 'url de la imagen recibida como parte de una solicitud',
  `calidad_servicio` set('Excelente','Bueno','Aceptable','Regular') DEFAULT NULL,
  `atendida_por` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`numero_solicitud`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `solicitud_ticket`
--

INSERT INTO `solicitud_ticket` (`numero_solicitud`, `generada_por`, `descripcion`, `estatus`, `tipo_incidente`, `prioridad`, `tiempo_max_respuesta`, `imagen`, `calidad_servicio`, `atendida_por`) VALUES
(3, 'wflorence', 'Any lost revealing.', 'En Espera', 'Hardware', '1', 20, 'zatch-bell-421359.jpg', NULL, NULL),
(4, 'wflorence', 'Any lost revealing.', 'En Espera', 'Hardware', '1', 20, 'zatch-bell-421359.jpg', NULL, NULL),
(5, 'wflorence', 'añskjdhakjdsha', 'En Proceso', 'Desarrollo', '1', 1, 'zatch-bell-421359.jpg', NULL, 'fdostoievski'),
(6, 'wflorence', 'Rápdio fue horrible lo que pasó.', 'En Espera', 'Software', '3', 3, 'zatch-bell-421471.jpg', NULL, NULL),
(7, 'wflorence', 'Exhale', 'En Proceso', 'Desarrollo', '2', 100, '', NULL, 'fdostoievski'),
(8, 'wflorence', 'Never leave it to late, I was enjoying the grace.', 'En Espera', 'Desarrollo', '3', 20, 'zatch-bell-421471.jpg', NULL, NULL),
(9, 'wflorence', 'Información relacionada con las solicitudes generadas por usted. En la tabla puede verlas desde la más reciente a la más antigua. Información relacionada con las solicitudes generadas por usted. En la tabla puede verlas desde la más reciente a la más antigua. Información relacionada con las solicitudes generadas por usted. En la tabla puede verlas desde la más reciente a la más antigua. Información relacionada con las solicitudes generadas por usted. En la tabla puede verlas desde la más reciente a la más antigua. Información relacionada con las solicitudes generadas por usted. En la tabla puede verlas desde la más reciente a la más antigua.', 'En Proceso', 'Software', '2', 20, 'zatch-bell-421359.jpg', NULL, 'fdostoievski'),
(10, 'tgreen', 'Holy Cow! This is a disadter! HELP US!', 'En Espera', 'Software', '2', 3, '', NULL, NULL),
(11, 'nfisher', 'Falla en iTunes', 'En Espera', 'Software', '2', 3, 'alt-j2nexus.png', NULL, NULL),
(12, 'nfisher', 'Bratja means Brother in Russian. Song from FMA', 'En Espera', 'Hardware', '2', 23, '', NULL, NULL);

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
  `fecha_nacimiento` date NOT NULL,
  `estatus` set('Activo','Inactivo') NOT NULL COMMENT 'para la eliminación',
  `departamento` varchar(70) NOT NULL,
  `comentario` text,
  PRIMARY KEY (`ID_usuario`),
  KEY `tipo_usuario` (`tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`tipo_usuario`, `cedula`, `nombre`, `apellido`, `ID_usuario`, `ID_password`, `fecha_nacimiento`, `estatus`, `departamento`, `comentario`) VALUES
(3, 12345876, 'Anny', 'Perez', 'ajperez', 'ajperez', '1989-01-14', 'Activo', 'DALU_ECO', NULL),
(2, 123123425, 'Keith', 'Charles', 'charles_keith', 'charles_keith', '1976-06-02', 'Inactivo', 'DELU_SHOW', NULL),
(4, 5893963897, 'Claire Simonne', 'Fisher', 'claire_fisher', 'claire_fisher', '1989-12-23', 'Inactivo', 'DELU_SHOW', NULL),
(2, 23765789, 'Diana', 'Acevedo', 'dacevedo', 'dacevedo', '2010-08-11', 'Activo', 'DALU_SIS', NULL),
(3, 20938475, 'Daniel', 'Aguilar', 'daguilar', 'daguilar', '2015-03-31', 'Activo', 'DALU_SIS', NULL),
(3, 923462967, 'Elluz', 'Euzcategui', 'euzcategui', 'euzcategui', '1982-12-02', 'Activo', 'DALU_ECO', NULL),
(2, 8995849898, 'Fedor', 'Dostoievski', 'fdostoievski', 'fdostoievski', '1897-01-02', 'Activo', 'DALU_SIS', 'El autor de la novela Crimen y Castigo'),
(4, 2330495730, 'Lana', 'Del Rey', 'ldelrey', 'ldelrey', '1989-11-01', 'Inactivo', 'DALU_SHOW', NULL),
(1, 19919468, 'Luis', 'Pérez', 'lperez', 'lperez', '1992-03-20', 'Activo', 'DALU_SIS', NULL),
(4, 500678345, 'Nathaniel', 'Fisher', 'nfisher', 'nfisher', '1978-04-16', 'Activo', 'DALU_SHOW', NULL),
(4, 126546872, 'Tom', 'Green', 'tgreen', 'tgreen', '1978-12-12', 'Activo', 'DALU_SHOW', NULL),
(4, 23456789, 'Florence', 'Welch', 'wflorence', 'wflorence', '1987-06-16', 'Activo', 'DALU_SHOW', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_pertenece_departamento`
--

CREATE TABLE IF NOT EXISTS `usuario_pertenece_departamento` (
  `ID_departamento` varchar(70) NOT NULL,
  `ID_usuario` varchar(70) NOT NULL,
  PRIMARY KEY (`ID_usuario`,`ID_departamento`),
  KEY `usuario_pertenece_departamento_ibfk_2` (`ID_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_pertenece_departamento`
--

INSERT INTO `usuario_pertenece_departamento` (`ID_departamento`, `ID_usuario`) VALUES
('DALU_ECO', 'ajperez'),
('DALU_ECO', 'daguilar'),
('DALU_ECO', 'euzcategui'),
('DALU_ECO', 'ldelrey'),
('DALU_ECO', 'tgreen'),
('DALU_SIS', 'dacevedo'),
('DALU_SIS', 'lperez'),
('DELU_SHOW', 'nfisher'),
('DELU_SHOW', 'wflorence');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipos_usuario` (`id_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_pertenece_departamento`
--
ALTER TABLE `usuario_pertenece_departamento`
  ADD CONSTRAINT `usuario_pertenece_departamento_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_pertenece_departamento_ibfk_2` FOREIGN KEY (`ID_departamento`) REFERENCES `departamento` (`ID_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
