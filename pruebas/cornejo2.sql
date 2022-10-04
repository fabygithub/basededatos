-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2022 a las 18:12:11
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cornejo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_autor` ()  begin 
INSERT INTO TBL_AUTOR (ID_AUTOR, NOM_AUTOR, APAT, AMAT, FEC_NAC, NACIONALIDAD)
VALUES ('AU_200', 'GABRIELA', 'MISTRAL', 'MISTRAL', '1889-04-07', 'CHILENA');
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respaldo_insert`
--

CREATE TABLE `respaldo_insert` (
  `ID_EDITORIAL` varchar(15) NOT NULL,
  `NOM_EDITORIAL` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `E_MAIL` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respaldo_insert`
--

INSERT INTO `respaldo_insert` (`ID_EDITORIAL`, `NOM_EDITORIAL`, `DIRECCION`, `TELEFONO`, `E_MAIL`) VALUES
('ED_001', 'ALFAGUARA', 'EDIFICIO HERMES 4, SEVILLA', '99542312', 'ALFAGUARA@GMAIL.COM'),
('ED_002', 'SANTILLANA', 'ANDRES BELLO 2209, SANTIAGO', '98745563', 'SANTILLANA@GMAIL.COM'),
('ED_003', 'PLANETA', 'BARROS ARANA 1524', '36568952', 'PLANETALIBROS@PLANET'),
('ED_004', 'PRENTICE HALL', 'WENTIS 1489 MIAMI', '888-232323', 'PRENTICEHALL@EDUCATI'),
('ED_005', 'MC GRAU HILL', 'CRAWFORD 2325, NEW YORK', '564-874522', 'MCGRAU@HILL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respaldo_update`
--

CREATE TABLE `respaldo_update` (
  `ID_LIBRO` varchar(10) NOT NULL,
  `NOM_LIBRO` varchar(20) DEFAULT NULL,
  `CATEGORIA` varchar(20) DEFAULT NULL,
  `PAGINAS` varchar(10) DEFAULT NULL,
  `FK_ID_EDITORIAL` varchar(15) DEFAULT NULL,
  `FK_ID_AUTOR` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respaldo_update`
--

INSERT INTO `respaldo_update` (`ID_LIBRO`, `NOM_LIBRO`, `CATEGORIA`, `PAGINAS`, `FK_ID_EDITORIAL`, `FK_ID_AUTOR`) VALUES
('LB_001', 'CIELO, MAR Y TIERRA', 'POESIA', '120', 'ED_002', 'AU_111'),
('LB_002', 'CORONACION', 'NOVELA', '350', 'ED_004', 'AU_444'),
('LB_003', 'UNA HISTORIA CON DOS', 'INFANTIL', '200', 'ED_001', 'AU_333'),
('LB_004', 'LANCHAS EN LA BAHIA', 'CUENTO', '200', 'ED_005', 'AU_555'),
('LB_005', '20 POEMAS DE AMOR', 'SONETOS Y POESIA', '145', 'ED_003', 'AU_222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor`
--

CREATE TABLE `tbl_autor` (
  `ID_AUTOR` varchar(10) NOT NULL,
  `NOM_AUTOR` varchar(20) DEFAULT NULL,
  `APAT` varchar(20) DEFAULT NULL,
  `AMAT` varchar(20) DEFAULT NULL,
  `FEC_NAC` date DEFAULT NULL,
  `NACIONALIDAD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_autor`
--

INSERT INTO `tbl_autor` (`ID_AUTOR`, `NOM_AUTOR`, `APAT`, `AMAT`, `FEC_NAC`, `NACIONALIDAD`) VALUES
('AU_111', 'GABRIELA', 'MISTRAL', 'MISTRAL', '1889-04-07', 'CHILENA'),
('AU_200', 'GABRIELA', 'MISTRAL', 'MISTRAL', '1889-04-07', 'CHILENA'),
('AU_222', 'PABLO', 'NERUDA', 'NERUDA', '1904-07-12', 'CHILENA'),
('AU_333', 'MARTA', 'BRUNET', 'CARAVES', '1897-08-09', 'CHILENA'),
('AU_444', 'JOSE', 'DONOSO', 'YAÑEZ', '1924-10-05', 'CHILENA'),
('AU_555', 'MANUEL', 'ROJAS', 'SEPULVEDA', '1896-01-08', 'CHILENA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_editorial`
--

CREATE TABLE `tbl_editorial` (
  `ID_EDITORIAL` varchar(15) NOT NULL,
  `NOM_EDITORIAL` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `E_MAIL` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_editorial`
--

INSERT INTO `tbl_editorial` (`ID_EDITORIAL`, `NOM_EDITORIAL`, `DIRECCION`, `TELEFONO`, `E_MAIL`) VALUES
('ED_001', 'ALFAGUARA', 'EDIFICIO HERMES 4, SEVILLA', '99542312', 'ALFAGUARA@GMAIL.COM'),
('ED_002', 'SANTILLANA', 'ANDRES BELLO 2209, SANTIAGO', '98745563', 'SANTILLANA@GMAIL.COM'),
('ED_003', 'PLANETA', 'BARROS ARANA 1524', '36568952', 'PLANETALIBROS@PLANET'),
('ED_004', 'PRENTICE HALL', 'WENTIS 1489 MIAMI', '888-232323', 'PRENTICEHALL@EDUCATI'),
('ED_005', 'MC GRAU HILL', 'CRAWFORD 2325, NEW YORK', '564-874522', 'MCGRAU@HILL.COM');

--
-- Disparadores `tbl_editorial`
--
DELIMITER $$
CREATE TRIGGER `insertar_editorial` AFTER INSERT ON `tbl_editorial` FOR EACH ROW begin
    insert into tbl_editorial (NOM_EDITORIAL) value ('perez');
    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_libro`
--

CREATE TABLE `tbl_libro` (
  `ID_LIBRO` varchar(10) NOT NULL,
  `NOM_LIBRO` varchar(20) DEFAULT NULL,
  `CATEGORIA` varchar(20) DEFAULT NULL,
  `PAGINAS` varchar(10) DEFAULT NULL,
  `FK_ID_EDITORIAL` varchar(15) DEFAULT NULL,
  `FK_ID_AUTOR` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_libro`
--

INSERT INTO `tbl_libro` (`ID_LIBRO`, `NOM_LIBRO`, `CATEGORIA`, `PAGINAS`, `FK_ID_EDITORIAL`, `FK_ID_AUTOR`) VALUES
('LB_001', 'CIELO, MAR Y TIERRA', 'POESIA', '120', 'ED_002', 'AU_111'),
('LB_002', 'CORONACION', 'NOVELA', '350', 'ED_004', 'AU_444'),
('LB_003', 'UNA HISTORIA CON DOS', 'INFANTIL', '200', 'ED_001', 'AU_333'),
('LB_004', 'LANCHAS EN LA BAHIA', 'CUENTO', '200', 'ED_005', 'AU_555'),
('LB_005', '20 POEMAS DE AMOR', 'SONETOS Y POESIA', '145', 'ED_003', 'AU_222');

--
-- Disparadores `tbl_libro`
--
DELIMITER $$
CREATE TRIGGER `actualizar_precio` BEFORE UPDATE ON `tbl_libro` FOR EACH ROW insert into nueva_categoria 
(antigua_categoria) values(old.categoria,new.categoria)
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `respaldo_insert`
--
ALTER TABLE `respaldo_insert`
  ADD PRIMARY KEY (`ID_EDITORIAL`);

--
-- Indices de la tabla `respaldo_update`
--
ALTER TABLE `respaldo_update`
  ADD PRIMARY KEY (`ID_LIBRO`),
  ADD KEY `FK_ID_EDITORIAL` (`FK_ID_EDITORIAL`),
  ADD KEY `FK_ID_AUTOR` (`FK_ID_AUTOR`);

--
-- Indices de la tabla `tbl_autor`
--
ALTER TABLE `tbl_autor`
  ADD PRIMARY KEY (`ID_AUTOR`);

--
-- Indices de la tabla `tbl_editorial`
--
ALTER TABLE `tbl_editorial`
  ADD PRIMARY KEY (`ID_EDITORIAL`);

--
-- Indices de la tabla `tbl_libro`
--
ALTER TABLE `tbl_libro`
  ADD PRIMARY KEY (`ID_LIBRO`),
  ADD KEY `FK_ID_EDITORIAL` (`FK_ID_EDITORIAL`),
  ADD KEY `FK_ID_AUTOR` (`FK_ID_AUTOR`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_libro`
--
ALTER TABLE `tbl_libro`
  ADD CONSTRAINT `tbl_libro_ibfk_1` FOREIGN KEY (`FK_ID_EDITORIAL`) REFERENCES `tbl_editorial` (`ID_EDITORIAL`),
  ADD CONSTRAINT `tbl_libro_ibfk_2` FOREIGN KEY (`FK_ID_AUTOR`) REFERENCES `tbl_autor` (`ID_AUTOR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
