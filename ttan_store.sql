-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:8889
-- Thời gian đã tạo: Th9 21, 2024 lúc 08:38 AM
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
  `id_category` char(10) NOT NULL,
  `name_category` char(25) DEFAULT NULL COMMENT 'ALL | PC | LAPTOP | GAMING | OFFICE',
  `abbreviation_category` char(5) DEFAULT NULL COMMENT 'ALL | PC | LT | GM | OFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `abbreviation_category`) VALUES
('1', 'ALL', 'ALL'),
('2', 'PC', 'PC'),
('3', 'LAPTOP', 'LT'),
('4', 'GAMING', 'GM'),
('5', 'OFFICE', 'OFF');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_product` char(10) NOT NULL COMMENT 'ID for Products - start form SP00000001',
  `name_product` varchar(100) DEFAULT NULL,
  `sub_name_product` varchar(30) DEFAULT NULL,
  `img_product` varchar(100) DEFAULT NULL COMMENT 'URL''s image products.',
  `price_product` int(15) DEFAULT NULL,
  `id_category` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `sub_name_product`, `img_product`, `price_product`, `id_category`) VALUES
('SP00000001', 'PC x ASUS Black', 'Stream PC ASUS', 'products_img/pc/PCGM/ASUS/PCGM0001.png', 29000, '2'),
('SP00000002', 'PC x ASUS ROG', 'ROG Strix', 'products_img/pc/PCGM/ASUS/PCGM0002.png', 23900, '2'),
('SP00000003', 'Laptop x ASUS', 'ROG Strix RGB', 'products_img/laptop/LTGM/ASUS/LTGM0001.png', 17999, '3');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
