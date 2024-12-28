-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 25, 2024 at 12:24 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ttan_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_category` int(10) NOT NULL,
  `name_category` char(25) DEFAULT NULL COMMENT 'ALL | PC | LAPTOP | GAMING | OFFICE',
  `abbreviation_category` char(5) DEFAULT NULL COMMENT 'ALL | PC | LT | GM | OFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `abbreviation_category`) VALUES
(1, 'ALL', 'ALL'),
(2, 'PC', 'PC'),
(3, 'LAPTOP', 'LT'),
(4, 'GAMING', 'GM'),
(5, 'OFFICE', 'OFF');

-- --------------------------------------------------------

--
-- Table structure for table `categories_sub`
--

CREATE TABLE `categories_sub` (
  `id` int(10) NOT NULL,
  `name_category` char(25) NOT NULL,
  `id_category` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_sub`
--

INSERT INTO `categories_sub` (`id`, `name_category`, `id_category`) VALUES
(1, 'PC Gaming', 4),
(2, 'PC Office', 5),
(3, 'Laptop Gaming', 4),
(4, 'Laptop Office', 5),
(5, 'Network Device Gaming', 4),
(6, 'Network Device Office', 5);

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `id_checkout` int(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `quantity_product` char(50) NOT NULL,
  `price_product` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`id_checkout`, `full_name`, `phone_number`, `address`, `name_product`, `quantity_product`, `price_product`) VALUES
(1, 'ThuậnPC', '123123123', 'HCM city', 'Laptop x ASUS', '1,', '17999,'),
(2, 'ThuậnPC 2', '1231231232', 'HCM city2', 'Laptop x ASUS', '1,', '17999,'),
(3, 'Thuan', '123123123', 'HCM city', 'Laptop x ASUS, PC x ASUS Black', '1, 1,', '17999, 29000,'),
(4, 'ThuanPC', '12313212312', 'HCM Cu CHI', 'PC x ASUS Black, PC x ASUS ROG', '1, 1,', '29000, 23900,');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(10) NOT NULL COMMENT 'ID for Products - start from 0000000001',
  `name_product` char(100) DEFAULT NULL,
  `sub_name_product` char(30) DEFAULT NULL,
  `description_product` varchar(1000) DEFAULT NULL,
  `img_product` char(100) DEFAULT NULL COMMENT 'URL''s image products.',
  `price_product` int(15) DEFAULT NULL,
  `id_category` int(10) NOT NULL,
  `id_category_sub` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `sub_name_product`, `description_product`, `img_product`, `price_product`, `id_category`, `id_category_sub`) VALUES
