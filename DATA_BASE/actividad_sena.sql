-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 00:28:49
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `actividad_sena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Cod_Cliente` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_empleado`
--

CREATE TABLE `cliente_empleado` (
  `id_Cliente_Empleado` int(11) NOT NULL,
  `Cod_Empleado` int(11) NOT NULL,
  `Cod_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `Cod_Detalle` int(11) NOT NULL,
  `Cod_Factura` int(11) NOT NULL,
  `Cantidad` decimal(10,0) NOT NULL,
  `Valor` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dtl_factura_producto`
--

CREATE TABLE `dtl_factura_producto` (
  `id_Dtl_Factura_Producto` int(11) NOT NULL,
  `Cod_Detalle` int(11) NOT NULL,
  `Cod_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Cod_Empleado` int(11) NOT NULL,
  `Salario` decimal(10,0) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_grupo`
--

CREATE TABLE `empleado_grupo` (
  `id_Empleado_Grupo` int(11) NOT NULL,
  `Cod_Empleado` int(11) NOT NULL,
  `Cod_Grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `Cod_Factura` int(11) NOT NULL,
  `Tipo` varchar(255) NOT NULL,
  `Fecha` date NOT NULL,
  `Valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cliente`
--

CREATE TABLE `factura_cliente` (
  `id_Factura_Cliente` int(11) NOT NULL,
  `Cod_Factura` int(11) NOT NULL,
  `Cod_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `Cod_Grupo` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `Cod_Material` int(11) NOT NULL,
  `Tipo_Material` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Cod_Referencia` int(11) NOT NULL,
  `Marca` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_material`
--

CREATE TABLE `producto_material` (
  `id_Producto_Material` int(11) NOT NULL,
  `Cod_Referencia` int(11) NOT NULL,
  `Cod_Material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_unidad`
--

CREATE TABLE `producto_unidad` (
  `Cod_Producto` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Cod_Proveedor` int(11) NOT NULL,
  `Razon_Social` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_producto`
--

CREATE TABLE `proveedor_producto` (
  `id_Proveedor_Producto` int(11) NOT NULL,
  `Cod_Proveedor` int(11) NOT NULL,
  `Cod_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cod_Cliente`);

--
-- Indices de la tabla `cliente_empleado`
--
ALTER TABLE `cliente_empleado`
  ADD PRIMARY KEY (`id_Cliente_Empleado`),
  ADD KEY `Cod_Empleado` (`Cod_Empleado`),
  ADD KEY `Cod_Cliente` (`Cod_Cliente`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`Cod_Detalle`),
  ADD KEY `Cod_Factura` (`Cod_Factura`);

--
-- Indices de la tabla `dtl_factura_producto`
--
ALTER TABLE `dtl_factura_producto`
  ADD PRIMARY KEY (`id_Dtl_Factura_Producto`),
  ADD KEY `Cod_Detalle` (`Cod_Detalle`),
  ADD KEY `Cod_Producto` (`Cod_Producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Cod_Empleado`);

--
-- Indices de la tabla `empleado_grupo`
--
ALTER TABLE `empleado_grupo`
  ADD PRIMARY KEY (`id_Empleado_Grupo`),
  ADD KEY `Cod_Empleado` (`Cod_Empleado`),
  ADD KEY `Cod_Grupo` (`Cod_Grupo`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`Cod_Factura`);

--
-- Indices de la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  ADD PRIMARY KEY (`id_Factura_Cliente`),
  ADD KEY `Cod_Factura` (`Cod_Factura`),
  ADD KEY `Cod_Cliente` (`Cod_Cliente`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`Cod_Grupo`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`Cod_Material`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Cod_Referencia`);

--
-- Indices de la tabla `producto_material`
--
ALTER TABLE `producto_material`
  ADD PRIMARY KEY (`id_Producto_Material`),
  ADD KEY `Cod_Referencia` (`Cod_Referencia`),
  ADD KEY `Cod_Material` (`Cod_Material`);

--
-- Indices de la tabla `producto_unidad`
--
ALTER TABLE `producto_unidad`
  ADD PRIMARY KEY (`Cod_Producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Cod_Proveedor`);

--
-- Indices de la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD PRIMARY KEY (`id_Proveedor_Producto`),
  ADD KEY `Cod_Proveedor` (`Cod_Proveedor`),
  ADD KEY `Cod_Producto` (`Cod_Producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Cod_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente_empleado`
--
ALTER TABLE `cliente_empleado`
  MODIFY `id_Cliente_Empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `Cod_Detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dtl_factura_producto`
--
ALTER TABLE `dtl_factura_producto`
  MODIFY `id_Dtl_Factura_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `Cod_Empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado_grupo`
--
ALTER TABLE `empleado_grupo`
  MODIFY `id_Empleado_Grupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `Cod_Factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  MODIFY `id_Factura_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `Cod_Grupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `Cod_Material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Cod_Referencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_material`
--
ALTER TABLE `producto_material`
  MODIFY `id_Producto_Material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_unidad`
--
ALTER TABLE `producto_unidad`
  MODIFY `Cod_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Cod_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  MODIFY `id_Proveedor_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_empleado`
--
ALTER TABLE `cliente_empleado`
  ADD CONSTRAINT `cliente_empleado_ibfk_1` FOREIGN KEY (`Cod_Empleado`) REFERENCES `empleado` (`Cod_Empleado`),
  ADD CONSTRAINT `cliente_empleado_ibfk_2` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`Cod_Cliente`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`Cod_Factura`) REFERENCES `facturas` (`Cod_Factura`);

--
-- Filtros para la tabla `dtl_factura_producto`
--
ALTER TABLE `dtl_factura_producto`
  ADD CONSTRAINT `dtl_factura_producto_ibfk_1` FOREIGN KEY (`Cod_Detalle`) REFERENCES `detalle_factura` (`Cod_Detalle`),
  ADD CONSTRAINT `dtl_factura_producto_ibfk_2` FOREIGN KEY (`Cod_Producto`) REFERENCES `producto_unidad` (`Cod_Producto`);

--
-- Filtros para la tabla `empleado_grupo`
--
ALTER TABLE `empleado_grupo`
  ADD CONSTRAINT `empleado_grupo_ibfk_1` FOREIGN KEY (`Cod_Empleado`) REFERENCES `empleado` (`Cod_Empleado`),
  ADD CONSTRAINT `empleado_grupo_ibfk_2` FOREIGN KEY (`Cod_Grupo`) REFERENCES `grupo` (`Cod_Grupo`);

--
-- Filtros para la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  ADD CONSTRAINT `factura_cliente_ibfk_1` FOREIGN KEY (`Cod_Factura`) REFERENCES `facturas` (`Cod_Factura`),
  ADD CONSTRAINT `factura_cliente_ibfk_2` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`Cod_Cliente`);

--
-- Filtros para la tabla `producto_material`
--
ALTER TABLE `producto_material`
  ADD CONSTRAINT `producto_material_ibfk_1` FOREIGN KEY (`Cod_Referencia`) REFERENCES `productos` (`Cod_Referencia`),
  ADD CONSTRAINT `producto_material_ibfk_2` FOREIGN KEY (`Cod_Material`) REFERENCES `material` (`Cod_Material`);

--
-- Filtros para la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD CONSTRAINT `proveedor_producto_ibfk_1` FOREIGN KEY (`Cod_Proveedor`) REFERENCES `proveedor` (`Cod_Proveedor`),
  ADD CONSTRAINT `proveedor_producto_ibfk_2` FOREIGN KEY (`Cod_Producto`) REFERENCES `producto_unidad` (`Cod_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
