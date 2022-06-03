-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2022 at 02:19 AM
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
(4, 30000, '2022-05-31', 'masuk', 'Ayang bayar utang ke aku');

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
(110000);

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
-- AUTO_INCREMENT for table `riwayat_keuangan`
--
ALTER TABLE `riwayat_keuangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
