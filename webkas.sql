-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 12, 2022 at 03:34 PM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ditadmin` (IN `ids` INT, IN `unames` VARCHAR(50), IN `passwds` VARCHAR(20))  BEGIN update admin set passw = passwds where id  = ids;
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
(1, 'admin', 'admin');

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
(1, '2003918', 'Januari', '5000', '5000', '5000', '0'),
(2, '2003918', 'Februari', '5000', '5000', '5000', '5000'),
(3, '2003918', 'Maret', '5000', '5000', '0', '0'),
(4, '2003918', 'April', '0', '0', '0', '0'),
(5, '2003918', 'Mei', '0', '0', '0', '0'),
(6, '2003918', 'Juni', '0', '0', '0', '0'),
(7, '2003918', 'Juli', '0', '0', '0', '0'),
(8, '2003918', 'Agustus', '0', '0', '0', '0'),
(9, '2003918', 'September', '0', '0', '0', '0'),
(10, '2003918', 'Oktober', '0', '0', '0', '0'),
(11, '2003918', 'November', '0', '0', '0', '0'),
(12, '2003918', 'Desember', '0', '0', '0', '0'),
(13, '2003919', 'Januari', '5000', '5000', '5000', '0'),
(14, '2003919', 'Februari', '0', '0', '0', '0'),
(15, '2003919', 'Maret', '0', '0', '0', '0'),
(16, '2003919', 'April', '0', '0', '0', '0'),
(17, '2003919', 'Mei', '0', '0', '0', '0'),
(18, '2003919', 'Juni', '0', '0', '0', '0'),
(19, '2003919', 'Juli', '0', '0', '0', '0'),
(20, '2003919', 'Agustus', '0', '0', '0', '0'),
(21, '2003919', 'September', '0', '0', '0', '0'),
(22, '2003919', 'Oktober', '0', '0', '0', '0'),
(23, '2003919', 'November', '0', '0', '0', '0'),
(24, '2003919', 'Desember', '0', '0', '0', '0');

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
-- CREATE TABLE `ranking` (
-- `name` varchar(100)
-- ,`total` double
-- ,`RANKING` bigint(21)
-- );

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
(1, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(2, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(3, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(4, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(5, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(6, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(7, 50000, '2022-06-10', 'keluar', 'Untuk keperluan kelas\r\nGelas : 30pcs'),
(8, 10000, '2022-06-10', 'keluar', 'Test transaction'),
(9, 10000, '2022-06-10', 'keluar', 'Test transaction'),
(10, 10000, '2022-06-10', 'keluar', 'Test TRANSACTION'),
(11, 10000, '2022-06-10', 'keluar', 'Test TRANSACTION'),
(12, 15000, '2022-06-10', 'keluar', 'Fix kah transaction?'),
(13, 35000, '2022-06-10', 'keluar', 'Harusnya saldo jadi 0'),
(14, 10000, '2022-06-10', 'keluar', 'harusnya saldo jadi min 10k\r\n'),
(15, 10000, '2022-06-10', 'keluar', 'Test setelah saldo dijadiin unsigned\r\n'),
(16, 10000, '2022-06-10', 'keluar', 'Test'),
(18, 10000, '2022-06-10', 'keluar', 'Test (2)'),
(19, 10000, '2022-06-10', 'keluar', 'test(3)'),
(20, 1, '2022-06-10', 'keluar', '1'),
(21, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(22, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(23, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(24, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(25, 10, '2022-06-10', 'keluar', 'z'),
(26, 1, '2022-06-10', 'keluar', 'y'),
(30, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(31, 20000, '2022-06-10', 'keluar', 'Ngurangin Uang'),
(32, 40000, '2022-06-10', 'keluar', 'Jadiin 0'),
(37, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(38, 50000, '2022-06-10', 'keluar', 'Test lagi bang'),
(39, 5000, '2022-06-10', 'masuk', 'Bayar Kas'),
(40, 50000, '2022-06-11', 'keluar', 'Test Alert'),
(41, 10000, '2022-06-11', 'keluar', 'Test alert kedua'),
(42, 5000, '2022-06-11', 'keluar', 'Test alert ketiga'),
(43, 1000, '2022-06-11', 'keluar', 'test alert keempat'),
(44, 1000, '2022-06-11', 'keluar', 'test alert keempat'),
(46, 5000, '2022-06-11', 'masuk', 'Bayar Kas');

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
  `total` int(10) UNSIGNED NOT NULL DEFAULT 0
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
(2, '2003919', 'Alfin Muhammad Ilmi');

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
-- DROP TABLE IF EXISTS `ranking`;

-- CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ranking`  AS SELECT `siswa`.`name` AS `name`, sum(`kas`.`pekan1` + `kas`.`pekan2` + `kas`.`pekan3` + `kas`.`pekan4`) AS `total`, dense_rank()  ( partition by `kas`.`bulan` order by sum(`kas`.`pekan1` + `kas`.`pekan2` + `kas`.`pekan3` + `kas`.`pekan4`) desc) AS `over` FROM (`kas` join `siswa` on(`kas`.`nis` = `siswa`.`nis`)) GROUP BY `kas`.`nis` ORDER BY dense_rank()  ( partition by `kas`.`bulan` order by sum(`kas`.`pekan1` + `kas`.`pekan2` + `kas`.`pekan3` + `kas`.`pekan4`) desc) AS `over` ASC ;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `riwayat_keuangan`
--
ALTER TABLE `riwayat_keuangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
