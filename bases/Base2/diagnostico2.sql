-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2022 a las 06:30:36
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `diagnostico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` tinyint(5) UNSIGNED NOT NULL,
  `nombreCategoria` varchar(15) NOT NULL DEFAULT '',
  `descripcion` mediumtext NOT NULL,
  `imagen` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` varchar(5) NOT NULL DEFAULT '',
  `nombreCompania` varchar(40) NOT NULL DEFAULT '',
  `nombreContacto` varchar(30) NOT NULL DEFAULT 'Unknown',
  `direccion` varchar(60) NOT NULL DEFAULT '',
  `ciudad` varchar(15) NOT NULL DEFAULT '',
  `region` varchar(15) NOT NULL DEFAULT '',
  `codigoPostal` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombreCompania`, `nombreContacto`, `direccion`, `ciudad`, `region`, `codigoPostal`) VALUES
('[valu', '[value-2]', '[value-3]', '[value-4]', '[value-5]', '[value-6]', '[value-7]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companiasenvio`
--

CREATE TABLE `companiasenvio` (
  `idCompaniaEnvio` int(10) UNSIGNED NOT NULL,
  `nombreCompania` varchar(10) NOT NULL DEFAULT '',
  `telefono` varchar(24) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(20) NOT NULL DEFAULT '',
  `nombre` varchar(10) NOT NULL DEFAULT '',
  `cargo` varchar(30) NOT NULL DEFAULT '',
  `tratamiento` varchar(25) NOT NULL DEFAULT '',
  `fechaNacimiento` datetime NOT NULL,
  `fechaContratacion` datetime NOT NULL,
  `direccion` varchar(60) NOT NULL DEFAULT '',
  `ciudad` varchar(15) NOT NULL DEFAULT '',
  `region` varchar(15) NOT NULL DEFAULT '',
  `codigoPostal` varchar(10) NOT NULL DEFAULT '',
  `pais` varchar(15) NOT NULL DEFAULT '',
  `telefonoDomicilio` varchar(24) NOT NULL DEFAULT '',
  `extension` varchar(4) NOT NULL DEFAULT '',
  `foto` varchar(50) NOT NULL DEFAULT '',
  `notas` mediumtext DEFAULT NULL,
  `jefe` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(10) UNSIGNED NOT NULL,
  `nombreCompania` varchar(40) NOT NULL DEFAULT '',
  `nombreContacto` varchar(30) NOT NULL DEFAULT '',
  `cargoContacto` varchar(30) NOT NULL DEFAULT '',
  `direccion` varchar(60) NOT NULL DEFAULT '',
  `cuidad` varchar(15) NOT NULL DEFAULT '',
  `region` varchar(15) NOT NULL DEFAULT '',
  `codigoPostal` varchar(10) NOT NULL DEFAULT '',
  `pais` varchar(15) NOT NULL DEFAULT '',
  `telefono` varchar(24) NOT NULL DEFAULT '',
  `fax` varchar(24) NOT NULL DEFAULT '',
  `homePage` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `idRegion` int(11) NOT NULL,
  `descripcionRegion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `territorios`
--

CREATE TABLE `territorios` (
  `idTerritorio` varchar(5) NOT NULL,
  `descripcionTerritorio` varchar(50) NOT NULL,
  `idRegion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `Uidx_categorias_name` (`nombreCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idx_clientes_company_name` (`nombreCompania`),
  ADD KEY `idx_clientes_ciudad` (`ciudad`),
  ADD KEY `idx_clientes_region` (`region`),
  ADD KEY `idx_clientes_codigoPostal` (`codigoPostal`);

--
-- Indices de la tabla `companiasenvio`
--
ALTER TABLE `companiasenvio`
  ADD PRIMARY KEY (`idCompaniaEnvio`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idx_empleados_apellido` (`apellido`),
  ADD KEY `idx_empleados_codigoPostal` (`codigoPostal`),
  ADD KEY `idx_jefe` (`jefe`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `idx_proveedores_product_name` (`nombreCompania`),
  ADD KEY `idx_proveedores_codigoPostal` (`codigoPostal`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`idRegion`);

--
-- Indices de la tabla `territorios`
--
ALTER TABLE `territorios`
  ADD PRIMARY KEY (`idTerritorio`),
  ADD KEY `fk_region_idx` (`idRegion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` tinyint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `companiasenvio`
--
ALTER TABLE `companiasenvio`
  MODIFY `idCompaniaEnvio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `idRegion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `FK_empleados_report_to` FOREIGN KEY (`jefe`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `territorios`
--
ALTER TABLE `territorios`
  ADD CONSTRAINT `fk_region` FOREIGN KEY (`idRegion`) REFERENCES `regiones` (`idRegion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
