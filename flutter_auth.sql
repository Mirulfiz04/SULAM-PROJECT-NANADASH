-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2025 at 09:56 AM
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
-- Database: `flutter_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile`
--

CREATE TABLE `customer_profile` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `ic_number` varchar(20) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `address_line1` varchar(150) NOT NULL,
  `address_line2` varchar(150) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT 'Malaysia',
  `preferred_office` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image_url`, `created_by`, `created_at`) VALUES
(10, 'PINEAPPLE SALES', 'GOT DISCOUNT ON THE LIMITED TIME ONLY', 'http://localhost/flutter_api/uploads/1764919238_news_image.png', 'admin', '2025-12-05 07:20:38'),
(11, 'OUR FRUIT QUALITY', 'Why you guys need to buy from us?\nBecause we can guarantee the quality of the pineapple in the top notch', 'http://localhost/flutter_api/uploads/1764924084_news_image.png', 'admin', '2025-12-05 08:41:24'),
(12, 'OUR FARM DETAILS', 'Our farm provides highest quality for the pineapple to grow which is highest grade fertilizer and variety type of pineapple\nOur farm also provide quality checking before send to the customer', 'http://localhost/flutter_api/uploads/1764924326_news_image.png', 'admin', '2025-12-05 08:45:26'),
(13, 'FREE SHIPPING FOR LIMITED TIME ONLY', 'DURING CURRENT EVENT OUR, OUR TEAM DECIDE WE WILL GIVE FREE SHIPPING FOR THE CUSTOMER THAT BUY FROM US IN SPECIFIC AMOUNT OF PINEAPPLE\nTHIS SHOWN OUR APPRECIATION FOR OUR CUSTOMER', 'http://localhost/flutter_api/uploads/1764924541_news_image.png', 'admin', '2025-12-05 08:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'pending',
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `transport_cost` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `delivery_address` text DEFAULT NULL,
  `delivery_notes` text DEFAULT NULL,
  `accepted_by` int(11) DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`, `subtotal`, `tax_amount`, `transport_cost`, `total_amount`, `delivery_address`, `delivery_notes`, `accepted_by`, `accepted_at`) VALUES
(30, 3, '2025-12-07 06:55:35', 'accepted', 875.00, 52.50, 150.00, 1077.50, 'Muar, Johor', 'Need Packaging', NULL, NULL),
(31, 3, '2025-12-07 06:57:04', 'rejected', 2750.00, 165.00, 250.00, 3165.00, 'Dengkil, Selangor', 'Contact me - 014 6905325', NULL, NULL),
(32, 9, '2025-12-07 06:59:45', 'accepted', 3500.00, 210.00, 150.00, 3860.00, 'KLCC, Kuala Lumpur', 'Contact me - 014 456 2587', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `line_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `line_total`) VALUES
(26, 30, 1, 250, 3.50, 875.00),
(27, 31, 2, 11000, 0.25, 2750.00),
(28, 32, 1, 1000, 3.50, 3500.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `unit` varchar(50) NOT NULL,
  `min_order` int(11) DEFAULT 1,
  `base_price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `unit`, `min_order`, `base_price`, `is_active`) VALUES
(1, 'Buah Nanas Segar', NULL, 'kg', 1, 3.50, 1),
(2, 'Anak Pokok Nanas', NULL, 'anak pokok', 10000, 0.25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_sell`
--

CREATE TABLE `products_sell` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `order_condition` varchar(255) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_types`
--

CREATE TABLE `transport_types` (
  `transport_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `base_rate` decimal(10,2) NOT NULL,
  `rate_type` enum('per_trip','per_km') DEFAULT 'per_trip',
  `capacity_kg` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_art` timestamp NOT NULL DEFAULT current_timestamp(),
  `phonenumber` varchar(11) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_art`, `phonenumber`, `role`) VALUES
(1, 'Amirul Hafiz Bin Anuar', 'amirul.hafiz73@gmail.com', '$2y$10$4X.R7p5azcCGZzIFvDWqPOSMR901YOeNXgbKIPlgHe15jOm50V68S', '2025-11-20 14:04:58', '0172480218', 'admin'),
(3, 'Isek Ryan', 'isaacryan@gmail.com', '$2y$10$CkDkeEHst/nrO6FvEtqx8uacKa3OJsZ9sVpiz6NHgz8MGbju4634a', '2025-12-01 13:06:59', '0146905325', 'customer'),
(4, 'ISAAC RYAN KOIRIN', 'isaacryan2@gmail.com', '$2y$10$7kAjy4rS4TqJ10YFK3BYhOTzB/ZccdbxN8rtzuQpzAWfmch.Gg07O', '2025-12-01 14:57:06', '0146905324', 'admin'),
(5, 'IJAD IJAD', 'ijad@gmail.com', '$2y$10$SWhQ9IudZilXQpnAy0ztLelX5RpZxz4eLC6BnxcP7yhjbeTJQEb/G', '2025-12-02 15:12:05', '0145678901', 'customer'),
(9, 'Asillah', 'asillah@gmail.com', '$2y$10$m319KQOL086LVJ7DMM56fey7gLEsIv58WSsz1SN5eXDPjIqQXx4zi', '2025-12-05 05:47:16', '0123456789', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `orders_ibfk_2` (`accepted_by`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `products_sell`
--
ALTER TABLE `products_sell`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_types`
--
ALTER TABLE `transport_types`
  ADD PRIMARY KEY (`transport_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `PhoneNumber` (`phonenumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_sell`
--
ALTER TABLE `products_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_types`
--
ALTER TABLE `transport_types`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD CONSTRAINT `customer_profile_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`accepted_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
