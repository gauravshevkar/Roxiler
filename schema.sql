-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2025 at 09:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roxiler_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--
CREATE DATABASE IF NOT EXISTS roxiler_db;
USE roxiler_db;

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `ratingValue` int(11) NOT NULL CHECK (`ratingValue` between 1 and 5),
  `userId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `ratingValue`, `userId`, `storeId`, `createdAt`, `updatedAt`) VALUES
(1, 3, 2, 1, '2025-12-04 20:46:09', '2025-12-04 20:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `email`, `address`, `ownerId`, `createdAt`, `updatedAt`) VALUES
(1, 'store1', 'store1@gmail.com', 'Nashik', 3, '2025-12-04 20:45:04', '2025-12-04 20:45:04'),
(2, 'store2', 'store2@gmail.com', 'Nashik', 4, '2025-12-04 20:45:26', '2025-12-04 20:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','owner','admin') DEFAULT 'user',
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin@gmail.com', 'Nashik', '$2b$10$5ttVIjnR2uwr3l8Oo0GUmuFI0BVxzC9wa9R6c.mrZ898LEXYGVLFK', 'admin', '2025-12-05 02:13:14', '2025-12-05 02:13:14'),
(2, 'user', 'user@gmail.com', 'Nashik', '$2b$10$Ays36QtBt3BnhH7cN65Z7u0x4ZWnEJXoj1JvErDw52YSER8gZ1C42', 'user', '2025-12-04 20:43:54', '2025-12-04 20:43:54'),
(3, 'owner', 'owner@gmail.com', 'Nashik', '$2b$10$9WDEdui6NPedxzM675OziOQk9Uz72RucSe4dMBwisQCSZ6uKMcChi', 'owner', '2025-12-04 20:44:24', '2025-12-04 20:44:24'),
(4, 'owner2', 'owner2@gmail.com', 'Nashik', '$2b$10$pVbwZhmg8B8O1zukn/1nJubTiPxY8xOAbz14WJUl8lC6h2jBjUptW', 'owner', '2025-12-04 20:44:44', '2025-12-04 20:44:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `storeId` (`storeId`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ownerId` (`ownerId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;