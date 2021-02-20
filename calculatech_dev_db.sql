-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 20, 2021 at 07:58 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calculatech_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0 mean account deleted\n1 mean active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `hash`, `first_name`, `last_name`, `email`, `password`, `status`) VALUES
(4, '63d15926e036a863629ccdb5ade0ca95', 'Basit', 'Raza', 'basit@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(9, '27294ecb15375a1e0068aa2b13fa4458', 'Basit', 'R', 'basit2@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(10, 'a0b331045d281cc67b74a19d04f1aa0f', 'Hu', 'Rosales', 'figiji@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', 1),
(11, 'b9bd98394f9fe5d63cf5f50f2440ed70', 'Noman', 'Farooq', 'simplelogicx7@gmail.com', 'ee432a50c4aea02cb8cce5838031c4c4', 1),
(12, '03f6d06116564c9fa6125db33a99d5f2', 'Waleed', 'Asghar', 'waleed@mail.com', '25f9e794323b453885f5181f1b624d0b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_accounts`
--

DROP TABLE IF EXISTS `admin_accounts`;
CREATE TABLE IF NOT EXISTS `admin_accounts` (
  `id` int(11) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_accounts`
--

INSERT INTO `admin_accounts` (`id`, `hash`, `first_name`, `last_name`, `email`, `password`, `status`) VALUES
(1, '63d15926e036a863629ccdb5ade0ca95', 'Basit', 'Raza', 'basit@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_sessions`
--

DROP TABLE IF EXISTS `admin_sessions`;
CREATE TABLE IF NOT EXISTS `admin_sessions` (
  `id` int(11) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` varchar(15) NOT NULL,
  `total_amount` double NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `total_amount`, `status`) VALUES
(1, 11, '1613283172611', 109.96, 1),
(2, 11, '1613283216972', 109.96, 1),
(3, 11, '1613283299194', 109.96, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_address`
--

DROP TABLE IF EXISTS `order_address`;
CREATE TABLE IF NOT EXISTS `order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `country` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `address` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_address`
--

INSERT INTO `order_address` (`id`, `order_id`, `phone`, `email`, `country`, `city`, `zip`, `address`) VALUES
(1, 2, '81', 'simplelogicx7@gmail.com', 'AE', 'Shar', '31945', 'Quidem voluptas ipsu'),
(2, 3, '14', 'rete@mailinator.com', 'PK', 'Islamabad', '60106', 'Ea perspiciatis adi');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_id` varchar(45) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `quantity`) VALUES
(1, 1, '2', 16),
(2, 1, '3', 16);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `model` varchar(20) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(250) NOT NULL,
  `image` text NOT NULL,
  `color` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `model`, `price`, `category`, `description`, `image`, `color`, `status`) VALUES
(1, 'Engineering Calculator', 'SM-1000', 109.96, 'Professional', 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.', '../../public/images/lp/calculatech.png', 'Gray', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

DROP TABLE IF EXISTS `tutorials`;
CREATE TABLE IF NOT EXISTS `tutorials` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `description` text,
  `category` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `title`, `link`, `description`, `category`, `created_at`) VALUES
(1, 'CG Animation of Birds', 'https://www.youtube.com/embed/nc5Lj90BzSQ', 'lorem ipsum updated', 1, '1611643844770'),
(2, 'CG Animation of Machines', 'https://www.youtube.com/embed/vBXLojiNJ3g', 'Machines animations are Created via gfx', 1, '1611643844770');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE IF NOT EXISTS `user_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` varchar(15) DEFAULT NULL COMMENT 'timestamp at what the session is created',
  `status` tinyint(1) DEFAULT '1' COMMENT '0 mean deleted\n1 mean active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `user_id_session_FK` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

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
(14, 'a0496c7fe4bfc5a5fc13027b02fe0144', 9, '1610107538295', 1),
(15, 'f2d3d6ad5b861e5a8e8366b140c4f954', 9, '1610354677414', 1),
(16, '02a6649e8ec1435265923f531cb5e390', 9, '1610354679399', 1),
(17, '3f5289425030b3c12580073ba813461b', 9, '1610972842004', 1),
(18, '772f9d92a291767bc184fc8be3e5a835', 11, '1611041852396', 1),
(19, 'ab982e7ce0f80b079ebcac7833457e35', 11, '1611041870422', 1),
(20, '3a15c89f62ef572414886063420c5318', 11, '1611041882348', 1),
(21, 'd9b5ad22a344b2c5880e17fce6d03478', 9, '1611047240597', 1),
(22, '9fec9c47335fef96c8fc08753fd334e7', 9, '1611047422197', 1),
(23, 'd7711a3516eb125ce6e2d8b5f4e9a501', 11, '1611047500290', 1),
(24, '8b914d30abc84af73576d1c9c2679b50', 11, '1611048439116', 1),
(25, 'e735efef898ffac6f443450f451223ff', 11, '1611048442461', 1),
(26, '75cc82a4cbcb0109ec32e514a7965e51', 11, '1611049355853', 1),
(27, 'b7092addab2bcf9b4e2766c467ae7118', 11, '1611049357701', 1),
(28, '0587ee863cccdf17e5f1fbbfdbd3aba4', 11, '1611049359109', 1),
(29, '4119057a62b38bd0d249f5216ffb3e84', 11, '1611050655241', 1),
(30, 'b07ed9ae025871a04ec0e5a65ac1533c', 11, '1611077488118', 1),
(31, 'd14cc0c60f14836a6ce4e46643857857', 11, '1611077518232', 1),
(32, '7299c440d563f79c9e8935f3c8ab0e27', 11, '1611077597649', 1),
(33, 'aeceab38bf5ad58a2d5ba4d0c3adaa8f', 11, '1611077764027', 1),
(34, '71c9419c47ca56ffa2bd3e3213511226', 11, '1611077853234', 1),
(35, '2d94e7f79b51762a200797780fa3e837', 11, '1611077882092', 1),
(36, '6ed2ab29fe96f3c65fbf5fb6cb46cd24', 11, '1611077952682', 1),
(37, 'e5e5b51ce02f287d2249abb8bf37b64d', 11, '1611078006566', 1),
(38, 'fda1a638c693943350cc51d0916f8a24', 11, '1611078143033', 1),
(39, '37a09815e40068ac2a21562039d8f0bc', 11, '1611078180983', 1),
(40, 'a203263b880b499252874ccc1465714f', 11, '1611078216694', 1),
(41, '1584456107fd91623ba86f5dc44d7d2f', 11, '1611078243477', 1),
(42, 'ceac820a57b5b1db8d93df2469ff49fd', 11, '1611078282494', 1),
(43, '321a751b9834e8b327f9d0c9857c3d9a', 11, '1611078409275', 1),
(44, '05ec33aa5f9485428b0bd9155e37b6e5', 11, '1611078447695', 1),
(45, '460bec07abdff31fec14af75c2c1ae77', 11, '1611078518271', 1),
(46, '62a04b0ad34fc653e193f6140d7ee083', 11, '1611078559512', 1),
(47, '2633e47aa8f350eda0dfdee9c88dee31', 11, '1611078911245', 1),
(48, '1145b487c75d48d96cf17e9595064f93', 11, '1611078927448', 1),
(49, '6a76f311bcb410dccb83721daeaa50cd', 11, '1611078936685', 0),
(50, '246037cdd8e87e2c1a16a4a6b9ed4d28', 11, '1611166399580', 1),
(51, '52c3f363e55d8e37a684e03041fe49a3', 11, '1611166473482', 1),
(52, '026653470f76abe60f8fc73f74bf1c9e', 11, '1611166491578', 1),
(53, 'b765a66194b1a1d4408559875f518829', 11, '1611166651381', 0),
(54, 'e699a3ed09000f5b0cbb7bdc64a6841a', 11, '1611167351861', 0),
(55, '9b70ebfe3f3123ebbc8a44a0ed2af5d9', 11, '1611167365018', 0),
(56, '4dcbf3bd5e49d89d8bb3160a985a63da', 11, '1611167588306', 0),
(57, '1f7676482a4c6b66df08f4c3d3dfbbc1', 11, '1611167606884', 0),
(58, 'ed4cfb99d3f13df5150ccca8ce2eadeb', 11, '1611167663404', 1),
(59, 'fdbb751c0cb7988be062f0be8bdaa110', 11, '1611579425734', 1),
(60, '6ba823290a86d22acc7de31810d932be', 11, '1611646145333', 0),
(61, '182633c5018c4ebc02fdf5db337acaf2', 11, '1611653042039', 0),
(62, '16e933a669f2b8d819d922e6120a91c4', 11, '1611665338936', 1),
(63, '02aeda39a8874658cd9ceb9f6fce2b27', 11, '1611770520390', 0),
(64, 'fe658933db669b152024c28a5532b524', 11, '1611770533885', 0),
(65, '0421fa51a6153b2b8f54d3552c623b2f', 12, '1611774470246', 0),
(66, 'f4b5a205e1445045e7af12d659f2df1a', 12, '1611774492451', 0),
(67, '84596fb727f3eb93ed71be305623468d', 11, '1611776959489', 0),
(68, 'bc9466a179fa7a0397520054d2ff8241', 11, '1611832506010', 0),
(69, 'd578fb0eae9b0e55405f5d4b5742ae6a', 11, '1611832806876', 0),
(70, '59571c286035b9e718f6d975beb62d24', 11, '1611832854845', 1),
(71, 'f9b603c7b49b0b971cd70e53779ccd92', 11, '1611944270474', 0),
(72, '43adec3a2420b8b3979eda68cd29f667', 11, '1612941178588', 0),
(73, '1148c7c702180353fe5684b254cdc516', 11, '1613284270824', 0),
(74, '485a6f95207cd44973cd6a8d693ff05a', 11, '1613284334483', 1),
(75, '6a66fed57604847a8f1918f54f539af5', 11, '1613284336151', 1),
(76, 'c04b7b23ad31aa94233963daf8b08347', 11, '1613284336684', 1),
(77, '916cf67b0b883813144b1c47b29e2e03', 11, '1613284337117', 1),
(78, 'f772196d9197faf06d2b70c51d3e4d7f', 11, '1613284337715', 1),
(79, 'bc775dafc6a4669622a76b2d10dde4f2', 11, '1613284338196', 1),
(80, '541677a4412f7b91d55db13637464b7b', 11, '1613284339396', 1),
(81, '28b761a282a50dcd61dea81ae77474d4', 11, '1613284340000', 1),
(82, '2ea5396d2f42e7239fd0b2d870520a03', 11, '1613284340513', 1),
(83, 'd81bf0055528cce1f5c252114d5ec2c0', 11, '1613284351104', 1),
(84, '1d141251a416c142ac2b22595fb2b5e6', 11, '1613284351703', 1),
(85, 'da59b013fb5f319bd535bb19a466ab21', 11, '1613284395647', 1),
(86, '159f467f9e03120196d77682be6d0a65', 11, '1613284402816', 1),
(87, '1ba9d9635f4d1251a56a314c165c6ef4', 11, '1613285810518', 0),
(88, 'dfe266a97f01ecd2254706a64150ae86', 11, '1613286002499', 0),
(89, '1d0d314e6ea387ca1dae6170793c06ed', 4, '1613286588426', 0),
(90, 'c7b17788d17ee1e1725864a36350e86e', 11, '1613286609749', 1);

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
