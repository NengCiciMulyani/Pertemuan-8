-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Nov 2023 pada 03.59
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kddosen` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `Alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kddosen`, `nama`, `Alamat`) VALUES
(1, 'Andi', 'Garut'),
(2, 'Dini', 'Bandung'),
(3, 'Tono', 'Garut'),
(4, 'Asep', 'Garut'),
(5, 'Dodi', 'Garut'),
(111232, 'Heri', 'Garut'),
(22323, 'Asep', 'Garut');

--
-- Trigger `dosen`
--
DELIMITER $$
CREATE TRIGGER `dosen_AFTER_INSERT` AFTER INSERT ON `dosen` FOR EACH ROW insert into ruangan
set kd_ruangan=new.kddosen,
nama="barang masuk"
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `kd_jur` char(3) DEFAULT NULL,
  `nama` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`kd_jur`, `nama`) VALUES
('2', 'Teknik Informatika'),
('1', 'Sistem Informasi'),
('3', 'T.Sipil'),
('4', 'Arsitektur'),
('12', 'Akuntansi'),
('13', 'Sipil 2'),
('111', 'Kantin');

--
-- Trigger `jurusan`
--
DELIMITER $$
CREATE TRIGGER `masukjur` AFTER UPDATE ON `jurusan` FOR EACH ROW BEGIN
INSERT INTO ruangan
set kd_ruangan=new.kd_jur,
nama=new.nama;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_mahasiswa`
--

CREATE TABLE `log_mahasiswa` (
  `NIM` int(10) NOT NULL,
  `Alamat_Lama` varchar(255) NOT NULL,
  `Alamat_Baru` varchar(255) NOT NULL,
  `Tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jurusan` varchar(200) NOT NULL,
  `jns_kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `alamat`, `jurusan`, `jns_kelamin`) VALUES
(3312332, 'Andi', 'Bandung', '1', 'L');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perkuliahan`
--

CREATE TABLE `perkuliahan` (
  `idkuliah` int(11) NOT NULL,
  `Hari` varchar(255) NOT NULL,
  `Jam` int(11) NOT NULL,
  `idmhs` int(11) NOT NULL,
  `idruang` int(11) NOT NULL,
  `iddosen` int(11) NOT NULL,
  `Tanggal` varchar(11) NOT NULL,
  `idjurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `perkuliahan`
--

INSERT INTO `perkuliahan` (`idkuliah`, `Hari`, `Jam`, `idmhs`, `idruang`, `iddosen`, `Tanggal`, `idjurusan`) VALUES
(1, 'Sabtu', 14, 102030, 1, 1, '2', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `kd_ruangan` char(5) DEFAULT NULL,
  `nama` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`kd_ruangan`, `nama`) VALUES
('1', 'Labkom1'),
('2', 'Labkom2'),
('3', 'Labkom3'),
('4', 'Labkom4'),
('11123', 'Heri'),
('22323', 'barang masuk'),
('111', 'Kantin');

--
-- Trigger `ruangan`
--
DELIMITER $$
CREATE TRIGGER `input_Stok` AFTER INSERT ON `ruangan` FOR EACH ROW BEGIN
   INSERT into jurusan
   set kd_jur=new.kd_ruangan,
   nama=new.nama;
 	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
