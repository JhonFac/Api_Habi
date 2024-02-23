-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 3.138.156.32:3309
-- Tiempo de generación: 22-02-2024 a las 21:14:04
-- Versión del servidor: 5.7.12
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `habi_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add property', 7, 'add_property'),
(26, 'Can change property', 7, 'change_property'),
(27, 'Can delete property', 7, 'delete_property'),
(28, 'Can view property', 7, 'view_property'),
(29, 'Can add status', 8, 'add_status'),
(30, 'Can change status', 8, 'change_status'),
(31, 'Can delete status', 8, 'delete_status'),
(32, 'Can view status', 8, 'view_status'),
(33, 'Can add status history', 9, 'add_statushistory'),
(34, 'Can change status history', 9, 'change_statushistory'),
(35, 'Can delete status history', 9, 'delete_statushistory'),
(36, 'Can view status history', 9, 'view_statushistory');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'testpass123', NULL, 0, 'test_user', '\'\'', '\'\'', 'test_user@email.com', 0, 1, '2021-08-01 15:24:12.000000'),
(2, 'testpass123', NULL, 0, 'elon', '', '', 'elon.musk@email.com', 0, 0, '0000-00-00 00:00:00.000000'),
(11, 'testpass123', NULL, 0, 'me', '', '', 'me@email.com', 0, 0, '0000-00-00 00:00:00.000000'),
(12, 'pwd1234', NULL, 1, 'naranguren', 'Nicolás', 'Aranguren', 'nat@email.com', 1, 1, '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'api', 'property'),
(8, 'api', 'status'),
(9, 'api', 'statushistory'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-07-30 07:13:42.966210'),
(2, 'auth', '0001_initial', '2021-07-30 07:13:46.386125'),
(3, 'admin', '0001_initial', '2021-07-30 07:13:49.836164'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-07-30 07:13:50.387339'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-30 07:13:50.582373'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-07-30 07:13:51.346838'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-07-30 07:13:51.667861'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-07-30 07:13:51.990383'),
(9, 'auth', '0004_alter_user_username_opts', '2021-07-30 07:13:52.188146'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-07-30 07:13:52.531115'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-07-30 07:13:52.712202'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-07-30 07:13:52.908746'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-07-30 07:13:53.286122'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-07-30 07:13:53.608794'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-07-30 07:13:53.997461'),
(16, 'auth', '0011_update_proxy_permissions', '2021-07-30 07:13:54.449130'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-07-30 07:13:54.813149'),
(18, 'sessions', '0001_initial', '2022-08-11 16:30:28.606276'),
(19, 'real_estate', '0001_initial', '2022-08-11 16:42:48.229718'),
(20, 'api', '0001_initial', '2022-08-25 19:03:35.771174');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `address` varchar(120) NOT NULL,
  `city` varchar(32) NOT NULL,
  `price` bigint(20) NOT NULL,
  `description` text,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `property`
--

INSERT INTO `property` (`id`, `address`, `city`, `price`, `description`, `year`) VALUES
(1, 'calle 23 #45-67', 'bogota', 120000000, 'Hermoso apartamento en el centro de la ciudad', 2000),
(2, 'carrera 100 #15-90', 'bogota', 350000000, 'Amplio apartamento en conjunto cerrado', 2011),
(3, 'diagonal 23 #28-21', 'bogota', 270000000, 'Apartamento con hermosas vistas', 2018),
(4, 'calle 23 #45-67', 'medellin', 210000000, '', 2002),
(5, 'carrera 100 #15-90', 'medellin', 325000000, 'Amplio apartamento en conjunto cerrado', 2011),
(6, 'diagonal 23 #28-21', 'medellin', 270000000, '', NULL),
(7, 'carrera 100 #15-90', 'barranquilla', 35000000, NULL, 2015),
(8, 'carrera 22 #34-96', 'manizales', 39483059, NULL, 1800),
(9, '', '', 0, NULL, NULL),
(10, 'calle 95 # 78 - 49', 'bogota', 120000000, 'hermoso acabado, listo para estrenar', 2020),
(11, 'calle 18 k 43 - 12', 'cali', 125000000, NULL, NULL),
(12, 'Cll 1A #11B-20', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2016),
(16, 'Cll 1A #11B-20', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2019),
(17, 'Malabar entrada 2', 'pereira', 350000000, 'Casa campestre con hermosos paisajes', 2021),
(18, 'Maracay casa 24', 'pereira', 450000000, 'Casa campestre con sala de lujo tecnologica', 2020),
(19, 'Entrada 3 via cerritos', 'pereira', 250000000, 'Full casa amoblada', 2020),
(20, 'Entrada 2 via cerritos', 'pereira', 270000000, 'Casa campestre con lago', 2021),
(21, 'M1 C5 Panorama', 'dosquebradas', 290000000, 'Casa con entrada al centro comercial', 2017),
(22, 'Bloque 5 C26 Umbras', 'belen de umbria', 120000000, 'Casa con entrada al centro comercial', 2000),
(53, 'calle 23 #45-67q', 'bogota', 120000000, 'Hermoso apartamento en el centro de la ciudad', 2000),
(54, 'carrera 100 #15-90w', 'bogota', 350000000, 'Amplio apartamento en conjunto cerrado', 2011),
(55, 'diagonal 23 #28-21e', 'bogota', 270000000, 'Apartamento con hermosas vistas', 2018),
(56, 'calle 23 #45-67r', 'medellin', 210000000, '', 2002),
(57, 'carrera 100 #15-90e', 'medellin', 325000000, 'Amplio apartamento en conjunto cerrado', 2011),
(58, 'diagonal 23 #28-21s', 'medellin', 270000000, '', NULL),
(59, 'carrera 100 #15-90x', 'barranquilla', 35000000, NULL, 2015),
(60, 'carrera 22 #34-96v', 'manizales', 39483059, NULL, 1800),
(61, '', '', 0, NULL, NULL),
(62, '', '', 0, NULL, NULL),
(63, '', '', 0, NULL, NULL),
(64, '', '', 0, NULL, NULL),
(65, '', '', 0, NULL, NULL),
(66, '', '', 0, NULL, NULL),
(67, 'calle 95 # 78 - 123', 'bogota', 120000000, 'hermoso acabado, listo para estrenar', 2020),
(68, 'calle 18 k 43 - 12e', 'cali', 125000000, NULL, NULL),
(69, 'Cll 1A #11B-20v', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2016),
(70, 'Cll 1A #11B-20b', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2019),
(71, 'Malabar entrada 2v', 'pereira', 350000000, 'Casa campestre con hermosos paisajes', 2021),
(72, 'Maracay casa 24c', 'pereira', 450000000, 'Casa campestre con sala de lujo tecnologica', 2020),
(73, 'Entrada 4 via cerritos', 'pereira', 250000000, 'Full casa amoblada', 2020),
(74, 'Entrada 5 via cerritos', 'pereira', 270000000, 'Casa campestre con lago', 2021),
(75, 'M8 C6 Panorama', 'dosquebradas', 290000000, 'Casa con entrada al centro comercial', 2017),
(76, 'Bloque 5 C67 Umbras', 'belen de umbria', 120000000, 'Casa con entrada al centro comercial', 2000),
(77, 'Cll 1A #11B-123', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2016),
(78, 'Cll 1A #11B-234', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2019),
(79, 'Malabar entrada 345', 'pereira', 350000000, 'Casa campestre con hermosos paisajes', 2021),
(80, 'Maracay casa 567c', 'pereira', 450000000, 'Casa campestre con sala de lujo tecnologica', 2020),
(81, 'Entrada 8 via cerritos', 'pereira', 250000000, 'Full casa amoblada', 2020),
(82, 'Entrada 9 via cerritos', 'pereira', 270000000, 'Casa campestre con lago', 2021),
(83, 'M8 C634 Panorama', 'dosquebradas', 290000000, 'Casa con entrada al centro comercial', 2017),
(84, 'Bloque 53 C674 Umbras', 'belen de umbria', 120000000, 'Casa con entrada al centro comercial', 2000),
(85, 'calle 18 k 43', 'cali', 125000000, NULL, NULL),
(86, 'Cll 1A #11B', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2020),
(87, 'Cll 1A #20b', 'pereira', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2020),
(88, 'Malabar 2v', 'pereira', 350000000, 'Casa campestre con hermosos paisajes', 2020),
(89, 'casa 24c', 'pereira', 450000000, 'Casa campestre con sala de lujo tecnologica', 2020),
(90, 'via cerritos', 'pereira', 250000000, 'Full casa amoblada', 2020),
(91, '5 via cerritos', 'pereira', 270000000, 'Casa campestre con lago', 2020),
(92, 'C6 Panorama', 'dosquebradas', 290000000, 'Casa con entrada al centro comercial', 2020),
(93, 'C67 Umbras', 'belen de umbria', 120000000, 'Casa con entrada al centro comercial', 2020),
(94, 'Cll 1A #11B', 'bucaramanga', 300000000, 'hermoso acabado, listo para estrenar super comodo', 2021),
(95, 'Cra 11 A No 18 E 11', 'la virginia', 90000000, 'Hermosa casa con 3 piezas', 2022),
(96, 'calle 23 #45-67', 'bogota', 120000000, 'Hermoso apartamento en el centro de la ciudad', 2000),
(97, 'Av. Verde', 'Cartagena', 1000000, 'Casa de James Bond', 2015);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `name`, `label`) VALUES
(1, 'comprando', 'Imueble en proceso de compra'),
(2, 'comprado', 'Inmueble en propiedad de Habi'),
(3, 'pre_venta', 'Inmueble publicado en preventa'),
(4, 'en_venta', 'Inmueble publicado en venta'),
(5, 'vendido', 'Inmueble vendido'),
(6, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_history`
--

