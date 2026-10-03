-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table bagisto_db.addresses
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.addresses: ~5 rows (approximately)
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'cart_billing', NULL, NULL, 1, NULL, 'Nguyễn', 'Hùng', NULL, '', '127e le lu', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-09-28 02:29:06', '2026-09-28 02:29:06'),
	(2, 'cart_shipping', NULL, NULL, 1, NULL, 'Nguyễn', 'Hùng', NULL, '', '127e le lu', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-28 02:29:06', '2026-09-28 02:29:06'),
	(3, 'order_shipping', NULL, NULL, NULL, 1, 'Nguyễn', 'Hùng', NULL, '', '127e le lu', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-28 02:29:18', '2026-09-28 02:29:18'),
	(4, 'order_billing', NULL, NULL, NULL, 1, 'Nguyễn', 'Hùng', NULL, '', '127e le lu', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-28 02:29:18', '2026-09-28 02:29:18'),
	(5, 'customer', NULL, 1, NULL, NULL, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:42:55', '2026-09-29 07:42:55'),
	(6, 'cart_billing', 5, 1, 2, NULL, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-09-29 07:42:57', '2026-09-29 07:42:57'),
	(7, 'cart_shipping', 5, 1, 2, NULL, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:42:57', '2026-09-29 07:42:57'),
	(8, 'order_shipping', NULL, NULL, NULL, 2, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(9, 'order_billing', NULL, NULL, NULL, 2, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(10, 'cart_billing', 5, 1, 3, NULL, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-09-29 07:47:48', '2026-09-29 07:47:48'),
	(11, 'cart_shipping', 5, 1, 3, NULL, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:47:48', '2026-09-29 07:47:48'),
	(12, 'order_shipping', NULL, NULL, NULL, 3, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:48:01', '2026-09-29 07:48:01'),
	(13, 'order_billing', NULL, NULL, NULL, 3, 'Nguyễn', 'Hùng', NULL, '', '127e lê', 'TÂN PHÚ', 'HỒ CHÍ MINH', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:48:01', '2026-09-29 07:48:01');

-- Dumping structure for table bagisto_db.admins
DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_backup_codes` json DEFAULT NULL,
  `two_factor_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.admins: ~0 rows (approximately)
INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `two_factor_secret`, `two_factor_enabled`, `two_factor_backup_codes`, `two_factor_verified_at`, `created_at`, `updated_at`) VALUES
	(1, 'Example', 'admin@example.com', '$2y$12$9r2x1jhlp6qZUThlAQvOgeojQ1nCo3VYUP1xU8D6Eq6OVYJojFNtq', 'DuKLojCLzhbCMd7lLeQSwB1IQp17GdBVEUKbnQM8hR3xMRlVo6nlVwDt4QIrgFo9t6sntlPnDf4oQz3a', 1, 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.admin_password_resets
DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.admin_password_resets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.agent_conversations
DROP TABLE IF EXISTS `agent_conversations`;
CREATE TABLE IF NOT EXISTS `agent_conversations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_conversations_user_id_updated_at_index` (`user_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.agent_conversations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.agent_conversation_messages
DROP TABLE IF EXISTS `agent_conversation_messages`;
CREATE TABLE IF NOT EXISTS `agent_conversation_messages` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_calls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_results` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_index` (`conversation_id`,`user_id`,`updated_at`),
  KEY `agent_conversation_messages_user_id_index` (`user_id`),
  KEY `agent_conversation_messages_conversation_id_index` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.agent_conversation_messages: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.attributes
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attributes: ~30 rows (approximately)
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
	(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(20, 'width', 'Width', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(21, 'height', 'Height', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(23, 'color', 'Color', 'select', NULL, NULL, NULL, 26, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(24, 'size', 'Size', 'select', NULL, NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(25, 'brand', 'Brand', 'select', NULL, NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(29, 'allow_rma', 'Allow RMA', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(30, 'rma_rule_id', 'RMA Rules', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01');

-- Dumping structure for table bagisto_db.attribute_families
DROP TABLE IF EXISTS `attribute_families`;
CREATE TABLE IF NOT EXISTS `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_families: ~0 rows (approximately)
INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
	(1, 'default', 'Default', 0, 1);

-- Dumping structure for table bagisto_db.attribute_groups
DROP TABLE IF EXISTS `attribute_groups`;
CREATE TABLE IF NOT EXISTS `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_groups: ~8 rows (approximately)
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
	(1, 'general', 1, 'General', 1, 1, 0),
	(2, 'description', 1, 'Description', 1, 2, 0),
	(3, 'meta_description', 1, 'Meta Description', 1, 3, 0),
	(4, 'price', 1, 'Price', 2, 1, 0),
	(5, 'shipping', 1, 'Shipping', 2, 2, 0),
	(6, 'settings', 1, 'Settings', 2, 3, 0),
	(7, 'inventories', 1, 'Inventories', 2, 4, 0),
	(8, 'rma', 1, 'RMA', 2, 5, 0);

-- Dumping structure for table bagisto_db.attribute_group_mappings
DROP TABLE IF EXISTS `attribute_group_mappings`;
CREATE TABLE IF NOT EXISTS `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_group_mappings: ~30 rows (approximately)
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
	(1, 1, 1),
	(2, 1, 3),
	(3, 1, 4),
	(4, 1, 5),
	(5, 6, 1),
	(6, 6, 2),
	(7, 6, 3),
	(8, 6, 4),
	(9, 2, 1),
	(10, 2, 2),
	(11, 4, 1),
	(12, 4, 2),
	(13, 4, 3),
	(14, 4, 4),
	(15, 4, 5),
	(16, 3, 1),
	(17, 3, 2),
	(18, 3, 3),
	(19, 5, 1),
	(20, 5, 2),
	(21, 5, 3),
	(22, 5, 4),
	(23, 1, 6),
	(24, 1, 7),
	(25, 1, 8),
	(26, 6, 5),
	(27, 1, 2),
	(28, 7, 1),
	(29, 8, 1),
	(30, 8, 2);

-- Dumping structure for table bagisto_db.attribute_options
DROP TABLE IF EXISTS `attribute_options`;
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_options: ~9 rows (approximately)
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES
	(1, 23, 'Red', 1, NULL),
	(2, 23, 'Green', 2, NULL),
	(3, 23, 'Yellow', 3, NULL),
	(4, 23, 'Black', 4, NULL),
	(5, 23, 'White', 5, NULL),
	(6, 24, 'S', 1, NULL),
	(7, 24, 'M', 2, NULL),
	(8, 24, 'L', 3, NULL),
	(9, 24, 'XL', 4, NULL);

-- Dumping structure for table bagisto_db.attribute_option_translations
DROP TABLE IF EXISTS `attribute_option_translations`;
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `swatch_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_option_translations: ~9 rows (approximately)
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`, `swatch_alt`) VALUES
	(1, 1, 'en', 'Red', NULL),
	(2, 2, 'en', 'Green', NULL),
	(3, 3, 'en', 'Yellow', NULL),
	(4, 4, 'en', 'Black', NULL),
	(5, 5, 'en', 'White', NULL),
	(6, 6, 'en', 'S', NULL),
	(7, 7, 'en', 'M', NULL),
	(8, 8, 'en', 'L', NULL),
	(9, 9, 'en', 'XL', NULL);

-- Dumping structure for table bagisto_db.attribute_translations
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_translations: ~30 rows (approximately)
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'SKU'),
	(2, 2, 'en', 'Name'),
	(3, 3, 'en', 'URL Key'),
	(4, 4, 'en', 'Tax Category'),
	(5, 5, 'en', 'New'),
	(6, 6, 'en', 'Featured'),
	(7, 7, 'en', 'Visible Individually'),
	(8, 8, 'en', 'Status'),
	(9, 9, 'en', 'Short Description'),
	(10, 10, 'en', 'Description'),
	(11, 11, 'en', 'Price'),
	(12, 12, 'en', 'Cost'),
	(13, 13, 'en', 'Special Price'),
	(14, 14, 'en', 'Special Price From'),
	(15, 15, 'en', 'Special Price To'),
	(16, 16, 'en', 'Meta Title'),
	(17, 17, 'en', 'Meta Keywords'),
	(18, 18, 'en', 'Meta Description'),
	(19, 19, 'en', 'Length'),
	(20, 20, 'en', 'Width'),
	(21, 21, 'en', 'Height'),
	(22, 22, 'en', 'Weight'),
	(23, 23, 'en', 'Color'),
	(24, 24, 'en', 'Size'),
	(25, 25, 'en', 'Brand'),
	(26, 26, 'en', 'Guest Checkout'),
	(27, 27, 'en', 'Product Number'),
	(28, 28, 'en', 'Manage Stock'),
	(29, 29, 'en', 'Allow RMA'),
	(30, 30, 'en', 'RMA Rules');

-- Dumping structure for table bagisto_db.bookings
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `allow_cancellation` tinyint(1) NOT NULL DEFAULT '1',
  `booking_product_event_ticket_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_item_id_foreign` (`order_item_id`),
  KEY `bookings_booking_product_event_ticket_id_foreign` (`booking_product_event_ticket_id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_booking_product_event_ticket_id_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.bookings: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_products
DROP TABLE IF EXISTS `booking_products`;
CREATE TABLE IF NOT EXISTS `booking_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `allow_cancellation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_appointment_slots
DROP TABLE IF EXISTS `booking_product_appointment_slots`;
CREATE TABLE IF NOT EXISTS `booking_product_appointment_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_appointment_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_default_slots
DROP TABLE IF EXISTS `booking_product_default_slots`;
CREATE TABLE IF NOT EXISTS `booking_product_default_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `booking_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_default_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_event_tickets
DROP TABLE IF EXISTS `booking_product_event_tickets`;
CREATE TABLE IF NOT EXISTS `booking_product_event_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_event_tickets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_event_ticket_translations
DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
CREATE TABLE IF NOT EXISTS `booking_product_event_ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_event_ticket_id` bigint unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bpet_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `bpet_translations_fk` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_event_ticket_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_rental_slots
DROP TABLE IF EXISTS `booking_product_rental_slots`;
CREATE TABLE IF NOT EXISTS `booking_product_rental_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `renting_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_rental_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_table_slots
DROP TABLE IF EXISTS `booking_product_table_slots`;
CREATE TABLE IF NOT EXISTS `booking_product_table_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_table_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `checkout_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart: ~4 rows (approximately)
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'hungnd13112004@gmail.com', 'Nguyễn', 'Hùng', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 999.0000, 999.0000, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, NULL, 1, 0, NULL, NULL, 1, '2026-09-28 02:27:37', '2026-09-28 02:29:24'),
	(2, 'hungnd13112004@gmail.com', 'Nguyễn', 'Hùng', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, NULL, 0, 0, NULL, 1, 1, '2026-09-29 07:42:06', '2026-09-29 07:43:18'),
	(3, 'hungnd13112004@gmail.com', 'Nguyễn', 'Hùng', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, NULL, 0, 0, NULL, 1, 1, '2026-09-29 07:47:36', '2026-09-29 07:48:05'),
	(4, 'hungnd13112004@gmail.com', 'Nguyễn', 'Hùng', NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, NULL, 0, 0, NULL, 1, 1, '2026-09-29 07:54:37', '2026-09-29 07:54:37');

-- Dumping structure for table bagisto_db.cart_items
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_items: ~4 rows (approximately)
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 1, 'PHONE-ROG8PRO-512', 'simple', 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', NULL, 0.3500, 0.3500, 0.3500, 999.0000, 999.0000, NULL, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 999.0000, 999.0000, NULL, NULL, 5, 1, NULL, NULL, '{"cart_id": 1, "quantity": 1, "is_buy_now": "0", "product_id": "5"}', '2026-09-28 02:27:37', '2026-09-28 02:27:37'),
	(2, 1, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 0.3500, 1049.0000, 1049.0000, NULL, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, NULL, NULL, 6, 2, NULL, NULL, '{"cart_id": 2, "quantity": 1, "product_id": 6}', '2026-09-29 07:42:06', '2026-09-29 07:42:06'),
	(3, 1, 'EAR-SONY-WF1000XM5', 'simple', 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC', NULL, 0.3500, 0.3500, 0.3500, 249.9900, 249.9900, NULL, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, NULL, NULL, 12, 3, NULL, NULL, '{"cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:47:36', '2026-09-29 07:47:36'),
	(4, 1, 'EAR-SONY-WF1000XM5', 'simple', 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC', NULL, 0.3500, 0.3500, 0.3500, 249.9900, 249.9900, NULL, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, NULL, NULL, 12, 4, NULL, NULL, '{"locale": "en", "cart_id": 4, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:54:37', '2026-09-29 07:54:37');

-- Dumping structure for table bagisto_db.cart_item_inventories
DROP TABLE IF EXISTS `cart_item_inventories`;
CREATE TABLE IF NOT EXISTS `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_item_inventories: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_payment
DROP TABLE IF EXISTS `cart_payment`;
CREATE TABLE IF NOT EXISTS `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_payment: ~3 rows (approximately)
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES
	(1, 'cashondelivery', 'Cash On Delivery', 1, '2026-09-28 02:29:17', '2026-09-28 02:29:17'),
	(2, 'moneytransfer', 'Money Transfer', 2, '2026-09-29 07:43:11', '2026-09-29 07:43:11'),
	(3, 'cashondelivery', 'Cash On Delivery', 3, '2026-09-29 07:47:56', '2026-09-29 07:47:56');

-- Dumping structure for table bagisto_db.cart_rules
DROP TABLE IF EXISTS `cart_rules`;
CREATE TABLE IF NOT EXISTS `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rules: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_channels
DROP TABLE IF EXISTS `cart_rule_channels`;
CREATE TABLE IF NOT EXISTS `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_channels: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_coupons
DROP TABLE IF EXISTS `cart_rule_coupons`;
CREATE TABLE IF NOT EXISTS `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_coupons: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_coupon_usage
DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
CREATE TABLE IF NOT EXISTS `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_coupon_usage: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_customers
DROP TABLE IF EXISTS `cart_rule_customers`;
CREATE TABLE IF NOT EXISTS `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `customer_id` int unsigned NOT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_customers: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_customer_groups
DROP TABLE IF EXISTS `cart_rule_customer_groups`;
CREATE TABLE IF NOT EXISTS `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_customer_groups: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_translations
DROP TABLE IF EXISTS `cart_rule_translations`;
CREATE TABLE IF NOT EXISTS `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_shipping_rates
DROP TABLE IF EXISTS `cart_shipping_rates`;
CREATE TABLE IF NOT EXISTS `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_shipping_rates: ~6 rows (approximately)
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES
	(3, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 2, '2026-09-28 02:29:11', '2026-09-28 02:29:11', 1),
	(4, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 2, '2026-09-28 02:29:11', '2026-09-28 02:29:11', 1),
	(19, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 7, '2026-09-29 07:43:08', '2026-09-29 07:43:08', 2),
	(20, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 7, '2026-09-29 07:43:08', '2026-09-29 07:43:08', 2),
	(27, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 11, '2026-09-29 07:47:54', '2026-09-29 07:47:54', 3),
	(28, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 11, '2026-09-29 07:47:54', '2026-09-29 07:47:54', 3);

-- Dumping structure for table bagisto_db.catalog_rules
DROP TABLE IF EXISTS `catalog_rules`;
CREATE TABLE IF NOT EXISTS `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rules: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_channels
DROP TABLE IF EXISTS `catalog_rule_channels`;
CREATE TABLE IF NOT EXISTS `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_channels: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_customer_groups
DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
CREATE TABLE IF NOT EXISTS `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_customer_groups: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_products
DROP TABLE IF EXISTS `catalog_rule_products`;
CREATE TABLE IF NOT EXISTS `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_product_prices
DROP TABLE IF EXISTS `catalog_rule_product_prices`;
CREATE TABLE IF NOT EXISTS `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_product_prices: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.categories: ~8 rows (approximately)
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 0, 'products_and_description', 1, 100, NULL, NULL, NULL, '2026-09-28 02:10:01', '2026-09-29 05:52:24'),
	(2, 1, 'category/2/image.png', 1, 'products_and_description', 86, 87, 1, NULL, 'category/2/image.png', '2026-09-28 02:17:35', '2026-09-29 05:52:24'),
	(3, 2, 'category/3/image.png', 1, 'products_and_description', 88, 89, 1, NULL, 'category/3/image.png', '2026-09-28 02:17:35', '2026-09-29 05:52:24'),
	(4, 3, 'category/4/image.png', 1, 'products_and_description', 90, 91, 1, NULL, 'category/4/image.png', '2026-09-28 02:17:35', '2026-09-29 05:52:24'),
	(5, 4, 'category/5/image.png', 1, 'products_and_description', 92, 93, 1, NULL, 'category/5/image.png', '2026-09-28 02:17:35', '2026-09-29 05:52:24'),
	(6, 5, 'category/6/image.png', 1, 'products_and_description', 94, 95, 1, NULL, 'category/6/image.png', '2026-09-28 02:17:35', '2026-09-29 05:52:24'),
	(7, 6, 'category/7/image.png', 1, 'products_and_description', 96, 97, 1, NULL, 'category/7/image.png', '2026-09-28 02:17:35', '2026-09-29 05:52:24'),
	(8, 7, 'category/8/image.png', 1, 'products_and_description', 98, 99, 1, NULL, 'category/8/image.png', '2026-09-28 02:17:35', '2026-09-29 05:52:24');

-- Dumping structure for table bagisto_db.category_filterable_attributes
DROP TABLE IF EXISTS `category_filterable_attributes`;
CREATE TABLE IF NOT EXISTS `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.category_filterable_attributes: ~0 rows (approximately)
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
	(1, 11);

-- Dumping structure for table bagisto_db.category_translations
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `banner_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.category_translations: ~8 rows (approximately)
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `logo_alt`, `banner_alt`, `locale_id`, `locale`) VALUES
	(1, 1, 'Root', 'root', '', '<p>Root Category Description</p>', '', '', '', NULL, NULL, NULL, 'en'),
	(2, 2, 'Flagship Smartphones', 'flagship-smartphones', '', 'Điện thoại thông minh flagship cao cấp hàng đầu thế giới với hiệu năng đỉnh cao, chip thế hệ mới nhất và camera chuyên nghiệp.', 'Flagship Smartphones', 'Điện thoại thông minh flagship cao cấp hàng đầu thế giới với hiệu năng đỉnh cao, chip thế hệ mới nhất và camera chuyên nghiệp.', NULL, NULL, NULL, NULL, 'en'),
	(3, 3, 'Fast Chargers & GaN', 'fast-chargers-gan', '', 'Củ sạc nhanh công nghệ GaN công suất cao 65W - 140W - 240W, sạc đa thiết bị cho Smartphone và Laptop.', 'Fast Chargers & GaN', 'Củ sạc nhanh công nghệ GaN công suất cao 65W - 140W - 240W, sạc đa thiết bị cho Smartphone và Laptop.', NULL, NULL, NULL, NULL, 'en'),
	(4, 4, 'Power Banks', 'power-banks', '', 'Pin sạc dự phòng dung lượng khủng 20.000mAh - 30.000mAh, sạc nhanh công suất lớn thiết kế trong suốt Cyberpunk.', 'Power Banks', 'Pin sạc dự phòng dung lượng khủng 20.000mAh - 30.000mAh, sạc nhanh công suất lớn thiết kế trong suốt Cyberpunk.', NULL, NULL, NULL, NULL, 'en'),
	(5, 5, 'Audio & Gaming Earbuds', 'audio-gaming-earbuds', '', 'Tai nghe True Wireless chống ồn chủ động ANC đỉnh cao, chuẩn âm thanh Hi-Res LDAC và tai nghe Gaming siêu nhạy không độ trễ.', 'Audio & Gaming Earbuds', 'Tai nghe True Wireless chống ồn chủ động ANC đỉnh cao, chuẩn âm thanh Hi-Res LDAC và tai nghe Gaming siêu nhạy không độ trễ.', NULL, NULL, NULL, NULL, 'en'),
	(6, 6, 'Phone Coolers & Gaming Gear', 'phone-coolers-gaming-gear', '', 'Sò lạnh tản nhiệt Gaming công suất 27W - 36W từ tính, giảm nhiệt tức thì 0 độ C cho điện thoại chơi game cấu hình tối đa.', 'Phone Coolers & Gaming Gear', 'Sò lạnh tản nhiệt Gaming công suất 27W - 36W từ tính, giảm nhiệt tức thì 0 độ C cho điện thoại chơi game cấu hình tối đa.', NULL, NULL, NULL, NULL, 'en'),
	(7, 7, 'Thunderbolt Cables & Hubs', 'cables-and-hubs', '', 'Cáp sạc siêu bền bọc dù Type-C Thunderbolt 4 240W truyền dữ liệu 40Gbps và Hub mở rộng đa cổng chuẩn cao cấp.', 'Thunderbolt Cables & Hubs', 'Cáp sạc siêu bền bọc dù Type-C Thunderbolt 4 240W truyền dữ liệu 40Gbps và Hub mở rộng đa cổng chuẩn cao cấp.', NULL, NULL, NULL, NULL, 'en'),
	(8, 8, 'Tough Cases & Screen Protectors', 'cases-and-protectors', '', 'Ốp lưng chống sốc tiêu chuẩn quân đội sợi Kevlar MagSafe và Kính cường lực sapphire siêu cứng chống trầy xước.', 'Tough Cases & Screen Protectors', 'Ốp lưng chống sốc tiêu chuẩn quân đội sợi Kevlar MagSafe và Kính cường lực sapphire siêu cứng chống trầy xước.', NULL, NULL, NULL, NULL, 'en');

-- Dumping structure for table bagisto_db.channels
DROP TABLE IF EXISTS `channels`;
CREATE TABLE IF NOT EXISTS `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `root_category_id` int unsigned DEFAULT NULL,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_hostname_idx` (`hostname`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channels: ~0 rows (approximately)
INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
	(1, 'default', NULL, 'default', 'http://localhost:8000', 'channel/1/gemini-generated-image-68z6m168z6m168z6-removebg-preview.png', 'channel/1/favicon-16x16.png', NULL, 0, '', 1, 1, 1, '2026-09-28 02:10:01', '2026-09-29 06:49:51');

-- Dumping structure for table bagisto_db.channel_currencies
DROP TABLE IF EXISTS `channel_currencies`;
CREATE TABLE IF NOT EXISTS `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_currencies: ~0 rows (approximately)
INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
	(1, 1);

-- Dumping structure for table bagisto_db.channel_inventory_sources
DROP TABLE IF EXISTS `channel_inventory_sources`;
CREATE TABLE IF NOT EXISTS `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_source_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_inventory_sources: ~0 rows (approximately)
INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
	(1, 1);

-- Dumping structure for table bagisto_db.channel_locales
DROP TABLE IF EXISTS `channel_locales`;
CREATE TABLE IF NOT EXISTS `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_locales: ~0 rows (approximately)
INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
	(1, 1);

-- Dumping structure for table bagisto_db.channel_translations
DROP TABLE IF EXISTS `channel_translations`;
CREATE TABLE IF NOT EXISTS `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_translations: ~0 rows (approximately)
INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `logo_alt`, `home_seo`, `created_at`, `updated_at`) VALUES
	(1, 1, 'en', 'Default', '', '', '', '{"meta_title": "ShopSiuu", "meta_keywords": "ShopSiuu meta keyword", "meta_description": "ShopSiuu meta description"}', NULL, '2026-09-29 06:49:51');

-- Dumping structure for table bagisto_db.cms_pages
DROP TABLE IF EXISTS `cms_pages`;
CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cms_pages: ~10 rows (approximately)
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
	(1, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(2, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(6, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(7, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(8, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(9, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(10, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.cms_page_channels
DROP TABLE IF EXISTS `cms_page_channels`;
CREATE TABLE IF NOT EXISTS `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cms_page_channels: ~10 rows (approximately)
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1);

-- Dumping structure for table bagisto_db.cms_page_translations
DROP TABLE IF EXISTS `cms_page_translations`;
CREATE TABLE IF NOT EXISTS `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cms_page_translations: ~10 rows (approximately)
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
	(1, 'About Us', 'about-us', '<div class="static-container">\r\n<div class="mb-5"><h2>Về Chúng Tôi - ShopSiuu Gaming Gear</h2><br><p><strong>ShopSiuu</strong> là hệ sinh thái thương mại điện tử chuyên cung cấp thiết bị ngoại vi, linh kiện bàn phím cơ và chuột gaming hi-end hàng đầu dành cho cộng đồng game thủ và lập trình viên.</p><br><h3>Triết lý của chúng tôi:</h3><br><blockquote>"Đừng tin quảng cáo, hãy tin tay mình."</blockquote><br><p>Chúng tôi hiểu rằng mỗi người có một form tay, sở thích gõ phím và độ nhạy riêng biệt. Vì vậy, mọi sản phẩm tại ShopSiuu đều được tuyển chọn kỹ lưỡng, đảm bảo 100% chính hãng với chính sách hậu mãi và bảo hành đổi mới tận tâm.</p><br><hr><br><p><em>Hệ thống website thương mại điện tử thực nghiệm được triển khai trên nền tảng Bagisto (Laravel Framework) phục vụ Đồ án Chuyên đề Tốt nghiệp - Nhóm 5.</em></p></div>\r\n</div>', 'about us', '', 'aboutus', 'en', 1),
	(2, 'Return Policy', 'return-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Quy Định Đổi Trả Hàng - ShopSiuu</h2><br><h3>1. Điều kiện chấp nhận đổi trả:</h3><br><ul><br>  <li>Sản phẩm còn nguyên tem niêm phong bảo hành của ShopSiuu hoặc nhà phân phối.</li><br>  <li>Hộp phụ kiện, dây cáp, adapter và quà tặng kèm còn đầy đủ, không trầy xước cấn móp nghiêm trọng do va đập ngoại lực.</li><br></ul><br><h3>2. Thời hạn đổi mới:</h3><br><p>Áp dụng chính sách <strong>1 đổi 1 trong 15 ngày đầu tiên</strong> đối với tất cả các lỗi nguồn, lỗi cảm biến chuột hoặc liệt mạch phím cơ do nhà sản xuất.</p></div>\r\n</div>', 'return policy', '', 'return, policy', 'en', 2),
	(3, 'Refund Policy', 'refund-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Chính Sách Hoàn Tiền Minh Bạch</h2><br><p>ShopSiuu cam kết bảo vệ quyền lợi người tiêu dùng với cơ chế hoàn tiền rõ ràng và nhanh chóng:</p><br><h3>1. Các trường hợp được xét duyệt hoàn tiền:</h3><br><ul><br>  <li>Sản phẩm giao không đúng model, chủng loại switch hoặc màu sắc theo đơn đặt hàng.</li><br>  <li>Sản phẩm phát sinh lỗi phần cứng từ nhà sản xuất trong vòng 7 ngày đầu sử dụng nhưng kho đã hết hàng đổi mới.</li><br></ul><br><h3>2. Phương thức & Thời gian hoàn tiền:</h3><br><p>Tiền sẽ được hoàn trả trực tiếp qua tài khoản ngân hàng của quý khách trong vòng 24 - 48 giờ làm việc sau khi trung tâm bảo hành tiếp nhận và kiểm tra xong thiết bị.</p></div>\r\n</div>', 'Refund policy', '', 'refund, policy', 'en', 3),
	(4, 'Terms & Conditions', 'terms-conditions', '<div class="static-container">\r\n<div class="mb-5"><h2>Điều Khoản & Điều Kiện Mua Bán</h2><br><h3>1. Xác nhận giao kết hợp đồng mua bán</h3><br><p>Đơn hàng chỉ được xem là giao kết thành công khi hệ thống hiển thị mã số Order ID và gửi thông báo xác nhận trạng thái \'Pending\' đến tài khoản người mua.</p><br><h3>2. Điều chỉnh giá và thông số kỹ thuật</h3><br><p>ShopSiuu nỗ lực cập nhật chính xác giá bán niêm yết và thông số kỹ thuật của gear. Trong trường hợp xảy ra lỗi hiển thị do hệ thống cơ sở dữ liệu, chúng tôi sẽ liên hệ khách hàng để xác nhận lại trước khi xử lý đơn.</p><br><h3>3. Quyền từ chối đơn hàng</h3><br><p>ShopSiuu có quyền từ chối cung cấp dịch vụ đối với những tài khoản có lịch sử boom hàng (từ chối nhận COD không có lý do chính đáng) quá 3 lần liên tiếp.</p></div>\r\n</div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
	(5, 'Terms of Use', 'terms-of-use', '<div class="static-container">\r\n<div class="mb-5"><h2>Điều Khoản Sử Dụng Nền Tảng ShopSiuu</h2><br><p>Chào mừng bạn truy cập vào nền tảng thương mại điện tử ShopSiuu. Khi sử dụng dịch vụ trên trang web, bạn đồng ý tuân thủ các quy định sau:</p><br><h3>1. Tài khoản thành viên</h3><br><p>Người dùng chịu trách nhiệm bảo quản mật khẩu tài khoản cá nhân. Nghiêm cấm các hành vi tạo đơn hàng giả mạo, can thiệp vào mã nguồn hoặc cố tình gây quá tải băng thông hệ thống.</p><br><h3>2. Bản quyền hình ảnh & Nội dung</h3><br><p>Mọi hình ảnh sản phẩm, bài viết đánh giá và tư liệu kỹ thuật trên website đều thuộc quyền sở hữu của ShopSiuu và các đối tác thương hiệu phân phối chính hãng.</p></div>\r\n</div>', 'Terms of use', '', 'term, use', 'en', 5),
	(6, 'Customer Service', 'customer-service', '<div class="static-container">\r\n<div class="mb-5"><h2>Trung Tâm Chăm Sóc Khách Hàng ShopSiuu</h2><br><p>Đội ngũ kỹ thuật viên của ShopSiuu luôn sẵn sàng hỗ trợ giải đáp mọi thắc mắc của bạn về cấu hình thiết bị, cài đặt driver và tối ưu setup góc máy.</p><br><h3>Các kênh liên hệ chính thức:</h3><br><ul><br>  <li><strong>Showroom & Trải nghiệm thực tế:</strong> ShopSiuu Store - 127e Lê, Quận Tân Phú, TP. Hồ Chí Minh.</li><br>  <li><strong>Hotline kỹ thuật:</strong> 1900 xxxx (Hỗ trợ từ 08:30 đến 21:30 các ngày trong tuần).</li><br>  <li><strong>Hỗ trợ trực tuyến:</strong> Phản hồi nhanh chóng qua Live Chat và Email hỗ trợ kỹ thuật.</li><br></ul></div>\r\n</div>', 'Customer Service', '', 'customer, service', 'en', 6),
	(7, 'What\'s New', 'whats-new', '<div class="static-container">\r\n<div class="mb-5"><h2>Cập Nhật Xu Hướng Gaming Gear Mới Nhất</h2><br><p>Chào mừng bạn đến với khu vực tổng hợp những dòng thiết bị hi-end đột phá vừa cập bến tại ShopSiuu:</p><br><ul><br>  <li><strong>Bàn phím cơ Magnetic Hall Effect (HE):</strong> Công nghệ nhận diện điểm nhận phím siêu nhạy (Rapid Trigger) dành riêng cho game thủ FPS đỉnh cao.</li><br>  <li><strong>Chuột gaming siêu nhẹ (Ultra-lightweight):</strong> Trọng lượng dưới 40g kết hợp cảm biến quang học thế hệ mới nhất và kết nối không dây 8K Polling Rate.</li><br>  <li><strong>Lót chuột vải sợi Poron cao cấp:</strong> Độ bám mặt bàn hoàn hảo cùng bề mặt kiểm soát micro-control tối ưu cho từng chuyển động tay.</li><br></ul></div>\r\n</div>', 'What\'s New', '', 'new', 'en', 7),
	(8, 'Payment Policy', 'payment-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Chính Sách Thanh Toán - ShopSiuu</h2><br><p>Nhằm đảm bảo sự tiện lợi và an tâm tối đa cho khách hàng trải nghiệm mua sắm gaming gear, ShopSiuu áp dụng phương thức thanh toán linh hoạt:</p><br><h3>1. Thanh toán khi nhận hàng (Cash On Delivery - COD)</h3><br><p>Quý khách chỉ phải thanh toán toàn bộ giá trị đơn hàng bằng tiền mặt sau khi nhân viên bưu tá đã giao kiện hàng đến tận tay và kiểm tra tình trạng nguyên vẹn.</p><br><h3>2. Tính minh bạch hóa đơn</h3><br><p>Mỗi đơn hàng thành công trên hệ thống đều đi kèm một mã định danh duy nhất (Order ID). Sau khi đơn được xác nhận, hệ thống sẽ tự động xuất hóa đơn điện tử (Invoice) lưu trữ trong tài khoản khách hàng.</p></div>\r\n</div>', 'Payment Policy', '', 'payment, policy', 'en', 8),
	(9, 'Shipping Policy', 'shipping-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Chính Sách Vận Chuyển Hàng - ShopSiuu</h2><br><p>ShopSiuu hợp tác cùng các đơn vị vận chuyển uy tín để giao sản phẩm bàn phím cơ, chuột gaming và phụ kiện đến tay bạn nhanh chóng và an toàn nhất.</p><br><h3>1. Thời gian giao hàng dự kiến</h3><br><ul><br>  <li><strong>Nội thành TP. Hồ Chí Minh:</strong> Giao siêu tốc trong vòng 24 giờ kể từ khi duyệt đơn.</li><br>  <li><strong>Các tỉnh thành khác:</strong> Giao hàng tiêu chuẩn từ 2 - 4 ngày làm việc.</li><br></ul><br><h3>2. Cước phí vận chuyển</h3><br><ul><br>  <li>Miễn phí vận chuyển (Free Shipping) cho mọi đơn hàng có giá trị từ 1.000.000₫ trở lên.</li><br>  <li>Các đơn hàng dưới mức ưu đãi áp dụng mức phí đồng giá tiêu chuẩn (Flat Rate Shipping) là 30.000₫.</li><br></ul><br><h3>3. Đồng kiểm khi nhận hàng</h3><br><p>Quý khách được quyền mở hộp kiểm tra ngoại quan sản phẩm trước khi thanh toán tiền mặt cho nhân viên giao hàng (COD).</p></div>\r\n</div>', 'Shipping Policy', '', 'shipping, policy', 'en', 9),
	(10, 'Privacy Policy', 'privacy-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Chính Sách Bảo Mật Thông Tin - ShopSiuu</h2><br><p>ShopSiuu cam kết bảo vệ tuyệt đối thông tin cá nhân và dữ liệu riêng tư của khách hàng khi trải nghiệm mua sắm thiết bị gaming gear tại hệ thống.</p><br><h3>1. Thu thập thông tin</h3><br><p>Chúng tôi chỉ thu thập các thông tin cần thiết phục vụ cho quá trình xác thực đơn hàng và giao nhận sản phẩm, bao gồm: Họ và tên, số điện thoại, địa chỉ nhận hàng và địa chỉ email.</p><br><h3>2. Bảo mật dữ liệu</h3><br><p>Toàn bộ mật khẩu tài khoản người dùng đều được mã hóa tự động bằng thuật toán băm chuẩn công nghiệp (Bcrypt Hash) trước khi lưu trữ vào hệ quản trị cơ sở dữ liệu, đảm bảo dữ liệu không bị lộ ngay cả trong các trường hợp rò rỉ hệ thống.</p><br><h3>3. Sử dụng thông tin</h3><br><p>Thông tin của quý khách chỉ được sử dụng nội bộ để xử lý đơn hàng, gửi thông báo trạng thái vận chuyển và giải quyết các khiếu nại bảo hành đổi mới.</p></div>\r\n</div>', 'Privacy Policy', '', 'privacy, policy', 'en', 10);

-- Dumping structure for table bagisto_db.compare_items
DROP TABLE IF EXISTS `compare_items`;
CREATE TABLE IF NOT EXISTS `compare_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.compare_items: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.core_config
DROP TABLE IF EXISTS `core_config`;
CREATE TABLE IF NOT EXISTS `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.core_config: ~136 rows (approximately)
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
	(1, 'sales.checkout.shopping_cart.allow_guest_checkout', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-29 06:41:40'),
	(2, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, 'emails.general.notifications.emails.general.notifications.customer_account_credentials', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(6, 'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(7, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(8, 'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(9, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(10, 'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(11, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(12, 'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(13, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(14, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(15, 'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(16, 'general.design.categories.category_view', 'sidebar', NULL, NULL, '2026-09-28 02:10:02', '2026-09-29 06:31:13'),
	(17, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(18, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(19, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(20, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(21, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(22, 'general.content.header_offer.title', 'Giảm giá lên đến 40%', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(23, 'general.content.header_offer.redirection_title', 'Mua ngay không nó sẽ bay', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(24, 'general.content.header_offer.redirection_link', '', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(25, 'general.content.speculation_rules.enabled', '0', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(26, 'general.content.speculation_rules.prerender_enabled', '0', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(27, 'general.content.speculation_rules.prefetch_enabled', '0', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(28, 'general.content.footer.copyright_content', '© 2026 Siuuu Store - Nghiên cứu hệ thống E-Commerce. All rights reserved.', NULL, 'en', '2026-09-29 06:30:05', '2026-09-29 08:06:24'),
	(29, 'general.content.custom_scripts.custom_css', '', 'default', NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(30, 'general.content.custom_scripts.custom_javascript', '', 'default', NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(31, 'catalog.products.settings.compare_option', '1', NULL, NULL, '2026-09-29 06:33:31', '2026-09-29 06:33:31'),
	(32, 'catalog.products.settings.image_search', '0', NULL, NULL, '2026-09-29 06:33:31', '2026-09-29 06:33:31'),
	(33, 'catalog.products.search.engine', 'database', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(34, 'catalog.products.search.admin_mode', 'database', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(35, 'catalog.products.search.storefront_mode', 'database', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(36, 'catalog.products.search.min_query_length', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(37, 'catalog.products.search.max_query_length', '1000', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(38, 'catalog.products.product_view_page.no_of_related_products', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(39, 'catalog.products.product_view_page.no_of_up_sells_products', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(40, 'catalog.products.cart_view_page.no_of_cross_sells_products', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(41, 'catalog.products.storefront.products_per_page', '', 'default', NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(42, 'catalog.products.storefront.buy_now_button_display', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(43, 'catalog.products.cache_small_image.width', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(44, 'catalog.products.cache_small_image.height', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(45, 'catalog.products.cache_medium_image.width', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(46, 'catalog.products.cache_medium_image.height', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(47, 'catalog.products.cache_large_image.width', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(48, 'catalog.products.cache_large_image.height', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(49, 'catalog.products.review.guest_review', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(50, 'catalog.products.review.customer_review', '1', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(51, 'catalog.products.review.censoring_reviewer_name', '1', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(52, 'catalog.products.review.summary', 'review_counts', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(53, 'catalog.products.attribute.image_attribute_upload_size', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(54, 'catalog.products.attribute.file_attribute_upload_size', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(55, 'catalog.products.social_share.enabled', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(56, 'catalog.products.social_share.facebook', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(57, 'catalog.products.social_share.twitter', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(58, 'catalog.products.social_share.pinterest', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(59, 'catalog.products.social_share.whatsapp', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(60, 'catalog.products.social_share.linkedin', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(61, 'catalog.products.social_share.email', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(62, 'catalog.products.social_share.share_message', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(63, 'customer.address.requirements.country', '0', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(64, 'customer.address.requirements.state', '0', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(65, 'customer.address.requirements.postcode', '0', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(66, 'customer.address.information.street_lines', '1', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(67, 'customer.settings.wishlist.wishlist_option', '1', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(68, 'customer.settings.login_options.redirected_to_page', 'home', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(69, 'customer.settings.create_new_account_options.default_group', 'general', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(70, 'customer.settings.create_new_account_options.news_letter', '0', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(71, 'customer.settings.newsletter.subscription', '0', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(72, 'customer.settings.email.verification', '0', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(73, 'customer.settings.social_login.facebook_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(74, 'customer.settings.social_login.facebook_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(75, 'customer.settings.social_login.facebook_callback_url', 'http://localhost:8000/customer/social-login/facebook/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(76, 'customer.settings.social_login.twitter_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(77, 'customer.settings.social_login.twitter_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(78, 'customer.settings.social_login.twitter_callback_url', 'http://localhost:8000/customer/social-login/twitter/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(79, 'customer.settings.social_login.google_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(80, 'customer.settings.social_login.google_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(81, 'customer.settings.social_login.google_callback_url', 'http://localhost:8000/customer/social-login/google/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(82, 'customer.settings.social_login.linkedin_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(83, 'customer.settings.social_login.linkedin_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(84, 'customer.settings.social_login.linkedin_callback_url', 'http://localhost:8000/customer/social-login/linkedin-openid/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(85, 'customer.settings.social_login.github_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(86, 'customer.settings.social_login.github_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(87, 'customer.settings.social_login.github_callback_url', 'http://localhost:8000/customer/social-login/github/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(88, 'sales.shipping.origin.country', 'VN', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(89, 'sales.shipping.origin.state', 'Hồ Chí Minh', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(90, 'sales.shipping.origin.city', 'Hồ Chí Minh', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(91, 'sales.shipping.origin.address', 'lê Lư', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(92, 'sales.shipping.origin.zipcode', '00084', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(93, 'sales.shipping.origin.store_name', 'ShopSiuu', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(94, 'sales.shipping.origin.vat_number', '1', 'default', NULL, '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(95, 'sales.shipping.origin.contact', '0123456789', 'default', NULL, '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(96, 'sales.shipping.origin.bank_details', '', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(97, 'sales.payment_methods.stripe.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(98, 'sales.payment_methods.razorpay.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(99, 'sales.payment_methods.payu.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(100, 'sales.payment_methods.phonepe.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(101, 'sales.payment_methods.paypal_smart_button.active', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(102, 'sales.payment_methods.paypal_smart_button.title', 'PayPal Smart Button', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(103, 'sales.payment_methods.paypal_smart_button.description', 'PayPal', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(104, 'sales.payment_methods.paypal_smart_button.client_id', 'sb', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(105, 'sales.payment_methods.paypal_smart_button.client_secret', '', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(106, 'sales.payment_methods.paypal_smart_button.accepted_currencies', 'USD', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(107, 'sales.payment_methods.paypal_smart_button.sandbox', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(108, 'sales.payment_methods.paypal_smart_button.sort', '5', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(109, 'sales.payment_methods.paypal_standard.active', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(110, 'sales.payment_methods.paypal_standard.title', 'PayPal Standard', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(111, 'sales.payment_methods.paypal_standard.description', 'PayPal Standard', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(112, 'sales.payment_methods.paypal_standard.business_account', 'test@webkul.com', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(113, 'sales.payment_methods.paypal_standard.sandbox', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(114, 'sales.payment_methods.paypal_standard.sort', '6', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(115, 'sales.payment_methods.cashondelivery.active', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(116, 'sales.payment_methods.cashondelivery.title', 'Cash On Delivery', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(117, 'sales.payment_methods.cashondelivery.description', 'Cash On Delivery', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(118, 'sales.payment_methods.cashondelivery.instructions', '', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(119, 'sales.payment_methods.cashondelivery.generate_invoice', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(120, 'sales.payment_methods.cashondelivery.sort', '7', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(121, 'sales.payment_methods.moneytransfer.active', '1', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(122, 'sales.payment_methods.moneytransfer.title', 'Money Transfer', 'default', 'en', '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(123, 'sales.payment_methods.moneytransfer.description', 'Money Transfer', 'default', 'en', '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(124, 'sales.payment_methods.moneytransfer.generate_invoice', '0', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(125, 'sales.payment_methods.moneytransfer.mailing_address', '', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(126, 'sales.payment_methods.moneytransfer.sort', '8', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(127, 'sales.payment_methods.payglocal.active', '0', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(128, 'sales.checkout.shopping_cart.cart_page', '1', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(129, 'sales.checkout.shopping_cart.cross_sell', '1', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(130, 'sales.checkout.shopping_cart.estimate_shipping', '1', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(131, 'sales.checkout.my_cart.summary', 'display_number_of_items_in_cart', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(132, 'sales.checkout.mini_cart.display_mini_cart', '0', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(133, 'sales.checkout.mini_cart.offer_info', 'Get Up To 30% OFF on your 1st order', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(134, 'general.design.admin_logo.logo_image', 'configuration/0WCN0d9skaE76Pp9Dyc0MWDUjgsiuNT8JoBeMpDA.png', NULL, NULL, '2026-09-29 09:15:09', '2026-09-29 09:15:09'),
	(135, 'general.design.admin_logo.favicon', 'configuration/NGMfv3daPUqiar9XideHYwvDaq5TWxeOLQs4NvQe.png', NULL, NULL, '2026-09-29 09:15:09', '2026-09-29 09:15:09'),
	(136, 'magic_ai.general.settings.enabled', '1', NULL, NULL, '2026-09-29 09:15:58', '2026-09-29 09:15:58');

-- Dumping structure for table bagisto_db.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.countries: ~254 rows (approximately)
INSERT INTO `countries` (`id`, `code`, `name`) VALUES
	(1, 'AF', 'Afghanistan'),
	(2, 'AX', 'Åland Islands'),
	(3, 'AL', 'Albania'),
	(4, 'DZ', 'Algeria'),
	(5, 'AS', 'American Samoa'),
	(6, 'AD', 'Andorra'),
	(7, 'AO', 'Angola'),
	(8, 'AI', 'Anguilla'),
	(9, 'AQ', 'Antarctica'),
	(10, 'AG', 'Antigua & Barbuda'),
	(11, 'AR', 'Argentina'),
	(12, 'AM', 'Armenia'),
	(13, 'AW', 'Aruba'),
	(14, 'AC', 'Ascension Island'),
	(15, 'AU', 'Australia'),
	(16, 'AT', 'Austria'),
	(17, 'AZ', 'Azerbaijan'),
	(18, 'BS', 'Bahamas'),
	(19, 'BH', 'Bahrain'),
	(20, 'BD', 'Bangladesh'),
	(21, 'BB', 'Barbados'),
	(22, 'BY', 'Belarus'),
	(23, 'BE', 'Belgium'),
	(24, 'BZ', 'Belize'),
	(25, 'BJ', 'Benin'),
	(26, 'BM', 'Bermuda'),
	(27, 'BT', 'Bhutan'),
	(28, 'BO', 'Bolivia'),
	(29, 'BA', 'Bosnia & Herzegovina'),
	(30, 'BW', 'Botswana'),
	(31, 'BR', 'Brazil'),
	(32, 'IO', 'British Indian Ocean Territory'),
	(33, 'VG', 'British Virgin Islands'),
	(34, 'BN', 'Brunei'),
	(35, 'BG', 'Bulgaria'),
	(36, 'BF', 'Burkina Faso'),
	(37, 'BI', 'Burundi'),
	(38, 'KH', 'Cambodia'),
	(39, 'CM', 'Cameroon'),
	(40, 'CA', 'Canada'),
	(41, 'IC', 'Canary Islands'),
	(42, 'CV', 'Cape Verde'),
	(43, 'BQ', 'Caribbean Netherlands'),
	(44, 'KY', 'Cayman Islands'),
	(45, 'CF', 'Central African Republic'),
	(46, 'EA', 'Ceuta & Melilla'),
	(47, 'TD', 'Chad'),
	(48, 'CL', 'Chile'),
	(49, 'CN', 'China'),
	(50, 'CX', 'Christmas Island'),
	(51, 'CC', 'Cocos (Keeling) Islands'),
	(52, 'CO', 'Colombia'),
	(53, 'KM', 'Comoros'),
	(54, 'CG', 'Congo - Brazzaville'),
	(55, 'CD', 'Congo - Kinshasa'),
	(56, 'CK', 'Cook Islands'),
	(57, 'CR', 'Costa Rica'),
	(58, 'CI', 'Côte d’Ivoire'),
	(59, 'HR', 'Croatia'),
	(60, 'CU', 'Cuba'),
	(61, 'CW', 'Curaçao'),
	(62, 'CY', 'Cyprus'),
	(63, 'CZ', 'Czechia'),
	(64, 'DK', 'Denmark'),
	(65, 'DG', 'Diego Garcia'),
	(66, 'DJ', 'Djibouti'),
	(67, 'DM', 'Dominica'),
	(68, 'DO', 'Dominican Republic'),
	(69, 'EC', 'Ecuador'),
	(70, 'EG', 'Egypt'),
	(71, 'SV', 'El Salvador'),
	(72, 'GQ', 'Equatorial Guinea'),
	(73, 'ER', 'Eritrea'),
	(74, 'EE', 'Estonia'),
	(75, 'ET', 'Ethiopia'),
	(76, 'EZ', 'Eurozone'),
	(77, 'FK', 'Falkland Islands'),
	(78, 'FO', 'Faroe Islands'),
	(79, 'FJ', 'Fiji'),
	(80, 'FI', 'Finland'),
	(81, 'FR', 'France'),
	(82, 'GF', 'French Guiana'),
	(83, 'PF', 'French Polynesia'),
	(84, 'TF', 'French Southern Territories'),
	(85, 'GA', 'Gabon'),
	(86, 'GM', 'Gambia'),
	(87, 'GE', 'Georgia'),
	(88, 'DE', 'Germany'),
	(89, 'GH', 'Ghana'),
	(90, 'GI', 'Gibraltar'),
	(91, 'GR', 'Greece'),
	(92, 'GL', 'Greenland'),
	(93, 'GD', 'Grenada'),
	(94, 'GP', 'Guadeloupe'),
	(95, 'GU', 'Guam'),
	(96, 'GT', 'Guatemala'),
	(97, 'GG', 'Guernsey'),
	(98, 'GN', 'Guinea'),
	(99, 'GW', 'Guinea-Bissau'),
	(100, 'GY', 'Guyana'),
	(101, 'HT', 'Haiti'),
	(102, 'HN', 'Honduras'),
	(103, 'HK', 'Hong Kong SAR China'),
	(104, 'HU', 'Hungary'),
	(105, 'IS', 'Iceland'),
	(106, 'IN', 'India'),
	(107, 'ID', 'Indonesia'),
	(108, 'IR', 'Iran'),
	(109, 'IQ', 'Iraq'),
	(110, 'IE', 'Ireland'),
	(111, 'IM', 'Isle of Man'),
	(112, 'IL', 'Israel'),
	(113, 'IT', 'Italy'),
	(114, 'JM', 'Jamaica'),
	(115, 'JP', 'Japan'),
	(116, 'JE', 'Jersey'),
	(117, 'JO', 'Jordan'),
	(118, 'KZ', 'Kazakhstan'),
	(119, 'KE', 'Kenya'),
	(120, 'KI', 'Kiribati'),
	(121, 'XK', 'Kosovo'),
	(122, 'KW', 'Kuwait'),
	(123, 'KG', 'Kyrgyzstan'),
	(124, 'LA', 'Laos'),
	(125, 'LV', 'Latvia'),
	(126, 'LB', 'Lebanon'),
	(127, 'LS', 'Lesotho'),
	(128, 'LR', 'Liberia'),
	(129, 'LY', 'Libya'),
	(130, 'LI', 'Liechtenstein'),
	(131, 'LT', 'Lithuania'),
	(132, 'LU', 'Luxembourg'),
	(133, 'MO', 'Macau SAR China'),
	(134, 'MK', 'Macedonia'),
	(135, 'MG', 'Madagascar'),
	(136, 'MW', 'Malawi'),
	(137, 'MY', 'Malaysia'),
	(138, 'MV', 'Maldives'),
	(139, 'ML', 'Mali'),
	(140, 'MT', 'Malta'),
	(141, 'MH', 'Marshall Islands'),
	(142, 'MQ', 'Martinique'),
	(143, 'MR', 'Mauritania'),
	(144, 'MU', 'Mauritius'),
	(145, 'YT', 'Mayotte'),
	(146, 'MX', 'Mexico'),
	(147, 'FM', 'Micronesia'),
	(148, 'MD', 'Moldova'),
	(149, 'MC', 'Monaco'),
	(150, 'MN', 'Mongolia'),
	(151, 'ME', 'Montenegro'),
	(152, 'MS', 'Montserrat'),
	(153, 'MA', 'Morocco'),
	(154, 'MZ', 'Mozambique'),
	(155, 'MM', 'Myanmar (Burma)'),
	(156, 'NA', 'Namibia'),
	(157, 'NR', 'Nauru'),
	(158, 'NP', 'Nepal'),
	(159, 'NL', 'Netherlands'),
	(160, 'NC', 'New Caledonia'),
	(161, 'NZ', 'New Zealand'),
	(162, 'NI', 'Nicaragua'),
	(163, 'NE', 'Niger'),
	(164, 'NG', 'Nigeria'),
	(165, 'NU', 'Niue'),
	(166, 'NF', 'Norfolk Island'),
	(167, 'KP', 'North Korea'),
	(168, 'MP', 'Northern Mariana Islands'),
	(169, 'NO', 'Norway'),
	(170, 'OM', 'Oman'),
	(171, 'PK', 'Pakistan'),
	(172, 'PW', 'Palau'),
	(173, 'PS', 'Palestinian Territories'),
	(174, 'PA', 'Panama'),
	(175, 'PG', 'Papua New Guinea'),
	(176, 'PY', 'Paraguay'),
	(177, 'PE', 'Peru'),
	(178, 'PH', 'Philippines'),
	(179, 'PN', 'Pitcairn Islands'),
	(180, 'PL', 'Poland'),
	(181, 'PT', 'Portugal'),
	(182, 'PR', 'Puerto Rico'),
	(183, 'QA', 'Qatar'),
	(184, 'RE', 'Réunion'),
	(185, 'RO', 'Romania'),
	(186, 'RU', 'Russia'),
	(187, 'RW', 'Rwanda'),
	(188, 'WS', 'Samoa'),
	(189, 'SM', 'San Marino'),
	(190, 'ST', 'São Tomé & Príncipe'),
	(191, 'SA', 'Saudi Arabia'),
	(192, 'SN', 'Senegal'),
	(193, 'RS', 'Serbia'),
	(194, 'SC', 'Seychelles'),
	(195, 'SL', 'Sierra Leone'),
	(196, 'SG', 'Singapore'),
	(197, 'SX', 'Sint Maarten'),
	(198, 'SK', 'Slovakia'),
	(199, 'SI', 'Slovenia'),
	(200, 'SB', 'Solomon Islands'),
	(201, 'SO', 'Somalia'),
	(202, 'ZA', 'South Africa'),
	(203, 'GS', 'South Georgia & South Sandwich Islands'),
	(204, 'KR', 'South Korea'),
	(205, 'SS', 'South Sudan'),
	(206, 'ES', 'Spain'),
	(207, 'LK', 'Sri Lanka'),
	(208, 'BL', 'St. Barthélemy'),
	(209, 'SH', 'St. Helena'),
	(210, 'KN', 'St. Kitts & Nevis'),
	(211, 'LC', 'St. Lucia'),
	(212, 'MF', 'St. Martin'),
	(213, 'PM', 'St. Pierre & Miquelon'),
	(214, 'VC', 'St. Vincent & Grenadines'),
	(215, 'SD', 'Sudan'),
	(216, 'SR', 'Suriname'),
	(217, 'SJ', 'Svalbard & Jan Mayen'),
	(218, 'SZ', 'Swaziland'),
	(219, 'SE', 'Sweden'),
	(220, 'CH', 'Switzerland'),
	(221, 'SY', 'Syria'),
	(222, 'TW', 'Taiwan'),
	(223, 'TJ', 'Tajikistan'),
	(224, 'TZ', 'Tanzania'),
	(225, 'TH', 'Thailand'),
	(226, 'TL', 'Timor-Leste'),
	(227, 'TG', 'Togo'),
	(228, 'TK', 'Tokelau'),
	(229, 'TO', 'Tonga'),
	(230, 'TT', 'Trinidad & Tobago'),
	(231, 'TA', 'Tristan da Cunha'),
	(232, 'TN', 'Tunisia'),
	(233, 'TR', 'Turkey'),
	(234, 'TM', 'Turkmenistan'),
	(235, 'TC', 'Turks & Caicos Islands'),
	(236, 'TV', 'Tuvalu'),
	(237, 'UM', 'U.S. Outlying Islands'),
	(238, 'VI', 'U.S. Virgin Islands'),
	(239, 'UG', 'Uganda'),
	(240, 'UA', 'Ukraine'),
	(241, 'AE', 'United Arab Emirates'),
	(242, 'GB', 'United Kingdom'),
	(244, 'US', 'United States'),
	(245, 'UY', 'Uruguay'),
	(246, 'UZ', 'Uzbekistan'),
	(247, 'VU', 'Vanuatu'),
	(248, 'VA', 'Vatican City'),
	(249, 'VE', 'Venezuela'),
	(250, 'VN', 'Vietnam'),
	(251, 'WF', 'Wallis & Futuna'),
	(252, 'EH', 'Western Sahara'),
	(253, 'YE', 'Yemen'),
	(254, 'ZM', 'Zambia'),
	(255, 'ZW', 'Zimbabwe');

-- Dumping structure for table bagisto_db.country_states
DROP TABLE IF EXISTS `country_states`;
CREATE TABLE IF NOT EXISTS `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.country_states: ~586 rows (approximately)
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
	(1, 244, 'US', 'AL', 'Alabama'),
	(2, 244, 'US', 'AK', 'Alaska'),
	(3, 244, 'US', 'AS', 'American Samoa'),
	(4, 244, 'US', 'AZ', 'Arizona'),
	(5, 244, 'US', 'AR', 'Arkansas'),
	(6, 244, 'US', 'AE', 'Armed Forces Africa'),
	(7, 244, 'US', 'AA', 'Armed Forces Americas'),
	(8, 244, 'US', 'AE', 'Armed Forces Canada'),
	(9, 244, 'US', 'AE', 'Armed Forces Europe'),
	(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
	(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
	(12, 244, 'US', 'CA', 'California'),
	(13, 244, 'US', 'CO', 'Colorado'),
	(14, 244, 'US', 'CT', 'Connecticut'),
	(15, 244, 'US', 'DE', 'Delaware'),
	(16, 244, 'US', 'DC', 'District of Columbia'),
	(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
	(18, 244, 'US', 'FL', 'Florida'),
	(19, 244, 'US', 'GA', 'Georgia'),
	(20, 244, 'US', 'GU', 'Guam'),
	(21, 244, 'US', 'HI', 'Hawaii'),
	(22, 244, 'US', 'ID', 'Idaho'),
	(23, 244, 'US', 'IL', 'Illinois'),
	(24, 244, 'US', 'IN', 'Indiana'),
	(25, 244, 'US', 'IA', 'Iowa'),
	(26, 244, 'US', 'KS', 'Kansas'),
	(27, 244, 'US', 'KY', 'Kentucky'),
	(28, 244, 'US', 'LA', 'Louisiana'),
	(29, 244, 'US', 'ME', 'Maine'),
	(30, 244, 'US', 'MH', 'Marshall Islands'),
	(31, 244, 'US', 'MD', 'Maryland'),
	(32, 244, 'US', 'MA', 'Massachusetts'),
	(33, 244, 'US', 'MI', 'Michigan'),
	(34, 244, 'US', 'MN', 'Minnesota'),
	(35, 244, 'US', 'MS', 'Mississippi'),
	(36, 244, 'US', 'MO', 'Missouri'),
	(37, 244, 'US', 'MT', 'Montana'),
	(38, 244, 'US', 'NE', 'Nebraska'),
	(39, 244, 'US', 'NV', 'Nevada'),
	(40, 244, 'US', 'NH', 'New Hampshire'),
	(41, 244, 'US', 'NJ', 'New Jersey'),
	(42, 244, 'US', 'NM', 'New Mexico'),
	(43, 244, 'US', 'NY', 'New York'),
	(44, 244, 'US', 'NC', 'North Carolina'),
	(45, 244, 'US', 'ND', 'North Dakota'),
	(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
	(47, 244, 'US', 'OH', 'Ohio'),
	(48, 244, 'US', 'OK', 'Oklahoma'),
	(49, 244, 'US', 'OR', 'Oregon'),
	(50, 244, 'US', 'PW', 'Palau'),
	(51, 244, 'US', 'PA', 'Pennsylvania'),
	(52, 244, 'US', 'PR', 'Puerto Rico'),
	(53, 244, 'US', 'RI', 'Rhode Island'),
	(54, 244, 'US', 'SC', 'South Carolina'),
	(55, 244, 'US', 'SD', 'South Dakota'),
	(56, 244, 'US', 'TN', 'Tennessee'),
	(57, 244, 'US', 'TX', 'Texas'),
	(58, 244, 'US', 'UT', 'Utah'),
	(59, 244, 'US', 'VT', 'Vermont'),
	(60, 244, 'US', 'VI', 'Virgin Islands'),
	(61, 244, 'US', 'VA', 'Virginia'),
	(62, 244, 'US', 'WA', 'Washington'),
	(63, 244, 'US', 'WV', 'West Virginia'),
	(64, 244, 'US', 'WI', 'Wisconsin'),
	(65, 244, 'US', 'WY', 'Wyoming'),
	(66, 40, 'CA', 'AB', 'Alberta'),
	(67, 40, 'CA', 'BC', 'British Columbia'),
	(68, 40, 'CA', 'MB', 'Manitoba'),
	(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
	(70, 40, 'CA', 'NB', 'New Brunswick'),
	(71, 40, 'CA', 'NS', 'Nova Scotia'),
	(72, 40, 'CA', 'NT', 'Northwest Territories'),
	(73, 40, 'CA', 'NU', 'Nunavut'),
	(74, 40, 'CA', 'ON', 'Ontario'),
	(75, 40, 'CA', 'PE', 'Prince Edward Island'),
	(76, 40, 'CA', 'QC', 'Quebec'),
	(77, 40, 'CA', 'SK', 'Saskatchewan'),
	(78, 40, 'CA', 'YT', 'Yukon Territory'),
	(79, 88, 'DE', 'NDS', 'Niedersachsen'),
	(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
	(81, 88, 'DE', 'BAY', 'Bayern'),
	(82, 88, 'DE', 'BER', 'Berlin'),
	(83, 88, 'DE', 'BRG', 'Brandenburg'),
	(84, 88, 'DE', 'BRE', 'Bremen'),
	(85, 88, 'DE', 'HAM', 'Hamburg'),
	(86, 88, 'DE', 'HES', 'Hessen'),
	(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
	(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
	(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
	(90, 88, 'DE', 'SAR', 'Saarland'),
	(91, 88, 'DE', 'SAS', 'Sachsen'),
	(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
	(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
	(94, 88, 'DE', 'THE', 'Thüringen'),
	(95, 16, 'AT', 'WI', 'Wien'),
	(96, 16, 'AT', 'NO', 'Niederösterreich'),
	(97, 16, 'AT', 'OO', 'Oberösterreich'),
	(98, 16, 'AT', 'SB', 'Salzburg'),
	(99, 16, 'AT', 'KN', 'Kärnten'),
	(100, 16, 'AT', 'ST', 'Steiermark'),
	(101, 16, 'AT', 'TI', 'Tirol'),
	(102, 16, 'AT', 'BL', 'Burgenland'),
	(103, 16, 'AT', 'VB', 'Vorarlberg'),
	(104, 220, 'CH', 'AG', 'Aargau'),
	(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
	(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
	(107, 220, 'CH', 'BE', 'Bern'),
	(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
	(109, 220, 'CH', 'BS', 'Basel-Stadt'),
	(110, 220, 'CH', 'FR', 'Freiburg'),
	(111, 220, 'CH', 'GE', 'Genf'),
	(112, 220, 'CH', 'GL', 'Glarus'),
	(113, 220, 'CH', 'GR', 'Graubünden'),
	(114, 220, 'CH', 'JU', 'Jura'),
	(115, 220, 'CH', 'LU', 'Luzern'),
	(116, 220, 'CH', 'NE', 'Neuenburg'),
	(117, 220, 'CH', 'NW', 'Nidwalden'),
	(118, 220, 'CH', 'OW', 'Obwalden'),
	(119, 220, 'CH', 'SG', 'St. Gallen'),
	(120, 220, 'CH', 'SH', 'Schaffhausen'),
	(121, 220, 'CH', 'SO', 'Solothurn'),
	(122, 220, 'CH', 'SZ', 'Schwyz'),
	(123, 220, 'CH', 'TG', 'Thurgau'),
	(124, 220, 'CH', 'TI', 'Tessin'),
	(125, 220, 'CH', 'UR', 'Uri'),
	(126, 220, 'CH', 'VD', 'Waadt'),
	(127, 220, 'CH', 'VS', 'Wallis'),
	(128, 220, 'CH', 'ZG', 'Zug'),
	(129, 220, 'CH', 'ZH', 'Zürich'),
	(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
	(131, 206, 'ES', 'Alava', 'Alava'),
	(132, 206, 'ES', 'Albacete', 'Albacete'),
	(133, 206, 'ES', 'Alicante', 'Alicante'),
	(134, 206, 'ES', 'Almeria', 'Almeria'),
	(135, 206, 'ES', 'Asturias', 'Asturias'),
	(136, 206, 'ES', 'Avila', 'Avila'),
	(137, 206, 'ES', 'Badajoz', 'Badajoz'),
	(138, 206, 'ES', 'Baleares', 'Baleares'),
	(139, 206, 'ES', 'Barcelona', 'Barcelona'),
	(140, 206, 'ES', 'Burgos', 'Burgos'),
	(141, 206, 'ES', 'Caceres', 'Caceres'),
	(142, 206, 'ES', 'Cadiz', 'Cadiz'),
	(143, 206, 'ES', 'Cantabria', 'Cantabria'),
	(144, 206, 'ES', 'Castellon', 'Castellon'),
	(145, 206, 'ES', 'Ceuta', 'Ceuta'),
	(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
	(147, 206, 'ES', 'Cordoba', 'Cordoba'),
	(148, 206, 'ES', 'Cuenca', 'Cuenca'),
	(149, 206, 'ES', 'Girona', 'Girona'),
	(150, 206, 'ES', 'Granada', 'Granada'),
	(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
	(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
	(153, 206, 'ES', 'Huelva', 'Huelva'),
	(154, 206, 'ES', 'Huesca', 'Huesca'),
	(155, 206, 'ES', 'Jaen', 'Jaen'),
	(156, 206, 'ES', 'La Rioja', 'La Rioja'),
	(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
	(158, 206, 'ES', 'Leon', 'Leon'),
	(159, 206, 'ES', 'Lleida', 'Lleida'),
	(160, 206, 'ES', 'Lugo', 'Lugo'),
	(161, 206, 'ES', 'Madrid', 'Madrid'),
	(162, 206, 'ES', 'Malaga', 'Malaga'),
	(163, 206, 'ES', 'Melilla', 'Melilla'),
	(164, 206, 'ES', 'Murcia', 'Murcia'),
	(165, 206, 'ES', 'Navarra', 'Navarra'),
	(166, 206, 'ES', 'Ourense', 'Ourense'),
	(167, 206, 'ES', 'Palencia', 'Palencia'),
	(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
	(169, 206, 'ES', 'Salamanca', 'Salamanca'),
	(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
	(171, 206, 'ES', 'Segovia', 'Segovia'),
	(172, 206, 'ES', 'Sevilla', 'Sevilla'),
	(173, 206, 'ES', 'Soria', 'Soria'),
	(174, 206, 'ES', 'Tarragona', 'Tarragona'),
	(175, 206, 'ES', 'Teruel', 'Teruel'),
	(176, 206, 'ES', 'Toledo', 'Toledo'),
	(177, 206, 'ES', 'Valencia', 'Valencia'),
	(178, 206, 'ES', 'Valladolid', 'Valladolid'),
	(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
	(180, 206, 'ES', 'Zamora', 'Zamora'),
	(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
	(182, 81, 'FR', '1', 'Ain'),
	(183, 81, 'FR', '2', 'Aisne'),
	(184, 81, 'FR', '3', 'Allier'),
	(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
	(186, 81, 'FR', '5', 'Hautes-Alpes'),
	(187, 81, 'FR', '6', 'Alpes-Maritimes'),
	(188, 81, 'FR', '7', 'Ardèche'),
	(189, 81, 'FR', '8', 'Ardennes'),
	(190, 81, 'FR', '9', 'Ariège'),
	(191, 81, 'FR', '10', 'Aube'),
	(192, 81, 'FR', '11', 'Aude'),
	(193, 81, 'FR', '12', 'Aveyron'),
	(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
	(195, 81, 'FR', '14', 'Calvados'),
	(196, 81, 'FR', '15', 'Cantal'),
	(197, 81, 'FR', '16', 'Charente'),
	(198, 81, 'FR', '17', 'Charente-Maritime'),
	(199, 81, 'FR', '18', 'Cher'),
	(200, 81, 'FR', '19', 'Corrèze'),
	(201, 81, 'FR', '2A', 'Corse-du-Sud'),
	(202, 81, 'FR', '2B', 'Haute-Corse'),
	(203, 81, 'FR', '21', 'Côte-d\'Or'),
	(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
	(205, 81, 'FR', '23', 'Creuse'),
	(206, 81, 'FR', '24', 'Dordogne'),
	(207, 81, 'FR', '25', 'Doubs'),
	(208, 81, 'FR', '26', 'Drôme'),
	(209, 81, 'FR', '27', 'Eure'),
	(210, 81, 'FR', '28', 'Eure-et-Loir'),
	(211, 81, 'FR', '29', 'Finistère'),
	(212, 81, 'FR', '30', 'Gard'),
	(213, 81, 'FR', '31', 'Haute-Garonne'),
	(214, 81, 'FR', '32', 'Gers'),
	(215, 81, 'FR', '33', 'Gironde'),
	(216, 81, 'FR', '34', 'Hérault'),
	(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
	(218, 81, 'FR', '36', 'Indre'),
	(219, 81, 'FR', '37', 'Indre-et-Loire'),
	(220, 81, 'FR', '38', 'Isère'),
	(221, 81, 'FR', '39', 'Jura'),
	(222, 81, 'FR', '40', 'Landes'),
	(223, 81, 'FR', '41', 'Loir-et-Cher'),
	(224, 81, 'FR', '42', 'Loire'),
	(225, 81, 'FR', '43', 'Haute-Loire'),
	(226, 81, 'FR', '44', 'Loire-Atlantique'),
	(227, 81, 'FR', '45', 'Loiret'),
	(228, 81, 'FR', '46', 'Lot'),
	(229, 81, 'FR', '47', 'Lot-et-Garonne'),
	(230, 81, 'FR', '48', 'Lozère'),
	(231, 81, 'FR', '49', 'Maine-et-Loire'),
	(232, 81, 'FR', '50', 'Manche'),
	(233, 81, 'FR', '51', 'Marne'),
	(234, 81, 'FR', '52', 'Haute-Marne'),
	(235, 81, 'FR', '53', 'Mayenne'),
	(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
	(237, 81, 'FR', '55', 'Meuse'),
	(238, 81, 'FR', '56', 'Morbihan'),
	(239, 81, 'FR', '57', 'Moselle'),
	(240, 81, 'FR', '58', 'Nièvre'),
	(241, 81, 'FR', '59', 'Nord'),
	(242, 81, 'FR', '60', 'Oise'),
	(243, 81, 'FR', '61', 'Orne'),
	(244, 81, 'FR', '62', 'Pas-de-Calais'),
	(245, 81, 'FR', '63', 'Puy-de-Dôme'),
	(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
	(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
	(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
	(249, 81, 'FR', '67', 'Bas-Rhin'),
	(250, 81, 'FR', '68', 'Haut-Rhin'),
	(251, 81, 'FR', '69', 'Rhône'),
	(252, 81, 'FR', '70', 'Haute-Saône'),
	(253, 81, 'FR', '71', 'Saône-et-Loire'),
	(254, 81, 'FR', '72', 'Sarthe'),
	(255, 81, 'FR', '73', 'Savoie'),
	(256, 81, 'FR', '74', 'Haute-Savoie'),
	(257, 81, 'FR', '75', 'Paris'),
	(258, 81, 'FR', '76', 'Seine-Maritime'),
	(259, 81, 'FR', '77', 'Seine-et-Marne'),
	(260, 81, 'FR', '78', 'Yvelines'),
	(261, 81, 'FR', '79', 'Deux-Sèvres'),
	(262, 81, 'FR', '80', 'Somme'),
	(263, 81, 'FR', '81', 'Tarn'),
	(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
	(265, 81, 'FR', '83', 'Var'),
	(266, 81, 'FR', '84', 'Vaucluse'),
	(267, 81, 'FR', '85', 'Vendée'),
	(268, 81, 'FR', '86', 'Vienne'),
	(269, 81, 'FR', '87', 'Haute-Vienne'),
	(270, 81, 'FR', '88', 'Vosges'),
	(271, 81, 'FR', '89', 'Yonne'),
	(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
	(273, 81, 'FR', '91', 'Essonne'),
	(274, 81, 'FR', '92', 'Hauts-de-Seine'),
	(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
	(276, 81, 'FR', '94', 'Val-de-Marne'),
	(277, 81, 'FR', '95', 'Val-d\'Oise'),
	(278, 185, 'RO', 'AB', 'Alba'),
	(279, 185, 'RO', 'AR', 'Arad'),
	(280, 185, 'RO', 'AG', 'Argeş'),
	(281, 185, 'RO', 'BC', 'Bacău'),
	(282, 185, 'RO', 'BH', 'Bihor'),
	(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
	(284, 185, 'RO', 'BT', 'Botoşani'),
	(285, 185, 'RO', 'BV', 'Braşov'),
	(286, 185, 'RO', 'BR', 'Brăila'),
	(287, 185, 'RO', 'B', 'Bucureşti'),
	(288, 185, 'RO', 'BZ', 'Buzău'),
	(289, 185, 'RO', 'CS', 'Caraş-Severin'),
	(290, 185, 'RO', 'CL', 'Călăraşi'),
	(291, 185, 'RO', 'CJ', 'Cluj'),
	(292, 185, 'RO', 'CT', 'Constanţa'),
	(293, 185, 'RO', 'CV', 'Covasna'),
	(294, 185, 'RO', 'DB', 'Dâmboviţa'),
	(295, 185, 'RO', 'DJ', 'Dolj'),
	(296, 185, 'RO', 'GL', 'Galaţi'),
	(297, 185, 'RO', 'GR', 'Giurgiu'),
	(298, 185, 'RO', 'GJ', 'Gorj'),
	(299, 185, 'RO', 'HR', 'Harghita'),
	(300, 185, 'RO', 'HD', 'Hunedoara'),
	(301, 185, 'RO', 'IL', 'Ialomiţa'),
	(302, 185, 'RO', 'IS', 'Iaşi'),
	(303, 185, 'RO', 'IF', 'Ilfov'),
	(304, 185, 'RO', 'MM', 'Maramureş'),
	(305, 185, 'RO', 'MH', 'Mehedinţi'),
	(306, 185, 'RO', 'MS', 'Mureş'),
	(307, 185, 'RO', 'NT', 'Neamţ'),
	(308, 185, 'RO', 'OT', 'Olt'),
	(309, 185, 'RO', 'PH', 'Prahova'),
	(310, 185, 'RO', 'SM', 'Satu-Mare'),
	(311, 185, 'RO', 'SJ', 'Sălaj'),
	(312, 185, 'RO', 'SB', 'Sibiu'),
	(313, 185, 'RO', 'SV', 'Suceava'),
	(314, 185, 'RO', 'TR', 'Teleorman'),
	(315, 185, 'RO', 'TM', 'Timiş'),
	(316, 185, 'RO', 'TL', 'Tulcea'),
	(317, 185, 'RO', 'VS', 'Vaslui'),
	(318, 185, 'RO', 'VL', 'Vâlcea'),
	(319, 185, 'RO', 'VN', 'Vrancea'),
	(320, 80, 'FI', 'Lappi', 'Lappi'),
	(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
	(322, 80, 'FI', 'Kainuu', 'Kainuu'),
	(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
	(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
	(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
	(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
	(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
	(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
	(329, 80, 'FI', 'Satakunta', 'Satakunta'),
	(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
	(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
	(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
	(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
	(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
	(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
	(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
	(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
	(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
	(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
	(340, 74, 'EE', 'EE-37', 'Harjumaa'),
	(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
	(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
	(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
	(344, 74, 'EE', 'EE-51', 'Järvamaa'),
	(345, 74, 'EE', 'EE-57', 'Läänemaa'),
	(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
	(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
	(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
	(349, 74, 'EE', 'EE-70', 'Raplamaa'),
	(350, 74, 'EE', 'EE-74', 'Saaremaa'),
	(351, 74, 'EE', 'EE-78', 'Tartumaa'),
	(352, 74, 'EE', 'EE-82', 'Valgamaa'),
	(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
	(354, 74, 'EE', 'EE-86', 'Võrumaa'),
	(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
	(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
	(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
	(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
	(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
	(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
	(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
	(362, 125, 'LV', 'LV-RIX', 'Rīga'),
	(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
	(364, 125, 'LV', 'Valmiera', 'Valmiera'),
	(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
	(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
	(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
	(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
	(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
	(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
	(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
	(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
	(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
	(374, 125, 'LV', 'Apes novads', 'Apes novads'),
	(375, 125, 'LV', 'Auces novads', 'Auces novads'),
	(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
	(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
	(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
	(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
	(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
	(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
	(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
	(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
	(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
	(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
	(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
	(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
	(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
	(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
	(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
	(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
	(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
	(393, 125, 'LV', 'Engures novads', 'Engures novads'),
	(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
	(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
	(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
	(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
	(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
	(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
	(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
	(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
	(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
	(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
	(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
	(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
	(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
	(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
	(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
	(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
	(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
	(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
	(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
	(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
	(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
	(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
	(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
	(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
	(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
	(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
	(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
	(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
	(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
	(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
	(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
	(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
	(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
	(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
	(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
	(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
	(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
	(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
	(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
	(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
	(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
	(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
	(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
	(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
	(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
	(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
	(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
	(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
	(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
	(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
	(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
	(445, 125, 'LV', 'Salas novads', 'Salas novads'),
	(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
	(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
	(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
	(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
	(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
	(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
	(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
	(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
	(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
	(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
	(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
	(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
	(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
	(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
	(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
	(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
	(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
	(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
	(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
	(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
	(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
	(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
	(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
	(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
	(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
	(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
	(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
	(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
	(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
	(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
	(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
	(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
	(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
	(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
	(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
	(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
	(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
	(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
	(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
	(485, 31, 'BR', 'AC', 'Acre'),
	(486, 31, 'BR', 'AL', 'Alagoas'),
	(487, 31, 'BR', 'AP', 'Amapá'),
	(488, 31, 'BR', 'AM', 'Amazonas'),
	(489, 31, 'BR', 'BA', 'Bahia'),
	(490, 31, 'BR', 'CE', 'Ceará'),
	(491, 31, 'BR', 'ES', 'Espírito Santo'),
	(492, 31, 'BR', 'GO', 'Goiás'),
	(493, 31, 'BR', 'MA', 'Maranhão'),
	(494, 31, 'BR', 'MT', 'Mato Grosso'),
	(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
	(496, 31, 'BR', 'MG', 'Minas Gerais'),
	(497, 31, 'BR', 'PA', 'Pará'),
	(498, 31, 'BR', 'PB', 'Paraíba'),
	(499, 31, 'BR', 'PR', 'Paraná'),
	(500, 31, 'BR', 'PE', 'Pernambuco'),
	(501, 31, 'BR', 'PI', 'Piauí'),
	(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
	(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
	(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
	(505, 31, 'BR', 'RO', 'Rondônia'),
	(506, 31, 'BR', 'RR', 'Roraima'),
	(507, 31, 'BR', 'SC', 'Santa Catarina'),
	(508, 31, 'BR', 'SP', 'São Paulo'),
	(509, 31, 'BR', 'SE', 'Sergipe'),
	(510, 31, 'BR', 'TO', 'Tocantins'),
	(511, 31, 'BR', 'DF', 'Distrito Federal'),
	(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
	(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
	(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
	(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
	(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
	(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
	(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
	(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
	(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
	(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
	(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
	(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
	(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
	(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
	(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
	(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
	(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
	(529, 59, 'HR', 'HR-18', 'Istarska županija'),
	(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
	(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
	(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
	(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
	(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
	(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
	(536, 106, 'IN', 'AS', 'Assam'),
	(537, 106, 'IN', 'BR', 'Bihar'),
	(538, 106, 'IN', 'CH', 'Chandigarh'),
	(539, 106, 'IN', 'CT', 'Chhattisgarh'),
	(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
	(541, 106, 'IN', 'DD', 'Daman and Diu'),
	(542, 106, 'IN', 'DL', 'Delhi'),
	(543, 106, 'IN', 'GA', 'Goa'),
	(544, 106, 'IN', 'GJ', 'Gujarat'),
	(545, 106, 'IN', 'HR', 'Haryana'),
	(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
	(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
	(548, 106, 'IN', 'JH', 'Jharkhand'),
	(549, 106, 'IN', 'KA', 'Karnataka'),
	(550, 106, 'IN', 'KL', 'Kerala'),
	(551, 106, 'IN', 'LD', 'Lakshadweep'),
	(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
	(553, 106, 'IN', 'MH', 'Maharashtra'),
	(554, 106, 'IN', 'MN', 'Manipur'),
	(555, 106, 'IN', 'ML', 'Meghalaya'),
	(556, 106, 'IN', 'MZ', 'Mizoram'),
	(557, 106, 'IN', 'NL', 'Nagaland'),
	(558, 106, 'IN', 'OR', 'Odisha'),
	(559, 106, 'IN', 'PY', 'Puducherry'),
	(560, 106, 'IN', 'PB', 'Punjab'),
	(561, 106, 'IN', 'RJ', 'Rajasthan'),
	(562, 106, 'IN', 'SK', 'Sikkim'),
	(563, 106, 'IN', 'TN', 'Tamil Nadu'),
	(564, 106, 'IN', 'TG', 'Telangana'),
	(565, 106, 'IN', 'TR', 'Tripura'),
	(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
	(567, 106, 'IN', 'UT', 'Uttarakhand'),
	(568, 106, 'IN', 'WB', 'West Bengal'),
	(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
	(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
	(571, 176, 'PY', 'PY-13', 'Amambay'),
	(572, 176, 'PY', 'PY-ASU', 'Asunción'),
	(573, 176, 'PY', 'PY-19', 'Boquerón'),
	(574, 176, 'PY', 'PY-5', 'Caaguazú'),
	(575, 176, 'PY', 'PY-6', 'Caazapá'),
	(576, 176, 'PY', 'PY-14', 'Canindeyú'),
	(577, 176, 'PY', 'PY-11', 'Central'),
	(578, 176, 'PY', 'PY-1', 'Concepción'),
	(579, 176, 'PY', 'PY-3', 'Cordillera'),
	(580, 176, 'PY', 'PY-4', 'Guairá'),
	(581, 176, 'PY', 'PY-7', 'Itapúa'),
	(582, 176, 'PY', 'PY-8', 'Misiones'),
	(583, 176, 'PY', 'PY-9', 'Paraguarí'),
	(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
	(585, 176, 'PY', 'PY-2', 'San Pedro'),
	(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- Dumping structure for table bagisto_db.country_state_translations
DROP TABLE IF EXISTS `country_state_translations`;
CREATE TABLE IF NOT EXISTS `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.country_state_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.country_translations
DROP TABLE IF EXISTS `country_translations`;
CREATE TABLE IF NOT EXISTS `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.country_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.currencies
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int unsigned NOT NULL DEFAULT '2',
  `group_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.currencies: ~2 rows (approximately)
INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `group_separator`, `decimal_separator`, `currency_position`, `created_at`, `updated_at`) VALUES
	(1, 'USD', 'United States Dollar', '$', 2, ',', '.', NULL, NULL, NULL),
	(2, 'VND', 'Việt Nam Đồng', 'đ', 0, '', '', '', '2026-09-29 06:27:20', '2026-09-29 06:27:20');

-- Dumping structure for table bagisto_db.currency_exchange_rates
DROP TABLE IF EXISTS `currency_exchange_rates`;
CREATE TABLE IF NOT EXISTS `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.currency_exchange_rates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  UNIQUE KEY `customers_email_channel_unique` (`email`,`channel_id`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customers: ~0 rows (approximately)
INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `channel_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Nguyễn', 'Hùng', NULL, NULL, 'hungnd13112004@gmail.com', NULL, NULL, 1, '$2y$12$xyQM1Bu8y5HoCm3BDKr.QuGF7C7e3HmvvTyT6s/yk1fFELYN24rxK', 'KWlcsZZmZaVuOVSF0i6AVo6QMDYiqv7BihcEEEzE9xViWui53P2h3c72urf94Y4caxckArH3TuaTnZFM', 2, 1, 0, 1, 0, '42cd4410d97a026cf03365823cb2d360', NULL, '2026-09-29 07:41:04', '2026-09-29 07:41:04');

-- Dumping structure for table bagisto_db.customer_groups
DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_groups: ~3 rows (approximately)
INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
	(1, 'guest', 'Guest', 0, NULL, NULL),
	(2, 'general', 'General', 0, NULL, NULL),
	(3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- Dumping structure for table bagisto_db.customer_notes
DROP TABLE IF EXISTS `customer_notes`;
CREATE TABLE IF NOT EXISTS `customer_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_notes: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.customer_password_resets
DROP TABLE IF EXISTS `customer_password_resets`;
CREATE TABLE IF NOT EXISTS `customer_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_password_resets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.customer_social_accounts
DROP TABLE IF EXISTS `customer_social_accounts`;
CREATE TABLE IF NOT EXISTS `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `provider_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_social_accounts: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.datagrid_saved_filters
DROP TABLE IF EXISTS `datagrid_saved_filters`;
CREATE TABLE IF NOT EXISTS `datagrid_saved_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.datagrid_saved_filters: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.downloadable_link_purchased
DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.downloadable_link_purchased: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.eu_withdrawals
DROP TABLE IF EXISTS `eu_withdrawals`;
CREATE TABLE IF NOT EXISTS `eu_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int unsigned NOT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `received_at` timestamp NOT NULL,
  `confirmation_sent_at` timestamp NULL DEFAULT NULL,
  `final_confirmation_sent_at` timestamp NULL DEFAULT NULL,
  `confirmation_error` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `declined_at` timestamp NULL DEFAULT NULL,
  `declined_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `declined_by_user_id` int unsigned DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  `refunded_by_user_id` int unsigned DEFAULT NULL,
  `refund_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eu_withdrawals_order_id_unique` (`order_id`),
  UNIQUE KEY `eu_withdrawals_uuid_unique` (`uuid`),
  KEY `eu_withdrawals_customer_id_index` (`customer_id`),
  KEY `eu_withdrawals_channel_id_status_index` (`channel_id`,`status`),
  KEY `eu_withdrawals_received_at_index` (`received_at`),
  KEY `eu_withdrawals_declined_by_user_id_foreign` (`declined_by_user_id`),
  KEY `eu_withdrawals_refunded_by_user_id_foreign` (`refunded_by_user_id`),
  CONSTRAINT `eu_withdrawals_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `eu_withdrawals_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eu_withdrawals_declined_by_user_id_foreign` FOREIGN KEY (`declined_by_user_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eu_withdrawals_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `eu_withdrawals_refunded_by_user_id_foreign` FOREIGN KEY (`refunded_by_user_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.eu_withdrawals: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.gdpr_data_request
DROP TABLE IF EXISTS `gdpr_data_request`;
CREATE TABLE IF NOT EXISTS `gdpr_data_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gdpr_data_request_customer_id_foreign` (`customer_id`),
  CONSTRAINT `gdpr_data_request_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.gdpr_data_request: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.imports
DROP TABLE IF EXISTS `imports`;
CREATE TABLE IF NOT EXISTS `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'directory',
  `images_archive_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.imports: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.import_batches
DROP TABLE IF EXISTS `import_batches`;
CREATE TABLE IF NOT EXISTS `import_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.import_batches: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.inventory_sources
DROP TABLE IF EXISTS `inventory_sources`;
CREATE TABLE IF NOT EXISTS `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.inventory_sources: ~0 rows (approximately)
INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'default', 'Default', NULL, 'Default', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- Dumping structure for table bagisto_db.invoices
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.invoices: ~0 rows (approximately)
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES
	(1, '1', 'paid', 1, 1, 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 0.0000, 0.0000, 3, NULL, 0, NULL, '2026-09-29 07:55:18', '2026-09-29 07:55:24');

-- Dumping structure for table bagisto_db.invoice_items
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.invoice_items: ~0 rows (approximately)
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC', NULL, 'EAR-SONY-WF1000XM5', 1, 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, 12, 'Webkul\\Product\\Models\\Product', 3, 1, '{"locale": "en", "cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:55:18', '2026-09-29 07:55:18');

-- Dumping structure for table bagisto_db.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.jobs: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.job_batches: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.locales
DROP TABLE IF EXISTS `locales`;
CREATE TABLE IF NOT EXISTS `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.locales: ~0 rows (approximately)
INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
	(1, 'en', 'English', 'ltr', 'locales/mtjubU38w8ZtfTSH537Cm9e3R6uAOIAJHbGwGB5E.png', NULL, NULL);

-- Dumping structure for table bagisto_db.marketing_campaigns
DROP TABLE IF EXISTS `marketing_campaigns`;
CREATE TABLE IF NOT EXISTS `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.marketing_campaigns: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.marketing_events
DROP TABLE IF EXISTS `marketing_events`;
CREATE TABLE IF NOT EXISTS `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.marketing_events: ~0 rows (approximately)
INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
	(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- Dumping structure for table bagisto_db.marketing_templates
DROP TABLE IF EXISTS `marketing_templates`;
CREATE TABLE IF NOT EXISTS `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.marketing_templates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.migrations: ~199 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2018_06_12_111907_create_admins_table', 1),
	(5, '2018_06_13_055341_create_roles_table', 1),
	(6, '2018_07_05_130148_create_attributes_table', 1),
	(7, '2018_07_05_132854_create_attribute_translations_table', 1),
	(8, '2018_07_05_135150_create_attribute_families_table', 1),
	(9, '2018_07_05_135152_create_attribute_groups_table', 1),
	(10, '2018_07_05_140832_create_attribute_options_table', 1),
	(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
	(12, '2018_07_05_142820_create_categories_table', 1),
	(13, '2018_07_10_055143_create_locales_table', 1),
	(14, '2018_07_20_054426_create_countries_table', 1),
	(15, '2018_07_20_054502_create_currencies_table', 1),
	(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
	(17, '2018_07_20_064849_create_channels_table', 1),
	(18, '2018_07_21_142836_create_category_translations_table', 1),
	(19, '2018_07_23_110040_create_inventory_sources_table', 1),
	(20, '2018_07_24_082635_create_customer_groups_table', 1),
	(21, '2018_07_24_082930_create_customers_table', 1),
	(22, '2018_07_27_065727_create_products_table', 1),
	(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
	(24, '2018_07_27_092623_create_product_reviews_table', 1),
	(25, '2018_07_27_113941_create_product_images_table', 1),
	(26, '2018_07_27_113956_create_product_inventories_table', 1),
	(27, '2018_08_30_064755_create_tax_categories_table', 1),
	(28, '2018_08_30_065042_create_tax_rates_table', 1),
	(29, '2018_08_30_065840_create_tax_mappings_table', 1),
	(30, '2018_09_05_150444_create_cart_table', 1),
	(31, '2018_09_05_150915_create_cart_items_table', 1),
	(32, '2018_09_11_064045_customer_password_resets', 1),
	(33, '2018_09_19_093453_create_cart_payment', 1),
	(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
	(35, '2018_09_20_060658_create_core_config_table', 1),
	(36, '2018_09_27_113154_create_orders_table', 1),
	(37, '2018_09_27_113207_create_order_items_table', 1),
	(38, '2018_09_27_115022_create_shipments_table', 1),
	(39, '2018_09_27_115029_create_shipment_items_table', 1),
	(40, '2018_09_27_115135_create_invoices_table', 1),
	(41, '2018_09_27_115144_create_invoice_items_table', 1),
	(42, '2018_10_01_095504_create_order_payment_table', 1),
	(43, '2018_10_03_025230_create_wishlist_table', 1),
	(44, '2018_10_12_101803_create_country_translations_table', 1),
	(45, '2018_10_12_101913_create_country_states_table', 1),
	(46, '2018_10_12_101923_create_country_state_translations_table', 1),
	(47, '2018_11_16_173504_create_subscribers_list_table', 1),
	(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
	(49, '2018_12_06_185202_create_product_flat_table', 1),
	(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
	(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
	(52, '2019_05_13_024321_create_cart_rules_table', 1),
	(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
	(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
	(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
	(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
	(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
	(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
	(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
	(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
	(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
	(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
	(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
	(64, '2019_07_02_180307_create_booking_products_table', 1),
	(65, '2019_07_05_154415_create_booking_product_default_slots_table', 1),
	(66, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1),
	(67, '2019_07_05_154440_create_booking_product_event_tickets_table', 1),
	(68, '2019_07_05_154451_create_booking_product_rental_slots_table', 1),
	(69, '2019_07_05_154502_create_booking_product_table_slots_table', 1),
	(70, '2019_07_30_153530_create_cms_pages_table', 1),
	(71, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
	(72, '2019_08_02_105320_create_product_grouped_products_table', 1),
	(73, '2019_08_20_170510_create_product_bundle_options_table', 1),
	(74, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
	(75, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
	(76, '2019_09_11_184511_create_refunds_table', 1),
	(77, '2019_09_11_184519_create_refund_items_table', 1),
	(78, '2019_12_03_184613_create_catalog_rules_table', 1),
	(79, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
	(80, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
	(81, '2019_12_06_101110_create_catalog_rule_products_table', 1),
	(82, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
	(83, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(84, '2020_01_14_191854_create_cms_page_translations_table', 1),
	(85, '2020_01_15_130209_create_cms_page_channels_table', 1),
	(86, '2020_02_18_165639_create_bookings_table', 1),
	(87, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1),
	(88, '2020_04_16_185147_add_table_addresses', 1),
	(89, '2020_05_06_171638_create_order_comments_table', 1),
	(90, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
	(91, '2020_06_25_162154_create_customer_social_accounts_table', 1),
	(92, '2020_08_07_174804_create_gdpr_data_request_table', 1),
	(93, '2020_11_19_112228_create_product_videos_table', 1),
	(94, '2020_11_26_141455_create_marketing_templates_table', 1),
	(95, '2020_11_26_150534_create_marketing_events_table', 1),
	(96, '2020_11_26_150644_create_marketing_campaigns_table', 1),
	(97, '2020_12_21_000200_create_channel_translations_table', 1),
	(98, '2020_12_27_121950_create_jobs_table', 1),
	(99, '2021_03_11_212124_create_order_transactions_table', 1),
	(100, '2021_04_07_132010_create_product_review_images_table', 1),
	(101, '2021_12_15_104544_notifications', 1),
	(102, '2022_03_15_160510_create_failed_jobs_table', 1),
	(103, '2022_04_01_094622_create_sitemaps_table', 1),
	(104, '2022_10_03_144232_create_product_price_indices_table', 1),
	(105, '2022_10_04_144444_create_job_batches_table', 1),
	(106, '2022_10_08_134150_create_product_inventory_indices_table', 1),
	(107, '2023_05_26_213105_create_wishlist_items_table', 1),
	(108, '2023_05_26_213120_create_compare_items_table', 1),
	(109, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
	(110, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
	(111, '2023_07_10_184256_create_theme_customizations_table', 1),
	(112, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
	(113, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
	(114, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
	(115, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
	(116, '2023_07_25_171058_create_customer_notes_table', 1),
	(117, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
	(118, '2023_09_15_170053_create_theme_customization_translations_table', 1),
	(119, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
	(120, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
	(121, '2023_09_26_155709_add_columns_to_currencies', 1),
	(122, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
	(123, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1),
	(124, '2023_11_08_140116_create_search_terms_table', 1),
	(125, '2023_11_09_162805_create_url_rewrites_table', 1),
	(126, '2023_11_17_150401_create_search_synonyms_table', 1),
	(127, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1),
	(128, '2024_01_11_154640_create_imports_table', 1),
	(129, '2024_01_11_154741_create_import_batches_table', 1),
	(130, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1),
	(131, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1),
	(132, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1),
	(133, '2024_02_26_153000_add_columns_to_addresses_table', 1),
	(134, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1),
	(135, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1),
	(136, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1),
	(137, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1),
	(138, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1),
	(139, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1),
	(140, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1),
	(141, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1),
	(142, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1),
	(143, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1),
	(144, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1),
	(145, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1),
	(146, '2024_05_10_152848_create_saved_filters_table', 1),
	(147, '2024_06_03_174128_create_product_channels_table', 1),
	(148, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1),
	(149, '2024_06_04_130600_make_email_unique_per_channel', 1),
	(150, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1),
	(151, '2024_07_17_172645_add_additional_column_to_sitemaps_table', 1),
	(152, '2024_10_11_135010_create_product_customizable_options_table', 1),
	(153, '2024_10_11_135110_create_product_customizable_option_translations_table', 1),
	(154, '2024_10_11_135228_create_product_customizable_option_prices_table', 1),
	(155, '2025_05_07_121250_update_total_weight_columns_in_shipments_and_weight_shipment_items_tables', 1),
	(156, '2025_09_05_000100_add_indexes_to_channels_tables', 1),
	(157, '2025_09_05_000200_add_indexes_to_product_relation_tables', 1),
	(158, '2025_09_05_000300_add_indexes_to_product_media_and_attributes', 1),
	(159, '2025_09_05_000400_add_indexes_to_attributes_and_product_types', 1),
	(160, '2025_09_05_000500_add_indexes_to_product_grouped_products_and_product_bundle_option_products', 1),
	(161, '2025_09_05_000500_add_indexes_to_url_rewrites_and_visits', 1),
	(162, '2025_09_11_140301_add_two_factor_to_admins', 1),
	(163, '2025_11_14_173810_create_rma_statuses_table', 1),
	(164, '2025_11_14_173812_create_rma_table', 1),
	(165, '2025_11_14_173906_create_rma_reasons_table', 1),
	(166, '2025_11_14_173959_create_rma_items_table', 1),
	(167, '2025_11_14_174030_create_rma_images_table', 1),
	(168, '2025_11_14_174059_create_rma_messages_table', 1),
	(169, '2025_11_14_174134_create_rma_reason_resolutions_table', 1),
	(170, '2025_11_14_174205_create_rma_rules_table', 1),
	(171, '2025_11_14_174355_create_rma_custom_fields_table', 1),
	(172, '2025_11_14_174426_create_rma_custom_field_options_table', 1),
	(173, '2025_11_14_174509_create_rma_additional_fields_table', 1),
	(174, '2026_02_03_151924_create_sessions_table', 1),
	(175, '2026_02_11_095547_add_rma_return_period_to_order_items_table', 1),
	(176, '2026_03_11_113926_create_agent_conversations_table', 1),
	(177, '2026_04_09_120000_change_tax_category_id_fk_on_cart_items_to_null_on_delete', 1),
	(178, '2026_04_09_120100_change_tax_category_id_fk_on_order_items_to_null_on_delete', 1),
	(179, '2026_04_17_000001_add_booking_product_enhancements', 1),
	(180, '2026_04_17_000002_add_allow_cancellation_snapshot_to_bookings', 1),
	(181, '2026_05_27_114230_create_eu_withdrawals_table', 1),
	(182, '2026_06_24_000000_rename_received_package_rma_status', 1),
	(183, '2026_06_24_000001_rename_neutral_rma_statuses', 1),
	(184, '2026_07_03_170000_create_sitemap_channels_table', 1),
	(185, '2026_07_27_000001_add_image_source_to_imports_table', 1),
	(186, '2026_08_10_000001_add_derived_columns_in_product_flat_table', 1),
	(187, '2026_08_13_000001_make_images_count_nullable_in_product_flat_table', 1),
	(188, '2026_08_15_000001_create_product_image_translations_table', 1),
	(189, '2026_08_15_000002_add_alt_text_columns_to_category_translations_table', 1),
	(190, '2026_08_15_000003_add_logo_alt_column_to_channel_translations_table', 1),
	(191, '2026_08_15_000004_add_swatch_alt_column_to_attribute_option_translations_table', 1),
	(192, '2026_08_15_000005_rename_theme_customizations_to_theme_sections', 1),
	(193, '2026_08_15_000006_move_theme_uploads_to_section_directory', 1),
	(194, '2026_08_15_000007_add_draft_options_to_theme_section_translations_table', 1),
	(195, '2026_08_15_000008_make_options_nullable_on_theme_section_translations_table', 1),
	(196, '2026_08_19_000002_add_draft_columns_to_theme_sections_table', 1),
	(197, '2026_08_26_000001_rename_linkedin_social_login_config_code', 1),
	(198, '2026_09_04_000001_drop_duplicate_channel_pivot_indexes', 1),
	(199, '2026_09_04_000002_drop_duplicate_attributes_code_index', 1);

-- Dumping structure for table bagisto_db.notifications
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.notifications: ~3 rows (approximately)
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES
	(1, 'order', 1, 1, '2026-09-28 02:29:21', '2026-09-28 02:30:25'),
	(2, 'order', 0, 2, '2026-09-29 07:43:15', '2026-09-29 07:43:15'),
	(3, 'order', 1, 3, '2026-09-29 07:48:03', '2026-09-29 07:54:23');

-- Dumping structure for table bagisto_db.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.orders: ~3 rows (approximately)
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES
	(1, '1', 'canceled', 'Default', 1, 'hungnd13112004@gmail.com', 'Nguyễn', 'Hùng', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 1, NULL, '2026-09-28 02:29:18', '2026-09-28 02:30:59'),
	(2, '2', 'pending', 'Default', 0, 'hungnd13112004@gmail.com', 'Nguyễn', 'Hùng', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 2, NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(3, '3', 'completed', 'Default', 0, 'hungnd13112004@gmail.com', 'Nguyễn', 'Hùng', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 3, NULL, '2026-09-29 07:48:01', '2026-09-29 07:55:19');

-- Dumping structure for table bagisto_db.order_comments
DROP TABLE IF EXISTS `order_comments`;
CREATE TABLE IF NOT EXISTS `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_comments: ~0 rows (approximately)
INSERT INTO `order_comments` (`id`, `order_id`, `comment`, `customer_notified`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ok', 0, '2026-09-28 02:30:41', '2026-09-28 02:30:41');

-- Dumping structure for table bagisto_db.order_items
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `rma_return_period` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_items: ~3 rows (approximately)
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `rma_return_period`, `created_at`, `updated_at`) VALUES
	(1, 'PHONE-ROG8PRO-512', 'simple', 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', NULL, 0.3500, 0.3500, 1, 0, 0, 1, 0, 999.0000, 999.0000, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 999.0000, 999.0000, 5, 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '{"locale": "en", "cart_id": 1, "quantity": 1, "is_buy_now": "0", "product_id": "5"}', NULL, '2026-09-28 02:29:18', '2026-09-28 02:30:59'),
	(2, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 1, 0, 0, 0, 0, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 6, 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, '{"locale": "en", "cart_id": 2, "quantity": 1, "product_id": 6}', NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(3, 'EAR-SONY-WF1000XM5', 'simple', 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC', NULL, 0.3500, 0.3500, 1, 1, 1, 0, 0, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, 12, 'Webkul\\Product\\Models\\Product', 3, NULL, NULL, '{"locale": "en", "cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', NULL, '2026-09-29 07:48:01', '2026-09-29 07:55:19');

-- Dumping structure for table bagisto_db.order_payment
DROP TABLE IF EXISTS `order_payment`;
CREATE TABLE IF NOT EXISTS `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_payment: ~3 rows (approximately)
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 1, 'cashondelivery', 'Cash On Delivery', NULL, '2026-09-28 02:29:18', '2026-09-28 02:29:18'),
	(2, 2, 'moneytransfer', 'Money Transfer', NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(3, 3, 'cashondelivery', 'Cash On Delivery', NULL, '2026-09-29 07:48:01', '2026-09-29 07:48:01');

-- Dumping structure for table bagisto_db.order_transactions
DROP TABLE IF EXISTS `order_transactions`;
CREATE TABLE IF NOT EXISTS `order_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_transactions: ~0 rows (approximately)
INSERT INTO `order_transactions` (`id`, `transaction_id`, `status`, `type`, `amount`, `payment_method`, `data`, `invoice_id`, `order_id`, `created_at`, `updated_at`) VALUES
	(1, '90880c49c129a4b8c306f21b34285c5f', 'paid', 'cashondelivery', 249.9900, 'cashondelivery', NULL, 1, 3, '2026-09-29 07:55:19', '2026-09-29 07:55:19');

-- Dumping structure for table bagisto_db.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.password_resets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.products: ~18 rows (approximately)
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'PHONE-IP16PM-256', 'simple', NULL, 1, NULL, '2026-09-28 02:17:35', '2026-09-28 02:17:35'),
	(2, 'TEST-001', 'simple', NULL, 1, NULL, '2026-09-28 02:20:28', '2026-09-28 02:20:28'),
	(3, 'PHONE-TEST-002', 'simple', NULL, 1, NULL, '2026-09-28 02:20:40', '2026-09-28 02:20:40'),
	(4, 'PHONE-S24U-512', 'simple', NULL, 1, NULL, '2026-09-28 02:21:11', '2026-09-28 02:21:11'),
	(5, 'PHONE-ROG8PRO-512', 'simple', NULL, 1, NULL, '2026-09-28 02:21:26', '2026-09-28 02:21:26'),
	(6, 'PHONE-XM14U-512', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(7, 'CHG-ANKER-737-140W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(8, 'CHG-BASEUS-BLADE-100W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(9, 'CHG-UGREEN-NEXODE-300W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(10, 'PB-SHARGEEK-STORM2-100W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(11, 'PB-ANKER-PRIME-20000', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(12, 'EAR-SONY-WF1000XM5', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(13, 'EAR-ROG-CETRA-SPEEDNOVA', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(14, 'COOL-REDMAGIC-5PRO', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(15, 'COOL-BLACKSHARK-4PRO', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(16, 'CAB-UGREEN-TB4-240W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(17, 'CASE-UAG-MONARCH-PRO', 'simple', NULL, 1, NULL, '2026-09-28 02:21:29', '2026-09-28 02:21:29'),
	(18, 'GLASS-BELKIN-SAPPHIRE', 'simple', NULL, 1, NULL, '2026-09-28 02:21:29', '2026-09-28 02:21:29');

-- Dumping structure for table bagisto_db.product_attribute_values
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `prod_attr_product_id_idx` (`product_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_attribute_values: ~294 rows (approximately)
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES
	(1, NULL, NULL, 'TEST-001', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, '2|1'),
	(2, 'en', NULL, 'Test Product', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'en|2|2'),
	(3, 'en', NULL, 'test-product-001', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 'en|2|3'),
	(4, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 28, 'default|2|28'),
	(5, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 2, 11, '2|11'),
	(6, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 29, 'default|2|29'),
	(7, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 5, '2|5'),
	(8, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 6, '2|6'),
	(9, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 7, '2|7'),
	(10, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 8, 'default|2|8'),
	(11, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 26, '2|26'),
	(12, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 2, 22, '2|22'),
	(13, 'en', NULL, '<p>Test short desc</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 'en|3|9'),
	(14, 'en', NULL, '<p>Test full desc</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, 'en|3|10'),
	(15, NULL, NULL, 'PHONE-TEST-002', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '3|1'),
	(16, 'en', NULL, 'iPhone 16 Pro Max Test', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 'en|3|2'),
	(17, 'en', NULL, 'iphone-16-pro-max-test', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 'en|3|3'),
	(18, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 28, 'default|3|28'),
	(19, NULL, NULL, NULL, NULL, NULL, 1199.0000, NULL, NULL, NULL, 3, 11, '3|11'),
	(20, NULL, NULL, NULL, NULL, NULL, 899.0000, NULL, NULL, NULL, 3, 12, '3|12'),
	(21, NULL, NULL, NULL, NULL, NULL, 1129.0000, NULL, NULL, NULL, 3, 13, '3|13'),
	(22, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 3, 14, 'default|3|14'),
	(23, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 3, 15, 'default|3|15'),
	(24, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 29, 'default|3|29'),
	(25, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 5, '3|5'),
	(26, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 6, '3|6'),
	(27, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 7, '3|7'),
	(28, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 8, 'default|3|8'),
	(29, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 26, '3|26'),
	(30, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 3, 22, '3|22'),
	(31, 'en', NULL, '<p>Quái vật Gaming Phone hàng đầu với màn hình AMOLED 165Hz siêu mượt, hệ thống phím cảm ứng siêu âm AirTrigger và tản nhiệt buồng hơi 3D GameCool 8.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, 'en|5|9'),
	(32, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Quái vật Gaming Phone hàng đầu với màn hình AMOLED 165Hz siêu mượt, hệ thống phím cảm ứng siêu âm AirTrigger và tản nhiệt buồng hơi 3D GameCool 8.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">6.78 inch Samsung E6 Flexible AMOLED 165Hz LTPO 2500 nits</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Vi xử lý</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Snapdragon 8 Gen 3 xung nhịp 3.3GHz</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bộ nhớ &amp; RAM</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">16GB LPDDR5X RAM, 512GB UFS 4.0</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Đèn LED</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Màn hình phụ AniMe Vision 341 đèn mini-LED tùy biến</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Pin &amp; Sạc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">5.500 mAh, Sạc siêu tốc HyperCharge 65W, Sạc không dây Qi 15W</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Tính năng Gaming</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">AirTrigger 8, Cổng USB-C kép (cạnh bên &amp; đáy), Kháng nước IP68</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, 'en|5|10'),
	(33, NULL, NULL, 'PHONE-ROG8PRO-512', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, '5|1'),
	(34, 'en', NULL, 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 'en|5|2'),
	(35, 'en', NULL, 'asus-rog-phone-8-pro-16gb512gb-gaming-snapdragon-8-gen-3-nom6', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, 'en|5|3'),
	(36, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 28, 'default|5|28'),
	(37, NULL, NULL, NULL, NULL, NULL, 1099.0000, NULL, NULL, NULL, 5, 11, '5|11'),
	(38, NULL, NULL, NULL, NULL, NULL, 824.2500, NULL, NULL, NULL, 5, 12, '5|12'),
	(39, NULL, NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, 5, 13, '5|13'),
	(40, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 5, 14, 'default|5|14'),
	(41, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 5, 15, 'default|5|15'),
	(42, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 29, 'default|5|29'),
	(43, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 5, '5|5'),
	(44, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 6, '5|6'),
	(45, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 7, '5|7'),
	(46, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 8, 'default|5|8'),
	(47, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 26, '5|26'),
	(48, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 5, 22, '5|22'),
	(49, 'en', NULL, '<p>Đỉnh cao nhiếp ảnh di động phối hợp cùng huyền thoại Leica với cụm 4 camera 50MP cảm biến 1-inch khẩu độ vô cấp mượt mà.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9, 'en|6|9'),
	(50, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Đỉnh cao nhiếp ảnh di động phối hợp cùng huyền thoại Leica với cụm 4 camera 50MP cảm biến 1-inch khẩu độ vô cấp mượt mà.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">6.73 inch LTPO AMOLED WQHD+ 120Hz 3000 nits Dolby Vision</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Vi xử lý</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Qualcomm Snapdragon 8 Gen 3</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bộ nhớ &amp; RAM</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">16GB LPDDR5X RAM, 512GB UFS 4.0</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Camera Leica</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">50MP LYT-900 1-inch OIS khẩu độ thay đổi f/1.63 - f/4.0</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Pin &amp; Sạc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">5.000 mAh, Sạc nhanh có dây 90W HyperCharge, Sạc không dây 80W</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10, 'en|6|10'),
	(51, NULL, NULL, 'PHONE-XM14U-512', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, '6|1'),
	(52, 'en', NULL, 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 'en|6|2'),
	(53, 'en', NULL, 'xiaomi-14-ultra-16gb512gb-leica-quad-camera-1-inch-sensor-7anx', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3, 'en|6|3'),
	(54, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 28, 'default|6|28'),
	(55, NULL, NULL, NULL, NULL, NULL, 1149.0000, NULL, NULL, NULL, 6, 11, '6|11'),
	(56, NULL, NULL, NULL, NULL, NULL, 861.7500, NULL, NULL, NULL, 6, 12, '6|12'),
	(57, NULL, NULL, NULL, NULL, NULL, 1049.0000, NULL, NULL, NULL, 6, 13, '6|13'),
	(58, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 6, 14, 'default|6|14'),
	(59, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 6, 15, 'default|6|15'),
	(60, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 29, 'default|6|29'),
	(61, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 5, '6|5'),
	(62, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 6, '6|6'),
	(63, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7, '6|7'),
	(64, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8, 'default|6|8'),
	(65, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 26, '6|26'),
	(66, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22, '6|22'),
	(67, 'en', NULL, '<p>Củ sạc công nghệ GaN tiên tiến nhất của Anker với công suất cực đại 140W chuẩn PD 3.1, đủ sức sạc nhanh tối đa cho cả MacBook Pro 16 inch và 2 iPhone cùng lúc.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'en|7|9'),
	(68, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Củ sạc công nghệ GaN tiên tiến nhất của Anker với công suất cực đại 140W chuẩn PD 3.1, đủ sức sạc nhanh tối đa cho cả MacBook Pro 16 inch và 2 iPhone cùng lúc.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Tổng công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">140W Max (Hỗ trợ chuẩn USB Power Delivery 3.1)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng kết nối</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">2 x USB-C (140W max per port), 1 x USB-A (22.5W)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công nghệ</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">GaNPrime, ActiveShield 2.0 kiểm soát nhiệt 3 triệu lần/ngày</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Tương thích</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">MacBook Pro, Dell XPS, iPhone 16/15, Samsung 45W Super Fast Charging 2.0</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Kích thước</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Nhỏ hơn 39% so với củ sạc Apple 140W tiêu chuẩn</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10, 'en|7|10'),
	(69, NULL, NULL, 'CHG-ANKER-737-140W', NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, '7|1'),
	(70, 'en', NULL, 'Củ Sạc GaN Anker 737 GaNPrime 140W 3 Cổng (A2341)', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2, 'en|7|2'),
	(71, 'en', NULL, 'cu-sac-gan-anker-737-ganprime-140w-3-cong-a2341-gquz', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'en|7|3'),
	(72, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 28, 'default|7|28'),
	(73, NULL, NULL, NULL, NULL, NULL, 99.9900, NULL, NULL, NULL, 7, 11, '7|11'),
	(74, NULL, NULL, NULL, NULL, NULL, 74.9900, NULL, NULL, NULL, 7, 12, '7|12'),
	(75, NULL, NULL, NULL, NULL, NULL, 84.9900, NULL, NULL, NULL, 7, 13, '7|13'),
	(76, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 7, 14, 'default|7|14'),
	(77, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 7, 15, 'default|7|15'),
	(78, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 29, 'default|7|29'),
	(79, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 5, '7|5'),
	(80, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 6, '7|6'),
	(81, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 7, '7|7'),
	(82, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 8, 'default|7|8'),
	(83, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 26, '7|26'),
	(84, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 7, 22, '7|22'),
	(85, 'en', NULL, '<p>Thiết kế dẹp siêu mỏng chỉ 18mm dễ dàng đút vừa balo túi xách, công suất mạnh mẽ 100W chia nguồn thông minh cho 4 cổng.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 9, 'en|8|9'),
	(86, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Thiết kế dẹp siêu mỏng chỉ 18mm dễ dàng đút vừa balo túi xách, công suất mạnh mẽ 100W chia nguồn thông minh cho 4 cổng.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">100W Max</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng ra</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">2x Type-C (100W), 2x USB-A (30W)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Độ mỏng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Chỉ 1.8cm thiết kế dạng thẻ Card siêu gọn</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bảo vệ</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Tự ngắt khi đầy, chống quá áp, quá dòng, quá nhiệt chuẩn quốc tế</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 10, 'en|8|10'),
	(87, NULL, NULL, 'CHG-BASEUS-BLADE-100W', NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, '8|1'),
	(88, 'en', NULL, 'Củ Sạc Siêu Mỏng Baseus Blade HD GaN 100W PD 3.0 & QC 4.0', NULL, NULL, NULL, NULL, NULL, NULL, 8, 2, 'en|8|2'),
	(89, 'en', NULL, 'cu-sac-sieu-mong-baseus-blade-hd-gan-100w-pd-30-qc-40-a1gh', NULL, NULL, NULL, NULL, NULL, NULL, 8, 3, 'en|8|3'),
	(90, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 28, 'default|8|28'),
	(91, NULL, NULL, NULL, NULL, NULL, 69.9900, NULL, NULL, NULL, 8, 11, '8|11'),
	(92, NULL, NULL, NULL, NULL, NULL, 52.4900, NULL, NULL, NULL, 8, 12, '8|12'),
	(93, NULL, NULL, NULL, NULL, NULL, 54.9900, NULL, NULL, NULL, 8, 13, '8|13'),
	(94, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 8, 14, 'default|8|14'),
	(95, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 8, 15, 'default|8|15'),
	(96, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 29, 'default|8|29'),
	(97, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 5, '8|5'),
	(98, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 6, '8|6'),
	(99, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 7, '8|7'),
	(100, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 8, 'default|8|8'),
	(101, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 26, '8|26'),
	(102, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 8, 22, '8|22'),
	(103, 'en', NULL, '<p>Trạm sạc để bàn uy lực nhất hành tinh, có thể sạc cùng lúc 3 chiếc Laptop công suất cao và 2 điện thoại di động ở tốc độ tối đa.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9, 'en|9|9'),
	(104, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Trạm sạc để bàn uy lực nhất hành tinh, có thể sạc cùng lúc 3 chiếc Laptop công suất cao và 2 điện thoại di động ở tốc độ tối đa.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất tổng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">300W Max</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng chính Type-C1</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">140W Max độc lập chuẩn PD 3.1</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chip GaN</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">GaNFast thế hệ III tối ưu hiệu suất 95%</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chân cắm</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Dây nguồn nối dài 2m cắm ổ điện bàn làm việc</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10, 'en|9|10'),
	(105, NULL, NULL, 'CHG-UGREEN-NEXODE-300W', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, '9|1'),
	(106, 'en', NULL, 'Trạm Sạc Để Bàn Ugreen Nexode GaN 300W 5 Cổng Sạc 3 Laptop', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2, 'en|9|2'),
	(107, 'en', NULL, 'tram-sac-de-ban-ugreen-nexode-gan-300w-5-cong-sac-3-laptop-oox7', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3, 'en|9|3'),
	(108, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 28, 'default|9|28'),
	(109, NULL, NULL, NULL, NULL, NULL, 199.9900, NULL, NULL, NULL, 9, 11, '9|11'),
	(110, NULL, NULL, NULL, NULL, NULL, 149.9900, NULL, NULL, NULL, 9, 12, '9|12'),
	(111, NULL, NULL, NULL, NULL, NULL, 169.9900, NULL, NULL, NULL, 9, 13, '9|13'),
	(112, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 9, 14, 'default|9|14'),
	(113, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 9, 15, 'default|9|15'),
	(114, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 29, 'default|9|29'),
	(115, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 5, '9|5'),
	(116, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 6, '9|6'),
	(117, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7, '9|7'),
	(118, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8, 'default|9|8'),
	(119, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 26, '9|26'),
	(120, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 9, 22, '9|22'),
	(121, 'en', NULL, '<p>Kiệt tác pin sạc dự phòng vỏ trong suốt đậm chất Cyberpunk, màn hình màu IPS hiển thị chi tiết điện áp, dòng điện, nhiệt độ và công suất theo thời gian thực.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 10, 9, 'en|10|9'),
	(122, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Kiệt tác pin sạc dự phòng vỏ trong suốt đậm chất Cyberpunk, màn hình màu IPS hiển thị chi tiết điện áp, dòng điện, nhiệt độ và công suất theo thời gian thực.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Dung lượng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">25.600 mAh / 93.5Wh (Chuẩn quy định hàng không mang lên máy bay)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất Type-C</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">100W Max PD In/Out (Sạc đầy lại pin chỉ 90 phút)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng điều chỉnh DC</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">3.3V - 25.2V tùy chỉnh công suất lên tới 75W</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">IPS 1.14 inch hiển thị thông số điện năng thời gian thực</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cell pin</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">8 lõi pin 18650 chuẩn xe điện Tesla cao cấp</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 'en|10|10'),
	(123, NULL, NULL, 'PB-SHARGEEK-STORM2-100W', NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, '10|1'),
	(124, 'en', NULL, 'Pin Dự Phòng Shargeek Storm 2 25600mAh 100W Trong Suốt IPS Screen', NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 'en|10|2'),
	(125, 'en', NULL, 'pin-du-phong-shargeek-storm-2-25600mah-100w-trong-suot-ips-screen-mdiv', NULL, NULL, NULL, NULL, NULL, NULL, 10, 3, 'en|10|3'),
	(126, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 28, 'default|10|28'),
	(127, NULL, NULL, NULL, NULL, NULL, 219.0000, NULL, NULL, NULL, 10, 11, '10|11'),
	(128, NULL, NULL, NULL, NULL, NULL, 164.2500, NULL, NULL, NULL, 10, 12, '10|12'),
	(129, NULL, NULL, NULL, NULL, NULL, 189.0000, NULL, NULL, NULL, 10, 13, '10|13'),
	(130, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 10, 14, 'default|10|14'),
	(131, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 10, 15, 'default|10|15'),
	(132, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 29, 'default|10|29'),
	(133, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 5, '10|5'),
	(134, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 6, '10|6'),
	(135, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 7, '10|7'),
	(136, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 8, 'default|10|8'),
	(137, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 26, '10|26'),
	(138, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 10, 22, '10|22'),
	(139, 'en', NULL, '<p>Thiết kế dạng trụ đứng hiện đại với 2 cổng USB-C 100W cho phép sạc đồng thời 2 chiếc laptop MacBook Pro ở tốc độ 100W mỗi máy.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9, 'en|11|9'),
	(140, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Thiết kế dạng trụ đứng hiện đại với 2 cổng USB-C 100W cho phép sạc đồng thời 2 chiếc laptop MacBook Pro ở tốc độ 100W mỗi máy.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Dung lượng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">20.000 mAh</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất ra cực đại</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">200W (100W + 100W cổng kép)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng kết nối</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">2x USB-C (100W), 1x USB-A (65W)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Màn hình Smart Display màu hiển thị tình trạng pin &amp; công suất</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10, 'en|11|10'),
	(141, NULL, NULL, 'PB-ANKER-PRIME-20000', NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, '11|1'),
	(142, 'en', NULL, 'Pin Dự Phòng Anker Prime 20000mAh 200W Output Đa Năng', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2, 'en|11|2'),
	(143, 'en', NULL, 'pin-du-phong-anker-prime-20000mah-200w-output-da-nang-m6up', NULL, NULL, NULL, NULL, NULL, NULL, 11, 3, 'en|11|3'),
	(144, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 28, 'default|11|28'),
	(145, NULL, NULL, NULL, NULL, NULL, 129.9900, NULL, NULL, NULL, 11, 11, '11|11'),
	(146, NULL, NULL, NULL, NULL, NULL, 97.4900, NULL, NULL, NULL, 11, 12, '11|12'),
	(147, NULL, NULL, NULL, NULL, NULL, 109.9900, NULL, NULL, NULL, 11, 13, '11|13'),
	(148, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 11, 14, 'default|11|14'),
	(149, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 11, 15, 'default|11|15'),
	(150, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 29, 'default|11|29'),
	(151, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 5, '11|5'),
	(152, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 6, '11|6'),
	(153, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 7, '11|7'),
	(154, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 8, 'default|11|8'),
	(155, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 26, '11|26'),
	(156, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 11, 22, '11|22'),
	(157, 'en', NULL, '<p>Tai nghe True Wireless có khả năng chống ồn chủ động tốt nhất thị trường hiện nay, màng loa Dynamic Driver X thế hệ mới tái tạo dải âm trầm sâu lắng và chi tiết sắc nét.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 12, 9, 'en|12|9'),
	(158, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Tai nghe True Wireless có khả năng chống ồn chủ động tốt nhất thị trường hiện nay, màng loa Dynamic Driver X thế hệ mới tái tạo dải âm trầm sâu lắng và chi tiết sắc nét.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chống ồn</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Bộ xử lý tích hợp V2 và bộ xử lý khử tiếng ồn HD QN2e kép</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chuẩn âm thanh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Hi-Res Audio Wireless, LDAC, DSEE Extreme AI</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Thời lượng pin</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">8 giờ (bật chống ồn) + 16 giờ từ hộp sạc (tổng 24 giờ)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Micro đàm thoại</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Cảm biến dẫn truyền xương và thuật toán AI lọc gió cực nét</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Kháng nước</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Chuẩn IPX4 chống mồ hôi và mưa nhẹ</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 12, 10, 'en|12|10'),
	(159, NULL, NULL, 'EAR-SONY-WF1000XM5', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, '12|1'),
	(160, 'en', NULL, 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC', NULL, NULL, NULL, NULL, NULL, NULL, 12, 2, 'en|12|2'),
	(161, 'en', NULL, 'tai-nghe-sony-wf-1000xm5-chong-on-dau-bang-hi-res-ldac-fyam', NULL, NULL, NULL, NULL, NULL, NULL, 12, 3, 'en|12|3'),
	(162, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12, 28, 'default|12|28'),
	(163, NULL, NULL, NULL, NULL, NULL, 299.9900, NULL, NULL, NULL, 12, 11, '12|11'),
	(164, NULL, NULL, NULL, NULL, NULL, 224.9900, NULL, NULL, NULL, 12, 12, '12|12'),
	(165, NULL, NULL, NULL, NULL, NULL, 249.9900, NULL, NULL, NULL, 12, 13, '12|13'),
	(166, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 12, 14, 'default|12|14'),
	(167, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 12, 15, 'default|12|15'),
	(168, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12, 29, 'default|12|29'),
	(169, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 5, '12|5'),
	(170, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 6, '12|6'),
	(171, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 7, '12|7'),
	(172, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 8, 'default|12|8'),
	(173, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 26, '12|26'),
	(174, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 12, 22, '12|22'),
	(175, 'en', NULL, '<p>Vũ khí âm thanh tối thượng cho game thủ với kết nối sóng kép 2.4GHz siêu tốc qua Dongle Type-C loại bỏ hoàn toàn hiện tượng trễ tiếng khi chơi game FPS/MOBA.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9, 'en|13|9'),
	(176, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Vũ khí âm thanh tối thượng cho game thủ với kết nối sóng kép 2.4GHz siêu tốc qua Dongle Type-C loại bỏ hoàn toàn hiện tượng trễ tiếng khi chơi game FPS/MOBA.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Kết nối kép</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Không dây 2.4GHz ROG SpeedNova (qua USB-C Dongle) &amp; Bluetooth 5.3</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Âm thanh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Âm thanh không gian 24-bit 96kHz độ phân giải cao</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chống ồn</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Adaptive Hybrid ANC thích ứng môi trường</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Micro</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Micro AI Bone-Conduction thu âm giọng nói siêu rõ</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Thời lượng pin</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Lên tới 46 giờ sử dụng liên tục (chế độ Bluetooth)</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10, 'en|13|10'),
	(177, NULL, NULL, 'EAR-ROG-CETRA-SPEEDNOVA', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, '13|1'),
	(178, 'en', NULL, 'Tai Nghe Gaming ROG Cetra True Wireless SpeedNova 2.4GHz', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, 'en|13|2'),
	(179, 'en', NULL, 'tai-nghe-gaming-rog-cetra-true-wireless-speednova-24ghz-vjr4', NULL, NULL, NULL, NULL, NULL, NULL, 13, 3, 'en|13|3'),
	(180, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13, 28, 'default|13|28'),
	(181, NULL, NULL, NULL, NULL, NULL, 199.9900, NULL, NULL, NULL, 13, 11, '13|11'),
	(182, NULL, NULL, NULL, NULL, NULL, 149.9900, NULL, NULL, NULL, 13, 12, '13|12'),
	(183, NULL, NULL, NULL, NULL, NULL, 179.9900, NULL, NULL, NULL, 13, 13, '13|13'),
	(184, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 13, 14, 'default|13|14'),
	(185, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 13, 15, 'default|13|15'),
	(186, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13, 29, 'default|13|29'),
	(187, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 5, '13|5'),
	(188, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 6, '13|6'),
	(189, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 7, '13|7'),
	(190, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 8, 'default|13|8'),
	(191, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 26, '13|26'),
	(192, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 13, 22, '13|22'),
	(193, 'en', NULL, '<p>Sò lạnh tản nhiệt điện thoại mạnh nhất thế giới với công suất đóng băng 36W, nam châm từ tính MagSafe hít chặt lưng máy làm mát tức thì trong 3 giây.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 9, 'en|14|9'),
	(194, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Sò lạnh tản nhiệt điện thoại mạnh nhất thế giới với công suất đóng băng 36W, nam châm từ tính MagSafe hít chặt lưng máy làm mát tức thì trong 3 giây.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">36W Max (Yêu cầu củ sạc nhanh từ 9V/3A trở lên)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Khả năng làm lạnh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Hạ nhiệt độ bề mặt xuống dưới -12°C, chống tụt FPS khi chơi Genshin Impact / Warzone</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Lắp đặt</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Từ tính MagSafe trực tiếp cho iPhone hoặc kẹp rời đi kèm cho Android</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Điều khiển</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Kết nối Bluetooth qua App chỉnh tốc độ quạt và dải LED RGB 16.8 triệu màu</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 10, 'en|14|10'),
	(195, NULL, NULL, 'COOL-REDMAGIC-5PRO', NULL, NULL, NULL, NULL, NULL, NULL, 14, 1, '14|1'),
	(196, 'en', NULL, 'Sò Lạnh Tản Nhiệt Từ Tính RedMagic Magnetic Cooler 5 Pro 36W', NULL, NULL, NULL, NULL, NULL, NULL, 14, 2, 'en|14|2'),
	(197, 'en', NULL, 'so-lanh-tan-nhiet-tu-tinh-redmagic-magnetic-cooler-5-pro-36w-clgk', NULL, NULL, NULL, NULL, NULL, NULL, 14, 3, 'en|14|3'),
	(198, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 28, 'default|14|28'),
	(199, NULL, NULL, NULL, NULL, NULL, 59.9900, NULL, NULL, NULL, 14, 11, '14|11'),
	(200, NULL, NULL, NULL, NULL, NULL, 44.9900, NULL, NULL, NULL, 14, 12, '14|12'),
	(201, NULL, NULL, NULL, NULL, NULL, 49.9900, NULL, NULL, NULL, 14, 13, '14|13'),
	(202, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 14, 14, 'default|14|14'),
	(203, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 14, 15, 'default|14|15'),
	(204, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 29, 'default|14|29'),
	(205, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 5, '14|5'),
	(206, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 6, '14|6'),
	(207, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 7, '14|7'),
	(208, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 8, 'default|14|8'),
	(209, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 26, '14|26'),
	(210, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 14, 22, '14|22'),
	(211, 'en', NULL, '<p>Tản nhiệt bán dẫn TEC diện tích lớn của Black Shark, tích hợp màn hình LED đo nhiệt độ thời gian thực hiển thị độ lạnh ngay trên thân máy.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 9, 'en|15|9'),
	(212, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Tản nhiệt bán dẫn TEC diện tích lớn của Black Shark, tích hợp màn hình LED đo nhiệt độ thời gian thực hiển thị độ lạnh ngay trên thân máy.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">27W TEC Cooling Engine</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Độ ồn</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Siêu êm ái dưới 35dB không ảnh hưởng đàm thoại mic trong game</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">LED hiển thị nhiệt độ làm mát thực tế</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cơ chế kẹp</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Ngàm kẹp đệm silicon co giãn tương thích mọi dòng điện thoại 67mm - 88mm</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 10, 'en|15|10'),
	(213, NULL, NULL, 'COOL-BLACKSHARK-4PRO', NULL, NULL, NULL, NULL, NULL, NULL, 15, 1, '15|1'),
	(214, 'en', NULL, 'Quạt Sò Lạnh Black Shark FunCooler 4 Pro 27W Lạnh Đóng Băng', NULL, NULL, NULL, NULL, NULL, NULL, 15, 2, 'en|15|2'),
	(215, 'en', NULL, 'quat-so-lanh-black-shark-funcooler-4-pro-27w-lanh-dong-bang-mfvo', NULL, NULL, NULL, NULL, NULL, NULL, 15, 3, 'en|15|3'),
	(216, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15, 28, 'default|15|28'),
	(217, NULL, NULL, NULL, NULL, NULL, 45.0000, NULL, NULL, NULL, 15, 11, '15|11'),
	(218, NULL, NULL, NULL, NULL, NULL, 33.7500, NULL, NULL, NULL, 15, 12, '15|12'),
	(219, NULL, NULL, NULL, NULL, NULL, 38.0000, NULL, NULL, NULL, 15, 13, '15|13'),
	(220, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 15, 14, 'default|15|14'),
	(221, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 15, 15, 'default|15|15'),
	(222, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15, 29, 'default|15|29'),
	(223, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 5, '15|5'),
	(224, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 6, '15|6'),
	(225, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 7, '15|7'),
	(226, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 8, 'default|15|8'),
	(227, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 26, '15|26'),
	(228, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, '15|22'),
	(229, 'en', NULL, '<p>Sợi cáp đa năng đỉnh cao hỗ trợ truyền hình ảnh 8K UHD, truyền tệp siêu tốc 40Gbps trong nháy mắt và sạc công suất khủng 240W.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 9, 'en|16|9'),
	(230, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Sợi cáp đa năng đỉnh cao hỗ trợ truyền hình ảnh 8K UHD, truyền tệp siêu tốc 40Gbps trong nháy mắt và sạc công suất khủng 240W.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Băng thông</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">40Gbps truyền file 10GB trong 3 giây</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất sạc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">240W (48V/5A) chuẩn USB Power Delivery Extended Power Range (EPR)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Xuất hình ảnh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">1 màn hình 8K@60Hz hoặc 2 màn hình 4K@60Hz</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Độ bền</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Đầu bọc hợp kim nhôm, thân cáp bọc sợi nylon bện chống đứt gãy 20.000 lần uốn</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 10, 'en|16|10'),
	(231, NULL, NULL, 'CAB-UGREEN-TB4-240W', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1, '16|1'),
	(232, 'en', NULL, 'Cáp Sạc & Dữ Liệu Ugreen Thunderbolt 4 Type-C 240W 40Gbps 8K', NULL, NULL, NULL, NULL, NULL, NULL, 16, 2, 'en|16|2'),
	(233, 'en', NULL, 'cap-sac-du-lieu-ugreen-thunderbolt-4-type-c-240w-40gbps-8k-x5rb', NULL, NULL, NULL, NULL, NULL, NULL, 16, 3, 'en|16|3'),
	(234, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 28, 'default|16|28'),
	(235, NULL, NULL, NULL, NULL, NULL, 34.9900, NULL, NULL, NULL, 16, 11, '16|11'),
	(236, NULL, NULL, NULL, NULL, NULL, 26.2400, NULL, NULL, NULL, 16, 12, '16|12'),
	(237, NULL, NULL, NULL, NULL, NULL, 27.9900, NULL, NULL, NULL, 16, 13, '16|13'),
	(238, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 16, 14, 'default|16|14'),
	(239, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 16, 15, 'default|16|15'),
	(240, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 29, 'default|16|29'),
	(241, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 5, '16|5'),
	(242, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 6, '16|6'),
	(243, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 7, '16|7'),
	(244, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 8, 'default|16|8'),
	(245, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 26, '16|26'),
	(246, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 16, 22, '16|22'),
	(247, 'en', NULL, '<p>Ốp lưng giáp bảo vệ huyền thoại kết hợp 5 lớp vật liệu cao cấp gồm sợi DuPont Kevlar chính hãng, nam châm MagSafe siêu mạnh và viền đệm chống sốc tổ ong.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 9, 'en|17|9'),
	(248, 'en', NULL, '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Ốp lưng giáp bảo vệ huyền thoại kết hợp 5 lớp vật liệu cao cấp gồm sợi DuPont Kevlar chính hãng, nam châm MagSafe siêu mạnh và viền đệm chống sốc tổ ong.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chống sốc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Thử nghiệm rơi thả từ độ cao 7.6 mét (Chuẩn quân đội MIL-STD 810G 516.6)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chất liệu</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Vật liệu sợi Kevlar gia cường, khung kim loại và cao su TPU chống trượt</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">MagSafe</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Tích hợp vòng nam châm Neodymium N52 lực hút cực mạnh</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bảo vệ camera</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Viền bezel nhô cao bảo vệ trọn vẹn cụm ống kính camera đắt giá</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 10, 'en|17|10'),
	(249, NULL, NULL, 'CASE-UAG-MONARCH-PRO', NULL, NULL, NULL, NULL, NULL, NULL, 17, 1, '17|1'),
	(250, 'en', NULL, 'Ốp Lưng UAG Monarch Pro Kevlar MagSafe Chống Va Đập Quân Đội', NULL, NULL, NULL, NULL, NULL, NULL, 17, 2, 'en|17|2'),
	(251, 'en', NULL, 'op-lung-uag-monarch-pro-kevlar-magsafe-chong-va-dap-quan-doi-svwr', NULL, NULL, NULL, NULL, NULL, NULL, 17, 3, 'en|17|3'),
	(252, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17, 28, 'default|17|28'),
	(253, NULL, NULL, NULL, NULL, NULL, 79.9500, NULL, NULL, NULL, 17, 11, '17|11'),
	(254, NULL, NULL, NULL, NULL, NULL, 59.9600, NULL, NULL, NULL, 17, 12, '17|12'),
	(255, NULL, NULL, NULL, NULL, NULL, 69.9500, NULL, NULL, NULL, 17, 13, '17|13'),
	(256, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 17, 14, 'default|17|14'),
	(257, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 17, 15, 'default|17|15'),
	(258, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17, 29, 'default|17|29'),
	(259, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 5, '17|5'),
	(260, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 6, '17|6'),
	(261, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 7, '17|7'),
	(262, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 8, 'default|17|8'),
	(263, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 26, '17|26'),
	(264, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 17, 22, '17|22'),
	(265, 'en', NULL, '<p>Kính cường lực mỏng nhẹ chỉ 0.29mm gia cường bằng công nghệ trao đổi ion kép từ Đức, cứng hơn gấp 2.7 lần so với kính cường lực thông thường.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 9, 'en|18|9'),
	(266, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Kính cường lực mỏng nhẹ chỉ 0.29mm gia cường bằng công nghệ trao đổi ion kép từ Đức, cứng hơn gấp 2.7 lần so với kính cường lực thông thường.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Thông Số Kỹ Thuật Chi Tiết</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid rgb(229,231,235);margin-bottom:24px;height:89.6px;">\r\n<tbody>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Độ cứng</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">9H+ Ion-Exchange Glass gia cường 2 lần</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Bảo mật</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Lớp lọc góc nhìn 2 chiều 28 độ chống nhìn trộm nơi công cộng</td>\r\n</tr>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Cảm ứng</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Độ mỏng 0.29mm giữ trọn 100% độ nhạy cảm ứng và Face ID mượt mà</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Kèm khay Easy Align</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Tự căn chỉnh dán không bọt khí chuẩn xác 100% tại nhà</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 10, 'en|18|10'),
	(267, NULL, NULL, 'GLASS-BELKIN-SAPPHIRE', NULL, NULL, NULL, NULL, NULL, NULL, 18, 1, '18|1'),
	(268, 'en', NULL, 'Kính Cường Lực Belkin UltraGlass 2 Chống Nhìn Trộm Siêu Cứng 9H+', NULL, NULL, NULL, NULL, NULL, NULL, 18, 2, 'en|18|2'),
	(269, 'en', NULL, 'kinh-cuong-luc-belkin-ultraglass-2-chong-nhin-trom-sieu-cung-9h-3lsr', NULL, NULL, NULL, NULL, NULL, NULL, 18, 3, 'en|18|3'),
	(270, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 28, 'default|18|28'),
	(271, NULL, NULL, NULL, NULL, NULL, 39.9900, NULL, NULL, NULL, 18, 11, '18|11'),
	(272, NULL, NULL, NULL, NULL, NULL, 29.9900, NULL, NULL, NULL, 18, 12, '18|12'),
	(273, NULL, NULL, NULL, NULL, NULL, 32.9900, NULL, NULL, NULL, 18, 13, '18|13'),
	(274, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 18, 14, 'default|18|14'),
	(275, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 18, 15, 'default|18|15'),
	(276, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 29, 'default|18|29'),
	(277, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 5, '18|5'),
	(278, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 6, '18|6'),
	(279, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 7, '18|7'),
	(280, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 8, 'default|18|8'),
	(281, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 26, '18|26'),
	(282, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 18, 22, '18|22'),
	(283, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 4, 'default|18|4'),
	(284, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 23, '18|23'),
	(285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 24, '18|24'),
	(286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 25, '18|25'),
	(287, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 27, '18|27'),
	(288, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 16, 'en|18|16'),
	(289, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 17, 'en|18|17'),
	(290, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 18, 'en|18|18'),
	(291, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 30, 'default|18|30'),
	(292, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 19, '18|19'),
	(293, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 20, '18|20'),
	(294, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 21, '18|21');

-- Dumping structure for table bagisto_db.product_bundle_options
DROP TABLE IF EXISTS `product_bundle_options`;
CREATE TABLE IF NOT EXISTS `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_bundle_options: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_bundle_option_products
DROP TABLE IF EXISTS `product_bundle_option_products`;
CREATE TABLE IF NOT EXISTS `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `pbop_option_id_idx` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_bundle_option_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_bundle_option_translations
DROP TABLE IF EXISTS `product_bundle_option_translations`;
CREATE TABLE IF NOT EXISTS `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_bundle_option_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_categories
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_categories: ~15 rows (approximately)
INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
	(3, 1),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 4),
	(11, 4),
	(12, 5),
	(13, 5),
	(14, 6),
	(15, 6),
	(16, 7),
	(17, 8),
	(18, 8);

-- Dumping structure for table bagisto_db.product_channels
DROP TABLE IF EXISTS `product_channels`;
CREATE TABLE IF NOT EXISTS `product_channels` (
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  KEY `pc_product_id_channel_id_idx` (`product_id`,`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_channels: ~18 rows (approximately)
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1);

-- Dumping structure for table bagisto_db.product_cross_sells
DROP TABLE IF EXISTS `product_cross_sells`;
CREATE TABLE IF NOT EXISTS `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_cross_sells: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customer_group_prices
DROP TABLE IF EXISTS `product_customer_group_prices`;
CREATE TABLE IF NOT EXISTS `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customer_group_prices: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customizable_options
DROP TABLE IF EXISTS `product_customizable_options`;
CREATE TABLE IF NOT EXISTS `product_customizable_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `max_characters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `supported_file_extensions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_customizable_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_customizable_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customizable_options: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customizable_option_prices
DROP TABLE IF EXISTS `product_customizable_option_prices`;
CREATE TABLE IF NOT EXISTS `product_customizable_option_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_customizable_option_id` int unsigned NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pcop_product_customizable_option_id_foreign` (`product_customizable_option_id`),
  CONSTRAINT `pcop_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customizable_option_prices: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customizable_option_translations
DROP TABLE IF EXISTS `product_customizable_option_translations`;
CREATE TABLE IF NOT EXISTS `product_customizable_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_customizable_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customizable_option_id_locale_unique` (`product_customizable_option_id`,`locale`),
  CONSTRAINT `pcot_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customizable_option_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_links
DROP TABLE IF EXISTS `product_downloadable_links`;
CREATE TABLE IF NOT EXISTS `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_links: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_link_translations
DROP TABLE IF EXISTS `product_downloadable_link_translations`;
CREATE TABLE IF NOT EXISTS `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_link_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_samples
DROP TABLE IF EXISTS `product_downloadable_samples`;
CREATE TABLE IF NOT EXISTS `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_samples: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_sample_translations
DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
CREATE TABLE IF NOT EXISTS `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_sample_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_flat
DROP TABLE IF EXISTS `product_flat`;
CREATE TABLE IF NOT EXISTS `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `images_count` int DEFAULT '0',
  `manage_stock` tinyint(1) DEFAULT NULL,
  `base_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attribute_family_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_flat: ~18 rows (approximately)
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `quantity`, `images_count`, `manage_stock`, `base_image`, `category_name`, `attribute_family_name`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES
	(1, 'PHONE-ROG8PRO-512', 'simple', NULL, 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', '<p>Quái vật Gaming Phone hàng đầu với màn hình AMOLED 165Hz siêu mượt, hệ thống phím cảm ứng siêu âm AirTrigger và tản nhiệt buồng hơi 3D GameCool 8.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Quái vật Gaming Phone hàng đầu với màn hình AMOLED 165Hz siêu mượt, hệ thống phím cảm ứng siêu âm AirTrigger và tản nhiệt buồng hơi 3D GameCool 8.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">6.78 inch Samsung E6 Flexible AMOLED 165Hz LTPO 2500 nits</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Vi xử lý</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Snapdragon 8 Gen 3 xung nhịp 3.3GHz</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bộ nhớ &amp; RAM</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">16GB LPDDR5X RAM, 512GB UFS 4.0</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Đèn LED</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Màn hình phụ AniMe Vision 341 đèn mini-LED tùy biến</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Pin &amp; Sạc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">5.500 mAh, Sạc siêu tốc HyperCharge 65W, Sạc không dây Qi 15W</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Tính năng Gaming</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">AirTrigger 8, Cổng USB-C kép (cạnh bên &amp; đáy), Kháng nước IP68</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'asus-rog-phone-8-pro-16gb512gb-gaming-snapdragon-8-gen-3-nom6', 1, 1, 1, NULL, NULL, NULL, 1099.0000, 999.0000, '2025-01-01', '2027-12-31', 0.3500, 71, 1, 0, 'product/5/main.png', 'Flagship Smartphones', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 5, '2026-09-28 09:24:34', NULL, 1),
	(2, 'PHONE-XM14U-512', 'simple', NULL, 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', '<p>Đỉnh cao nhiếp ảnh di động phối hợp cùng huyền thoại Leica với cụm 4 camera 50MP cảm biến 1-inch khẩu độ vô cấp mượt mà.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Đỉnh cao nhiếp ảnh di động phối hợp cùng huyền thoại Leica với cụm 4 camera 50MP cảm biến 1-inch khẩu độ vô cấp mượt mà.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">6.73 inch LTPO AMOLED WQHD+ 120Hz 3000 nits Dolby Vision</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Vi xử lý</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Qualcomm Snapdragon 8 Gen 3</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bộ nhớ &amp; RAM</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">16GB LPDDR5X RAM, 512GB UFS 4.0</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Camera Leica</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">50MP LYT-900 1-inch OIS khẩu độ thay đổi f/1.63 - f/4.0</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Pin &amp; Sạc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">5.000 mAh, Sạc nhanh có dây 90W HyperCharge, Sạc không dây 80W</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'xiaomi-14-ultra-16gb512gb-leica-quad-camera-1-inch-sensor-7anx', 1, 1, 1, NULL, NULL, NULL, 1149.0000, 1049.0000, '2025-01-01', '2027-12-31', 0.3500, 50, 1, 0, 'product/6/main.png', 'Flagship Smartphones', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 6, '2026-09-28 09:24:34', NULL, 1),
	(3, 'CHG-ANKER-737-140W', 'simple', NULL, 'Củ Sạc GaN Anker 737 GaNPrime 140W 3 Cổng (A2341)', '<p>Củ sạc công nghệ GaN tiên tiến nhất của Anker với công suất cực đại 140W chuẩn PD 3.1, đủ sức sạc nhanh tối đa cho cả MacBook Pro 16 inch và 2 iPhone cùng lúc.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Củ sạc công nghệ GaN tiên tiến nhất của Anker với công suất cực đại 140W chuẩn PD 3.1, đủ sức sạc nhanh tối đa cho cả MacBook Pro 16 inch và 2 iPhone cùng lúc.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Tổng công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">140W Max (Hỗ trợ chuẩn USB Power Delivery 3.1)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng kết nối</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">2 x USB-C (140W max per port), 1 x USB-A (22.5W)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công nghệ</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">GaNPrime, ActiveShield 2.0 kiểm soát nhiệt 3 triệu lần/ngày</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Tương thích</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">MacBook Pro, Dell XPS, iPhone 16/15, Samsung 45W Super Fast Charging 2.0</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Kích thước</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Nhỏ hơn 39% so với củ sạc Apple 140W tiêu chuẩn</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'cu-sac-gan-anker-737-ganprime-140w-3-cong-a2341-gquz', 1, 1, 1, NULL, NULL, NULL, 99.9900, 84.9900, '2025-01-01', '2027-12-31', 0.3500, 70, 1, 0, 'product/7/main.png', 'Fast Chargers & GaN', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 7, '2026-09-28 09:24:34', NULL, 1),
	(4, 'CHG-BASEUS-BLADE-100W', 'simple', NULL, 'Củ Sạc Siêu Mỏng Baseus Blade HD GaN 100W PD 3.0 & QC 4.0', '<p>Thiết kế dẹp siêu mỏng chỉ 18mm dễ dàng đút vừa balo túi xách, công suất mạnh mẽ 100W chia nguồn thông minh cho 4 cổng.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Thiết kế dẹp siêu mỏng chỉ 18mm dễ dàng đút vừa balo túi xách, công suất mạnh mẽ 100W chia nguồn thông minh cho 4 cổng.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">100W Max</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng ra</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">2x Type-C (100W), 2x USB-A (30W)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Độ mỏng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Chỉ 1.8cm thiết kế dạng thẻ Card siêu gọn</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bảo vệ</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Tự ngắt khi đầy, chống quá áp, quá dòng, quá nhiệt chuẩn quốc tế</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'cu-sac-sieu-mong-baseus-blade-hd-gan-100w-pd-30-qc-40-a1gh', 1, 1, 1, NULL, NULL, NULL, 69.9900, 54.9900, '2025-01-01', '2027-12-31', 0.3500, 56, 1, 0, 'product/8/main.png', 'Fast Chargers & GaN', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 8, '2026-09-28 09:24:34', NULL, 1),
	(5, 'CHG-UGREEN-NEXODE-300W', 'simple', NULL, 'Trạm Sạc Để Bàn Ugreen Nexode GaN 300W 5 Cổng Sạc 3 Laptop', '<p>Trạm sạc để bàn uy lực nhất hành tinh, có thể sạc cùng lúc 3 chiếc Laptop công suất cao và 2 điện thoại di động ở tốc độ tối đa.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Trạm sạc để bàn uy lực nhất hành tinh, có thể sạc cùng lúc 3 chiếc Laptop công suất cao và 2 điện thoại di động ở tốc độ tối đa.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất tổng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">300W Max</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng chính Type-C1</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">140W Max độc lập chuẩn PD 3.1</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chip GaN</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">GaNFast thế hệ III tối ưu hiệu suất 95%</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chân cắm</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Dây nguồn nối dài 2m cắm ổ điện bàn làm việc</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'tram-sac-de-ban-ugreen-nexode-gan-300w-5-cong-sac-3-laptop-oox7', 1, 1, 1, NULL, NULL, NULL, 199.9900, 169.9900, '2025-01-01', '2027-12-31', 0.3500, 88, 1, 0, 'product/9/main.png', 'Fast Chargers & GaN', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 9, '2026-09-28 09:24:34', NULL, 1),
	(6, 'PB-SHARGEEK-STORM2-100W', 'simple', NULL, 'Pin Dự Phòng Shargeek Storm 2 25600mAh 100W Trong Suốt IPS Screen', '<p>Kiệt tác pin sạc dự phòng vỏ trong suốt đậm chất Cyberpunk, màn hình màu IPS hiển thị chi tiết điện áp, dòng điện, nhiệt độ và công suất theo thời gian thực.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Kiệt tác pin sạc dự phòng vỏ trong suốt đậm chất Cyberpunk, màn hình màu IPS hiển thị chi tiết điện áp, dòng điện, nhiệt độ và công suất theo thời gian thực.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Dung lượng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">25.600 mAh / 93.5Wh (Chuẩn quy định hàng không mang lên máy bay)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất Type-C</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">100W Max PD In/Out (Sạc đầy lại pin chỉ 90 phút)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng điều chỉnh DC</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">3.3V - 25.2V tùy chỉnh công suất lên tới 75W</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">IPS 1.14 inch hiển thị thông số điện năng thời gian thực</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cell pin</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">8 lõi pin 18650 chuẩn xe điện Tesla cao cấp</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'pin-du-phong-shargeek-storm-2-25600mah-100w-trong-suot-ips-screen-mdiv', 1, 1, 1, NULL, NULL, NULL, 219.0000, 189.0000, '2025-01-01', '2027-12-31', 0.3500, 41, 1, 0, 'product/10/main.png', 'Power Banks', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 10, '2026-09-28 09:24:34', NULL, 1),
	(7, 'PB-ANKER-PRIME-20000', 'simple', NULL, 'Pin Dự Phòng Anker Prime 20000mAh 200W Output Đa Năng', '<p>Thiết kế dạng trụ đứng hiện đại với 2 cổng USB-C 100W cho phép sạc đồng thời 2 chiếc laptop MacBook Pro ở tốc độ 100W mỗi máy.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Thiết kế dạng trụ đứng hiện đại với 2 cổng USB-C 100W cho phép sạc đồng thời 2 chiếc laptop MacBook Pro ở tốc độ 100W mỗi máy.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Dung lượng</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">20.000 mAh</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất ra cực đại</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">200W (100W + 100W cổng kép)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cổng kết nối</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">2x USB-C (100W), 1x USB-A (65W)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Màn hình Smart Display màu hiển thị tình trạng pin &amp; công suất</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'pin-du-phong-anker-prime-20000mah-200w-output-da-nang-m6up', 1, 1, 1, NULL, NULL, NULL, 129.9900, 109.9900, '2025-01-01', '2027-12-31', 0.3500, 58, 1, 0, 'product/11/main.png', 'Power Banks', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 11, '2026-09-28 09:24:34', NULL, 1),
	(8, 'EAR-SONY-WF1000XM5', 'simple', NULL, 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC', '<p>Tai nghe True Wireless có khả năng chống ồn chủ động tốt nhất thị trường hiện nay, màng loa Dynamic Driver X thế hệ mới tái tạo dải âm trầm sâu lắng và chi tiết sắc nét.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Tai nghe True Wireless có khả năng chống ồn chủ động tốt nhất thị trường hiện nay, màng loa Dynamic Driver X thế hệ mới tái tạo dải âm trầm sâu lắng và chi tiết sắc nét.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chống ồn</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Bộ xử lý tích hợp V2 và bộ xử lý khử tiếng ồn HD QN2e kép</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chuẩn âm thanh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Hi-Res Audio Wireless, LDAC, DSEE Extreme AI</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Thời lượng pin</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">8 giờ (bật chống ồn) + 16 giờ từ hộp sạc (tổng 24 giờ)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Micro đàm thoại</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Cảm biến dẫn truyền xương và thuật toán AI lọc gió cực nét</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Kháng nước</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Chuẩn IPX4 chống mồ hôi và mưa nhẹ</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'tai-nghe-sony-wf-1000xm5-chong-on-dau-bang-hi-res-ldac-fyam', 1, 1, 1, NULL, NULL, NULL, 299.9900, 249.9900, '2025-01-01', '2027-12-31', 0.3500, 107, 1, 0, 'product/12/main.png', 'Audio & Gaming Earbuds', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 12, '2026-09-28 09:24:34', NULL, 1),
	(9, 'EAR-ROG-CETRA-SPEEDNOVA', 'simple', NULL, 'Tai Nghe Gaming ROG Cetra True Wireless SpeedNova 2.4GHz', '<p>Vũ khí âm thanh tối thượng cho game thủ với kết nối sóng kép 2.4GHz siêu tốc qua Dongle Type-C loại bỏ hoàn toàn hiện tượng trễ tiếng khi chơi game FPS/MOBA.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Vũ khí âm thanh tối thượng cho game thủ với kết nối sóng kép 2.4GHz siêu tốc qua Dongle Type-C loại bỏ hoàn toàn hiện tượng trễ tiếng khi chơi game FPS/MOBA.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Kết nối kép</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Không dây 2.4GHz ROG SpeedNova (qua USB-C Dongle) &amp; Bluetooth 5.3</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Âm thanh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Âm thanh không gian 24-bit 96kHz độ phân giải cao</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chống ồn</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Adaptive Hybrid ANC thích ứng môi trường</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Micro</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Micro AI Bone-Conduction thu âm giọng nói siêu rõ</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Thời lượng pin</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Lên tới 46 giờ sử dụng liên tục (chế độ Bluetooth)</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'tai-nghe-gaming-rog-cetra-true-wireless-speednova-24ghz-vjr4', 1, 1, 1, NULL, NULL, NULL, 199.9900, 179.9900, '2025-01-01', '2027-12-31', 0.3500, 89, 1, 0, 'product/13/main.png', 'Audio & Gaming Earbuds', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 13, '2026-09-28 09:24:34', NULL, 1),
	(10, 'COOL-REDMAGIC-5PRO', 'simple', NULL, 'Sò Lạnh Tản Nhiệt Từ Tính RedMagic Magnetic Cooler 5 Pro 36W', '<p>Sò lạnh tản nhiệt điện thoại mạnh nhất thế giới với công suất đóng băng 36W, nam châm từ tính MagSafe hít chặt lưng máy làm mát tức thì trong 3 giây.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Sò lạnh tản nhiệt điện thoại mạnh nhất thế giới với công suất đóng băng 36W, nam châm từ tính MagSafe hít chặt lưng máy làm mát tức thì trong 3 giây.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">36W Max (Yêu cầu củ sạc nhanh từ 9V/3A trở lên)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Khả năng làm lạnh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Hạ nhiệt độ bề mặt xuống dưới -12°C, chống tụt FPS khi chơi Genshin Impact / Warzone</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Lắp đặt</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Từ tính MagSafe trực tiếp cho iPhone hoặc kẹp rời đi kèm cho Android</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Điều khiển</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Kết nối Bluetooth qua App chỉnh tốc độ quạt và dải LED RGB 16.8 triệu màu</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'so-lanh-tan-nhiet-tu-tinh-redmagic-magnetic-cooler-5-pro-36w-clgk', 1, 1, 1, NULL, NULL, NULL, 59.9900, 49.9900, '2025-01-01', '2027-12-31', 0.3500, 36, 1, 0, 'product/14/main.png', 'Phone Coolers & Gaming Gear', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 14, '2026-09-28 09:24:34', NULL, 1),
	(11, 'COOL-BLACKSHARK-4PRO', 'simple', NULL, 'Quạt Sò Lạnh Black Shark FunCooler 4 Pro 27W Lạnh Đóng Băng', '<p>Tản nhiệt bán dẫn TEC diện tích lớn của Black Shark, tích hợp màn hình LED đo nhiệt độ thời gian thực hiển thị độ lạnh ngay trên thân máy.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Tản nhiệt bán dẫn TEC diện tích lớn của Black Shark, tích hợp màn hình LED đo nhiệt độ thời gian thực hiển thị độ lạnh ngay trên thân máy.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">27W TEC Cooling Engine</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Độ ồn</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Siêu êm ái dưới 35dB không ảnh hưởng đàm thoại mic trong game</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Màn hình</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">LED hiển thị nhiệt độ làm mát thực tế</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Cơ chế kẹp</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Ngàm kẹp đệm silicon co giãn tương thích mọi dòng điện thoại 67mm - 88mm</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'quat-so-lanh-black-shark-funcooler-4-pro-27w-lanh-dong-bang-mfvo', 1, 1, 1, NULL, NULL, NULL, 45.0000, 38.0000, '2025-01-01', '2027-12-31', 0.3500, 53, 1, 0, 'product/15/main.png', 'Phone Coolers & Gaming Gear', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 15, '2026-09-28 09:24:34', NULL, 1),
	(12, 'CAB-UGREEN-TB4-240W', 'simple', NULL, 'Cáp Sạc & Dữ Liệu Ugreen Thunderbolt 4 Type-C 240W 40Gbps 8K', '<p>Sợi cáp đa năng đỉnh cao hỗ trợ truyền hình ảnh 8K UHD, truyền tệp siêu tốc 40Gbps trong nháy mắt và sạc công suất khủng 240W.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Sợi cáp đa năng đỉnh cao hỗ trợ truyền hình ảnh 8K UHD, truyền tệp siêu tốc 40Gbps trong nháy mắt và sạc công suất khủng 240W.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Băng thông</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">40Gbps truyền file 10GB trong 3 giây</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Công suất sạc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">240W (48V/5A) chuẩn USB Power Delivery Extended Power Range (EPR)</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Xuất hình ảnh</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">1 màn hình 8K@60Hz hoặc 2 màn hình 4K@60Hz</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Độ bền</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Đầu bọc hợp kim nhôm, thân cáp bọc sợi nylon bện chống đứt gãy 20.000 lần uốn</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'cap-sac-du-lieu-ugreen-thunderbolt-4-type-c-240w-40gbps-8k-x5rb', 1, 1, 1, NULL, NULL, NULL, 34.9900, 27.9900, '2025-01-01', '2027-12-31', 0.3500, 46, 1, 0, 'product/16/main.png', 'Thunderbolt Cables & Hubs', 'Default', '2026-09-28 09:21:29', 'en', 'default', 1, 16, '2026-09-28 09:24:34', NULL, 1),
	(13, 'CASE-UAG-MONARCH-PRO', 'simple', NULL, 'Ốp Lưng UAG Monarch Pro Kevlar MagSafe Chống Va Đập Quân Đội', '<p>Ốp lưng giáp bảo vệ huyền thoại kết hợp 5 lớp vật liệu cao cấp gồm sợi DuPont Kevlar chính hãng, nam châm MagSafe siêu mạnh và viền đệm chống sốc tổ ong.</p>', '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;"><p style="font-size: 16px; margin-bottom: 16px;">Ốp lưng giáp bảo vệ huyền thoại kết hợp 5 lớp vật liệu cao cấp gồm sợi DuPont Kevlar chính hãng, nam châm MagSafe siêu mạnh và viền đệm chống sốc tổ ong.</p><h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3><table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;"><tbody><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chống sốc</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Thử nghiệm rơi thả từ độ cao 7.6 mét (Chuẩn quân đội MIL-STD 810G 516.6)</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Chất liệu</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Vật liệu sợi Kevlar gia cường, khung kim loại và cao su TPU chống trượt</td></tr><tr style="background-color: #f9fafb; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">MagSafe</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Tích hợp vòng nam châm Neodymium N52 lực hút cực mạnh</td></tr><tr style="background-color: #ffffff; border-bottom: 1px solid #e5e7eb;"><td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">Bảo vệ camera</td><td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">Viền bezel nhô cao bảo vệ trọn vẹn cụm ống kính camera đắt giá</td></tr></tbody></table><div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;"><p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p></div></div>', 'op-lung-uag-monarch-pro-kevlar-magsafe-chong-va-dap-quan-doi-svwr', 1, 1, 1, NULL, NULL, NULL, 79.9500, 69.9500, '2025-01-01', '2027-12-31', 0.3500, 119, 1, 0, 'product/17/main.png', 'Tough Cases & Screen Protectors', 'Default', '2026-09-28 09:21:29', 'en', 'default', 1, 17, '2026-09-28 09:24:34', NULL, 1),
	(14, 'GLASS-BELKIN-SAPPHIRE', 'simple', '', 'Kính Cường Lực Belkin UltraGlass 2 Chống Nhìn Trộm Siêu Cứng 9H+', '<p>Kính cường lực mỏng nhẹ chỉ 0.29mm gia cường bằng công nghệ trao đổi ion kép từ Đức, cứng hơn gấp 2.7 lần so với kính cường lực thông thường.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Kính cường lực mỏng nhẹ chỉ 0.29mm gia cường bằng công nghệ trao đổi ion kép từ Đức, cứng hơn gấp 2.7 lần so với kính cường lực thông thường.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Thông Số Kỹ Thuật Chi Tiết</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid rgb(229,231,235);margin-bottom:24px;height:89.6px;">\r\n<tbody>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Độ cứng</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">9H+ Ion-Exchange Glass gia cường 2 lần</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Bảo mật</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Lớp lọc góc nhìn 2 chiều 28 độ chống nhìn trộm nơi công cộng</td>\r\n</tr>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Cảm ứng</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Độ mỏng 0.29mm giữ trọn 100% độ nhạy cảm ứng và Face ID mượt mà</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Kèm khay Easy Align</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Tự căn chỉnh dán không bọt khí chuẩn xác 100% tại nhà</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p>\r\n</div>\r\n</div>', 'kinh-cuong-luc-belkin-ultraglass-2-chong-nhin-trom-sieu-cung-9h-3lsr', 1, 1, 1, '', '', '', 39.9900, 32.9900, '2025-01-01', '2027-12-31', 0.3500, 112, 1, 0, 'product/18/main.png', 'Tough Cases & Screen Protectors', 'Default', '2026-09-28 09:21:29', 'en', 'default', 1, 18, '2026-09-29 14:36:34', NULL, 1),
	(15, 'PHONE-IP16PM-256', 'simple', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'product/1/main.png', NULL, 'Default', '2026-09-28 09:22:16', 'en', 'default', 1, 1, '2026-09-28 09:22:16', NULL, 1),
	(16, 'TEST-001', 'simple', NULL, 'Test Product', NULL, NULL, 'test-product-001', 0, 0, 1, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 1.0000, NULL, 0, 0, NULL, NULL, 'Default', '2026-09-28 09:22:16', 'en', 'default', 1, 2, '2026-09-28 09:24:34', NULL, 0),
	(17, 'PHONE-TEST-002', 'simple', NULL, 'iPhone 16 Pro Max Test', '<p>Test short desc</p>', '<p>Test full desc</p>', 'iphone-16-pro-max-test', 1, 1, 1, NULL, NULL, NULL, 1199.0000, 1129.0000, '2025-01-01', '2027-12-31', 0.3500, 50, 0, 0, NULL, 'Root', 'Default', '2026-09-28 09:22:16', 'en', 'default', 1, 3, '2026-09-28 09:24:34', NULL, 1),
	(18, 'PHONE-S24U-512', 'simple', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'product/4/main.png', NULL, 'Default', '2026-09-28 09:22:16', 'en', 'default', 1, 4, '2026-09-28 09:22:16', NULL, 1);

-- Dumping structure for table bagisto_db.product_grouped_products
DROP TABLE IF EXISTS `product_grouped_products`;
CREATE TABLE IF NOT EXISTS `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  KEY `pgp_product_id_idx` (`product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_grouped_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_images
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_img_product_id_idx` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_images: ~16 rows (approximately)
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
	(1, 'images', 'product/5/main.png', 5, 1),
	(2, 'images', 'product/6/main.png', 6, 1),
	(3, 'images', 'product/7/main.png', 7, 1),
	(4, 'images', 'product/8/main.png', 8, 1),
	(5, 'images', 'product/9/main.png', 9, 1),
	(6, 'images', 'product/10/main.png', 10, 1),
	(7, 'images', 'product/11/main.png', 11, 1),
	(8, 'images', 'product/12/main.png', 12, 1),
	(9, 'images', 'product/13/main.png', 13, 1),
	(10, 'images', 'product/14/main.png', 14, 1),
	(11, 'images', 'product/15/main.png', 15, 1),
	(12, 'images', 'product/16/main.png', 16, 1),
	(13, 'images', 'product/17/main.png', 17, 1),
	(14, 'images', 'product/18/main.png', 18, 1),
	(15, 'images', 'product/1/main.png', 1, 1),
	(16, 'images', 'product/4/main.png', 4, 1);

-- Dumping structure for table bagisto_db.product_image_translations
DROP TABLE IF EXISTS `product_image_translations`;
CREATE TABLE IF NOT EXISTS `product_image_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_image_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_translations_image_id_locale_unique` (`product_image_id`,`locale`),
  CONSTRAINT `image_translations_image_id_foreign` FOREIGN KEY (`product_image_id`) REFERENCES `product_images` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_image_translations: ~0 rows (approximately)
INSERT INTO `product_image_translations` (`id`, `product_image_id`, `locale`, `alt_text`) VALUES
	(1, 14, 'en', '');

-- Dumping structure for table bagisto_db.product_inventories
DROP TABLE IF EXISTS `product_inventories`;
CREATE TABLE IF NOT EXISTS `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_inventories: ~15 rows (approximately)
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES
	(1, 50, 3, 0, 1),
	(2, 71, 5, 0, 1),
	(3, 50, 6, 0, 1),
	(4, 70, 7, 0, 1),
	(5, 56, 8, 0, 1),
	(6, 88, 9, 0, 1),
	(7, 41, 10, 0, 1),
	(8, 58, 11, 0, 1),
	(9, 107, 12, 0, 1),
	(10, 89, 13, 0, 1),
	(11, 36, 14, 0, 1),
	(12, 53, 15, 0, 1),
	(13, 46, 16, 0, 1),
	(14, 119, 17, 0, 1),
	(15, 112, 18, 0, 1);

-- Dumping structure for table bagisto_db.product_inventory_indices
DROP TABLE IF EXISTS `product_inventory_indices`;
CREATE TABLE IF NOT EXISTS `product_inventory_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  KEY `prod_inv_product_id_idx` (`product_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_inventory_indices: ~18 rows (approximately)
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 71, 5, 1, NULL, NULL),
	(2, 50, 6, 1, NULL, NULL),
	(3, 70, 7, 1, NULL, NULL),
	(4, 56, 8, 1, NULL, NULL),
	(5, 88, 9, 1, NULL, NULL),
	(6, 41, 10, 1, NULL, NULL),
	(7, 58, 11, 1, NULL, NULL),
	(8, 107, 12, 1, NULL, NULL),
	(9, 89, 13, 1, NULL, NULL),
	(10, 36, 14, 1, NULL, NULL),
	(11, 53, 15, 1, NULL, NULL),
	(12, 46, 16, 1, NULL, NULL),
	(13, 119, 17, 1, NULL, NULL),
	(14, 112, 18, 1, NULL, NULL),
	(15, 0, 1, 1, NULL, NULL),
	(16, 0, 2, 1, NULL, NULL),
	(17, 50, 3, 1, NULL, NULL),
	(18, 0, 4, 1, NULL, NULL);

-- Dumping structure for table bagisto_db.product_ordered_inventories
DROP TABLE IF EXISTS `product_ordered_inventories`;
CREATE TABLE IF NOT EXISTS `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_ordered_inventories: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_price_indices
DROP TABLE IF EXISTS `product_price_indices`;
CREATE TABLE IF NOT EXISTS `product_price_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  KEY `ppi_product_id_customer_group_id_idx` (`product_id`,`customer_group_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_price_indices: ~54 rows (approximately)
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES
	(1, 5, 1, 1, 999.0000, 1099.0000, 999.0000, 1099.0000, NULL, NULL),
	(2, 5, 2, 1, 999.0000, 1099.0000, 999.0000, 1099.0000, NULL, NULL),
	(3, 5, 3, 1, 999.0000, 1099.0000, 999.0000, 1099.0000, NULL, NULL),
	(4, 6, 1, 1, 1049.0000, 1149.0000, 1049.0000, 1149.0000, NULL, NULL),
	(5, 6, 2, 1, 1049.0000, 1149.0000, 1049.0000, 1149.0000, NULL, NULL),
	(6, 6, 3, 1, 1049.0000, 1149.0000, 1049.0000, 1149.0000, NULL, NULL),
	(7, 7, 1, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(8, 7, 2, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(9, 7, 3, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(10, 8, 1, 1, 54.9900, 69.9900, 54.9900, 69.9900, NULL, NULL),
	(11, 8, 2, 1, 54.9900, 69.9900, 54.9900, 69.9900, NULL, NULL),
	(12, 8, 3, 1, 54.9900, 69.9900, 54.9900, 69.9900, NULL, NULL),
	(13, 9, 1, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(14, 9, 2, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(15, 9, 3, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(16, 10, 1, 1, 189.0000, 219.0000, 189.0000, 219.0000, NULL, NULL),
	(17, 10, 2, 1, 189.0000, 219.0000, 189.0000, 219.0000, NULL, NULL),
	(18, 10, 3, 1, 189.0000, 219.0000, 189.0000, 219.0000, NULL, NULL),
	(19, 11, 1, 1, 109.9900, 129.9900, 109.9900, 129.9900, NULL, NULL),
	(20, 11, 2, 1, 109.9900, 129.9900, 109.9900, 129.9900, NULL, NULL),
	(21, 11, 3, 1, 109.9900, 129.9900, 109.9900, 129.9900, NULL, NULL),
	(22, 12, 1, 1, 249.9900, 299.9900, 249.9900, 299.9900, NULL, NULL),
	(23, 12, 2, 1, 249.9900, 299.9900, 249.9900, 299.9900, NULL, NULL),
	(24, 12, 3, 1, 249.9900, 299.9900, 249.9900, 299.9900, NULL, NULL),
	(25, 13, 1, 1, 179.9900, 199.9900, 179.9900, 199.9900, NULL, NULL),
	(26, 13, 2, 1, 179.9900, 199.9900, 179.9900, 199.9900, NULL, NULL),
	(27, 13, 3, 1, 179.9900, 199.9900, 179.9900, 199.9900, NULL, NULL),
	(28, 14, 1, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(29, 14, 2, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(30, 14, 3, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(31, 15, 1, 1, 38.0000, 45.0000, 38.0000, 45.0000, NULL, NULL),
	(32, 15, 2, 1, 38.0000, 45.0000, 38.0000, 45.0000, NULL, NULL),
	(33, 15, 3, 1, 38.0000, 45.0000, 38.0000, 45.0000, NULL, NULL),
	(34, 16, 1, 1, 27.9900, 34.9900, 27.9900, 34.9900, NULL, NULL),
	(35, 16, 2, 1, 27.9900, 34.9900, 27.9900, 34.9900, NULL, NULL),
	(36, 16, 3, 1, 27.9900, 34.9900, 27.9900, 34.9900, NULL, NULL),
	(37, 17, 1, 1, 69.9500, 79.9500, 69.9500, 79.9500, NULL, NULL),
	(38, 17, 2, 1, 69.9500, 79.9500, 69.9500, 79.9500, NULL, NULL),
	(39, 17, 3, 1, 69.9500, 79.9500, 69.9500, 79.9500, NULL, NULL),
	(40, 18, 1, 1, 32.9900, 39.9900, 32.9900, 39.9900, NULL, NULL),
	(41, 18, 2, 1, 32.9900, 39.9900, 32.9900, 39.9900, NULL, NULL),
	(42, 18, 3, 1, 32.9900, 39.9900, 32.9900, 39.9900, NULL, NULL),
	(43, 1, 1, 1, 0.0000, 0.0000, 0.0000, 0.0000, NULL, '2026-09-28 02:24:34'),
	(44, 1, 2, 1, 0.0000, 0.0000, 0.0000, 0.0000, NULL, '2026-09-28 02:24:34'),
	(45, 1, 3, 1, 0.0000, 0.0000, 0.0000, 0.0000, NULL, '2026-09-28 02:24:34'),
	(46, 2, 1, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
	(47, 2, 2, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
	(48, 2, 3, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
	(49, 3, 1, 1, 1129.0000, 1199.0000, 1129.0000, 1199.0000, NULL, NULL),
	(50, 3, 2, 1, 1129.0000, 1199.0000, 1129.0000, 1199.0000, NULL, NULL),
	(51, 3, 3, 1, 1129.0000, 1199.0000, 1129.0000, 1199.0000, NULL, NULL),
	(52, 4, 1, 1, 0.0000, 0.0000, 0.0000, 0.0000, NULL, '2026-09-28 02:24:34'),
	(53, 4, 2, 1, 0.0000, 0.0000, 0.0000, 0.0000, NULL, '2026-09-28 02:24:35'),
	(54, 4, 3, 1, 0.0000, 0.0000, 0.0000, 0.0000, NULL, '2026-09-28 02:24:35');

-- Dumping structure for table bagisto_db.product_relations
DROP TABLE IF EXISTS `product_relations`;
CREATE TABLE IF NOT EXISTS `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_relations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_reviews
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_rev_product_id_idx` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_reviews: ~0 rows (approximately)
INSERT INTO `product_reviews` (`id`, `name`, `title`, `rating`, `comment`, `status`, `product_id`, `customer_id`, `created_at`, `updated_at`) VALUES
	(1, 'Nguyễn Hùng', 'VN just 1 star :)))', 1, '1 sao là vn 5 sao là TQ nên cho 1 sao', 'approved', 6, 1, '2026-09-29 07:58:04', '2026-09-29 07:59:06');

-- Dumping structure for table bagisto_db.product_review_attachments
DROP TABLE IF EXISTS `product_review_attachments`;
CREATE TABLE IF NOT EXISTS `product_review_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_review_attachments: ~0 rows (approximately)
INSERT INTO `product_review_attachments` (`id`, `review_id`, `type`, `mime_type`, `path`) VALUES
	(1, 1, 'image', 'jpeg', 'review/1/Hgofhuuf3tKvNBam1kqZjuS9BZbbI4LcPlG5uPVf.jpg');

-- Dumping structure for table bagisto_db.product_super_attributes
DROP TABLE IF EXISTS `product_super_attributes`;
CREATE TABLE IF NOT EXISTS `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_super_attributes: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_up_sells
DROP TABLE IF EXISTS `product_up_sells`;
CREATE TABLE IF NOT EXISTS `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_up_sells: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_videos
DROP TABLE IF EXISTS `product_videos`;
CREATE TABLE IF NOT EXISTS `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_vid_product_id_idx` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_videos: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.refunds
DROP TABLE IF EXISTS `refunds`;
CREATE TABLE IF NOT EXISTS `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.refunds: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.refund_items
DROP TABLE IF EXISTS `refund_items`;
CREATE TABLE IF NOT EXISTS `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.refund_items: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma
DROP TABLE IF EXISTS `rma`;
CREATE TABLE IF NOT EXISTS `rma` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `rma_status_id` int unsigned DEFAULT NULL,
  `package_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_order_id_foreign` (`order_id`),
  KEY `rma_rma_status_id_foreign` (`rma_status_id`),
  CONSTRAINT `rma_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_rma_status_id_foreign` FOREIGN KEY (`rma_status_id`) REFERENCES `rma_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_additional_fields
DROP TABLE IF EXISTS `rma_additional_fields`;
CREATE TABLE IF NOT EXISTS `rma_additional_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned DEFAULT NULL,
  `rma_custom_field_id` int unsigned DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_additional_fields_rma_id_foreign` (`rma_id`),
  KEY `rma_additional_fields_rma_custom_field_id_foreign` (`rma_custom_field_id`),
  CONSTRAINT `rma_additional_fields_rma_custom_field_id_foreign` FOREIGN KEY (`rma_custom_field_id`) REFERENCES `rma_custom_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_additional_fields_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_additional_fields: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_custom_fields
DROP TABLE IF EXISTS `rma_custom_fields`;
CREATE TABLE IF NOT EXISTS `rma_custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT '0',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT '0',
  `position` int DEFAULT '0',
  `input_validation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rma_custom_fields_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_custom_fields: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_custom_field_options
DROP TABLE IF EXISTS `rma_custom_field_options`;
CREATE TABLE IF NOT EXISTS `rma_custom_field_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_custom_field_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_custom_field_options_rma_custom_field_id_foreign` (`rma_custom_field_id`),
  CONSTRAINT `rma_custom_field_options_rma_custom_field_id_foreign` FOREIGN KEY (`rma_custom_field_id`) REFERENCES `rma_custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_custom_field_options: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_images
DROP TABLE IF EXISTS `rma_images`;
CREATE TABLE IF NOT EXISTS `rma_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_images_rma_id_foreign` (`rma_id`),
  CONSTRAINT `rma_images_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_images: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_items
DROP TABLE IF EXISTS `rma_items`;
CREATE TABLE IF NOT EXISTS `rma_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned DEFAULT NULL,
  `rma_reason_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `variant_id` int unsigned DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `resolution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_items_rma_id_foreign` (`rma_id`),
  KEY `rma_items_rma_reason_id_foreign` (`rma_reason_id`),
  KEY `rma_items_order_item_id_foreign` (`order_item_id`),
  KEY `rma_items_variant_id_foreign` (`variant_id`),
  CONSTRAINT `rma_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_items_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_items_rma_reason_id_foreign` FOREIGN KEY (`rma_reason_id`) REFERENCES `rma_reasons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rma_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_items: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_messages
DROP TABLE IF EXISTS `rma_messages`;
CREATE TABLE IF NOT EXISTS `rma_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_admin` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_messages_rma_id_foreign` (`rma_id`),
  CONSTRAINT `rma_messages_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_messages: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_reasons
DROP TABLE IF EXISTS `rma_reasons`;
CREATE TABLE IF NOT EXISTS `rma_reasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_reasons: ~5 rows (approximately)
INSERT INTO `rma_reasons` (`id`, `title`, `status`, `position`, `is_admin`, `created_at`, `updated_at`) VALUES
	(1, 'Manufacturer Defect', 1, 1, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(2, 'Damaged During Shipping', 1, 2, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, 'Wrong Description Online', 1, 3, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, 'Dead On Arrival', 1, 4, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, 'Product Not Received Yet', 1, 5, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.rma_reason_resolutions
DROP TABLE IF EXISTS `rma_reason_resolutions`;
CREATE TABLE IF NOT EXISTS `rma_reason_resolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_reason_id` int unsigned NOT NULL,
  `resolution_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_reason_resolutions_rma_reason_id_foreign` (`rma_reason_id`),
  CONSTRAINT `rma_reason_resolutions_rma_reason_id_foreign` FOREIGN KEY (`rma_reason_id`) REFERENCES `rma_reasons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_reason_resolutions: ~10 rows (approximately)
INSERT INTO `rma_reason_resolutions` (`id`, `rma_reason_id`, `resolution_type`, `created_at`, `updated_at`) VALUES
	(1, 1, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(2, 1, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, 2, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, 2, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, 3, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(6, 3, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(7, 4, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(8, 4, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(9, 5, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(10, 5, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.rma_rules
DROP TABLE IF EXISTS `rma_rules`;
CREATE TABLE IF NOT EXISTS `rma_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `return_period` int DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_rules: ~0 rows (approximately)
INSERT INTO `rma_rules` (`id`, `name`, `description`, `status`, `return_period`, `default`, `created_at`, `updated_at`) VALUES
	(1, 'Basic', '1', 1, 10, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.rma_statuses
DROP TABLE IF EXISTS `rma_statuses`;
CREATE TABLE IF NOT EXISTS `rma_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_statuses: ~0 rows (approximately)
INSERT INTO `rma_statuses` (`id`, `title`, `status`, `color`, `default`, `created_at`, `updated_at`) VALUES
	(1, 'Pending Review', 1, '#efb308', 1, NULL, NULL),
	(2, 'Approved', 1, '#12af56', 1, NULL, NULL),
	(3, 'Awaiting Return', 1, '#f59e0b', 1, NULL, NULL),
	(4, 'Return In Transit', 1, '#3b82f6', 1, NULL, NULL),
	(5, 'Refunded', 1, '#10b981', 1, NULL, NULL),
	(6, 'Solved', 1, '#47b84f', 1, NULL, NULL),
	(7, 'Request Declined', 1, '#e11d48', 1, NULL, NULL),
	(8, 'Item Canceled', 1, '#dc2626', 1, NULL, NULL),
	(9, 'Request Canceled', 1, '#991b1b', 1, NULL, NULL);

-- Dumping structure for table bagisto_db.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.roles: ~0 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'This role users will have all the access', 'all', NULL, NULL, NULL);

-- Dumping structure for table bagisto_db.search_synonyms
DROP TABLE IF EXISTS `search_synonyms`;
CREATE TABLE IF NOT EXISTS `search_synonyms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.search_synonyms: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.search_terms
DROP TABLE IF EXISTS `search_terms`;
CREATE TABLE IF NOT EXISTS `search_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.search_terms: ~0 rows (approximately)
INSERT INTO `search_terms` (`id`, `term`, `results`, `uses`, `redirect_url`, `display_in_suggested_terms`, `locale`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'điện thoại', 0, 1, NULL, 0, 'en', 1, '2026-09-29 17:45:51', '2026-09-29 17:45:51'),
	(2, 'ồn', 11, 1, NULL, 0, 'en', 1, '2026-09-29 17:46:02', '2026-09-29 17:46:02'),
	(3, 'ốp lưng', 1, 1, NULL, 0, 'en', 1, '2026-09-29 17:46:25', '2026-09-29 17:46:25');

-- Dumping structure for table bagisto_db.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.sessions: ~0 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('4Aph8NdeVvxrZcTUdZEFVi0BvLTiVjLN81cRZMbe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiQzlaalRNRVdEU3VlUGJjaWc5WnR2QXNQYmMzV0ZuSEQxTmgwMkZsRiI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiVVNEIjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0NDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2NhdGFsb2cvcHJvZHVjdHMiO3M6NToicm91dGUiO3M6Mjg6ImFkbWluLmNhdGFsb2cucHJvZHVjdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=', 1790695010),
	('4ZbKHniJK5K6f0xjzQgW0iEICurqk7sTFVQnVbCq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRnIyR2NFT2paOExjeEZDV3BoTjhqMjhOQmR0MEpaeENaUUhHVTZ5TSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiVVNEIjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo1NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3NlYXJjaD9xdWVyeT0lRTElQkIlOTFwJTIwbCVDNiVCMG5nIjtzOjU6InJvdXRlIjtzOjE3OiJzaG9wLnNlYXJjaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790709390),
	('Gxe58tzMpP6xnJgauFvwWpBrOoHPOSXoKUS95QUX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQXNrZDNSWkluTUwzV09zbWdmcUd4TjZHQm9vdEhhVm1BR3RPWFJSMCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiVVNEIjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjtzOjU6InJvdXRlIjtzOjE1OiJzaG9wLmhvbWUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1790739076),
	('hvQLRkYpwNkjdjGc3kfM7XcBh8Jo54xF3WXCswCC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYVlVM21hZzNtdlJxVTFGR0xJTXpkOUY1TXNNUmZrTEZBbk43ZFB4aSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiVVNEIjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cDovL2xvY2FsaG9zdDo4MDAwIjtzOjU6InJvdXRlIjtzOjE1OiJzaG9wLmhvbWUuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1790694945);

-- Dumping structure for table bagisto_db.shipments
DROP TABLE IF EXISTS `shipments`;
CREATE TABLE IF NOT EXISTS `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` decimal(12,4) DEFAULT NULL,
  `carrier_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.shipments: ~0 rows (approximately)
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 0.3500, NULL, '', '', 1, 1, 'Webkul\\Customer\\Models\\Customer', 3, 12, 1, 'Default', '2026-09-29 07:55:01', '2026-09-29 07:55:05');

-- Dumping structure for table bagisto_db.shipment_items
DROP TABLE IF EXISTS `shipment_items`;
CREATE TABLE IF NOT EXISTS `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.shipment_items: ~0 rows (approximately)
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC', NULL, 'EAR-SONY-WF1000XM5', 1, 0.3500, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 12, 'Webkul\\Product\\Models\\Product', 3, 1, '{"locale": "en", "cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:55:01', '2026-09-29 07:55:01');

-- Dumping structure for table bagisto_db.sitemaps
DROP TABLE IF EXISTS `sitemaps`;
CREATE TABLE IF NOT EXISTS `sitemaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional` json DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.sitemaps: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.sitemap_channels
DROP TABLE IF EXISTS `sitemap_channels`;
CREATE TABLE IF NOT EXISTS `sitemap_channels` (
  `sitemap_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `sitemap_channels_sitemap_id_channel_id_unique` (`sitemap_id`,`channel_id`),
  KEY `sitemap_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sitemap_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sitemap_channels_sitemap_id_foreign` FOREIGN KEY (`sitemap_id`) REFERENCES `sitemaps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.sitemap_channels: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.subscribers_list
DROP TABLE IF EXISTS `subscribers_list`;
CREATE TABLE IF NOT EXISTS `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.subscribers_list: ~0 rows (approximately)
INSERT INTO `subscribers_list` (`id`, `email`, `is_subscribed`, `token`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'hungnd13112004@gmail.com', 1, '6abba1b9808d1', NULL, 1, '2026-09-29 10:02:09', '2026-09-29 10:02:09');

-- Dumping structure for table bagisto_db.tax_categories
DROP TABLE IF EXISTS `tax_categories`;
CREATE TABLE IF NOT EXISTS `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.tax_categories: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.tax_categories_tax_rates
DROP TABLE IF EXISTS `tax_categories_tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.tax_categories_tax_rates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.tax_rates
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.tax_rates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.theme_sections
DROP TABLE IF EXISTS `theme_sections`;
CREATE TABLE IF NOT EXISTS `theme_sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `draft_sort_order` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `draft_status` tinyint(1) DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.theme_sections: ~0 rows (approximately)
INSERT INTO `theme_sections` (`id`, `theme_code`, `type`, `name`, `sort_order`, `draft_sort_order`, `status`, `draft_status`, `channel_id`, `created_at`, `updated_at`) VALUES
	(2, 'default', 'static_content', 'Offer Information', 1, NULL, 1, NULL, 1, '2026-09-28 02:10:02', '2026-09-29 09:56:26'),
	(12, 'default', 'services_content', 'Services Content', 8, NULL, 1, NULL, 1, '2026-09-28 02:10:02', '2026-09-29 09:56:26'),
	(16, 'default', 'category_carousel', 'danh mục', 3, NULL, 1, NULL, 1, '2026-09-28 07:37:06', '2026-09-29 09:56:26'),
	(18, 'default', 'product_carousel', 'Sản phẩm nổi bật', 4, NULL, 1, NULL, 1, '2026-09-29 05:47:24', '2026-09-29 09:56:26'),
	(19, 'default', 'image_carousel', 'Banner', 2, NULL, 1, NULL, 1, '2026-09-29 06:07:02', '2026-09-29 09:56:26'),
	(22, 'default', 'static_content', 'test', 7, NULL, 1, NULL, 1, '2026-09-29 06:51:18', '2026-09-29 09:56:26'),
	(23, 'default', 'product_carousel', 'sản phẩm 2', 5, NULL, 1, NULL, 1, '2026-09-29 06:56:46', '2026-09-29 09:56:26'),
	(25, 'default', 'product_carousel', 'sản phẩm 3', 6, NULL, 1, NULL, 1, '2026-09-29 06:59:51', '2026-09-29 09:56:26'),
	(26, 'default', 'static_content', 'Footerlink', 9, NULL, 0, NULL, 1, '2026-09-29 09:22:21', '2026-09-29 09:30:21'),
	(27, 'default', 'footer_links', 'Footerlink', 10, NULL, 1, NULL, 1, '2026-09-29 09:54:17', '2026-09-29 09:56:26');

-- Dumping structure for table bagisto_db.theme_section_translations
DROP TABLE IF EXISTS `theme_section_translations`;
CREATE TABLE IF NOT EXISTS `theme_section_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json DEFAULT NULL,
  `draft_options` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customization_id_foreign` (`section_id`),
  CONSTRAINT `theme_customization_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `theme_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.theme_section_translations: ~0 rows (approximately)
INSERT INTO `theme_section_translations` (`id`, `section_id`, `locale`, `options`, `draft_options`) VALUES
	(2, 2, 'en', '{"css": ".home-offer h1 {\\n  display: block;\\n  font-weight: 1000;\\n  text-align: center;\\n  font-size: 22px;\\n  font-family: \\"Playfair Display\\", \\"Times New Roman\\", serif;\\n  background-color: #e8edfe;\\n  padding-top: 20px;\\n  padding-bottom: 20px;\\n}\\n\\n@media (max-width: 768px) {\\n  .home-offer h1 {\\n    font-size: 18px;\\n    padding-top: 10px;\\n    padding-bottom: 10px;\\n  }\\n} /* Đã thêm dấu đóng ngoặc bị thiếu */\\n\\n@media (max-width: 525px) {\\n  .home-offer h1 {\\n    font-size: 14px;\\n    padding-top: 6px;\\n    padding-bottom: 6px;\\n  }\\n}", "html": "<div class=\\"home-offer\\"><h1>GIẢM ĐÉN 40% SHOP BÁN HÀNG TOP 2 VIỆT NAM</h1></div>"}', NULL),
	(7, 12, 'en', '{"services": [{"title": "Miễn phí vận chuyển", "description": "Giao hàng siêu tốc", "service_icon": "icon-truck"}, {"title": "Chính hãng 100%", "description": "Bảo hành đổi mới trong 12 tháng", "service_icon": "icon-product"}, {"title": "hỗ trợ 24/7", "description": "hỗ trợ nhanh chóng", "service_icon": "icon-support"}]}', NULL),
	(10, 16, 'en', '{"filters": {"limit": "12"}}', NULL),
	(12, 18, 'en', '{"title": "Sản Phẩm nổi bật", "filters": {"limit": "12", "featured": "1"}}', NULL),
	(13, 19, 'en', '{"images": [{"link": "", "image": "storage/themes/default/sections/19/ouvOEpOsbxnYoUMlK5KJSzsTArzg2n7jyz3GMB5p.webp", "title": "n1"}, {"link": "", "image": "storage/themes/default/sections/19/toqbI67FTB6cxdgCxpP6cEH4iatrimeRocXulQm7.webp", "title": "n2"}]}', NULL),
	(15, 22, 'en', '{"css": "/* Bao bọc và căn giữa trang */\\n.siuu-banner-wrapper {\\n  width: 100%;\\n  padding: 40px 16px;\\n  display: flex;\\n  justify-content: center;\\n  align-items: center;\\n  box-sizing: border-box;\\n}\\n\\n/* Khung banner chính */\\n.siuu-promo-banner {\\n  display: flex;\\n  flex-direction: row;\\n  width: 100%;\\n  max-width: 1240px;\\n  min-height: 420px;\\n  border-radius: 16px;\\n  overflow: hidden;\\n  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);\\n  background-color: #0b111e;\\n}\\n\\n/* Cột hình ảnh bên trái */\\n.siuu-banner-image {\\n  flex: 1.1;\\n  position: relative;\\n  background-color: #f1f5f9;\\n  overflow: hidden;\\n}\\n\\n.siuu-banner-image img {\\n  width: 100%;\\n  height: 100%;\\n  object-fit: cover;\\n  display: block;\\n}\\n\\n/* Cột nội dung bên phải */\\n.siuu-banner-content {\\n  flex: 0.9;\\n  background-color: #0b111e;\\n  color: #ffffff;\\n  padding: 48px;\\n  display: flex;\\n  flex-direction: column;\\n  justify-content: center;\\n  align-items: flex-start;\\n  box-sizing: border-box;\\n}\\n\\n.siuu-tagline {\\n  font-size: 0.875rem;\\n  font-weight: 600;\\n  text-transform: uppercase;\\n  letter-spacing: 1.5px;\\n  color: #94a3b8;\\n  margin-bottom: 12px;\\n}\\n\\n.siuu-title {\\n  font-size: 2rem;\\n  line-height: 1.3;\\n  font-weight: 800;\\n  color: #ffffff;\\n  margin-bottom: 16px;\\n}\\n\\n.siuu-desc {\\n  font-size: 0.95rem;\\n  line-height: 1.6;\\n  color: #cbd5e1;\\n  margin-bottom: 28px;\\n}\\n\\n.siuu-btn {\\n  display: inline-block;\\n  background-color: #2563eb;\\n  color: #ffffff !important;\\n  font-size: 0.95rem;\\n  font-weight: 600;\\n  padding: 12px 28px;\\n  border-radius: 8px;\\n  text-decoration: none;\\n  transition: background-color 0.2s ease;\\n}\\n\\n.siuu-btn:hover {\\n  background-color: #1d4ed8;\\n}\\n\\n/* Tối ưu điện thoại */\\n@media (max-width: 768px) {\\n  .siuu-promo-banner {\\n    flex-direction: column;\\n  }\\n  .siuu-banner-image {\\n    min-height: 240px;\\n  }\\n  .siuu-banner-content {\\n    padding: 28px 20px;\\n  }\\n  .siuu-title {\\n    font-size: 1.5rem;\\n  }\\n}", "html": "<div class=\\"siuu-banner-wrapper\\">\\r\\n  <div class=\\"siuu-promo-banner\\">\\r\\n    \\r\\n    <div class=\\"siuu-banner-image\\">\\r\\n      <img src=\\"https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?q=80&amp;w=1000&amp;auto=format&amp;fit=crop\\" alt=\\"Mousepad &amp; Gaming Mouse ShopSiuu\\" />\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-banner-content\\">\\r\\n      <span class=\\"siuu-tagline\\">Showroom ShopSiuu</span>\\r\\n      <h2 class=\\"siuu-title\\">Đừng tin quảng cáo,<br />hãy tin tay mình</h2>\\r\\n      <p class=\\"siuu-desc\\">\\r\\n        Hơn 200 mẫu gaming gear luôn sẵn sàng để bạn cầm, thử và so sánh ngay tại chỗ. Tụi mình tư vấn từ tốn, không vội và không ép mua.\\r\\n      </p>\\r\\n      <a href=\\"http://127.0.0.1:8000\\" class=\\"siuu-btn\\">Ghé ShopSiuu chơi</a>\\r\\n    </div>\\r\\n  </div>\\r\\n</div>"}', NULL),
	(16, 23, 'en', '{"title": "Tai nghe nổi bật", "filters": {"sort": "created_at-desc", "category_id": "5"}}', NULL),
	(18, 25, 'en', '{"title": "Phụ kiện", "filters": {"category_id": "6"}}', NULL),
	(19, 26, 'en', '{"css": ".siuu-footer-wrapper {\\n  width: 100%;\\n  background-color: #f8fafc;\\n  border-top: 1px solid #e2e8f0;\\n  padding: 30px 20px 20px !important; /* Thu gọn padding để xóa khoảng trắng phía dưới */\\n  margin-bottom: 0 !important;\\n  box-sizing: border-box;\\n}\\n\\n.siuu-footer-container {\\n  max-width: 1240px;\\n  margin: 0 auto;\\n  display: flex;\\n  justify-content: space-between;\\n  flex-wrap: wrap;\\n  gap: 20px;\\n}\\n\\n.siuu-footer-col {\\n  flex: 1 1 220px;\\n}\\n\\n.siuu-f-title {\\n  font-size: 0.95rem;\\n  font-weight: 700;\\n  color: #0f172a;\\n  margin-bottom: 12px;\\n  text-transform: uppercase;\\n}\\n\\n.siuu-f-desc, .siuu-f-info {\\n  font-size: 0.85rem;\\n  line-height: 1.5;\\n  color: #64748b;\\n  margin-bottom: 8px;\\n}\\n\\n.siuu-f-links {\\n  list-style: none;\\n  padding: 0;\\n  margin: 0;\\n}\\n\\n.siuu-f-links li {\\n  margin-bottom: 8px;\\n}\\n\\n.siuu-f-links a {\\n  text-decoration: none;\\n  color: #475569;\\n  font-size: 0.875rem;\\n  transition: color 0.2s;\\n}\\n\\n.siuu-f-links a:hover {\\n  color: #2563eb;\\n}\\n\\n/* Định dạng cụm Form nhập Email */\\n.siuu-f-form {\\n  display: flex !important;\\n  align-items: center;\\n  margin-top: 10px;\\n  margin-bottom: 10px;\\n  width: 100%;\\n  max-width: 280px;\\n}\\n\\n.siuu-f-input {\\n  flex: 1 !important;\\n  display: block !important;\\n  height: 38px !important;\\n  padding: 0 12px !important;\\n  border: 1px solid #cbd5e1 !important;\\n  border-radius: 6px 0 0 6px !important;\\n  outline: none !important;\\n  background-color: #ffffff !important;\\n  color: #0f172a !important;\\n  font-size: 0.875rem !important;\\n  box-sizing: border-box !important;\\n}\\n\\n.siuu-f-btn {\\n  height: 38px !important;\\n  background-color: #2563eb !important;\\n  color: #ffffff !important;\\n  border: none !important;\\n  padding: 0 16px !important;\\n  border-radius: 0 6px 6px 0 !important;\\n  cursor: pointer;\\n  font-weight: 600;\\n  font-size: 0.875rem !important;\\n  box-sizing: border-box !important;\\n  white-space: nowrap;\\n}\\n\\n.siuu-f-badge {\\n  font-size: 0.8rem;\\n  color: #16a34a;\\n  font-weight: 600;\\n}\\n\\n@media (max-width: 768px) {\\n  .siuu-footer-container {\\n    flex-direction: column;\\n  }\\n}", "html": "<div class=\\"siuu-footer-wrapper\\">\\r\\n  <div class=\\"siuu-footer-container\\">\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">ShopSiuu Gaming Gear</h3>\\r\\n      <p class=\\"siuu-f-desc\\">Hệ thống phân phối thiết bị ngoại vi và gaming gear chính hãng.</p>\\r\\n      <p class=\\"siuu-f-info\\"><strong>Địa chỉ:</strong> 127e Lê, P. Tân Phú, TP. HCM</p>\\r\\n      <p class=\\"siuu-f-info\\"><strong>Hotline:</strong> 0909 xxx xxx (08:30 - 21:30)</p>\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">Hỗ Trợ Khách Hàng</h3>\\r\\n      <ul class=\\"siuu-f-links\\">\\r\\n        <li><a href=\\"/page/about-us\\">Về chúng tôi</a></li>\\r\\n        <li><a href=\\"/page/customer-service\\">Chăm sóc khách hàng</a></li>\\r\\n        <li><a href=\\"/page/terms-of-use\\">Điều khoản sử dụng</a></li>\\r\\n      </ul>\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">Chính Sách Chung</h3>\\r\\n      <ul class=\\"siuu-f-links\\">\\r\\n        <li><a href=\\"/page/privacy-policy\\">Chính sách bảo mật</a></li>\\r\\n        <li><a href=\\"/page/shipping-policy\\">Chính sách vận chuyển</a></li>\\r\\n        <li><a href=\\"/page/return-policy\\">Chính sách đổi trả 1-1</a></li>\\r\\n      </ul>\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">Đăng Ký Nhận Tin</h3>\\r\\n      <p class=\\"siuu-f-desc\\">Nhận voucher giảm giá 10% cho đơn hàng đầu tiên.</p>\\r\\n      <div class=\\"siuu-f-form\\">\\r\\n        \\r\\n        <button type=\\"button\\" class=\\"siuu-f-btn\\">Gửi</button>\\r\\n      </div>\\r\\n      <p class=\\"siuu-f-badge\\">✓ Cam kết hàng chính hãng 100%</p>\\r\\n    </div>\\r\\n  </div>\\r\\n</div>"}', NULL),
	(20, 27, 'en', '{"column_1": [{"url": "http://localhost:8000/page/about-us", "title": "Về chúng tôi"}, {"url": "http://localhost:8000/page/customer-service", "title": "Chăm sóc khách hàng"}, {"url": "http://localhost:8000/page/whats-new", "title": "Sản phẩm mới & Xu hướng"}, {"url": "http://localhost:8000/page/terms-of-use", "title": "Điều khoản sử dụng"}, {"url": "http://localhost:8000/page/terms-conditions", "title": "Điều kiện giao dịch"}], "column_2": [{"url": "http://localhost:8000/page/privacy-policy", "title": "Chính sách bảo mật"}, {"url": "http://localhost:8000/page/payment-policy", "title": "Chính sách thanh toán"}, {"url": "http://localhost:8000/page/shipping-policy", "title": "Chính sách vận chuyển"}, {"url": "http://localhost:8000/page/return-policy", "title": "Chính sách đổi trả 1-1"}, {"url": "http://localhost:8000/page/refund-policy", "title": "Chính sách hoàn tiền"}]}', NULL);

-- Dumping structure for table bagisto_db.url_rewrites
DROP TABLE IF EXISTS `url_rewrites`;
CREATE TABLE IF NOT EXISTS `url_rewrites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_rewrites_et_rp_lc_idx` (`entity_type`,`request_path`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.url_rewrites: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.users: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.wishlist
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.wishlist: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.wishlist_items
DROP TABLE IF EXISTS `wishlist_items`;
CREATE TABLE IF NOT EXISTS `wishlist_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.wishlist_items: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
