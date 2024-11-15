-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2024 a las 01:25:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `resto`
--
CREATE DATABASE IF NOT EXISTS `resto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `resto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetalle` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `idMesa` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`idMesa`, `numero`, `capacidad`, `estado`) VALUES
(1, 10, 10, 0),
(2, 10, 10, 1),
(3, 1, 8, 1),
(4, 2, 2, 1),
(5, 3, 6, 1),
(6, 4, 4, 1),
(7, 5, 8, 1),
(8, 6, 6, 1),
(9, 7, 6, 1),
(10, 8, 8, 1),
(11, 9, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesero`
--

CREATE TABLE `mesero` (
  `idMesero` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `dni` int(11) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `contraseña` text NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesero`
--

INSERT INTO `mesero` (`idMesero`, `nombre`, `dni`, `usuario`, `contraseña`, `estado`) VALUES
(1, 'Juan', 40444444, 'juan@gmail.com', 'juan1234', 0),
(2, 'Felipe', 45500500, 'Felipe@gmail.com', 'Feli2024', 1),
(3, 'Rita', 49930900, 'Rita00@gmail.com', 'Rresto024', 1),
(4, 'Luana', 38830300, 'Luana20qgmail.com', 'L20ñ.', 1),
(5, 'Juan Pablo', 40488400, 'juanPablo@gmail.com', 'juanPablo1234', 1),
(6, 'Juan Pablillo', 40400400, 'juanPablo@gmail.com', 'juanPablo1234', 1),
(7, 'Juan Pablillo', 40444444, 'juanPablo@gmail.com', 'juanPablo1234', 1),
(8, 'Juan Pablillo', 40444444, 'juanPablo@gmail.com', 'juanPablo1234', 1),
(9, 'Juan Jose', 404, 'joselo@gmail.com', 'jos1234', 1),
(10, 'monica', 23399000, 'Rivero@gmail', '123', 1),
(11, 'Sandra', 40486373, 'sandra2023', '122', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `idMesero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `estado`, `idMesa`, `idMesero`) VALUES
(3, 1, 1, 1),
(4, 1, 2, 2),
(6, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `codigo`, `nombre`, `cantidad`, `precio`, `estado`) VALUES
(1, 40, 'Pizza Común', 10, 5000, 0),
(2, 40, 'Pizza Muzzarela', 10, 6000, 1),
(3, 507, 'Hamburguesa(confritas)', 6, 7000, 0),
(4, 504, 'Hamburgueza Grande (com fritas)', 4, 7800, 0),
(5, 300, 'Lomo', 2, 7000, 0),
(6, 18, 'Tallarines con Tuco', 10, 3000, 0),
(7, 10, 'Empanadas JyQ(1 docena)', 14, 8000, 0),
(8, 9, 'Empanas de Carne (1 docena)', 15, 7000, 0),
(9, 1, 'LomoPizza (con fritas)', 4, 16000, 0),
(10, 2, 'Harburpizza', 6, 12000, 0),
(11, 8, 'Pollo Asado', 12, 13500, 0),
(12, 10, 'Fritas Grandes XL', 8, 5000, 0),
(13, 9, 'Fritas Chicas', 8, 3500, 0),
(14, 45, 'Coca Cola(1ltr)', 25, 2000, 0),
(15, 48, 'Cerveza Andes(envase )', 50, 2500, 0),
(16, 49, 'Cerveza Andes Negra(envase)', 50, 3000, 0),
(17, 56, 'Pizza Especial', 10, 6500, 1),
(18, 56, 'Pizza Especial', 10, 6500, 1),
(19, 507, 'Hamburguesa(confritas)', 6, 7000, 1),
(20, 504, 'Hamburgueza Grande (com fritas)', 4, 7800, 1),
(21, 300, 'Lomo', 8, 8000, 1),
(22, 18, 'Tallarines con Tuco', 10, 3000, 1),
(23, 10, 'Empanadas JyQ(1 docena)', 14, 8000, 1),
(24, 9, 'Empanas de Carne (1 docena)', 15, 7000, 1),
(25, 1, 'LomoPizza (con fritas)', 4, 16000, 1),
(26, 2, 'Harburpizza', 6, 12000, 1),
(27, 8, 'Pollo Asado', 12, 13500, 1),
(28, 10, 'Fritas Grandes XL', 8, 5000, 1),
(29, 9, 'Fritas Chicas', 8, 3500, 1),
(30, 56, 'Pizza Especial', 10, 6500, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `dni` bigint(25) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idReserva`, `idMesa`, `nombre`, `dni`, `fecha`, `hora`, `estado`) VALUES
(1, 2, 'Luisana', 29305590, '2024-10-20', '21:00:00', 0),
(2, 10, 'José Luis Antonio', 23172481, '2024-12-24', '22:00:00', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`idMesa`);

--
-- Indices de la tabla `mesero`
--
ALTER TABLE `mesero`
  ADD PRIMARY KEY (`idMesero`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `idMesa` (`idMesa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `idMesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `mesero`
--
ALTER TABLE `mesero`
  MODIFY `idMesero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idMesero`) REFERENCES `mesero` (`idMesero`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
