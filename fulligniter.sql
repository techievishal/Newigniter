-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2019 at 07:44 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fulligniter`
--

-- --------------------------------------------------------

--
-- Table structure for table `ti_activities`
--

CREATE TABLE `ti_activities` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `log_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_addresses`
--

CREATE TABLE `ti_addresses` (
  `address_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_banners`
--

CREATE TABLE `ti_banners` (
  `banner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `alt_text` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_code` text COLLATE utf8mb4_unicode_ci,
  `custom_code` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_categories`
--

CREATE TABLE `ti_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_categories`
--

INSERT INTO `ti_categories` (`category_id`, `name`, `description`, `parent_id`, `priority`, `image`, `status`, `nest_left`, `nest_right`, `permalink_slug`) VALUES
(1, 'Appetizer', 'Sed consequat, sapien in scelerisque egestas, neque nisi dapibus magna, non malesuada lectus ligula vel justo. Vestibulum felis nisi, tincidunt eu est quis, faucibus tincidunt ante.', NULL, 1, NULL, 1, 1, '2', 'appetizer'),
(2, 'Main Course', '', NULL, 2, NULL, 1, 3, '4', 'main-course'),
(3, 'Salads', 'Etiam tristique pretium enim, vel convallis sem fermentum eget. Donec porta risus vestibulum elit gravida ornare. Quisque neque mi, tincidunt quis leo eget, ornare aliquam nulla. Morbi at lacinia lorem. Aenean at accumsan turpis.', NULL, 3, NULL, 1, 5, '6', 'salads'),
(4, 'Seafoods', 'Morbi blandit massa et massa ornare, sed aliquam risus suscipit. Suspendisse et felis vitae ex pulvinar dictum et non dui. Suspendisse ullamcorper diam ac aliquet malesuada. Duis auctor nisi turpis, a ornare nisi auctor sit amet. Suspendisse imperdiet magna accumsan libero laoreet, consectetur sollicitudin sem maximus.', NULL, 4, NULL, 1, 7, '8', 'seafoods'),
(5, 'Traditional', 'Vivamus interdum erat ac aliquam porttitor. Morbi malesuada ligula non elit sagittis, et facilisis dolor porta. Aenean aliquet leo eu massa tempor varius. Donec a erat massa. Praesent vitae libero a ligula auctor laoreet.', NULL, 5, NULL, 1, 9, '10', 'traditional'),
(6, 'Desserts', '', NULL, 6, NULL, 1, 9, '10', 'desserts'),
(7, 'Drinks', '', NULL, 7, NULL, 1, 9, '10', 'drinks'),
(8, 'Specials', 'Praesent nec velit faucibus, consequat justo eu, malesuada est. Aenean leo ipsum, venenatis nec dapibus ullamcorper, volutpat eget leo. Phasellus nec ipsum lorem. Etiam nec ullamcorper augue. Phasellus mauris turpis, consequat et rutrum at, bibendum eu mi.', NULL, 8, NULL, 1, 9, '10', 'specials');

-- --------------------------------------------------------

--
-- Table structure for table `ti_countries`
--

