-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 08:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `velvet_vogue`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Admin', 'admin@velvet.com', '$2y$10$H9B3lEGgJgacBX/3zJjKVORgmrF6nHW6JDAa.POG2llzscllSKJv6', '2025-02-19 18:01:44'),
(2, 'admin', 'ad@g.com', '$2y$10$Sa2zxyH9nfVIrhXYxaHILOWATAUtFUJgR/NYx0mjZ8sgi0ZQ3rIf2', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `address` text NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `profile_pic`, `address`, `phone`) VALUES
(8, 'test', 'test@gmail.com', '$2y$10$V0NRrK1i.EURy00D6Hvf5uFosBb1Y4CKrFTWm9ZhrLcAjcRj88.hG', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('unread','read') DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `customer_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'Cash on Delivery',
  `size` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `size`, `quantity`, `unit_price`) VALUES
(7, 9, 3, NULL, 1, 4500.00),
(8, 10, 13, NULL, 1, 12000.00),
(9, 11, 1, NULL, 1, 1200.00),
(10, 11, 4, NULL, 1, 6500.00),
(11, 12, 13, NULL, 1, 12000.00),
(12, 13, 19, NULL, 1, 4500.00),
(13, 14, 4, NULL, 1, 6500.00),
(14, 14, 13, NULL, 1, 12000.00),
(15, 15, 24, NULL, 1, 6000.00),
(16, 16, 25, NULL, 1, 750.00),
(17, 17, 3, NULL, 1, 4500.00),
(18, 18, 19, NULL, 2, 4500.00),
(19, 19, 6, NULL, 1, 3500.00),
(20, 19, 19, NULL, 2, 4500.00),
(21, 19, 19, NULL, 1, 4500.00),
(22, 20, 4, NULL, 1, 6500.00),
(23, 26, 3, 'XL', 1, 4500.00),
(24, 27, 24, 'XL', 2, 6000.00),
(25, 28, 26, 'M', 1, 2200.00),
(26, 29, 11, 'L', 2, 1200.00),
(27, 30, 31, 'L', 1, 4500.00),
(28, 30, 23, 'L', 1, 6500.00),
(29, 31, 3, 'L', 1, 4500.00),
(30, 32, 13, 'L', 1, 12000.00),
(31, 32, 23, 'M', 1, 6500.00),
(32, 32, 1, 'M', 2, 1200.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `clothing_type` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `description`, `price`, `category`, `gender`, `clothing_type`, `size`) VALUES
(43, 'Polo T-Shirt', 'Raven-Black-Mens-Polo-T-Shirt.jpg', '-', 3000.00, NULL, NULL, NULL, NULL),
(44, 'Crop T-Shirt Pink', '05353964b06f8c92428a9668205d2f56.jpg', '-', 2599.00, NULL, NULL, NULL, NULL),
(45, 'Length Formal Skirt', 'Formal-Long-Skirt-51344-3.jpg', '-', 8000.00, NULL, NULL, NULL, NULL),
(46, 'Linen Shirt 20% OFF', 'e9fbe61e9f5ac7ad880cdd802b27060f.jpg', '-', 8999.00, NULL, NULL, NULL, NULL),
(47, 'Baby Children Pajamas', 'c1aadd725ceaf60fb10f314567e190e8.jpg_720x720q80.jpg', '-', 2500.00, NULL, NULL, NULL, NULL),
(48, 'White Shoes Casual Shoes for Men', 'S03ebed170ed34581889def4fb2a2dab2o.jpg_720x720q80.jpg', '-', 3999.00, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category`) VALUES
(13, 22, 'Women\'s Clothing'),
(14, 22, 'New Arrivals'),
(16, 13, 'Men\'s Clothing'),
(17, 11, 'Men\'s Clothing'),
(18, 24, 'Men\'s Clothing'),
(19, 24, 'Promotions'),
(22, 5, 'Kid\'s Clothing'),
(23, 4, 'Women\'s Clothing'),
(24, 3, 'Men\'s Clothing'),
(25, 1, 'Men\'s Clothing'),
(36, 26, 'New Arrivals'),
(37, 26, 'Women\'s Clothing'),
(48, 6, 'Men\'s Clothing'),
(49, 6, 'Women\'s Clothing'),
(57, 19, 'Men\'s Clothing'),
(58, 23, 'Men\'s Clothing'),
(59, 23, 'New Arrivals'),
(60, 29, 'New Arrivals'),
(61, 29, 'Women\'s Clothing'),
(62, 30, 'New Arrivals'),
(63, 30, 'Women\'s Clothing'),
(64, 31, 'Men\'s Clothing'),
(65, 31, 'New Arrivals'),
(66, 31, 'Women\'s Clothing'),
(71, 44, 'Women\'s Clothing'),
(72, 45, 'Women\'s Clothing'),
(73, 46, 'Men\'s Clothing'),
(74, 46, 'Promotions'),
(75, 47, 'Kid\'s Clothing'),
(76, 48, 'Men\'s Clothing');

