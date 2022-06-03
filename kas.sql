-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2022 at 01:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webkas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ditadmin` (IN `ids` INT, IN `unames` VARCHAR(50), IN `passwds` VARCHAR(20))  BEGIN update admin set uname = unames where id  = ids;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ditkas` (IN `ids` INT, IN `niss` VARCHAR(50), IN `bulans` VARCHAR(20), IN `pekans1` VARCHAR(20), IN `pekans2` VARCHAR(20), IN `pekans3` VARCHAR(20), IN `pekans4` VARCHAR(20))  BEGIN
    update kas set nis = niss , bulan = bulans, pekan1 = pekans1, pekan2 = pekans2, pekan3 = pekans3, pekan4 = pekans4 where id = ids;
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tadmin` (IN `unames` VARCHAR(100), IN `passwds` VARCHAR(20))  begin
insert into admin values (null,unames,passwds);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tsiswa` (IN `nis` VARCHAR(10), IN `name` VARCHAR(100))  begin insert into siswa values (null,nis,name); end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `passw` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `passw`) VALUES
(1, 'mayushi', 'sandi');

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `id` int(11) NOT NULL,
  `nis` varchar(30) NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `pekan1` varchar(50) DEFAULT '0',
  `pekan2` varchar(50) NOT NULL DEFAULT '0',
  `pekan3` varchar(50) NOT NULL DEFAULT '0',
  `pekan4` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kas`
--

INSERT INTO `kas` (`id`, `nis`, `bulan`, `pekan1`, `pekan2`, `pekan3`, `pekan4`) VALUES
(1, '2003982', 'Januari', '5000', '5000', '5000', '5000'),
(2, '2003982', 'Februari', '0', '0', '0', '0'),
(3, '2003982', 'Maret', '0', '0', '0', '0'),
(4, '2003982', 'April', '0', '0', '0', '0'),
(5, '2003982', 'Mei', '0', '0', '0', '0'),
(6, '2003982', 'Juni', '0', '0', '0', '0'),
(7, '2003982', 'Juli', '0', '0', '0', '0'),
(8, '2003982', 'Agustus', '0', '0', '0', '0'),
(9, '2003982', 'September', '0', '0', '0', '0'),
(10, '2003982', 'Oktober', '0', '0', '0', '0'),
(11, '2003982', 'November', '0', '0', '0', '0'),
(12, '2003982', 'Desember', '0', '0', '0', '0'),
(13, '2004212', 'Januari', '0', '0', '0', '0'),
(14, '2004212', 'Februari', '0', '0', '0', '0'),
(15, '2004212', 'Maret', '0', '0', '0', '0'),
(16, '2004212', 'April', '0', '0', '0', '0'),
(17, '2004212', 'Mei', '0', '0', '0', '0'),
(18, '2004212', 'Juni', '0', '0', '0', '0'),
(19, '2004212', 'Juli', '0', '0', '0', '0'),
(20, '2004212', 'Agustus', '0', '0', '0', '0'),
(21, '2004212', 'September', '0', '0', '0', '0'),
(22, '2004212', 'Oktober', '0', '0', '0', '0'),
(23, '2004212', 'November', '0', '0', '0', '0'),
(24, '2004212', 'Desember', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pemasukan`
-- (See below for the actual view)
--
CREATE TABLE `pemasukan` (
`tanggal` date
,`total_bayar` int(11)
,`keterangan` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pengeluaran`
-- (See below for the actual view)
--
CREATE TABLE `pengeluaran` (
`tanggal` date
,`total_bayar` int(11)
,`keterangan` text
);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_keuangan`
--

CREATE TABLE `riwayat_keuangan` (
  `id` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('masuk','keluar') NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_keuangan`
--

INSERT INTO `riwayat_keuangan` (`id`, `total_bayar`, `tanggal`, `status`, `keterangan`) VALUES
(1, 50000, '2022-05-30', 'masuk', 'Sandi bayar kas'),
(2, 10000, '2022-05-30', 'keluar', 'Membeli sapu, Membeli Alif dan Alfin, Membeli Kacamata'),
(3, 20000, '2022-05-31', 'keluar', 'Ngejajanin ayang pake uang kas'),
(4, 30000, '2022-05-31', 'masuk', 'Ayang bayar utang ke aku'),
(5, 20000, '2022-06-03', 'keluar', 'Cek lagi Laporin Pengeluaran');

--
-- Triggers `riwayat_keuangan`
--
DELIMITER $$
CREATE TRIGGER `update_saldo` AFTER INSERT ON `riwayat_keuangan` FOR EACH ROW BEGIN  IF new.status = "masuk" THEN UPDATE saldo SET total = total+new.total_bayar; ELSEIF new.status = "keluar" THEN UPDATE saldo SET total = total-new.total_bayar; END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

CREATE TABLE `saldo` (
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`total`) VALUES
(90000);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `name`) VALUES
(1, '2003918', 'Sandi Faisal Ferdiansyah');

--
-- Triggers `siswa`
--
DELIMITER $$
CREATE TRIGGER `templateBayar` AFTER INSERT ON `siswa` FOR EACH ROW BEGIN
INSERT INTO bayar (nis, bulan) VALUES 
(new.nis, 'Januari'),
(new.nis, 'Februari'),
(new.nis, 'Maret'),
(new.nis, 'April'),
(new.nis, 'Mei'),
(new.nis, 'Juni'),
(new.nis, 'Juli'),
(new.nis, 'Agustus'),
(new.nis, 'September'),
(new.nis, 'Oktober'),
(new.nis, 'November'),
(new.nis, 'Desember');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `pemasukan`
--
DROP TABLE IF EXISTS `pemasukan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pemasukan`  AS SELECT `riwayat_keuangan`.`tanggal` AS `tanggal`, `riwayat_keuangan`.`total_bayar` AS `total_bayar`, `riwayat_keuangan`.`keterangan` AS `keterangan` FROM `riwayat_keuangan` WHERE `riwayat_keuangan`.`status` = 'masuk' ;

-- --------------------------------------------------------

--
-- Structure for view `pengeluaran`
--
DROP TABLE IF EXISTS `pengeluaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pengeluaran`  AS SELECT `riwayat_keuangan`.`tanggal` AS `tanggal`, `riwayat_keuangan`.`total_bayar` AS `total_bayar`, `riwayat_keuangan`.`keterangan` AS `keterangan` FROM `riwayat_keuangan` WHERE `riwayat_keuangan`.`status` = 'keluar' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_keuangan`
--
ALTER TABLE `riwayat_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `riwayat_keuangan`
--
ALTER TABLE `riwayat_keuangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