CREATE TABLE `status_history` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `status_history`
--

INSERT INTO `status_history` (`id`, `property_id`, `status_id`, `update_date`) VALUES
(1, 1, 1, '2021-04-10 22:23:56'),
(2, 1, 2, '2021-04-11 22:23:56'),
(3, 1, 3, '2021-04-12 22:23:56'),
(4, 2, 1, '2021-04-09 22:23:56'),
(5, 2, 2, '2021-04-10 22:23:56'),
(6, 2, 3, '2021-04-11 22:23:56'),
(7, 2, 4, '2021-04-12 22:23:56'),
(8, 3, 1, '2021-04-12 22:26:25'),
(9, 3, 2, '2021-04-12 22:26:34'),
(10, 3, 3, '2021-04-12 22:26:54'),
(11, 3, 4, '2021-04-12 22:27:06'),
(12, 3, 5, '2021-04-12 22:27:20'),
(13, 4, 1, '2021-04-10 22:23:56'),
(14, 4, 2, '2021-04-11 22:23:56'),
(15, 4, 3, '2021-04-12 22:23:56'),
(16, 5, 1, '2021-04-09 22:23:56'),
(17, 5, 2, '2021-04-10 22:23:56'),
(18, 5, 3, '2021-04-11 22:23:56'),
(19, 5, 4, '2021-04-12 22:23:56'),
(20, 6, 1, '2021-04-12 22:26:25'),
(21, 6, 2, '2021-04-12 22:26:34'),
(22, 6, 3, '2021-04-12 22:26:54'),
(23, 6, 4, '2021-04-12 22:27:06'),
(24, 6, 5, '2021-04-12 22:27:20'),
(25, 7, 3, '2021-07-01 15:07:46'),
(26, 6, 2, '2021-08-28 22:55:38'),
(27, 10, 3, '2021-09-19 22:23:56'),
(28, 11, 1, '2021-09-24 18:00:01'),
(29, 16, 5, '2021-11-12 22:02:17'),
(30, 17, 4, '2021-11-12 22:04:16'),
(31, 18, 4, '2021-11-12 22:07:04'),
(32, 19, 3, '2021-11-12 22:08:59'),
(33, 20, 3, '2021-11-13 21:14:10'),
(34, 21, 3, '2021-11-13 21:26:51'),
(35, 22, 3, '2021-11-15 10:26:50'),
(36, 53, 3, '2021-04-10 22:23:56'),
(37, 53, 3, '2021-04-10 10:23:56'),
(38, 53, 3, '2021-04-10 10:23:56'),
(39, 54, 3, '2021-04-10 11:23:56'),
(40, 54, 3, '2021-04-10 11:23:56'),
(41, 54, 3, '2021-04-10 11:23:56'),
(42, 55, 4, '2021-04-10 12:24:56'),
(43, 56, 3, '2021-04-10 13:24:56'),
(44, 57, 4, '2021-04-10 14:25:56'),
(45, 58, 3, '2021-04-10 15:26:56'),
(46, 59, 5, '2021-04-10 16:34:56'),
(47, 60, 3, '2021-04-10 17:23:56'),
(48, 61, 3, '2021-04-10 18:23:56'),
(49, 63, 3, '2021-04-10 20:23:56'),
(50, 64, 5, '2021-04-10 21:12:56'),
(51, 65, 3, '2021-04-10 22:23:56'),
(52, 66, 5, '2021-04-10 23:23:56'),
(53, 67, 3, '2021-04-10 22:23:56'),
(54, 68, 3, '2021-04-10 09:23:56'),
(55, 69, 3, '2021-04-10 10:23:56'),
(56, 70, 5, '2021-04-10 11:23:56'),
(57, 71, 3, '2021-04-10 12:23:56'),
(58, 72, 3, '2021-04-10 13:23:56'),
(59, 73, 3, '2021-04-10 08:23:56'),
(60, 74, 3, '2021-04-10 07:23:56'),
(61, 75, 3, '2021-04-10 06:23:56'),
(62, 76, 3, '2021-04-10 05:23:56'),
(63, 77, 5, '2021-04-10 04:23:56'),
(64, 78, 3, '2021-04-10 03:23:56'),
(65, 79, 5, '2021-04-10 05:23:56'),
(66, 80, 3, '2021-04-10 02:23:56'),
(67, 81, 4, '2021-04-10 01:23:56'),
(68, 82, 3, '2021-04-10 22:23:56'),
(69, 83, 5, '2021-04-10 22:23:56'),
(70, 84, 3, '2021-04-10 22:23:56'),
(71, 85, 3, '2021-04-10 20:23:56'),
(72, 86, 5, '2021-04-10 21:12:56'),
(73, 87, 3, '2021-04-10 22:23:56'),
(74, 88, 5, '2021-04-10 23:23:56'),
(75, 89, 3, '2021-04-10 22:23:56'),
(76, 90, 3, '2021-04-10 09:23:56'),
(77, 91, 3, '2021-04-10 10:23:56'),
(78, 92, 5, '2021-04-10 11:23:56'),
(79, 93, 3, '2021-04-10 12:23:56'),
(80, 94, 4, '2021-04-10 14:25:56'),
(81, 95, 3, '2022-07-29 10:04:09'),
(82, 1, 1, '2022-08-11 21:54:07'),
(83, 1, 1, '2022-08-11 21:54:36'),
(84, 1, 1, '2022-08-11 21:55:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `property_id_uindex` (`id`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_historial_name_uindex` (`name`),
  ADD UNIQUE KEY `status_historial_id_uindex` (`id`);

--
-- Indices de la tabla `status_history`
--
ALTER TABLE `status_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_historial_id_uindex` (`id`),
  ADD KEY `status_historial_property_id_fk` (`property_id`),
  ADD KEY `status_historial_status_id_fk` (`status_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `status_history`
--
ALTER TABLE `status_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `status_history`
--
ALTER TABLE `status_history`
  ADD CONSTRAINT `status_historial_property_id_fk` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  ADD CONSTRAINT `status_historial_status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
