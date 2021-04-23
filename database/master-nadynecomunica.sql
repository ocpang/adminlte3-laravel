-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2021 at 04:47 PM
-- Server version: 10.1.40-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.29-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nadynecomunica`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(4, 'default', 'Look mum, I logged something', NULL, NULL, 'App\\User', 1, '[]', '2020-12-21 09:54:57', '2020-12-21 09:54:57'),
(5, 'default', 'Look mum, I logged something', NULL, NULL, 'App\\User', 1, '[]', '2020-12-21 10:13:41', '2020-12-21 10:13:41'),
(6, 'default', 'Look mum, I logged something', NULL, NULL, 'App\\User', 1, '[]', '2020-12-21 10:53:46', '2020-12-21 10:53:46'),
(7, 'default', 'Look mum, I logged something', NULL, NULL, 'App\\User', 1, '[]', '2020-12-21 10:59:41', '2020-12-21 10:59:41'),
(8, 'default', 'created', 'App\\Models\\Domain', '38da4d46-43c7-4c22-816a-ff8e769c107b', 'App\\User', 4, '[]', '2021-01-07 08:00:48', '2021-01-07 08:00:48'),
(9, 'default', 'created', 'App\\Models\\Server', '0870ba44-1eb8-4140-8ae3-058d02143fd1', 'App\\User', 4, '[]', '2021-01-07 08:01:17', '2021-01-07 08:01:17'),
(10, 'default', 'created', 'App\\Models\\Trunk', 'ca1f3142-1b53-48bd-81ad-ef23d04ab119', 'App\\User', 4, '[]', '2021-01-07 08:02:22', '2021-01-07 08:02:22'),
(11, 'default', 'edited', 'App\\Models\\Customer', '4d5c6b1c-efe9-43fa-b17d-539e311c0101', 'App\\User', 4, '[]', '2021-01-07 08:06:34', '2021-01-07 08:06:34'),
(12, 'default', 'created', 'App\\Models\\Outgoing', 'c76737ab-d8e9-4934-b398-5bcc7f94f60c', 'App\\User', 4, '[]', '2021-01-07 08:09:05', '2021-01-07 08:09:05'),
(13, 'default', 'created', 'App\\Models\\Outgoingrule', 'e9298b39-b39d-4fcb-880a-282d1d88626a', 'App\\User', 4, '[]', '2021-01-07 08:11:23', '2021-01-07 08:11:23'),
(14, 'default', 'edited', 'App\\Models\\Outgoingrule', 'e9298b39-b39d-4fcb-880a-282d1d88626a', 'App\\User', 4, '[]', '2021-01-07 08:15:11', '2021-01-07 08:15:11'),
(15, 'default', 'created', 'App\\Models\\Outgoingrule', '51d3e7a7-7262-4758-8968-bc46e0195baa', 'App\\User', 4, '[]', '2021-01-07 08:15:29', '2021-01-07 08:15:29'),
(16, 'default', 'deleted', 'App\\Models\\Outgoingrule', '51d3e7a7-7262-4758-8968-bc46e0195baa', 'App\\User', 4, '[]', '2021-01-07 08:17:55', '2021-01-07 08:17:55'),
(17, 'default', 'created', 'App\\Models\\Cos', '22e0347f-0391-4930-bb6a-997d401028dd', 'App\\User', 4, '[]', '2021-01-08 08:07:16', '2021-01-08 08:07:16'),
(18, 'default', 'edited', 'App\\Models\\Cos', '22e0347f-0391-4930-bb6a-997d401028dd', 'App\\User', 4, '[]', '2021-01-08 08:10:15', '2021-01-08 08:10:15'),
(19, 'default', 'created', 'App\\Models\\Cos', '701d179e-260e-465b-87cb-786b11ce41f9', 'App\\User', 4, '[]', '2021-01-08 08:11:58', '2021-01-08 08:11:58'),
(20, 'default', 'deleted', 'App\\Models\\Cos', '701d179e-260e-465b-87cb-786b11ce41f9', 'App\\User', 4, '[]', '2021-01-08 08:12:02', '2021-01-08 08:12:02'),
(21, 'default', 'edited', 'App\\Models\\Cos', '22e0347f-0391-4930-bb6a-997d401028dd', 'App\\User', 4, '[]', '2021-01-08 08:13:43', '2021-01-08 08:13:43'),
(22, 'default', 'edited', 'App\\Models\\Outgoing', 'c76737ab-d8e9-4934-b398-5bcc7f94f60c', 'App\\User', 4, '[]', '2021-01-08 09:36:47', '2021-01-08 09:36:47'),
(23, 'default', 'created', 'App\\Models\\Cosout', 'bf0603bf-3cb1-40f7-991d-f3e78e8af5d5', 'App\\User', 4, '[]', '2021-01-08 09:46:27', '2021-01-08 09:46:27'),
(24, 'default', 'edited', 'App\\Models\\Cosout', 'bf0603bf-3cb1-40f7-991d-f3e78e8af5d5', 'App\\User', 4, '[]', '2021-01-08 09:50:29', '2021-01-08 09:50:29'),
(25, 'default', 'edited', 'App\\Models\\Cosout', 'bf0603bf-3cb1-40f7-991d-f3e78e8af5d5', 'App\\User', 4, '[]', '2021-01-08 09:51:29', '2021-01-08 09:51:29'),
(26, 'default', 'created', 'App\\Models\\Cosout', 'a7b1c0ef-7f65-4d80-a569-7ecbf4789e1c', 'App\\User', 4, '[]', '2021-01-08 09:52:14', '2021-01-08 09:52:14'),
(27, 'default', 'deleted', 'App\\Models\\Cosout', 'a7b1c0ef-7f65-4d80-a569-7ecbf4789e1c', 'App\\User', 4, '[]', '2021-01-08 09:52:44', '2021-01-08 09:52:44'),
(28, 'default', 'created', 'App\\Models\\Cosout', '7e867aeb-5b65-4022-8bc2-068186c8dada', 'App\\User', 4, '[]', '2021-01-08 09:52:54', '2021-01-08 09:52:54'),
(30, 'default', 'created', 'App\\Models\\Customer', 'af2abfaf-b8d5-4c1e-81ac-b805e4a016d5', 'App\\User', 4, '[]', '2021-01-08 09:59:57', '2021-01-08 09:59:57'),
(31, 'default', 'edited', 'App\\Models\\Customer', 'af2abfaf-b8d5-4c1e-81ac-b805e4a016d5', 'App\\User', 4, '[]', '2021-01-08 10:00:59', '2021-01-08 10:00:59'),
(32, 'default', 'created', 'App\\User', '5', 'App\\User', 4, '[]', '2021-02-24 09:36:59', '2021-02-24 09:36:59'),
(33, 'default', 'edited', 'App\\User', '5', 'App\\User', 4, '[]', '2021-02-24 09:37:39', '2021-02-24 09:37:39'),
(34, 'default', 'deleted', 'App\\User', '5', 'App\\User', 4, '[]', '2021-02-24 09:43:20', '2021-02-24 09:43:20'),
(35, 'default', 'created', 'Spatie\\Permission\\Models\\Permission', '1', 'App\\User', 4, '[]', '2021-02-25 07:01:06', '2021-02-25 07:01:06'),
(36, 'default', 'created', 'Spatie\\Permission\\Models\\Permission', '2', 'App\\User', 4, '[]', '2021-02-25 08:57:28', '2021-02-25 08:57:28'),
(37, 'default', 'created', 'Spatie\\Permission\\Models\\Permission', '3', 'App\\User', 4, '[]', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(38, 'default', 'created', 'Spatie\\Permission\\Models\\Permission', '4', 'App\\User', 4, '[]', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(39, 'default', 'created', 'Spatie\\Permission\\Models\\Permission', '5', 'App\\User', 4, '[]', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(40, 'default', 'created', 'App\\User', '6', 'App\\User', 4, '[]', '2021-03-05 02:33:57', '2021-03-05 02:33:57'),
(41, 'default', 'created', 'App\\User', '7', 'App\\User', 4, '[]', '2021-03-05 02:34:41', '2021-03-05 02:34:41'),
(42, 'default', 'edited', 'App\\User', '6', 'App\\User', 4, '[]', '2021-03-05 02:35:46', '2021-03-05 02:35:46'),
(43, 'default', 'edited', 'App\\User', '7', 'App\\User', 4, '[]', '2021-03-05 02:36:08', '2021-03-05 02:36:08'),
(44, 'default', 'edited', 'App\\User', '7', 'App\\User', 4, '[]', '2021-03-05 02:36:15', '2021-03-05 02:36:15'),
(45, 'default', 'edited', 'App\\User', '7', 'App\\User', 4, '[]', '2021-03-05 02:36:22', '2021-03-05 02:36:22'),
(46, 'default', 'created', 'App\\User', '8', 'App\\User', 4, '[]', '2021-03-18 07:08:17', '2021-03-18 07:08:17'),
(47, 'default', 'edited', 'App\\User', '8', 'App\\User', 4, '[]', '2021-03-18 07:15:56', '2021-03-18 07:15:56'),
(48, 'default', 'created', 'App\\User', '9', 'App\\User', 4, '[]', '2021-04-23 07:18:30', '2021-04-23 07:18:30'),
(49, 'default', 'edited', 'App\\User', '7', 'App\\User', 4, '[]', '2021-04-23 07:18:41', '2021-04-23 07:18:41'),
(50, 'default', 'edited', 'App\\User', '7', 'App\\User', 4, '[]', '2021-04-23 07:18:48', '2021-04-23 07:18:48'),
(51, 'default', 'deleted', 'App\\User', '9', 'App\\User', 4, '[]', '2021-04-23 07:46:24', '2021-04-23 07:46:24'),
(52, 'default', 'created', 'App\\Models\\Customer', '55709b73-5a2f-4766-a75f-62729013f97e', 'App\\User', 4, '[]', '2021-04-23 09:01:35', '2021-04-23 09:01:35'),
(53, 'default', 'edited', 'App\\Models\\Customer', '55709b73-5a2f-4766-a75f-62729013f97e', 'App\\User', 4, '[]', '2021-04-23 09:01:55', '2021-04-23 09:01:55'),
(54, 'default', 'deleted', 'App\\Models\\Customer', '55709b73-5a2f-4766-a75f-62729013f97e', 'App\\User', 4, '[]', '2021-04-23 09:02:06', '2021-04-23 09:02:06'),
(55, 'default', 'edited', 'App\\Models\\Customer', '55709b73-5a2f-4766-a75f-62729013f97e', 'App\\User', 4, '[]', '2021-04-23 09:20:49', '2021-04-23 09:20:49'),
(56, 'default', 'edited', 'App\\User', '8', 'App\\User', 4, '[]', '2021-04-23 09:20:57', '2021-04-23 09:20:57'),
(57, 'default', 'edited', 'App\\Models\\Customer', '55709b73-5a2f-4766-a75f-62729013f97e', 'App\\User', 4, '[]', '2021-04-23 09:43:42', '2021-04-23 09:43:42'),
(58, 'default', 'edited', 'App\\User', '8', 'App\\User', 4, '[]', '2021-04-23 09:43:47', '2021-04-23 09:43:47'),
(59, 'default', 'edited', 'App\\User', '8', 'App\\User', 4, '[]', '2021-04-23 09:45:56', '2021-04-23 09:45:56'),
(60, 'default', 'edited', 'App\\User', '8', 'App\\User', 4, '[]', '2021-04-23 09:46:52', '2021-04-23 09:46:52'),
(61, 'default', 'edited', 'App\\Models\\Customer', '55709b73-5a2f-4766-a75f-62729013f97e', 'App\\User', 4, '[]', '2021-04-23 09:46:58', '2021-04-23 09:46:58'),
(62, 'default', 'deleted', 'App\\Models\\Customer', '55709b73-5a2f-4766-a75f-62729013f97e', 'App\\User', 4, '[]', '2021-04-23 09:47:35', '2021-04-23 09:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `user_created` int(10) UNSIGNED DEFAULT '0',
  `user_updated` int(10) UNSIGNED DEFAULT '0',
  `user_deleted` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `label`, `status`, `user_created`, `user_updated`, `user_deleted`, `created_at`, `updated_at`, `deleted_at`) VALUES
('4d5c6b1c-efe9-43fa-b17d-539e311c0101', 'nadynecs', 'Nadyne CS', 1, 4, 4, 0, '2021-04-23 08:45:15', '2021-01-07 08:06:34', NULL),
('55709b73-5a2f-4766-a75f-62729013f97e', 'Honda', 'PT Astra Honda Motor Indonesia', 0, 4, 4, 4, '2021-04-23 09:01:35', '2021-04-23 09:47:35', '2021-04-23 09:47:35'),
('af2abfaf-b8d5-4c1e-81ac-b805e4a016d5', 'brahmayasatest', 'Brahmayasa Test', 0, 4, 4, 0, '2021-04-23 08:59:57', '2021-01-08 10:00:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_21_090422_create_permission_tables', 2),
(5, '2020_12_21_094118_create_activity_log_table', 3),
(6, '2020_12_22_161541_add_column_to_users_table', 4),
(7, '2020_12_28_135444_create_customers_table', 5),
(8, '2021_02_24_162434_add_column_customer_id_to_users_table', 21),
(9, '2021_03_18_112806_add_column_role_id_to_users_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 2),
(1, 'App\\User', 4),
(2, 'App\\User', 5),
(2, 'App\\User', 7),
(2, 'App\\User', 9),
(3, 'App\\User', 3),
(4, 'App\\User', 6),
(4, 'App\\User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'read home', 'web', '2021-02-25 07:01:06', '2021-02-25 07:01:06'),
(2, 'read user', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(3, 'create user', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(4, 'update user', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(5, 'delete user', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(6, 'read permission', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(7, 'create permission', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(8, 'update permission', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(9, 'delete permission', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(10, 'read role', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(11, 'create role', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(12, 'update role', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(13, 'delete role', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(14, 'read trunk', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(15, 'create trunk', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(16, 'update trunk', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(17, 'delete trunk', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(18, 'read domain', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(19, 'create domain', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(20, 'update domain', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(21, 'delete domain', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(22, 'read server', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(23, 'create server', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(24, 'update server', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(25, 'delete server', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(26, 'read moh', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(27, 'create moh', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(28, 'update moh', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(29, 'delete moh', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(30, 'read customer', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(31, 'create customer', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(32, 'update customer', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(33, 'delete customer', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(34, 'read autoattendant', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(35, 'create autoattendant', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(36, 'update autoattendant', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(37, 'delete autoattendant', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(38, 'read callgroup', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(39, 'create callgroup', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(40, 'update callgroup', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(41, 'delete callgroup', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(42, 'read timecall', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(43, 'create timecall', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(44, 'update timecall', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(45, 'delete timecall', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(46, 'read timegroup', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(47, 'create timegroup', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(48, 'update timegroup', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(49, 'delete timegroup', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(50, 'read incoming', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(51, 'create incoming', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(52, 'update incoming', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(53, 'delete incoming', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(54, 'read sipuser', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(55, 'create sipuser', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(56, 'update sipuser', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(57, 'delete sipuser', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(58, 'read cos', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(59, 'create cos', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(60, 'update cos', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(61, 'delete cos', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(62, 'read outgoing', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(63, 'create outgoing', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(64, 'update outgoing', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(65, 'delete outgoing', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(66, 'read conference', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(67, 'create conference', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(68, 'update conference', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(69, 'delete conference', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(70, 'read cidnum', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(71, 'create cidnum', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(72, 'update cidnum', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(73, 'delete cidnum', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(74, 'read pstnnum', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(75, 'create pstnnum', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(76, 'update pstnnum', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(77, 'delete pstnnum', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(78, 'read rbt', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(79, 'create rbt', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(80, 'update rbt', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(81, 'delete rbt', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(82, 'read recordingfile', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(83, 'create recordingfile', 'web', '2021-02-24 18:58:25', '2021-02-24 18:58:25'),
(84, 'update recordingfile', 'web', '2021-02-24 18:58:35', '2021-02-24 18:58:35'),
(85, 'delete recordingfile', 'web', '2021-02-24 18:58:42', '2021-02-24 18:58:42'),
(86, 'read blacklist', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(87, 'create blacklist', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(88, 'update blacklist', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(89, 'delete blacklist', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42'),
(90, 'read calldata', 'web', '2021-02-25 07:01:06', '2021-02-25 08:57:27'),
(91, 'read pstnnum customer', 'web', '2021-02-24 18:57:27', '2021-02-24 18:57:27'),
(92, 'read ivrreport', 'web', '2021-02-25 07:01:06', '2021-02-25 08:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2020-12-21 09:18:43', NULL),
(2, 'customer', 'web', '2020-12-21 09:18:43', NULL),
(3, 'operational', 'web', '2020-12-21 09:18:43', NULL),
(4, 'reseller', 'web', '2020-12-21 09:18:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(92, 1),
(92, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_token` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) DEFAULT '1',
  `user_created` int(10) UNSIGNED DEFAULT '0',
  `user_updated` int(10) UNSIGNED DEFAULT '0',
  `user_deleted` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `customer_id`, `role_id`, `email_verified_at`, `password`, `remember_token`, `email_token`, `status`, `user_created`, `user_updated`, `user_deleted`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrator', 'admin@admin.com', NULL, 1, NULL, '$2y$10$wJjkOP.JNgHUiPr4I6pNPe5JzVY4Sii9xidjxYgqTygZu/56NNQUC', NULL, '2efe140b', 1, 0, 0, 0, '2021-04-23 02:57:57', '2021-04-23 09:42:40', NULL),
