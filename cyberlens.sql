-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2025 at 09:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cyberlens`
--

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `threat_count` int(11) NOT NULL,
  `report_json` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `threat_count`, `report_json`, `created_at`, `file_id`) VALUES
(1, 2, 31, 'report_2_30.json', '2025-03-26 07:07:33', 30),
(2, 2, 31, 'report_2_31.json', '2025-03-26 07:08:53', 31),
(3, 2, 31, 'report_2_32.json', '2025-03-26 07:10:07', 32),
(4, 2, 31, 'report_2_33.json', '2025-03-26 07:13:04', 33),
(5, 1, 31, 'report_1_34.json', '2025-03-26 07:15:33', 34);

-- --------------------------------------------------------

--
-- Table structure for table `threats`
--

CREATE TABLE `threats` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `threat_type` varchar(255) NOT NULL,
  `threat_description` text DEFAULT NULL,
  `detected_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threats`
--

INSERT INTO `threats` (`id`, `user_id`, `file_id`, `threat_type`, `threat_description`, `detected_at`) VALUES
(1, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(2, 2, 33, 'Brute Force', 'Jan 10 20:31:05 server sshd[12346]: Failed password for invalid user root from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(3, 2, 33, 'Brute Force', 'Jan 10 20:31:25 server sshd[12347]: Failed password for invalid user guest from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(4, 2, 33, 'Brute Force', 'Jan 10 20:32:05 server sshd[12348]: Failed password for invalid user test from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(5, 2, 33, 'Brute Force', 'Jan 10 20:32:25 server sshd[12349]: Failed password for invalid user user from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(6, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 94.25.1.1 port 22 ssh2', '2025-03-26 07:13:03'),
(7, 2, 33, 'Brute Force', 'Jan 10 20:32:10 server sshd[12346]: Failed password for invalid user root from 175.45.178.1 port 22 ssh2', '2025-03-26 07:13:03'),
(8, 2, 33, 'Brute Force', 'Jan 10 20:34:05 server sshd[12347]: Failed password for invalid user test from 60.12.34.56 port 22 ssh2', '2025-03-26 07:13:03'),
(9, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(10, 2, 33, 'Brute Force', 'Jan 10 20:32:10 server sshd[12346]: Failed password for invalid user root from 192.168.1.101 port 22 ssh2', '2025-03-26 07:13:03'),
(11, 2, 33, 'Brute Force', 'Jan 10 20:34:05 server sshd[12347]: Failed password for invalid user test from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(12, 2, 33, 'Brute Force', 'Jan 10 03:00:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(13, 2, 33, 'Brute Force', 'Jan 10 03:15:10 server sshd[12346]: Failed password for invalid user root from 192.168.1.101 port 22 ssh2', '2025-03-26 07:13:03'),
(14, 2, 33, 'Brute Force', 'Jan 10 04:34:05 server sshd[12347]: Failed password for invalid user test from 192.168.1.102 port 22 ssh2', '2025-03-26 07:13:03'),
(15, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(16, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(17, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(18, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 300.300.300.300 port 22 ssh2', '2025-03-26 07:13:03'),
(19, 2, 33, 'Brute Force', 'Jan 10 20:31:10 server sshd[12346]: Failed password for invalid user root from abc.def.ghi.jkl port 22 ssh2', '2025-03-26 07:13:03'),
(20, 2, 33, 'Brute Force', 'Jan 10 20:40:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.105 port 22 ssh2', '2025-03-26 07:13:03'),
(21, 2, 33, 'Brute Force', 'Jan 10 20:41:10 server sshd[12346]: Failed password for invalid user test from 192.168.1.106 port 22 ssh2', '2025-03-26 07:13:03'),
(22, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.150 port 22 ssh2', '2025-03-26 07:13:03'),
(23, 2, 33, 'Brute Force', 'Jan 10 20:32:10 server sshd[12346]: Failed password for invalid user root from 192.168.1.150 port 22 ssh2', '2025-03-26 07:13:03'),
(24, 2, 33, 'Brute Force', 'Jan 10 20:34:05 server sshd[12347]: Failed password for invalid user guest from 192.168.1.150 port 22 ssh2', '2025-03-26 07:13:03'),
(25, 2, 33, 'Brute Force', 'file.write(f\"Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.{i % 255} port 22 ssh2\\n\")', '2025-03-26 07:13:03'),
(26, 2, 33, 'Brute Force', 'file.write(f\"Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.{i % 255} port 22 ssh2\\n\")', '2025-03-26 07:13:03'),
(27, 2, 33, 'Brute Force', 'Jan 10 2025 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:13:03'),
(28, 2, 33, 'Brute Force', '2025-01-10T20:30:45 server sshd[12346]: Failed password for invalid user root from 192.168.1.101 port 22 ssh2', '2025-03-26 07:13:03'),
(29, 2, 33, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.250 port 22 ssh2', '2025-03-26 07:13:03'),
(30, 2, 33, 'Brute Force', 'Jan 10 20:31:05 server sshd[12346]: Failed password for invalid user root from 192.168.1.250 port 22 ssh2', '2025-03-26 07:13:03'),
(31, 2, 33, 'Brute Force', 'Jan 10 20:31:25 server sshd[12347]: Failed password for invalid user test from 192.168.1.250 port 22 ssh2', '2025-03-26 07:13:03'),
(32, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(33, 1, 34, 'Brute Force', 'Jan 10 20:31:05 server sshd[12346]: Failed password for invalid user root from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(34, 1, 34, 'Brute Force', 'Jan 10 20:31:25 server sshd[12347]: Failed password for invalid user guest from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(35, 1, 34, 'Brute Force', 'Jan 10 20:32:05 server sshd[12348]: Failed password for invalid user test from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(36, 1, 34, 'Brute Force', 'Jan 10 20:32:25 server sshd[12349]: Failed password for invalid user user from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(37, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 94.25.1.1 port 22 ssh2', '2025-03-26 07:15:33'),
(38, 1, 34, 'Brute Force', 'Jan 10 20:32:10 server sshd[12346]: Failed password for invalid user root from 175.45.178.1 port 22 ssh2', '2025-03-26 07:15:33'),
(39, 1, 34, 'Brute Force', 'Jan 10 20:34:05 server sshd[12347]: Failed password for invalid user test from 60.12.34.56 port 22 ssh2', '2025-03-26 07:15:33'),
(40, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(41, 1, 34, 'Brute Force', 'Jan 10 20:32:10 server sshd[12346]: Failed password for invalid user root from 192.168.1.101 port 22 ssh2', '2025-03-26 07:15:33'),
(42, 1, 34, 'Brute Force', 'Jan 10 20:34:05 server sshd[12347]: Failed password for invalid user test from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(43, 1, 34, 'Brute Force', 'Jan 10 03:00:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(44, 1, 34, 'Brute Force', 'Jan 10 03:15:10 server sshd[12346]: Failed password for invalid user root from 192.168.1.101 port 22 ssh2', '2025-03-26 07:15:33'),
(45, 1, 34, 'Brute Force', 'Jan 10 04:34:05 server sshd[12347]: Failed password for invalid user test from 192.168.1.102 port 22 ssh2', '2025-03-26 07:15:33'),
(46, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(47, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(48, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(49, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 300.300.300.300 port 22 ssh2', '2025-03-26 07:15:33'),
(50, 1, 34, 'Brute Force', 'Jan 10 20:31:10 server sshd[12346]: Failed password for invalid user root from abc.def.ghi.jkl port 22 ssh2', '2025-03-26 07:15:33'),
(51, 1, 34, 'Brute Force', 'Jan 10 20:40:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.105 port 22 ssh2', '2025-03-26 07:15:33'),
(52, 1, 34, 'Brute Force', 'Jan 10 20:41:10 server sshd[12346]: Failed password for invalid user test from 192.168.1.106 port 22 ssh2', '2025-03-26 07:15:33'),
(53, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.150 port 22 ssh2', '2025-03-26 07:15:33'),
(54, 1, 34, 'Brute Force', 'Jan 10 20:32:10 server sshd[12346]: Failed password for invalid user root from 192.168.1.150 port 22 ssh2', '2025-03-26 07:15:33'),
(55, 1, 34, 'Brute Force', 'Jan 10 20:34:05 server sshd[12347]: Failed password for invalid user guest from 192.168.1.150 port 22 ssh2', '2025-03-26 07:15:33'),
(56, 1, 34, 'Brute Force', 'file.write(f\"Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.{i % 255} port 22 ssh2\\n\")', '2025-03-26 07:15:33'),
(57, 1, 34, 'Brute Force', 'file.write(f\"Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.{i % 255} port 22 ssh2\\n\")', '2025-03-26 07:15:33'),
(58, 1, 34, 'Brute Force', 'Jan 10 2025 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 22 ssh2', '2025-03-26 07:15:33'),
(59, 1, 34, 'Brute Force', '2025-01-10T20:30:45 server sshd[12346]: Failed password for invalid user root from 192.168.1.101 port 22 ssh2', '2025-03-26 07:15:33'),
(60, 1, 34, 'Brute Force', 'Jan 10 20:30:45 server sshd[12345]: Failed password for invalid user admin from 192.168.1.250 port 22 ssh2', '2025-03-26 07:15:33'),
(61, 1, 34, 'Brute Force', 'Jan 10 20:31:05 server sshd[12346]: Failed password for invalid user root from 192.168.1.250 port 22 ssh2', '2025-03-26 07:15:33'),
(62, 1, 34, 'Brute Force', 'Jan 10 20:31:25 server sshd[12347]: Failed password for invalid user test from 192.168.1.250 port 22 ssh2', '2025-03-26 07:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_files`
--

