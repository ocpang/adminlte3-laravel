-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2022 at 03:03 PM
-- Server version: 10.1.40-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.29-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_admin`
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
(1, 'default', 'deleted', 'App\\Models\\Customer', '4d5c6b1c-efe9-43fa-b17d-539e311c0101', 'App\\User', 1, '[]', '2022-02-15 07:58:20', '2022-02-15 07:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `districts` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `customers` (`id`, `name`, `pic_name`, `phone`, `email`, `address`, `sub_district`, `districts`, `city`, `status`, `user_created`, `user_updated`, `user_deleted`, `created_at`, `updated_at`, `deleted_at`) VALUES
('4d5c6b1c-efe9-43fa-b17d-539e311c0101', 'PT Nadyne Media Tama', 'Octavian Panggestu', '02123456789', 'admin@nadyne.com', 'Jalan Benda 92 Kemang', 'Cilandak Timur', 'Cilandak', 'Jakarta Selatan', 1, 4, 4, 1, '2021-04-23 08:45:15', '2022-02-15 07:58:20', '2022-02-15 07:58:20'),
('75faa5ab-87bd-4f38-a3d7-0fe215f64062', 'Mitracomm Ekasarana', 'Ahmad', '021111111111', 'voice-mcm@email.com', 'Jalan Raya Jakarta', 'Cilandak Timur', 'Cilandak', 'Jakarta Selatan', 0, 4, 4, 0, '2021-04-26 03:46:20', '2021-04-26 03:49:35', NULL),
('af2abfaf-b8d5-4c1e-81ac-b805e4a016d5', 'PT Brahmayasa Abadi', 'Octavian Panggestu', '02123456789', 'admin@brahmayasa.com', 'Jalan Benda 92 Kemang', 'Cilandak Timur', 'Cilandak', 'Jakarta Selatan', 0, 4, 4, 0, '2021-04-23 08:59:57', '2021-04-26 03:53:46', NULL),
('daa3736c-0d9d-4953-8d71-20f7d008656c', 'Test INFOBIP', 'Surya', '021236125711', 'test@infobip.test', 'Jalan Sudirman', 'Sudirman Utara', 'Sudirman', 'Jakarta Pusat', 0, 4, 0, 0, '2021-04-26 03:50:15', '2021-04-26 03:50:15', NULL);

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
(8, '2021_02_24_162434_add_column_customer_id_to_users_table', 6),
(9, '2021_03_18_112806_add_column_role_id_to_users_table', 7),
(10, '2021_04_26_100600_add_column_to_customers_table', 8);

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
(14, 'read customer', 'web', '2021-02-25 08:57:27', '2021-02-25 08:57:27'),
(15, 'create customer', 'web', '2021-02-25 08:58:25', '2021-02-25 08:58:25'),
(16, 'update customer', 'web', '2021-02-25 08:58:35', '2021-02-25 08:58:35'),
(17, 'delete customer', 'web', '2021-02-25 08:58:42', '2021-02-25 08:58:42');

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
(2, 3),
(3, 1),
(3, 3),
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
(14, 3),
(14, 4),
(15, 1),
(15, 3),
(15, 4),
(16, 1),
(16, 3),
(16, 4),
(17, 1),
(17, 3),
(17, 4);

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
(5, 'Customer Nadyne', 'octa@nadyne.com', '4d5c6b1c-efe9-43fa-b17d-539e311c0101', 2, NULL, '$2y$10$bYHUpC44B9A6kLikwB4IieSJzzGGkufsXm/SfGwA/HwKYLmhCIV9.', NULL, '42e51e0d', 1, 3, 4, 4, '2021-04-23 03:36:59', '2021-04-26 04:02:10', NULL),
(6, 'Reseller Brahmayasa', 'octa@brahmayasa.com', NULL, 4, NULL, '$2y$10$U1vLdvTWIqMZJ7uP/os5W.1yTo0CgX6njbi/HgDqj9gy8LPj0N83i', NULL, NULL, 1, 3, 4, 0, '2021-04-23 04:33:57', '2021-04-23 02:35:46', NULL),
(7, 'Customer Brahmayasa', 'admin@brahmayasa.com', 'af2abfaf-b8d5-4c1e-81ac-b805e4a016d5', 2, NULL, '$2y$10$ouSL37H2D2GszpASINn7AuBTH0irx1jGAnz1QmbJsJiJ0Bp8mhXde', NULL, 'bae96c00', 1, 6, 4, 0, '2021-04-23 04:34:40', '2021-04-23 07:18:48', NULL),
(8, 'Res Laravel', 'admin@laravel.com', NULL, 4, NULL, '$2y$10$9PgrbPr5kyUO/6fuIQk3UebNr5boSz/ZFcLdtq3gjEjzdqqdnFE2m', NULL, NULL, 1, 4, 4, 0, '2021-04-23 07:08:17', '2021-04-23 07:15:56', NULL),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
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
