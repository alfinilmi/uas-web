-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2022 at 05:34 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

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

UPDATE kas set nis = niss , bulan = bulans, pekan1 = pekans1, pekan2 = pekans2, pekan3 = pekans3, pekan4 = pekans4 where id = ids;

INSERT INTO riwayat_keuangan VALUES (null,5000,now(),"masuk","Bayar Kas");
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
(1, ' 2004212', 'Januari', '5000', '5000', '0', '0'),
(2, ' 2004212', 'Februari', '5000', '5000', '0', '0'),
(3, ' 2004212', 'Maret', '5000', '5000', '0', '0'),
(4, ' 2004212', 'April', '5000', '0', '0', '0'),
(5, ' 2004212', 'Mei', '0', '0', '0', '0'),
(6, ' 2004212', 'Juni', '0', '0', '0', '0'),
(7, ' 2004212', 'Juli', '0', '0', '0', '0'),
(8, ' 2004212', 'Agustus', '0', '0', '0', '0'),
(9, ' 2004212', 'September', '0', '0', '0', '0'),
(10, ' 2004212', 'Oktober', '0', '0', '0', '0'),
(11, ' 2004212', 'November', '0', '0', '0', '0'),
(12, ' 2004212', 'Desember', '0', '0', '0', '0'),
(13, '2003982', 'Januari', '5000', '0', '0', '0'),
(14, '2003982', 'Februari', '0', '0', '0', '0'),
(15, '2003982', 'Maret', '0', '0', '0', '0'),
(16, '2003982', 'April', '0', '0', '0', '0'),
(17, '2003982', 'Mei', '0', '0', '0', '0'),
(18, '2003982', 'Juni', '0', '0', '0', '0'),
(19, '2003982', 'Juli', '0', '0', '0', '0'),
(20, '2003982', 'Agustus', '0', '0', '0', '0'),
(21, '2003982', 'September', '0', '0', '0', '0'),
(22, '2003982', 'Oktober', '0', '0', '0', '0'),
(23, '2003982', 'November', '0', '0', '0', '0'),
(24, '2003982', 'Desember', '0', '0', '0', '0'),
(25, '2001711', 'Januari', '5000', '0', '0', '0'),
(26, '2001711', 'Februari', '5000', '0', '0', '0'),
(27, '2001711', 'Maret', '5000', '0', '0', '0'),
(28, '2001711', 'April', '0', '0', '0', '0'),
(29, '2001711', 'Mei', '0', '0', '0', '0'),
(30, '2001711', 'Juni', '0', '0', '0', '0'),
(31, '2001711', 'Juli', '0', '0', '0', '0'),
(32, '2001711', 'Agustus', '0', '0', '0', '0'),
(33, '2001711', 'September', '0', '0', '0', '0'),
(34, '2001711', 'Oktober', '0', '0', '0', '0'),
(35, '2001711', 'November', '0', '0', '0', '0'),
(36, '2001711', 'Desember', '0', '0', '0', '0'),
(37, '2003918', 'Januari', '5000', '0', '0', '0'),
(38, '2003918', 'Februari', '0', '0', '0', '0'),
(39, '2003918', 'Maret', '0', '0', '0', '0'),
(40, '2003918', 'April', '0', '0', '0', '0'),
(41, '2003918', 'Mei', '0', '0', '0', '0'),
(42, '2003918', 'Juni', '0', '0', '0', '0'),
(43, '2003918', 'Juli', '0', '0', '0', '0'),
(44, '2003918', 'Agustus', '0', '0', '0', '0'),
(45, '2003918', 'September', '0', '0', '0', '0'),
(46, '2003918', 'Oktober', '0', '0', '0', '0'),
(47, '2003918', 'November', '0', '0', '0', '0'),
(48, '2003918', 'Desember', '0', '0', '0', '0');

--
-- Triggers `kas`
--
DELIMITER $$
CREATE TRIGGER `sumkas` AFTER UPDATE ON `kas` FOR EACH ROW begin
declare totals int DEFAULT 0;
select sum(pekan1+pekan2+pekan3+pekan4) into totals from kas;
update saldo set total = totals;
end
$$
DELIMITER ;

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
-- Stand-in structure for view `ranking`
-- (See below for the actual view)
--
CREATE TABLE `ranking` (
`name` varchar(100)
,`total` double
,`RANKING` bigint(21)
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
(1, 20000, '2022-06-04', 'keluar', 'Pembelian Spidol dan tinta'),
(2, 10000, '2022-06-04', 'keluar', 'Beli penghapus'),
(3, 5000, '2022-06-04', 'masuk', 'Bayar Kas'),
(4, 5000, '2022-06-04', 'masuk', 'new.nis, Bayar Kas');

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
  `total` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`total`) VALUES
(65000);

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
(1, ' 2004212', 'Alfin MI'),
(2, '2003982', 'Alifta FN'),
(3, '2001711', 'Irham NA'),
(4, '2003918', 'Sandi FF');

--
-- Triggers `siswa`
--
DELIMITER $$
CREATE TRIGGER `templateBayar` AFTER INSERT ON `siswa` FOR EACH ROW BEGIN
INSERT INTO kas (nis, bulan) VALUES 
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
-- Stand-in structure for view `viewkas`
-- (See below for the actual view)
--
CREATE TABLE `viewkas` (
`name` varchar(100)
,`id` int(11)
,`bulan` varchar(10)
,`pekan1` varchar(50)
,`pekan2` varchar(50)
,`pekan3` varchar(50)
,`pekan4` varchar(50)
);

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

-- --------------------------------------------------------

--
-- Structure for view `ranking`
--
DROP TABLE IF EXISTS `ranking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ranking`  AS SELECT `siswa`.`name` AS `name`, sum(`kas`.`pekan1` + `kas`.`pekan2` + `kas`.`pekan3` + `kas`.`pekan4`) AS `total`, dense_rank()  ( partition by `kas`.`bulan` order by sum(`kas`.`pekan1` + `kas`.`pekan2` + `kas`.`pekan3` + `kas`.`pekan4`) desc) AS `over` FROM (`kas` join `siswa` on(`kas`.`nis` = `siswa`.`nis`)) GROUP BY `kas`.`nis` ORDER BY dense_rank()  ( partition by `kas`.`bulan` order by sum(`kas`.`pekan1` + `kas`.`pekan2` + `kas`.`pekan3` + `kas`.`pekan4`) desc) AS `over` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `viewkas`
--
DROP TABLE IF EXISTS `viewkas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewkas`  AS SELECT `siswa`.`name` AS `name`, `kas`.`id` AS `id`, `kas`.`bulan` AS `bulan`, `kas`.`pekan1` AS `pekan1`, `kas`.`pekan2` AS `pekan2`, `kas`.`pekan3` AS `pekan3`, `kas`.`pekan4` AS `pekan4` FROM (`siswa` join `kas` on(`kas`.`nis` = `siswa`.`nis`)) GROUP BY `kas`.`id` ;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `riwayat_keuangan`
--
ALTER TABLE `riwayat_keuangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
