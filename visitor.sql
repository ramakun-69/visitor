-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2024 at 09:00 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `visitor`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `checkin_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkout_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backend_menus`
--

CREATE TABLE `backend_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_menus`
--

INSERT INTO `backend_menus` (`id`, `name`, `link`, `icon`, `status`, `parent_id`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'fas fa-laptop', 1, 0, 9000, NULL, NULL),
(2, 'Profil', 'profile', 'far fa-user', 1, 0, 8900, NULL, NULL),
(3, 'Divisi', 'departments', 'fas fa-building', 1, 0, 8800, NULL, NULL),
(4, 'Posisi', 'designations', 'fas fa-layer-group', 1, 0, 8700, NULL, NULL),
(6, 'Visitor', 'visitors', 'fas fa-walking', 1, 0, 8600, NULL, NULL),
(7, 'Visitor Belum Checkout', 'activeVisitors', 'fas fa-walking', 1, 0, 9100, NULL, NULL),
(8, 'Pre-register', 'pre-registers', 'fas fa-user-friends', 1, 0, 8600, NULL, NULL),
(9, 'Administrator', 'adminusers', 'fas fa-users', 1, 0, 8500, NULL, NULL),
(10, 'Tempat Kunjungan', 'visitPlace', 'fa fa-map', 1, 0, 8600, NULL, NULL),
(11, 'Laporan', 'report', 'fa fa-file', 1, 0, 8600, NULL, NULL),
(12, 'Role', 'role', 'fa fa-star', 1, 0, 2400, NULL, NULL),
(13, 'Karyawan', 'employees', 'fas fa-user-secret', 1, 0, 8600, NULL, NULL),
(14, 'Pengaturan', 'setting', 'fas fa-cogs', 1, 0, 2400, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `reg_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `is_pre_register` tinyint(1) NOT NULL,
  `is_group_enabled` tinyint UNSIGNED NOT NULL,
  `invitation_people_count` int NOT NULL DEFAULT '0',
  `accept_invitation_count` int NOT NULL DEFAULT '0',
  `attendee_count` int NOT NULL DEFAULT '0',
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Accounting', 5, NULL, NULL),
(2, 'IT', 5, NULL, NULL),
(3, 'HR', 5, NULL, NULL),
(4, 'GA', 5, NULL, NULL),
(5, 'PIPC', 5, NULL, NULL),
(6, 'Factory Manager', 5, NULL, NULL),
(7, 'Document Controlled', 5, NULL, NULL),
(8, 'Weaving', 5, NULL, NULL),
(9, 'Finishing', 5, NULL, NULL),
(10, 'Maintenance', 5, NULL, NULL),
(11, 'Utility', 5, NULL, NULL),
(12, 'BCI', 5, NULL, NULL),
(13, 'QARD', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Section Chief', 5, NULL, NULL),
(3, 'Sub Divisi Manager', 5, NULL, NULL),
(4, 'Manager', 5, NULL, NULL),
(5, 'Factory Manager', 5, NULL, NULL),
(6, 'Direktur', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint UNSIGNED NOT NULL,
  `official_identification_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_joining` date NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `department_id` bigint UNSIGNED NOT NULL,
  `designation_id` bigint UNSIGNED NOT NULL,
  `about` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint UNSIGNED NOT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `phone`, `nickname`, `display_name`, `gender`, `official_identification_number`, `date_of_joining`, `status`, `user_id`, `department_id`, `designation_id`, `about`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(4, 'Budiman', 'Aja', '081376933211', NULL, NULL, 5, NULL, '2024-07-03', 5, 8, 1, 2, 'test', 'App\\User', 7, 'App\\User', 7, '2024-07-26 15:16:58', '2024-07-26 15:16:58'),
(5, 'Fikri', 'Putra', '081376933212', NULL, NULL, 5, NULL, '2024-07-01', 5, 9, 1, 2, 's', 'App\\User', 7, 'App\\User', 7, '2024-07-26 15:18:56', '2024-07-26 15:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_id` bigint UNSIGNED NOT NULL,
  `visitor_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `checkin_at` datetime DEFAULT NULL,
  `checkout_at` datetime DEFAULT NULL,
  `iuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 2, 'user', '300x300', '300x300.jpg', 'image/jpeg', 'public', 21302, '[]', '[]', '[]', 1, '2021-07-23 06:08:30', '2021-07-23 06:08:30'),
