-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-06-2020 a las 11:57:15
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trabaja`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

DROP TABLE IF EXISTS `envio`;
CREATE TABLE IF NOT EXISTS `envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `comentario` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_754737D5521E1991` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id`, `empresa_id`, `fecha`, `comentario`, `user`) VALUES
(53, 49, '2020-06-19 10:18:49', 'kk', '1'),
(54, 44, '2020-06-19 10:18:49', 'kk', '1'),
(55, 45, '2020-06-19 10:18:49', 'kk', '1'),
(56, 49, '2020-06-19 10:23:44', 'mmm', '1'),
(57, 45, '2020-06-19 10:24:05', 'lllll', '1'),
(58, 21, '2020-06-19 10:24:05', 'lllll', '1'),
(59, 21, '2020-06-19 10:28:34', 'esto es una prrueba', '1'),
(60, 43, '2020-06-19 10:34:44', '', '1'),
(61, 43, '2020-06-19 10:35:03', 'hh', '1'),
(62, 43, '2020-06-19 10:35:21', 'nnn', '1'),
(63, 45, '2020-06-19 10:36:37', 'fghj gj gf', '1'),
(64, 49, '2020-06-19 10:36:49', 'jlhjlghl', '1'),
(65, 44, '2020-06-19 10:36:49', 'jlhjlghl', '1'),
(66, 21, '2020-06-19 10:42:09', 'esto es una prueba', '1'),
(67, 21, '2020-06-19 10:42:48', 'esto es una prueba colectiva esto es una prueba colectiva esto es una prueba colectiva esto es una prueba colectivaesto es una prueba colectiva', '1'),
(68, 47, '2020-06-19 10:42:48', 'esto es una prueba colectiva', '1'),
(69, 19, '2020-06-19 10:42:48', 'esto es una prueba colectiva', '1'),
(70, 28, '2020-06-19 10:43:21', '', '1'),
(71, 18, '2020-06-19 10:43:21', '', '1'),
(72, 18, '2020-06-19 10:43:39', 'bien', '1'),
(73, 49, '2020-06-19 16:30:05', 'hg j jh ghjgj', '1'),
(74, 17, '2020-06-23 11:54:42', 'nada', '1');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `FK_754737D5521E1991` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
