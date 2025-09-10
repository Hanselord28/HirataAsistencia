-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2025 a las 16:51:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `controlasistencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `IdAsistencia` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `HoraEntrada` time DEFAULT NULL,
  `HoraSalida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`IdAsistencia`, `IdUsuario`, `Fecha`, `HoraEntrada`, `HoraSalida`) VALUES
(9, 2, '2025-09-09', '09:30:00', '17:30:00'),
(10, 3, '2025-09-09', '09:30:00', '17:30:00'),
(11, 4, '2025-09-06', '09:30:00', '17:30:00'),
(12, 5, '2025-09-05', '09:30:00', '17:30:00'),
(13, 6, '2025-09-04', '09:30:00', '17:30:00'),
(14, 7, '2025-09-09', '09:45:00', '17:30:00'),
(15, 8, '2025-09-06', '10:00:00', '17:30:00'),
(16, 2, '2025-09-05', '09:50:00', '17:30:00'),
(17, 3, '2025-09-04', '10:10:00', '17:30:00'),
(18, 4, '2025-09-03', '09:40:00', '17:30:00'),
(19, 5, '2025-09-09', NULL, NULL),
(20, 6, '2025-09-06', NULL, NULL),
(21, 7, '2025-09-05', NULL, NULL),
(22, 8, '2025-09-04', NULL, NULL),
(23, 2, '2025-09-03', NULL, NULL),
(29, 2, '2025-09-08', '09:30:00', '17:00:00'),
(30, 3, '2025-09-08', '09:25:00', '17:10:00'),
(31, 4, '2025-09-09', '09:40:00', '17:20:00'),
(32, 5, '2025-09-10', '09:35:00', '17:00:00'),
(33, 6, '2025-09-10', '09:30:00', '17:15:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `NombreCompleto` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Rol` varchar(20) DEFAULT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `NombreCompleto`, `Correo`, `Contrasena`, `Rol`, `FechaCreacion`) VALUES
(2, 'Maria Gonzalez', 'maria.gonzalez@example.com', 'abc123', 'Empleado', '2025-08-27 14:01:40'),
(3, 'Carlos Lopez', 'carlos.lopez@example.com', 'qwerty', 'Administrador', '2025-08-27 14:01:40'),
(4, 'Ana Torres', 'ana.torres@example.com', 'password', 'Empleado', '2025-08-27 14:01:40'),
(5, 'Luis Ramirez', 'luis.ramirez@example.com', 'admin2025', 'Administrador', '2025-08-27 14:01:40'),
(6, 'feña', 'correo@correo', '123', 'Empleado	', '2025-08-31 04:00:00'),
(7, 'hansel', 'correo2@correo', '1234', 'Empleado	', '2025-08-31 04:00:00'),
(8, 'lolololol', 'correo3@correo3', '12345', 'Administrador', '2025-08-31 04:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`IdAsistencia`),
  ADD UNIQUE KEY `IdUsuario` (`IdUsuario`,`Fecha`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `IdAsistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
