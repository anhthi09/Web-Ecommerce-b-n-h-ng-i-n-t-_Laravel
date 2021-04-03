-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 03, 2021 lúc 07:15 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `elaravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_21_180448_create_tbl_admin_table', 1),
(5, '2021_03_22_155800_create_tbl_category_product', 2),
(6, '2021_03_23_104010_create_tbl_brand_product', 3),
(7, '2021_03_23_170811_create_tbl_product', 4),
(8, '2021_03_31_050104_tbl_customer', 5),
(9, '2021_03_31_062720_tbl_shipping', 6),
(15, '2021_04_03_103856_tbl_payment', 7),
(16, '2021_04_03_104001_tbl_order', 7),
(17, '2021_04_03_104053_tbl_order_detail', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'HoaiThuong', '0967738407', '2021-03-21 17:00:00', '2021-03-21 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(2, 'Đồng hồ', 'hàng fake 1', 1, '2021-03-23 16:36:04', '2021-03-23 16:36:04'),
(3, 'Điện thoại', 'kkk', 1, '2021-03-23 18:19:11', '2021-03-23 18:19:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(16, 'thuan', 'khung', 0, NULL, NULL),
(17, 'Iphoness', 'xịn', 0, NULL, NULL),
(18, 'Thuong', 'h', 1, NULL, NULL),
(20, 'Iphonecuathuan', 'hàng nhựa', 1, '2021-03-23 09:56:30', '2021-03-23 09:56:30'),
(21, 'thuan', 'map u', 1, '2021-03-23 10:02:30', '2021-03-23 10:02:30'),
(22, 'Iphone', 'kkkk', 1, '2021-03-23 18:18:49', '2021-03-23 18:18:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `created_at`, `updated_at`) VALUES
(7, 'Thuong', 'thuongtran2062000@gmail.com', '84bbde58f1dc2e1152bc584b8503d802', '0967738407', NULL, NULL),
(8, 'Thuận', 'thuankhung@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0395700403', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 8, 8, 1, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:30:41', '2021-04-03 14:30:41'),
(2, 8, 8, 2, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:35:30', '2021-04-03 14:35:30'),
(3, 8, 8, 3, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:39:50', '2021-04-03 14:39:50'),
(4, 8, 8, 4, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:40:09', '2021-04-03 14:40:09'),
(5, 8, 8, 5, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:40:59', '2021-04-03 14:40:59'),
(6, 8, 8, 6, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:41:14', '2021-04-03 14:41:14'),
(7, 8, 8, 7, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:42:13', '2021-04-03 14:42:13'),
(8, 8, 8, 8, '6,050,000.00', 'Đang chờ xử lí', '2021-04-03 14:42:48', '2021-04-03 14:42:48'),
(9, 8, 10, 9, '12,100,000.00', 'Đang chờ xử lí', '2021-04-03 14:43:25', '2021-04-03 14:43:25'),
(10, 8, 10, 10, '12,100,000.00', 'Đang chờ xử lí', '2021-04-03 14:43:52', '2021-04-03 14:43:52'),
(11, 8, 10, 11, '12,100,000.00', 'Đang chờ xử lí', '2021-04-03 14:44:27', '2021-04-03 14:44:27'),
(12, 8, 10, 12, '12,100,000.00', 'Đang chờ xử lí', '2021-04-03 14:45:36', '2021-04-03 14:45:36'),
(13, 8, 10, 13, '12,100,000.00', 'Đang chờ xử lí', '2021-04-03 14:45:56', '2021-04-03 14:45:56'),
(14, 8, 10, 14, '12,100,000.00', 'Đang chờ xử lí', '2021-04-03 14:50:50', '2021-04-03 14:50:50'),
(15, 8, 10, 15, '12,100,000.00', 'Đang chờ xử lí', '2021-04-03 14:51:12', '2021-04-03 14:51:12'),
(16, 8, 10, 16, '0.00', 'Đang chờ xử lí', '2021-04-03 14:51:55', '2021-04-03 14:51:55'),
(17, 8, 10, 17, '0.00', 'Đang chờ xử lí', '2021-04-03 14:51:59', '2021-04-03 14:51:59'),
(18, 8, 10, 18, '0.00', 'Đang chờ xử lí', '2021-04-03 14:53:01', '2021-04-03 14:53:01'),
(19, 8, 10, 19, '0.00', 'Đang chờ xử lí', '2021-04-03 14:54:15', '2021-04-03 14:54:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(1, 5, 9, 'HoaiThuongheo', '5000000', 1, NULL, NULL),
(2, 6, 9, 'HoaiThuongheo', '5000000', 1, NULL, NULL),
(3, 7, 9, 'HoaiThuongheo', '5000000', 1, NULL, NULL),
(4, 8, 9, 'HoaiThuongheo', '5000000', 1, NULL, NULL),
(5, 9, 9, 'HoaiThuongheo', '5000000', 2, NULL, NULL),
(6, 10, 9, 'HoaiThuongheo', '5000000', 2, NULL, NULL),
(7, 11, 9, 'HoaiThuongheo', '5000000', 2, NULL, NULL),
(8, 12, 9, 'HoaiThuongheo', '5000000', 2, NULL, NULL),
(9, 13, 9, 'HoaiThuongheo', '5000000', 2, NULL, NULL),
(10, 14, 9, 'HoaiThuongheo', '5000000', 2, NULL, NULL),
(11, 15, 9, 'HoaiThuongheo', '5000000', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Đang chờ xử lí', NULL, NULL),
(2, '1', 'Đang chờ xử lí', NULL, NULL),
(3, '1', 'Đang chờ xử lí', NULL, NULL),
(4, '1', 'Đang chờ xử lí', NULL, NULL),
(5, '1', 'Đang chờ xử lí', NULL, NULL),
(6, '2', 'Đang chờ xử lí', NULL, NULL),
(7, '2', 'Đang chờ xử lí', NULL, NULL),
(8, '2', 'Đang chờ xử lí', NULL, NULL),
(9, '2', 'Đang chờ xử lí', NULL, NULL),
(10, '2', 'Đang chờ xử lí', NULL, NULL),
(11, '2', 'Đang chờ xử lí', NULL, NULL),
(12, '2', 'Đang chờ xử lí', NULL, NULL),
(13, '2', 'Đang chờ xử lí', NULL, NULL),
(14, '2', 'Đang chờ xử lí', NULL, NULL),
(15, '2', 'Đang chờ xử lí', NULL, NULL),
(16, '2', 'Đang chờ xử lí', NULL, NULL),
(17, '2', 'Đang chờ xử lí', NULL, NULL),
(18, '2', 'Đang chờ xử lí', NULL, NULL),
(19, '2', 'Đang chờ xử lí', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `category_id`, `product_name`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(2, 22, 'hahaaaaaaaaaaaaaaaaaaa', 3, 'kkkkkkkk', 'kkkkkkkkkkkkk', '121212121', 'Nguyen_Huy_Binh163.jpg', 1, '2021-03-23 18:58:28', '2021-03-23 18:58:28'),
(3, 22, 'â', 3, 'a', 'a', '11', 'Nguyen_Huy_Binh166.jpg', 1, '2021-03-24 05:47:37', '2021-03-24 05:47:37'),
(5, 20, 'hahaaaaa', 2, 'hahahaha', 'hhhhhh', '11', 'Nguyen_Huy_Binh134.jpg', 1, '2021-03-24 07:25:11', '2021-03-24 07:25:11'),
(7, 20, 'hahaaaaa', 2, 'hahahaha', 'hhhhhh', '100000', 'Nguyen_Huy_Binh130.jpg', 1, '2021-03-24 07:51:07', '2021-03-24 07:51:07'),
(9, 22, 'HoaiThuongheo', 3, 'hàng sale', 'kkkkkkkkkkk', '5000000', 'anh-dep-chup-dien-thoai60.jpg', 1, '2021-03-26 15:57:11', '2021-03-26 15:57:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `shipping_notes`, `created_at`, `updated_at`) VALUES
(1, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'giao nhanh', NULL, NULL),
(2, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'hàng dễ vỡ xin nhẹ tay', NULL, NULL),
(3, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'aaaaaa', NULL, NULL),
(4, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'aaaaaa', NULL, NULL),
(5, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'aaaaaa', NULL, NULL),
(6, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'vvv', NULL, NULL),
(7, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'fjdhsjfhsdkj', NULL, NULL),
(8, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'haha', NULL, NULL),
(9, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'haha', NULL, NULL),
(10, 'Thương', 'hhaajhaashjahsj', '09677384047', 'thuong@gmail.com', 'vvvvvvvvvv', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '', 'admin@gmail.com', NULL, '123456', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
