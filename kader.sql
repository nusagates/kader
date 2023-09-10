-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 10 Sep 2023 pada 06.55
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kader`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `joblists`
--

CREATE TABLE `joblists` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `joblists`
--

INSERT INTO `joblists` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tidak bekerja (Di rumah saja)', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(2, 'Pensiunan', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(3, 'PNS Kementerian/Lembaga/Pemda', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(4, 'TNI/Polisi', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(5, 'Guru/Dosen', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(6, 'Pegawai Swasta', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(7, 'Pengusaha/Wiraswasta', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(8, 'Pengacara/Hakim/Jaksa/Notaris', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(9, 'Seniman/Pelukis/Artis/Sejenis', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(10, 'Dokter/Bidan/Perawat', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(11, 'Pilot/Pramugari', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(12, 'Pedagang', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(13, 'Petani/Peternak', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(14, 'Nelayan', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(15, 'Buruh (Tani/Pabrik/Bangunan)', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(16, 'Sopir/Masinis/Kondektur', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(17, 'Politikus', '2023-09-10 02:32:04', '2023-09-10 02:32:04'),
(18, 'Lainnya', '2023-09-10 02:32:04', '2023-09-10 02:32:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `members`
--

CREATE TABLE `members` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `nik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `legal_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('Pria','Wanita') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('Belum Menikah','Menikah','Cerai Hidup','Cerai Mati') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` enum('Tidak Sekolah','RA','TK','MI','SD','SLTP','SLTA','D1','D2','D3','D4','S1','S2','S3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` enum('A','B','AB','O') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income` double NOT NULL DEFAULT '0',
  `postal` json DEFAULT NULL,
  `address` json NOT NULL,
  `status` enum('submitted','active','inactive','deceased','suspended','dismissed','transferred') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submitted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `members`
--

INSERT INTO `members` (`id`, `user_id`, `nik`, `legal_name`, `phone`, `email`, `display_name`, `initial`, `gender`, `marital_status`, `education`, `blood_group`, `pob`, `dob`, `job`, `income`, `postal`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '5624543', 'Hada Nurusshofa', '0979878787', 'nusagates@gmail.com', NULL, 'Cak Bud', 'Pria', 'Menikah', 'S1', 'AB', 'Bojonegoro', '2023-09-10', 'Dokter/Bidan/Perawat', 0, '{\"postal\": \"50721\", \"village\": \"Mangunsari\", \"latitude\": -7.3369427682435, \"longitude\": 110.49295230221}', '{\"rt\": \"001\", \"rw\": \"003\", \"street\": \"Klampeyan RT 01 RW 03\\nNoborejo - Argomulyo\"}', 'active', '2023-09-10 03:57:43', '2023-09-10 04:44:23'),
(3, NULL, '562454333', 'Kevin Muzakka', '0979878787', 'nusagates@gmail.com', NULL, 'Cak Bud', 'Pria', 'Menikah', 'SLTA', 'O', 'Bojonegoro', '2023-09-10', 'TNI/Polisi', 0, '{\"postal\": \"50722\", \"village\": \"Dukuh\", \"latitude\": -7.3395051764842, \"longitude\": 110.4836775416}', '{\"rt\": \"001\", \"rw\": \"003\", \"street\": \"Klampeyan RT 01 RW 03\\nNoborejo - Argomulyo\"}', 'active', '2023-09-10 03:59:41', '2023-09-10 04:44:09'),
(4, NULL, '562454388', 'Ahmad Budairi', '0979878787', 'nusagates@gmail.com', NULL, 'Cak Bud', 'Pria', 'Menikah', 'S1', 'AB', 'Bojonegoro', '2023-09-10', 'Dokter/Bidan/Perawat', 0, '{\"postal\": \"50721\", \"village\": \"Mangunsari\", \"latitude\": -7.3369427682435, \"longitude\": 110.49295230221}', '{\"rt\": \"001\", \"rw\": \"003\", \"street\": \"Klampeyan RT 01 RW 03\\nNoborejo - Argomulyo\"}', 'active', '2023-09-10 03:57:43', '2023-09-10 04:15:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_10_080133_create_postals_table', 2),
(7, '2023_09_10_080131_create_postals_table', 3),
(8, '2023_09_10_080133_create_joblists_table', 3),
(13, '2023_09_10_080134_create_members_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `postals`
--

CREATE TABLE `postals` (
  `postal` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `village` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `postals`
--

INSERT INTO `postals` (`postal`, `village`, `latitude`, `longitude`) VALUES
('50723', 'Kecandran', -7.3284770305907, 110.47649245638),
('50722', 'Dukuh', -7.3395051764842, 110.4836775416),
('50721', 'Mangunsari', -7.3369427682435, 110.49295230221),
('50724', 'Kalicacing', -7.3310708565704, 110.5017157805);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Budairi', 'budairi.contact@gmail.com', '082225005825', NULL, '$2y$10$hcdv7LAS.LkLbHWR0L5ZAuG8r7PPrY5Rwdjw4xdAOumjrzo1qy7Qu', '2I2I9EPEk7F4O8OfPEkZfkHMvEVXDwyl8xahvLSIKlXIBu2T4X4GjPJi57jA', '2023-09-09 18:00:09', '2023-09-09 18:00:09'),
(2, 'Kevin Muzakka 1', 'kevin@gmail.com', '08778877867', NULL, '$2y$10$SEja0cN4HlJKk5dnWQ/RZOxoJBDfVrlliW/Qjgvxl8G.5j6qpuA/e', NULL, '2023-09-09 19:06:17', '2023-09-09 19:21:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `joblists`
--
ALTER TABLE `joblists`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_nik_unique` (`nik`),
  ADD UNIQUE KEY `members_user_id_unique` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `joblists`
--
ALTER TABLE `joblists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
