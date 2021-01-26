-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2021 at 08:12 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c3`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `hash` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '0 mean account deleted\n1 mean active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `hash`, `first_name`, `last_name`, `email`, `password`, `status`) VALUES
(4, '63d15926e036a863629ccdb5ade0ca95', 'Basit', 'Raza', 'basit@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(9, '27294ecb15375a1e0068aa2b13fa4458', 'Basit', 'R', 'basit2@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_accounts`
--

CREATE TABLE `admin_accounts` (
  `id` int(11) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_accounts`
--

INSERT INTO `admin_accounts` (`id`, `hash`, `first_name`, `last_name`, `email`, `password`, `status`) VALUES
(1, '63d15926e036a863629ccdb5ade0ca95', 'Basit', 'R', 'basit@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_sessions`
--

CREATE TABLE `admin_sessions` (
  `id` int(11) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_sessions`
--

INSERT INTO `admin_sessions` (`id`, `hash`, `admin_id`, `created_at`, `status`) VALUES
(1, '94a76cf752f46cf09338b7bbaea64358', 1, '1610177404', 1),
(2, 'e2e625956737723dc3dfac0ef387f478', 1, '1610177592', 1),
(3, '2e03623899ecfeaf25a9fce7c1910d30', 1, '1610177649', 1),
(4, '0f6a87011cd14840044142a5a6aa89bb', 1, '1610177995', 0),
(5, '8f9e71245579fd6bc3c052357560a746', 1, '1610179025', 1),
(6, '0523b2a88bf7016071950ee347c93534', 1, '1610182499', 1),
(7, '439fd3dea096f40f40e8fe8b3b748e07', 1, '1611289173', 1),
(8, 'e76c104cb1e7a6c925a7b17904f8ae49', 1, '1611289473', 1),
(9, '8aa3cd7a7f6066f9a72e66af088b1d38', 1, '1611311655', 1),
(10, '02de8b8f4cd91a978b0b066fc0b41a48', 1, '1611643631', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` varchar(15) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `total_amount`, `status`) VALUES
(7, 9, '1610353703399', 219.92, 1),
(8, 9, '1610353858485', 219.92, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` varchar(45) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `quantity`) VALUES
(1, 1, '7', 1),
(2, 3, '7', 3),
(3, 1, '8', 1),
(4, 3, '8', 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `model` varchar(20) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(250) NOT NULL,
  `image` varchar(200) NOT NULL,
  `color` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `model`, `price`, `category`, `description`, `image`, `color`, `status`) VALUES
(1, 'Engineering Calculator', 'SM-1000', 109.96, 'Professional', 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.', '', 'Gray', 1),
(3, 'Engineering Calculator 2', 'SM-1000 2', 109.96, 'Professional', 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.', 'https://assets.justinmind.com/wp-content/webp-express/webp-images/uploads/2018/11/Lorem-Ipsum-alternatives.png.webp', 'Blue', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `title`, `link`, `description`, `category`, `created_at`) VALUES
(1, 'abcd', 'https://youtube.com', 'lorem ipsum updated', 1, '1611643844770');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL,
  `hash` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` varchar(15) DEFAULT NULL COMMENT 'timestamp at what the session is created',
  `status` tinyint(1) DEFAULT 1 COMMENT '0 mean deleted\n1 mean active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `hash`, `user_id`, `created_at`, `status`) VALUES
(6, 'e09ee59ed0bea7a62681b4f16fb97d9e', 4, '1582096935610', 1),
(7, '261bd57e9e1867c73f5f7fcfe1a1cb3b', 4, '1610101087816', 1),
(8, '89ee1afd847c51ef0c026a89332d41f9', 4, '1610101358566', 1),
(9, 'adffac8df2cfca100f838f11d2f3e580', 4, '1610101360331', 1),
(10, 'b16311a254cfd7255a14be6fc5903460', 9, '1610101481944', 0),
(11, '40008123b9d61a0dd23a222b4f46fa42', 9, '1610102093648', 1),
(12, 'defe6c3ecea4cbd5d2cd5ab35950aee7', 9, '1610102120896', 1),
(13, '33a0d99563e33f9722b3ef6f84b8971a', 9, '1610103198795', 1),
(14, 'e4aa7939fd67ba2508757ed1d15569e5', 9, '1610351995986', 1),
(15, '9b0a51097cc3c4b4055683584dc63cb9', 9, '1610358879323', 1),
(16, '92a3866c9af5cb09d46eea82798733d1', 9, '1610358952713', 1),
(17, '0cc01cee944417e27931840bf442ae49', 9, '1610358970355', 1),
(18, '30c98d55a5f59b861dc690d917e55f39', 9, '1610359069674', 0),
(19, '4bc3ffd593fd3bb553cdaea080bf3b1c', 9, '1610359116722', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin_accounts`
--
ALTER TABLE `admin_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_sessions`
--
ALTER TABLE `admin_sessions`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`),
  ADD KEY `user_id_session_FK` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin_accounts`
--
ALTER TABLE `admin_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_sessions`
--
ALTER TABLE `admin_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_id_session_FK` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
