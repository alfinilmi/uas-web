-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2022 at 11:56 AM
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
(1, '2003982', 'Januari', '5000', '5000', '5000', '0'),
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
