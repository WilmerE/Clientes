-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2020 a las 20:08:33
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sct`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dpi` varchar(15) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombres`, `apellidos`, `dpi`, `telefono`, `direccion`) VALUES
(1, 'Wilmer Eulices', 'Pelicó Amador', '3362 44657 1904', '47620050', 'Gualán'),
(2, 'Ingrid Yamileth', 'LÃ³pez AgustÃ­n', '3362 44565 4365', '47620050', 'Esquipulas'),
(3, 'Nelson Jacobo', 'Brenes CalderÃ³n', '3362 44123 1123', '47620050', 'Chiquimula'),
(4, 'CÃ©sar Agusto', 'Lemus Villafuerte', '3362 44321 1321', '47620050', 'Olopa'),
(5, 'Joseph Emmanuel', 'Velasquez Godoy', '3362 44536 1967', '47620050', 'Quezaltepeque'),
(6, 'Claudia María', 'Vargas Flores', '3362 44657 2090', '47620050', 'Chiquimula'),
(7, 'José Willian Junior', 'Hernández Ramírez', '3362 44657 9089', '47620050', 'Chiquimula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `codigo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `codigo`) VALUES
(1, 'Product1', 'P001'),
(2, 'Product2', 'P002'),
(3, 'Product3', 'P003'),
(4, 'Product4', 'P004'),
(5, 'Product5', 'P005'),
(6, 'Product6', 'P006'),
(7, 'Product7', 'P007'),
(8, 'Product8', 'P008'),
(9, 'Product9', 'P009'),
(10, 'Product10', 'P010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `codigo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `nombre`, `codigo`) VALUES
(1, 'Servicio1', 'S001'),
(2, 'Servicio2', 'S002'),
(3, 'Servicio3', 'S003'),
(4, 'Servicio4', 'S004'),
(5, 'Servicio5', 'S005'),
(6, 'Servicio6', 'S006'),
(7, 'Servicio7', 'S007'),
(8, 'Servicio8', 'S008'),
(9, 'Servicio9', 'S009'),
(10, 'Servicio10', 'S010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id` int(11) NOT NULL,
  `tipo_de_atencion` varchar(8) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `codigo` varchar(10) NOT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'cola'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id`, `tipo_de_atencion`, `producto_id`, `servicio_id`, `codigo`, `estado`) VALUES
(10, 'servicio', NULL, 1, 'SE001', 'cola'),
(11, 'servicio', NULL, 2, 'SE002', 'cola'),
(12, 'servicio', NULL, 3, 'SE003', 'cola'),
(13, 'servicio', NULL, 4, 'SE004', 'cola'),
(14, 'producto', 1, NULL, 'PR001', 'cola'),
(15, 'producto', 2, NULL, 'PR002', 'cola'),
(16, 'producto', 3, NULL, 'PR003', 'cola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventanilla`
--

CREATE TABLE `ventanilla` (
  `id` int(11) NOT NULL,
  `ventanilla` int(11) NOT NULL,
  `idservicio` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventanilla`
--

INSERT INTO `ventanilla` (`id`, `ventanilla`, `idservicio`, `idproducto`) VALUES
(7, 1, 1, NULL),
(8, 2, 2, NULL),
(9, 3, 3, NULL),
(10, 4, 4, NULL),
(11, 5, 5, NULL),
(12, 6, 6, NULL),
(13, 7, 7, NULL),
(14, 8, 8, NULL),
(15, 9, 9, NULL),
(16, 10, 10, NULL),
(17, 1, NULL, 1),
(18, 2, NULL, 2),
(19, 3, NULL, 3),
(20, 4, NULL, 4),
(21, 5, NULL, 5),
(22, 6, NULL, 6),
(23, 7, NULL, 7),
(24, 8, NULL, 8),
(25, 9, NULL, 9),
(26, 10, NULL, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `FK_Producto` (`producto_id`),
  ADD KEY `FK_Servicio` (`servicio_id`);

--
-- Indices de la tabla `ventanilla`
--
ALTER TABLE `ventanilla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ProductoV` (`idproducto`),
  ADD KEY `FK_ServicioV` (`idservicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ventanilla`
--
ALTER TABLE `ventanilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `FK_Producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `FK_Servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`);

--
-- Filtros para la tabla `ventanilla`
--
ALTER TABLE `ventanilla`
  ADD CONSTRAINT `FK_ProductoV` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `FK_ServicioV` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