CREATE TABLE `ti_countries` (
  `country_id` int(10) UNSIGNED NOT NULL,
  `country_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_code_3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `flag` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_countries`
--

INSERT INTO `ti_countries` (`country_id`, `country_name`, `iso_code_2`, `iso_code_3`, `format`, `status`, `flag`, `priority`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/af.png', 999),
(2, 'Albania', 'AL', 'ALB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/al.png', 999),
(3, 'Algeria', 'DZ', 'DZA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/dz.png', 999),
(4, 'American Samoa', 'AS', 'ASM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/as.png', 999),
(5, 'Andorra', 'AD', 'AND', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ad.png', 999),
(6, 'Angola', 'AO', 'AGO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ao.png', 999),
(7, 'Anguilla', 'AI', 'AIA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ai.png', 999),
(8, 'Antarctica', 'AQ', 'ATA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/aq.png', 999),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ag.png', 999),
(10, 'Argentina', 'AR', 'ARG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ar.png', 999),
(11, 'Armenia', 'AM', 'ARM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/am.png', 999),
(12, 'Aruba', 'AW', 'ABW', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/aw.png', 999),
(13, 'Australia', 'AU', 'AUS', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/au.png', 999),
(14, 'Austria', 'AT', 'AUT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/at.png', 999),
(15, 'Azerbaijan', 'AZ', 'AZE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/az.png', 999),
(16, 'Bahamas', 'BS', 'BHS', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bs.png', 999),
(17, 'Bahrain', 'BH', 'BHR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bh.png', 999),
(18, 'Bangladesh', 'BD', 'BGD', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bd.png', 999),
(19, 'Barbados', 'BB', 'BRB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bb.png', 999),
(20, 'Belarus', 'BY', 'BLR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/by.png', 999),
(21, 'Belgium', 'BE', 'BEL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/be.png', 999),
(22, 'Belize', 'BZ', 'BLZ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bz.png', 999),
(23, 'Benin', 'BJ', 'BEN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bj.png', 999),
(24, 'Bermuda', 'BM', 'BMU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bm.png', 999),
(25, 'Bhutan', 'BT', 'BTN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bt.png', 999),
(26, 'Bolivia', 'BO', 'BOL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bo.png', 999),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ba.png', 999),
(28, 'Botswana', 'BW', 'BWA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bw.png', 999),
(29, 'Bouvet Island', 'BV', 'BVT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bv.png', 999),
(30, 'Brazil', 'BR', 'BRA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/br.png', 999),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/io.png', 999),
(32, 'Brunei Darussalam', 'BN', 'BRN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bn.png', 999),
(33, 'Bulgaria', 'BG', 'BGR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bg.png', 999),
(34, 'Burkina Faso', 'BF', 'BFA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bf.png', 999),
(35, 'Burundi', 'BI', 'BDI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/bi.png', 999),
(36, 'Cambodia', 'KH', 'KHM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/kh.png', 999),
(37, 'Cameroon', 'CM', 'CMR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cm.png', 999),
(38, 'Canada', 'CA', 'CAN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ca.png', 999),
(39, 'Cape Verde', 'CV', 'CPV', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cv.png', 999),
(40, 'Cayman Islands', 'KY', 'CYM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ky.png', 999),
(41, 'Central African Republic', 'CF', 'CAF', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cf.png', 999),
(42, 'Chad', 'TD', 'TCD', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/td.png', 999),
(43, 'Chile', 'CL', 'CHL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cl.png', 999),
(44, 'China', 'CN', 'CHN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cn.png', 999),
(45, 'Christmas Island', 'CX', 'CXR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cx.png', 999),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cc.png', 999),
(47, 'Colombia', 'CO', 'COL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/co.png', 999),
(48, 'Comoros', 'KM', 'COM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/km.png', 999),
(49, 'Congo', 'CG', 'COG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cg.png', 999),
(50, 'Cook Islands', 'CK', 'COK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ck.png', 999),
(51, 'Costa Rica', 'CR', 'CRI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cr.png', 999),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ci.png', 999),
(53, 'Croatia', 'HR', 'HRV', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/hr.png', 999),
(54, 'Cuba', 'CU', 'CUB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cu.png', 999),
(55, 'Cyprus', 'CY', 'CYP', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cy.png', 999),
(56, 'Czech Republic', 'CZ', 'CZE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cz.png', 999),
(57, 'Denmark', 'DK', 'DNK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/dk.png', 999),
(58, 'Djibouti', 'DJ', 'DJI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/dj.png', 999),
(59, 'Dominica', 'DM', 'DMA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/dm.png', 999),
(60, 'Dominican Republic', 'DO', 'DOM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/do.png', 999),
(61, 'East Timor', 'TP', 'TMP', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tp.png', 999),
(62, 'Ecuador', 'EC', 'ECU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ec.png', 999),
(63, 'Egypt', 'EG', 'EGY', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/eg.png', 999),
(64, 'El Salvador', 'SV', 'SLV', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sv.png', 999),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gq.png', 999),
(66, 'Eritrea', 'ER', 'ERI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/er.png', 999),
(67, 'Estonia', 'EE', 'EST', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ee.png', 999),
(68, 'Ethiopia', 'ET', 'ETH', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/et.png', 999),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/fk.png', 999),
(70, 'Faroe Islands', 'FO', 'FRO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/fo.png', 999),
(71, 'Fiji', 'FJ', 'FJI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/fj.png', 999),
(72, 'Finland', 'FI', 'FIN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/fi.png', 999),
(73, 'France', 'FR', 'FRA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/fr.png', 999),
(74, 'France, Metropolitan', 'FX', 'FXX', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/fx.png', 999),
(75, 'French Guiana', 'GF', 'GUF', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gf.png', 999),
(76, 'French Polynesia', 'PF', 'PYF', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pf.png', 999),
(77, 'French Southern Territories', 'TF', 'ATF', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tf.png', 999),
(78, 'Gabon', 'GA', 'GAB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ga.png', 999),
(79, 'Gambia', 'GM', 'GMB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gm.png', 999),
(80, 'Georgia', 'GE', 'GEO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ge.png', 999),
(81, 'Germany', 'DE', 'DEU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/de.png', 999),
(82, 'Ghana', 'GH', 'GHA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gh.png', 999),
(83, 'Gibraltar', 'GI', 'GIB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gi.png', 999),
(84, 'Greece', 'GR', 'GRC', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gr.png', 999),
(85, 'Greenland', 'GL', 'GRL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gl.png', 999),
(86, 'Grenada', 'GD', 'GRD', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gd.png', 999),
(87, 'Guadeloupe', 'GP', 'GLP', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gp.png', 999),
(88, 'Guam', 'GU', 'GUM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gu.png', 999),
(89, 'Guatemala', 'GT', 'GTM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gt.png', 999),
(90, 'Guinea', 'GN', 'GIN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gn.png', 999),
(91, 'Guinea-bissau', 'GW', 'GNB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gw.png', 999),
(92, 'Guyana', 'GY', 'GUY', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gy.png', 999),
(93, 'Haiti', 'HT', 'HTI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ht.png', 999),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/hm.png', 999),
(95, 'Honduras', 'HN', 'HND', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/hn.png', 999),
(96, 'Hong Kong', 'HK', 'HKG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/hk.png', 999),
(97, 'Hungary', 'HU', 'HUN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/hu.png', 999),
(98, 'Iceland', 'IS', 'ISL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/is.png', 999),
(99, 'India', 'IN', 'IND', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/in.png', 999),
(100, 'Indonesia', 'ID', 'IDN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/id.png', 999),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ir.png', 999),
(102, 'Iraq', 'IQ', 'IRQ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/iq.png', 999),
(103, 'Ireland', 'IE', 'IRL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ie.png', 999),
(104, 'Israel', 'IL', 'ISR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/il.png', 999),
(105, 'Italy', 'IT', 'ITA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/it.png', 999),
(106, 'Jamaica', 'JM', 'JAM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/jm.png', 999),
(107, 'Japan', 'JP', 'JPN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/jp.png', 999),
(108, 'Jordan', 'JO', 'JOR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/jo.png', 999),
(109, 'Kazakhstan', 'KZ', 'KAZ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/kz.png', 999),
(110, 'Kenya', 'KE', 'KEN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ke.png', 999),
(111, 'Kiribati', 'KI', 'KIR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ki.png', 999),
(112, 'North Korea', 'KP', 'PRK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/kp.png', 999),
(113, 'Korea, Republic of', 'KR', 'KOR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/kr.png', 999),
(114, 'Kuwait', 'KW', 'KWT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/kw.png', 999),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/kg.png', 999),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/la.png', 999),
(117, 'Latvia', 'LV', 'LVA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/lv.png', 999),
(118, 'Lebanon', 'LB', 'LBN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/lb.png', 999),
(119, 'Lesotho', 'LS', 'LSO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ls.png', 999),
(120, 'Liberia', 'LR', 'LBR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/lr.png', 999),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ly.png', 999),
(122, 'Liechtenstein', 'LI', 'LIE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/li.png', 999),
(123, 'Lithuania', 'LT', 'LTU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/lt.png', 999),
(124, 'Luxembourg', 'LU', 'LUX', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/lu.png', 999),
(125, 'Macau', 'MO', 'MAC', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mo.png', 999),
(126, 'FYROM', 'MK', 'MKD', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mk.png', 999),
(127, 'Madagascar', 'MG', 'MDG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mg.png', 999),
(128, 'Malawi', 'MW', 'MWI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mw.png', 999),
(129, 'Malaysia', 'MY', 'MYS', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/my.png', 999),
(130, 'Maldives', 'MV', 'MDV', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mv.png', 999),
(131, 'Mali', 'ML', 'MLI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ml.png', 999),
(132, 'Malta', 'MT', 'MLT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mt.png', 999),
(133, 'Marshall Islands', 'MH', 'MHL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mh.png', 999),
(134, 'Martinique', 'MQ', 'MTQ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mq.png', 999),
(135, 'Mauritania', 'MR', 'MRT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mr.png', 999),
(136, 'Mauritius', 'MU', 'MUS', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mu.png', 999),
(137, 'Mayotte', 'YT', 'MYT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/yt.png', 999),
(138, 'Mexico', 'MX', 'MEX', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mx.png', 999),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/fm.png', 999),
(140, 'Moldova, Republic of', 'MD', 'MDA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/md.png', 999),
(141, 'Monaco', 'MC', 'MCO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mc.png', 999),
(142, 'Mongolia', 'MN', 'MNG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mn.png', 999),
(143, 'Montserrat', 'MS', 'MSR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ms.png', 999),
(144, 'Morocco', 'MA', 'MAR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ma.png', 999),
(145, 'Mozambique', 'MZ', 'MOZ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mz.png', 999),
(146, 'Myanmar', 'MM', 'MMR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mm.png', 999),
(147, 'Namibia', 'NA', 'NAM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/na.png', 999),
(148, 'Nauru', 'NR', 'NRU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/nr.png', 999),
(149, 'Nepal', 'NP', 'NPL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/np.png', 999),
(150, 'Netherlands', 'NL', 'NLD', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/nl.png', 999),
(151, 'Netherlands Antilles', 'AN', 'ANT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/an.png', 999),
(152, 'New Caledonia', 'NC', 'NCL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/nc.png', 999),
(153, 'New Zealand', 'NZ', 'NZL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/nz.png', 999),
(154, 'Nicaragua', 'NI', 'NIC', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ni.png', 999),
(155, 'Niger', 'NE', 'NER', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ne.png', 999),
(156, 'Nigeria', 'NG', 'NGA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ng.png', 999),
(157, 'Niue', 'NU', 'NIU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/nu.png', 999),
(158, 'Norfolk Island', 'NF', 'NFK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/nf.png', 999),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/mp.png', 999),
(160, 'Norway', 'NO', 'NOR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/no.png', 999),
(161, 'Oman', 'OM', 'OMN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/om.png', 999),
(162, 'Pakistan', 'PK', 'PAK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pk.png', 999),
(163, 'Palau', 'PW', 'PLW', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pw.png', 999),
(164, 'Panama', 'PA', 'PAN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pa.png', 999),
(165, 'Papua New Guinea', 'PG', 'PNG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pg.png', 999),
(166, 'Paraguay', 'PY', 'PRY', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/py.png', 999),
(167, 'Peru', 'PE', 'PER', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pe.png', 999),
(168, 'Philippines', 'PH', 'PHL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ph.png', 999),
(169, 'Pitcairn', 'PN', 'PCN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pn.png', 999),
(170, 'Poland', 'PL', 'POL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pl.png', 999),
(171, 'Portugal', 'PT', 'PRT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pt.png', 999),
(172, 'Puerto Rico', 'PR', 'PRI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pr.png', 999),
(173, 'Qatar', 'QA', 'QAT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/qa.png', 999),
(174, 'Reunion', 'RE', 'REU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/re.png', 999),
(175, 'Romania', 'RO', 'ROM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ro.png', 999),
(176, 'Russian Federation', 'RU', 'RUS', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ru.png', 999),
(177, 'Rwanda', 'RW', 'RWA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/rw.png', 999),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/kn.png', 999),
(179, 'Saint Lucia', 'LC', 'LCA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/lc.png', 999),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/vc.png', 999),
(181, 'Samoa', 'WS', 'WSM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ws.png', 999),
(182, 'San Marino', 'SM', 'SMR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sm.png', 999),
(183, 'Sao Tome and Principe', 'ST', 'STP', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/st.png', 999),
(184, 'Saudi Arabia', 'SA', 'SAU', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sa.png', 999),
(185, 'Senegal', 'SN', 'SEN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sn.png', 999),
(186, 'Seychelles', 'SC', 'SYC', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sc.png', 999),
(187, 'Sierra Leone', 'SL', 'SLE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sl.png', 999),
(188, 'Singapore', 'SG', 'SGP', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sg.png', 999),
(189, 'Slovak Republic', 'SK', 'SVK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sk.png', 999),
(190, 'Slovenia', 'SI', 'SVN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/si.png', 999),
(191, 'Solomon Islands', 'SB', 'SLB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sb.png', 999),
(192, 'Somalia', 'SO', 'SOM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/so.png', 999),
(193, 'South Africa', 'ZA', 'ZAF', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/za.png', 999),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gs.png', 999),
(195, 'Spain', 'ES', 'ESP', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/es.png', 999),
(196, 'Sri Lanka', 'LK', 'LKA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/lk.png', 999),
(197, 'St. Helena', 'SH', 'SHN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sh.png', 999),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/pm.png', 999),
(199, 'Sudan', 'SD', 'SDN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sd.png', 999),
(200, 'Suriname', 'SR', 'SUR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sr.png', 999),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sj.png', 999),
(202, 'Swaziland', 'SZ', 'SWZ', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sz.png', 999),
(203, 'Sweden', 'SE', 'SWE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/se.png', 999),
(204, 'Switzerland', 'CH', 'CHE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ch.png', 999),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/sy.png', 999),
(206, 'Taiwan', 'TW', 'TWN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tw.png', 999),
(207, 'Tajikistan', 'TJ', 'TJK', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tj.png', 999),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tz.png', 999),
(209, 'Thailand', 'TH', 'THA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/th.png', 999),
(210, 'Togo', 'TG', 'TGO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tg.png', 999),
(211, 'Tokelau', 'TK', 'TKL', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tk.png', 999),
(212, 'Tonga', 'TO', 'TON', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/to.png', 999),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tt.png', 999),
(214, 'Tunisia', 'TN', 'TUN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tn.png', 999),
(215, 'Turkey', 'TR', 'TUR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tr.png', 999),
(216, 'Turkmenistan', 'TM', 'TKM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tm.png', 999),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tc.png', 999),
(218, 'Tuvalu', 'TV', 'TUV', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/tv.png', 999),
(219, 'Uganda', 'UG', 'UGA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ug.png', 999),
(220, 'Ukraine', 'UA', 'UKR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ua.png', 999),
(221, 'United Arab Emirates', 'AE', 'ARE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ae.png', 999),
(222, 'United Kingdom', 'GB', 'GBR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/gb.png', 999),
(223, 'United States', 'US', 'USA', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/us.png', 999),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/um.png', 999),
(225, 'Uruguay', 'UY', 'URY', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/uy.png', 999),
(226, 'Uzbekistan', 'UZ', 'UZB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/uz.png', 999),
(227, 'Vanuatu', 'VU', 'VUT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/vu.png', 999),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/va.png', 999),
(229, 'Venezuela', 'VE', 'VEN', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ve.png', 999),
(230, 'Viet Nam', 'VN', 'VNM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/vn.png', 999),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/vg.png', 999),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/vi.png', 999),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/wf.png', 999),
(234, 'Western Sahara', 'EH', 'ESH', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/eh.png', 999),
(235, 'Yemen', 'YE', 'YEM', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/ye.png', 999),
(236, 'Yugoslavia', 'YU', 'YUG', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/yu.png', 999),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/cd.png', 999),
(238, 'Zambia', 'ZM', 'ZMB', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/zm.png', 999),
(239, 'Zimbabwe', 'ZW', 'ZWE', '{address_1}\n{address_2}\n{city} {postcode} {state}\n{country}', 1, 'flags/zw.png', 999);

-- --------------------------------------------------------

--
-- Table structure for table `ti_coupons`
--

CREATE TABLE `ti_coupons` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(15,4) DEFAULT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `redemptions` int(11) NOT NULL DEFAULT '0',
  `customer_redemptions` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `date_added` date NOT NULL,
  `validity` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `fixed_from_time` time DEFAULT NULL,
  `fixed_to_time` time DEFAULT NULL,
  `period_start_date` date DEFAULT NULL,
  `period_end_date` date DEFAULT NULL,
  `recurring_every` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_from_time` time DEFAULT NULL,
  `recurring_to_time` time DEFAULT NULL,
  `order_restriction` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_coupons`
--

INSERT INTO `ti_coupons` (`coupon_id`, `name`, `code`, `type`, `discount`, `min_total`, `redemptions`, `customer_redemptions`, `description`, `status`, `date_added`, `validity`, `fixed_date`, `fixed_from_time`, `fixed_to_time`, `period_start_date`, `period_end_date`, `recurring_every`, `recurring_from_time`, `recurring_to_time`, `order_restriction`) VALUES
(1, 'Half Sundays', '2222', 'F', '100.0000', '500.0000', 0, 0, NULL, 1, '2019-08-15', 'forever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Half Tuesdays', '3333', 'P', '30.0000', '1000.0000', 0, 0, NULL, 1, '2019-08-15', 'forever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'Full Mondays', 'MTo6TuTg', 'P', '50.0000', '0.0000', 0, 1, NULL, 1, '2019-08-15', 'forever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'Full Tuesdays', '4444', 'F', '500.0000', '5000.0000', 0, 0, NULL, 1, '2019-08-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_coupons_history`
--

CREATE TABLE `ti_coupons_history` (
  `coupon_history_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_used` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_currencies`
--

CREATE TABLE `ti_currencies` (
  `currency_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `currency_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(15,8) NOT NULL,
  `symbol_position` tinyint(1) DEFAULT NULL,
  `thousand_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_position` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_alpha2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_alpha3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `flag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_status` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_currencies`
--

INSERT INTO `ti_currencies` (`currency_id`, `country_id`, `currency_name`, `currency_code`, `currency_symbol`, `currency_rate`, `symbol_position`, `thousand_sign`, `decimal_sign`, `decimal_position`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `flag`, `currency_status`, `date_modified`) VALUES
(1, 1, 'Afghani', 'AFN', '؋', '0.00000000', 0, ',', '.', '2', 'AF', 'AFG', 4, 'flags/AF.png', 0, '2017-10-03 19:08:49'),
(2, 2, 'Lek', 'ALL', 'Lek', '0.00000000', 0, ',', '.', '2', 'AL', 'ALB', 8, 'flags/AL.png', 0, '2017-10-03 19:08:49'),
(3, 3, 'Dinar', 'DZD', 'د.ج', '0.00000000', 0, ',', '.', '2', 'DZ', 'DZA', 12, 'flags/DZ.png', 0, '2017-10-03 19:08:49'),
(4, 4, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'AS', 'ASM', 16, 'flags/AS.png', 0, '2017-10-03 19:08:49'),
(5, 5, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'AD', 'AND', 20, 'flags/AD.png', 0, '2017-10-03 19:08:49'),
(6, 6, 'Kwanza', 'AOA', 'Kz', '0.00000000', 0, ',', '.', '2', 'AO', 'AGO', 24, 'flags/AO.png', 0, '2017-10-03 19:08:49'),
(7, 7, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'AI', 'AIA', 660, 'flags/AI.png', 0, '2017-10-03 19:08:49'),
(8, 8, 'Antarctican', 'AQD', 'A$', '0.00000000', 0, ',', '.', '2', 'AQ', 'ATA', 10, 'flags/AQ.png', 0, '2017-10-03 19:08:49'),
(9, 9, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'AG', 'ATG', 28, 'flags/AG.png', 0, '2017-10-03 19:08:49'),
(10, 10, 'Peso', 'ARS', '$', '0.00000000', 0, ',', '.', '2', 'AR', 'ARG', 32, 'flags/AR.png', 0, '2017-10-03 19:08:49'),
(11, 11, 'Dram', 'AMD', 'դր.', '0.00000000', 0, ',', '.', '2', 'AM', 'ARM', 51, 'flags/AM.png', 0, '2017-10-03 19:08:49'),
(12, 12, 'Guilder', 'AWG', 'ƒ', '0.00000000', 0, ',', '.', '2', 'AW', 'ABW', 533, 'flags/AW.png', 0, '2017-10-03 19:08:49'),
(13, 13, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'AU', 'AUS', 36, 'flags/AU.png', 1, '2017-10-03 19:08:49'),
(14, 14, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'AT', 'AUT', 40, 'flags/AT.png', 0, '2017-10-03 19:08:49'),
(15, 15, 'Manat', 'AZN', 'ман', '0.00000000', 0, ',', '.', '2', 'AZ', 'AZE', 31, 'flags/AZ.png', 0, '2017-10-03 19:08:49'),
(16, 16, 'Dollar', 'BSD', '$', '0.00000000', 0, ',', '.', '2', 'BS', 'BHS', 44, 'flags/BS.png', 0, '2017-10-03 19:08:49'),
(17, 17, 'Dinar', 'BHD', '.د.', '0.00000000', 0, ',', '.', '2', 'BH', 'BHR', 48, 'flags/BH.png', 0, '2017-10-03 19:08:49'),
(18, 18, 'Taka', 'BDT', '৳', '0.00000000', 0, ',', '.', '2', 'BD', 'BGD', 50, 'flags/BD.png', 0, '2017-10-03 19:08:49'),
(19, 19, 'Dollar', 'BBD', '$', '0.00000000', 0, ',', '.', '2', 'BB', 'BRB', 52, 'flags/BB.png', 0, '2017-10-03 19:08:49'),
(20, 20, 'Ruble', 'BYR', 'p.', '0.00000000', 0, ',', '.', '2', 'BY', 'BLR', 112, 'flags/BY.png', 0, '2017-10-03 19:08:49'),
(21, 21, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'BE', 'BEL', 56, 'flags/BE.png', 0, '2017-10-03 19:08:49'),
(22, 22, 'Dollar', 'BZD', 'BZ$', '0.00000000', 0, ',', '.', '2', 'BZ', 'BLZ', 84, 'flags/BZ.png', 0, '2017-10-03 19:08:49'),
(23, 23, 'Franc', 'XOF', '', '0.00000000', 0, ',', '.', '2', 'BJ', 'BEN', 204, 'flags/BJ.png', 0, '2017-10-03 19:08:49'),
(24, 24, 'Dollar', 'BMD', '$', '0.00000000', 0, ',', '.', '2', 'BM', 'BMU', 60, 'flags/BM.png', 0, '2017-10-03 19:08:49'),
(25, 25, 'Ngultrum', 'BTN', 'Nu.', '0.00000000', 0, ',', '.', '2', 'BT', 'BTN', 64, 'flags/BT.png', 0, '2017-10-03 19:08:49'),
(26, 26, 'Boliviano', 'BOB', '$b', '0.00000000', 0, ',', '.', '2', 'BO', 'BOL', 68, 'flags/BO.png', 0, '2017-10-03 19:08:49'),
(27, 27, 'Marka', 'BAM', 'KM', '0.00000000', 0, ',', '.', '2', 'BA', 'BIH', 70, 'flags/BA.png', 0, '2017-10-03 19:08:49'),
(28, 28, 'Pula', 'BWP', 'P', '0.00000000', 0, ',', '.', '2', 'BW', 'BWA', 72, 'flags/BW.png', 0, '2017-10-03 19:08:49'),
(29, 29, 'Krone', 'NOK', 'kr', '0.00000000', 0, ',', '.', '2', 'BV', 'BVT', 74, 'flags/BV.png', 0, '2017-10-03 19:08:49'),
(30, 30, 'Real', 'BRL', 'R$', '0.00000000', 0, ',', '.', '2', 'BR', 'BRA', 76, 'flags/BR.png', 0, '2017-10-03 19:08:49'),
(31, 31, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'IO', 'IOT', 86, 'flags/IO.png', 0, '2017-10-03 19:08:49'),
(32, 231, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'VG', 'VGB', 92, 'flags/VG.png', 0, '2017-10-03 19:08:49'),
(33, 32, 'Dollar', 'BND', '$', '0.00000000', 0, ',', '.', '2', 'BN', 'BRN', 96, 'flags/BN.png', 0, '2017-10-03 19:08:49'),
(34, 33, 'Lev', 'BGN', 'лв', '0.00000000', 0, ',', '.', '2', 'BG', 'BGR', 100, 'flags/BG.png', 0, '2017-10-03 19:08:49'),
(35, 34, 'Franc', 'XOF', '', '0.00000000', 0, ',', '.', '2', 'BF', 'BFA', 854, 'flags/BF.png', 0, '2017-10-03 19:08:49'),
(36, 35, 'Franc', 'BIF', 'Fr', '0.00000000', 0, ',', '.', '2', 'BI', 'BDI', 108, 'flags/BI.png', 0, '2017-10-03 19:08:49'),
(37, 36, 'Riels', 'KHR', '៛', '0.00000000', 0, ',', '.', '2', 'KH', 'KHM', 116, 'flags/KH.png', 0, '2017-10-03 19:08:49'),
(38, 37, 'Franc', 'XAF', 'FCF', '0.00000000', 0, ',', '.', '2', 'CM', 'CMR', 120, 'flags/CM.png', 0, '2017-10-03 19:08:49'),
(39, 38, 'Dollar', 'CAD', '$', '0.00000000', 0, ',', '.', '2', 'CA', 'CAN', 124, 'flags/CA.png', 0, '2017-10-03 19:08:49'),
(40, 39, 'Escudo', 'CVE', '', '0.00000000', 0, ',', '.', '2', 'CV', 'CPV', 132, 'flags/CV.png', 0, '2017-10-03 19:08:49'),
(41, 40, 'Dollar', 'KYD', '$', '0.00000000', 0, ',', '.', '2', 'KY', 'CYM', 136, 'flags/KY.png', 0, '2017-10-03 19:08:49'),
(42, 41, 'Franc', 'XAF', 'FCF', '0.00000000', 0, ',', '.', '2', 'CF', 'CAF', 140, 'flags/CF.png', 0, '2017-10-03 19:08:49'),
(43, 42, 'Franc', 'XAF', '', '0.00000000', 0, ',', '.', '2', 'TD', 'TCD', 148, 'flags/TD.png', 0, '2017-10-03 19:08:49'),
(44, 43, 'Peso', 'CLP', '', '0.00000000', 0, ',', '.', '2', 'CL', 'CHL', 152, 'flags/CL.png', 0, '2017-10-03 19:08:49'),
(45, 44, 'Yuan Renminbi', 'CNY', '¥', '0.00000000', 0, ',', '.', '2', 'CN', 'CHN', 156, 'flags/CN.png', 0, '2017-10-03 19:08:49'),
(46, 45, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'CX', 'CXR', 162, 'flags/CX.png', 0, '2017-10-03 19:08:49'),
(47, 46, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'CC', 'CCK', 166, 'flags/CC.png', 0, '2017-10-03 19:08:49'),
(48, 47, 'Peso', 'COP', '$', '0.00000000', 0, ',', '.', '2', 'CO', 'COL', 170, 'flags/CO.png', 0, '2017-10-03 19:08:49'),
(49, 48, 'Franc', 'KMF', '', '0.00000000', 0, ',', '.', '2', 'KM', 'COM', 174, 'flags/KM.png', 0, '2017-10-03 19:08:49'),
(50, 50, 'Dollar', 'NZD', '$', '0.00000000', 0, ',', '.', '2', 'CK', 'COK', 184, 'flags/CK.png', 0, '2017-10-03 19:08:49'),
(51, 51, 'Colon', 'CRC', '₡', '0.00000000', 0, ',', '.', '2', 'CR', 'CRI', 188, 'flags/CR.png', 0, '2017-10-03 19:08:49'),
(52, 53, 'Kuna', 'HRK', 'kn', '0.00000000', 0, ',', '.', '2', 'HR', 'HRV', 191, 'flags/HR.png', 0, '2017-10-03 19:08:49'),
(53, 54, 'Peso', 'CUP', '₱', '0.00000000', 0, ',', '.', '2', 'CU', 'CUB', 192, 'flags/CU.png', 0, '2017-10-03 19:08:49'),
(54, 55, 'Pound', 'CYP', '', '0.00000000', 0, ',', '.', '2', 'CY', 'CYP', 196, 'flags/CY.png', 0, '2017-10-03 19:08:49'),
(55, 56, 'Koruna', 'CZK', 'Kč', '0.00000000', 0, ',', '.', '2', 'CZ', 'CZE', 203, 'flags/CZ.png', 0, '2017-10-03 19:08:49'),
(56, 49, 'Franc', 'CDF', 'FC', '0.00000000', 0, ',', '.', '2', 'CD', 'COD', 180, 'flags/CD.png', 0, '2017-10-03 19:08:49'),
(57, 57, 'Krone', 'DKK', 'kr', '0.00000000', 0, ',', '.', '2', 'DK', 'DNK', 208, 'flags/DK.png', 0, '2017-10-03 19:08:49'),
(58, 58, 'Franc', 'DJF', '', '0.00000000', 0, ',', '.', '2', 'DJ', 'DJI', 262, 'flags/DJ.png', 0, '2017-10-03 19:08:49'),
(59, 59, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'DM', 'DMA', 212, 'flags/DM.png', 0, '2017-10-03 19:08:49'),
(60, 60, 'Peso', 'DOP', 'RD$', '0.00000000', 0, ',', '.', '2', 'DO', 'DOM', 214, 'flags/DO.png', 0, '2017-10-03 19:08:49'),
(61, 61, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'TL', 'TLS', 626, 'flags/TL.png', 0, '2017-10-03 19:08:49'),
(62, 62, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'EC', 'ECU', 218, 'flags/EC.png', 0, '2017-10-03 19:08:49'),
(63, 63, 'Pound', 'EGP', '£', '0.00000000', 0, ',', '.', '2', 'EG', 'EGY', 818, 'flags/EG.png', 0, '2017-10-03 19:08:49'),
(64, 64, 'Colone', 'SVC', '$', '0.00000000', 0, ',', '.', '2', 'SV', 'SLV', 222, 'flags/SV.png', 0, '2017-10-03 19:08:49'),
(65, 65, 'Franc', 'XAF', 'FCF', '0.00000000', 0, ',', '.', '2', 'GQ', 'GNQ', 226, 'flags/GQ.png', 0, '2017-10-03 19:08:49'),
(66, 66, 'Nakfa', 'ERN', 'Nfk', '0.00000000', 0, ',', '.', '2', 'ER', 'ERI', 232, 'flags/ER.png', 0, '2017-10-03 19:08:49'),
(67, 67, 'Kroon', 'EEK', 'kr', '0.00000000', 0, ',', '.', '2', 'EE', 'EST', 233, 'flags/EE.png', 0, '2017-10-03 19:08:49'),
(68, 68, 'Birr', 'ETB', '', '0.00000000', 0, ',', '.', '2', 'ET', 'ETH', 231, 'flags/ET.png', 0, '2017-10-03 19:08:49'),
(69, 69, 'Pound', 'FKP', '£', '0.00000000', 0, ',', '.', '2', 'FK', 'FLK', 238, 'flags/FK.png', 0, '2017-10-03 19:08:49'),
(70, 70, 'Krone', 'DKK', 'kr', '0.00000000', 0, ',', '.', '2', 'FO', 'FRO', 234, 'flags/FO.png', 0, '2017-10-03 19:08:49'),
(71, 71, 'Dollar', 'FJD', '$', '0.00000000', 0, ',', '.', '2', 'FJ', 'FJI', 242, 'flags/FJ.png', 0, '2017-10-03 19:08:49'),
(72, 72, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'FI', 'FIN', 246, 'flags/FI.png', 0, '2017-10-03 19:08:49'),
(73, 73, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'FR', 'FRA', 250, 'flags/FR.png', 0, '2017-10-03 19:08:49'),
(74, 75, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'GF', 'GUF', 254, 'flags/GF.png', 0, '2017-10-03 19:08:49'),
(75, 76, 'Franc', 'XPF', '', '0.00000000', 0, ',', '.', '2', 'PF', 'PYF', 258, 'flags/PF.png', 0, '2017-10-03 19:08:49'),
(76, 77, 'Euro  ', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'TF', 'ATF', 260, 'flags/TF.png', 0, '2017-10-03 19:08:49'),
(77, 78, 'Franc', 'XAF', 'FCF', '0.00000000', 0, ',', '.', '2', 'GA', 'GAB', 266, 'flags/GA.png', 0, '2017-10-03 19:08:49'),
(78, 79, 'Dalasi', 'GMD', 'D', '0.00000000', 0, ',', '.', '2', 'GM', 'GMB', 270, 'flags/GM.png', 0, '2017-10-03 19:08:49'),
(79, 80, 'Lari', 'GEL', '', '0.00000000', 0, ',', '.', '2', 'GE', 'GEO', 268, 'flags/GE.png', 0, '2017-10-03 19:08:49'),
(80, 81, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'DE', 'DEU', 276, 'flags/DE.png', 0, '2017-10-03 19:08:49'),
(81, 82, 'Cedi', 'GHC', '¢', '0.00000000', 0, ',', '.', '2', 'GH', 'GHA', 288, 'flags/GH.png', 0, '2017-10-03 19:08:49'),
(82, 83, 'Pound', 'GIP', '£', '0.00000000', 0, ',', '.', '2', 'GI', 'GIB', 292, 'flags/GI.png', 0, '2017-10-03 19:08:49'),
(83, 84, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'GR', 'GRC', 300, 'flags/GR.png', 0, '2017-10-03 19:08:49'),
(84, 85, 'Krone', 'DKK', 'kr', '0.00000000', 0, ',', '.', '2', 'GL', 'GRL', 304, 'flags/GL.png', 0, '2017-10-03 19:08:49'),
(85, 86, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'GD', 'GRD', 308, 'flags/GD.png', 0, '2017-10-03 19:08:49'),
(86, 87, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'GP', 'GLP', 312, 'flags/GP.png', 0, '2017-10-03 19:08:49'),
(87, 88, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'GU', 'GUM', 316, 'flags/GU.png', 0, '2017-10-03 19:08:49'),
(88, 89, 'Quetzal', 'GTQ', 'Q', '0.00000000', 0, ',', '.', '2', 'GT', 'GTM', 320, 'flags/GT.png', 0, '2017-10-03 19:08:49'),
(89, 90, 'Franc', 'GNF', '', '0.00000000', 0, ',', '.', '2', 'GN', 'GIN', 324, 'flags/GN.png', 0, '2017-10-03 19:08:49'),
(90, 91, 'Franc', 'XOF', '', '0.00000000', 0, ',', '.', '2', 'GW', 'GNB', 624, 'flags/GW.png', 0, '2017-10-03 19:08:49'),
(91, 92, 'Dollar', 'GYD', '$', '0.00000000', 0, ',', '.', '2', 'GY', 'GUY', 328, 'flags/GY.png', 0, '2017-10-03 19:08:49'),
(92, 93, 'Gourde', 'HTG', 'G', '0.00000000', 0, ',', '.', '2', 'HT', 'HTI', 332, 'flags/HT.png', 0, '2017-10-03 19:08:49'),
(93, 94, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'HM', 'HMD', 334, 'flags/HM.png', 0, '2017-10-03 19:08:49'),
(94, 95, 'Lempira', 'HNL', 'L', '0.00000000', 0, ',', '.', '2', 'HN', 'HND', 340, 'flags/HN.png', 0, '2017-10-03 19:08:49'),
(95, 96, 'Dollar', 'HKD', '$', '0.00000000', 0, ',', '.', '2', 'HK', 'HKG', 344, 'flags/HK.png', 0, '2017-10-03 19:08:49'),
(96, 97, 'Forint', 'HUF', 'Ft', '0.00000000', 0, ',', '.', '2', 'HU', 'HUN', 348, 'flags/HU.png', 0, '2017-10-03 19:08:49'),
(97, 98, 'Krona', 'ISK', 'kr', '0.00000000', 0, ',', '.', '2', 'IS', 'ISL', 352, 'flags/IS.png', 0, '2017-10-03 19:08:49'),
(98, 99, 'Rupee', 'INR', '₹', '0.00000000', 0, ',', '.', '2', 'IN', 'IND', 356, 'flags/IN.png', 0, '2017-10-03 19:08:49'),
(99, 100, 'Rupiah', 'IDR', 'Rp', '0.00000000', 0, ',', '.', '2', 'ID', 'IDN', 360, 'flags/ID.png', 0, '2017-10-03 19:08:49'),
(100, 101, 'Rial', 'IRR', '﷼', '0.00000000', 0, ',', '.', '2', 'IR', 'IRN', 364, 'flags/IR.png', 0, '2017-10-03 19:08:49'),
(101, 102, 'Dinar', 'IQD', '', '0.00000000', 0, ',', '.', '2', 'IQ', 'IRQ', 368, 'flags/IQ.png', 0, '2017-10-03 19:08:49'),
(102, 103, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'IE', 'IRL', 372, 'flags/IE.png', 0, '2017-10-03 19:08:49'),
(103, 104, 'Shekel', 'ILS', '₪', '0.00000000', 0, ',', '.', '2', 'IL', 'ISR', 376, 'flags/IL.png', 0, '2017-10-03 19:08:49'),
(104, 105, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'IT', 'ITA', 380, 'flags/IT.png', 0, '2017-10-03 19:08:49'),
(105, 52, 'Franc', 'XOF', '', '0.00000000', 0, ',', '.', '2', 'CI', 'CIV', 384, 'flags/CI.png', 0, '2017-10-03 19:08:49'),
(106, 106, 'Dollar', 'JMD', '$', '0.00000000', 0, ',', '.', '2', 'JM', 'JAM', 388, 'flags/JM.png', 0, '2017-10-03 19:08:49'),
(107, 107, 'Yen', 'JPY', '¥', '0.00000000', 0, ',', '.', '2', 'JP', 'JPN', 392, 'flags/JP.png', 0, '2017-10-03 19:08:49'),
(108, 108, 'Dinar', 'JOD', '', '0.00000000', 0, ',', '.', '2', 'JO', 'JOR', 400, 'flags/JO.png', 0, '2017-10-03 19:08:49'),
(109, 109, 'Tenge', 'KZT', 'лв', '0.00000000', 0, ',', '.', '2', 'KZ', 'KAZ', 398, 'flags/KZ.png', 0, '2017-10-03 19:08:49'),
(110, 110, 'Shilling', 'KES', '', '0.00000000', 0, ',', '.', '2', 'KE', 'KEN', 404, 'flags/KE.png', 0, '2017-10-03 19:08:49'),
(111, 111, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'KI', 'KIR', 296, 'flags/KI.png', 0, '2017-10-03 19:08:49'),
(112, 114, 'Dinar', 'KWD', 'د.ك', '0.00000000', 0, ',', '.', '2', 'KW', 'KWT', 414, 'flags/KW.png', 0, '2017-10-03 19:08:49'),
(113, 115, 'Som', 'KGS', 'лв', '0.00000000', 0, ',', '.', '2', 'KG', 'KGZ', 417, 'flags/KG.png', 0, '2017-10-03 19:08:49'),
(114, 116, 'Kip', 'LAK', '₭', '0.00000000', 0, ',', '.', '2', 'LA', 'LAO', 418, 'flags/LA.png', 0, '2017-10-03 19:08:49'),
(115, 117, 'Lat', 'LVL', 'Ls', '0.00000000', 0, ',', '.', '2', 'LV', 'LVA', 428, 'flags/LV.png', 0, '2017-10-03 19:08:49'),
(116, 118, 'Pound', 'LBP', '£', '0.00000000', 0, ',', '.', '2', 'LB', 'LBN', 422, 'flags/LB.png', 0, '2017-10-03 19:08:49'),
(117, 119, 'Loti', 'LSL', 'L', '0.00000000', 0, ',', '.', '2', 'LS', 'LSO', 426, 'flags/LS.png', 0, '2017-10-03 19:08:49'),
(118, 120, 'Dollar', 'LRD', '$', '0.00000000', 0, ',', '.', '2', 'LR', 'LBR', 430, 'flags/LR.png', 0, '2017-10-03 19:08:49'),
(119, 121, 'Dinar', 'LYD', 'ل.د', '0.00000000', 0, ',', '.', '2', 'LY', 'LBY', 434, 'flags/LY.png', 0, '2017-10-03 19:08:49'),
(120, 122, 'Franc', 'CHF', 'CHF', '0.00000000', 0, ',', '.', '2', 'LI', 'LIE', 438, 'flags/LI.png', 0, '2017-10-03 19:08:49'),
(121, 123, 'Litas', 'LTL', 'Lt', '0.00000000', 0, ',', '.', '2', 'LT', 'LTU', 440, 'flags/LT.png', 0, '2017-10-03 19:08:49'),
(122, 124, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'LU', 'LUX', 442, 'flags/LU.png', 0, '2017-10-03 19:08:49'),
(123, 125, 'Pataca', 'MOP', 'MOP', '0.00000000', 0, ',', '.', '2', 'MO', 'MAC', 446, 'flags/MO.png', 0, '2017-10-03 19:08:49'),
(124, 140, 'Denar', 'MKD', 'ден', '0.00000000', 0, ',', '.', '2', 'MK', 'MKD', 807, 'flags/MK.png', 0, '2017-10-03 19:08:49'),
(125, 127, 'Ariary', 'MGA', 'Ar', '0.00000000', 0, ',', '.', '2', 'MG', 'MDG', 450, 'flags/MG.png', 0, '2017-10-03 19:08:49'),
(126, 128, 'Kwacha', 'MWK', 'MK', '0.00000000', 0, ',', '.', '2', 'MW', 'MWI', 454, 'flags/MW.png', 0, '2017-10-03 19:08:49'),
(127, 129, 'Ringgit', 'MYR', 'RM', '0.00000000', 0, ',', '.', '2', 'MY', 'MYS', 458, 'flags/MY.png', 0, '2017-10-03 19:08:49'),
(128, 130, 'Rufiyaa', 'MVR', 'Rf', '0.00000000', 0, ',', '.', '2', 'MV', 'MDV', 462, 'flags/MV.png', 0, '2017-10-03 19:08:49'),
(129, 131, 'Franc', 'XOF', 'MAF', '0.00000000', 0, ',', '.', '2', 'ML', 'MLI', 466, 'flags/ML.png', 0, '2017-10-03 19:08:49'),
(130, 132, 'Lira', 'MTL', 'Lm', '0.00000000', 0, ',', '.', '2', 'MT', 'MLT', 470, 'flags/MT.png', 0, '2017-10-03 19:08:49'),
(131, 133, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'MH', 'MHL', 584, 'flags/MH.png', 0, '2017-10-03 19:08:49'),
(132, 134, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'MQ', 'MTQ', 474, 'flags/MQ.png', 0, '2017-10-03 19:08:49'),
(133, 135, 'Ouguiya', 'MRO', 'UM', '0.00000000', 0, ',', '.', '2', 'MR', 'MRT', 478, 'flags/MR.png', 0, '2017-10-03 19:08:49'),
(134, 136, 'Rupee', 'MUR', '₨', '0.00000000', 0, ',', '.', '2', 'MU', 'MUS', 480, 'flags/MU.png', 0, '2017-10-03 19:08:49'),
(135, 137, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'YT', 'MYT', 175, 'flags/YT.png', 0, '2017-10-03 19:08:49'),
(136, 138, 'Peso', 'MXN', '$', '0.00000000', 0, ',', '.', '2', 'MX', 'MEX', 484, 'flags/MX.png', 0, '2017-10-03 19:08:49'),
(137, 139, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'FM', 'FSM', 583, 'flags/FM.png', 0, '2017-10-03 19:08:49'),
(138, 140, 'Leu', 'MDL', 'MDL', '0.00000000', 0, ',', '.', '2', 'MD', 'MDA', 498, 'flags/MD.png', 0, '2017-10-03 19:08:49'),
(139, 141, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'MC', 'MCO', 492, 'flags/MC.png', 0, '2017-10-03 19:08:49'),
(140, 142, 'Tugrik', 'MNT', '₮', '0.00000000', 0, ',', '.', '2', 'MN', 'MNG', 496, 'flags/MN.png', 0, '2017-10-03 19:08:49'),
(141, 143, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'MS', 'MSR', 500, 'flags/MS.png', 0, '2017-10-03 19:08:49'),
(142, 144, 'Dirham', 'MAD', '', '0.00000000', 0, ',', '.', '2', 'MA', 'MAR', 504, 'flags/MA.png', 0, '2017-10-03 19:08:49'),
(143, 145, 'Meticail', 'MZN', 'MT', '0.00000000', 0, ',', '.', '2', 'MZ', 'MOZ', 508, 'flags/MZ.png', 0, '2017-10-03 19:08:49'),
(144, 146, 'Kyat', 'MMK', 'K', '0.00000000', 0, ',', '.', '2', 'MM', 'MMR', 104, 'flags/MM.png', 0, '2017-10-03 19:08:49'),
(145, 147, 'Dollar', 'NAD', '$', '0.00000000', 0, ',', '.', '2', 'NA', 'NAM', 516, 'flags/NA.png', 0, '2017-10-03 19:08:49'),
(146, 148, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'NR', 'NRU', 520, 'flags/NR.png', 0, '2017-10-03 19:08:49'),
(147, 149, 'Rupee', 'NPR', '₨', '0.00000000', 0, ',', '.', '2', 'NP', 'NPL', 524, 'flags/NP.png', 0, '2017-10-03 19:08:49'),
(148, 150, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'NL', 'NLD', 528, 'flags/NL.png', 0, '2017-10-03 19:08:49'),
(149, 151, 'Guilder', 'ANG', 'ƒ', '0.00000000', 0, ',', '.', '2', 'AN', 'ANT', 530, 'flags/AN.png', 0, '2017-10-03 19:08:49'),
(150, 152, 'Franc', 'XPF', '', '0.00000000', 0, ',', '.', '2', 'NC', 'NCL', 540, 'flags/NC.png', 0, '2017-10-03 19:08:49'),
(151, 153, 'Dollar', 'NZD', '$', '0.00000000', 0, ',', '.', '2', 'NZ', 'NZL', 554, 'flags/NZ.png', 0, '2017-10-03 19:08:49'),
(152, 154, 'Cordoba', 'NIO', 'C$', '0.00000000', 0, ',', '.', '2', 'NI', 'NIC', 558, 'flags/NI.png', 0, '2017-10-03 19:08:49'),
(153, 155, 'Franc', 'XOF', '', '0.00000000', 0, ',', '.', '2', 'NE', 'NER', 562, 'flags/NE.png', 0, '2017-10-03 19:08:49'),
(154, 156, 'Naira', 'NGN', '₦', '0.00000000', 0, ',', '.', '2', 'NG', 'NGA', 566, 'flags/NG.png', 1, '2017-10-03 19:08:49'),
(155, 157, 'Dollar', 'NZD', '$', '0.00000000', 0, ',', '.', '2', 'NU', 'NIU', 570, 'flags/NU.png', 0, '2017-10-03 19:08:49'),
(156, 158, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'NF', 'NFK', 574, 'flags/NF.png', 0, '2017-10-03 19:08:49'),
(157, 112, 'Won', 'KPW', '₩', '0.00000000', 0, ',', '.', '2', 'KP', 'PRK', 408, 'flags/KP.png', 0, '2017-10-03 19:08:49'),
(158, 159, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'MP', 'MNP', 580, 'flags/MP.png', 0, '2017-10-03 19:08:49'),
(159, 160, 'Krone', 'NOK', 'kr', '0.00000000', 0, ',', '.', '2', 'NO', 'NOR', 578, 'flags/NO.png', 0, '2017-10-03 19:08:49'),
(160, 161, 'Rial', 'OMR', '﷼', '0.00000000', 0, ',', '.', '2', 'OM', 'OMN', 512, 'flags/OM.png', 0, '2017-10-03 19:08:49'),
(161, 162, 'Rupee', 'PKR', '₨', '0.00000000', 0, ',', '.', '2', 'PK', 'PAK', 586, 'flags/PK.png', 0, '2017-10-03 19:08:49'),
(162, 163, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'PW', 'PLW', 585, 'flags/PW.png', 0, '2017-10-03 19:08:49'),
(163, 0, 'Shekel', 'ILS', '₪', '0.00000000', 0, ',', '.', '2', 'PS', 'PSE', 275, 'flags/PS.png', 0, '2017-10-03 19:08:49'),
(164, 164, 'Balboa', 'PAB', 'B/.', '0.00000000', 0, ',', '.', '2', 'PA', 'PAN', 591, 'flags/PA.png', 0, '2017-10-03 19:08:49'),
(165, 165, 'Kina', 'PGK', '', '0.00000000', 0, ',', '.', '2', 'PG', 'PNG', 598, 'flags/PG.png', 0, '2017-10-03 19:08:49'),
(166, 166, 'Guarani', 'PYG', 'Gs', '0.00000000', 0, ',', '.', '2', 'PY', 'PRY', 600, 'flags/PY.png', 0, '2017-10-03 19:08:49'),
(167, 167, 'Sol', 'PEN', 'S/.', '0.00000000', 0, ',', '.', '2', 'PE', 'PER', 604, 'flags/PE.png', 0, '2017-10-03 19:08:49'),
(168, 168, 'Peso', 'PHP', 'Php', '0.00000000', 0, ',', '.', '2', 'PH', 'PHL', 608, 'flags/PH.png', 0, '2017-10-03 19:08:49'),
(169, 169, 'Dollar', 'NZD', '$', '0.00000000', 0, ',', '.', '2', 'PN', 'PCN', 612, 'flags/PN.png', 0, '2017-10-03 19:08:49'),
(170, 170, 'Zloty', 'PLN', 'zł', '0.00000000', 0, ',', '.', '2', 'PL', 'POL', 616, 'flags/PL.png', 0, '2017-10-03 19:08:49'),
(171, 171, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'PT', 'PRT', 620, 'flags/PT.png', 0, '2017-10-03 19:08:49'),
(172, 172, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'PR', 'PRI', 630, 'flags/PR.png', 0, '2017-10-03 19:08:49'),
(173, 173, 'Rial', 'QAR', '﷼', '0.00000000', 0, ',', '.', '2', 'QA', 'QAT', 634, 'flags/QA.png', 0, '2017-10-03 19:08:49'),
(174, 49, 'Franc', 'XAF', 'FCF', '0.00000000', 0, ',', '.', '2', 'CG', 'COG', 178, 'flags/CG.png', 0, '2017-10-03 19:08:49'),
(175, 174, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'RE', 'REU', 638, 'flags/RE.png', 0, '2017-10-03 19:08:49'),
(176, 175, 'Leu', 'RON', 'lei', '0.00000000', 0, ',', '.', '2', 'RO', 'ROU', 642, 'flags/RO.png', 0, '2017-10-03 19:08:49'),
(177, 176, 'Ruble', 'RUB', 'руб', '0.00000000', 0, ',', '.', '2', 'RU', 'RUS', 643, 'flags/RU.png', 0, '2017-10-03 19:08:49'),
(178, 177, 'Franc', 'RWF', '', '0.00000000', 0, ',', '.', '2', 'RW', 'RWA', 646, 'flags/RW.png', 0, '2017-10-03 19:08:49'),
(179, 179, 'Pound', 'SHP', '£', '0.00000000', 0, ',', '.', '2', 'SH', 'SHN', 654, 'flags/SH.png', 0, '2017-10-03 19:08:49'),
(180, 178, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'KN', 'KNA', 659, 'flags/KN.png', 0, '2017-10-03 19:08:49'),
(181, 179, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'LC', 'LCA', 662, 'flags/LC.png', 0, '2017-10-03 19:08:49'),
(182, 180, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'PM', 'SPM', 666, 'flags/PM.png', 0, '2017-10-03 19:08:49'),
(183, 180, 'Dollar', 'XCD', '$', '0.00000000', 0, ',', '.', '2', 'VC', 'VCT', 670, 'flags/VC.png', 0, '2017-10-03 19:08:49'),
(184, 181, 'Tala', 'WST', 'WS$', '0.00000000', 0, ',', '.', '2', 'WS', 'WSM', 882, 'flags/WS.png', 0, '2017-10-03 19:08:49'),
(185, 182, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'SM', 'SMR', 674, 'flags/SM.png', 0, '2017-10-03 19:08:49'),
(186, 183, 'Dobra', 'STD', 'Db', '0.00000000', 0, ',', '.', '2', 'ST', 'STP', 678, 'flags/ST.png', 0, '2017-10-03 19:08:49'),
(187, 184, 'Rial', 'SAR', '﷼', '0.00000000', 0, ',', '.', '2', 'SA', 'SAU', 682, 'flags/SA.png', 0, '2017-10-03 19:08:49'),
(188, 185, 'Franc', 'XOF', '', '0.00000000', 0, ',', '.', '2', 'SN', 'SEN', 686, 'flags/SN.png', 0, '2017-10-03 19:08:49'),
(189, 142, 'Dinar', 'RSD', 'Дин', '0.00000000', 0, ',', '.', '2', 'CS', 'SCG', 891, 'flags/CS.png', 0, '2017-10-03 19:08:49'),
(190, 186, 'Rupee', 'SCR', '₨', '0.00000000', 0, ',', '.', '2', 'SC', 'SYC', 690, 'flags/SC.png', 0, '2017-10-03 19:08:49'),
(191, 187, 'Leone', 'SLL', 'Le', '0.00000000', 0, ',', '.', '2', 'SL', 'SLE', 694, 'flags/SL.png', 0, '2017-10-03 19:08:49'),
(192, 188, 'Dollar', 'SGD', '$', '0.00000000', 0, ',', '.', '2', 'SG', 'SGP', 702, 'flags/SG.png', 0, '2017-10-03 19:08:49'),
(193, 189, 'Koruna', 'SKK', 'Sk', '0.00000000', 0, ',', '.', '2', 'SK', 'SVK', 703, 'flags/SK.png', 0, '2017-10-03 19:08:49'),
(194, 190, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'SI', 'SVN', 705, 'flags/SI.png', 0, '2017-10-03 19:08:49'),
(195, 191, 'Dollar', 'SBD', '$', '0.00000000', 0, ',', '.', '2', 'SB', 'SLB', 90, 'flags/SB.png', 0, '2017-10-03 19:08:49'),
(196, 192, 'Shilling', 'SOS', 'S', '0.00000000', 0, ',', '.', '2', 'SO', 'SOM', 706, 'flags/SO.png', 0, '2017-10-03 19:08:49'),
(197, 193, 'Rand', 'ZAR', 'R', '0.00000000', 0, ',', '.', '2', 'ZA', 'ZAF', 710, 'flags/ZA.png', 0, '2017-10-03 19:08:49'),
(198, 113, 'Pound', 'GBP', '£', '0.00000000', 0, ',', '.', '2', 'GS', 'SGS', 239, 'flags/GS.png', 0, '2017-10-03 19:08:49'),
(199, 194, 'Won', 'KRW', '₩', '0.00000000', 0, ',', '.', '2', 'KR', 'KOR', 410, 'flags/KR.png', 0, '2017-10-03 19:08:49'),
(200, 195, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'ES', 'ESP', 724, 'flags/ES.png', 0, '2017-10-03 19:08:49'),
(201, 196, 'Rupee', 'LKR', '₨', '0.00000000', 0, ',', '.', '2', 'LK', 'LKA', 144, 'flags/LK.png', 0, '2017-10-03 19:08:49'),
(202, 199, 'Dinar', 'SDD', '', '0.00000000', 0, ',', '.', '2', 'SD', 'SDN', 736, 'flags/SD.png', 0, '2017-10-03 19:08:49'),
(203, 200, 'Dollar', 'SRD', '$', '0.00000000', 0, ',', '.', '2', 'SR', 'SUR', 740, 'flags/SR.png', 0, '2017-10-03 19:08:49'),
(204, 0, 'Krone', 'NOK', 'kr', '0.00000000', 0, ',', '.', '2', 'SJ', 'SJM', 744, 'flags/SJ.png', 0, '2017-10-03 19:08:49'),
(205, 202, 'Lilangeni', 'SZL', '', '0.00000000', 0, ',', '.', '2', 'SZ', 'SWZ', 748, 'flags/SZ.png', 0, '2017-10-03 19:08:49'),
(206, 203, 'Krona', 'SEK', 'kr', '0.00000000', 0, ',', '.', '2', 'SE', 'SWE', 752, 'flags/SE.png', 0, '2017-10-03 19:08:49'),
(207, 204, 'Franc', 'CHF', 'CHF', '0.00000000', 0, ',', '.', '2', 'CH', 'CHE', 756, 'flags/CH.png', 0, '2017-10-03 19:08:49'),
(208, 205, 'Pound', 'SYP', '£', '0.00000000', 0, ',', '.', '2', 'SY', 'SYR', 760, 'flags/SY.png', 0, '2017-10-03 19:08:49'),
(209, 206, 'Dollar', 'TWD', 'NT$', '0.00000000', 0, ',', '.', '2', 'TW', 'TWN', 158, 'flags/TW.png', 0, '2017-10-03 19:08:49'),
(210, 207, 'Somoni', 'TJS', '', '0.00000000', 0, ',', '.', '2', 'TJ', 'TJK', 762, 'flags/TJ.png', 0, '2017-10-03 19:08:49'),
(211, 208, 'Shilling', 'TZS', '', '0.00000000', 0, ',', '.', '2', 'TZ', 'TZA', 834, 'flags/TZ.png', 0, '2017-10-03 19:08:49'),
(212, 209, 'Baht', 'THB', '฿', '0.00000000', 0, ',', '.', '2', 'TH', 'THA', 764, 'flags/TH.png', 0, '2017-10-03 19:08:49'),
(213, 210, 'Franc', 'XOF', '', '0.00000000', 0, ',', '.', '2', 'TG', 'TGO', 768, 'flags/TG.png', 0, '2017-10-03 19:08:49'),
(214, 211, 'Dollar', 'NZD', '$', '0.00000000', 0, ',', '.', '2', 'TK', 'TKL', 772, 'flags/TK.png', 0, '2017-10-03 19:08:49'),
(215, 212, 'Pa\'anga', 'TOP', 'T$', '0.00000000', 0, ',', '.', '2', 'TO', 'TON', 776, 'flags/TO.png', 0, '2017-10-03 19:08:49'),
(216, 213, 'Dollar', 'TTD', 'TT$', '0.00000000', 0, ',', '.', '2', 'TT', 'TTO', 780, 'flags/TT.png', 0, '2017-10-03 19:08:49'),
(217, 214, 'Dinar', 'TND', '', '0.00000000', 0, ',', '.', '2', 'TN', 'TUN', 788, 'flags/TN.png', 0, '2017-10-03 19:08:49'),
(218, 215, 'Lira', 'TRY', 'YTL', '0.00000000', 0, ',', '.', '2', 'TR', 'TUR', 792, 'flags/TR.png', 0, '2017-10-03 19:08:49'),
(219, 216, 'Manat', 'TMM', 'm', '0.00000000', 0, ',', '.', '2', 'TM', 'TKM', 795, 'flags/TM.png', 0, '2017-10-03 19:08:49'),
(220, 217, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'TC', 'TCA', 796, 'flags/TC.png', 0, '2017-10-03 19:08:49'),
(221, 218, 'Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'TV', 'TUV', 798, 'flags/TV.png', 0, '2017-10-03 19:08:49'),
(222, 232, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'VI', 'VIR', 850, 'flags/VI.png', 0, '2017-10-03 19:08:49'),
(223, 219, 'Shilling', 'UGX', '', '0.00000000', 0, ',', '.', '2', 'UG', 'UGA', 800, 'flags/UG.png', 0, '2017-10-03 19:08:49'),
(224, 220, 'Hryvnia', 'UAH', '₴', '0.00000000', 0, ',', '.', '2', 'UA', 'UKR', 804, 'flags/UA.png', 0, '2017-10-03 19:08:49'),
(225, 221, 'Dirham', 'AED', '', '0.00000000', 0, ',', '.', '2', 'AE', 'ARE', 784, 'flags/AE.png', 0, '2017-10-03 19:08:49'),
(226, 222, 'Pound', 'GBP', '£', '0.00000000', 0, ',', '.', '2', 'GB', 'GBR', 826, 'flags/GB.png', 1, '2017-10-03 19:08:49'),
(227, 223, 'Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'US', 'USA', 840, 'flags/US.png', 0, '2017-10-03 19:08:49'),
(228, 224, 'Dollar ', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'UM', 'UMI', 581, 'flags/UM.png', 0, '2017-10-03 19:08:49'),
(229, 225, 'Peso', 'UYU', '$U', '0.00000000', 0, ',', '.', '2', 'UY', 'URY', 858, 'flags/UY.png', 0, '2017-10-03 19:08:49'),
(230, 226, 'Som', 'UZS', 'лв', '0.00000000', 0, ',', '.', '2', 'UZ', 'UZB', 860, 'flags/UZ.png', 0, '2017-10-03 19:08:49'),
(231, 227, 'Vatu', 'VUV', 'Vt', '0.00000000', 0, ',', '.', '2', 'VU', 'VUT', 548, 'flags/VU.png', 0, '2017-10-03 19:08:49'),
(232, 228, 'Euro', 'EUR', '€', '0.00000000', 0, ',', '.', '2', 'VA', 'VAT', 336, 'flags/VA.png', 0, '2017-10-03 19:08:49'),
(233, 229, 'Bolivar', 'VEF', 'Bs', '0.00000000', 0, ',', '.', '2', 'VE', 'VEN', 862, 'flags/VE.png', 0, '2017-10-03 19:08:49'),
(234, 230, 'Dong', 'VND', '₫', '0.00000000', 0, ',', '.', '2', 'VN', 'VNM', 704, 'flags/VN.png', 0, '2017-10-03 19:08:49'),
(235, 233, 'Franc', 'XPF', '', '0.00000000', 0, ',', '.', '2', 'WF', 'WLF', 876, 'flags/WF.png', 0, '2017-10-03 19:08:49'),
(236, 234, 'Dirham', 'MAD', '', '0.00000000', 0, ',', '.', '2', 'EH', 'ESH', 732, 'flags/EH.png', 0, '2017-10-03 19:08:49'),
(237, 235, 'Rial', 'YER', '﷼', '0.00000000', 0, ',', '.', '2', 'YE', 'YEM', 887, 'flags/YE.png', 0, '2017-10-03 19:08:49'),
(238, 238, 'Kwacha', 'ZMK', 'ZK', '0.00000000', 0, ',', '.', '2', 'ZM', 'ZMB', 894, 'flags/ZM.png', 0, '2017-10-03 19:08:49'),
(239, 239, 'Dollar', 'ZWD', 'Z$', '0.00000000', 0, ',', '.', '2', 'ZW', 'ZWE', 716, 'flags/ZW.png', 0, '2017-10-03 19:08:49');

-- --------------------------------------------------------

--
-- Table structure for table `ti_customers`
--

CREATE TABLE `ti_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `security_question_id` int(11) DEFAULT NULL,
  `security_answer` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `customer_group_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_customers_online`
--

CREATE TABLE `ti_customers_online` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `access_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_uri` text COLLATE utf8mb4_unicode_ci,
  `referrer_uri` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_customer_groups`
--

CREATE TABLE `ti_customer_groups` (
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `approval` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_customer_groups`
--

INSERT INTO `ti_customer_groups` (`customer_group_id`, `group_name`, `description`, `approval`) VALUES
(1, 'Default group', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_extensions`
--

CREATE TABLE `ti_extensions` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `serialized` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '1.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_extensions`
--

INSERT INTO `ti_extensions` (`extension_id`, `type`, `name`, `data`, `serialized`, `status`, `title`, `version`) VALUES
(1, 'module', 'igniter.frontend', NULL, 1, 1, 'FrontEnd', 'v1.2.0'),
(2, 'module', 'igniter.payregister', NULL, 1, 1, 'Pay Register', 'v1.2.0'),
(3, 'module', 'igniter.reservation', NULL, 1, 1, 'Reservation', 'v1.1.0-beta.7'),
(4, 'module', 'igniter.cart', NULL, 1, 1, 'Cart', 'v2.0.0-beta.9'),
(5, 'module', 'igniter.pages', NULL, 1, 1, 'Pages', 'v1.2.0-beta.6'),
(6, 'module', 'igniter.user', NULL, 1, 1, 'User', 'v1.1.0-beta.7'),
(7, 'module', 'igniter.local', NULL, 1, 1, 'Local', 'v1.2.0-beta.10'),
(8, 'module', 'igniter.demo', NULL, 1, 0, 'Demo Extension', '1.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `ti_extension_settings`
--

CREATE TABLE `ti_extension_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_failed_jobs`
--

CREATE TABLE `ti_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_cart_cart`
--

CREATE TABLE `ti_igniter_cart_cart` (
  `identifier` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_frontend_subscribers`
--

CREATE TABLE `ti_igniter_frontend_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statistics` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_jobs`
--

CREATE TABLE `ti_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_languages`
--

CREATE TABLE `ti_languages` (
  `language_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idiom` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `original_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_languages`
--

INSERT INTO `ti_languages` (`language_id`, `code`, `name`, `image`, `idiom`, `status`, `can_delete`, `original_id`) VALUES
(1, 'en', 'English', 'flags/gb.png', 'english', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_language_translations`
--

CREATE TABLE `ti_language_translations` (
  `translation_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unstable` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_layouts`
--

CREATE TABLE `ti_layouts` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_layout_modules`
--

CREATE TABLE `ti_layout_modules` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `module_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partial` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL,
  `alias` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_layout_routes`
--

CREATE TABLE `ti_layout_routes` (
  `layout_route_id` int(10) UNSIGNED NOT NULL,
  `layout_id` int(11) NOT NULL,
  `uri_route` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_locationables`
--

CREATE TABLE `ti_locationables` (
  `location_id` int(11) NOT NULL,
  `locationable_id` int(11) NOT NULL,
  `locationable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_locationables`
--

INSERT INTO `ti_locationables` (`location_id`, `locationable_id`, `locationable_type`, `options`) VALUES
(2, 12, 'menus', '');

-- --------------------------------------------------------

--
-- Table structure for table `ti_locations`
--

CREATE TABLE `ti_locations` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `location_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location_address_1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country_id` int(11) DEFAULT NULL,
  `location_telephone` text COLLATE utf8mb4_unicode_ci,
  `location_lat` double DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
  `location_radius` int(11) DEFAULT NULL,
  `offer_delivery` tinyint(1) DEFAULT NULL,
  `offer_collection` tinyint(1) DEFAULT NULL,
  `delivery_time` int(11) DEFAULT NULL,
  `last_order_time` int(11) DEFAULT NULL,
  `reservation_time_interval` int(11) DEFAULT NULL,
  `reservation_stay_time` int(11) DEFAULT NULL,
  `location_status` tinyint(1) DEFAULT NULL,
  `collection_time` int(11) DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `location_image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_locations`
--

INSERT INTO `ti_locations` (`location_id`, `location_name`, `location_email`, `description`, `location_address_1`, `location_address_2`, `location_city`, `location_state`, `location_postcode`, `location_country_id`, `location_telephone`, `location_lat`, `location_lng`, `location_radius`, `offer_delivery`, `offer_collection`, `delivery_time`, `last_order_time`, `reservation_time_interval`, `reservation_stay_time`, `location_status`, `collection_time`, `options`, `location_image`, `permalink_slug`) VALUES
(1, 'Default', 'admin@restaurant.com', NULL, 'Broad Ln', NULL, 'Coventry', NULL, NULL, 222, '8765456789', 52.415884, -1.603648, NULL, 1, 1, 15, NULL, 15, 45, 1, 15, 'a:1:{s:5:\"hours\";a:3:{s:7:\"opening\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}s:8:\"delivery\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}s:10:\"collection\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}}}', NULL, 'default'),
(2, 'MyRestro', 'testtttest@test.com', '', 'Test', 'test', 'Mumbai', 'Maharashtra', '400101', 99, '900009000', 0, 0, NULL, 1, 1, 0, 0, 0, 0, 1, 0, 'a:6:{s:12:\"auto_lat_lng\";s:1:\"1\";s:13:\"future_orders\";s:1:\"0\";s:17:\"future_order_days\";a:2:{s:8:\"delivery\";s:1:\"5\";s:10:\"collection\";s:1:\"5\";}s:17:\"offer_reservation\";s:1:\"1\";s:5:\"hours\";a:3:{s:7:\"opening\";a:5:{s:4:\"type\";s:5:\"daily\";s:4:\"days\";a:7:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"4\";i:5;s:1:\"5\";i:6;s:1:\"6\";}s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:8:\"flexible\";a:7:{i:0;a:4:{s:3:\"day\";s:1:\"0\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:1;a:4:{s:3:\"day\";s:1:\"1\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:2;a:4:{s:3:\"day\";s:1:\"2\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:3;a:4:{s:3:\"day\";s:1:\"3\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:4;a:4:{s:3:\"day\";s:1:\"4\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:5;a:4:{s:3:\"day\";s:1:\"5\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:6;a:4:{s:3:\"day\";s:1:\"6\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}}}s:8:\"delivery\";a:5:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:7:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"4\";i:5;s:1:\"5\";i:6;s:1:\"6\";}s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:8:\"flexible\";a:7:{i:0;a:4:{s:3:\"day\";s:1:\"0\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:1;a:4:{s:3:\"day\";s:1:\"1\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:2;a:4:{s:3:\"day\";s:1:\"2\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:3;a:4:{s:3:\"day\";s:1:\"3\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:4;a:4:{s:3:\"day\";s:1:\"4\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:5;a:4:{s:3:\"day\";s:1:\"5\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:6;a:4:{s:3:\"day\";s:1:\"6\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}}}s:10:\"collection\";a:5:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:7:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"4\";i:5;s:1:\"5\";i:6;s:1:\"6\";}s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:8:\"flexible\";a:7:{i:0;a:4:{s:3:\"day\";s:1:\"0\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:1;a:4:{s:3:\"day\";s:1:\"1\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:2;a:4:{s:3:\"day\";s:1:\"2\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:3;a:4:{s:3:\"day\";s:1:\"3\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:4;a:4:{s:3:\"day\";s:1:\"4\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:5;a:4:{s:3:\"day\";s:1:\"5\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}i:6;a:4:{s:3:\"day\";s:1:\"6\";s:4:\"open\";s:5:\"00:00\";s:5:\"close\";s:5:\"23:59\";s:6:\"status\";s:1:\"1\";}}}}s:7:\"gallery\";a:2:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";}}', NULL, 'myrestro');

-- --------------------------------------------------------

--
-- Table structure for table `ti_location_areas`
--

CREATE TABLE `ti_location_areas` (
  `area_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boundaries` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_location_areas`
--

INSERT INTO `ti_location_areas` (`area_id`, `location_id`, `name`, `type`, `boundaries`, `conditions`, `color`, `is_default`) VALUES
(1, 1, 'Area 1', 'circle', 'a:3:{s:7:\"polygon\";N;s:8:\"vertices\";N;s:6:\"circle\";s:47:\"{\"lat\":52.415884,\"lng\":-1.603648,\"radius\":1500}\";}', 'a:1:{i:0;a:4:{s:8:\"priority\";i:1;s:6:\"amount\";i:10;s:4:\"type\";s:3:\"all\";s:5:\"total\";i:0;}}', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_location_tables`
--

CREATE TABLE `ti_location_tables` (
  `location_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_location_tables`
--

INSERT INTO `ti_location_tables` (`location_id`, `table_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_templates`
--

CREATE TABLE `ti_mail_templates` (
  `template_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` text COLLATE utf8mb4_unicode_ci,
  `plain_layout` text COLLATE utf8mb4_unicode_ci,
  `layout_css` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_mail_templates`
--

INSERT INTO `ti_mail_templates` (`template_id`, `name`, `language_id`, `date_added`, `date_updated`, `status`, `code`, `layout`, `plain_layout`, `layout_css`) VALUES
(1, 'New Default Layout', 0, '2019-08-15 02:47:47', '2019-08-15 02:47:47', 0, 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width\"/>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n    <style type=\"text/css\">{layout_css}</style>\n</head>\n<body bgcolor=\"#FFFFFF\">\n    {body}\n</body>\n</html>', '{body}', '/* -------------------------------------\n		GLOBAL\n------------------------------------- */\n* {\n	margin: 0;\n	padding: 0;\n}\n* { font-family: \"Helvetica Neue\", \"Helvetica\", Helvetica, Arial, sans-serif; }\nimg {\n	max-width: 100%;\n}\n.collapse {\n	margin: 0;\n	padding: 0;\n}\nbody {\n	-webkit-font-smoothing: antialiased;\n	-webkit-text-size-adjust: none;\n	width: 100% !important;\n	height: 100%;\n}\n/* -------------------------------------\n		HEADER\n------------------------------------- */\ntable.head-wrap { width: 100%;}\n.header.container table td.logo { padding: 15px; }\n.header.container table td.label { padding: 15px; padding-left: 0px;}\n/* -------------------------------------\n		BODY\n------------------------------------- */\ntable.body-wrap { width: 100%;}\n/* -------------------------------------\n		FOOTER\n------------------------------------- */\ntable.footer-wrap { width: 100%; clear: both !important;\n}\n.footer-wrap .container td.content p { border-top: 1px solid rgb(215, 215, 215); padding-top: 15px;}\n.footer-wrap .container td.content p {\n	font-size: 10px;\n	font-weight: bold;\n}\n/* -------------------------------------\n		TYPOGRAPHY\n------------------------------------- */\nh1, h2, h3, h4, h5, h6 {\n	font-family: \"HelveticaNeue-Light\", \"Helvetica Neue Light\", \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif; line-height: 1.1; margin-bottom: 15px; color: #000;\n}\nh1 small, h2 small, h3 small, h4 small, h5 small, h6 small { font-size: 60%; color: #6F6F6F; line-height: 0; text-transform: none; }\nh1 { font-weight: 200; font-size: 44px;}\nh2 { font-weight: 200; font-size: 37px;}\nh3 { font-weight: 500; font-size: 27px;}\nh4 { font-weight: 500; font-size: 23px;}\nh5 { font-weight: 900; font-size: 17px;}\nh6 { font-weight: 900; font-size: 14px; text-transform: uppercase; color: #444;}\n.collapse { margin: 0 !important;}\np, ul {\n	margin-bottom: 10px;\n	font-weight: normal;\n	font-size: 14px;\n	line-height: 1.6;\n}\np.lead { font-size: 17px; }\np.last { margin-bottom: 0px;}\nul li {\n	margin-left: 5px;\n	list-style-position: inside;\n}\n/* -------------------------------------\n		ELEMENTS\n------------------------------------- */\na { color: #2BA6CB;}\n.btn {\n	text-decoration: none;\n	color: #FFF;\n	background-color: #666;\n	padding: 10px 16px;\n	font-weight: bold;\n	margin-right: 10px;\n	text-align: center;\n	cursor: pointer;\n	display: inline-block;\n}\np.callout {\n	padding: 15px;\n	background-color: #ECF8FF;\n	margin-bottom: 15px;\n}\n.callout a {\n	font-weight: bold;\n	color: #2BA6CB;\n}\n/* ---------------------------------------------------\n	RESPONSIVENESS\n------------------------------------------------------ */\n\n.container {\n	display: block !important;\n	max-width: 600px !important;\n	margin: 0 auto !important;\n	clear: both !important;\n}\n.content {\n	padding: 15px;\n	max-width: 600px;\n	margin: 0 auto;\n	display: block;\n}\n.content table { width: 100%; }\n.column {\n	width: 300px;\n	float: left;\n}\n.column tr td { padding: 15px; }\n.column-wrap {\n	padding: 0 !important;\n	margin: 0 auto;\n	max-width: 600px !important;\n}\n.column table { width: 100%;}\n.clear { display: block; clear: both; }\n/* -------------------------------------------\n		MOBILE\n		For clients that support media queries.\n		Nothing fancy.\n-------------------------------------------- */\n@media only screen and (max-width: 600px) {\n\n	a[class=\"btn\"] { display: block !important; margin-bottom: 10px !important; background-image: none !important; margin-right: 0 !important;}\n	div[class=\"column\"] { width: auto !important; float: none !important;}\n	table.social div[class=\"column\"] {\n		width: auto !important;\n	}\n\n}');

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_templates_data`
--

CREATE TABLE `ti_mail_templates_data` (
  `template_data_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` text COLLATE utf8mb4_unicode_ci,
  `plain_body` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_mail_templates_data`
--

INSERT INTO `ti_mail_templates_data` (`template_data_id`, `template_id`, `code`, `subject`, `body`, `date_added`, `date_updated`, `label`, `is_custom`, `plain_body`) VALUES
(1, 1, 'admin::_mail.order_update', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'lang:system::lang.mail_templates.text_order_update', '0', NULL),
(2, 1, 'admin::_mail.reservation_update', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'lang:system::lang.mail_templates.text_reservation_update', '0', NULL),
(3, 1, 'admin::_mail.password_reset', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'lang:system::lang.mail_templates.text_password_reset_alert', '0', NULL),
(4, 1, 'admin::_mail.password_reset_request', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'lang:system::lang.mail_templates.text_password_reset_request_alert', '0', NULL),
(5, 1, 'igniter.cart::mail.order', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Order confirmation email to customer', '0', NULL),
(6, 1, 'igniter.cart::mail.order_alert', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'New order alert email to admin', '0', NULL),
(7, 1, 'igniter.frontend::mail.contact', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Contact form email to admin', '0', NULL),
(8, 1, 'igniter.reservation::mail.reservation', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Reservation confirmation email to customer', '0', NULL),
(9, 1, 'igniter.reservation::mail.reservation_alert', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'New reservation alert email to admin', '0', NULL),
(10, 1, 'igniter.user::mail.password_reset', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Password reset email to customer', '0', NULL),
(11, 1, 'igniter.user::mail.password_reset_request', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Password reset request email to customer', '0', NULL),
(12, 1, 'igniter.user::mail.registration', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Registration email to customer', '0', NULL),
(13, 1, 'igniter.user::mail.registration_alert', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Registration email to admin', '0', NULL),
(14, 1, 'igniter.user::mail.activation', '', '', '2019-08-18 17:12:10', '2019-08-18 17:12:10', 'Registration activation email to customer', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_mealtimes`
--

CREATE TABLE `ti_mealtimes` (
  `mealtime_id` int(11) NOT NULL,
  `mealtime_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  `mealtime_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_mealtimes`
--

INSERT INTO `ti_mealtimes` (`mealtime_id`, `mealtime_name`, `start_time`, `end_time`, `mealtime_status`) VALUES
(1, 'Breakfast', '07:00:00', '10:00:00', 1),
(2, 'Lunch', '12:00:00', '14:30:00', 1),
(3, 'Dinner', '18:00:00', '20:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_media_attachments`
--

CREATE TABLE `ti_media_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `custom_properties` text COLLATE utf8mb4_unicode_ci,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menus`
--

CREATE TABLE `ti_menus` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_price` decimal(15,4) NOT NULL,
  `menu_photo` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_category_id` int(11) NOT NULL,
  `stock_qty` int(11) NOT NULL DEFAULT '0',
  `minimum_qty` int(11) NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `mealtime_id` int(11) DEFAULT NULL,
  `menu_status` tinyint(1) NOT NULL,
  `menu_priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_menus`
--

INSERT INTO `ti_menus` (`menu_id`, `menu_name`, `menu_description`, `menu_price`, `menu_photo`, `menu_category_id`, `stock_qty`, `minimum_qty`, `subtract_stock`, `mealtime_id`, `menu_status`, `menu_priority`) VALUES
(1, 'Puff-Puff', 'Traditional Nigerian donut ball, rolled in sugar', '4.9900', NULL, 0, 1000, 3, 1, NULL, 1, 0),
(2, 'SCOTCH EGG', 'Boiled egg wrapped in a ground meat mixture, coated in breadcrumbs, and deep-fried.', '2.0000', NULL, 0, 1000, 1, 1, NULL, 1, 0),
(3, 'ATA RICE', 'Small pieces of beef, goat, stipe, and tendon sautéed in crushed green Jamaican pepper.', '12.0000', NULL, 0, 1000, 1, 0, NULL, 1, 0),
(4, 'RICE AND DODO', '(plantains) w/chicken, fish, beef or goat', '11.9900', NULL, 0, 1000, 1, 1, NULL, 1, 0),
(5, 'Special Shrimp Deluxe', 'Fresh shrimp sautéed in blended mixture of tomatoes, onion, peppers over choice of rice', '12.9900', NULL, 0, 1000, 1, 1, NULL, 1, 0),
(6, 'Whole catfish with rice and vegetables', 'Whole catfish slow cooked in tomatoes, pepper and onion sauce with seasoning to taste', '13.9900', NULL, 0, 1000, 1, 1, NULL, 1, 0),
(7, 'African Salad', 'With baked beans, egg, tuna, onion, tomatoes , green peas and carrot with your choice of dressing.', '8.9900', NULL, 0, 500, 1, 0, NULL, 1, 0),
(8, 'Seafood Salad', 'With shrimp, egg and imitation crab meat', '5.9900', NULL, 0, 1000, 1, 0, NULL, 1, 0),
(9, 'EBA', 'Grated cassava', '11.9900', NULL, 0, 335, 1, 1, NULL, 1, 0),
(10, 'AMALA', 'Yam flour', '11.9900', NULL, 0, 405, 1, 1, NULL, 1, 0),
(11, 'YAM PORRIDGE', 'in tomatoes sauce', '9.9900', NULL, 0, 448, 1, 1, NULL, 1, 0),
(12, 'Boiled Plantain', 'w/spinach soup', '9.9900', NULL, 0, 431, 1, 1, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_menus_specials`
--

CREATE TABLE `ti_menus_specials` (
  `special_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `special_price` decimal(15,4) DEFAULT NULL,
  `special_status` tinyint(1) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_every` text COLLATE utf8mb4_unicode_ci,
  `recurring_from` time DEFAULT NULL,
  `recurring_to` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_menus_specials`
--

INSERT INTO `ti_menus_specials` (`special_id`, `menu_id`, `start_date`, `end_date`, `special_price`, `special_status`, `type`, `validity`, `recurring_every`, `recurring_from`, `recurring_to`) VALUES
(1, 12, NULL, NULL, '0.0000', 0, 'F', 'forever', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_categories`
--

CREATE TABLE `ti_menu_categories` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_options`
--

CREATE TABLE `ti_menu_options` (
  `menu_option_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_menu_options`
--

INSERT INTO `ti_menu_options` (`menu_option_id`, `option_id`, `menu_id`, `required`, `priority`) VALUES
(1, 4, 1, 0, 0),
(2, 3, 2, 0, 0),
(3, 2, 3, 0, 0),
(4, 3, 3, 0, 0),
(5, 2, 4, 0, 0),
(6, 3, 4, 0, 0),
(7, 3, 5, 0, 0),
(8, 2, 10, 0, 0),
(9, 4, 10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_option_values`
--

CREATE TABLE `ti_menu_option_values` (
  `menu_option_value_id` int(11) NOT NULL,
  `menu_option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `new_price` decimal(15,4) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_menu_option_values`
--

INSERT INTO `ti_menu_option_values` (`menu_option_value_id`, `menu_option_id`, `option_value_id`, `new_price`, `quantity`, `subtract_stock`, `priority`, `is_default`) VALUES
(1, 1, 9, '0.0000', 0, 0, 1, NULL),
(2, 1, 10, '0.0000', 0, 0, 2, NULL),
(3, 2, 7, '0.0000', 0, 0, 1, NULL),
(4, 2, 8, '5.0000', 0, 0, 2, NULL),
(5, 3, 4, '4.9500', 0, 0, 4, NULL),
(6, 3, 5, '4.9500', 0, 0, 2, NULL),
(7, 3, 6, '6.9500', 0, 0, 3, NULL),
(8, 4, 7, '0.0000', 0, 0, 1, NULL),
(9, 4, 8, '5.0000', 0, 0, 2, NULL),
(10, 5, 4, '4.9500', 0, 0, 4, NULL),
(11, 5, 5, '4.9500', 0, 0, 2, NULL),
(12, 5, 6, '6.9500', 0, 0, 3, NULL),
(13, 6, 7, '0.0000', 0, 0, 1, NULL),
(14, 6, 8, '5.0000', 0, 0, 2, NULL),
(15, 7, 7, '0.0000', 0, 0, 1, NULL),
(16, 7, 8, '5.0000', 0, 0, 2, NULL),
(17, 8, 4, '4.9500', 0, 0, 4, NULL),
(18, 8, 5, '4.9500', 0, 0, 2, NULL),
(19, 8, 6, '6.9500', 0, 0, 3, NULL),
(20, 9, 9, '0.0000', 0, 0, 1, NULL),
(21, 9, 10, '0.0000', 0, 0, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_messages`
--

CREATE TABLE `ti_messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `send_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sender_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_message_meta`
--

CREATE TABLE `ti_message_meta` (
  `message_meta_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `item` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `messagable_id` int(11) NOT NULL,
  `messagable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_deleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_migrations`
--

CREATE TABLE `ti_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_migrations`
--

INSERT INTO `ti_migrations` (`id`, `group`, `migration`, `batch`) VALUES
(1, 'System', '2015_03_25_000001_create_tables', 1),
(2, 'System', '2016_11_29_000300_optimize_tables_columns', 1),
(3, 'System', '2017_04_13_000300_modify_columns_on_users_and_customers_tables', 1),
(4, 'System', '2017_05_08_000300_add_columns', 1),
(5, 'System', '2017_06_11_000300_create_payments_and_payment_logs_table', 1),
(6, 'System', '2017_08_23_000300_create_themes_table', 1),
(7, 'System', '2017_09_19_000300_add_columns_on_messages_table', 1),
(8, 'System', '2018_01_23_000300_create_language_translations_table', 1),
(9, 'System', '2018_03_30_000300_create_extension_settings_table', 1),
(10, 'System', '2018_06_12_000300_rename_model_class_names_to_morph_map_custom_names', 1),
(11, 'System', '2018_10_19_000300_create_media_attachments_table', 1),
(12, 'System', '2018_10_21_131033_create_queue_table', 1),
(13, 'System', '2018_10_21_131044_create_sessions_table', 1),
(14, 'System', '2019_04_16_000300_nullify_customer_id_on_addresses_table', 1),
(15, 'System', '2019_07_01_000300_delete_unused_columns_from_activities_table', 1),
(16, 'Admin', '2017_08_25_000300_create_location_areas_table', 1),
(17, 'Admin', '2017_08_25_000300_create_menu_categories_table', 1),
(18, 'Admin', '2018_01_19_000300_add_hash_columns_on_orders_reservations_table', 1),
(19, 'Admin', '2018_04_06_000300_drop_unique_on_order_totals_table', 1),
(20, 'Admin', '2018_04_12_000300_modify_columns_on_orders_reservations_table', 1),
(21, 'Admin', '2018_05_21_000300_drop_redundant_columns_on_kitchen_tables', 1),
(22, 'Admin', '2018_05_29_000300_add_columns_on_location_areas_table', 1),
(23, 'Admin', '2018_06_12_000300_create_locationables_table', 1),
(24, 'Admin', '2018_07_04_000300_create_user_preferences_table', 1),
(25, 'Admin', '2018_10_09_000300_auto_increment_on_order_totals_table', 1),
(26, 'Admin', '2019_04_09_000300_auto_increment_on_user_preferences_table', 1),
(27, 'Admin', '2019_07_02_000300_add_columns_on_menu_specials_table', 1),
(28, 'Admin', '2019_07_16_000300_create_reservation_tables_table', 1),
(29, 'Admin', '2019_07_21_000300_change_sort_value_ratings_to_config_on_settings_table', 1),
(30, 'igniter.frontend', '2018_01_28_000300_create_subscribers_table', 1),
(31, 'igniter.frontend', '2018_06_28_000300_create_banners_table', 1),
(32, 'igniter.cart', '2017_10_20_000100_create_conditions_settings', 1),
(33, 'igniter.cart', '2017_11_20_010000_create_cart_table', 1),
(34, 'igniter.cart', '2018_09_20_010000_rename_content_field_on_cart_table', 1),
(35, 'igniter.pages', '2018_06_28_000300_create_pages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_options`
--

CREATE TABLE `ti_options` (
  `option_id` int(11) NOT NULL,
  `option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_options`
--

INSERT INTO `ti_options` (`option_id`, `option_name`, `display_type`, `priority`) VALUES
(1, 'Toppings', 'checkbox', 0),
(2, 'Sides', 'checkbox', 0),
(3, 'Size', 'radio', 0),
(4, 'Drinks', 'checkbox', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_option_values`
--

CREATE TABLE `ti_option_values` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_option_values`
--

INSERT INTO `ti_option_values` (`option_value_id`, `option_id`, `value`, `price`, `priority`) VALUES
(1, 1, 'Peperoni', '1.9900', 2),
(2, 1, 'Jalapenos', '3.9900', 1),
(3, 1, 'Sweetcorn', '1.9900', 3),
(4, 2, 'Meat', '4.9500', 4),
(5, 2, 'Fish', '4.9500', 2),
(6, 2, 'Beef', '6.9500', 3),
(7, 3, 'Small', '0.0000', 1),
(8, 3, 'Large', '5.0000', 2),
(9, 4, 'Coke', '0.0000', 1),
(10, 4, 'Diet Coke', '0.0000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ti_orders`
--

CREATE TABLE `ti_orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `payment` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `order_time` time NOT NULL,
  `order_date` date NOT NULL,
  `order_total` decimal(15,4) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `invoice_no` int(11) DEFAULT NULL,
  `invoice_prefix` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_menus`
--

CREATE TABLE `ti_order_menus` (
  `order_menu_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `subtotal` decimal(15,4) DEFAULT NULL,
  `option_values` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_options`
--

CREATE TABLE `ti_order_options` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `order_option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_option_price` decimal(15,4) DEFAULT NULL,
  `order_menu_id` int(11) NOT NULL,
  `order_menu_option_id` int(11) NOT NULL,
  `menu_option_value_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_totals`
--

CREATE TABLE `ti_order_totals` (
  `order_total_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_pages`
--

CREATE TABLE `ti_pages` (
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `navigation` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_payments`
--

CREATE TABLE `ti_payments` (
  `payment_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_payment_logs`
--

CREATE TABLE `ti_payment_logs` (
  `payment_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_permalinks`
--

CREATE TABLE `ti_permalinks` (
  `permalink_id` int(11) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_permissions`
--

CREATE TABLE `ti_permissions` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_permissions`
--

INSERT INTO `ti_permissions` (`permission_id`, `name`, `description`, `action`, `status`, `is_custom`) VALUES
(1, 'Admin.Banners', 'Ability to access, manage, add and delete banners', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(2, 'Admin.Categories', 'Ability to access, manage, add and delete categories', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(3, 'Site.Countries', 'Ability to manage, add and delete site countries', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(4, 'Admin.Coupons', 'Ability to access, manage, add and delete coupons', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(5, 'Site.Currencies', 'Ability to access, manage, add and delete site currencies', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(6, 'Admin.CustomerGroups', 'Ability to access, manage, add and delete customer groups', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(7, 'Admin.Customers', 'Ability to access, manage, add and delete customers', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(8, 'Admin.CustomersOnline', 'Ability to access online customers', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(9, 'Admin.Maintenance', 'Ability to access, backup, restore and migrate database', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(10, 'Admin.ErrorLogs', 'Ability to access and delete error logs file', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(11, 'Admin.Extensions', 'Ability to access, manage, add and delete extension', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(12, 'Admin.MediaManager', 'Ability to access, manage, add and delete media items', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(13, 'Site.Languages', 'Ability to manage, add and delete site languages', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(14, 'Admin.Locations', 'Ability to access, manage, add and delete locations', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(15, 'Admin.MailTemplates', 'Ability to access, manage, add and delete mail templates', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(16, 'Admin.Menus', 'Ability to access, manage, add and delete menu items', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(17, 'Admin.Messages', 'Ability to add and delete messages', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(18, 'Admin.Orders', 'Ability to access, manage, add and delete orders', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(19, 'Site.Pages', 'Ability to manage, add and delete site pages', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(20, 'Admin.Payments', 'Ability to access, add and delete extension payments', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(21, 'Admin.Permissions', 'Ability to manage, add and delete staffs permissions', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(22, 'Admin.Reservations', 'Ability to access, manage, add and delete reservations', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(23, 'Admin.Reviews', 'Ability to access, manage, add and delete user reviews', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(24, 'Site.Settings', 'Ability to manage system settings', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(25, 'Admin.StaffGroups', 'Ability to access, manage, add and delete staff groups', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(26, 'Admin.Staffs', 'Ability to access, manage, add and delete staffs', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(27, 'Admin.Statuses', 'Ability to access, manage, add and delete orders and reservations statuses', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(28, 'Admin.Tables', 'Ability to access, manage, add and delete reservations tables', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(29, 'Site.Themes', 'Ability to access, manage site themes', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(30, 'Site.Updates', 'Ability to apply updates when a new version of TastyIgniter is available', 'a:1:{i:0;s:3:\"add\";}', 1, 1),
(31, 'Admin.Mealtimes', 'Ability to access, manage, add and delete mealtimes', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(32, 'Admin.Activities', 'Ability to access activities', 'a:4:{i:0;s:6:\"access\";i:1;s:6:\"manage\";i:2;s:3:\"add\";i:3;s:6:\"delete\";}', 1, 1),
(33, 'Module.CartModule', 'Ability to manage cart module', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(34, 'Module.BannersModule', 'Ability to manage banners module', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(35, 'Module.Slideshow', 'Ability to manage homepage slide show module', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(36, 'Module.FeaturedItems', 'Ability to manage featured menu module', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(37, 'Module.LocalModule', 'Ability to manage local extension settings', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(38, 'Module.Pages', 'Ability to manage local extension settings', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(39, 'Payment.Cod', 'Ability to manage cash on delivery payment', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(40, 'Payment.PaypalExpress', 'Ability to manage paypal express payment', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(41, 'Payment.AuthorizeNetAIM', 'Ability to manage Authorize.Net payment extension', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0),
(42, 'Payment.Stripe', 'Ability to manage Stripe payment extension', 'a:4:{i:0;s:6:\"access\";i:1;s:3:\"add\";i:2;s:6:\"manage\";i:3;s:6:\"delete\";}', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_pp_payments`
--

CREATE TABLE `ti_pp_payments` (
  `transaction_id` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `serialized` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reservations`
--

CREATE TABLE `ti_reservations` (
  `reservation_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `guest_num` int(11) NOT NULL,
  `occasion_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `reserve_time` time NOT NULL,
  `reserve_date` date NOT NULL,
  `date_added` date NOT NULL,
  `date_modified` date NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reservation_tables`
--

CREATE TABLE `ti_reservation_tables` (
  `reservation_id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reviews`
--

CREATE TABLE `ti_reviews` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sale_id` int(11) NOT NULL,
  `sale_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `delivery` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `review_text` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `review_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_security_questions`
--

CREATE TABLE `ti_security_questions` (
  `question_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_sessions`
--

CREATE TABLE `ti_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_settings`
--

CREATE TABLE `ti_settings` (
  `setting_id` int(11) NOT NULL,
  `sort` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `serialized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_settings`
--

INSERT INTO `ti_settings` (`setting_id`, `sort`, `item`, `value`, `serialized`) VALUES
(1, 'prefs', 'mail_template_id', '11', NULL),
(3, 'config', 'site_desc', '', NULL),
(4, 'config', 'search_radius', '20', NULL),
(5, 'config', 'ready_time', '45', NULL),
(6, 'prefs', 'default_location_id', '2', NULL),
(7, 'config', 'site_logo', 'no_photo.png', NULL),
(8, 'config', 'country_id', '99', NULL),
(9, 'config', 'timezone', 'Europe/London', NULL),
(10, 'config', 'currency_id', '226', NULL),
(11, 'config', 'default_language', 'en', NULL),
(13, 'config', 'customer_group_id', '11', NULL),
(14, 'config', 'meta_description', '', NULL),
(15, 'config', 'meta_keywords', '', NULL),
(19, 'config', 'maps_api_key', 'AIzaSyDqHZK4Cc8phIk0l504c_RofNPyPWeSvK0', NULL),
(20, 'config', 'distance_unit', 'mi', NULL),
(21, 'config', 'location_order', '0', NULL),
(22, 'config', 'location_order_email', '0', NULL),
(23, 'config', 'location_reserve_email', '0', NULL),
(24, 'config', 'approve_reviews', '1', NULL),
(25, 'config', 'new_order_status', '11', NULL),
(26, 'config', 'completed_order_status', '15', NULL),
(27, 'config', 'guest_order', '1', NULL),
(28, 'config', 'delivery_time', '45', NULL),
(29, 'config', 'collection_time', '15', NULL),
(30, 'config', 'new_reservation_status', '18', NULL),
(31, 'config', 'confirmed_reservation_status', '16', NULL),
(32, 'config', 'canceled_order_status', '19', NULL),
(33, 'config', 'canceled_reservation_status', '17', NULL),
(35, 'config', 'protocol', 'sendmail', NULL),
(36, 'config', 'smtp_host', 'smtp.mailgun.org', NULL),
(37, 'config', 'smtp_port', '587', NULL),
(38, 'config', 'smtp_user', '', NULL),
(39, 'config', 'smtp_pass', '', NULL),
(40, 'config', 'log_threshold', '1', NULL),
(41, 'config', 'permalink', '1', NULL),
(42, 'config', 'maintenance_mode', '0', NULL),
(43, 'config', 'maintenance_message', 'Site is under maintenance. Please check back later.', NULL),
(44, 'config', 'cache_mode', '0', NULL),
(45, 'config', 'cache_time', '0', NULL),
(47, 'prefs', 'ti_setup', 'installed', NULL),
(48, 'prefs', 'ti_version', 'v3.0.4-beta.10', NULL),
(49, 'prefs', 'sys_hash', '513a95ea5cd363688f177dc1149eab33bf97b617', NULL),
(51, 'config', 'ratings.ratings.1', 'Bad', NULL),
(52, 'config', 'ratings.ratings.2', 'Worse', NULL),
(53, 'config', 'ratings.ratings.3', 'Good', NULL),
(54, 'config', 'ratings.ratings.4', 'Average', NULL),
(55, 'config', 'ratings.ratings.5', 'Excellent', NULL),
(56, 'config', 'supported_languages.0', 'en', NULL),
(57, 'config', 'registration_email.0', 'customer', NULL),
(58, 'config', 'order_email.0', 'customer', NULL),
(59, 'config', 'order_email.1', 'admin', NULL),
(60, 'config', 'reservation_email.0', 'customer', NULL),
(61, 'config', 'reservation_email.1', 'admin', NULL),
(62, 'config', 'image_manager.max_size', '300', NULL),
(63, 'config', 'image_manager.thumb_width', '320', NULL),
(64, 'config', 'image_manager.thumb_height', '220', NULL),
(65, 'config', 'image_manager.uploads', '1', NULL),
(66, 'config', 'image_manager.new_folder', '1', NULL),
(67, 'config', 'image_manager.copy', '1', NULL),
(68, 'config', 'image_manager.move', '1', NULL),
(69, 'config', 'image_manager.rename', '1', NULL),
(70, 'config', 'image_manager.delete', '1', NULL),
(71, 'config', 'image_manager.transliteration', '0', NULL),
(72, 'config', 'image_manager.remember_days', '7', NULL),
(73, 'config', 'installed_themes.', '0', NULL),
(74, 'prefs', 'default_themes.main', 'tastyigniter-orange', NULL),
(75, 'config', 'installed_extensions.igniter.cart', '1', NULL),
(76, 'config', 'installed_extensions.igniter.frontend', '1', NULL),
(77, 'config', 'installed_extensions.igniter.local', '1', NULL),
(78, 'config', 'installed_extensions.igniter.pages', '1', NULL),
(79, 'config', 'installed_extensions.igniter.payregister', '1', NULL),
(80, 'config', 'installed_extensions.igniter.reservation', '1', NULL),
(81, 'config', 'installed_extensions.igniter.user', '1', NULL),
(82, 'config', 'site_name', 'Restro ', NULL),
(83, 'config', 'site_email', 'restro@test.com', NULL),
(84, 'config', 'site_url', 'http://localhost/igniter', NULL),
(85, 'config', 'site_location_mode', 'multiple', NULL),
(86, 'config', 'default_geocoder', 'google', NULL),
(87, 'config', 'detect_language', '0', NULL),
(88, 'config', 'default_currency_code', 'GBP', NULL),
(89, 'config', 'date_format', 'd/m/Y', NULL),
(90, 'config', 'time_format', 'h:i a', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_staffs`
--

CREATE TABLE `ti_staffs` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_group_id` int(11) NOT NULL,
  `staff_location_id` int(11) NOT NULL,
  `timezone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `date_added` date NOT NULL,
  `staff_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_staffs`
--

INSERT INTO `ti_staffs` (`staff_id`, `staff_name`, `staff_email`, `staff_group_id`, `staff_location_id`, `timezone`, `language_id`, `date_added`, `staff_status`) VALUES
(1, 'Chef Sam', 'admin@restaurant.com', 1, 1, '0', 1, '2019-08-15', 1),
(7, 'Vishal', 'testX@test.com', 1, 2, NULL, 0, '2019-08-18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_staff_groups`
--

CREATE TABLE `ti_staff_groups` (
  `staff_group_id` int(11) NOT NULL,
  `staff_group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_account_access` tinyint(1) NOT NULL,
  `location_access` tinyint(1) NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_staff_groups`
--

INSERT INTO `ti_staff_groups` (`staff_group_id`, `staff_group_name`, `customer_account_access`, `location_access`, `permissions`) VALUES
(1, 'Administrator', 0, 1, 'a:2:{s:15:\"Admin.Locations\";a:1:{i:0;s:6:\"access\";}s:11:\"Admin.Menus\";a:2:{i:0;s:6:\"access\";i:1;s:6:\"manage\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `ti_statuses`
--

CREATE TABLE `ti_statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `notify_customer` tinyint(1) DEFAULT NULL,
  `status_for` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_color` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_statuses`
--

INSERT INTO `ti_statuses` (`status_id`, `status_name`, `status_comment`, `notify_customer`, `status_for`, `status_color`) VALUES
(1, 'Received', 'Your order has been received.', 1, 'order', '#686663'),
(2, 'Pending', 'Your order is pending', 1, 'order', '#f0ad4e'),
(3, 'Preparation', 'Your order is in the kitchen', 1, 'order', '#00c0ef'),
(4, 'Delivery', 'Your order will be with you shortly.', 0, 'order', '#00a65a'),
(5, 'Completed', '', 0, 'order', '#00a65a'),
(6, 'Confirmed', 'Your table reservation has been confirmed.', 0, 'reserve', '#00a65a'),
(7, 'Canceled', 'Your table reservation has been canceled.', 0, 'reserve', '#dd4b39'),
(8, 'Pending', 'Your table reservation is pending.', 0, 'reserve', ''),
(9, 'Canceled', '', 0, 'order', '#ea0b29');

-- --------------------------------------------------------

--
-- Table structure for table `ti_status_history`
--

CREATE TABLE `ti_status_history` (
  `status_history_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `status_for` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_tables`
--

CREATE TABLE `ti_tables` (
  `table_id` int(11) NOT NULL,
  `table_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_capacity` int(11) NOT NULL,
  `max_capacity` int(11) NOT NULL,
  `table_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_tables`
--

INSERT INTO `ti_tables` (`table_id`, `table_name`, `min_capacity`, `max_capacity`, `table_status`) VALUES
(1, 'Table 1', 4, 8, 1),
(2, 'Table 2', 3, 7, 1),
(3, 'Table 3', 2, 10, 1),
(4, 'Table 4', 3, 7, 1),
(5, 'Table 5', 3, 8, 1),
(6, 'Table 6', 4, 10, 1),
(7, 'Table 7', 2, 7, 1),
(8, 'Table 8', 5, 11, 1),
(9, 'Table 9', 3, 8, 1),
(10, 'Table 10', 3, 9, 1),
(11, 'Table 11', 4, 6, 1),
(12, 'Table 12', 4, 11, 1),
(13, 'Table 13', 2, 6, 1),
(14, 'Table 14', 3, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_themes`
--

CREATE TABLE `ti_themes` (
  `theme_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '0.0.1',
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_themes`
--

INSERT INTO `ti_themes` (`theme_id`, `name`, `code`, `description`, `version`, `data`, `status`, `is_default`) VALUES
(1, 'TastyIgniter Demo Theme', 'demo', 'Demonstration theme for TastyIgniter front-end', '1.0.0', NULL, 0, 0),
(2, 'TastyIgniter Orange', 'tastyigniter-orange', 'Free Modern, Responsive and Clean TastyIgniter Theme based on Bootstrap 4.', 'v2.1.0-beta.8', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_uri_routes`
--

CREATE TABLE `ti_uri_routes` (
  `uri_route_id` int(11) NOT NULL,
  `uri_route` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_users`
--

CREATE TABLE `ti_users` (
  `user_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_user` tinyint(1) DEFAULT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_users`
--

INSERT INTO `ti_users` (`user_id`, `staff_id`, `username`, `password`, `salt`, `super_user`, `reset_code`, `reset_time`, `activation_code`, `remember_token`, `is_activated`, `date_activated`, `last_login`) VALUES
(1, 1, 'admin', '$2y$10$hCpkv5z5cS3YbwY6xljjYOH7z7hm1KutZMbIvSOw/LUOh9811SyQ.', NULL, 1, NULL, NULL, NULL, NULL, 1, '2019-08-15 02:47:48', NULL),
(5, 7, 'testX@test.com', '$2y$10$MVoTMIpWsM/RoD72P07uZ.ci7v3nek6cR3Oo7fXqd9zD.Md2ZQze2', NULL, 0, NULL, NULL, NULL, '8EWBMMtXpfyXDHZQeYqd6jha6JNo4wzOLyEIbXQJlumCASy3QsfTpfzPAnF6', 1, '2019-08-18 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_user_preferences`
--

CREATE TABLE `ti_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_working_hours`
--

CREATE TABLE `ti_working_hours` (
  `location_id` int(11) NOT NULL,
  `weekday` int(11) NOT NULL,
  `opening_time` time NOT NULL DEFAULT '00:00:00',
  `closing_time` time NOT NULL DEFAULT '00:00:00',
  `status` tinyint(1) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_working_hours`
--

INSERT INTO `ti_working_hours` (`location_id`, `weekday`, `opening_time`, `closing_time`, `status`, `type`) VALUES
(1, 0, '00:00:00', '23:59:00', 1, 'opening'),
(1, 1, '00:00:00', '23:59:00', 1, 'opening'),
(1, 2, '00:00:00', '23:59:00', 1, 'opening'),
(1, 3, '00:00:00', '23:59:00', 1, 'opening'),
(1, 4, '00:00:00', '23:59:00', 1, 'opening'),
(1, 5, '00:00:00', '23:59:00', 1, 'opening'),
(1, 6, '00:00:00', '23:59:00', 1, 'opening'),
(1, 0, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 1, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 2, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 3, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 4, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 5, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 6, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 0, '00:00:00', '23:59:00', 1, 'collection'),
(1, 1, '00:00:00', '23:59:00', 1, 'collection'),
(1, 2, '00:00:00', '23:59:00', 1, 'collection'),
(1, 3, '00:00:00', '23:59:00', 1, 'collection'),
(1, 4, '00:00:00', '23:59:00', 1, 'collection'),
(1, 5, '00:00:00', '23:59:00', 1, 'collection'),
(1, 6, '00:00:00', '23:59:00', 1, 'collection'),
(2, 0, '00:00:00', '23:59:00', 1, 'opening'),
(2, 1, '00:00:00', '23:59:00', 1, 'opening'),
(2, 2, '00:00:00', '23:59:00', 1, 'opening'),
(2, 3, '00:00:00', '23:59:00', 1, 'opening'),
(2, 4, '00:00:00', '23:59:00', 1, 'opening'),
(2, 5, '00:00:00', '23:59:00', 1, 'opening'),
(2, 6, '00:00:00', '23:59:00', 1, 'opening'),
(2, 0, '00:00:00', '23:59:00', 1, 'delivery'),
(2, 1, '00:00:00', '23:59:00', 1, 'delivery'),
(2, 2, '00:00:00', '23:59:00', 1, 'delivery'),
(2, 3, '00:00:00', '23:59:00', 1, 'delivery'),
(2, 4, '00:00:00', '23:59:00', 1, 'delivery'),
(2, 5, '00:00:00', '23:59:00', 1, 'delivery'),
(2, 6, '00:00:00', '23:59:00', 1, 'delivery'),
(2, 0, '00:00:00', '23:59:00', 1, 'collection'),
(2, 1, '00:00:00', '23:59:00', 1, 'collection'),
(2, 2, '00:00:00', '23:59:00', 1, 'collection'),
(2, 3, '00:00:00', '23:59:00', 1, 'collection'),
(2, 4, '00:00:00', '23:59:00', 1, 'collection'),
(2, 5, '00:00:00', '23:59:00', 1, 'collection'),
(2, 6, '00:00:00', '23:59:00', 1, 'collection');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ti_activities`
--
ALTER TABLE `ti_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `ti_addresses`
--
ALTER TABLE `ti_addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `ti_banners`
--
ALTER TABLE `ti_banners`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `ti_categories`
--
ALTER TABLE `ti_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `ti_countries`
--
ALTER TABLE `ti_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `ti_coupons`
--
ALTER TABLE `ti_coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `ti_coupons_history`
--
ALTER TABLE `ti_coupons_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `ti_currencies`
--
ALTER TABLE `ti_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `ti_customers`
--
ALTER TABLE `ti_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `ti_customers_online`
--
ALTER TABLE `ti_customers_online`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `ti_customer_groups`
--
ALTER TABLE `ti_customer_groups`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `ti_extensions`
--
ALTER TABLE `ti_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD UNIQUE KEY `type` (`type`,`name`);

--
-- Indexes for table `ti_extension_settings`
--
ALTER TABLE `ti_extension_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `extension_settings_item_unique` (`item`);

--
-- Indexes for table `ti_failed_jobs`
--
ALTER TABLE `ti_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_igniter_cart_cart`
--
ALTER TABLE `ti_igniter_cart_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ti_igniter_frontend_subscribers`
--
ALTER TABLE `ti_igniter_frontend_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_jobs`
--
ALTER TABLE `ti_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `ti_languages`
--
ALTER TABLE `ti_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `ti_language_translations`
--
ALTER TABLE `ti_language_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD UNIQUE KEY `language_translations_locale_namespace_group_item_unique` (`locale`,`namespace`,`group`,`item`),
  ADD KEY `language_translations_group_index` (`group`);

--
-- Indexes for table `ti_layouts`
--
ALTER TABLE `ti_layouts`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `ti_layout_modules`
--
ALTER TABLE `ti_layout_modules`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `ti_layout_routes`
--
ALTER TABLE `ti_layout_routes`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `ti_locations`
--
ALTER TABLE `ti_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `ti_location_areas`
--
ALTER TABLE `ti_location_areas`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `ti_location_tables`
--
ALTER TABLE `ti_location_tables`
  ADD PRIMARY KEY (`location_id`,`table_id`);

--
-- Indexes for table `ti_mail_templates`
--
ALTER TABLE `ti_mail_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `ti_mail_templates_data`
--
ALTER TABLE `ti_mail_templates_data`
  ADD PRIMARY KEY (`template_data_id`),
  ADD UNIQUE KEY `mail_templates_data_template_id_code_unique` (`template_id`,`code`);

--
-- Indexes for table `ti_mealtimes`
--
ALTER TABLE `ti_mealtimes`
  ADD PRIMARY KEY (`mealtime_id`);

--
-- Indexes for table `ti_media_attachments`
--
ALTER TABLE `ti_media_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_attachments_attachment_id_attachment_type_index` (`attachment_id`,`attachment_type`),
  ADD KEY `media_attachments_tag_index` (`tag`);

--
-- Indexes for table `ti_menus`
--
ALTER TABLE `ti_menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `ti_menus_specials`
--
ALTER TABLE `ti_menus_specials`
  ADD PRIMARY KEY (`special_id`),
  ADD UNIQUE KEY `menus_specials_special_id_menu_id_unique` (`special_id`,`menu_id`);

--
-- Indexes for table `ti_menu_categories`
--
ALTER TABLE `ti_menu_categories`
  ADD UNIQUE KEY `menu_categories_menu_id_category_id_unique` (`menu_id`,`category_id`),
  ADD KEY `menu_categories_menu_id_index` (`menu_id`),
  ADD KEY `menu_categories_category_id_index` (`category_id`);

--
-- Indexes for table `ti_menu_options`
--
ALTER TABLE `ti_menu_options`
  ADD PRIMARY KEY (`menu_option_id`);

--
-- Indexes for table `ti_menu_option_values`
--
ALTER TABLE `ti_menu_option_values`
  ADD PRIMARY KEY (`menu_option_value_id`);

--
-- Indexes for table `ti_messages`
--
ALTER TABLE `ti_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `ti_message_meta`
--
ALTER TABLE `ti_message_meta`
  ADD PRIMARY KEY (`message_meta_id`),
  ADD UNIQUE KEY `message_meta_message_id_messagable_id_messagable_type_unique` (`message_id`,`messagable_id`,`messagable_type`);

--
-- Indexes for table `ti_migrations`
--
ALTER TABLE `ti_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_options`
--
ALTER TABLE `ti_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `ti_option_values`
--
ALTER TABLE `ti_option_values`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `ti_orders`
--
ALTER TABLE `ti_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_hash_index` (`hash`);

--
-- Indexes for table `ti_order_menus`
--
ALTER TABLE `ti_order_menus`
  ADD PRIMARY KEY (`order_menu_id`);

--
-- Indexes for table `ti_order_options`
--
ALTER TABLE `ti_order_options`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `ti_order_totals`
--
ALTER TABLE `ti_order_totals`
  ADD PRIMARY KEY (`order_total_id`);

--
-- Indexes for table `ti_pages`
--
ALTER TABLE `ti_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `ti_payments`
--
ALTER TABLE `ti_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payments_code_unique` (`code`);

--
-- Indexes for table `ti_payment_logs`
--
ALTER TABLE `ti_payment_logs`
  ADD PRIMARY KEY (`payment_log_id`);

--
-- Indexes for table `ti_permalinks`
--
ALTER TABLE `ti_permalinks`
  ADD PRIMARY KEY (`permalink_id`),
  ADD KEY `controller` (`slug`);

--
-- Indexes for table `ti_permissions`
--
ALTER TABLE `ti_permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `ti_pp_payments`
--
ALTER TABLE `ti_pp_payments`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `ti_reservations`
--
ALTER TABLE `ti_reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `reservations_location_id_table_id_index` (`location_id`,`table_id`),
  ADD KEY `reservations_hash_index` (`hash`);

--
-- Indexes for table `ti_reservation_tables`
--
ALTER TABLE `ti_reservation_tables`
  ADD UNIQUE KEY `reservation_tables_reservation_id_table_id_unique` (`reservation_id`,`table_id`),
  ADD KEY `reservation_tables_reservation_id_index` (`reservation_id`),
  ADD KEY `reservation_tables_table_id_index` (`table_id`);

--
-- Indexes for table `ti_reviews`
--
ALTER TABLE `ti_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_review_id_sale_type_sale_id_index` (`review_id`,`sale_type`,`sale_id`);

--
-- Indexes for table `ti_security_questions`
--
ALTER TABLE `ti_security_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `ti_sessions`
--
ALTER TABLE `ti_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `ti_settings`
--
ALTER TABLE `ti_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `settings_sort_item_unique` (`sort`,`item`);

--
-- Indexes for table `ti_staffs`
--
ALTER TABLE `ti_staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- Indexes for table `ti_staff_groups`
--
ALTER TABLE `ti_staff_groups`
  ADD PRIMARY KEY (`staff_group_id`);

--
-- Indexes for table `ti_statuses`
--
ALTER TABLE `ti_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `ti_status_history`
--
ALTER TABLE `ti_status_history`
  ADD PRIMARY KEY (`status_history_id`);

--
-- Indexes for table `ti_tables`
--
ALTER TABLE `ti_tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `ti_themes`
--
ALTER TABLE `ti_themes`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `themes_code_unique` (`code`);

--
-- Indexes for table `ti_uri_routes`
--
ALTER TABLE `ti_uri_routes`
  ADD PRIMARY KEY (`uri_route_id`),
  ADD KEY `uri_route` (`uri_route_id`);

--
-- Indexes for table `ti_users`
--
ALTER TABLE `ti_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_staff_id_unique` (`staff_id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `ti_user_preferences`
--
ALTER TABLE `ti_user_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_working_hours`
--
ALTER TABLE `ti_working_hours`
  ADD KEY `working_hours_location_id_weekday_type_index` (`location_id`,`weekday`,`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ti_activities`
--
ALTER TABLE `ti_activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_addresses`
--
ALTER TABLE `ti_addresses`
  MODIFY `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_banners`
--
ALTER TABLE `ti_banners`
  MODIFY `banner_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_categories`
--
ALTER TABLE `ti_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ti_countries`
--
ALTER TABLE `ti_countries`
  MODIFY `country_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `ti_coupons`
--
ALTER TABLE `ti_coupons`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ti_coupons_history`
--
ALTER TABLE `ti_coupons_history`
  MODIFY `coupon_history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_currencies`
--
ALTER TABLE `ti_currencies`
  MODIFY `currency_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `ti_customers`
--
ALTER TABLE `ti_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_customers_online`
--
ALTER TABLE `ti_customers_online`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_customer_groups`
--
ALTER TABLE `ti_customer_groups`
  MODIFY `customer_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_extensions`
--
ALTER TABLE `ti_extensions`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ti_extension_settings`
--
ALTER TABLE `ti_extension_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_failed_jobs`
--
ALTER TABLE `ti_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_igniter_frontend_subscribers`
--
ALTER TABLE `ti_igniter_frontend_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_jobs`
--
ALTER TABLE `ti_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_languages`
--
ALTER TABLE `ti_languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_language_translations`
--
ALTER TABLE `ti_language_translations`
  MODIFY `translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_layouts`
--
ALTER TABLE `ti_layouts`
  MODIFY `layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_layout_modules`
--
ALTER TABLE `ti_layout_modules`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_layout_routes`
--
ALTER TABLE `ti_layout_routes`
  MODIFY `layout_route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_locations`
--
ALTER TABLE `ti_locations`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ti_location_areas`
--
ALTER TABLE `ti_location_areas`
  MODIFY `area_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_mail_templates`
--
ALTER TABLE `ti_mail_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_mail_templates_data`
--
ALTER TABLE `ti_mail_templates_data`
  MODIFY `template_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ti_mealtimes`
--
ALTER TABLE `ti_mealtimes`
  MODIFY `mealtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ti_media_attachments`
--
ALTER TABLE `ti_media_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_menus`
--
ALTER TABLE `ti_menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ti_menus_specials`
--
ALTER TABLE `ti_menus_specials`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_menu_options`
--
ALTER TABLE `ti_menu_options`
  MODIFY `menu_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ti_menu_option_values`
--
ALTER TABLE `ti_menu_option_values`
  MODIFY `menu_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ti_messages`
--
ALTER TABLE `ti_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_message_meta`
--
ALTER TABLE `ti_message_meta`
  MODIFY `message_meta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_migrations`
--
ALTER TABLE `ti_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ti_options`
--
ALTER TABLE `ti_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ti_option_values`
--
ALTER TABLE `ti_option_values`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ti_orders`
--
ALTER TABLE `ti_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_order_menus`
--
ALTER TABLE `ti_order_menus`
  MODIFY `order_menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_order_options`
--
ALTER TABLE `ti_order_options`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_order_totals`
--
ALTER TABLE `ti_order_totals`
  MODIFY `order_total_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_pages`
--
ALTER TABLE `ti_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_payments`
--
ALTER TABLE `ti_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_payment_logs`
--
ALTER TABLE `ti_payment_logs`
  MODIFY `payment_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_permalinks`
--
ALTER TABLE `ti_permalinks`
  MODIFY `permalink_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_permissions`
--
ALTER TABLE `ti_permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `ti_reservations`
--
ALTER TABLE `ti_reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_reviews`
--
ALTER TABLE `ti_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_security_questions`
--
ALTER TABLE `ti_security_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_settings`
--
ALTER TABLE `ti_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `ti_staffs`
--
ALTER TABLE `ti_staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ti_staff_groups`
--
ALTER TABLE `ti_staff_groups`
  MODIFY `staff_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_statuses`
--
ALTER TABLE `ti_statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ti_status_history`
--
ALTER TABLE `ti_status_history`
  MODIFY `status_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_tables`
--
ALTER TABLE `ti_tables`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ti_themes`
--
ALTER TABLE `ti_themes`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ti_uri_routes`
--
ALTER TABLE `ti_uri_routes`
  MODIFY `uri_route_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_users`
--
ALTER TABLE `ti_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ti_user_preferences`
--
ALTER TABLE `ti_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