CREATE TABLE `uploaded_files` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_files`
--

INSERT INTO `uploaded_files` (`id`, `user_id`, `file_path`, `upload_time`) VALUES
(1, 2, 'uploads/server.txt', '2025-03-26 05:32:56'),
(2, 2, 'uploads/server.log', '2025-03-26 05:36:26'),
(3, 2, 'uploads/server.log', '2025-03-26 05:40:43'),
(4, 2, 'uploads/server.log', '2025-03-26 05:40:53'),
(5, 2, 'uploads/server.log', '2025-03-26 05:43:13'),
(6, 2, 'uploads/server.log', '2025-03-26 05:48:57'),
(7, 2, 'uploads/server.log', '2025-03-26 05:51:38'),
(8, 2, 'uploads/server.log', '2025-03-26 05:51:47'),
(9, 2, 'uploads/server.log', '2025-03-26 05:52:10'),
(10, 2, 'uploads/server.log', '2025-03-26 05:52:16'),
(11, 2, 'uploads/server.log', '2025-03-26 05:52:32'),
(12, 2, 'uploads/server.log', '2025-03-26 05:55:10'),
(13, 2, 'uploads/server.log', '2025-03-26 05:55:21'),
(14, 2, 'uploads/server.log', '2025-03-26 05:58:50'),
(15, 2, 'uploads/server.log', '2025-03-26 05:58:55'),
(16, 2, 'uploads/server.log', '2025-03-26 05:59:01'),
(17, 2, 'uploads/server.log', '2025-03-26 05:59:48'),
(18, 2, 'uploads/server.log', '2025-03-26 05:59:56'),
(19, 2, 'uploads/server.log', '2025-03-26 06:00:17'),
(20, 2, 'uploads/server.log', '2025-03-26 06:04:39'),
(21, 2, 'uploads/server.log', '2025-03-26 06:10:17'),
(22, 2, 'uploads/server.log', '2025-03-26 06:10:51'),
(23, 2, 'uploads/server.log', '2025-03-26 06:15:39'),
(24, 2, 'uploads/server.log', '2025-03-26 06:15:47'),
(25, 2, 'uploads/server.log', '2025-03-26 06:16:13'),
(26, 2, 'uploads/server.log', '2025-03-26 06:22:07'),
(27, 2, 'uploads/server.log', '2025-03-26 06:59:40'),
(28, 2, 'uploads/server.log', '2025-03-26 07:06:05'),
(29, 2, 'uploads/server.log', '2025-03-26 07:06:47'),
(30, 2, 'uploads/server.log', '2025-03-26 07:07:32'),
(31, 2, 'uploads/server.log', '2025-03-26 07:08:52'),
(32, 2, 'uploads/server.log', '2025-03-26 07:10:06'),
(33, 2, 'uploads/server.log', '2025-03-26 07:13:03'),
(34, 1, 'uploads/server.log', '2025-03-26 07:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'sukumar', '$2y$10$0hol4DD7o2GnM7kb4gbY8OQACrFCo49MFu2hx/1OU3ayTGsGIVekS'),
(2, 'admin', '$2y$10$RrrOjjWw2PwrSSxBfZDkvujEHmzi9dv3eKslDq72jXGh8VlxYijzS'),
(3, 'cyberlens', '$2y$10$ClfHtklNlVsXuG9kPzvOKOA3V25cywGao2VxqYvCahpysFS.VRy/m');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `threats`
--
ALTER TABLE `threats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `threats`
--
ALTER TABLE `threats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `threats`
--
ALTER TABLE `threats`
  ADD CONSTRAINT `threats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `threats_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD CONSTRAINT `uploaded_files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
