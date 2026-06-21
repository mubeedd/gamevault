-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2026 pada 11.55
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamevault_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_order` varchar(15) DEFAULT NULL,
  `id_game` varchar(10) DEFAULT NULL,
  `jumlah` int(11) DEFAULT 1,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_order`, `id_game`, `jumlah`, `subtotal`) VALUES
(1, 'TRX-001', NULL, 1, 600000),
(2, 'TRX-002', NULL, 1, 700000),
(3, 'TRX-003', NULL, 1, 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `game`
--

CREATE TABLE `game` (
  `id_game` varchar(10) NOT NULL,
  `judul_game` varchar(100) NOT NULL,
  `id_kategori` varchar(10) DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `stok_key` int(11) DEFAULT 0,
  `deskripsi` text DEFAULT NULL,
  `gambar_game` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `game`
--

INSERT INTO `game` (`id_game`, `judul_game`, `id_kategori`, `harga`, `stok_key`, `deskripsi`, `gambar_game`) VALUES
('GM-001', 'Cyberpunk2077', 'CAT-02', 200000, 10, 'Game masa depan', 'GM-001_1782033497.jpg'),
('GM-002', 'Elden Ring', 'CAT-02', 450000, 12, 'souls like ', 'GM-002_1782033571.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`) VALUES
('CAT-01', 'Action', '2026-06-13 06:31:38'),
('CAT-02', 'RPG', '2026-06-13 06:31:38'),
('CAT-03', 'Voucher/Topup', '2026-06-13 06:31:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_toko`
--

CREATE TABLE `pengaturan_toko` (
  `id` int(11) NOT NULL,
  `nama_toko` varchar(100) NOT NULL DEFAULT 'GameVault',
  `email_kontak` varchar(100) DEFAULT NULL,
  `nomor_wa` varchar(20) DEFAULT NULL,
  `deskripsi_toko` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaturan_toko`
--

INSERT INTO `pengaturan_toko` (`id`, `nama_toko`, `email_kontak`, `nomor_wa`, `deskripsi_toko`) VALUES
(1, 'GameVault', 'admin@gamevault.com', '', 'Toko digital game dan voucher top-up terpercaya.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_order` varchar(15) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT current_timestamp(),
  `total_bayar` int(11) NOT NULL,
  `status_order` enum('Pending','Selesai','Batal') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_order`, `id_user`, `tanggal_transaksi`, `total_bayar`, `status_order`) VALUES
('TRX-001', 'USR-02', '2026-06-13 10:00:00', 600000, 'Selesai'),
('TRX-002', 'USR-03', '2026-06-13 11:15:00', 700000, 'Pending'),
('TRX-003', 'USR-04', '2026-06-13 12:30:00', 850000, 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Customer') DEFAULT 'Customer',
  `status` enum('Aktif','Banned') DEFAULT 'Aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `email`, `password`, `role`, `status`, `created_at`) VALUES
('USR-01', 'admin', 'admin@gamevault.com', 'admin123', 'Admin', 'Aktif', '2026-06-13 06:31:38'),
('USR-02', 'budi_gamer', 'budi@gmail.com', 'budi123', 'Customer', 'Aktif', '2026-06-13 06:31:38'),
('USR-03', 'siti_play', 'siti@gmail.com', 'siti123', 'Customer', 'Aktif', '2026-06-13 06:31:38'),
('USR-04', 'agus_pro', 'agus@gmail.com', 'agus123', 'Customer', 'Aktif', '2026-06-13 06:31:38');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_game` (`id_game`);

--
-- Indeks untuk tabel `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id_game`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pengaturan_toko`
--
ALTER TABLE `pengaturan_toko`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengaturan_toko`
--
ALTER TABLE `pengaturan_toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `transaksi` (`id_order`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