(4, 'PC x ASUS Black', 'Stream PC ASUS', 'The image displays a modern, high-performance personal computer (PC) with a transparent side panel showcasing its internal components. The PC features multiple RGB fans—three at the front and one at the back—providing vibrant, customizable lighting that adds to the aesthetic appeal. Inside, there is a large CPU cooler mounted on top of the motherboard, which is equipped with RAM sticks that also have RGB lighting. Various cables are neatly routed and managed, contributing to the clean look of the setup. The graphics card is mounted vertically, displaying its branding prominently towards the transparent side panel. This PC’s design focuses on both performance and visual flair, making it interesting for those who appreciate technology and design.', 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001.png', 29000, 2, 1),
(5, 'PC x ASUS ROG', 'ROG Strix', 'The ASUS ROG (Republic of Gamers) series. The tower has a black chassis with angular designs and features RGB lighting that emits a spectrum of colors along its front panel, adding to its aesthetic appeal. The side panel appears to be transparent, allowing a view into the internal components which include various illuminated parts, likely also RGB lit. This PC’s design is interesting as it showcases the typical gamer-centric style with emphasis on LED lighting and clear side panels that display high-performance hardware within.', 'products_img/pc/PCGM/ASUS/PCGM0002/PCGM0002.png', 23900, 2, 1),
(6, 'Laptop x ASUS', 'ROG Strix RGB', 'The Asus ROG Strix G15 is a powerful gaming laptop designed for serious gamers. It features a sleek and slim design, equipped with high-performance components like the AMD Ryzen 6000 Series CPUs and DDR5 RAM, ensuring smooth and efficient gameplay. The laptop also boasts a vibrant RGB lighting system, adding a stylish touch to its robust build. With a high refresh rate display and advanced cooling system, the ROG Strix G15 delivers an immersive gaming experience, making it a top choice for gaming enthusiasts.', 'products_img/laptop/LTGM/ASUS/LTGM0001/LTGM0001.png', 17999, 3, 3),
(7, 'Laptop x Lenovo', 'Legion Pro 7', 'The Lenovo Legion Pro 7 is a high-performance gaming laptop designed for serious gamers and creators. It features a 16-inch WQXGA display with a 240Hz refresh rate, providing stunning visuals and smooth gameplay. Powered by the latest Intel Core i9 processor and NVIDIA GeForce RTX 4090 graphics, it delivers exceptional performance for demanding tasks. With 32GB of RAM and a 1TB SSD, it offers ample memory and storage for all your needs. The laptop also includes a backlit keyboard, advanced cooling system, and a sleek Onyx Gray design, making it both powerful and stylish.\r\n', 'products_img/laptop/LTGM/Lenovo/LTGM0001/LTGM0001.png', 18499, 3, 3),
(8, 'Laptop x MSI', 'GS73 Gaming', 'The MSI GS73 Gaming laptop is a powerful and sleek device designed for gamers who demand high performance. It features a 17.3-inch Full HD display with a 120Hz refresh rate, ensuring smooth and vibrant visuals. Powered by an Intel Core i7 processor and NVIDIA GeForce GTX 1050 Ti graphics, it handles demanding games and applications with ease. The laptop includes 16GB of DDR4 RAM and a combination of a 256GB SSD and a 1TB HDD for ample storage and quick load times.', 'products_img/laptop/LTGM/MSI/LTGM0001/LTGM0001.png', 19999, 3, 3),
(9, 'Laptop x Dell', 'Inspiron 15', 'The Dell Inspiron 15 is a reliable and efficient office laptop designed for productivity. It features a 15.6-inch Full HD display, providing clear and vibrant visuals for all your work tasks. Powered by an Intel Core i5 processor and 8GB of RAM, it ensures smooth performance for multitasking and running office applications. The laptop also includes a 256GB SSD for fast boot times and ample storage.', 'products_img/laptop/LTVP/DELL/LTVP0001/LTVP0001.png', 10099, 3, 4),
(10, 'PC x HP', 'ProDesk 400 G6', 'The HP ProDesk 400 G6 is a reliable and efficient office PC designed to meet the needs of modern workplaces. It features a compact design that fits easily into any office environment. Powered by an Intel Core i5 processor and 8GB of RAM, it ensures smooth performance for multitasking and running office applications. The PC includes a 256GB SSD for fast boot times and ample storage. With multiple connectivity options, including USB-C, HDMI, and DisplayPort, it offers great flexibility for connecting peripherals.', 'products_img/pc/PCVP/HP/PCVP0001/PCVP0001.png', 8999, 2, 2),
(11, 'Router x ASUS', 'GT-AXE16000', 'The ASUS ROG Rapture GT-AXE16000 is a top-tier gaming router designed to deliver unparalleled performance for gamers. It features quad-band WiFi 6E technology, providing ultra-fast speeds up to 16000 Mbps. With dual 10G ports and a 2.5G WAN port, it ensures high-speed data transfer and low latency, crucial for competitive gaming. The router also includes advanced features like triple-level game acceleration, AiMesh support for flexible network configurations, and robust network security.', 'products_img/network_device/NDGM/NDGM0001/NDGM0001.png', 499, 4, 5),
(12, 'Router x TP Link', 'Archer AX73', 'The TP-Link Archer AX73 is an excellent office router designed to provide reliable and high-speed internet connectivity. It features dual-band WiFi 6 technology, offering speeds up to 5400 Mbps, which ensures smooth and efficient performance for multiple devices. The router includes advanced features such as MU-MIMO and OFDMA, which help to reduce latency and improve overall network efficiency. With its robust security features, including WPA3 encryption and a built-in firewall, the Archer AX73 ensures your office network remains secure.', 'products_img/network_device/NDVP/LTVP0001/LTVP0001.png', 79, 5, 6),
(13, 'PC  x Aorus', 'Gaming Gear', 'The Aorus gaming PC in the image is a high-performance machine designed for gamers. It features a sleek black tower case with angular lines and a transparent side panel, showcasing the internal components illuminated by vibrant RGB lighting, including the Aorus logo. The front panel has a textured pattern with ventilation features for optimal cooling. This gaming PC is equipped with powerful hardware tailored for gaming, making it both visually striking and highly efficient for demanding gaming sessions.', 'products_img/pc/PCGM/Aorus/PCGM0001/PCGM0001.png', 20099, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_img`
--

CREATE TABLE `products_img` (
  `id` int(10) NOT NULL,
  `img_product` char(100) NOT NULL,
  `id_product` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_img`
--

INSERT INTO `products_img` (`id`, `img_product`, `id_product`) VALUES
(1, 'products_img/laptop/LTGM/ASUS/LTGM0001/LTGM0001.png', 6),
(2, 'products_img/laptop/LTGM/ASUS/LTGM0001/LTGM0001-1.png', 6),
(3, 'products_img/laptop/LTGM/ASUS/LTGM0001/LTGM0001-2.png', 6),
(4, 'products_img/laptop/LTGM/ASUS/LTGM0001/LTGM0001-3.png', 6),
(5, 'products_img/laptop/LTGM/ASUS/LTGM0001/LTGM0001-4.png', 6),
(6, 'products_img/pc/PCGM/ASUS/PCGM0002/PCGM0002.png', 5),
(7, 'products_img/pc/PCGM/ASUS/PCGM0002/PCGM0002-1.png', 5),
(8, 'products_img/pc/PCGM/ASUS/PCGM0002/PCGM0002-2.png', 5),
(9, 'products_img/pc/PCGM/ASUS/PCGM0002/PCGM0002-3.png', 5),
(10, 'products_img/pc/PCGM/ASUS/PCGM0002/PCGM0002-4.png', 5),
(11, 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001.png', 4),
(12, 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001-1.png', 4),
(13, 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001-2.png', 4),
(14, 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001-3.png', 4),
(15, 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001-4.png', 4),
(16, 'products_img/laptop/LTGM/Lenovo/LTGM0001/LTGM0001-1.png', 7),
(17, 'products_img/laptop/LTGM/Lenovo/LTGM0001/LTGM0001-2.png', 7),
(18, 'products_img/laptop/LTGM/Lenovo/LTGM0001/LTGM0001-3.png', 7),
(19, 'products_img/laptop/LTGM/Lenovo/LTGM0001/LTGM0001-4.png', 7),
(20, 'products_img/laptop/LTGM/MSI/LTGM0001/LTGM0001-1.png', 8),
(21, 'products_img/laptop/LTGM/MSI/LTGM0001/LTGM0001-2.png', 8),
(22, 'products_img/laptop/LTGM/MSI/LTGM0001/LTGM0001-3.png', 8),
(23, 'products_img/laptop/LTGM/MSI/LTGM0001/LTGM0001-4.png', 8),
(24, 'products_img/laptop/LTVP/DELL/LTVP0001/LTVP0001-1.png', 9),
(25, 'products_img/laptop/LTVP/DELL/LTVP0001/LTVP0001-2.png', 9),
(26, 'products_img/laptop/LTVP/DELL/LTVP0001/LTVP0001-3.png', 9),
(27, 'products_img/laptop/LTVP/DELL/LTVP0001/LTVP0001-4.png', 9),
(28, 'products_img/pc/PCVP/HP/PCVP0001/PCVP0001-1.png', 10),
(29, 'products_img/pc/PCVP/HP/PCVP0001/PCVP0001-2.png', 10),
(30, 'products_img/pc/PCVP/HP/PCVP0001/PCVP0001-3.png', 10),
(31, 'products_img/pc/PCVP/HP/PCVP0001/PCVP0001-4.png', 10),
(32, 'products_img/network_device/NDGM/NDGM0001/NDGM0001-1.png', 11),
(33, 'products_img/network_device/NDGM/NDGM0001/NDGM0001-2.png', 11),
(34, 'products_img/network_device/NDGM/NDGM0001/NDGM0001-3.png', 11),
(35, 'products_img/network_device/NDGM/NDGM0001/NDGM0001-4.png', 11),
(36, 'products_img/network_device/NDVP/LTVP0001/LTVP0001-1.png', 12),
(37, 'products_img/network_device/NDVP/LTVP0001/LTVP0001-2.png', 12),
(38, 'products_img/network_device/NDVP/LTVP0001/LTVP0001-3.png', 12),
(39, 'products_img/network_device/NDVP/LTVP0001/LTVP0001-4.png', 12),
(40, 'products_img/pc/PCGM/Aorus/PCGM0001/PCGM0001-1.png', 13),
(41, 'products_img/pc/PCGM/Aorus/PCGM0001/PCGM0001-2.png', 13),
(42, 'products_img/pc/PCGM/Aorus/PCGM0001/PCGM0001-3.png', 13),
(43, 'products_img/pc/PCGM/Aorus/PCGM0001/PCGM0001-4.png', 13);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `first_name`, `last_name`, `password`) VALUES
(1, 'thuanpc@gmail.com', 'Thuan', 'Huynh', '$2y$10$C5aENaccnRYG56yB37LvnOsNoLmcVRvRNNkeHH/pu4DiiLeXfKOWW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `categories_sub`
--
ALTER TABLE `categories_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id_checkout`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_category_sub` (`id_category_sub`);

--
-- Indexes for table `products_img`
--
ALTER TABLE `products_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories_sub`
--
ALTER TABLE `categories_sub`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id_checkout` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_img`
--
ALTER TABLE `products_img`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category_sub`) REFERENCES `categories_sub` (`id`);

--
-- Constraints for table `products_img`
--
ALTER TABLE `products_img`
  ADD CONSTRAINT `products_img_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
