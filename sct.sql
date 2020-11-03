-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2020 a las 05:49:03
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
  `tipo_de_servicio` varchar(8) NOT NULL,
  `codigo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD UNIQUE KEY `codigo` (`codigo`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