(16, 'App\\User', 7, 'user', 'OIG1', 'OIG1.jpeg', 'image/jpeg', 'public', 225156, '[]', '[]', '[]', 7, '2024-07-26 14:30:22', '2024-07-26 14:30:22'),
(17, 'App\\User', 8, 'user', 'OIG1', 'OIG1.jpeg', 'image/jpeg', 'public', 225156, '[]', '[]', '[]', 8, '2024-07-26 15:17:07', '2024-07-26 15:17:07'),
(19, 'App\\User', 9, 'user', 'OIG1', 'OIG1.jpeg', 'image/jpeg', 'public', 225156, '[]', '[]', '[]', 9, '2024-07-26 15:29:36', '2024-07-26 15:29:36'),
(20, 'App\\Models\\VisitingDetails', 7, 'visitor', 'DIyvnH4yQb', 'DIyvnH4yQb.png', 'image/png', 'public', 44163, '[]', '[]', '[]', 10, '2024-07-26 15:30:59', '2024-07-26 15:30:59'),
(21, 'App\\Models\\VisitingDetails', 8, 'visitor', 'Ou2XJ5cO4O', 'Ou2XJ5cO4O.png', 'image/png', 'public', 42557, '[]', '[]', '[]', 11, '2024-07-26 16:14:54', '2024-07-26 16:14:54'),
(22, 'App\\User', 1, 'user', 'OIG1', 'OIG1.jpeg', 'image/jpeg', 'public', 225156, '[]', '[]', '[]', 12, '2024-07-26 16:29:09', '2024-07-26 16:29:09'),
(23, 'App\\Models\\VisitingDetails', 9, 'visitor', 'v2RkGQKYJT', 'v2RkGQKYJT.png', 'image/png', 'public', 42989, '[]', '[]', '[]', 13, '2024-08-02 07:05:27', '2024-08-02 07:05:27'),
(24, 'App\\Models\\VisitingDetails', 10, 'visitor', 'g8jEGWcOJ7', 'g8jEGWcOJ7.png', 'image/png', 'public', 43472, '[]', '[]', '[]', 14, '2024-08-02 07:31:01', '2024-08-02 07:31:01'),
(25, 'App\\Models\\VisitingDetails', 12, 'visitor', 'L4ZJfUuB7F', 'L4ZJfUuB7F.png', 'image/png', 'public', 36620, '[]', '[]', '[]', 15, '2024-08-02 19:53:49', '2024-08-02 19:53:49'),
(26, 'App\\Models\\VisitingDetails', 13, 'visitor', 'bzq6Cc9n60', 'bzq6Cc9n60.png', 'image/png', 'public', 42109, '[]', '[]', '[]', 16, '2024-08-02 19:54:13', '2024-08-02 19:54:13'),
(27, 'App\\Models\\VisitingDetails', 14, 'visitor', 'leaG4tVy16', 'leaG4tVy16.png', 'image/png', 'public', 41299, '[]', '[]', '[]', 17, '2024-08-02 20:53:01', '2024-08-02 20:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_25_043002_create_pre_registers_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_04_06_130203_create_designations_table', 1),
(6, '2020_04_06_130245_create_departments_table', 1),
(7, '2020_04_06_130356_create_employees_table', 1),
(8, '2020_04_06_130500_create_attendances_table', 1),
(9, '2020_04_06_130652_create_visitors_table', 1),
(10, '2020_04_06_130653_create_bookings_table', 1),
(11, '2020_04_06_130653_create_visiting_details_table', 1),
(12, '2020_04_06_130654_create_invitations_table', 1),
(13, '2020_04_16_063722_create_settings_table', 1),
(14, '2020_04_16_064701_create_media_table', 1),
(15, '2020_04_16_113855_create_jobs_table', 1),
(16, '2020_05_07_111209_create_notifications_table', 1),
(17, '2020_09_09_043116_create_permission_tables', 1),
(18, '2020_09_10_080029_create_backend_menus_table', 1),
(19, '2020_09_28_181710_alter_settings_table', 1),
(20, '2024_08_02_172822_create_visits_places_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(41, 'App\\User', 1),
(42, 'App\\User', 1),
(43, 'App\\User', 1),
(44, 'App\\User', 1),
(45, 'App\\User', 1),
(46, 'App\\User', 1),
(47, 'App\\User', 1),
(48, 'App\\User', 1),
(49, 'App\\User', 1),
(50, 'App\\User', 1),
(51, 'App\\User', 1),
(52, 'App\\User', 1),
(53, 'App\\User', 1),
(54, 'App\\User', 1),
(55, 'App\\User', 1),
(56, 'App\\User', 1),
(57, 'App\\User', 1),
(58, 'App\\User', 1),
(59, 'App\\User', 1),
(60, 'App\\User', 1),
(61, 'App\\User', 1),
(62, 'App\\User', 1),
(63, 'App\\User', 1),
(64, 'App\\User', 1),
(65, 'App\\User', 1),
(66, 'App\\User', 1),
(67, 'App\\User', 1),
(68, 'App\\User', 1),
(69, 'App\\User', 1),
(70, 'App\\User', 1),
(71, 'App\\User', 1),
(72, 'App\\User', 1),
(73, 'App\\User', 1),
(74, 'App\\User', 1),
(75, 'App\\User', 1),
(76, 'App\\User', 1),
(77, 'App\\User', 1),
(78, 'App\\User', 1),
(79, 'App\\User', 1),
(80, 'App\\User', 1),
(81, 'App\\User', 1),
(82, 'App\\User', 1),
(83, 'App\\User', 1),
(84, 'App\\User', 1),
(85, 'App\\User', 1),
(86, 'App\\User', 1),
(87, 'App\\User', 1),
(88, 'App\\User', 1),
(89, 'App\\User', 1),
(90, 'App\\User', 1),
(91, 'App\\User', 1),
(92, 'App\\User', 1),
(93, 'App\\User', 1),
(94, 'App\\User', 1),
(95, 'App\\User', 1),
(96, 'App\\User', 1),
(97, 'App\\User', 1),
(98, 'App\\User', 1),
(99, 'App\\User', 1),
(100, 'App\\User', 1),
(101, 'App\\User', 1),
(102, 'App\\User', 1),
(103, 'App\\User', 1),
(104, 'App\\User', 1),
(105, 'App\\User', 1),
(106, 'App\\User', 1),
(107, 'App\\User', 1),
(108, 'App\\User', 1),
(109, 'App\\User', 1),
(110, 'App\\User', 1),
(111, 'App\\User', 1),
(112, 'App\\User', 1),
(113, 'App\\User', 1),
(114, 'App\\User', 1),
(115, 'App\\User', 1),
(116, 'App\\User', 1),
(117, 'App\\User', 1),
(118, 'App\\User', 1),
(119, 'App\\User', 1),
(120, 'App\\User', 1),
(121, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(3, 'App\\User', 4),
(3, 'App\\User', 6),
(1, 'App\\User', 7),
(2, 'App\\User', 8),
(2, 'App\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01eb71f2-40d9-4c84-9ce8-67498f6c1d96', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 9, '[]', NULL, '2024-07-26 15:30:59', '2024-07-26 15:30:59'),
('060455f4-8e7d-40cf-9196-6e610295b644', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 3, '[]', NULL, '2023-11-28 03:47:22', '2023-11-28 03:47:22'),
('1336bb82-74cc-410f-bdc3-3498ea742e55', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 3, '[]', NULL, '2024-07-26 08:39:44', '2024-07-26 08:39:44'),
('24816a9c-8468-4773-8e1c-77d5b8684595', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 9, '[]', NULL, '2024-08-02 19:53:50', '2024-08-02 19:53:50'),
('2856352f-a21a-4866-90f7-bb211a09b2c8', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 9, '[]', NULL, '2024-08-02 20:53:03', '2024-08-02 20:53:03'),
('28867df4-f62f-40d7-83b8-6f81f14c8012', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 9, '[]', NULL, '2024-07-26 16:14:55', '2024-07-26 16:14:55'),
('4d2fd223-d8c5-4597-a232-2dcd52d55c22', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 3, '[]', NULL, '2021-10-29 06:28:45', '2021-10-29 06:28:45'),
('787fa1e3-ec90-420d-b7d8-c5ca063d3fcd', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 3, '[]', NULL, '2023-11-29 04:27:51', '2023-11-29 04:27:51'),
('79cfb923-5cd7-403c-beaa-a6145993539b', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 3, '[]', NULL, '2021-10-29 06:22:39', '2021-10-29 06:22:39'),
('7f3644c3-e407-4248-b681-95dfa92a89cf', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 3, '[]', NULL, '2023-11-29 04:40:04', '2023-11-29 04:40:04'),
('8c0fda27-e8af-4923-bd7c-c6ded662f74b', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 3, '[]', NULL, '2021-10-29 06:23:00', '2021-10-29 06:23:00'),
('a8ecc0ba-9f68-4375-9ab1-bd9feacd14b5', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 8, '[]', NULL, '2024-08-02 07:05:29', '2024-08-02 07:05:29'),
('bc0d1152-d5c4-487d-8cf1-1ae09e88ad00', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 9, '[]', NULL, '2024-08-02 19:54:13', '2024-08-02 19:54:13'),
('cba02955-dcd3-4233-a6de-47d001b8edd2', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 9, '[]', NULL, '2024-08-02 07:31:01', '2024-08-02 07:31:01'),
('d19ffce8-114b-4ff9-ac2e-93ebedd3e4bc', 'App\\Notifications\\SendInvitationToVisitors', 'App\\Models\\Visitor', 10, '[]', NULL, '2024-07-26 16:11:10', '2024-07-26 16:11:10'),
('e4ce58b4-426d-423a-b0b3-9df81cfd4a57', 'App\\Notifications\\SendVisitorToEmployee', 'App\\User', 9, '[]', NULL, '2024-07-26 15:31:24', '2024-07-26 15:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(41, 'dashboard', 'web', NULL, NULL),
(42, 'profile', 'web', NULL, NULL),
(43, 'designations', 'web', NULL, NULL),
(44, 'designations_create', 'web', NULL, NULL),
(45, 'designations_edit', 'web', NULL, NULL),
(46, 'designations_delete', 'web', NULL, NULL),
(47, 'designations_show', 'web', NULL, NULL),
(48, 'departments', 'web', NULL, NULL),
(49, 'departments_create', 'web', NULL, NULL),
(50, 'departments_edit', 'web', NULL, NULL),
(51, 'departments_delete', 'web', NULL, NULL),
(52, 'departments_show', 'web', NULL, NULL),
(53, 'employees', 'web', NULL, NULL),
(54, 'employees_create', 'web', NULL, NULL),
(55, 'employees_edit', 'web', NULL, NULL),
(56, 'employees_delete', 'web', NULL, NULL),
(57, 'employees_show', 'web', NULL, NULL),
(58, 'visitors', 'web', NULL, NULL),
(59, 'visitors_create', 'web', NULL, NULL),
(60, 'visitors_edit', 'web', NULL, NULL),
(61, 'visitors_delete', 'web', NULL, NULL),
(62, 'visitors_show', 'web', NULL, NULL),
(63, 'pre-registers', 'web', NULL, NULL),
(64, 'pre-registers_create', 'web', NULL, NULL),
(65, 'pre-registers_edit', 'web', NULL, NULL),
(66, 'pre-registers_delete', 'web', NULL, NULL),
(67, 'pre-registers_show', 'web', NULL, NULL),
(68, 'adminusers', 'web', NULL, NULL),
(69, 'adminusers_create', 'web', NULL, NULL),
(70, 'adminusers_edit', 'web', NULL, NULL),
(71, 'adminusers_delete', 'web', NULL, NULL),
(72, 'adminusers_show', 'web', NULL, NULL),
(73, 'role', 'web', NULL, NULL),
(74, 'role_create', 'web', NULL, NULL),
(75, 'role_edit', 'web', NULL, NULL),
(76, 'role_delete', 'web', NULL, NULL),
(77, 'role_show', 'web', NULL, NULL),
(78, 'setting', 'web', NULL, NULL),
(79, 'activeVisitors', 'web', NULL, NULL),
(80, 'visitPlace', 'web', NULL, NULL),
(81, 'dashboard', 'web', NULL, NULL),
(82, 'profile', 'web', NULL, NULL),
(83, 'designations', 'web', NULL, NULL),
(84, 'designations_create', 'web', NULL, NULL),
(85, 'designations_edit', 'web', NULL, NULL),
(86, 'designations_delete', 'web', NULL, NULL),
(87, 'designations_show', 'web', NULL, NULL),
(88, 'departments', 'web', NULL, NULL),
(89, 'departments_create', 'web', NULL, NULL),
(90, 'departments_edit', 'web', NULL, NULL),
(91, 'departments_delete', 'web', NULL, NULL),
(92, 'departments_show', 'web', NULL, NULL),
(93, 'employees', 'web', NULL, NULL),
(94, 'employees_create', 'web', NULL, NULL),
(95, 'employees_edit', 'web', NULL, NULL),
(96, 'employees_delete', 'web', NULL, NULL),
(97, 'employees_show', 'web', NULL, NULL),
(98, 'visitors', 'web', NULL, NULL),
(99, 'visitors_create', 'web', NULL, NULL),
(100, 'visitors_edit', 'web', NULL, NULL),
(101, 'visitors_delete', 'web', NULL, NULL),
(102, 'visitors_show', 'web', NULL, NULL),
(103, 'pre-registers', 'web', NULL, NULL),
(104, 'pre-registers_create', 'web', NULL, NULL),
(105, 'pre-registers_edit', 'web', NULL, NULL),
(106, 'pre-registers_delete', 'web', NULL, NULL),
(107, 'pre-registers_show', 'web', NULL, NULL),
(108, 'adminusers', 'web', NULL, NULL),
(109, 'adminusers_create', 'web', NULL, NULL),
(110, 'adminusers_edit', 'web', NULL, NULL),
(111, 'adminusers_delete', 'web', NULL, NULL),
(112, 'adminusers_show', 'web', NULL, NULL),
(113, 'role', 'web', NULL, NULL),
(114, 'role_create', 'web', NULL, NULL),
(115, 'role_edit', 'web', NULL, NULL),
(116, 'role_delete', 'web', NULL, NULL),
(117, 'role_show', 'web', NULL, NULL),
(118, 'setting', 'web', NULL, NULL),
(119, 'activeVisitors', 'web', NULL, NULL),
(120, 'visitsPlace', 'web', NULL, NULL),
(121, 'report', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_registers`
--

CREATE TABLE `pre_registers` (
  `id` int UNSIGNED NOT NULL,
  `expected_date` date NOT NULL,
  `expected_time` time NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `visitor_id` int UNSIGNED NOT NULL,
  `comment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint UNSIGNED NOT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_registers`
--

INSERT INTO `pre_registers` (`id`, `expected_date`, `expected_time`, `employee_id`, `visitor_id`, `comment`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(2, '2024-07-27', '23:15:00', 5, 13, 'mau jumpa aja', 'App\\User', 1, 'App\\User', 1, '2024-07-26 16:11:10', '2024-07-26 16:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2021-07-22 21:38:13', '2021-07-22 21:38:13'),
(2, 'Karyawan', 'web', '2021-07-22 21:38:13', '2021-07-23 06:49:18'),
(3, 'Resepsionis', 'web', '2021-07-22 21:38:13', '2021-07-23 06:49:33'),
(4, 'Admin', 'web', '2024-08-02 14:04:07', '2024-08-02 14:04:07'),
(5, 'Employee', 'web', '2024-08-02 14:04:07', '2024-08-02 14:04:07'),
(6, 'Reception', 'web', '2024-08-02 14:04:07', '2024-08-02 14:04:07');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(41, 2),
(42, 2),
(58, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(81, 2),
(82, 2),
(98, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(41, 3),
(42, 3),
(53, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(67, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(93, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(107, 3),
(119, 3),
(121, 3);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_name', 'Visitor Pass'),
(2, 'site_email', 'info@inilabs.xyz'),
(3, 'site_phone_number', '+8801777664206'),
(4, 'site_logo', 'site_logo.png'),
(5, 'site_footer', '@ All Rights Reserved'),
(6, 'site_address', 'Dhaka, Bangladesh.'),
(7, 'site_description', 'Visitor Pass management system.'),
(8, 'notify_templates', '<p>Hello Employee Someone wants meet you, his/her name is</p>'),
(9, 'notifications_email', '1'),
(10, 'invite_templates', 'Hello'),
(11, 'notifications_sms', '1'),
(12, 'sms_gateway', '1'),
(13, 'front_end_enable_disable', '1'),
(14, 'terms_condition', 'Terms condition'),
(15, 'welcome_screen', '<p>Welcome,please tap on button to check-in</p>'),
(20, 'twilio_disabled', '1'),
(27, 'mail_disabled', '1'),
(30, 'photo_capture_enable', '1'),
(31, 'visitor_agreement', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `email_verified_at`, `password`, `status`, `phone`, `address`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'LTG', 'admin@example.com', 'admin2', NULL, '$2y$10$ZiOFCYD6Z5pMIc5cY9Hnoer3qWQGh7PXuxuR9iXrUGQregg2XTLZW', 5, '+15005550006', 'Bekasi, Jawa Barat', NULL, 'QJ4DOy2PwFdU6hb6VxSk9N970cuELjtefaZbfQOLlGZgnWpLX3hXlbbgc0N8', '2021-07-22 21:38:21', '2021-07-23 07:02:35'),
(4, 'Nana', 'S', 'security_lpa@luckytex.com', 'admin@example.com', NULL, '$2y$10$3CtmPoXoRtpDt6gktoU9HOfLWZAnhG3VwmAnDN1nT7GbUleei091O', 5, '0836722828', 'Bekasi', NULL, NULL, '2021-07-23 06:58:03', '2021-07-23 06:58:03'),
(6, 'Natalia', 'Sukmalia', 'natalia@gmail.com', 'natalia', NULL, '$2y$10$FnbQLzcSiWWnFPOJQcsVGO5XCjihhAr8MjNiLeZVR/K10hU5o5lWO', 5, '0836722821', 'Bekasi', NULL, NULL, '2021-07-26 02:50:38', '2021-07-26 02:50:38'),
(7, 'sasa', 'sasa', 'zoelfree@gmail.com', 'admin', NULL, '$2y$10$IvbW3YVxQC/i1spk6vRlkOMYyeoxAnyVF5qoytGjDFFQNjBM.K7Y6', 5, '081376933215', NULL, NULL, NULL, '2024-07-26 14:30:22', '2024-07-26 15:29:18'),
(8, 'Budiman', 'Aja', 'email@email.com', 'email558335684', NULL, '$2y$10$x5FRXyG7FcUIejdl/XDEuuA0FU.VJt.sG3npK1xWaqVVB5IIulxZe', NULL, '081376933211', NULL, NULL, NULL, '2024-07-26 15:16:58', '2024-07-26 15:17:07'),
(9, 'Fikri', 'Putra', 'email2@email.com', 'email21295101175', NULL, '$2y$10$6Cj5TzhHQHFH3aF1BnZxLO7/cqIDMN9KHU1AsiGhLXeK6T2t6v7QO', NULL, '081376933212', NULL, NULL, NULL, '2024-07-26 15:18:56', '2024-07-26 15:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `visiting_details`
--

CREATE TABLE `visiting_details` (
  `id` bigint UNSIGNED NOT NULL,
  `reg_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_employee_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkin_at` datetime DEFAULT NULL,
  `checkout_at` datetime DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `visitor_id` bigint UNSIGNED NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint UNSIGNED NOT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visiting_details`
--

INSERT INTO `visiting_details` (`id`, `reg_no`, `purpose`, `company_name`, `company_employee_id`, `checkin_at`, `checkout_at`, `status`, `user_id`, `employee_id`, `visitor_id`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(7, '2607241', 'berkunjung', 'Angin Ribut', NULL, '2024-07-26 22:30:00', '2024-07-26 22:31:00', 5, 5, 5, 9, 'App\\User', 7, 'App\\User', 7, '2024-07-26 15:30:59', '2024-07-26 15:31:23'),
(8, '2607242', 'main aja', 'sasa', NULL, '2024-07-26 23:14:00', '2024-07-26 23:29:00', 5, 5, 5, 9, 'App\\User', 1, 'App\\User', 1, '2024-07-26 16:14:54', '2024-07-26 16:29:35'),
(9, '0208241', 'Magang', 'Erasites', NULL, '2024-08-02 14:05:00', '2024-08-02 14:45:00', 5, 4, 4, 13, 'App\\User', 1, 'App\\User', 1, '2024-08-02 07:05:27', '2024-08-02 07:45:24'),
(10, '123457', 'Mlang', 'Erasites', NULL, '2024-08-02 06:31:00', '2024-08-02 17:24:00', 5, 5, 5, 13, 'App\\User', 1, 'App\\User', 1, '2024-08-02 07:31:01', '2024-08-02 10:24:49'),
(12, '0308241', 'qwerty', 'Erasites', NULL, '2024-08-03 02:53:00', '2024-08-03 02:54:00', 5, 5, 5, 13, 'App\\User', 1, 'App\\User', 1, '2024-08-02 19:53:49', '2024-08-02 19:54:57'),
(13, '0308242', 'qwerty', 'Erasites', NULL, '2024-08-03 02:54:00', '2024-08-03 02:55:00', 5, 5, 5, 13, 'App\\User', 1, 'App\\User', 1, '2024-08-02 19:54:13', '2024-08-02 19:55:16'),
(14, '0308243', 'q', 'Erasites', NULL, '2024-08-03 03:53:00', NULL, 5, 5, 5, 13, 'App\\User', 1, 'App\\User', 1, '2024-08-02 20:53:01', '2024-08-02 20:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint UNSIGNED NOT NULL,
  `id_card` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint UNSIGNED NOT NULL,
  `pekerjaan` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_place` int NOT NULL,
  `address` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_identification_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pre_register` tinyint(1) NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint UNSIGNED NOT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `id_card`, `first_name`, `last_name`, `email`, `phone`, `gender`, `pekerjaan`, `id_type`, `transport_type`, `visit_place`, `address`, `national_identification_no`, `is_pre_register`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, '', 'Heri', 'Santoso', 'heri@gmail.com', '0836722828', 5, '', '', '', 0, 'Cikarang Pusat, Bekasi', '32338884949234', 0, 5, 'App\\User', 1, 'App\\User', 1, '2021-07-23 06:43:23', '2021-10-29 06:22:59'),
(4, '', 'Vanessa', 'Angel', 'vanessa@kasir.com', '083814305087', 5, '', '', '', 0, 'Telukjambe', '32338884949235', 0, 5, 'App\\User', 1, 'App\\User', 1, '2021-07-23 07:53:30', '2023-11-28 03:47:20'),
(5, '', 'Hafid', '.', 'hafid@gmail.com', '0215201858', 5, '', '', '', 0, 'Jakarta', NULL, 1, 5, 'App\\User', 1, 'App\\User', 1, '2021-07-26 02:42:47', '2021-07-26 02:42:47'),
(6, '', 'Bella', 'Tahnia', 'alquraisyi91@gmail.com', '+6283814305092', 5, '', '', '', 0, 'Jakarta', '12345678', 0, 5, 'App\\User', 1, 'App\\User', 1, '2023-11-29 04:27:47', '2023-11-29 04:39:42'),
(8, '', 'Ayu', 'Apriani', 'ayu@apriani.com', '083899223366', 10, '', '', '', 0, 'Jl. Perjuangan, RT.03/RW.06, Sukadanau, Kec. Cikarang Barat', '1234567890', 0, 5, 'App\\User', 1, 'App\\User', 1, '2024-07-26 08:39:21', '2024-07-26 08:39:21'),
(9, '', 'zoelham', 'sasa', 'zoelfree@gmail.com', '+628135475552', 5, '', '', '', 0, 'nuri', '120954654115454', 0, 5, 'App\\User', 7, 'App\\User', 7, '2024-07-26 15:30:59', '2024-07-26 16:14:54'),
(10, '', 'Izun', 'Nuzi', 'fafa@gmail.com', '08546542255555', 5, '', '', '', 0, 'jl. nuri', NULL, 1, 5, 'App\\User', 1, 'App\\User', 1, '2024-07-26 16:11:10', '2024-07-26 16:11:10'),
(13, '123457', 'Rama', 'Dhana', 'ramakun72@gmail.com', '+6282244812291', 5, 'Developer', 'Lainnya', 'Sedan', 2, 'Malang', '69696969', 0, 5, 'App\\User', 1, 'App\\User', 1, '2024-08-02 07:31:01', '2024-08-02 20:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `visits_places`
--

CREATE TABLE `visits_places` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visits_places`
--

INSERT INTO `visits_places` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Kantor', '5', '2024-08-02 14:19:46', '2024-08-02 14:19:46'),
(3, 'Kantor HRD', '5', '2024-08-02 14:19:57', '2024-08-02 14:19:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backend_menus`
--
ALTER TABLE `backend_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_reg_no_unique` (`reg_no`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `employees_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_registers`
--
ALTER TABLE `pre_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_registers_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `pre_registers_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `visiting_details`
--
ALTER TABLE `visiting_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visiting_details_reg_no_unique` (`reg_no`),
  ADD KEY `visiting_details_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `visiting_details_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitors_email_unique` (`email`),
  ADD UNIQUE KEY `visitors_phone_unique` (`phone`),
  ADD KEY `visitors_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `visitors_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `visits_places`
--
ALTER TABLE `visits_places`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backend_menus`
--
ALTER TABLE `backend_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `pre_registers`
--
ALTER TABLE `pre_registers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `visiting_details`
--
ALTER TABLE `visiting_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `visits_places`
--
ALTER TABLE `visits_places`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
