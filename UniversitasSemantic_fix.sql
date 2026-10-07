-- UniversitasSemantic (versi perbaikan, aman diimpor berulang kali)
-- Tabel lama dihapus dulu supaya tidak muncul error #1050 "already exists"

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `presensi_kelas`;
DROP TABLE IF EXISTS `nilai_mahasiswa`;
DROP TABLE IF EXISTS `mahasiswa`;
DROP TABLE IF EXISTS `program_studi`;
DROP TABLE IF EXISTS `fakultas`;

-- --------------------------------------------------------
-- Tabel fakultas
-- --------------------------------------------------------
CREATE TABLE `fakultas` (
  `kode_fakultas` varchar(10) NOT NULL,
  `nama_fakultas` varchar(100) NOT NULL,
  `kode_universitas` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `fakultas` (`kode_fakultas`, `nama_fakultas`, `kode_universitas`) VALUES
('EKO', 'Ekonomi', 'UMB'),
('HUK', 'Hukum', 'UMB'),
('TEK', 'Teknik', 'UMB');

-- --------------------------------------------------------
-- Tabel program_studi
-- --------------------------------------------------------
CREATE TABLE `program_studi` (
  `kode_prodi` varchar(10) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `kode_fakultas` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT 'prodi123',
  PRIMARY KEY (`kode_prodi`),
  KEY `fk_prodi_fakultas` (`kode_fakultas`),
  CONSTRAINT `fk_prodi_fakultas` FOREIGN KEY (`kode_fakultas`) REFERENCES `fakultas` (`kode_fakultas`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `program_studi` (`kode_prodi`, `nama_prodi`, `kode_fakultas`, `password`) VALUES
('MJ', 'Manajemen', 'EKO', 'prodi123'),
('SI', 'Sistem Informasi', 'TEK', 'prodi123'),
('TI', 'Teknik Informatika', 'TEK', 'prodi123');

-- --------------------------------------------------------
-- Tabel mahasiswa
-- --------------------------------------------------------
CREATE TABLE `mahasiswa` (
  `npm` varchar(15) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  PRIMARY KEY (`npm`),
  KEY `fk_mahasiswa_prodi` (`kode_prodi`),
  CONSTRAINT `fk_mahasiswa_prodi` FOREIGN KEY (`kode_prodi`) REFERENCES `program_studi` (`kode_prodi`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `mahasiswa` (`npm`, `nama_mahasiswa`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `tanggal_masuk`, `alamat`, `password`, `kode_prodi`) VALUES
('2023010001', 'Raka Pratama', 'L', 'Bengkulu', '2005-05-09', '2023-08-01', 'Jl. Melati No. 21, Bengkulu', 'raka2023', 'TI'),
('2023010002', 'Nadia Putri', 'P', 'Argamakmur', '2004-12-03', '2023-08-01', 'Jl. Anggrek No. 7, Argamakmur', 'nadia456', 'TI'),
('2023010003', 'Fikri Hakim', 'L', 'Kepahiang', '2005-02-17', '2023-08-01', 'Jl. Kenanga No. 15, Kepahiang', 'fikri789', 'SI'),
('2023010004', 'Salsabila Azzahra', 'P', 'Padang', '2005-09-28', '2023-08-01', 'Jl. Cempaka No. 4, Bengkulu', 'salsa101', 'MJ');

-- --------------------------------------------------------
-- Tabel nilai_mahasiswa
-- --------------------------------------------------------
CREATE TABLE `nilai_mahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npm` varchar(15) NOT NULL,
  `kode_mk` varchar(10) NOT NULL,
  `nilai_akhir` decimal(5,2) DEFAULT NULL,
  `grade` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nilai_npm` (`npm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Tabel presensi_kelas
-- --------------------------------------------------------
CREATE TABLE `presensi_kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npm` varchar(15) NOT NULL,
  `kode_mk` varchar(10) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `status` enum('H','I','S','A') NOT NULL DEFAULT 'H',
  PRIMARY KEY (`id`),
  KEY `idx_presensi_npm` (`npm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
