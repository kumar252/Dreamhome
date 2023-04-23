-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2023 at 04:45 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestate`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientid` mediumint(9) NOT NULL,
  `username` char(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `emailid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`clientid`, `username`, `password`, `emailid`) VALUES
(1, 'malli', 'malli', 'malli@gmail.com'),
(2, 'testuser1', 'testuser', 'test@gmail.com'),
(3, 'testuser2', 'testuser', 'test@gmail.com'),
(4, 'divya', 'divya', 'divya@gmail.com'),
(5, 'sunil', 'sunil', 'sunil@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mailinglist`
--

CREATE TABLE `mailinglist` (
  `id` int(11) NOT NULL,
  `clientid` varchar(20) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `telno` int(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `postcode` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_field` date DEFAULT curdate(),
  `region` varchar(50) NOT NULL,
  `pretype` varchar(25) NOT NULL,
  `maxrent` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mailinglist`
--

INSERT INTO `mailinglist` (`id`, `clientid`, `firstname`, `lastname`, `telno`, `street`, `city`, `postcode`, `email`, `date_field`, `region`, `pretype`, `maxrent`) VALUES
(1, '1', 'malli', 'malli', 999999999, '221, Baker', 'Manchester ', '500100', 'malli@gmail.com', '2023-03-26', 'South London', 'Flat', '350$'),
(2, '5', 'sunil', 'k', 2147483647, '222, East front', 'newyork', '998998', 'sunil@gmail.com', '2023-03-26', 'East London', 'Flat', '450$');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'malli', 'malli');

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE `users1` (
  `clientId` int(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `viewing`
--

CREATE TABLE `viewing` (
  `id` int(11) NOT NULL,
  `clientid` varchar(20) NOT NULL,
  `Propertyno` varchar(255) NOT NULL,
  `viewdate` date NOT NULL,
  `viewhour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `viewing`
--

INSERT INTO `viewing` (`id`, `clientid`, `Propertyno`, `viewdate`, `viewhour`) VALUES
(1, '1', 'PA14', '2023-03-12', 12),
(2, '5', 'PA15', '2023-03-11', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientid`);

--
-- Indexes for table `mailinglist`
--
ALTER TABLE `mailinglist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `viewing`
--
ALTER TABLE `viewing`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `clientid` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mailinglist`
--
ALTER TABLE `mailinglist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `viewing`
--
ALTER TABLE `viewing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
