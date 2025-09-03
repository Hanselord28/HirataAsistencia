-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2025 a las 00:54:52
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
(1, 1, '2025-08-25', '08:05:00', '17:00:00'),
(2, 2, '2025-08-25', '08:15:00', '17:10:00'),
(3, 3, '2025-08-25', '07:55:00', '16:45:00'),
(4, 4, '2025-08-25', '08:20:00', '17:05:00'),
(5, 5, '2025-08-25', '09:00:00', '18:00:00'),
(6, 6, '2025-09-02', '18:39:00', '18:39:22'),
(7, 7, '2025-09-02', '18:45:15', '18:45:40');

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
(1, 'Juan Perez', 'juan.perez@example.com', '12345', 'Empleado', '2025-08-27 14:01:40'),
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
  MODIFY `IdAsistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