-- --------------------------------------------------------

--
-- Table structure for table `product_clothing_types`
--

CREATE TABLE `product_clothing_types` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `clothing_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_clothing_types`
--

INSERT INTO `product_clothing_types` (`id`, `product_id`, `clothing_type`) VALUES
(14, 3, 'Jacket'),
(15, 4, 'Dress'),
(16, 5, 'Dress'),
(17, 6, 'Sweater'),
(18, 13, 'Blazer'),
(19, 19, 'Jeans'),
(22, 22, 'Jeans'),
(23, 22, 'Leggings'),
(24, 23, 'Sneakers'),
(25, 24, 'Jeans'),
(26, 24, 'Button-Down Shirt'),
(27, 26, 'Tank Top'),
(29, 1, 'T-shirt'),
(30, 11, 'Shorts'),
(40, 29, 'Jeans'),
(41, 29, 'Leggings'),
(42, 30, 'Dress'),
(43, 31, 'Hoodie'),
(44, 27, 'Cap'),
(48, 44, 'T-shirt'),
(49, 43, 'T-shirt'),
(50, 45, 'Dress'),
(51, 47, 'Pajama Set'),
(52, 48, 'Sneakers');

-- --------------------------------------------------------

--
-- Table structure for table `product_genders`
--

CREATE TABLE `product_genders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_genders`
--

INSERT INTO `product_genders` (`id`, `product_id`, `gender`) VALUES
(16, 3, 'Male'),
(17, 4, 'Female'),
(18, 5, 'Female'),
(19, 6, 'Male'),
(20, 6, 'Female'),
(21, 13, 'Male'),
(22, 19, 'Male'),
(25, 22, 'Female'),
(26, 23, 'Male'),
(27, 24, 'Male'),
(29, 26, 'Female'),
(32, 1, 'Male'),
(33, 1, 'Female'),
(34, 11, 'Male'),
(40, 29, 'Female'),
(41, 30, 'Female'),
(42, 31, 'Male'),
(43, 31, 'Female'),
(44, 27, 'Male'),
(45, 27, 'Female'),
(46, 25, 'Male'),
(50, 44, 'Female'),
(51, 43, 'Male'),
(52, 45, 'Female'),
(53, 46, 'Male'),
(54, 47, 'Male'),
(55, 47, 'Female'),
(56, 48, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size`) VALUES
(28, 3, 'L'),
(29, 3, 'XL'),
(30, 4, 'XS'),
(31, 4, 'S'),
(32, 4, 'M'),
(33, 5, 'XS'),
(34, 6, 'L'),
(35, 6, 'XL'),
(36, 13, 'L'),
(37, 13, 'XL'),
(38, 19, 'L'),
(39, 19, 'XL'),
(44, 22, 'XS'),
(45, 22, 'S'),
(46, 22, 'M'),
(47, 23, 'M'),
(48, 23, 'L'),
(49, 24, 'L'),
(50, 24, 'XL'),
(51, 26, 'M'),
(52, 26, 'L'),
(53, 26, 'XL'),
(54, 1, 'S'),
(55, 1, 'M'),
(56, 1, 'L'),
(57, 11, 'M'),
(58, 11, 'L'),
(69, 29, 'S'),
(70, 29, 'M'),
(71, 30, 'S'),
(72, 30, 'M'),
(73, 30, 'L'),
(74, 31, 'S'),
(75, 31, 'M'),
(76, 31, 'L'),
(77, 31, 'XL'),
(78, 27, 'M'),
(79, 25, 'M'),
(82, 44, 'S'),
(83, 44, 'M'),
(84, 43, 'M'),
(85, 43, 'L'),
(86, 46, 'M'),
(87, 46, 'L'),
(88, 46, 'XL'),
(89, 47, 'XS');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_clothing_types`
--
ALTER TABLE `product_clothing_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_genders`
--
ALTER TABLE `product_genders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `product_clothing_types`
--
ALTER TABLE `product_clothing_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `product_genders`
--
ALTER TABLE `product_genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_clothing_types`
--
ALTER TABLE `product_clothing_types`
  ADD CONSTRAINT `product_clothing_types_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_genders`
--
ALTER TABLE `product_genders`
  ADD CONSTRAINT `product_genders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
