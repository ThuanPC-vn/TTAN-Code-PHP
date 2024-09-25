-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:8889
-- Thời gian đã tạo: Th9 25, 2024 lúc 03:46 AM
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
-- Cấu trúc bảng cho bảng `checkout`
--

CREATE TABLE `checkout` (
  `id_checkout` int(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `name_product` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `checkout`
--

INSERT INTO `checkout` (`id_checkout`, `full_name`, `phone_number`, `address`, `name_product`) VALUES
(6, 'ThuậnPC', '123123123', 'HCM Vietnam', 'Laptop x ASUS, PC x ASUS Black, PC x ASUS ROG'),
(7, 'Test User 1', '1231231230', 'HCM City', 'PC x ASUS Black');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_product` int(10) NOT NULL COMMENT 'ID for Products - start from 0000000001',
  `name_product` varchar(100) DEFAULT NULL,
  `sub_name_product` varchar(30) DEFAULT NULL,
  `img_product` varchar(100) DEFAULT NULL COMMENT 'URL''s image products.',
  `price_product` int(15) DEFAULT NULL,
  `id_category` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `sub_name_product`, `img_product`, `price_product`, `id_category`) VALUES
(4, 'PC x ASUS Black', 'Stream PC ASUS', 'products_img/pc/PCGM/ASUS/PCGM0001.png', 29000, 2),
(5, 'PC x ASUS ROG', 'ROG Strix', 'products_img/pc/PCGM/ASUS/PCGM0002.png', 23900, 2),
(6, 'Laptop x ASUS', 'ROG Strix RGB', 'products_img/laptop/LTGM/ASUS/LTGM0001.png', 17999, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

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
  ADD KEY `id_category` (`id_category`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id_checkout` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