(2, 'Octavian', 'octavian.ocpang@gmail.com', NULL, 1, NULL, '$2y$10$dpTfs7BusD0/2E8PSqpV.uSzwgEk17w7Kh9iXXr60Hm8/BozGXR3.', NULL, NULL, 1, 1, 1, 4, '2021-04-23 03:20:13', '2021-04-23 04:17:57', '2021-04-23 04:17:57'),
(3, 'Ops Nadyne', 'test@nadyne.com', NULL, 3, NULL, '$2y$10$MpPbcKrqp9eJIltm/uHhq.dKBe74edj8UjVaizdg9QM4omKgG5kum', NULL, NULL, 1, 1, 0, 0, '2021-04-23 03:23:43', '2021-04-23 10:47:43', NULL),
(4, 'Octavian Panggestu', 'octavian91011@gmail.com', NULL, 1, NULL, '$2y$10$iNwddB0YCiuu8Qfj51jS9O91BZv9qL7pDNLy.Q1NCN7vW2lfVBiYe', NULL, 'e880cb14', 1, 1, 4, 0, '2021-04-23 03:28:35', '2021-04-23 07:51:24', NULL),
(5, 'Cust Nadyne', 'octa@nadyne.com', 'af2abfaf-b8d5-4c1e-81ac-b805e4a016d5', 2, NULL, '$2y$10$bYHUpC44B9A6kLikwB4IieSJzzGGkufsXm/SfGwA/HwKYLmhCIV9.', NULL, '42e51e0d', 1, 3, 4, 4, '2021-04-23 03:36:59', '2021-04-23 09:00:37', NULL),
(6, 'Reseller Brahmayasa', 'octa@brahmayasa.com', NULL, 4, NULL, '$2y$10$U1vLdvTWIqMZJ7uP/os5W.1yTo0CgX6njbi/HgDqj9gy8LPj0N83i', NULL, NULL, 1, 3, 4, 0, '2021-04-23 04:33:57', '2021-04-23 02:35:46', NULL),
(7, 'Customer Brahmayasa', 'admin@brahmayasa.com', 'af2abfaf-b8d5-4c1e-81ac-b805e4a016d5', 2, NULL, '$2y$10$ouSL37H2D2GszpASINn7AuBTH0irx1jGAnz1QmbJsJiJ0Bp8mhXde', NULL, 'bae96c00', 1, 6, 4, 0, '2021-04-23 04:34:40', '2021-04-23 07:18:48', NULL),
(8, 'Res Mitrakom', 'admin@mitrakom.com', NULL, 4, NULL, '$2y$10$9PgrbPr5kyUO/6fuIQk3UebNr5boSz/ZFcLdtq3gjEjzdqqdnFE2m', NULL, NULL, 1, 4, 4, 0, '2021-04-23 07:08:17', '2021-04-23 07:15:56', NULL),
(9, 'Honda', 'honda@gmail.com', '4d5c6b1c-efe9-43fa-b17d-539e311c0101', 2, NULL, '$2y$10$DNpO9665uneiKoCP04FIEehsPZ8QcJ/4TCNxseK3TZYcTf4fe/o0i', NULL, NULL, 1, 4, 0, 4, '2021-04-23 07:18:30', '2021-04-23 07:46:24', '2021-04-23 07:46:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
