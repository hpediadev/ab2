-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Mar 2022 pada 01.51
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cms_sekolahku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `semester`, `current_semester`, `admission_semester`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2020-2021', 'odd', 'true', 'true', '2021-11-25 07:36:38', '2022-03-02 23:37:44', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint(20) DEFAULT 0,
  `achievement_level` smallint(6) NOT NULL DEFAULT 0,
  `achievement_year` year(4) NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_phases`
--

CREATE TABLE `admission_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admission_phases`
--

INSERT INTO `admission_phases` (`id`, `academic_year_id`, `phase_name`, `phase_start_date`, `phase_end_date`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 'gelombang 1', '2021-01-01', '2021-03-01', '2021-11-25 07:37:51', '2021-11-25 00:37:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 'gelombang 2', '2021-03-01', '2021-05-01', '2021-11-25 07:38:32', '2021-11-25 00:38:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 'gelombang 3', '2021-05-02', '2021-07-20', '2021-11-25 07:39:47', '2021-11-25 00:39:47', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_quotas`
--

CREATE TABLE `admission_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admission_quotas`
--

INSERT INTO `admission_quotas` (`id`, `academic_year_id`, `admission_type_id`, `major_id`, `quota`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 170, 1, 20, '2021-11-25 07:42:09', '2021-11-25 00:42:09', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 170, 2, 20, '2021-11-25 07:42:35', '2021-11-25 00:42:35', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 171, 1, 15, '2021-11-25 07:42:53', '2021-11-25 00:42:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 1, 171, 2, 15, '2021-11-25 07:43:08', '2021-11-25 00:43:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 1, 172, 1, 50, '2021-11-25 07:44:25', '2021-11-25 00:44:25', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 1, 172, 2, 50, '2021-11-25 07:44:40', '2021-11-25 00:44:40', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `albums`
--

INSERT INTO `albums` (`id`, `album_title`, `album_description`, `album_slug`, `album_cover`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'LATIHAN DRUMBAND', '', 'latihan-drumband', '145e646828ae9697b2b8fb599c6fa2b1.jpg', '2022-02-28 19:20:45', '2022-02-28 12:24:05', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'HALAMAN SEKOLAH', '', 'halaman-sekolah', '9ed096890e6ead43ebdc964307664bfd.jpg', '2022-02-28 19:24:54', '2022-02-28 12:25:42', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'BELAJAR DI ALAM', '', 'belajar-di-alam', '7cd7612873ae476a9c922107c64c453a.jpg', '2022-02-28 19:27:44', '2022-02-28 12:28:29', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT 0,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', 'post', '2021-03-24 06:57:48', '2021-03-23 23:57:48', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Uncategorized', 'uncategorized', 'Uncategorized', 'file', '2021-03-24 06:57:48', '2021-03-23 23:57:48', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `class_groups`
--

INSERT INTO `class_groups` (`id`, `class_group`, `sub_class_group`, `major_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'X', '', 1, '2021-11-24 07:56:49', '2022-03-01 12:45:11', '2022-03-01 19:45:11', NULL, 1, 1, 1, 0, 'true'),
(2, 'XI', '', 1, '2021-11-24 07:57:20', '2022-03-01 12:45:11', '2022-03-01 19:45:11', NULL, 1, 1, 1, 0, 'true'),
(3, 'XII RPL 1', '', 1, '2021-11-24 07:58:15', '2022-03-01 12:45:11', '2022-03-01 19:45:11', NULL, 1, 1, 1, 0, 'true'),
(4, 'XII RPL 2', '', 1, '2021-11-24 07:58:58', '2022-03-01 12:45:11', '2022-03-01 19:45:11', NULL, 1, 1, 1, 0, 'true'),
(5, 'X', '', 2, '2021-11-24 07:59:16', '2022-03-01 12:45:11', '2022-03-01 19:45:11', NULL, 1, 0, 1, 0, 'true'),
(6, 'XI', '', 2, '2021-11-24 07:59:33', '2022-03-01 12:45:11', '2022-03-01 19:45:11', NULL, 1, 0, 1, 0, 'true'),
(7, 'XII', '', 2, '2021-11-24 07:59:43', '2022-03-01 12:45:11', '2022-03-01 19:45:11', NULL, 1, 0, 1, 0, 'true'),
(8, 'A1', '', 0, '2022-03-01 19:45:37', '2022-03-01 12:45:37', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 'A2', '', 0, '2022-03-01 19:45:47', '2022-03-01 12:45:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 'B1', '', 0, '2022-03-01 19:46:00', '2022-03-01 12:46:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 'B2', '', 0, '2022-03-01 19:46:08', '2022-03-01 12:46:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 'B3', '', 0, '2022-03-01 19:46:17', '2022-03-01 12:46:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 'B4', '', 0, '2022-03-01 19:46:26', '2022-03-01 12:46:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 'B5', '', 0, '2022-03-01 19:46:36', '2022-03-01 12:46:36', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'FK dari academic_years',
  `class_group_id` bigint(20) DEFAULT 0 COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint(20) DEFAULT 0 COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `class_group_settings`
--

INSERT INTO `class_group_settings` (`id`, `academic_year_id`, `class_group_id`, `employee_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 8, 6, '2022-03-02 09:52:23', '2022-03-02 02:52:23', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 9, 16, '2022-03-03 07:29:18', '2022-03-03 00:29:18', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 10, 9, '2022-03-03 07:48:14', '2022-03-03 00:48:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 1, 11, 5, '2022-03-03 08:09:51', '2022-03-03 01:09:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 1, 12, 11, '2022-03-03 08:35:32', '2022-03-03 01:35:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 1, 13, 7, '2022-03-03 08:55:42', '2022-03-03 01:55:42', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 1, 14, 15, '2022-03-03 09:11:19', '2022-03-03 02:11:19', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_students`
--

CREATE TABLE `class_group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group_setting_id` bigint(20) DEFAULT 0,
  `student_id` bigint(20) DEFAULT 0,
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `class_group_students`
--

INSERT INTO `class_group_students` (`id`, `class_group_setting_id`, `student_id`, `is_class_manager`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(27, 1, 1, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 1, 2, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 1, 3, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 1, 4, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 1, 5, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 1, 6, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 1, 7, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 1, 8, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 1, 9, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 1, 10, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 1, 11, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 1, 12, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 1, 13, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 1, 14, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 1, 15, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(42, 1, 16, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(43, 1, 17, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(44, 1, 18, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(45, 1, 19, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(46, 1, 20, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(47, 1, 21, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(48, 1, 22, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(49, 1, 23, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(50, 1, 24, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(51, 1, 25, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(52, 1, 26, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(53, 1, 27, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(54, 1, 28, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(55, 1, 29, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(56, 1, 30, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(57, 1, 31, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(58, 1, 32, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(59, 1, 33, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(60, 1, 34, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(61, 1, 35, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(62, 1, 36, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(63, 1, 37, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(64, 1, 38, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(65, 1, 39, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(66, 1, 40, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(67, 1, 41, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(68, 1, 42, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(69, 1, 43, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(70, 1, 44, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(71, 1, 45, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(72, 1, 46, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(73, 1, 47, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(74, 1, 48, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(75, 1, 49, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(76, 1, 50, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(77, 1, 51, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(78, 1, 52, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(79, 1, 53, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(80, 1, 54, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(81, 1, 55, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(82, 1, 56, 'false', '2022-03-03 07:11:22', '2022-03-03 00:11:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(83, 2, 57, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(84, 2, 58, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(85, 2, 59, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(86, 2, 60, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(87, 2, 61, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(88, 2, 62, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(89, 2, 63, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(90, 2, 64, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(91, 2, 65, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(92, 2, 66, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(93, 2, 67, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(94, 2, 68, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(95, 2, 69, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(96, 2, 70, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(97, 2, 71, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(98, 2, 72, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(99, 2, 73, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(100, 2, 74, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(101, 2, 75, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(102, 2, 76, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(103, 2, 77, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(104, 2, 78, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(105, 2, 79, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(106, 2, 80, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(107, 2, 81, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(108, 2, 82, 'false', '2022-03-03 07:29:38', '2022-03-03 00:29:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(109, 3, 83, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(110, 3, 84, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(111, 3, 85, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(112, 3, 86, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(113, 3, 87, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(114, 3, 88, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(115, 3, 89, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(116, 3, 90, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(117, 3, 91, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(118, 3, 92, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(119, 3, 93, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(120, 3, 94, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(121, 3, 95, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(122, 3, 96, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(123, 3, 97, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(124, 3, 98, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(125, 3, 99, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(126, 3, 100, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(127, 3, 101, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(128, 3, 102, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(129, 3, 103, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(130, 3, 104, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(131, 3, 105, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(132, 3, 106, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(133, 3, 107, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(134, 3, 108, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(135, 3, 109, 'false', '2022-03-03 07:48:31', '2022-03-03 00:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(136, 4, 110, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(137, 4, 111, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(138, 4, 112, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(139, 4, 113, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(140, 4, 114, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(141, 4, 115, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(142, 4, 116, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(143, 4, 117, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(144, 4, 118, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(145, 4, 119, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(146, 4, 120, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(147, 4, 121, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(148, 4, 122, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(149, 4, 123, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(150, 4, 124, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(151, 4, 125, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(152, 4, 126, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(153, 4, 127, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(154, 4, 128, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(155, 4, 129, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(156, 4, 130, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(157, 4, 131, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(158, 4, 132, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(159, 4, 133, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(160, 4, 134, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(161, 4, 135, 'false', '2022-03-03 08:10:29', '2022-03-03 01:10:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(162, 5, 136, 'false', '2022-03-03 08:35:47', '2022-03-03 01:35:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(163, 5, 137, 'false', '2022-03-03 08:35:47', '2022-03-03 01:35:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(164, 5, 138, 'false', '2022-03-03 08:35:47', '2022-03-03 01:35:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(165, 5, 139, 'false', '2022-03-03 08:35:47', '2022-03-03 01:35:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(166, 5, 140, 'false', '2022-03-03 08:35:47', '2022-03-03 01:35:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(167, 5, 141, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(168, 5, 142, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(169, 5, 143, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(170, 5, 144, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(171, 5, 145, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(172, 5, 146, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(173, 5, 147, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(174, 5, 148, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(175, 5, 149, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(176, 5, 150, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(177, 5, 151, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(178, 5, 152, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(179, 5, 153, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(180, 5, 154, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(181, 5, 155, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(182, 5, 156, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(183, 5, 157, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(184, 5, 158, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(185, 5, 159, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(186, 5, 160, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(187, 5, 161, 'false', '2022-03-03 08:35:48', '2022-03-03 01:35:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(188, 6, 162, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(189, 6, 163, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(190, 6, 164, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(191, 6, 165, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(192, 6, 166, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(193, 6, 167, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(194, 6, 168, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(195, 6, 169, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(196, 6, 170, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(197, 6, 171, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(198, 6, 172, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(199, 6, 173, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(200, 6, 174, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(201, 6, 175, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(202, 6, 176, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(203, 6, 177, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(204, 6, 178, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(205, 6, 179, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(206, 6, 180, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(207, 6, 181, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(208, 6, 182, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(209, 6, 183, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(210, 6, 184, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(211, 6, 185, 'false', '2022-03-03 08:55:57', '2022-03-03 01:55:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(212, 7, 186, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(213, 7, 187, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(214, 7, 188, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(215, 7, 189, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(216, 7, 190, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(217, 7, 191, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(218, 7, 192, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(219, 7, 193, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(220, 7, 194, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(221, 7, 195, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(222, 7, 196, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(223, 7, 197, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(224, 7, 198, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(225, 7, 199, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(226, 7, 200, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(227, 7, 201, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(228, 7, 202, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(229, 7, 203, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(230, 7, 204, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(231, 7, 205, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(232, 7, 206, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(233, 7, 207, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(234, 7, 208, 'false', '2022-03-03 09:11:38', '2022-03-03 02:11:38', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) DEFAULT 0,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text DEFAULT NULL,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint(20) DEFAULT 0,
  `marriage_status_id` bigint(20) DEFAULT 0,
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint(20) DEFAULT 0 COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint(20) DEFAULT 0 COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT 0 COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint(20) DEFAULT 0 COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint(20) DEFAULT 0 COMMENT 'Pangkat/Golongan',
  `salary_source_id` bigint(20) DEFAULT 0 COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah?',
  `laboratory_skill_id` bigint(20) DEFAULT 0 COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`id`, `assignment_letter_number`, `assignment_letter_date`, `assignment_start_date`, `parent_school_status`, `full_name`, `gender`, `nik`, `birth_place`, `birth_date`, `mother_name`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `religion_id`, `marriage_status_id`, `spouse_name`, `spouse_employment_id`, `citizenship`, `country`, `npwp`, `employment_status_id`, `nip`, `niy`, `nuptk`, `employment_type_id`, `decree_appointment`, `appointment_start_date`, `institution_lifter_id`, `decree_cpns`, `pns_start_date`, `rank_id`, `salary_source_id`, `headmaster_license`, `laboratory_skill_id`, `special_need_id`, `braille_skills`, `sign_language_skills`, `phone`, `mobile_phone`, `email`, `photo`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, NULL, NULL, NULL, 'true', 'BAITUR RAHMAN', 'M', '3528102805930002', 'PAMEKASAN', '1993-05-28', NULL, 'Waru Barat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528102805930002@smkpbwaru.sch.id', NULL, '2021-11-24 09:15:05', '2022-02-28 12:05:08', '2022-02-28 19:05:08', NULL, 1, 0, 1, 0, 'true'),
(2, NULL, NULL, NULL, 'true', 'MOH BA\'IN', 'M', '3528102805830003', 'PAMEKASAN', '1983-07-14', NULL, 'Waru Barat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528102805830003@smkpbwaru.sch.id', NULL, '2021-11-24 09:15:05', '2022-02-28 12:05:08', '2022-02-28 19:05:08', NULL, 1, 0, 1, 0, 'true'),
(3, NULL, NULL, NULL, 'true', 'PUSADI', 'M', '3528102805880006', 'PAMEKASAN', '1988-05-29', NULL, 'Waru Barat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528102805880006@smkpbwaru.sch.id', NULL, '2021-11-24 09:15:05', '2022-02-28 12:05:08', '2022-02-28 19:05:08', NULL, 1, 0, 1, 0, 'true'),
(4, NULL, NULL, NULL, 'true', 'ABD AZIS SETIAWAN', 'M', '3528102805900002', 'PAMEKASAN', '0000-00-00', NULL, 'Waru Barat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528102805900002@smkpbwaru.sch.id', NULL, '2021-11-24 09:15:05', '2022-02-28 12:05:08', '2022-02-28 19:05:08', NULL, 1, 0, 1, 0, 'true'),
(5, NULL, NULL, NULL, 'true', 'ALFIYAH', 'F', '3528105607870003', 'PAMEKASAN', '1987-07-16', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528105607870003@TK ABA.sch.id', NULL, '2022-02-28 19:13:43', '2022-02-28 12:13:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, NULL, NULL, NULL, 'true', 'AZIZAH BUDARI', 'F', '3528104106830011', 'PAMEKASAN', '1983-06-01', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528104106830011@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, NULL, NULL, NULL, 'true', 'DEASY FERANTIKA', 'F', '3528104211800001', 'PAMEKASAN', '1980-11-02', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528104211800001@TK ABA.sch.id', '9a57136c76ba7f1e71fa98be5ec01f61.jpg', '2022-02-28 19:13:44', '2022-02-28 12:17:25', NULL, NULL, 1, 0, 0, 0, 'false'),
(8, NULL, NULL, NULL, 'true', 'FERIYAL MUSYAFFIRAH', 'F', '3528106202940002', 'PAMEKASAN', '1994-02-22', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528106202940002@TK ABA.sch.id', 'f6872374076cfb57c19e32d6afe41099.jpg', '2022-02-28 19:13:44', '2022-02-28 12:17:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, NULL, NULL, NULL, 'true', 'HALIMAH', 'F', '3528106908810003', 'PAMEKASAN', '1981-08-29', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528106908810003@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, NULL, NULL, NULL, 'true', 'HENNY HADIYATI SAFITRI', 'F', '3528105103940002', 'Pamekasan', '1994-03-11', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528105103940002@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, NULL, NULL, NULL, 'true', 'HOLIDAH', 'F', '3528104611820003', 'PAMEKASAN', '1982-11-06', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528104611820003@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, NULL, NULL, NULL, 'true', 'iin zaitun', 'F', '3528064906950005', 'pamekasan', '1995-06-09', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528064906950005@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, NULL, NULL, NULL, 'true', 'JUMAIYATUL JANNAH', 'F', '3528106212830001', 'PAMEKASAN', '1983-12-22', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528106212830001@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, NULL, NULL, NULL, 'true', 'MUZDLALIFAH', 'F', '3528116912900001', 'PAMEKASAN', '1990-12-29', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528116912900001@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, NULL, NULL, NULL, 'true', 'NURUL JAMILA', 'F', '3528105207770003', 'PAMEKASAN', '1977-07-12', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528105207770003@TK ABA.sch.id', 'b6dda04c4346240356ade35e4ac73497.jpg', '2022-02-28 19:13:44', '2022-02-28 12:16:18', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, NULL, NULL, NULL, 'true', 'RUSTIYAH', 'F', '3528106207850003', 'PAMEKASAN', '1985-07-22', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528106207850003@TK ABA.sch.id', NULL, '2022-02-28 19:13:44', '2022-02-28 12:13:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, NULL, NULL, NULL, 'true', 'SOFI ANA UTAMI', 'F', '3509275901890002', 'JEMBER', '1989-01-19', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3509275901890002@TK ABA.sch.id', '013c54df697e40b5406190c7ac6ac3d4.jpg', '2022-02-28 19:13:44', '2022-02-28 12:15:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, NULL, NULL, NULL, 'true', 'SUSMIATI', 'F', '3528105704890005', 'PAMEKASAN', '1989-04-17', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528105704890005@TK ABA.sch.id', '10f1076f53d5d4a44b40672c938a87c2.jpg', '2022-02-28 19:13:44', '2022-02-28 12:15:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, NULL, NULL, NULL, 'true', 'TITIN ALKAMALIAH', 'F', '3578166310810002', 'SURABAYA', '1981-10-23', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3578166310810002@TK ABA.sch.id', '31fbdd2a6aea5886f1459333fa05c37c.jpg', '2022-02-28 19:13:44', '2022-02-28 12:15:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, NULL, NULL, NULL, 'true', 'YUSSIRAH', 'F', '3528106301900001', 'PAMEKASAN', '1990-01-23', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '3528106301900001@TK ABA.sch.id', '2836bc45db5a6ab978b05b709e8a9f58.jpg', '2022-02-28 19:13:44', '2022-02-28 12:14:38', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) DEFAULT 0,
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Penerimaan Peserta Didik Baru', '5604e47bcb81161f94bb6c517d5cfa38.jpg', '2021-03-24 06:57:52', '2022-02-16 15:30:46', '2022-02-16 22:27:55', NULL, 0, 1, 1, 0, 'true'),
(2, 'Pelatihan Perawatan Dan Perbaikan PeralatanListrik Rumah Tangga', 'd1906e4324d79c1747e322ebfdafa1b2.jpg', '2021-03-24 06:57:52', '2022-02-16 15:27:55', '2022-02-16 22:27:55', NULL, 0, 1, 1, 0, 'true'),
(3, 'Guru Tenaga Pendidik SMK Putra Bangsa', '831a36c9f19b96fbd0c5b5612c8cec05.jpg', '2021-11-23 09:20:29', '2022-02-16 15:27:55', '2022-02-16 22:27:55', NULL, 1, 0, 1, 0, 'true'),
(4, 'PARA GURU', '91d535f7d2540f812f0fdc27b79ac9c7.jpg', '2022-02-16 22:28:08', '2022-03-01 13:45:12', NULL, NULL, 1, 1, 0, 0, 'false'),
(5, 'LOGO', '194de16d51b44f429aedb2dde87970cc.jpg', '2022-02-16 22:31:14', '2022-03-01 13:45:30', NULL, NULL, 1, 1, 0, 0, 'false'),
(6, '', 'cf33ad3bfa45342e0176d4273629e898.jpg', '2022-02-16 22:32:11', '2022-02-16 15:32:28', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 'MEMBACA DOA SBELUM BELAJAR', '83f68c195a31e6cbd695f8e9a13b5c46.jpg', '2022-03-01 20:43:57', '2022-03-01 13:44:53', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `links`
--

INSERT INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', NULL, 'link', '2021-03-24 06:57:51', '2022-02-21 00:43:52', '2022-02-21 07:43:52', NULL, 0, 0, 1, 0, 'true'),
(2, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', '1.png', 'banner', '2021-03-24 06:57:51', '2021-03-23 23:57:51', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'FB Tk Aaisyiyah Bustanul Atfhal', 'https://www.facebook.com/Tk-Aisyiyah-Bustanul-Atfhal-1565980383444869/', '_blank', NULL, 'link', '2022-02-23 09:26:29', '2022-02-23 02:26:29', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `majors`
--

INSERT INTO `majors` (`id`, `major_name`, `major_short_name`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Rekayasa Perangkat Lunak', 'RPL', 'true', '2021-11-24 07:52:40', '2022-03-01 12:47:25', '2022-03-01 19:47:25', NULL, 1, 1, 1, 0, 'true'),
(2, 'Tehnik Audio Vidio', 'TAV', 'true', '2021-11-24 07:52:56', '2022-03-01 12:47:25', '2022-03-01 19:47:25', NULL, 1, 1, 1, 0, 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint(20) DEFAULT 0,
  `menu_position` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 7, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'PPDB 2021', '#', '_self', 'links', 0, 5, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Galeri', '#', '_self', 'links', 0, 6, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Kategori', '#', '_self', 'links', 0, 2, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'Uncategorized', 'kategori/uncategorized', '_self', 'post_categories', 10, 1, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'Direktori', '#', '_self', 'links', 0, 3, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'Direktori Peserta Didik', 'direktori-peserta-didik', '_self', 'modules', 12, 3, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'Direktori Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '_self', 'modules', 12, 2, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'Profil', 'read/2/profil', '_self', 'pages', 0, 1, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'Visi dan Misi', 'read/3/visi-dan-misi', '_self', 'pages', 0, 1, '2021-03-24 06:57:54', '2021-03-23 23:57:54', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'users', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Blog', 'Blog', 'blog', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Media', 'Media', 'media', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Akademik', 'Akademik', 'academic', '2021-03-24 06:57:45', '2021-03-23 23:57:45', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `options`
--

INSERT INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'student_status', 'Lulus', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'student_status', 'Mutasi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'student_status', 'Dikeluarkan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'student_status', 'Putus Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'student_status', 'Meninggal', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'student_status', 'Hilang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'student_status', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'employments', 'Tidak bekerja', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'employments', 'Nelayan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'employments', 'Petani', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'employments', 'Peternak', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'employments', 'PNS/TNI/POLRI', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'employments', 'Karyawan Swasta', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'employments', 'Pedagang Kecil', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'employments', 'Pedagang Besar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'employments', 'Wiraswasta', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'employments', 'Wirausaha', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'employments', 'Buruh', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'employments', 'Pensiunan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'employments', 'Lain-lain', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'special_needs', 'Tidak', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'special_needs', 'Tuna Netra', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'special_needs', 'Tuna Laras', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'special_needs', 'Tuna ganda', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'special_needs', 'Hiper aktif', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'special_needs', 'Narkoba', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'special_needs', 'Indigo', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'special_needs', 'Down Sindrome', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'special_needs', 'Autis', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'special_needs', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'educations', 'Tidak sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'educations', 'Putus SD', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'educations', 'SD Sederajat', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'educations', 'SMP Sederajat', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'educations', 'SMA Sederajat', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'educations', 'D1', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'educations', 'D2', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'educations', 'D3', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'educations', 'D4/S1', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'educations', 'S2', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'educations', 'S3', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'scholarships', 'Anak berprestasi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'scholarships', 'Anak Miskin', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'scholarships', 'Pendidikan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'scholarships', 'Unggulan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'scholarships', 'Lain-lain', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'achievement_types', 'Sains', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'achievement_types', 'Seni', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'achievement_types', 'Olahraga', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'achievement_types', 'Lain-lain', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'achievement_levels', 'Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'achievement_levels', 'Kecamatan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'achievement_levels', 'Kota/Kabupaten', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'achievement_levels', 'Propinsi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'achievement_levels', 'Nasional', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'achievement_levels', 'Internasional', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'monthly_incomes', 'Kurang dari 500,000', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'monthly_incomes', '500.000 - 999.9999', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'monthly_incomes', '1 Juta - 1.999.999', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'monthly_incomes', '2 Juta - 4.999.999', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'monthly_incomes', '5 Juta - 20 Juta', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'residences', 'Bersama orang tua', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'residences', 'Wali', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'residences', 'Kos', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'residences', 'Asrama', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'residences', 'Panti Asuhan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'residences', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'transportations', 'Jalan kaki', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'transportations', 'Kendaraan pribadi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'transportations', 'Kendaraan Umum / angkot / Pete-pete', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(83, 'transportations', 'Jemputan Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'transportations', 'Kereta Api', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'transportations', 'Ojek', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'transportations', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'religions', 'Islam', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'religions', 'Kristen / protestan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'religions', 'Katholik', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'religions', 'Hindu', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'religions', 'Budha', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'religions', 'Khong Hu Chu', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(95, 'religions', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(100, 'school_levels', '5 - Universitas', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(101, 'school_levels', '6 - Sekolah Tinggi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(102, 'school_levels', '7 - Politeknik', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(103, 'marriage_status', 'Kawin', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(104, 'marriage_status', 'Belum Kawin', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(105, 'marriage_status', 'Berpisah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(106, 'institution_lifters', 'Pemerintah Pusat', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(107, 'institution_lifters', 'Pemerintah Provinsi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(109, 'institution_lifters', 'Ketua yayasan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(110, 'institution_lifters', 'Kepala Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(111, 'institution_lifters', 'Komite Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(112, 'institution_lifters', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(113, 'employment_status', 'PNS ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(118, 'employment_status', 'GTT/PTT Kota/Kabupaten', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(122, 'employment_status', 'CPNS', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(123, 'employment_status', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(124, 'employment_types', 'Guru Kelas', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(125, 'employment_types', 'Guru Mata Pelajaran', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(126, 'employment_types', 'Guru BK', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(127, 'employment_types', 'Guru Inklusi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(129, 'employment_types', 'Guru Pendamping', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(130, 'employment_types', 'Guru Magang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(131, 'employment_types', 'Guru TIK', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(132, 'employment_types', 'Laboran', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(133, 'employment_types', 'Pustakawan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(134, 'employment_types', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(135, 'ranks', 'I/A', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(136, 'ranks', 'I/B', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(137, 'ranks', 'I/C', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(138, 'ranks', 'I/D', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(139, 'ranks', 'II/A', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(140, 'ranks', 'II/B', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(141, 'ranks', 'II/C', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(142, 'ranks', 'II/D', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(143, 'ranks', 'III/A', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(144, 'ranks', 'III/B', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(145, 'ranks', 'III/C', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(146, 'ranks', 'III/D', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(147, 'ranks', 'IV/A', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(148, 'ranks', 'IV/B', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(149, 'ranks', 'IV/C', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(150, 'ranks', 'IV/D', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(151, 'ranks', 'IV/E', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(152, 'salary_sources', 'APBN', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(153, 'salary_sources', 'APBD Provinsi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(154, 'salary_sources', 'APBD Kab/Kota', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(155, 'salary_sources', 'Yayasan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(156, 'salary_sources', 'Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(157, 'salary_sources', 'Lembaga Donor', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(158, 'salary_sources', 'Lainnya', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(159, 'laboratory_skills', 'Lab IPA', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(160, 'laboratory_skills', 'Lab Fisika', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(161, 'laboratory_skills', 'Lab Biologi', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(162, 'laboratory_skills', 'Lab Kimia', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(163, 'laboratory_skills', 'Lab Bahasa', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(164, 'laboratory_skills', 'Lab Komputer', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(165, 'laboratory_skills', 'Teknik Bangunan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(169, 'laboratory_skills', 'Teknik Mesin', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(170, 'admission_types', 'prestasi', '2021-11-25 07:40:54', '2021-11-25 00:40:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(171, 'admission_types', 'tidak mampu', '2021-11-25 07:41:03', '2021-11-25 00:41:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(172, 'admission_types', 'normal', '2021-11-25 07:41:43', '2021-11-25 00:41:43', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) DEFAULT 0,
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT 0,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext DEFAULT NULL,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT 0,
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>Sambutan Kepala TK Aisyiyah Bustanul Athfal 2&nbsp; Waru - Pamekasan</p>\n<p>Assalamualaikum Warah Matullah Wabarakatuh</p>\n<p>&nbsp;</p>\n<p>Selamat datang di laman web TK Aisyiyah Bustanul Athfal 2 Waru Pamekasan</p>\n<p>&nbsp;Pendidikan anak usia dini khususnya pada layanan usia 4-6 tahun (jenjang TK) adalah&nbsp; pendidikan sebelum jenjang pendidikan dasar,&nbsp; merupakan upaya pembinaan&nbsp; yg&nbsp; dilakukan melalui pemberian rangsangan pendidikan untuk membantu pertumbuhan dan perkembangan jasmani dan rohani agar anak&nbsp; memiliki kesiapan dalam memasuki pendidikan lebih lanjut yang diselenggarakan pada jalur formal.</p>\n<p>Hal tsb diatas sesuai dengan hadist nabi, dari Abu Hurairah bahwasanya Rasulullah Shallallahu \'alaihi wasallam bersabda: \"Setiap anak itu dilahirkan dalam keadaan fitrah lalu kedua orang tuanyalah yang menjadikannya sebagai seorang yahudi, nasrani dan majusi (penyembah api). Apabila kedua orang tuanya muslim, maka anaknya pun akan menjadi muslim. Pendidikan untuk anak usia dini juga sangat penting dalam pembentukan karakter pada anak.</p>\n<p>Pada usia dini merupakan masa-masa Golden Age, pada masa golden age berumur 0-6 tahun pada masa ini otak anak berkembang 80%. Pada masa ini pula anak-anak mudah dibentuk oleh karena itu Anak perlu dibimbing dan di teladani&nbsp; yang baik&nbsp; sesuai dengan usia jl l8nya, agar nantinya dia menjadi anak yang unggul dalamo agama maupun intelektualnya. Oleh Karena itu peran pendidik dalam mendidik anak sangat penting. Orang tua dan pendidik harus melihat potensi anak yang dimilikinya dan orang tua maupun pendidik harus membantu mengembangkan potensi yang dia miliki, dan jangan sampai orang tua memaksa kehendak pada anaknya.</p>\n<p>Kami memberikan pelayanan pendidikan dengan sepenuh hati kepada seluruh peserta didik, TK Aisyiyah Bustanul Athfal 2 adalah salah satu wadah bermain dan belajar bagi anak-anak kita. TK Aisyiyah Bustanul Athfal 2 siap membantu&nbsp; orang tua untuk&nbsp; menyelamatkan &ldquo;Usia Emas&rdquo; para putra putrinya.</p>\n<p>&nbsp;Perencanaan pembelajaran pada program TK Aisyiyah Bustanul Athfal 2 sudah disusun dengan matang untuk memberikan arah yang tepat dalam proses pembelajarannya dengan mempertimbangkan keseimbangan antara pendidikan umum dan pendidikan keagamaan.</p>\n<p>&nbsp;Semoga apa yang akan kami&nbsp; berikan melalui website dapat bermanfaat bagi guru anak didik. orang tua murid, masyarakat dan sekolah. Akhir kata,&nbsp; kami mengucapkan terimakasih kepada semua pihak yang terlibat dalam mewujudkan Website ini. Semoga semua yang kami lakukan mendapat ridho dari allah subhanahu wataala dan TK Aisyiyah Bustanul Athfal 2&nbsp; semakin eksis.</p>\n<p>Wassalamu&rsquo;alaikum Warah Matullah Wabarakatuh</p>\n<p>&nbsp;</p>\n<p>Kepala TK Aisyiyah Bustanul Athfal 2 Pamekasan</p>\n<p>&nbsp;</p>\n<p>Alimah, S.Pd</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2021-03-24 06:57:53', '2022-02-16 15:58:40', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'PROFILE SEKOLAH', '<table width=\"655\">\n<tbody>\n<tr>\n<td colspan=\"9\" width=\"655\">1. Identitas Sekolah</td>\n</tr>\n<tr>\n<td>1</td>\n<td width=\"223\">Nama Sekolah</td>\n<td>:</td>\n<td colspan=\"6\">TK AISYIYAH BUSTANUL ATHFAL</td>\n</tr>\n<tr>\n<td>2</td>\n<td width=\"223\">NPSN</td>\n<td>:</td>\n<td colspan=\"6\">20583967</td>\n</tr>\n<tr>\n<td>3</td>\n<td width=\"223\">Jenjang Pendidikan</td>\n<td>:</td>\n<td colspan=\"6\">TK</td>\n</tr>\n<tr>\n<td>4</td>\n<td width=\"223\">Status Sekolah</td>\n<td>:&nbsp;</td>\n<td colspan=\"6\">Swasta</td>\n</tr>\n<tr>\n<td>5</td>\n<td width=\"223\">Akredetasi</td>\n<td>&nbsp;</td>\n<td colspan=\"6\">B</td>\n</tr>\n<tr>\n<td>6</td>\n<td width=\"223\">Alamat Sekolah</td>\n<td>:</td>\n<td colspan=\"6\">TLANGI WARU BARAT</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">RT / RW</td>\n<td>:</td>\n<td>&nbsp;</td>\n<td>/</td>\n<td>&nbsp;</td>\n<td colspan=\"3\">&nbsp;</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">Kode Pos</td>\n<td>:</td>\n<td colspan=\"6\">69353</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">Kelurahan</td>\n<td>:</td>\n<td colspan=\"6\">Waru Barat</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">Kecamatan</td>\n<td>:</td>\n<td colspan=\"6\">Kec. Waru</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">Kabupaten/Kota</td>\n<td>:</td>\n<td colspan=\"6\">Kab. Pamekasan</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">Provinsi</td>\n<td>:</td>\n<td colspan=\"6\">Prov. Jawa Timur</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">Negara</td>\n<td>:&nbsp;</td>\n<td colspan=\"6\">Indonesia</td>\n</tr>\n<tr>\n<td>7</td>\n<td width=\"223\">Posisi Geografis</td>\n<td>:</td>\n<td colspan=\"3\">-6.9418</td>\n<td>Lintang</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td width=\"223\">&nbsp;</td>\n<td>&nbsp;</td>\n<td colspan=\"3\">113.5412</td>\n<td>Bujur</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td colspan=\"2\">3. Data Pelengkap</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td>8</td>\n<td width=\"223\">SK Pendirian Sekolah</td>\n<td>:</td>\n<td colspan=\"6\">2514/KEP/1.0/B/2019</td>\n</tr>\n<tr>\n<td>9</td>\n<td width=\"223\">Tanggal SK Pendirian</td>\n<td>:&nbsp;</td>\n<td colspan=\"6\">2020-11-20</td>\n</tr>\n<tr>\n<td>10</td>\n<td width=\"223\">Status Kepemilikan</td>\n<td>:</td>\n<td colspan=\"6\">Yayasan</td>\n</tr>\n<tr>\n<td>11</td>\n<td width=\"223\">SK Izin Operasional</td>\n<td>:</td>\n<td colspan=\"6\">TK/420/0018/432.316/XII/2020</td>\n</tr>\n<tr>\n<td>12</td>\n<td width=\"223\">Tgl SK Izin Operasional</td>\n<td>:</td>\n<td colspan=\"6\">2020-11-20</td>\n</tr>\n<tr>\n<td>13</td>\n<td width=\"223\">Kebutuhan Khusus Dilayani</td>\n<td>:</td>\n<td colspan=\"6\">&nbsp;</td>\n</tr>\n<tr>\n<td>14</td>\n<td width=\"223\">Nomor Rekening</td>\n<td>:</td>\n<td colspan=\"6\">1042046384</td>\n</tr>\n<tr>\n<td>15</td>\n<td width=\"223\">Nama Bank</td>\n<td>:</td>\n<td colspan=\"6\">BANK JATIM</td>\n</tr>\n<tr>\n<td>16</td>\n<td width=\"223\">Cabang KCP/Unit</td>\n<td>:</td>\n<td colspan=\"6\">WARU</td>\n</tr>\n<tr>\n<td>17</td>\n<td width=\"223\">Rekening Atas Nama</td>\n<td>:</td>\n<td colspan=\"6\">TK AISYIYAH BUSTANUL ATHFAL</td>\n</tr>\n<tr>\n<td>18</td>\n<td width=\"223\">MBS</td>\n<td>:</td>\n<td colspan=\"6\">Tidak</td>\n</tr>\n<tr>\n<td>19</td>\n<td width=\"223\">Memungut Iuran</td>\n<td>:</td>\n<td colspan=\"6\">Ya (Tahunan)</td>\n</tr>\n<tr>\n<td>20</td>\n<td width=\"223\">Nominal/siswa</td>\n<td>:</td>\n<td colspan=\"6\">50,000</td>\n</tr>\n<tr>\n<td>21</td>\n<td width=\"223\">Nama Wajib Pajak</td>\n<td>:</td>\n<td colspan=\"6\">TK AISYIYAH BUSTANUL ATHFAL 2</td>\n</tr>\n<tr>\n<td>22</td>\n<td width=\"223\">NPWP</td>\n<td>:</td>\n<td colspan=\"6\">936941863608000</td>\n</tr>\n<tr>\n<td colspan=\"9\">3. Kontak Sekolah</td>\n</tr>\n<tr>\n<td>23</td>\n<td width=\"223\">Nomor Telepon</td>\n<td>:</td>\n<td colspan=\"6\">&nbsp;</td>\n</tr>\n<tr>\n<td>24</td>\n<td width=\"223\">Nomor Fax</td>\n<td>:&nbsp;</td>\n<td colspan=\"6\">&nbsp;</td>\n</tr>\n<tr>\n<td>25</td>\n<td width=\"223\">Email</td>\n<td>:</td>\n<td colspan=\"6\">tkabawaru1@gmail.com</td>\n</tr>\n<tr>\n<td>26</td>\n<td width=\"223\">Website</td>\n<td>:&nbsp;</td>\n<td colspan=\"6\">http://</td>\n</tr>\n</tbody>\n</table>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'profile-sekolah', 'berita, pengumuman, sekilas-info', 27, '2021-03-24 06:57:53', '2022-03-03 11:40:29', NULL, NULL, 0, 1, 0, 0, 'false'),
(3, 'Visi dan Misi', '<p>VISI</p>\n<p>MENDIDIK ANAK BER-AKHLAK MULIA, CERDAS, MANDIRI DAN TERAMPIL</p>\n<p>MISI</p>\n<ol>\n<li>MENCETAK ANAK BERTAQWA DAN BER AKHLAQUL KARIMAH</li>\n<li>MELATIH ANAK BELAJAR MANDIRI BER-EMPATI DENGAN SESAMA</li>\n<li>MEMBANGUN SEMUA POTENSI ANAK&nbsp;</li>\n<li>MENGEMBANGKAN SIKAP BELAJAR TERAMPIL BERWIRAUSAHA SEJAK DINI</li>\n</ol>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 22, '2021-03-24 06:57:53', '2022-03-03 11:41:26', NULL, NULL, 0, 1, 0, 0, 'false'),
(4, 'LEARNING GARDENT', '<p>halo#putra bangsa muda</p>\n<p>selamat pagi,semoga kita senantiasa dalam lindungan allah swt</p>\n<p>di hari wekend ini,mari kita mempersiapkan diri untuk belajar di hari senin</p>\n<p>jangan lupa perbanyak membaca,brdiskusi,dan menulis,karena tidk ada yang bisa menyelamatkan logika kita selain ketiga tersebut</p>\n<hr />\n<p>follow us</p>\n<p>fb:SMK putra bangsa</p>\n<p>ig:smkpb_waru</p>\n<p>yt:smk putra bangsa waru</p>\n<h1>smk hits#smk#smkpb#smkputrabangsa#smk bisa</h1>\n<h1>smkpbwaru#smkpb info#warubarat#waru</h1>\n<h1>#waru pamekasan</h1>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 'c5433e48c46d117766290a8314fca232.jpg', 1, '+1+', 'post', 'publish', 'public', 'open', 'learning-gardent', 'berita, pengumuman, sekilas-info', 5, '2021-03-24 06:57:53', '2022-02-16 15:59:46', '2022-02-16 22:59:46', NULL, 0, 1, 1, 0, 'true'),
(5, 'PRAMUKA', '<p>alhamdulillah kepala sekolah telah menutup PERSAMI. praja muda karana(pramuka),</p>\n<p>pada prinsipnya melatih pemuda untuk menaati nurma agama dam negara supaya peduli terhadap dirinya. selesai nya PERSAMI, semuga anak didik bisa menemukan nilai terkandung dalam pramuka.</p>\n<p>&nbsp;</p>\n<hr />\n<p>&nbsp;</p>\n<p>follow us</p>\n<p>fb:SMK putra bangsa</p>\n<p>ig:smkpb_waru</p>\n<p>yt:smk putra bangsa waru</p>\n<h1>smk hits#smk#smkpb#smkputrabangsa#smk bisa</h1>\n<h1>smkpbwaru#smkpb info#warubarat#waru</h1>\n<h1>#waru pamekasan</h1>', 'ec031f74b42afed44e803189daa9a142.jpg', 1, '+1+', 'post', 'publish', 'public', 'open', 'pramuka', 'berita, pengumuman, sekilas-info', 3, '2021-03-24 06:57:53', '2022-02-16 15:59:46', '2022-02-16 22:59:46', NULL, 0, 1, 1, 0, 'true'),
(6, 'PELATIHAN JURNALISTIK', '<p>hari ini adalah nyata. masa depan adalah harapan.marilah kita susun harapan mejadi nyata.terimakasih atas ilmu yang di sampaikan kepada JPRM biru bangkalan&nbsp;fathorrohman</p>\n<p>&nbsp;</p>\n<hr />\n<p>&nbsp;</p>\n<p>follow us</p>\n<p>fb:SMK putra bangsa</p>\n<p>ig:smkpb_waru</p>\n<p>yt:smk putra bangsa waru</p>\n<h1>smk hits#smk#smkpb#smkputrabangsa#smk bisa</h1>\n<h1>smkpbwaru#smkpb info#warubarat#waru</h1>\n<h1>#waru pamekasan</h1>', 'db11d2add9251a289df8cd6b18e882a4.jpg', 1, '+1+', 'post', 'publish', 'public', 'open', 'pelatihan-jurnalistik', 'berita, pengumuman, sekilas-info', 1, '2021-03-24 06:57:53', '2022-02-16 15:59:46', '2022-02-16 22:59:46', NULL, 0, 1, 1, 0, 'true'),
(7, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2021-03-24 06:57:53', '2021-11-24 01:52:45', '2021-11-24 08:52:45', '2021-11-24 08:52:25', 0, 0, 1, 1, 'true'),
(8, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2021-03-24 06:57:53', '2021-11-24 01:52:45', '2021-11-24 08:52:45', '2021-11-24 08:52:25', 0, 0, 1, 1, 'true'),
(9, 'profile SMK putra bangsa', 'dS_BVy4Ypfs', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2021-11-25 07:47:21', '2022-02-23 02:31:49', '2022-02-23 09:31:49', NULL, 1, 0, 1, 0, 'true'),
(10, 'KaryaSiswa(yoga ansori)', 'RNncs9_b0ss', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2021-11-25 07:48:30', '2022-02-23 02:31:49', '2022-02-23 09:31:49', NULL, 1, 1, 1, 0, 'true'),
(11, 'Belajar Komponen Komputer', 'eqUQAHXJlTo', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2021-11-25 07:52:04', '2022-02-23 02:31:49', '2022-02-23 09:31:49', NULL, 1, 1, 1, 0, 'true'),
(12, 'Kendali Sepeda Motor Menggunakan HP Android', 'aD379WM-RDo', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2021-11-25 08:15:02', '2022-02-23 02:31:49', '2022-02-23 09:31:49', NULL, 1, 0, 1, 0, 'true'),
(13, 'Kejuaraan mewairani', '<p>Alhamduliilah TK Aisyah BustanulT Atfhal meraih kejuaraan lomba mewarnai di M2M pasa tanggak 2 februari 2022 sebagai juara 1 dan 2</p>\r\n<p>&nbsp;</p>', '03eb68613ea4b8ec9d198cd4502e10ba.jpg', 1, '', 'post', 'publish', 'public', 'open', 'kejuaraan-mewairani', '', 0, '2022-02-16 23:03:55', '2022-03-01 13:49:14', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '\"tujuan utama pendidikan bukanlah pengetahuan,tetapi tindakan\"', 'internet', '2021-03-24 06:57:50', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 1, 1, 0, 'true'),
(2, '\"pendidikan adalah seni untuk membuat manusia makin berkarakter.\"', 'internet', '2021-03-24 06:57:50', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 1, 1, 0, 'true'),
(3, '\"menjadi cerdas dan berkarakter adalah tujuan utama sebuah pendidikan.\"', 'internet', '2021-03-24 06:57:50', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 1, 1, 0, 'true'),
(4, '\"pengetahuan adalah kekuatan. informasi membebaskan. pendidikan adalah premis kemajuan, di setiap masyarakat di setiap keluarga.\"-kofi annan', 'internet', '2021-11-24 07:37:11', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 0, 1, 0, 'true'),
(5, '\"akar pendidikan itu pahit,tapi buahnya manis.\"-aristoteles', 'internet', '2021-11-24 07:38:40', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 0, 1, 0, 'true'),
(6, '\"pendidikan adalah senjata paling ampuh yang dapat kamu gunakanuntuk mengubah dunia.\"-nelson mandela', 'internet', '2021-11-24 07:39:57', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 0, 1, 0, 'true'),
(7, 'pendidikan adalah kemampuan untuk mendengar hampir semua hal tanpa kehilangan kesabara atau kepercayaan diri', 'internet', '2021-11-24 07:41:19', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 0, 1, 0, 'true'),
(8, '\"dasar dari setiap negara adalah pendidikan para pemuda.\"-diogenes', 'internet', '2021-11-24 07:42:58', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 0, 1, 0, 'true'),
(9, '\"tanpa pengetahuan, tindakan tidak berguna dan pengetahuan tanpa tindakan adalah sia-sia.\"-abu bakar', 'internet', '2021-11-24 07:44:52', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 0, 1, 0, 'true'),
(10, '\"mendidk pikiran tanpa mendidik hati bukanlah pendidikan sama sekali.\"', 'internet', '2021-11-24 07:46:12', '2022-02-21 00:33:34', '2022-02-21 07:33:34', NULL, 1, 0, 1, 0, 'true'),
(11, '\"tertanamnya sikap bertakwa dan ber akhlakul karimah pada anak melalui penanaman dan pembalasan dalam kehidupan sehari hari', 'TK ABA AISYIYAH', '2022-02-21 07:36:42', '2022-02-21 00:36:42', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 'Tertnamnya watak dan sikap mandiri dilandasi oleh rasa tanggung jawab yang tinggi', 'TK ABA AISYIYAH', '2022-02-21 07:38:53', '2022-02-21 00:38:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 'tercapainya kemajuan intelektual anak melalui pembelajaran yang aktif, efektif, inovatif, dan menyenangkan', 'TK ABA AISYIYAH', '2022-02-21 07:40:47', '2022-02-21 00:40:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 'tertanamnya sikap belajar terampil berwira usaha sejak dengan menjadi intrepreneur kecil dilingkungannya', 'TK ABA AISYIYAH', '2022-02-21 07:42:21', '2022-02-21 00:42:21', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `scholarship_type` bigint(20) DEFAULT 0,
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year(4) NOT NULL,
  `scholarship_end_year` year(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_default_value` text DEFAULT NULL,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2021-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', NULL, 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'general', 'meta_keywords', NULL, 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'general', 'map_location', NULL, '', 'public', 'Lokasi di Google Maps', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public', 'Time Zone', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'media', 'upload_max_filesize', NULL, '0', 'public', 'Maksimal Ukuran File yang Diupload', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'image_slider_height', NULL, '400', 'public', 'Tinggi Gambar Slide', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'logo_height', NULL, '120', 'public', 'Tinggi Logo Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'media', 'logo_width', NULL, '120', 'public', 'Lebar Logo Sekolah', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'social_account', 'facebook', NULL, '', 'public', 'Facebook', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'social_account', 'twitter', NULL, '', 'public', 'Twitter', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'social_account', 'youtube', NULL, '', 'public', 'Youtube', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'social_account', 'instagram', NULL, '', 'public', 'Instagram', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'mail_server', 'sendgrid_username', NULL, '', 'public', 'Sendgrid Username', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'mail_server', 'sendgrid_password', NULL, '', 'public', 'Sendgrid Password', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'mail_server', 'sendgrid_api_key', NULL, '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', 'public', 'Sendgrid API Key', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'school_profile', 'npsn', '69859649', '123', 'public', 'NPSN', '2021-03-24 06:57:46', '2021-11-23 01:58:56', NULL, NULL, 0, 1, 0, 0, 'false'),
(65, 'school_profile', 'school_name', 'TK Aisyiyah Bustanul Atfhal', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2021-03-24 06:57:46', '2022-02-23 01:58:34', NULL, NULL, 0, 1, 0, 0, 'false'),
(66, 'school_profile', 'headmaster', 'Alimah,s.pd', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2021-03-24 06:57:46', '2022-02-23 01:55:41', NULL, NULL, 0, 1, 0, 0, 'false'),
(67, 'school_profile', 'headmaster_photo', 'c8f6f691ce086b7f0900168a1ec9c722.jpg', 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2021-03-24 06:57:46', '2022-02-23 01:56:14', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'school_profile', 'school_level', NULL, '3', 'public', 'Bentuk Pendidikan', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'school_profile', 'school_status', '2', '1', 'public', 'Status Sekolah', '2021-03-24 06:57:46', '2021-11-23 02:02:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(70, 'school_profile', 'ownership_status', '112', '1', 'public', 'Status Kepemilikan', '2021-03-24 06:57:46', '2021-11-23 02:00:04', NULL, NULL, 0, 1, 0, 0, 'false'),
(71, 'school_profile', 'decree_operating_permit', NULL, '-', 'public', 'SK Izin Operasional', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'school_profile', 'decree_operating_permit_date', NULL, '2021-03-24', 'public', 'Tanggal SK Izin Operasional', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'school_profile', 'tagline', '.........', 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2021-03-24 06:57:46', '2022-02-28 12:44:18', NULL, NULL, 0, 1, 0, 0, 'false'),
(74, 'school_profile', 'rt', '-', '12', 'public', 'RT', '2021-03-24 06:57:46', '2021-11-23 02:01:18', NULL, NULL, 0, 1, 0, 0, 'false'),
(75, 'school_profile', 'rw', '-', '06', 'public', 'RW', '2021-03-24 06:57:46', '2021-11-23 02:01:25', NULL, NULL, 0, 1, 0, 0, 'false'),
(76, 'school_profile', 'sub_village', 'Tobalang 3', 'Wage', 'public', 'Dusun', '2021-03-24 06:57:46', '2022-03-03 02:13:23', NULL, NULL, 0, 1, 0, 0, 'false'),
(77, 'school_profile', 'village', 'Waru Barat', 'Kadugede', 'public', 'Kelurahan / Desa', '2021-03-24 06:57:46', '2021-11-23 02:05:22', NULL, NULL, 0, 1, 0, 0, 'false'),
(78, 'school_profile', 'sub_district', 'Waru', 'Kadugede', 'public', 'Kecamatan', '2021-03-24 06:57:46', '2021-11-23 02:03:46', NULL, NULL, 0, 1, 0, 0, 'false'),
(79, 'school_profile', 'district', 'pamekasan', 'Kuningan', 'public', 'Kota/Kabupaten', '2021-03-24 06:57:46', '2021-11-23 01:56:09', NULL, NULL, 0, 1, 0, 0, 'false'),
(80, 'school_profile', 'postal_code', '69353', '45561', 'public', 'Kode Pos', '2021-03-24 06:57:46', '2021-11-23 02:01:07', NULL, NULL, 0, 1, 0, 0, 'false'),
(81, 'school_profile', 'street_address', 'Jl.TLANGI WARU BARAT', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2021-03-24 06:57:46', '2022-02-23 01:59:31', NULL, NULL, 0, 1, 0, 0, 'false'),
(82, 'school_profile', 'phone', '-', '0232123456', 'public', 'Telepon', '2021-03-24 06:57:46', '2021-11-23 02:00:49', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'school_profile', 'fax', NULL, '0232123456', 'public', 'Fax', '2021-03-24 06:57:46', '2021-03-23 23:57:46', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'school_profile', 'email', 'tkabawaru1@gmail.com', 'info@sman9kuningan.sch.id', 'public', 'Email', '2021-03-24 06:57:46', '2022-02-23 01:58:01', NULL, NULL, 0, 1, 0, 0, 'false'),
(85, 'school_profile', 'website', 'http://www.TK ABA.sch.id', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2021-03-24 06:57:46', '2022-02-23 02:40:22', NULL, NULL, 0, 1, 0, 0, 'false'),
(86, 'school_profile', 'logo', '7334fd7e174aa5092ad6e819a3deb3cc.jpg', 'logo.png', 'public', 'Logo', '2021-03-24 06:57:46', '2022-02-23 01:56:25', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'admission', 'admission_status', 'open', 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2021-03-24 06:57:46', '2021-11-25 00:24:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(88, 'admission', 'admission_year', '2021', '2021', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2021-03-24 06:57:46', '2021-11-25 00:24:40', NULL, NULL, 0, 1, 0, 0, 'false'),
(89, 'admission', 'admission_start_date', '2021-01-01', '2021-01-01', 'public', 'Tanggal Mulai PPDB', '2021-03-24 06:57:46', '2021-11-25 00:23:41', NULL, NULL, 0, 1, 0, 0, 'false'),
(90, 'admission', 'admission_end_date', '2021-07-20', '2021-12-31', 'public', 'Tanggal Selesai PPDB', '2021-03-24 06:57:46', '2021-11-25 00:23:59', NULL, NULL, 0, 1, 0, 0, 'false'),
(91, 'admission', 'announcement_start_date', '2021-07-31', '2021-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2021-03-24 06:57:46', '2021-11-25 00:26:09', NULL, NULL, 0, 1, 0, 0, 'false'),
(92, 'admission', 'announcement_end_date', '2021-07-25', '2021-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2021-03-24 06:57:46', '2021-11-25 00:25:21', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `first_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint(20) DEFAULT 0 COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text DEFAULT NULL COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan/KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-Cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT 0,
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint(20) DEFAULT 0 COMMENT 'Tempat Tinggal',
  `transportation_id` bigint(20) DEFAULT 0 COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education_id` bigint(20) DEFAULT 0,
  `father_employment_id` bigint(20) DEFAULT 0,
  `father_monthly_income_id` bigint(20) DEFAULT 0,
  `father_special_need_id` bigint(20) DEFAULT 0,
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education_id` bigint(20) DEFAULT 0,
  `mother_employment_id` bigint(20) DEFAULT 0,
  `mother_monthly_income_id` bigint(20) DEFAULT 0,
  `mother_special_need_id` bigint(20) DEFAULT 0,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education_id` bigint(20) DEFAULT 0,
  `guardian_employment_id` bigint(20) DEFAULT 0,
  `guardian_monthly_income_id` bigint(20) DEFAULT 0,
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(6) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(6) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(6) DEFAULT 0 COMMENT 'Jumlah Saudara Kandung',
  `student_status_id` bigint(20) DEFAULT 0 COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 0, 0, 0, NULL, NULL, NULL, 0, 0, '4410cfad41fd8d7afae49f3975532f76.jpg', NULL, 'true', 'false', 'false', 'false', NULL, NULL, '123.123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH BAIHAKI', 'M', 'PAMEKASAN', '2001-05-02', 0, 0, 'Ponjanan Timur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '123.123@smkpbwaru.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2021-11-24 08:12:10', '2022-03-01 12:48:28', '2022-03-01 19:48:28', NULL, 1, 0, 1, 0, 'true'),
(2, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '123.124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RUDI', 'M', 'PAMEKASAN', '2002-03-12', 0, 0, 'Bujur Timur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '123.124@smkpbwaru.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2021-11-24 08:12:10', '2022-03-01 12:48:28', '2022-03-01 19:48:28', NULL, 1, 0, 1, 0, 'true'),
(3, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '123.125', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIYAN', 'M', 'PAMEKASAN', '2003-10-25', 0, 0, 'Sokobanah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '123.125@smkpbwaru.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2021-11-24 08:12:10', '2022-03-01 12:48:28', '2022-03-01 19:48:28', NULL, 1, 0, 1, 0, 'true'),
(4, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '123.126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QOMAR', 'M', 'PAMEKASAN', '2004-12-12', 0, 0, 'Ponjanan Barat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '123.126@smkpbwaru.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2021-11-24 08:12:10', '2022-03-01 12:48:28', '2022-03-01 19:48:28', NULL, 1, 0, 1, 0, 'true'),
(5, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADEVA KHEISYA ADITYA', 'F', 'PAMEKASAN', '2017-03-09', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:50:10', '2022-03-03 06:50:10', '2022-03-02 09:49:14', 1, 0, 1, 1, 'true'),
(6, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528106106170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADIBA ALI RAMADHANIA', 'F', 'PAMEKASAN', '2017-06-21', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528106106170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:50:10', '2022-03-03 06:50:10', '2022-03-02 09:47:49', 1, 0, 1, 1, 'true'),
(7, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528136911160000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AFIFAH', 'F', 'MEKKAH', '2016-11-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528136911160000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:50:10', '2022-03-03 06:50:10', '2022-03-02 09:47:49', 1, 0, 1, 1, 'true'),
(8, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528104606170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AHLA SHOFIA HASBY', 'F', 'PAMEKASAN', '2017-06-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528104606170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:50:10', '2022-03-03 06:50:10', '2022-03-02 09:47:49', 1, 0, 1, 1, 'true'),
(9, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528104107170020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALIFA NAZIELA PUTRI', 'F', 'PAMEKASAN', '2017-07-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528104107170020@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:50:10', '2022-03-03 06:50:10', '2022-03-02 09:47:49', 1, 0, 1, 1, 'true'),
(10, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528100907170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALVINO NAZRIL HUSEIN', 'M', 'PAMEKASAN', '2017-07-09', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528100907170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:50:10', '2022-03-03 06:50:10', '2022-03-02 09:47:49', 1, 0, 1, 1, 'true'),
(11, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528112005170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARSEN MAHER MUAQLY', 'M', 'PAMEKASAN', '2017-05-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528112005170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(12, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528105509170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARSYILA SYFA NAFIZA', 'F', 'PAMEKASAN', '2017-09-15', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528105509170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(13, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '352810481216001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AYRA FARZANA MAULIDA', 'F', 'PAMEKASAN', '2016-12-08', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '352810481216001@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(14, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528100805170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AZKA UBAYDILLAH', 'M', 'PAMEKASAN', '2017-05-08', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528100805170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(15, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528104605170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CHELSEA TIARA MAYFAN', 'F', 'PAMEKASAN', '2017-05-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528104605170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(16, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528101008170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FACHRY ABDULLAH', 'M', 'PAMEKASAN', '2017-08-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528101008170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(17, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528104202170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FARSYA HUZAIFA GHAZWANI', 'F', 'PAMEKASAN', '2017-02-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528104202170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(18, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528104103170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INAYATUZ ZAKIYA', 'F', 'PAMEKASAN', '2017-03-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528104103170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(19, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528102605170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. ALI KEMAL', 'M', 'PAMEKASAN', '2017-05-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528102605170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(20, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528100406170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. ARKAN MUNARAK ALFIAN', 'M', 'PAMEKASAN', '2017-06-04', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528100406170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(21, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528101006170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. JUNAIDI NUR RAMADANIA', 'M', 'PAMEKASAN', '2017-06-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528101006170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(22, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528111304170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. SOFYAN HIDAYAT', 'M', 'PAMEKASAN', '2017-04-13', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528111304170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(23, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528100207170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMAD FIQRI RAMADAN', 'M', 'PAMEKASAN', '2017-07-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528100207170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(24, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528100603170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD REVANDI AKBAR', 'M', 'PAMEKASAN', '2017-03-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528100603170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(25, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528104304170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NADA MUHAMMAD ALI ALI .M', 'F', 'PAMEKASAN', '2017-04-03', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528104304170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(26, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528104804170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUTRI SAFARIDATUL HASANAH', 'F', 'PAMEKASAN', '2017-04-08', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528104804170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(27, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528106008170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QIUUMI FIKA ANDZIRI', 'F', 'PAMEKASAN', '2017-08-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528106008170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(28, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528101805170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAIHAN', 'M', 'PAMEKASAN', '2017-05-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528101805170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(29, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528101904170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIZIEQ HANAN SYAMLAN', 'M', 'PAMEKASAN', '2017-04-19', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528101904170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(30, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '3528100905170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SALMAN', 'M', 'PAMEKASAN', '2017-05-09', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '3528100905170000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-02 08:29:40', '2022-03-02 23:51:06', '2022-03-03 06:51:06', NULL, 1, 0, 1, 0, 'true'),
(31, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1995', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADEVA KHEISYA ADITYA', 'F', 'PAMEKASAN', '2017-03-09', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1995@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:33', '2022-03-02 23:52:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1947', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADIBA ALI RAMADHANIA', 'F', 'PAMEKASAN', '2017-06-21', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1947@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1931', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AFIFAH', 'F', 'MEKKAH', '2016-11-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1931@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1953', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AHLA SHOFIA HASBY', 'F', 'PAMEKASAN', '2017-06-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1953@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1944', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALIFA NAZIELA PUTRI', 'F', 'PAMEKASAN', '2017-07-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1944@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1984', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALVINO NAZRIL HUSEIN', 'M', 'PAMEKASAN', '2017-07-09', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1984@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1972', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARSEN MAHER MUAQLY', 'M', 'PAMEKASAN', '2017-05-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1972@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1930', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARSYILA SYFA NAFIZA', 'F', 'PAMEKASAN', '2017-09-15', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1930@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1957', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AYRA FARZANA MAULIDA', 'F', 'PAMEKASAN', '2016-12-08', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1957@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AZKA UBAYDILLAH', 'M', 'PAMEKASAN', '2017-05-08', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1962@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1967', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CHELSEA TIARA MAYFAN', 'F', 'PAMEKASAN', '2017-05-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1967@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(42, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1928', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FACHRY ABDULLAH', 'M', 'PAMEKASAN', '2017-08-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1928@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(43, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1991', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FARSYA HUZAIFA GHAZWANI', 'F', 'PAMEKASAN', '2017-02-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1991@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(44, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1961', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INAYATUZ ZAKIYA', 'F', 'PAMEKASAN', '2017-03-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1961@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(45, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1936', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. ALI KEMAL', 'M', 'PAMEKASAN', '2017-05-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1936@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(46, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1939', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. ARKAN MUNARAK ALFIAN', 'M', 'PAMEKASAN', '2017-06-04', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1939@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(47, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1942', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. JUNAIDI NUR RAMADANIA', 'M', 'PAMEKASAN', '2017-06-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1942@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(48, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1948', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. SOFYAN HIDAYAT', 'M', 'PAMEKASAN', '2017-04-13', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1948@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(49, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMAD FIQRI RAMADAN', 'M', 'PAMEKASAN', '2017-07-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1994@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(50, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1938', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD REVANDI AKBAR', 'M', 'PAMEKASAN', '2017-03-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1938@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(51, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1954', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NADA MUHAMMAD ALI ALI .M', 'F', 'PAMEKASAN', '2017-04-03', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1954@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(52, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUTRI SAFARIDATUL HASANAH', 'F', 'PAMEKASAN', '2017-04-08', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1986@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(53, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1990', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QIUUMI FIKA ANDZIRI', 'F', 'PAMEKASAN', '2017-08-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1990@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(54, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1937', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAIHAN', 'M', 'PAMEKASAN', '2017-05-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1937@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(55, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1935', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIZIEQ HANAN SYAMLAN', 'M', 'PAMEKASAN', '2017-04-19', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1935@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(56, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1980', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SALMAN', 'M', 'PAMEKASAN', '2017-05-09', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1980@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 06:52:34', '2022-03-02 23:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(57, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1985', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ABIDZAR PUTRA FERDIANSYAH', 'M', 'pamekasan', '2017-01-12', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1985@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(58, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1951', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACH SAKHA PRADIPTA RAMADHAN', 'M', 'banyuangi', '2017-01-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1951@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(59, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1993', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADIEVA FAYRUZ SYAKILA', 'F', 'pamekasan', '2016-08-31', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1993@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(60, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1955', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALIF NURMAHMUDI', 'M', 'pamekasan', '2017-03-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1955@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(61, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1914', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARVY ASSYAWAL NASUTION', 'M', 'pamekasan', '2016-07-11', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1914@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(62, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1989', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AYSILA DILARA ALINARROHMAN', 'F', 'pamekasan', '2016-06-27', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1989@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(63, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AZKA MUHAMMAD ALI', 'M', 'pamekasan', '2017-01-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2003@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(64, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DHAFITHA NIZZA', 'F', 'pamekasan', '2016-09-13', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1960@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(65, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1959', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ELIEF HELWAH', 'F', 'pamekasan', '2016-03-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1959@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(66, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1945', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FAWAIZUL ISLAM', 'M', 'pamekasan', '2016-11-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1945@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(67, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1950', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKMAL ATHALLAH HIDAYAT', 'M', 'pamekasan', '2017-01-19', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1950@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(68, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IMAM NABIEL NAJMI ALGHAZALI', 'M', 'pamekasan', '2017-01-25', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1988@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(69, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KAYLA OCTAVIA LESTARI', 'F', 'pamekasan', '2016-10-08', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2001@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(70, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MALIKA KARIMATUL RIZQIYAH', 'F', 'pamekasan', '2016-11-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1946@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(71, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1949', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH ZAMIL ALFIANSYAH BAHRI', 'M', 'pamekasan', '2017-08-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1949@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(72, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH.RISKU MAHARDIKA', 'M', 'pamekasan', '2017-03-25', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1979@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(73, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1943', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMED GISAKA AL AYYUBI', 'M', 'pamekasan', '2017-03-04', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1943@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(74, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD OZIL EL BARRAK', 'M', 'pamekasan', '2017-02-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1940@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(75, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NABHAN ABRARUZ SABIL', 'M', 'jakarta', '2016-12-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1923@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(76, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NOR TAQIYA CHAIRANNISA', 'F', 'pamekasan', '2016-12-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1934@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(77, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1975', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NORIL LATIFAH', 'F', 'pamekasan', '2016-05-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1975@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(78, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1933', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NUR ZAQEELA AZZALEA', 'F', 'pamekasan', '2016-09-27', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1933@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(79, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QUTRUN NADA SALSABILA', 'F', 'pamekasan', '2016-03-12', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1977@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(80, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1941', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAIHANA RAMZA', 'F', 'pamekasan', '2016-10-03', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1941@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(81, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAUF ATHARIYANDI PARANTO', 'M', 'surakarta', '2016-12-03', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1932@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(82, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1963', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REZA ALFARIZY', 'M', 'pamekasan', '2016-12-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1963@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:27:55', '2022-03-03 00:27:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(83, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ABDULLAH HAFIZ DHIAURRAHMAN', 'M', 'pamekasan', '2016-07-12', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1869@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(84, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1837', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACH GHAZI AL-GHIFARI', 'M', 'pamekasan', '2016-11-14', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1837@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(85, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADILA NISA AFIFAH', 'F', 'pamekasan', '2016-03-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1996@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(86, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1952', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIDAN HAFIZH AHSAN', 'M', 'pamekasan', '2016-11-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1952@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(87, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1840', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AISYAH  SYAFIQAH AR RAHMAN', 'F', 'pamekasan', '2016-08-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1840@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(88, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AISYAH AYUDIA INARA ALFAREET', 'F', 'pamekasan', '2016-03-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1987@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(89, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AKIFA AYUDIA INARA', 'F', 'pamekasan', '2016-04-30', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1911@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(90, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALMEER ALSHEIREZY SYAMLAN', 'M', 'pamekasan', '2016-11-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1999@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(91, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1973', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARKANUL ISLAM', 'M', 'pamekasan', '2016-09-07', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1973@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(92, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1862', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DWI ANASTA SYAKILA', 'F', 'pamekasan', '2016-03-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1862@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(93, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EKA APRILIA ARRHISA HIDAYAT', 'F', 'pamekasan', '2016-04-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1970@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(94, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FAYZA KULLA AZMINA', 'F', 'bekasi', '2016-05-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2004@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(95, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IBAS RAFFIT ROMADHONA', 'M', 'pamekasan', '2016-07-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2002@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(96, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1921', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JINAN HUMAIRAH SYAMLAN', 'F', 'pamekasan', '2016-06-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1921@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(97, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KHADAFI MUHAMMAD ALFAREZI', 'M', 'bandung', '2016-09-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1997@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(98, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MALIK IBRAHIM', 'M', 'pamekasan', '2016-10-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2000@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(99, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1865', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOCH IDRIS MAULIDI SYAFI’I', 'M', 'pamekasan', '2016-02-14', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1865@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(100, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH SYAIFAL ALI', 'M', 'pamekasan', '2016-07-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1968@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(101, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. WALIYYUL HASAN', 'M', 'pamekasan', '2017-07-14', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1976@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(102, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1864', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMAD LUAY MOSTOFA ALFARISI', 'M', 'pamekasan', '2016-08-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1864@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(103, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1982', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD ZIDAN LATIF', 'M', 'pamekasan', '2016-09-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1982@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(104, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NAJWA SHAKILA SAMHARI', 'F', 'pamekasan', '2016-05-15', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1978@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(105, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SITI NURIZAH ANDINI', 'F', 'pamekasan', '2016-05-30', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1870@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(106, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1830', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZAHIRA NADHIFAH', 'F', 'pamekasan', '2016-06-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1830@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(107, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1838', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZARA HAZALINA MUCHTAR', 'F', 'pamekasan', '2016-06-14', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1838@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(108, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH. IZY ZAFRAN ALFARISY', 'M', 'pamekasan', '2017-07-31', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2007@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(109, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FIONA ADELIA FAUZI', 'F', 'surabaya', '2016-01-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2014@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 07:47:05', '2022-03-03 00:47:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(110, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1892', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADE RISTY OKTAVIA', 'F', 'pamekasan', '2016-10-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1892@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:08:59', '2022-03-03 01:08:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(111, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1885', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADIVA ASHFIN AL-HASAN', 'F', 'pamekasan', '2016-03-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1885@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:08:59', '2022-03-03 01:08:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(112, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1992', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AFIFA AFRA NAYLA', 'F', 'pamekasan', '2016-01-21', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1992@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:08:59', '2022-03-03 01:08:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(113, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1958', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALBY LUTHFY FAHRY', 'M', 'pamekasan', '2016-03-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1958@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:08:59', '2022-03-03 01:08:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(114, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1965', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALBY ZAYAN ADSKHAN MAULANA', 'M', 'pamekasan', '2016-05-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1965@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:08:59', '2022-03-03 01:08:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(115, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1881', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALKHALIFI GAVRIEL HABIBI', 'M', 'pamekasan', '2015-12-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1881@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:08:59', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(116, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AMELIATUS SHOLEHAH', 'F', 'pamekasan', '2016-05-13', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1847@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(117, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1833', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FARAH ALFADIYAH', 'F', 'pamekasan', '2016-02-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1833@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(118, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1874', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FATIH JUNDULLAH KHOIR', 'M', 'pamekasan', '2016-03-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1874@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(119, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1844', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KANAYA MEILINDA PUTERI', 'F', 'pamekasan', '2016-05-04', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1844@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(120, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1902', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KHOIR AL FAYYADH NAILUN NABHAN', 'M', 'pamekasan', '2016-04-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1902@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(121, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MAULANA MALIK IBRAHIM', 'M', 'jember', '2016-06-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1919@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(122, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1851', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH AZBIN SHIDKI FAHRIYAN', 'M', 'pamekasan', '2016-05-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1851@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(123, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1922', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMAD BARQI ABBASY', 'M', 'pamekasan', '2016-04-21', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1922@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(124, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1983', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD JIBRIL', 'M', 'pamekasan', '2016-06-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1983@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(125, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1966', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD RAYYAN', 'M', 'pamekasan', '2016-05-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1966@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(126, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1887', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NUSAIBAH RAQIQA SALAM', 'F', 'pamekasan', '2016-01-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1887@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(127, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUTRI ZAZKIYA SALSABILA', 'F', 'pamekasan', '2016-05-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1832@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(128, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1969', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RADEN AKHADI WIRA SATRIYADI', 'M', 'pamekasan', '2016-06-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1969@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(129, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1852', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIDHA SHAFIRA SALSABILA', 'F', 'pamekasan', '2016-03-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1852@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(130, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIFQI ALI ARROZIKI', 'M', 'pamekasan', '2015-02-14', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1903@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(131, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1882', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SAYYAR YAHYA ALI', 'M', 'pamekasan', '2016-07-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1882@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(132, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1853', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SHAFWA L ZAM-ZAMI', 'F', 'pamekasan', '2016-01-22', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1853@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(133, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1889', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WARDATUL FIRDAUSI', 'F', 'pamekasan', '2016-03-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1889@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(134, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1842', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZAFRAN ALFARENDRA S.Q', 'M', 'pamekasan', '2016-07-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1842@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(135, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZAVIERA NAURA NAJAY', 'F', 'bojonogoro', '2016-03-02', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1971@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:09:00', '2022-03-03 01:09:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(136, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1901', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACHMAD BALYA MALKAN', 'M', 'pamekasan', '2016-05-27', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1901@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(137, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1926', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADAM ALFAIZI', 'M', 'pamekasan', '2016-04-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1926@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(138, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1857', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADILA NISA ARDANI', 'F', 'jember', '2015-08-16', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1857@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(139, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1879', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIFIQA AULIA AZZAHRA', 'F', 'pamekasan', '2016-09-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1879@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(140, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1964', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALBY FAHRY', 'M', 'pamekasan', '2016-05-21', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1964@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(141, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1868', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AQIFA NAYLA CAHYA', 'F', 'pamekasan', '2016-02-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1868@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(142, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1854', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AZRIEL PUTRA NOER IMAMAH', 'M', 'pamekasan', '2016-06-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1854@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(143, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1858', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BILQIS HUMAIRAH MAJA BHETARI', 'F', 'pamekasan', '2015-12-15', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1858@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(144, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1904', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FATHAN AMIN', 'M', 'pamekasan', '2015-12-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1904@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(145, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FATIMAH AZZAHROH', 'F', 'pamekasan', '2015-12-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1909@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(146, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1861', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAIDAR ALI SYARIF', 'M', 'pamekasan', '2015-12-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1861@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(147, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1863', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KAESANG KARAMATTLLAH AMIN', 'M', 'pamekasan', '2016-04-25', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1863@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(148, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1918', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KEISHA AURELIA FARISHA', 'F', 'pamekasan', '2015-01-22', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1918@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(149, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1924', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KHANZA ASSYFA INAYATILLAH', 'F', 'pamekasan', '2016-01-03', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1924@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(150, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MAULIDATUL HASANAH', 'F', 'pamekasan', '2016-01-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1906@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(151, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH AL MALIKI', 'M', 'pamekasan', '2016-01-27', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1860@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(152, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1846', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH ATHOILLAH AL ANWARI', 'M', 'pamekasan', '2015-12-11', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1846@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(153, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1855', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH FIRZIL ADHIM MAULANA A.A', 'M', 'pamekasan', '2016-07-13', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1855@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(154, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH MAULANA ILYAS', 'M', 'pamekasan', '2016-03-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1920@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(155, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1891', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMAD DEVA AL GAZALI', 'M', 'pamekasan', '2016-02-15', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1891@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(156, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1895', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD ARRASYID AL-FATIH ZAIN', 'M', 'pamekasan', '2016-05-11', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1895@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(157, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1836', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD FARAND', 'M', 'pamekasan', '2016-05-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1836@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(158, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD MAHRUS ALI HUSEIN', 'M', 'jember', '2016-02-19', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1998@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(159, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1831', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NADIRA AZZAHRA', 'F', 'pamekasan', '2015-12-27', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1831@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(160, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SHERILYA ANINDYA IVANNA', 'F', 'pamekasan', '2016-02-19', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1880@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(161, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZAFIRA', 'F', 'pamekasan', '2015-12-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1897@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:34:07', '2022-03-03 01:34:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(162, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1839', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADRIYAN PRADIPTA AFANDI', 'M', 'pamekasan', '2015-11-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1839@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(163, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1876', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AISHA SILMY YUSUFI KAMIL', 'F', 'pamekasan', '2015-11-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1876@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(164, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AISYAH ALESHA SALSABILA', 'F', 'tanggerang', '2015-08-10', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1890@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(165, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1913', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AISYAH FITRI NADIFAH', 'F', 'pamekasan', '2015-09-12', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1913@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(166, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AKIFA NAYLA MULYA', 'F', 'pamekasan', '2015-10-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1850@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(167, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1905', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALYA CALISTA', 'F', 'pamekasan', '2015-09-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1905@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(168, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1866', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALYA ZIZAH', 'F', 'pamekasan', '2015-09-19', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1866@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(169, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1849', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GHAITSANA KHANZA AZZAHRA', 'F', 'pamekasan', '2015-10-28', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1849@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(170, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ILHAM MANZIL', 'M', 'pamekasan', '2015-09-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2005@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(171, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LUTFILLAH SAMSUL ARIFIN', 'M', 'pamekasan', '2015-11-01', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1900@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(172, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1886', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMAD MANSYUR TOYYIB ZAINI', 'M', 'pamekasan', '2015-11-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1886@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(173, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1875', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUH ADITIYA PRATAMA', 'M', 'pamekasan', '2015-09-28', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1875@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(174, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1912', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUH ADITYA ALI MUHSIN', 'M', 'pamekasan', '2015-10-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1912@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(175, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1825', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUH HADARIKUR RAHMAN', 'M', 'pamekasan', '2015-10-16', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1825@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(176, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUH NIYAS', 'M', 'pamekasan', '2015-11-07', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1877@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(177, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD AWFAGUSTINO', 'M', 'pamekasan', '2015-08-27', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1898@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(178, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1843', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD FATIR ALI GIBRAN', 'M', 'pamekasan', '2015-10-22', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1843@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(179, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD UMAR FARUQ', 'M', 'pamekasan', '2015-06-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1878@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(180, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1845', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUTRI MIRANTI HERMAWAN', 'F', 'pamekasan', '2015-09-30', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1845@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(181, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1827', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SAKINAH', 'F', 'pamekasan', '0205-12-12', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1827@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(182, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SYAHIRUL ALIM', 'M', 'pamekasan', '2015-08-07', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1764@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(183, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1884', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAHYU SULTHAN MUHAMMAD', 'M', 'pamekasan', '2015-12-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1884@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(184, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1872', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YASMIN NADIYATUL HAQ', 'F', 'pamekasan', '2015-09-04', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1872@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(185, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1835', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZAFINA RUSYDI', 'F', 'pamekasan', '2015-11-26', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1835@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 08:55:00', '2022-03-03 01:55:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(186, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1927', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADIBA SYAKILA', 'F', 'purwakrta', '2015-05-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1927@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(187, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AHMAD GHUFFRON ZEEN', 'M', 'pamekasan', '2015-06-15', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1751@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(188, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1894', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AHMAD SULTON NASIRUL ASROFI', 'M', 'pamekasan', '2015-05-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1894@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(189, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AISYAH HELMY DOMAN', 'F', 'pamekasan', '2015-10-19', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1829@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(190, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1776', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALIA NAJWAH', 'F', 'pamekasan', '2015-08-11', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1776@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(191, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1859', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALVAN RAMADANI', 'M', 'pamekasan', '2015-06-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1859@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(192, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1802', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AMEERAH AZALIYA  RAHMAN', 'F', 'pamekasan', '2015-07-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1802@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(193, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1916', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FINA QUDDRATUN NADA', 'F', 'pamekasan', '2015-09-07', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1916@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(194, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1915', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH ALFIN AL FATIH', 'M', 'pamekasan', '2015-06-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1915@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(195, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH ARIEF HIDAYATULLAH', 'M', 'pamekasan', '2015-03-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1748@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(196, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1790', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH FADFLI', 'M', 'pamekasan', '2015-05-04', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1790@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(197, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1750', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH FATAN JAMIL', 'M', 'pamekasan', '2015-03-21', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1750@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(198, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHAMMAD FATHIR ZAIN AL AMIN', 'M', 'pamekasan', '2015-03-29', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1899@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(199, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUH DAFA IBNU HAFIDZ', 'M', 'pamekasan', '2015-06-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1883@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(200, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUH KHAIRUL BUSTAMI', 'M', 'pamekasan', '2015-06-23', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1888@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(201, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1786', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD ALI MASYKUR', 'M', 'pamekasan', '2016-02-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1786@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(202, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1867', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NAILUL HAFIDZOH ALFIN', 'F', 'pamekasan', '2015-08-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1867@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(203, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1784', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NAYLA SAFIRA MAHARANI', 'F', 'pamekasan', '2015-05-05', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1784@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(204, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUTI AQILA', 'F', 'pamekasan', '2015-07-24', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1917@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(205, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1893', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIKI GHALIBI AKBAR', 'M', 'pamekasan', '2015-07-20', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1893@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(206, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1774', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIYADH JINAN FAYI', 'M', 'pamekasan', '2015-04-18', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1774@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(207, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1896', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TALIYA SHOHIFAH', 'F', 'pamekasan', '2015-07-17', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1896@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(208, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '1910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZAHIRA', 'F', 'jeddah', '2015-08-06', 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1910@TK ABA.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2022-03-03 09:10:33', '2022-03-03 02:10:33', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2021-03-24 06:57:51', '2021-03-23 23:57:51', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2021-03-24 06:57:51', '2021-03-23 23:57:51', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2021-03-24 06:57:51', '2021-03-23 23:57:51', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'sekilas-info', 'sekilas-info', '2021-11-24 08:34:00', '2021-11-24 01:34:00', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'false', '2021-03-24 06:57:49', '2021-11-23 02:15:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Blue_sky', 'blue_sky', 'Anton Sofyan', 'true', '2021-03-24 06:57:49', '2022-02-16 15:26:21', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'Anton Sofyan', 'false', '2021-03-24 06:57:49', '2021-11-23 02:21:30', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text DEFAULT NULL,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'administrator', '$2y$10$fncKPww1IT96E5moEpoX/OLq2rgXQwHS1khou6feR7Z39j6s5Kexq', 'Administrator', 'admin@admin.com', 'sekolahku.web.id', 0, 'super_user', NULL, NULL, NULL, NULL, 'true', '2022-03-04 01:46:28', '::1', '2021-03-24 06:57:48', '2022-03-04 00:46:28', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, '123.123', '$2y$10$rSbf7PrF4fh0G7kbFUrqT.kRIxH5xmlxoMMMnpkRf9cjPat0ajbyi', 'MOH BAIHAKI', '123.123@smkpbwaru.sch.id', NULL, 0, 'student', 1, NULL, NULL, NULL, 'false', NULL, NULL, '2022-02-16 23:19:40', '2022-03-01 12:40:22', '2022-03-01 19:40:22', NULL, 1, 0, 1, 0, 'true'),
(3, '3528104211800001', '$2y$10$CMa5.u7jyaEL4ybyPUuYYe8ltC6HWkH2XU/ThIETvtg0WyiN5df4a', 'DEASY FERANTIKA', '3528104211800001@TK ABA.sch.id', NULL, 0, 'employee', 7, NULL, NULL, NULL, 'false', NULL, NULL, '2022-03-04 07:48:33', '2022-03-04 00:48:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, '3528106202940002', '$2y$10$xFQYTreOxIEq.RZP5ueKXOwUHuN8bCXK61e0UH9o/VUrziVw3RASC', 'FERIYAL MUSYAFFIRAH', '3528106202940002@TK ABA.sch.id', NULL, 0, 'employee', 8, NULL, NULL, NULL, 'false', NULL, NULL, '2022-03-04 07:48:37', '2022-03-04 00:48:37', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `module_id` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('5m51mm1kc6iks947ubplrfli8c6ghpru', '127.0.0.1', 1646354135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363335333935303b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032312d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a383a223639383539363439223b7363686f6f6c5f6e616d657c733a32373a22544b2041697379697961682042757374616e756c2041746668616c223b686561646d61737465727c733a31313a22416c696d61682c732e7064223b686561646d61737465725f70686f746f7c733a33363a2263386636663639316365303836623766303930303136386131656339633732322e6a7067223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313132223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323032312d30332d3234223b7461676c696e657c733a393a222e2e2e2e2e2e2e2e2e223b72747c733a313a222d223b72777c733a313a222d223b7375625f76696c6c6167657c733a31303a22546f62616c616e672033223b76696c6c6167657c733a31303a2257617275204261726174223b7375625f64697374726963747c733a343a2257617275223b64697374726963747c733a393a2270616d656b6173616e223b706f7374616c5f636f64657c733a353a223639333533223b7374726565745f616464726573737c733a32303a224a6c2e544c414e47492057415255204241524154223b70686f6e657c733a313a222d223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a22746b616261776172753140676d61696c2e636f6d223b776562736974657c733a32343a22687474703a2f2f7777772e544b204142412e7363682e6964223b6c6f676f7c733a33363a2237333334666437653137346161353039326164366538313961336465623363632e6a7067223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303230223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032312d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032312d30372d3230223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032312d30372d3331223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032312d30372d3235223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a383a22626c75655f736b79223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d746f6b656e7c733a33323a223333643332363730326162306430666632376335666236376461396464353339223b637372665f746f6b656e7c733a33323a223333643332363730326162306430666632376335666236376461396464353339223b),
('gbtnpec3vn92ep1eltven9arl1r2at6d', '127.0.0.1', 1646353950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363335333935303b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032312d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a383a223639383539363439223b7363686f6f6c5f6e616d657c733a32373a22544b2041697379697961682042757374616e756c2041746668616c223b686561646d61737465727c733a31313a22416c696d61682c732e7064223b686561646d61737465725f70686f746f7c733a33363a2263386636663639316365303836623766303930303136386131656339633732322e6a7067223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313132223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323032312d30332d3234223b7461676c696e657c733a393a222e2e2e2e2e2e2e2e2e223b72747c733a313a222d223b72777c733a313a222d223b7375625f76696c6c6167657c733a31303a22546f62616c616e672033223b76696c6c6167657c733a31303a2257617275204261726174223b7375625f64697374726963747c733a343a2257617275223b64697374726963747c733a393a2270616d656b6173616e223b706f7374616c5f636f64657c733a353a223639333533223b7374726565745f616464726573737c733a32303a224a6c2e544c414e47492057415255204241524154223b70686f6e657c733a313a222d223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a22746b616261776172753140676d61696c2e636f6d223b776562736974657c733a32343a22687474703a2f2f7777772e544b204142412e7363682e6964223b6c6f676f7c733a33363a2237333334666437653137346161353039326164366538313961336465623363632e6a7067223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303230223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032312d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032312d30372d3230223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032312d30372d3331223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032312d30372d3235223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a383a22626c75655f736b79223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a303b),
('8bd07nakc0cskfrp9281in0na1lne7pd', '::1', 1646354921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363335343734303b746f6b656e7c733a33323a223131646134656436323733393734313131303631393462326664333161313361223b637372665f746f6b656e7c733a33323a223131646134656436323733393734313131303631393462326664333161313361223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032312d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a383a223639383539363439223b7363686f6f6c5f6e616d657c733a32373a22544b2041697379697961682042757374616e756c2041746668616c223b686561646d61737465727c733a31313a22416c696d61682c732e7064223b686561646d61737465725f70686f746f7c733a33363a2263386636663639316365303836623766303930303136386131656339633732322e6a7067223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313132223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323032312d30332d3234223b7461676c696e657c733a393a222e2e2e2e2e2e2e2e2e223b72747c733a313a222d223b72777c733a313a222d223b7375625f76696c6c6167657c733a31303a22546f62616c616e672033223b76696c6c6167657c733a31303a2257617275204261726174223b7375625f64697374726963747c733a343a2257617275223b64697374726963747c733a393a2270616d656b6173616e223b706f7374616c5f636f64657c733a353a223639333533223b7374726565745f616464726573737c733a32303a224a6c2e544c414e47492057415255204241524154223b70686f6e657c733a313a222d223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a22746b616261776172753140676d61696c2e636f6d223b776562736974657c733a32343a22687474703a2f2f7777772e544b204142412e7363682e6964223b6c6f676f7c733a33363a2237333334666437653137346161353039326164366538313961336465623363632e6a7067223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303230223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032312d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032312d30372d3230223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032312d30372d3331223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032312d30372d3235223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a383a22626c75655f736b79223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indeks untuk tabel `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indeks untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indeks untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_nik__idx` (`nik`) USING BTREE,
  ADD KEY `employees_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `employees_email__idx` (`email`) USING BTREE,
  ADD KEY `employees_religion_id__idx` (`religion_id`) USING BTREE,
  ADD KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE,
  ADD KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE,
  ADD KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE,
  ADD KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE,
  ADD KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE,
  ADD KEY `employees_rank_id__idx` (`rank_id`) USING BTREE,
  ADD KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE,
  ADD KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE,
  ADD KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE;

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indeks untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indeks untuk tabel `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indeks untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indeks untuk tabel `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indeks untuk tabel `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indeks untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_identity_number__idx` (`identity_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE,
  ADD KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE,
  ADD KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE;

--
-- Indeks untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indeks untuk tabel `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indeks untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indeks untuk tabel `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indeks untuk tabel `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT untuk tabel `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
