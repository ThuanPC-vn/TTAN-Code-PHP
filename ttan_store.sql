-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:8889
-- Thời gian đã tạo: Th10 15, 2024 lúc 07:36 AM
-- Phiên bản máy phục vụ: 5.7.24
-- Phiên bản PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ttan_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id_category` int(10) NOT NULL,
  `name_category` char(25) DEFAULT NULL COMMENT 'ALL | PC | LAPTOP | GAMING | OFFICE',
  `abbreviation_category` char(5) DEFAULT NULL COMMENT 'ALL | PC | LT | GM | OFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `abbreviation_category`) VALUES
(1, 'ALL', 'ALL'),
(2, 'PC', 'PC'),
(3, 'LAPTOP', 'LT'),
(4, 'GAMING', 'GM'),
(5, 'OFFICE', 'OFF');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories_sub`
--

CREATE TABLE `categories_sub` (
  `id` int(10) NOT NULL,
  `name_category` char(25) NOT NULL,
  `id_category` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories_sub`
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
-- Cấu trúc bảng cho bảng `checkout`
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
-- Đang đổ dữ liệu cho bảng `checkout`
--

INSERT INTO `checkout` (`id_checkout`, `full_name`, `phone_number`, `address`, `name_product`, `quantity_product`, `price_product`) VALUES
(1, 'ThuậnPC', '123123123', 'HCM city', 'Laptop x ASUS', '1,', '17999,'),
(2, 'ThuậnPC 2', '1231231232', 'HCM city2', 'Laptop x ASUS', '1,', '17999,');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
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
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `sub_name_product`, `description_product`, `img_product`, `price_product`, `id_category`, `id_category_sub`) VALUES
(4, 'PC x ASUS Black', 'Stream PC ASUS', 'The image displays a modern, high-performance personal computer (PC) with a transparent side panel showcasing its internal components. The PC features multiple RGB fans—three at the front and one at the back—providing vibrant, customizable lighting that adds to the aesthetic appeal. Inside, there is a large CPU cooler mounted on top of the motherboard, which is equipped with RAM sticks that also have RGB lighting. Various cables are neatly routed and managed, contributing to the clean look of the setup. The graphics card is mounted vertically, displaying its branding prominently towards the transparent side panel. This PC’s design focuses on both performance and visual flair, making it interesting for those who appreciate technology and design.', 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001.png', 29000, 2, 1),
(5, 'PC x ASUS ROG', 'ROG Strix', 'The ASUS ROG (Republic of Gamers) series. The tower has a black chassis with angular designs and features RGB lighting that emits a spectrum of colors along its front panel, adding to its aesthetic appeal. The side panel appears to be transparent, allowing a view into the internal components which include various illuminated parts, likely also RGB lit. This PC’s design is interesting as it showcases the typical gamer-centric style with emphasis on LED lighting and clear side panels that display high-performance hardware within.', 'products_img/pc/PCGM/ASUS/PCGM0002/PCGM0002.png', 23900, 2, 1),
(6, 'Laptop x ASUS', 'ROG Strix RGB', 'The Asus ROG Strix G15 is a powerful gaming laptop designed for serious gamers. It features a sleek and slim design, equipped with high-performance components like the AMD Ryzen 6000 Series CPUs and DDR5 RAM, ensuring smooth and efficient gameplay. The laptop also boasts a vibrant RGB lighting system, adding a stylish touch to its robust build. With a high refresh rate display and advanced cooling system, the ROG Strix G15 delivers an immersive gaming experience, making it a top choice for gaming enthusiasts.', 'products_img/laptop/LTGM/ASUS/LTGM0001/LTGM0001.png', 17999, 3, 3),
(7, 'Laptop x Lenovo', 'Gaming Gear', NULL, 'products_img/laptop/LTGM/Lenovo/LTGM0001/LTGM0001.png', 18499, 3, 3),
(8, 'Laptop x MSI', 'GS73 Gaming', NULL, 'products_img/laptop/LTGM/MSI/LTGM0001/LTGM0001.png', 19999, 3, 3),
(9, 'Laptop x Dell', 'Office Laptop', NULL, 'products_img/laptop/LTVP/DELL/LTVP0001/LTVP0001.png', 10099, 3, 4),
(10, 'PC x HP', 'Office PC', NULL, 'products_img/pc/PCVP/HP/PCVP0001/PCVP0001.png', 8999, 2, 2),
(11, 'Router x ASUS', 'Gaming Router', NULL, 'products_img/network_device/NDGM/NDGM0001/NDGM0001.png', 499, 4, 5),
(12, 'Router x TP Link', 'Office Router', NULL, 'products_img/network_device/NDVP/LTVP0001/LTVP0001.png', 79, 5, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_img`
--

CREATE TABLE `products_img` (
  `id` int(10) NOT NULL,
  `img_product` char(100) NOT NULL,
  `id_product` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products_img`
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
(15, 'products_img/pc/PCGM/ASUS/PCGM0001/PCGM0001-4.png', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_user`, `email`, `first_name`, `last_name`, `password`) VALUES
(1, 'thuanpc@gmail.com', 'Thuan', 'Huynh', '$2y$10$C5aENaccnRYG56yB37LvnOsNoLmcVRvRNNkeHH/pu4DiiLeXfKOWW');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Chỉ mục cho bảng `categories_sub`
--
ALTER TABLE `categories_sub`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id_checkout`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_category_sub` (`id_category_sub`);

--
-- Chỉ mục cho bảng `products_img`
--
ALTER TABLE `products_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories_sub`
--
ALTER TABLE `categories_sub`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id_checkout` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products_img`
--
ALTER TABLE `products_img`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category_sub`) REFERENCES `categories_sub` (`id`);

--
-- Các ràng buộc cho bảng `products_img`
--
ALTER TABLE `products_img`
  ADD CONSTRAINT `products_img_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
