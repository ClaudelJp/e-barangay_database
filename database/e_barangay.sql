-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2026 at 03:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_barangay`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcement_id`, `created_by`, `title`, `content`, `published_at`, `is_active`, `created_at`) VALUES
(1, 1, 'Clean up drive', 'so naa tay clean up drive unya, 4:30', '0000-00-00 00:00:00', 1, '2026-10-27 23:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `barangay_officials`
--

CREATE TABLE `barangay_officials` (
  `official_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `position` varchar(100) NOT NULL,
  `term_start` date NOT NULL,
  `term_end` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangay_officials`
--

INSERT INTO `barangay_officials` (`official_id`, `user_id`, `position`, `term_start`, `term_end`, `is_active`) VALUES
(1, 2, 'punong barangay', '2026-10-27', '2027-10-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `census_activities`
--

CREATE TABLE `census_activities` (
  `census_id` int(11) NOT NULL,
  `census_name` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('Planned','Ongoing','Completed','Cancelled') NOT NULL DEFAULT 'Planned',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `census_activities`
--

INSERT INTO `census_activities` (`census_id`, `census_name`, `start_date`, `end_date`, `status`, `created_by`, `created_at`) VALUES
(1, 'Household Census 2026', '2026-01-01', '2026-12-31', 'Ongoing', 1, '2026-10-20 23:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `census_records`
--

CREATE TABLE `census_records` (
  `census_record_id` int(11) NOT NULL,
  `census_id` int(11) NOT NULL,
  `household_id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `relationship_to_head` varchar(50) NOT NULL,
  `source_method` enum('Existing Record','Household Survey') NOT NULL,
  `verification_status` enum('Pending','Verified','Rejected') NOT NULL DEFAULT 'Pending',
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `census_records`
--

INSERT INTO `census_records` (`census_record_id`, `census_id`, `household_id`, `resident_id`, `relationship_to_head`, `source_method`, `verification_status`, `verified_by`, `verified_at`, `created_at`) VALUES
(1, 1, 1, 1, 'Head', 'Existing Record', 'Verified', 2, '2026-03-02 09:00:00', '2026-03-02 09:00:00'),
(2, 1, 2, 2, 'Member', 'Household Survey', 'Verified', 3, '2026-03-03 09:00:00', '2026-03-03 09:00:00'),
(3, 1, 3, 3, 'Member', 'Existing Record', 'Verified', 4, '2026-03-04 09:00:00', '2026-03-04 09:00:00'),
(4, 1, 4, 4, 'Member', 'Household Survey', 'Verified', 5, '2026-03-05 09:00:00', '2026-03-05 09:00:00'),
(5, 1, 5, 5, 'Head', 'Existing Record', 'Pending', NULL, NULL, '2026-03-06 09:00:00'),
(6, 1, 6, 6, 'Member', 'Household Survey', 'Verified', 7, '2026-03-07 09:00:00', '2026-03-07 09:00:00'),
(7, 1, 7, 7, 'Member', 'Existing Record', 'Verified', 8, '2026-03-08 09:00:00', '2026-03-08 09:00:00'),
(8, 1, 8, 8, 'Member', 'Household Survey', 'Verified', 9, '2026-03-09 09:00:00', '2026-03-09 09:00:00'),
(9, 1, 9, 9, 'Head', 'Existing Record', 'Verified', 10, '2026-03-10 09:00:00', '2026-03-10 09:00:00'),
(10, 1, 10, 10, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-03-11 09:00:00'),
(11, 1, 11, 11, 'Member', 'Existing Record', 'Verified', 2, '2026-03-12 09:00:00', '2026-03-12 09:00:00'),
(12, 1, 12, 12, 'Member', 'Household Survey', 'Verified', 3, '2026-03-13 09:00:00', '2026-03-13 09:00:00'),
(13, 1, 13, 13, 'Head', 'Existing Record', 'Verified', 4, '2026-03-14 09:00:00', '2026-03-14 09:00:00'),
(14, 1, 14, 14, 'Member', 'Household Survey', 'Verified', 5, '2026-03-15 09:00:00', '2026-03-15 09:00:00'),
(15, 1, 15, 15, 'Member', 'Existing Record', 'Pending', NULL, NULL, '2026-03-16 09:00:00'),
(16, 1, 16, 16, 'Member', 'Household Survey', 'Verified', 7, '2026-03-17 09:00:00', '2026-03-17 09:00:00'),
(17, 1, 17, 17, 'Head', 'Existing Record', 'Verified', 8, '2026-03-18 09:00:00', '2026-03-18 09:00:00'),
(18, 1, 18, 18, 'Member', 'Household Survey', 'Verified', 9, '2026-03-19 09:00:00', '2026-03-19 09:00:00'),
(19, 1, 19, 19, 'Member', 'Existing Record', 'Verified', 10, '2026-03-20 09:00:00', '2026-03-20 09:00:00'),
(20, 1, 20, 20, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-03-21 09:00:00'),
(21, 1, 21, 21, 'Head', 'Existing Record', 'Verified', 2, '2026-03-22 09:00:00', '2026-03-22 09:00:00'),
(22, 1, 22, 22, 'Member', 'Household Survey', 'Verified', 3, '2026-03-23 09:00:00', '2026-03-23 09:00:00'),
(23, 1, 23, 23, 'Member', 'Existing Record', 'Verified', 4, '2026-03-24 09:00:00', '2026-03-24 09:00:00'),
(24, 1, 24, 24, 'Member', 'Household Survey', 'Verified', 5, '2026-03-25 09:00:00', '2026-03-25 09:00:00'),
(25, 1, 25, 25, 'Head', 'Existing Record', 'Pending', NULL, NULL, '2026-03-26 09:00:00'),
(26, 1, 26, 26, 'Member', 'Household Survey', 'Verified', 7, '2026-03-27 09:00:00', '2026-03-27 09:00:00'),
(27, 1, 27, 27, 'Member', 'Existing Record', 'Verified', 8, '2026-03-28 09:00:00', '2026-03-28 09:00:00'),
(28, 1, 28, 28, 'Member', 'Household Survey', 'Verified', 9, '2026-03-29 09:00:00', '2026-03-29 09:00:00'),
(29, 1, 29, 29, 'Head', 'Existing Record', 'Verified', 10, '2026-03-30 09:00:00', '2026-03-30 09:00:00'),
(30, 1, 30, 30, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-03-31 09:00:00'),
(31, 1, 31, 31, 'Member', 'Existing Record', 'Verified', 2, '2026-04-01 09:00:00', '2026-04-01 09:00:00'),
(32, 1, 32, 32, 'Member', 'Household Survey', 'Verified', 3, '2026-04-02 09:00:00', '2026-04-02 09:00:00'),
(33, 1, 33, 33, 'Head', 'Existing Record', 'Verified', 4, '2026-04-03 09:00:00', '2026-04-03 09:00:00'),
(34, 1, 34, 34, 'Member', 'Household Survey', 'Verified', 5, '2026-04-04 09:00:00', '2026-04-04 09:00:00'),
(35, 1, 35, 35, 'Member', 'Existing Record', 'Pending', NULL, NULL, '2026-04-05 09:00:00'),
(36, 1, 36, 36, 'Member', 'Household Survey', 'Verified', 7, '2026-04-06 09:00:00', '2026-04-06 09:00:00'),
(37, 1, 37, 37, 'Head', 'Existing Record', 'Verified', 8, '2026-04-07 09:00:00', '2026-04-07 09:00:00'),
(38, 1, 38, 38, 'Member', 'Household Survey', 'Verified', 9, '2026-04-08 09:00:00', '2026-04-08 09:00:00'),
(39, 1, 39, 39, 'Member', 'Existing Record', 'Verified', 10, '2026-04-09 09:00:00', '2026-04-09 09:00:00'),
(40, 1, 40, 40, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-04-10 09:00:00'),
(41, 1, 41, 41, 'Head', 'Existing Record', 'Verified', 2, '2026-04-11 09:00:00', '2026-04-11 09:00:00'),
(42, 1, 42, 42, 'Member', 'Household Survey', 'Verified', 3, '2026-04-12 09:00:00', '2026-04-12 09:00:00'),
(43, 1, 43, 43, 'Member', 'Existing Record', 'Verified', 4, '2026-04-13 09:00:00', '2026-04-13 09:00:00'),
(44, 1, 44, 44, 'Member', 'Household Survey', 'Verified', 5, '2026-04-14 09:00:00', '2026-04-14 09:00:00'),
(45, 1, 45, 45, 'Head', 'Existing Record', 'Pending', NULL, NULL, '2026-04-15 09:00:00'),
(46, 1, 46, 46, 'Member', 'Household Survey', 'Verified', 7, '2026-04-16 09:00:00', '2026-04-16 09:00:00'),
(47, 1, 47, 47, 'Member', 'Existing Record', 'Verified', 8, '2026-04-17 09:00:00', '2026-04-17 09:00:00'),
(48, 1, 48, 48, 'Member', 'Household Survey', 'Verified', 9, '2026-04-18 09:00:00', '2026-04-18 09:00:00'),
(49, 1, 49, 49, 'Head', 'Existing Record', 'Verified', 10, '2026-04-19 09:00:00', '2026-04-19 09:00:00'),
(50, 1, 50, 50, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-04-20 09:00:00'),
(51, 1, 51, 51, 'Member', 'Existing Record', 'Verified', 2, '2026-04-21 09:00:00', '2026-04-21 09:00:00'),
(52, 1, 52, 52, 'Member', 'Household Survey', 'Verified', 3, '2026-04-22 09:00:00', '2026-04-22 09:00:00'),
(53, 1, 53, 53, 'Head', 'Existing Record', 'Verified', 4, '2026-04-23 09:00:00', '2026-04-23 09:00:00'),
(54, 1, 54, 54, 'Member', 'Household Survey', 'Verified', 5, '2026-04-24 09:00:00', '2026-04-24 09:00:00'),
(55, 1, 55, 55, 'Member', 'Existing Record', 'Pending', NULL, NULL, '2026-04-25 09:00:00'),
(56, 1, 56, 56, 'Member', 'Household Survey', 'Verified', 7, '2026-04-26 09:00:00', '2026-04-26 09:00:00'),
(57, 1, 57, 57, 'Head', 'Existing Record', 'Verified', 8, '2026-04-27 09:00:00', '2026-04-27 09:00:00'),
(58, 1, 58, 58, 'Member', 'Household Survey', 'Verified', 9, '2026-04-28 09:00:00', '2026-04-28 09:00:00'),
(59, 1, 59, 59, 'Member', 'Existing Record', 'Verified', 10, '2026-04-29 09:00:00', '2026-04-29 09:00:00'),
(60, 1, 60, 60, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-04-30 09:00:00'),
(61, 1, 61, 61, 'Head', 'Existing Record', 'Verified', 2, '2026-05-01 09:00:00', '2026-05-01 09:00:00'),
(62, 1, 62, 62, 'Member', 'Household Survey', 'Verified', 3, '2026-05-02 09:00:00', '2026-05-02 09:00:00'),
(63, 1, 63, 63, 'Member', 'Existing Record', 'Verified', 4, '2026-05-03 09:00:00', '2026-05-03 09:00:00'),
(64, 1, 64, 64, 'Member', 'Household Survey', 'Verified', 5, '2026-05-04 09:00:00', '2026-05-04 09:00:00'),
(65, 1, 65, 65, 'Head', 'Existing Record', 'Pending', NULL, NULL, '2026-05-05 09:00:00'),
(66, 1, 66, 66, 'Member', 'Household Survey', 'Verified', 7, '2026-05-06 09:00:00', '2026-05-06 09:00:00'),
(67, 1, 67, 67, 'Member', 'Existing Record', 'Verified', 8, '2026-05-07 09:00:00', '2026-05-07 09:00:00'),
(68, 1, 68, 68, 'Member', 'Household Survey', 'Verified', 9, '2026-05-08 09:00:00', '2026-05-08 09:00:00'),
(69, 1, 69, 69, 'Head', 'Existing Record', 'Verified', 10, '2026-05-09 09:00:00', '2026-05-09 09:00:00'),
(70, 1, 70, 70, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-05-10 09:00:00'),
(71, 1, 71, 71, 'Member', 'Existing Record', 'Verified', 2, '2026-05-11 09:00:00', '2026-05-11 09:00:00'),
(72, 1, 72, 72, 'Member', 'Household Survey', 'Verified', 3, '2026-05-12 09:00:00', '2026-05-12 09:00:00'),
(73, 1, 73, 73, 'Head', 'Existing Record', 'Verified', 4, '2026-05-13 09:00:00', '2026-05-13 09:00:00'),
(74, 1, 74, 74, 'Member', 'Household Survey', 'Verified', 5, '2026-05-14 09:00:00', '2026-05-14 09:00:00'),
(75, 1, 75, 75, 'Member', 'Existing Record', 'Pending', NULL, NULL, '2026-05-15 09:00:00'),
(76, 1, 76, 76, 'Member', 'Household Survey', 'Verified', 7, '2026-05-16 09:00:00', '2026-05-16 09:00:00'),
(77, 1, 77, 77, 'Head', 'Existing Record', 'Verified', 8, '2026-05-17 09:00:00', '2026-05-17 09:00:00'),
(78, 1, 78, 78, 'Member', 'Household Survey', 'Verified', 9, '2026-05-18 09:00:00', '2026-05-18 09:00:00'),
(79, 1, 79, 79, 'Member', 'Existing Record', 'Verified', 10, '2026-05-19 09:00:00', '2026-05-19 09:00:00'),
(80, 1, 80, 80, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-05-20 09:00:00'),
(81, 1, 81, 81, 'Head', 'Existing Record', 'Verified', 2, '2026-05-21 09:00:00', '2026-05-21 09:00:00'),
(82, 1, 82, 82, 'Member', 'Household Survey', 'Verified', 3, '2026-05-22 09:00:00', '2026-05-22 09:00:00'),
(83, 1, 83, 83, 'Member', 'Existing Record', 'Verified', 4, '2026-05-23 09:00:00', '2026-05-23 09:00:00'),
(84, 1, 84, 84, 'Member', 'Household Survey', 'Verified', 5, '2026-05-24 09:00:00', '2026-05-24 09:00:00'),
(85, 1, 85, 85, 'Head', 'Existing Record', 'Pending', NULL, NULL, '2026-05-25 09:00:00'),
(86, 1, 86, 86, 'Member', 'Household Survey', 'Verified', 7, '2026-05-26 09:00:00', '2026-05-26 09:00:00'),
(87, 1, 87, 87, 'Member', 'Existing Record', 'Verified', 8, '2026-05-27 09:00:00', '2026-05-27 09:00:00'),
(88, 1, 88, 88, 'Member', 'Household Survey', 'Verified', 9, '2026-05-28 09:00:00', '2026-05-28 09:00:00'),
(89, 1, 89, 89, 'Head', 'Existing Record', 'Verified', 10, '2026-05-29 09:00:00', '2026-05-29 09:00:00'),
(90, 1, 90, 90, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-05-30 09:00:00'),
(91, 1, 91, 91, 'Member', 'Existing Record', 'Verified', 2, '2026-05-31 09:00:00', '2026-05-31 09:00:00'),
(92, 1, 92, 92, 'Member', 'Household Survey', 'Verified', 3, '2026-06-01 09:00:00', '2026-06-01 09:00:00'),
(93, 1, 93, 93, 'Head', 'Existing Record', 'Verified', 4, '2026-06-02 09:00:00', '2026-06-02 09:00:00'),
(94, 1, 94, 94, 'Member', 'Household Survey', 'Verified', 5, '2026-06-03 09:00:00', '2026-06-03 09:00:00'),
(95, 1, 95, 95, 'Member', 'Existing Record', 'Pending', NULL, NULL, '2026-06-04 09:00:00'),
(96, 1, 96, 96, 'Member', 'Household Survey', 'Verified', 7, '2026-06-05 09:00:00', '2026-06-05 09:00:00'),
(97, 1, 97, 97, 'Head', 'Existing Record', 'Verified', 8, '2026-06-06 09:00:00', '2026-06-06 09:00:00'),
(98, 1, 98, 98, 'Member', 'Household Survey', 'Verified', 9, '2026-06-07 09:00:00', '2026-06-07 09:00:00'),
(99, 1, 99, 99, 'Member', 'Existing Record', 'Verified', 10, '2026-06-08 09:00:00', '2026-06-08 09:00:00'),
(100, 1, 100, 100, 'Member', 'Household Survey', 'Pending', NULL, NULL, '2026-06-09 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `concerns`
--

CREATE TABLE `concerns` (
  `concern_id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `concern_status_id` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `subject` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `resolved_at` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `concerns`
--

INSERT INTO `concerns` (`concern_id`, `resident_id`, `concern_status_id`, `assigned_to`, `subject`, `description`, `created_at`, `resolved_at`, `remarks`) VALUES
(1, 1, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-02 08:00:00', NULL, 'Sample record for system testing'),
(2, 2, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-03 08:00:00', NULL, 'Sample record for system testing'),
(3, 3, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-04 08:00:00', NULL, 'Sample record for system testing'),
(4, 4, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-05 08:00:00', '2026-05-06 08:00:00', 'Sample record for system testing'),
(5, 5, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-06 08:00:00', '2026-05-07 08:00:00', 'Sample record for system testing'),
(6, 6, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-07 08:00:00', NULL, 'Sample record for system testing'),
(7, 7, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-08 08:00:00', NULL, 'Sample record for system testing'),
(8, 8, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-09 08:00:00', NULL, 'Sample record for system testing'),
(9, 9, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-10 08:00:00', '2026-05-11 08:00:00', 'Sample record for system testing'),
(10, 10, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-11 08:00:00', '2026-05-12 08:00:00', 'Sample record for system testing'),
(11, 11, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-12 08:00:00', NULL, 'Sample record for system testing'),
(12, 12, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-13 08:00:00', NULL, 'Sample record for system testing'),
(13, 13, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-14 08:00:00', NULL, 'Sample record for system testing'),
(14, 14, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-15 08:00:00', '2026-05-16 08:00:00', 'Sample record for system testing'),
(15, 15, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-16 08:00:00', '2026-05-17 08:00:00', 'Sample record for system testing'),
(16, 16, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-17 08:00:00', NULL, 'Sample record for system testing'),
(17, 17, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-18 08:00:00', NULL, 'Sample record for system testing'),
(18, 18, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-19 08:00:00', NULL, 'Sample record for system testing'),
(19, 19, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-20 08:00:00', '2026-05-21 08:00:00', 'Sample record for system testing'),
(20, 20, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-21 08:00:00', '2026-05-22 08:00:00', 'Sample record for system testing'),
(21, 21, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-22 08:00:00', NULL, 'Sample record for system testing'),
(22, 22, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-23 08:00:00', NULL, 'Sample record for system testing'),
(23, 23, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-24 08:00:00', NULL, 'Sample record for system testing'),
(24, 24, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-25 08:00:00', '2026-05-26 08:00:00', 'Sample record for system testing'),
(25, 25, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-26 08:00:00', '2026-05-27 08:00:00', 'Sample record for system testing'),
(26, 26, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-27 08:00:00', NULL, 'Sample record for system testing'),
(27, 27, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-28 08:00:00', NULL, 'Sample record for system testing'),
(28, 28, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-29 08:00:00', NULL, 'Sample record for system testing'),
(29, 29, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-30 08:00:00', '2026-05-31 08:00:00', 'Sample record for system testing'),
(30, 30, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-05-31 08:00:00', '2026-06-01 08:00:00', 'Sample record for system testing'),
(31, 31, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-01 08:00:00', NULL, 'Sample record for system testing'),
(32, 32, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-02 08:00:00', NULL, 'Sample record for system testing'),
(33, 33, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-03 08:00:00', NULL, 'Sample record for system testing'),
(34, 34, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-04 08:00:00', '2026-06-05 08:00:00', 'Sample record for system testing'),
(35, 35, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-05 08:00:00', '2026-06-06 08:00:00', 'Sample record for system testing'),
(36, 36, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-06 08:00:00', NULL, 'Sample record for system testing'),
(37, 37, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-07 08:00:00', NULL, 'Sample record for system testing'),
(38, 38, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-08 08:00:00', NULL, 'Sample record for system testing'),
(39, 39, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-09 08:00:00', '2026-06-10 08:00:00', 'Sample record for system testing'),
(40, 40, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-10 08:00:00', '2026-06-11 08:00:00', 'Sample record for system testing'),
(41, 41, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-11 08:00:00', NULL, 'Sample record for system testing'),
(42, 42, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-12 08:00:00', NULL, 'Sample record for system testing'),
(43, 43, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-13 08:00:00', NULL, 'Sample record for system testing'),
(44, 44, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-14 08:00:00', '2026-06-15 08:00:00', 'Sample record for system testing'),
(45, 45, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-15 08:00:00', '2026-06-16 08:00:00', 'Sample record for system testing'),
(46, 46, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-16 08:00:00', NULL, 'Sample record for system testing'),
(47, 47, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-17 08:00:00', NULL, 'Sample record for system testing'),
(48, 48, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-18 08:00:00', NULL, 'Sample record for system testing'),
(49, 49, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-19 08:00:00', '2026-06-20 08:00:00', 'Sample record for system testing'),
(50, 50, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-20 08:00:00', '2026-06-21 08:00:00', 'Sample record for system testing'),
(51, 51, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-21 08:00:00', NULL, 'Sample record for system testing'),
(52, 52, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-22 08:00:00', NULL, 'Sample record for system testing'),
(53, 53, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-23 08:00:00', NULL, 'Sample record for system testing'),
(54, 54, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-24 08:00:00', '2026-06-25 08:00:00', 'Sample record for system testing'),
(55, 55, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-25 08:00:00', '2026-06-26 08:00:00', 'Sample record for system testing'),
(56, 56, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-26 08:00:00', NULL, 'Sample record for system testing'),
(57, 57, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-27 08:00:00', NULL, 'Sample record for system testing'),
(58, 58, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-28 08:00:00', NULL, 'Sample record for system testing'),
(59, 59, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-29 08:00:00', '2026-06-30 08:00:00', 'Sample record for system testing'),
(60, 60, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-06-30 08:00:00', '2026-07-01 08:00:00', 'Sample record for system testing'),
(61, 61, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-01 08:00:00', NULL, 'Sample record for system testing'),
(62, 62, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-02 08:00:00', NULL, 'Sample record for system testing'),
(63, 63, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-03 08:00:00', NULL, 'Sample record for system testing'),
(64, 64, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-04 08:00:00', '2026-07-05 08:00:00', 'Sample record for system testing'),
(65, 65, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-05 08:00:00', '2026-07-06 08:00:00', 'Sample record for system testing'),
(66, 66, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-06 08:00:00', NULL, 'Sample record for system testing'),
(67, 67, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-07 08:00:00', NULL, 'Sample record for system testing'),
(68, 68, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-08 08:00:00', NULL, 'Sample record for system testing'),
(69, 69, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-09 08:00:00', '2026-07-10 08:00:00', 'Sample record for system testing'),
(70, 70, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-10 08:00:00', '2026-07-11 08:00:00', 'Sample record for system testing'),
(71, 71, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-11 08:00:00', NULL, 'Sample record for system testing'),
(72, 72, 2, 3, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-12 08:00:00', NULL, 'Sample record for system testing'),
(73, 73, 3, 4, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-13 08:00:00', NULL, 'Sample record for system testing'),
(74, 74, 4, 5, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-14 08:00:00', '2026-07-15 08:00:00', 'Sample record for system testing'),
(75, 75, 5, 6, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-15 08:00:00', '2026-07-16 08:00:00', 'Sample record for system testing'),
(76, 76, 1, NULL, 'Noise concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-16 08:00:00', NULL, 'Sample record for system testing'),
(77, 77, 2, 8, 'Street cleanliness', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-17 08:00:00', NULL, 'Sample record for system testing'),
(78, 78, 3, 9, 'Drainage concern', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-18 08:00:00', NULL, 'Sample record for system testing'),
(79, 79, 4, 10, 'Community dispute - test only', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-19 08:00:00', '2026-07-20 08:00:00', 'Sample record for system testing'),
(80, 80, 5, 11, 'Request for barangay assistance', 'DEMO DATA ONLY. Fictional concern for database presentation; not a real complaint.', '2026-07-20 08:00:00', '2026-07-21 08:00:00', 'Sample record for system testing');

-- --------------------------------------------------------

--
-- Table structure for table `concern_statuses`
--

CREATE TABLE `concern_statuses` (
  `concern_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `concern_statuses`
--

INSERT INTO `concern_statuses` (`concern_status_id`, `status_name`, `description`) VALUES
(1, 'Open', 'Concern received'),
(2, 'Assigned', 'Assigned to staff'),
(3, 'In Progress', 'Being addressed'),
(4, 'Resolved', 'Resolved'),
(5, 'Closed', 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `document_number` varchar(100) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `qr_token` varchar(255) NOT NULL,
  `document_status` varchar(30) NOT NULL DEFAULT 'Valid',
  `replaces_document_id` int(11) DEFAULT NULL,
  `issued_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `request_id`, `document_type_id`, `generated_by`, `document_number`, `file_name`, `file_path`, `qr_token`, `document_status`, `replaces_document_id`, `issued_at`, `expires_at`) VALUES
(1, 1, 1, 2, 'DEMO-DOC-2026-000001', 'demo-document-0001.pdf', 'uploads/demo/documents/demo-document-0001.pdf', 'DEMO-QR-db24b210-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-02 09:00:00', '2027-06-02 09:00:00'),
(2, 2, 2, 3, 'DEMO-DOC-2026-000002', 'demo-document-0002.pdf', 'uploads/demo/documents/demo-document-0002.pdf', 'DEMO-QR-db25e67f-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-03 09:00:00', '2027-06-03 09:00:00'),
(3, 3, 1, 4, 'DEMO-DOC-2026-000003', 'demo-document-0003.pdf', 'uploads/demo/documents/demo-document-0003.pdf', 'DEMO-QR-db263014-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-04 09:00:00', '2027-06-04 09:00:00'),
(4, 4, 2, 5, 'DEMO-DOC-2026-000004', 'demo-document-0004.pdf', 'uploads/demo/documents/demo-document-0004.pdf', 'DEMO-QR-db27e7ac-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-05 09:00:00', '2027-06-05 09:00:00'),
(5, 5, 1, 6, 'DEMO-DOC-2026-000005', 'demo-document-0005.pdf', 'uploads/demo/documents/demo-document-0005.pdf', 'DEMO-QR-db286298-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-06 09:00:00', '2027-06-06 09:00:00'),
(6, 6, 2, 7, 'DEMO-DOC-2026-000006', 'demo-document-0006.pdf', 'uploads/demo/documents/demo-document-0006.pdf', 'DEMO-QR-db28d47e-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-07 09:00:00', '2027-06-07 09:00:00'),
(7, 7, 1, 8, 'DEMO-DOC-2026-000007', 'demo-document-0007.pdf', 'uploads/demo/documents/demo-document-0007.pdf', 'DEMO-QR-db29496a-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-08 09:00:00', '2027-06-08 09:00:00'),
(8, 8, 2, 9, 'DEMO-DOC-2026-000008', 'demo-document-0008.pdf', 'uploads/demo/documents/demo-document-0008.pdf', 'DEMO-QR-db29b6ba-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-09 09:00:00', '2027-06-09 09:00:00'),
(9, 9, 1, 10, 'DEMO-DOC-2026-000009', 'demo-document-0009.pdf', 'uploads/demo/documents/demo-document-0009.pdf', 'DEMO-QR-db2a3427-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-10 09:00:00', '2027-06-10 09:00:00'),
(10, 10, 2, 11, 'DEMO-DOC-2026-000010', 'demo-document-0010.pdf', 'uploads/demo/documents/demo-document-0010.pdf', 'DEMO-QR-db2aa9a8-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-06-11 09:00:00', '2027-06-11 09:00:00'),
(11, 11, 1, 2, 'DEMO-DOC-2026-000011', 'demo-document-0011.pdf', 'uploads/demo/documents/demo-document-0011.pdf', 'DEMO-QR-db2b1b7e-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-12 09:00:00', '2027-06-12 09:00:00'),
(12, 12, 2, 3, 'DEMO-DOC-2026-000012', 'demo-document-0012.pdf', 'uploads/demo/documents/demo-document-0012.pdf', 'DEMO-QR-db2b951e-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-13 09:00:00', '2027-06-13 09:00:00'),
(13, 13, 1, 4, 'DEMO-DOC-2026-000013', 'demo-document-0013.pdf', 'uploads/demo/documents/demo-document-0013.pdf', 'DEMO-QR-db2c2aa4-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-14 09:00:00', '2027-06-14 09:00:00'),
(14, 14, 2, 5, 'DEMO-DOC-2026-000014', 'demo-document-0014.pdf', 'uploads/demo/documents/demo-document-0014.pdf', 'DEMO-QR-db2ca0cb-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-15 09:00:00', '2027-06-15 09:00:00'),
(15, 15, 1, 6, 'DEMO-DOC-2026-000015', 'demo-document-0015.pdf', 'uploads/demo/documents/demo-document-0015.pdf', 'DEMO-QR-db2d1922-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-16 09:00:00', '2027-06-16 09:00:00'),
(16, 16, 2, 7, 'DEMO-DOC-2026-000016', 'demo-document-0016.pdf', 'uploads/demo/documents/demo-document-0016.pdf', 'DEMO-QR-db2d828d-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-17 09:00:00', '2027-06-17 09:00:00'),
(17, 17, 1, 8, 'DEMO-DOC-2026-000017', 'demo-document-0017.pdf', 'uploads/demo/documents/demo-document-0017.pdf', 'DEMO-QR-db2df631-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-18 09:00:00', '2027-06-18 09:00:00'),
(18, 18, 2, 9, 'DEMO-DOC-2026-000018', 'demo-document-0018.pdf', 'uploads/demo/documents/demo-document-0018.pdf', 'DEMO-QR-db2e7205-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-19 09:00:00', '2027-06-19 09:00:00'),
(19, 19, 1, 10, 'DEMO-DOC-2026-000019', 'demo-document-0019.pdf', 'uploads/demo/documents/demo-document-0019.pdf', 'DEMO-QR-db2ee5c7-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-20 09:00:00', '2027-06-20 09:00:00'),
(20, 20, 2, 11, 'DEMO-DOC-2026-000020', 'demo-document-0020.pdf', 'uploads/demo/documents/demo-document-0020.pdf', 'DEMO-QR-db2f669e-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-06-21 09:00:00', '2027-06-21 09:00:00'),
(21, 21, 1, 2, 'DEMO-DOC-2026-000021', 'demo-document-0021.pdf', 'uploads/demo/documents/demo-document-0021.pdf', 'DEMO-QR-db2fd611-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-22 09:00:00', '2027-06-22 09:00:00'),
(22, 22, 2, 3, 'DEMO-DOC-2026-000022', 'demo-document-0022.pdf', 'uploads/demo/documents/demo-document-0022.pdf', 'DEMO-QR-db30479b-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-23 09:00:00', '2027-06-23 09:00:00'),
(23, 23, 1, 4, 'DEMO-DOC-2026-000023', 'demo-document-0023.pdf', 'uploads/demo/documents/demo-document-0023.pdf', 'DEMO-QR-db30c0e5-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-24 09:00:00', '2027-06-24 09:00:00'),
(24, 24, 2, 5, 'DEMO-DOC-2026-000024', 'demo-document-0024.pdf', 'uploads/demo/documents/demo-document-0024.pdf', 'DEMO-QR-db312d23-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-25 09:00:00', '2027-06-25 09:00:00'),
(25, 25, 1, 6, 'DEMO-DOC-2026-000025', 'demo-document-0025.pdf', 'uploads/demo/documents/demo-document-0025.pdf', 'DEMO-QR-db31aa92-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-26 09:00:00', '2027-06-26 09:00:00'),
(26, 26, 2, 7, 'DEMO-DOC-2026-000026', 'demo-document-0026.pdf', 'uploads/demo/documents/demo-document-0026.pdf', 'DEMO-QR-db321ee1-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-27 09:00:00', '2027-06-27 09:00:00'),
(27, 27, 1, 8, 'DEMO-DOC-2026-000027', 'demo-document-0027.pdf', 'uploads/demo/documents/demo-document-0027.pdf', 'DEMO-QR-db3294ac-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-28 09:00:00', '2027-06-28 09:00:00'),
(28, 28, 2, 9, 'DEMO-DOC-2026-000028', 'demo-document-0028.pdf', 'uploads/demo/documents/demo-document-0028.pdf', 'DEMO-QR-db330ca6-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-29 09:00:00', '2027-06-29 09:00:00'),
(29, 29, 1, 10, 'DEMO-DOC-2026-000029', 'demo-document-0029.pdf', 'uploads/demo/documents/demo-document-0029.pdf', 'DEMO-QR-db337f6f-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-06-30 09:00:00', '2027-06-30 09:00:00'),
(30, 30, 2, 11, 'DEMO-DOC-2026-000030', 'demo-document-0030.pdf', 'uploads/demo/documents/demo-document-0030.pdf', 'DEMO-QR-db33f28b-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-07-01 09:00:00', '2027-07-01 09:00:00'),
(31, 31, 1, 2, 'DEMO-DOC-2026-000031', 'demo-document-0031.pdf', 'uploads/demo/documents/demo-document-0031.pdf', 'DEMO-QR-db346d7e-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-02 09:00:00', '2027-07-02 09:00:00'),
(32, 32, 2, 3, 'DEMO-DOC-2026-000032', 'demo-document-0032.pdf', 'uploads/demo/documents/demo-document-0032.pdf', 'DEMO-QR-db3509db-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-03 09:00:00', '2027-07-03 09:00:00'),
(33, 33, 1, 4, 'DEMO-DOC-2026-000033', 'demo-document-0033.pdf', 'uploads/demo/documents/demo-document-0033.pdf', 'DEMO-QR-db356f8f-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-04 09:00:00', '2027-07-04 09:00:00'),
(34, 34, 2, 5, 'DEMO-DOC-2026-000034', 'demo-document-0034.pdf', 'uploads/demo/documents/demo-document-0034.pdf', 'DEMO-QR-db35eab8-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-05 09:00:00', '2027-07-05 09:00:00'),
(35, 35, 1, 6, 'DEMO-DOC-2026-000035', 'demo-document-0035.pdf', 'uploads/demo/documents/demo-document-0035.pdf', 'DEMO-QR-db366a9c-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-06 09:00:00', '2027-07-06 09:00:00'),
(36, 36, 2, 7, 'DEMO-DOC-2026-000036', 'demo-document-0036.pdf', 'uploads/demo/documents/demo-document-0036.pdf', 'DEMO-QR-db379c0f-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-07 09:00:00', '2027-07-07 09:00:00'),
(37, 37, 1, 8, 'DEMO-DOC-2026-000037', 'demo-document-0037.pdf', 'uploads/demo/documents/demo-document-0037.pdf', 'DEMO-QR-db381187-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-08 09:00:00', '2027-07-08 09:00:00'),
(38, 38, 2, 9, 'DEMO-DOC-2026-000038', 'demo-document-0038.pdf', 'uploads/demo/documents/demo-document-0038.pdf', 'DEMO-QR-db389001-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-09 09:00:00', '2027-07-09 09:00:00'),
(39, 39, 1, 10, 'DEMO-DOC-2026-000039', 'demo-document-0039.pdf', 'uploads/demo/documents/demo-document-0039.pdf', 'DEMO-QR-db3926a4-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-10 09:00:00', '2027-07-10 09:00:00'),
(40, 40, 2, 11, 'DEMO-DOC-2026-000040', 'demo-document-0040.pdf', 'uploads/demo/documents/demo-document-0040.pdf', 'DEMO-QR-db39958d-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-07-11 09:00:00', '2027-07-11 09:00:00'),
(41, 41, 1, 2, 'DEMO-DOC-2026-000041', 'demo-document-0041.pdf', 'uploads/demo/documents/demo-document-0041.pdf', 'DEMO-QR-db3a0cad-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-12 09:00:00', '2027-07-12 09:00:00'),
(42, 42, 2, 3, 'DEMO-DOC-2026-000042', 'demo-document-0042.pdf', 'uploads/demo/documents/demo-document-0042.pdf', 'DEMO-QR-db3a890b-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-13 09:00:00', '2027-07-13 09:00:00'),
(43, 43, 1, 4, 'DEMO-DOC-2026-000043', 'demo-document-0043.pdf', 'uploads/demo/documents/demo-document-0043.pdf', 'DEMO-QR-db3b1eda-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-14 09:00:00', '2027-07-14 09:00:00'),
(44, 44, 2, 5, 'DEMO-DOC-2026-000044', 'demo-document-0044.pdf', 'uploads/demo/documents/demo-document-0044.pdf', 'DEMO-QR-db3bbdf1-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-15 09:00:00', '2027-07-15 09:00:00'),
(45, 45, 1, 6, 'DEMO-DOC-2026-000045', 'demo-document-0045.pdf', 'uploads/demo/documents/demo-document-0045.pdf', 'DEMO-QR-db3c2e72-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-16 09:00:00', '2027-07-16 09:00:00'),
(46, 46, 2, 7, 'DEMO-DOC-2026-000046', 'demo-document-0046.pdf', 'uploads/demo/documents/demo-document-0046.pdf', 'DEMO-QR-db3ca8fb-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-17 09:00:00', '2027-07-17 09:00:00'),
(47, 47, 1, 8, 'DEMO-DOC-2026-000047', 'demo-document-0047.pdf', 'uploads/demo/documents/demo-document-0047.pdf', 'DEMO-QR-db3d2081-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-18 09:00:00', '2027-07-18 09:00:00'),
(48, 48, 2, 9, 'DEMO-DOC-2026-000048', 'demo-document-0048.pdf', 'uploads/demo/documents/demo-document-0048.pdf', 'DEMO-QR-db3d965f-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-19 09:00:00', '2027-07-19 09:00:00'),
(49, 49, 1, 10, 'DEMO-DOC-2026-000049', 'demo-document-0049.pdf', 'uploads/demo/documents/demo-document-0049.pdf', 'DEMO-QR-db3e003e-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-20 09:00:00', '2027-07-20 09:00:00'),
(50, 50, 2, 11, 'DEMO-DOC-2026-000050', 'demo-document-0050.pdf', 'uploads/demo/documents/demo-document-0050.pdf', 'DEMO-QR-db3e796d-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-07-21 09:00:00', '2027-07-21 09:00:00'),
(51, 51, 1, 2, 'DEMO-DOC-2026-000051', 'demo-document-0051.pdf', 'uploads/demo/documents/demo-document-0051.pdf', 'DEMO-QR-db3ef53c-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-22 09:00:00', '2027-07-22 09:00:00'),
(52, 52, 2, 3, 'DEMO-DOC-2026-000052', 'demo-document-0052.pdf', 'uploads/demo/documents/demo-document-0052.pdf', 'DEMO-QR-db3f6403-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-23 09:00:00', '2027-07-23 09:00:00'),
(53, 53, 1, 4, 'DEMO-DOC-2026-000053', 'demo-document-0053.pdf', 'uploads/demo/documents/demo-document-0053.pdf', 'DEMO-QR-db3fdcf9-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-24 09:00:00', '2027-07-24 09:00:00'),
(54, 54, 2, 5, 'DEMO-DOC-2026-000054', 'demo-document-0054.pdf', 'uploads/demo/documents/demo-document-0054.pdf', 'DEMO-QR-db404c32-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-25 09:00:00', '2027-07-25 09:00:00'),
(55, 55, 1, 6, 'DEMO-DOC-2026-000055', 'demo-document-0055.pdf', 'uploads/demo/documents/demo-document-0055.pdf', 'DEMO-QR-db40c554-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-26 09:00:00', '2027-07-26 09:00:00'),
(56, 56, 2, 7, 'DEMO-DOC-2026-000056', 'demo-document-0056.pdf', 'uploads/demo/documents/demo-document-0056.pdf', 'DEMO-QR-db41345d-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-27 09:00:00', '2027-07-27 09:00:00'),
(57, 57, 1, 8, 'DEMO-DOC-2026-000057', 'demo-document-0057.pdf', 'uploads/demo/documents/demo-document-0057.pdf', 'DEMO-QR-db41b5fd-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-28 09:00:00', '2027-07-28 09:00:00'),
(58, 58, 2, 9, 'DEMO-DOC-2026-000058', 'demo-document-0058.pdf', 'uploads/demo/documents/demo-document-0058.pdf', 'DEMO-QR-db42508d-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-29 09:00:00', '2027-07-29 09:00:00'),
(59, 59, 1, 10, 'DEMO-DOC-2026-000059', 'demo-document-0059.pdf', 'uploads/demo/documents/demo-document-0059.pdf', 'DEMO-QR-db42ebbb-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-07-30 09:00:00', '2027-07-30 09:00:00'),
(60, 60, 2, 11, 'DEMO-DOC-2026-000060', 'demo-document-0060.pdf', 'uploads/demo/documents/demo-document-0060.pdf', 'DEMO-QR-db435e9e-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-07-31 09:00:00', '2027-07-31 09:00:00'),
(61, 61, 1, 2, 'DEMO-DOC-2026-000061', 'demo-document-0061.pdf', 'uploads/demo/documents/demo-document-0061.pdf', 'DEMO-QR-db45ab36-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-01 09:00:00', '2027-08-01 09:00:00'),
(62, 62, 2, 3, 'DEMO-DOC-2026-000062', 'demo-document-0062.pdf', 'uploads/demo/documents/demo-document-0062.pdf', 'DEMO-QR-db48daf5-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-02 09:00:00', '2027-08-02 09:00:00'),
(63, 63, 1, 4, 'DEMO-DOC-2026-000063', 'demo-document-0063.pdf', 'uploads/demo/documents/demo-document-0063.pdf', 'DEMO-QR-db497003-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-03 09:00:00', '2027-08-03 09:00:00'),
(64, 64, 2, 5, 'DEMO-DOC-2026-000064', 'demo-document-0064.pdf', 'uploads/demo/documents/demo-document-0064.pdf', 'DEMO-QR-db4a335a-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-04 09:00:00', '2027-08-04 09:00:00'),
(65, 65, 1, 6, 'DEMO-DOC-2026-000065', 'demo-document-0065.pdf', 'uploads/demo/documents/demo-document-0065.pdf', 'DEMO-QR-db4ad43a-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-05 09:00:00', '2027-08-05 09:00:00'),
(66, 66, 2, 7, 'DEMO-DOC-2026-000066', 'demo-document-0066.pdf', 'uploads/demo/documents/demo-document-0066.pdf', 'DEMO-QR-db4b7623-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-06 09:00:00', '2027-08-06 09:00:00'),
(67, 67, 1, 8, 'DEMO-DOC-2026-000067', 'demo-document-0067.pdf', 'uploads/demo/documents/demo-document-0067.pdf', 'DEMO-QR-db4c0c80-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-07 09:00:00', '2027-08-07 09:00:00'),
(68, 68, 2, 9, 'DEMO-DOC-2026-000068', 'demo-document-0068.pdf', 'uploads/demo/documents/demo-document-0068.pdf', 'DEMO-QR-db4ca263-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-08 09:00:00', '2027-08-08 09:00:00'),
(69, 69, 1, 10, 'DEMO-DOC-2026-000069', 'demo-document-0069.pdf', 'uploads/demo/documents/demo-document-0069.pdf', 'DEMO-QR-db4d2206-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-09 09:00:00', '2027-08-09 09:00:00'),
(70, 70, 2, 11, 'DEMO-DOC-2026-000070', 'demo-document-0070.pdf', 'uploads/demo/documents/demo-document-0070.pdf', 'DEMO-QR-db4d8ba5-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-08-10 09:00:00', '2027-08-10 09:00:00'),
(71, 71, 1, 2, 'DEMO-DOC-2026-000071', 'demo-document-0071.pdf', 'uploads/demo/documents/demo-document-0071.pdf', 'DEMO-QR-db4df451-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-11 09:00:00', '2027-08-11 09:00:00'),
(72, 72, 2, 3, 'DEMO-DOC-2026-000072', 'demo-document-0072.pdf', 'uploads/demo/documents/demo-document-0072.pdf', 'DEMO-QR-db4e5f43-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-12 09:00:00', '2027-08-12 09:00:00'),
(73, 73, 1, 4, 'DEMO-DOC-2026-000073', 'demo-document-0073.pdf', 'uploads/demo/documents/demo-document-0073.pdf', 'DEMO-QR-db4ec00c-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-13 09:00:00', '2027-08-13 09:00:00'),
(74, 74, 2, 5, 'DEMO-DOC-2026-000074', 'demo-document-0074.pdf', 'uploads/demo/documents/demo-document-0074.pdf', 'DEMO-QR-db4f0104-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-14 09:00:00', '2027-08-14 09:00:00'),
(75, 75, 1, 6, 'DEMO-DOC-2026-000075', 'demo-document-0075.pdf', 'uploads/demo/documents/demo-document-0075.pdf', 'DEMO-QR-db4f410f-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-15 09:00:00', '2027-08-15 09:00:00'),
(76, 76, 2, 7, 'DEMO-DOC-2026-000076', 'demo-document-0076.pdf', 'uploads/demo/documents/demo-document-0076.pdf', 'DEMO-QR-db4f7bdd-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-16 09:00:00', '2027-08-16 09:00:00'),
(77, 77, 1, 8, 'DEMO-DOC-2026-000077', 'demo-document-0077.pdf', 'uploads/demo/documents/demo-document-0077.pdf', 'DEMO-QR-db4fd76e-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-17 09:00:00', '2027-08-17 09:00:00'),
(78, 78, 2, 9, 'DEMO-DOC-2026-000078', 'demo-document-0078.pdf', 'uploads/demo/documents/demo-document-0078.pdf', 'DEMO-QR-db50206e-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-18 09:00:00', '2027-08-18 09:00:00'),
(79, 79, 1, 10, 'DEMO-DOC-2026-000079', 'demo-document-0079.pdf', 'uploads/demo/documents/demo-document-0079.pdf', 'DEMO-QR-db509d93-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-19 09:00:00', '2027-08-19 09:00:00'),
(80, 80, 2, 11, 'DEMO-DOC-2026-000080', 'demo-document-0080.pdf', 'uploads/demo/documents/demo-document-0080.pdf', 'DEMO-QR-db511cb9-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-08-20 09:00:00', '2027-08-20 09:00:00'),
(81, 81, 1, 2, 'DEMO-DOC-2026-000081', 'demo-document-0081.pdf', 'uploads/demo/documents/demo-document-0081.pdf', 'DEMO-QR-db518689-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-21 09:00:00', '2027-08-21 09:00:00'),
(82, 82, 2, 3, 'DEMO-DOC-2026-000082', 'demo-document-0082.pdf', 'uploads/demo/documents/demo-document-0082.pdf', 'DEMO-QR-db5207ea-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-22 09:00:00', '2027-08-22 09:00:00'),
(83, 83, 1, 4, 'DEMO-DOC-2026-000083', 'demo-document-0083.pdf', 'uploads/demo/documents/demo-document-0083.pdf', 'DEMO-QR-db531fe6-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-23 09:00:00', '2027-08-23 09:00:00'),
(84, 84, 2, 5, 'DEMO-DOC-2026-000084', 'demo-document-0084.pdf', 'uploads/demo/documents/demo-document-0084.pdf', 'DEMO-QR-db536343-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-24 09:00:00', '2027-08-24 09:00:00'),
(85, 85, 1, 6, 'DEMO-DOC-2026-000085', 'demo-document-0085.pdf', 'uploads/demo/documents/demo-document-0085.pdf', 'DEMO-QR-db53a0ad-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-25 09:00:00', '2027-08-25 09:00:00'),
(86, 86, 2, 7, 'DEMO-DOC-2026-000086', 'demo-document-0086.pdf', 'uploads/demo/documents/demo-document-0086.pdf', 'DEMO-QR-db53dcd7-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-26 09:00:00', '2027-08-26 09:00:00'),
(87, 87, 1, 8, 'DEMO-DOC-2026-000087', 'demo-document-0087.pdf', 'uploads/demo/documents/demo-document-0087.pdf', 'DEMO-QR-db542cb4-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-27 09:00:00', '2027-08-27 09:00:00'),
(88, 88, 2, 9, 'DEMO-DOC-2026-000088', 'demo-document-0088.pdf', 'uploads/demo/documents/demo-document-0088.pdf', 'DEMO-QR-db54e7ce-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-28 09:00:00', '2027-08-28 09:00:00'),
(89, 89, 1, 10, 'DEMO-DOC-2026-000089', 'demo-document-0089.pdf', 'uploads/demo/documents/demo-document-0089.pdf', 'DEMO-QR-db5562d8-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-29 09:00:00', '2027-08-29 09:00:00'),
(90, 90, 2, 11, 'DEMO-DOC-2026-000090', 'demo-document-0090.pdf', 'uploads/demo/documents/demo-document-0090.pdf', 'DEMO-QR-db55f94c-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-08-30 09:00:00', '2027-08-30 09:00:00'),
(91, 91, 1, 2, 'DEMO-DOC-2026-000091', 'demo-document-0091.pdf', 'uploads/demo/documents/demo-document-0091.pdf', 'DEMO-QR-db567322-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-08-31 09:00:00', '2027-08-31 09:00:00'),
(92, 92, 2, 3, 'DEMO-DOC-2026-000092', 'demo-document-0092.pdf', 'uploads/demo/documents/demo-document-0092.pdf', 'DEMO-QR-db56e755-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-01 09:00:00', '2027-09-01 09:00:00'),
(93, 93, 1, 4, 'DEMO-DOC-2026-000093', 'demo-document-0093.pdf', 'uploads/demo/documents/demo-document-0093.pdf', 'DEMO-QR-db5757dd-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-02 09:00:00', '2027-09-02 09:00:00'),
(94, 94, 2, 5, 'DEMO-DOC-2026-000094', 'demo-document-0094.pdf', 'uploads/demo/documents/demo-document-0094.pdf', 'DEMO-QR-db57d665-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-03 09:00:00', '2027-09-03 09:00:00'),
(95, 95, 1, 6, 'DEMO-DOC-2026-000095', 'demo-document-0095.pdf', 'uploads/demo/documents/demo-document-0095.pdf', 'DEMO-QR-db583a55-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-04 09:00:00', '2027-09-04 09:00:00'),
(96, 96, 2, 7, 'DEMO-DOC-2026-000096', 'demo-document-0096.pdf', 'uploads/demo/documents/demo-document-0096.pdf', 'DEMO-QR-db58b87b-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-05 09:00:00', '2027-09-05 09:00:00'),
(97, 97, 1, 8, 'DEMO-DOC-2026-000097', 'demo-document-0097.pdf', 'uploads/demo/documents/demo-document-0097.pdf', 'DEMO-QR-db5930f8-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-06 09:00:00', '2027-09-06 09:00:00'),
(98, 98, 2, 9, 'DEMO-DOC-2026-000098', 'demo-document-0098.pdf', 'uploads/demo/documents/demo-document-0098.pdf', 'DEMO-QR-db59c907-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-07 09:00:00', '2027-09-07 09:00:00'),
(99, 99, 1, 10, 'DEMO-DOC-2026-000099', 'demo-document-0099.pdf', 'uploads/demo/documents/demo-document-0099.pdf', 'DEMO-QR-db5a6ba9-cc9b-11f1-bc71-28a06be33ee6', 'Valid', NULL, '2026-09-08 09:00:00', '2027-09-08 09:00:00'),
(100, 100, 2, 11, 'DEMO-DOC-2026-000100', 'demo-document-0100.pdf', 'uploads/demo/documents/demo-document-0100.pdf', 'DEMO-QR-db5ae029-cc9b-11f1-bc71-28a06be33ee6', 'Superseded', NULL, '2026-09-09 09:00:00', '2027-09-09 09:00:00'),
(101, 251, 1, 2, 'TEST-BRC-2026-00251', 'TEST-BRC-2026-00251.pdf', 'test_documents/TEST-BRC-2026-00251.pdf', 'TEST-QR-BRC-2026-00251', 'Valid', NULL, '2026-10-22 21:56:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `document_type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`document_type_id`, `type_name`, `description`, `is_active`, `created_at`) VALUES
(1, 'Barangay Residency Certificate', 'Official residency certificate', 1, '2026-10-13 23:53:24'),
(2, 'Barangay Clearance', 'Official barangay clearance', 1, '2026-10-13 23:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE `households` (
  `household_id` int(11) NOT NULL,
  `household_number` varchar(30) NOT NULL,
  `purok` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `households`
--

INSERT INTO `households` (`household_id`, `household_number`, `purok`, `address`, `created_at`, `updated_at`) VALUES
(1, 'DEMO-HH-0001', 'Purok 1', 'House 1, Sample Street, Barangay Poblacion', '2026-02-02 08:00:00', '2026-02-02 08:00:00'),
(2, 'DEMO-HH-0002', 'Purok 2', 'House 2, Sample Street, Barangay Poblacion', '2026-02-03 08:00:00', '2026-02-03 08:00:00'),
(3, 'DEMO-HH-0003', 'Purok 3', 'House 3, Sample Street, Barangay Poblacion', '2026-02-04 08:00:00', '2026-02-04 08:00:00'),
(4, 'DEMO-HH-0004', 'Purok 4', 'House 4, Sample Street, Barangay Poblacion', '2026-02-05 08:00:00', '2026-02-05 08:00:00'),
(5, 'DEMO-HH-0005', 'Purok 5', 'House 5, Sample Street, Barangay Poblacion', '2026-02-06 08:00:00', '2026-02-06 08:00:00'),
(6, 'DEMO-HH-0006', 'Purok 6', 'House 6, Sample Street, Barangay Poblacion', '2026-02-07 08:00:00', '2026-02-07 08:00:00'),
(7, 'DEMO-HH-0007', 'Purok 7', 'House 7, Sample Street, Barangay Poblacion', '2026-02-08 08:00:00', '2026-02-08 08:00:00'),
(8, 'DEMO-HH-0008', 'Purok 8', 'House 8, Sample Street, Barangay Poblacion', '2026-02-09 08:00:00', '2026-02-09 08:00:00'),
(9, 'DEMO-HH-0009', 'Purok 1', 'House 9, Sample Street, Barangay Poblacion', '2026-02-10 08:00:00', '2026-02-10 08:00:00'),
(10, 'DEMO-HH-0010', 'Purok 2', 'House 10, Sample Street, Barangay Poblacion', '2026-02-11 08:00:00', '2026-02-11 08:00:00'),
(11, 'DEMO-HH-0011', 'Purok 3', 'House 11, Sample Street, Barangay Poblacion', '2026-02-12 08:00:00', '2026-02-12 08:00:00'),
(12, 'DEMO-HH-0012', 'Purok 4', 'House 12, Sample Street, Barangay Poblacion', '2026-02-13 08:00:00', '2026-02-13 08:00:00'),
(13, 'DEMO-HH-0013', 'Purok 5', 'House 13, Sample Street, Barangay Poblacion', '2026-02-14 08:00:00', '2026-02-14 08:00:00'),
(14, 'DEMO-HH-0014', 'Purok 6', 'House 14, Sample Street, Barangay Poblacion', '2026-02-15 08:00:00', '2026-02-15 08:00:00'),
(15, 'DEMO-HH-0015', 'Purok 7', 'House 15, Sample Street, Barangay Poblacion', '2026-02-16 08:00:00', '2026-02-16 08:00:00'),
(16, 'DEMO-HH-0016', 'Purok 8', 'House 16, Sample Street, Barangay Poblacion', '2026-02-17 08:00:00', '2026-02-17 08:00:00'),
(17, 'DEMO-HH-0017', 'Purok 1', 'House 17, Sample Street, Barangay Poblacion', '2026-02-18 08:00:00', '2026-02-18 08:00:00'),
(18, 'DEMO-HH-0018', 'Purok 2', 'House 18, Sample Street, Barangay Poblacion', '2026-02-19 08:00:00', '2026-02-19 08:00:00'),
(19, 'DEMO-HH-0019', 'Purok 3', 'House 19, Sample Street, Barangay Poblacion', '2026-02-20 08:00:00', '2026-02-20 08:00:00'),
(20, 'DEMO-HH-0020', 'Purok 4', 'House 20, Sample Street, Barangay Poblacion', '2026-02-21 08:00:00', '2026-02-21 08:00:00'),
(21, 'DEMO-HH-0021', 'Purok 5', 'House 21, Sample Street, Barangay Poblacion', '2026-02-22 08:00:00', '2026-02-22 08:00:00'),
(22, 'DEMO-HH-0022', 'Purok 6', 'House 22, Sample Street, Barangay Poblacion', '2026-02-23 08:00:00', '2026-02-23 08:00:00'),
(23, 'DEMO-HH-0023', 'Purok 7', 'House 23, Sample Street, Barangay Poblacion', '2026-02-24 08:00:00', '2026-02-24 08:00:00'),
(24, 'DEMO-HH-0024', 'Purok 8', 'House 24, Sample Street, Barangay Poblacion', '2026-02-25 08:00:00', '2026-02-25 08:00:00'),
(25, 'DEMO-HH-0025', 'Purok 1', 'House 25, Sample Street, Barangay Poblacion', '2026-02-26 08:00:00', '2026-02-26 08:00:00'),
(26, 'DEMO-HH-0026', 'Purok 2', 'House 26, Sample Street, Barangay Poblacion', '2026-02-27 08:00:00', '2026-02-27 08:00:00'),
(27, 'DEMO-HH-0027', 'Purok 3', 'House 27, Sample Street, Barangay Poblacion', '2026-02-28 08:00:00', '2026-02-28 08:00:00'),
(28, 'DEMO-HH-0028', 'Purok 4', 'House 28, Sample Street, Barangay Poblacion', '2026-03-01 08:00:00', '2026-03-01 08:00:00'),
(29, 'DEMO-HH-0029', 'Purok 5', 'House 29, Sample Street, Barangay Poblacion', '2026-03-02 08:00:00', '2026-03-02 08:00:00'),
(30, 'DEMO-HH-0030', 'Purok 6', 'House 30, Sample Street, Barangay Poblacion', '2026-03-03 08:00:00', '2026-03-03 08:00:00'),
(31, 'DEMO-HH-0031', 'Purok 7', 'House 31, Sample Street, Barangay Poblacion', '2026-03-04 08:00:00', '2026-03-04 08:00:00'),
(32, 'DEMO-HH-0032', 'Purok 8', 'House 32, Sample Street, Barangay Poblacion', '2026-03-05 08:00:00', '2026-03-05 08:00:00'),
(33, 'DEMO-HH-0033', 'Purok 1', 'House 33, Sample Street, Barangay Poblacion', '2026-03-06 08:00:00', '2026-03-06 08:00:00'),
(34, 'DEMO-HH-0034', 'Purok 2', 'House 34, Sample Street, Barangay Poblacion', '2026-03-07 08:00:00', '2026-03-07 08:00:00'),
(35, 'DEMO-HH-0035', 'Purok 3', 'House 35, Sample Street, Barangay Poblacion', '2026-03-08 08:00:00', '2026-03-08 08:00:00'),
(36, 'DEMO-HH-0036', 'Purok 4', 'House 36, Sample Street, Barangay Poblacion', '2026-03-09 08:00:00', '2026-03-09 08:00:00'),
(37, 'DEMO-HH-0037', 'Purok 5', 'House 37, Sample Street, Barangay Poblacion', '2026-03-10 08:00:00', '2026-03-10 08:00:00'),
(38, 'DEMO-HH-0038', 'Purok 6', 'House 38, Sample Street, Barangay Poblacion', '2026-03-11 08:00:00', '2026-03-11 08:00:00'),
(39, 'DEMO-HH-0039', 'Purok 7', 'House 39, Sample Street, Barangay Poblacion', '2026-03-12 08:00:00', '2026-03-12 08:00:00'),
(40, 'DEMO-HH-0040', 'Purok 8', 'House 40, Sample Street, Barangay Poblacion', '2026-03-13 08:00:00', '2026-03-13 08:00:00'),
(41, 'DEMO-HH-0041', 'Purok 1', 'House 41, Sample Street, Barangay Poblacion', '2026-03-14 08:00:00', '2026-03-14 08:00:00'),
(42, 'DEMO-HH-0042', 'Purok 2', 'House 42, Sample Street, Barangay Poblacion', '2026-03-15 08:00:00', '2026-03-15 08:00:00'),
(43, 'DEMO-HH-0043', 'Purok 3', 'House 43, Sample Street, Barangay Poblacion', '2026-03-16 08:00:00', '2026-03-16 08:00:00'),
(44, 'DEMO-HH-0044', 'Purok 4', 'House 44, Sample Street, Barangay Poblacion', '2026-03-17 08:00:00', '2026-03-17 08:00:00'),
(45, 'DEMO-HH-0045', 'Purok 5', 'House 45, Sample Street, Barangay Poblacion', '2026-03-18 08:00:00', '2026-03-18 08:00:00'),
(46, 'DEMO-HH-0046', 'Purok 6', 'House 46, Sample Street, Barangay Poblacion', '2026-03-19 08:00:00', '2026-03-19 08:00:00'),
(47, 'DEMO-HH-0047', 'Purok 7', 'House 47, Sample Street, Barangay Poblacion', '2026-03-20 08:00:00', '2026-03-20 08:00:00'),
(48, 'DEMO-HH-0048', 'Purok 8', 'House 48, Sample Street, Barangay Poblacion', '2026-03-21 08:00:00', '2026-03-21 08:00:00'),
(49, 'DEMO-HH-0049', 'Purok 1', 'House 49, Sample Street, Barangay Poblacion', '2026-03-22 08:00:00', '2026-03-22 08:00:00'),
(50, 'DEMO-HH-0050', 'Purok 2', 'House 50, Sample Street, Barangay Poblacion', '2026-03-23 08:00:00', '2026-03-23 08:00:00'),
(51, 'DEMO-HH-0051', 'Purok 3', 'House 51, Sample Street, Barangay Poblacion', '2026-03-24 08:00:00', '2026-03-24 08:00:00'),
(52, 'DEMO-HH-0052', 'Purok 4', 'House 52, Sample Street, Barangay Poblacion', '2026-03-25 08:00:00', '2026-03-25 08:00:00'),
(53, 'DEMO-HH-0053', 'Purok 5', 'House 53, Sample Street, Barangay Poblacion', '2026-03-26 08:00:00', '2026-03-26 08:00:00'),
(54, 'DEMO-HH-0054', 'Purok 6', 'House 54, Sample Street, Barangay Poblacion', '2026-03-27 08:00:00', '2026-03-27 08:00:00'),
(55, 'DEMO-HH-0055', 'Purok 7', 'House 55, Sample Street, Barangay Poblacion', '2026-03-28 08:00:00', '2026-03-28 08:00:00'),
(56, 'DEMO-HH-0056', 'Purok 8', 'House 56, Sample Street, Barangay Poblacion', '2026-03-29 08:00:00', '2026-03-29 08:00:00'),
(57, 'DEMO-HH-0057', 'Purok 1', 'House 57, Sample Street, Barangay Poblacion', '2026-03-30 08:00:00', '2026-03-30 08:00:00'),
(58, 'DEMO-HH-0058', 'Purok 2', 'House 58, Sample Street, Barangay Poblacion', '2026-03-31 08:00:00', '2026-03-31 08:00:00'),
(59, 'DEMO-HH-0059', 'Purok 3', 'House 59, Sample Street, Barangay Poblacion', '2026-04-01 08:00:00', '2026-04-01 08:00:00'),
(60, 'DEMO-HH-0060', 'Purok 4', 'House 60, Sample Street, Barangay Poblacion', '2026-04-02 08:00:00', '2026-04-02 08:00:00'),
(61, 'DEMO-HH-0061', 'Purok 5', 'House 61, Sample Street, Barangay Poblacion', '2026-04-03 08:00:00', '2026-04-03 08:00:00'),
(62, 'DEMO-HH-0062', 'Purok 6', 'House 62, Sample Street, Barangay Poblacion', '2026-04-04 08:00:00', '2026-04-04 08:00:00'),
(63, 'DEMO-HH-0063', 'Purok 7', 'House 63, Sample Street, Barangay Poblacion', '2026-04-05 08:00:00', '2026-04-05 08:00:00'),
(64, 'DEMO-HH-0064', 'Purok 8', 'House 64, Sample Street, Barangay Poblacion', '2026-04-06 08:00:00', '2026-04-06 08:00:00'),
(65, 'DEMO-HH-0065', 'Purok 1', 'House 65, Sample Street, Barangay Poblacion', '2026-04-07 08:00:00', '2026-04-07 08:00:00'),
(66, 'DEMO-HH-0066', 'Purok 2', 'House 66, Sample Street, Barangay Poblacion', '2026-04-08 08:00:00', '2026-04-08 08:00:00'),
(67, 'DEMO-HH-0067', 'Purok 3', 'House 67, Sample Street, Barangay Poblacion', '2026-04-09 08:00:00', '2026-04-09 08:00:00'),
(68, 'DEMO-HH-0068', 'Purok 4', 'House 68, Sample Street, Barangay Poblacion', '2026-04-10 08:00:00', '2026-04-10 08:00:00'),
(69, 'DEMO-HH-0069', 'Purok 5', 'House 69, Sample Street, Barangay Poblacion', '2026-04-11 08:00:00', '2026-04-11 08:00:00'),
(70, 'DEMO-HH-0070', 'Purok 6', 'House 70, Sample Street, Barangay Poblacion', '2026-04-12 08:00:00', '2026-04-12 08:00:00'),
(71, 'DEMO-HH-0071', 'Purok 7', 'House 71, Sample Street, Barangay Poblacion', '2026-04-13 08:00:00', '2026-04-13 08:00:00'),
(72, 'DEMO-HH-0072', 'Purok 8', 'House 72, Sample Street, Barangay Poblacion', '2026-04-14 08:00:00', '2026-04-14 08:00:00'),
(73, 'DEMO-HH-0073', 'Purok 1', 'House 73, Sample Street, Barangay Poblacion', '2026-04-15 08:00:00', '2026-04-15 08:00:00'),
(74, 'DEMO-HH-0074', 'Purok 2', 'House 74, Sample Street, Barangay Poblacion', '2026-04-16 08:00:00', '2026-04-16 08:00:00'),
(75, 'DEMO-HH-0075', 'Purok 3', 'House 75, Sample Street, Barangay Poblacion', '2026-04-17 08:00:00', '2026-04-17 08:00:00'),
(76, 'DEMO-HH-0076', 'Purok 4', 'House 76, Sample Street, Barangay Poblacion', '2026-04-18 08:00:00', '2026-04-18 08:00:00'),
(77, 'DEMO-HH-0077', 'Purok 5', 'House 77, Sample Street, Barangay Poblacion', '2026-04-19 08:00:00', '2026-04-19 08:00:00'),
(78, 'DEMO-HH-0078', 'Purok 6', 'House 78, Sample Street, Barangay Poblacion', '2026-04-20 08:00:00', '2026-04-20 08:00:00'),
(79, 'DEMO-HH-0079', 'Purok 7', 'House 79, Sample Street, Barangay Poblacion', '2026-04-21 08:00:00', '2026-04-21 08:00:00'),
(80, 'DEMO-HH-0080', 'Purok 8', 'House 80, Sample Street, Barangay Poblacion', '2026-04-22 08:00:00', '2026-04-22 08:00:00'),
(81, 'DEMO-HH-0081', 'Purok 1', 'House 81, Sample Street, Barangay Poblacion', '2026-04-23 08:00:00', '2026-04-23 08:00:00'),
(82, 'DEMO-HH-0082', 'Purok 2', 'House 82, Sample Street, Barangay Poblacion', '2026-04-24 08:00:00', '2026-04-24 08:00:00'),
(83, 'DEMO-HH-0083', 'Purok 3', 'House 83, Sample Street, Barangay Poblacion', '2026-04-25 08:00:00', '2026-04-25 08:00:00'),
(84, 'DEMO-HH-0084', 'Purok 4', 'House 84, Sample Street, Barangay Poblacion', '2026-04-26 08:00:00', '2026-04-26 08:00:00'),
(85, 'DEMO-HH-0085', 'Purok 5', 'House 85, Sample Street, Barangay Poblacion', '2026-04-27 08:00:00', '2026-04-27 08:00:00'),
(86, 'DEMO-HH-0086', 'Purok 6', 'House 86, Sample Street, Barangay Poblacion', '2026-04-28 08:00:00', '2026-04-28 08:00:00'),
(87, 'DEMO-HH-0087', 'Purok 7', 'House 87, Sample Street, Barangay Poblacion', '2026-04-29 08:00:00', '2026-04-29 08:00:00'),
(88, 'DEMO-HH-0088', 'Purok 8', 'House 88, Sample Street, Barangay Poblacion', '2026-04-30 08:00:00', '2026-04-30 08:00:00'),
(89, 'DEMO-HH-0089', 'Purok 1', 'House 89, Sample Street, Barangay Poblacion', '2026-05-01 08:00:00', '2026-05-01 08:00:00'),
(90, 'DEMO-HH-0090', 'Purok 2', 'House 90, Sample Street, Barangay Poblacion', '2026-05-02 08:00:00', '2026-05-02 08:00:00'),
(91, 'DEMO-HH-0091', 'Purok 3', 'House 91, Sample Street, Barangay Poblacion', '2026-05-03 08:00:00', '2026-05-03 08:00:00'),
(92, 'DEMO-HH-0092', 'Purok 4', 'House 92, Sample Street, Barangay Poblacion', '2026-05-04 08:00:00', '2026-05-04 08:00:00'),
(93, 'DEMO-HH-0093', 'Purok 5', 'House 93, Sample Street, Barangay Poblacion', '2026-05-05 08:00:00', '2026-05-05 08:00:00'),
(94, 'DEMO-HH-0094', 'Purok 6', 'House 94, Sample Street, Barangay Poblacion', '2026-05-06 08:00:00', '2026-05-06 08:00:00'),
(95, 'DEMO-HH-0095', 'Purok 7', 'House 95, Sample Street, Barangay Poblacion', '2026-05-07 08:00:00', '2026-05-07 08:00:00'),
(96, 'DEMO-HH-0096', 'Purok 8', 'House 96, Sample Street, Barangay Poblacion', '2026-05-08 08:00:00', '2026-05-08 08:00:00'),
(97, 'DEMO-HH-0097', 'Purok 1', 'House 97, Sample Street, Barangay Poblacion', '2026-05-09 08:00:00', '2026-05-09 08:00:00'),
(98, 'DEMO-HH-0098', 'Purok 2', 'House 98, Sample Street, Barangay Poblacion', '2026-05-10 08:00:00', '2026-05-10 08:00:00'),
(99, 'DEMO-HH-0099', 'Purok 3', 'House 99, Sample Street, Barangay Poblacion', '2026-05-11 08:00:00', '2026-05-11 08:00:00'),
(100, 'DEMO-HH-0100', 'Purok 4', 'House 100, Sample Street, Barangay Poblacion', '2026-05-12 08:00:00', '2026-05-12 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `user_id`, `action`, `details`, `created_at`) VALUES
(1, 2, 'CREATE', 'DEMO DATA ONLY - sample audit event #1', '2026-08-01 10:00:00'),
(2, 3, 'UPDATE', 'DEMO DATA ONLY - sample audit event #2', '2026-08-01 11:00:00'),
(3, 4, 'VIEW', 'DEMO DATA ONLY - sample audit event #3', '2026-08-01 12:00:00'),
(4, 5, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #4', '2026-08-01 13:00:00'),
(5, 6, 'CREATE', 'DEMO DATA ONLY - sample audit event #5', '2026-08-01 14:00:00'),
(6, 7, 'UPDATE', 'DEMO DATA ONLY - sample audit event #6', '2026-08-01 15:00:00'),
(7, 8, 'VIEW', 'DEMO DATA ONLY - sample audit event #7', '2026-08-01 16:00:00'),
(8, 9, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #8', '2026-08-01 17:00:00'),
(9, 10, 'CREATE', 'DEMO DATA ONLY - sample audit event #9', '2026-08-01 18:00:00'),
(10, 11, 'UPDATE', 'DEMO DATA ONLY - sample audit event #10', '2026-08-01 19:00:00'),
(11, 12, 'VIEW', 'DEMO DATA ONLY - sample audit event #11', '2026-08-01 20:00:00'),
(12, 13, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #12', '2026-08-01 21:00:00'),
(13, 14, 'CREATE', 'DEMO DATA ONLY - sample audit event #13', '2026-08-01 22:00:00'),
(14, 15, 'UPDATE', 'DEMO DATA ONLY - sample audit event #14', '2026-08-01 23:00:00'),
(15, 16, 'VIEW', 'DEMO DATA ONLY - sample audit event #15', '2026-08-02 00:00:00'),
(16, 17, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #16', '2026-08-02 01:00:00'),
(17, 18, 'CREATE', 'DEMO DATA ONLY - sample audit event #17', '2026-08-02 02:00:00'),
(18, 19, 'UPDATE', 'DEMO DATA ONLY - sample audit event #18', '2026-08-02 03:00:00'),
(19, 20, 'VIEW', 'DEMO DATA ONLY - sample audit event #19', '2026-08-02 04:00:00'),
(20, 21, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #20', '2026-08-02 05:00:00'),
(21, 22, 'CREATE', 'DEMO DATA ONLY - sample audit event #21', '2026-08-02 06:00:00'),
(22, 23, 'UPDATE', 'DEMO DATA ONLY - sample audit event #22', '2026-08-02 07:00:00'),
(23, 24, 'VIEW', 'DEMO DATA ONLY - sample audit event #23', '2026-08-02 08:00:00'),
(24, 25, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #24', '2026-08-02 09:00:00'),
(25, 26, 'CREATE', 'DEMO DATA ONLY - sample audit event #25', '2026-08-02 10:00:00'),
(26, 27, 'UPDATE', 'DEMO DATA ONLY - sample audit event #26', '2026-08-02 11:00:00'),
(27, 28, 'VIEW', 'DEMO DATA ONLY - sample audit event #27', '2026-08-02 12:00:00'),
(28, 29, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #28', '2026-08-02 13:00:00'),
(29, 30, 'CREATE', 'DEMO DATA ONLY - sample audit event #29', '2026-08-02 14:00:00'),
(30, 31, 'UPDATE', 'DEMO DATA ONLY - sample audit event #30', '2026-08-02 15:00:00'),
(31, 32, 'VIEW', 'DEMO DATA ONLY - sample audit event #31', '2026-08-02 16:00:00'),
(32, 33, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #32', '2026-08-02 17:00:00'),
(33, 34, 'CREATE', 'DEMO DATA ONLY - sample audit event #33', '2026-08-02 18:00:00'),
(34, 35, 'UPDATE', 'DEMO DATA ONLY - sample audit event #34', '2026-08-02 19:00:00'),
(35, 36, 'VIEW', 'DEMO DATA ONLY - sample audit event #35', '2026-08-02 20:00:00'),
(36, 37, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #36', '2026-08-02 21:00:00'),
(37, 38, 'CREATE', 'DEMO DATA ONLY - sample audit event #37', '2026-08-02 22:00:00'),
(38, 39, 'UPDATE', 'DEMO DATA ONLY - sample audit event #38', '2026-08-02 23:00:00'),
(39, 40, 'VIEW', 'DEMO DATA ONLY - sample audit event #39', '2026-08-03 00:00:00'),
(40, 41, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #40', '2026-08-03 01:00:00'),
(41, 42, 'CREATE', 'DEMO DATA ONLY - sample audit event #41', '2026-08-03 02:00:00'),
(42, 43, 'UPDATE', 'DEMO DATA ONLY - sample audit event #42', '2026-08-03 03:00:00'),
(43, 44, 'VIEW', 'DEMO DATA ONLY - sample audit event #43', '2026-08-03 04:00:00'),
(44, 45, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #44', '2026-08-03 05:00:00'),
(45, 46, 'CREATE', 'DEMO DATA ONLY - sample audit event #45', '2026-08-03 06:00:00'),
(46, 47, 'UPDATE', 'DEMO DATA ONLY - sample audit event #46', '2026-08-03 07:00:00'),
(47, 48, 'VIEW', 'DEMO DATA ONLY - sample audit event #47', '2026-08-03 08:00:00'),
(48, 49, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #48', '2026-08-03 09:00:00'),
(49, 50, 'CREATE', 'DEMO DATA ONLY - sample audit event #49', '2026-08-03 10:00:00'),
(50, 51, 'UPDATE', 'DEMO DATA ONLY - sample audit event #50', '2026-08-03 11:00:00'),
(51, 52, 'VIEW', 'DEMO DATA ONLY - sample audit event #51', '2026-08-03 12:00:00'),
(52, 53, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #52', '2026-08-03 13:00:00'),
(53, 54, 'CREATE', 'DEMO DATA ONLY - sample audit event #53', '2026-08-03 14:00:00'),
(54, 55, 'UPDATE', 'DEMO DATA ONLY - sample audit event #54', '2026-08-03 15:00:00'),
(55, 56, 'VIEW', 'DEMO DATA ONLY - sample audit event #55', '2026-08-03 16:00:00'),
(56, 57, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #56', '2026-08-03 17:00:00'),
(57, 58, 'CREATE', 'DEMO DATA ONLY - sample audit event #57', '2026-08-03 18:00:00'),
(58, 59, 'UPDATE', 'DEMO DATA ONLY - sample audit event #58', '2026-08-03 19:00:00'),
(59, 60, 'VIEW', 'DEMO DATA ONLY - sample audit event #59', '2026-08-03 20:00:00'),
(60, 61, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #60', '2026-08-03 21:00:00'),
(61, 62, 'CREATE', 'DEMO DATA ONLY - sample audit event #61', '2026-08-03 22:00:00'),
(62, 63, 'UPDATE', 'DEMO DATA ONLY - sample audit event #62', '2026-08-03 23:00:00'),
(63, 64, 'VIEW', 'DEMO DATA ONLY - sample audit event #63', '2026-08-04 00:00:00'),
(64, 65, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #64', '2026-08-04 01:00:00'),
(65, 66, 'CREATE', 'DEMO DATA ONLY - sample audit event #65', '2026-08-04 02:00:00'),
(66, 67, 'UPDATE', 'DEMO DATA ONLY - sample audit event #66', '2026-08-04 03:00:00'),
(67, 68, 'VIEW', 'DEMO DATA ONLY - sample audit event #67', '2026-08-04 04:00:00'),
(68, 69, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #68', '2026-08-04 05:00:00'),
(69, 70, 'CREATE', 'DEMO DATA ONLY - sample audit event #69', '2026-08-04 06:00:00'),
(70, 71, 'UPDATE', 'DEMO DATA ONLY - sample audit event #70', '2026-08-04 07:00:00'),
(71, 72, 'VIEW', 'DEMO DATA ONLY - sample audit event #71', '2026-08-04 08:00:00'),
(72, 73, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #72', '2026-08-04 09:00:00'),
(73, 74, 'CREATE', 'DEMO DATA ONLY - sample audit event #73', '2026-08-04 10:00:00'),
(74, 75, 'UPDATE', 'DEMO DATA ONLY - sample audit event #74', '2026-08-04 11:00:00'),
(75, 76, 'VIEW', 'DEMO DATA ONLY - sample audit event #75', '2026-08-04 12:00:00'),
(76, 77, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #76', '2026-08-04 13:00:00'),
(77, 78, 'CREATE', 'DEMO DATA ONLY - sample audit event #77', '2026-08-04 14:00:00'),
(78, 79, 'UPDATE', 'DEMO DATA ONLY - sample audit event #78', '2026-08-04 15:00:00'),
(79, 80, 'VIEW', 'DEMO DATA ONLY - sample audit event #79', '2026-08-04 16:00:00'),
(80, 81, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #80', '2026-08-04 17:00:00'),
(81, 82, 'CREATE', 'DEMO DATA ONLY - sample audit event #81', '2026-08-04 18:00:00'),
(82, 83, 'UPDATE', 'DEMO DATA ONLY - sample audit event #82', '2026-08-04 19:00:00'),
(83, 84, 'VIEW', 'DEMO DATA ONLY - sample audit event #83', '2026-08-04 20:00:00'),
(84, 85, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #84', '2026-08-04 21:00:00'),
(85, 86, 'CREATE', 'DEMO DATA ONLY - sample audit event #85', '2026-08-04 22:00:00'),
(86, 87, 'UPDATE', 'DEMO DATA ONLY - sample audit event #86', '2026-08-04 23:00:00'),
(87, 88, 'VIEW', 'DEMO DATA ONLY - sample audit event #87', '2026-08-05 00:00:00'),
(88, 89, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #88', '2026-08-05 01:00:00'),
(89, 90, 'CREATE', 'DEMO DATA ONLY - sample audit event #89', '2026-08-05 02:00:00'),
(90, 91, 'UPDATE', 'DEMO DATA ONLY - sample audit event #90', '2026-08-05 03:00:00'),
(91, 92, 'VIEW', 'DEMO DATA ONLY - sample audit event #91', '2026-08-05 04:00:00'),
(92, 93, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #92', '2026-08-05 05:00:00'),
(93, 94, 'CREATE', 'DEMO DATA ONLY - sample audit event #93', '2026-08-05 06:00:00'),
(94, 95, 'UPDATE', 'DEMO DATA ONLY - sample audit event #94', '2026-08-05 07:00:00'),
(95, 96, 'VIEW', 'DEMO DATA ONLY - sample audit event #95', '2026-08-05 08:00:00'),
(96, 97, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #96', '2026-08-05 09:00:00'),
(97, 98, 'CREATE', 'DEMO DATA ONLY - sample audit event #97', '2026-08-05 10:00:00'),
(98, 99, 'UPDATE', 'DEMO DATA ONLY - sample audit event #98', '2026-08-05 11:00:00'),
(99, 100, 'VIEW', 'DEMO DATA ONLY - sample audit event #99', '2026-08-05 12:00:00'),
(100, 101, 'STATUS_CHANGE', 'DEMO DATA ONLY - sample audit event #100', '2026-08-05 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lupon_schedules`
--

CREATE TABLE `lupon_schedules` (
  `schedule_id` int(11) NOT NULL,
  `concern_id` int(11) NOT NULL,
  `scheduled_by` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location` varchar(150) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Scheduled',
  `remarks` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `notification_type` varchar(50) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `title`, `message`, `notification_type`, `is_read`, `created_at`, `read_at`) VALUES
(1, 11, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-02 09:00:00', NULL),
(2, 12, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-03 09:00:00', '2026-07-04 09:00:00'),
(3, 13, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-04 09:00:00', NULL),
(4, 14, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-05 09:00:00', '2026-07-06 09:00:00'),
(5, 15, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-06 09:00:00', NULL),
(6, 16, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-07 09:00:00', '2026-07-08 09:00:00'),
(7, 17, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-08 09:00:00', NULL),
(8, 18, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-09 09:00:00', '2026-07-10 09:00:00'),
(9, 19, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-10 09:00:00', NULL),
(10, 20, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-11 09:00:00', '2026-07-12 09:00:00'),
(11, 21, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-12 09:00:00', NULL),
(12, 22, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-13 09:00:00', '2026-07-14 09:00:00'),
(13, 23, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-14 09:00:00', NULL),
(14, 24, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-15 09:00:00', '2026-07-16 09:00:00'),
(15, 25, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-16 09:00:00', NULL),
(16, 26, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-17 09:00:00', '2026-07-18 09:00:00'),
(17, 27, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-18 09:00:00', NULL),
(18, 28, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-19 09:00:00', '2026-07-20 09:00:00'),
(19, 29, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-20 09:00:00', NULL),
(20, 30, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-21 09:00:00', '2026-07-22 09:00:00'),
(21, 31, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-22 09:00:00', NULL),
(22, 32, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-23 09:00:00', '2026-07-24 09:00:00'),
(23, 33, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-24 09:00:00', NULL),
(24, 34, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-25 09:00:00', '2026-07-26 09:00:00'),
(25, 35, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-26 09:00:00', NULL),
(26, 36, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-27 09:00:00', '2026-07-28 09:00:00'),
(27, 37, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-28 09:00:00', NULL),
(28, 38, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-29 09:00:00', '2026-07-30 09:00:00'),
(29, 39, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-07-30 09:00:00', NULL),
(30, 40, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-07-31 09:00:00', '2026-08-01 09:00:00'),
(31, 41, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-01 09:00:00', NULL),
(32, 42, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-02 09:00:00', '2026-08-03 09:00:00'),
(33, 43, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-03 09:00:00', NULL),
(34, 44, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-04 09:00:00', '2026-08-05 09:00:00'),
(35, 45, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-05 09:00:00', NULL),
(36, 46, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-06 09:00:00', '2026-08-07 09:00:00'),
(37, 47, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-07 09:00:00', NULL),
(38, 48, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-08 09:00:00', '2026-08-09 09:00:00'),
(39, 49, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-09 09:00:00', NULL),
(40, 50, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-10 09:00:00', '2026-08-11 09:00:00'),
(41, 51, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-11 09:00:00', NULL),
(42, 52, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-12 09:00:00', '2026-08-13 09:00:00'),
(43, 53, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-13 09:00:00', NULL),
(44, 54, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-14 09:00:00', '2026-08-15 09:00:00'),
(45, 55, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-15 09:00:00', NULL),
(46, 56, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-16 09:00:00', '2026-08-17 09:00:00'),
(47, 57, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-17 09:00:00', NULL),
(48, 58, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-18 09:00:00', '2026-08-19 09:00:00'),
(49, 59, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-19 09:00:00', NULL),
(50, 60, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-20 09:00:00', '2026-08-21 09:00:00'),
(51, 61, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-21 09:00:00', NULL),
(52, 62, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-22 09:00:00', '2026-08-23 09:00:00'),
(53, 63, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-23 09:00:00', NULL),
(54, 64, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-24 09:00:00', '2026-08-25 09:00:00'),
(55, 65, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-25 09:00:00', NULL),
(56, 66, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-26 09:00:00', '2026-08-27 09:00:00'),
(57, 67, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-27 09:00:00', NULL),
(58, 68, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-28 09:00:00', '2026-08-29 09:00:00'),
(59, 69, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-29 09:00:00', NULL),
(60, 70, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-08-30 09:00:00', '2026-08-31 09:00:00'),
(61, 71, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-08-31 09:00:00', NULL),
(62, 72, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-01 09:00:00', '2026-09-02 09:00:00'),
(63, 73, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-02 09:00:00', NULL),
(64, 74, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-03 09:00:00', '2026-09-04 09:00:00'),
(65, 75, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-04 09:00:00', NULL),
(66, 76, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-05 09:00:00', '2026-09-06 09:00:00'),
(67, 77, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-06 09:00:00', NULL),
(68, 78, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-07 09:00:00', '2026-09-08 09:00:00'),
(69, 79, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-08 09:00:00', NULL),
(70, 80, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-09 09:00:00', '2026-09-10 09:00:00'),
(71, 81, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-10 09:00:00', NULL),
(72, 82, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-11 09:00:00', '2026-09-12 09:00:00'),
(73, 83, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-12 09:00:00', NULL),
(74, 84, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-13 09:00:00', '2026-09-14 09:00:00'),
(75, 85, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-14 09:00:00', NULL),
(76, 86, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-15 09:00:00', '2026-09-16 09:00:00'),
(77, 87, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-16 09:00:00', NULL),
(78, 88, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-17 09:00:00', '2026-09-18 09:00:00'),
(79, 89, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 0, '2026-09-18 09:00:00', NULL),
(80, 90, 'DEMO: Request status update', 'This is a fictional notification created for database testing.', 'Request Update', 1, '2026-09-19 09:00:00', '2026-09-20 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `reference_number` varchar(100) DEFAULT NULL,
  `proof_file_path` varchar(500) DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `request_id`, `payment_method_id`, `amount`, `payment_status`, `reference_number`, `proof_file_path`, `verified_by`, `verified_at`, `payment_date`, `created_at`) VALUES
(1, 1, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-02 09:00:00'),
(2, 2, 2, 0.00, 'Pending', 'DEMO-GCASH-000002', 'uploads/demo/payment-proof-0002.txt', NULL, NULL, NULL, '2026-04-02 10:00:00'),
(3, 3, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-02 12:00:00', '2026-04-02 12:00:00', '2026-04-02 11:00:00'),
(4, 4, 2, 0.00, 'Rejected', 'DEMO-GCASH-000004', 'uploads/demo/payment-proof-0004.txt', 5, '2026-04-02 13:00:00', '2026-04-02 13:00:00', '2026-04-02 12:00:00'),
(5, 5, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-02 14:00:00', '2026-04-02 14:00:00', '2026-04-02 13:00:00'),
(6, 6, 2, 0.00, 'Verified', 'DEMO-GCASH-000006', 'uploads/demo/payment-proof-0006.txt', 7, '2026-04-02 15:00:00', '2026-04-02 15:00:00', '2026-04-02 14:00:00'),
(7, 7, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-02 16:00:00', '2026-04-02 16:00:00', '2026-04-02 15:00:00'),
(8, 8, 2, 0.00, 'Pending', 'DEMO-GCASH-000008', 'uploads/demo/payment-proof-0008.txt', NULL, NULL, NULL, '2026-04-02 16:00:00'),
(9, 9, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-02 17:00:00'),
(10, 10, 2, 0.00, 'Verified', 'DEMO-GCASH-000010', 'uploads/demo/payment-proof-0010.txt', 11, '2026-04-02 19:00:00', '2026-04-02 19:00:00', '2026-04-02 18:00:00'),
(11, 11, 1, 0.00, 'Rejected', NULL, NULL, 2, '2026-04-02 20:00:00', '2026-04-02 20:00:00', '2026-04-02 19:00:00'),
(12, 12, 2, 0.00, 'Verified', 'DEMO-GCASH-000012', 'uploads/demo/payment-proof-0012.txt', 3, '2026-04-02 21:00:00', '2026-04-02 21:00:00', '2026-04-02 20:00:00'),
(13, 13, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-02 22:00:00', '2026-04-02 22:00:00', '2026-04-02 21:00:00'),
(14, 14, 2, 0.00, 'Verified', 'DEMO-GCASH-000014', 'uploads/demo/payment-proof-0014.txt', 5, '2026-04-02 23:00:00', '2026-04-02 23:00:00', '2026-04-02 22:00:00'),
(15, 15, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-02 23:00:00'),
(16, 16, 2, 0.00, 'Pending', 'DEMO-GCASH-000016', 'uploads/demo/payment-proof-0016.txt', NULL, NULL, NULL, '2026-04-03 00:00:00'),
(17, 17, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-03 02:00:00', '2026-04-03 02:00:00', '2026-04-03 01:00:00'),
(18, 18, 2, 0.00, 'Rejected', 'DEMO-GCASH-000018', 'uploads/demo/payment-proof-0018.txt', 9, '2026-04-03 03:00:00', '2026-04-03 03:00:00', '2026-04-03 02:00:00'),
(19, 19, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-03 04:00:00', '2026-04-03 04:00:00', '2026-04-03 03:00:00'),
(20, 20, 2, 0.00, 'Verified', 'DEMO-GCASH-000020', 'uploads/demo/payment-proof-0020.txt', 11, '2026-04-03 05:00:00', '2026-04-03 05:00:00', '2026-04-03 04:00:00'),
(21, 21, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-03 06:00:00', '2026-04-03 06:00:00', '2026-04-03 05:00:00'),
(22, 22, 2, 0.00, 'Pending', 'DEMO-GCASH-000022', 'uploads/demo/payment-proof-0022.txt', NULL, NULL, NULL, '2026-04-03 06:00:00'),
(23, 23, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-03 07:00:00'),
(24, 24, 2, 0.00, 'Verified', 'DEMO-GCASH-000024', 'uploads/demo/payment-proof-0024.txt', 5, '2026-04-03 09:00:00', '2026-04-03 09:00:00', '2026-04-03 08:00:00'),
(25, 25, 1, 0.00, 'Rejected', NULL, NULL, 6, '2026-04-03 10:00:00', '2026-04-03 10:00:00', '2026-04-03 09:00:00'),
(26, 26, 2, 0.00, 'Verified', 'DEMO-GCASH-000026', 'uploads/demo/payment-proof-0026.txt', 7, '2026-04-03 11:00:00', '2026-04-03 11:00:00', '2026-04-03 10:00:00'),
(27, 27, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-03 12:00:00', '2026-04-03 12:00:00', '2026-04-03 11:00:00'),
(28, 28, 2, 0.00, 'Verified', 'DEMO-GCASH-000028', 'uploads/demo/payment-proof-0028.txt', 9, '2026-04-03 13:00:00', '2026-04-03 13:00:00', '2026-04-03 12:00:00'),
(29, 29, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-03 13:00:00'),
(30, 30, 2, 0.00, 'Pending', 'DEMO-GCASH-000030', 'uploads/demo/payment-proof-0030.txt', NULL, NULL, NULL, '2026-04-03 14:00:00'),
(31, 31, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-03 16:00:00', '2026-04-03 16:00:00', '2026-04-03 15:00:00'),
(32, 32, 2, 0.00, 'Rejected', 'DEMO-GCASH-000032', 'uploads/demo/payment-proof-0032.txt', 3, '2026-04-03 17:00:00', '2026-04-03 17:00:00', '2026-04-03 16:00:00'),
(33, 33, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-03 18:00:00', '2026-04-03 18:00:00', '2026-04-03 17:00:00'),
(34, 34, 2, 0.00, 'Verified', 'DEMO-GCASH-000034', 'uploads/demo/payment-proof-0034.txt', 5, '2026-04-03 19:00:00', '2026-04-03 19:00:00', '2026-04-03 18:00:00'),
(35, 35, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-03 20:00:00', '2026-04-03 20:00:00', '2026-04-03 19:00:00'),
(36, 36, 2, 0.00, 'Pending', 'DEMO-GCASH-000036', 'uploads/demo/payment-proof-0036.txt', NULL, NULL, NULL, '2026-04-03 20:00:00'),
(37, 37, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-03 21:00:00'),
(38, 38, 2, 0.00, 'Verified', 'DEMO-GCASH-000038', 'uploads/demo/payment-proof-0038.txt', 9, '2026-04-03 23:00:00', '2026-04-03 23:00:00', '2026-04-03 22:00:00'),
(39, 39, 1, 0.00, 'Rejected', NULL, NULL, 10, '2026-04-04 00:00:00', '2026-04-04 00:00:00', '2026-04-03 23:00:00'),
(40, 40, 2, 0.00, 'Verified', 'DEMO-GCASH-000040', 'uploads/demo/payment-proof-0040.txt', 11, '2026-04-04 01:00:00', '2026-04-04 01:00:00', '2026-04-04 00:00:00'),
(41, 41, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-04 02:00:00', '2026-04-04 02:00:00', '2026-04-04 01:00:00'),
(42, 42, 2, 0.00, 'Verified', 'DEMO-GCASH-000042', 'uploads/demo/payment-proof-0042.txt', 3, '2026-04-04 03:00:00', '2026-04-04 03:00:00', '2026-04-04 02:00:00'),
(43, 43, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-04 03:00:00'),
(44, 44, 2, 0.00, 'Pending', 'DEMO-GCASH-000044', 'uploads/demo/payment-proof-0044.txt', NULL, NULL, NULL, '2026-04-04 04:00:00'),
(45, 45, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-04 06:00:00', '2026-04-04 06:00:00', '2026-04-04 05:00:00'),
(46, 46, 2, 0.00, 'Rejected', 'DEMO-GCASH-000046', 'uploads/demo/payment-proof-0046.txt', 7, '2026-04-04 07:00:00', '2026-04-04 07:00:00', '2026-04-04 06:00:00'),
(47, 47, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-04 08:00:00', '2026-04-04 08:00:00', '2026-04-04 07:00:00'),
(48, 48, 2, 0.00, 'Verified', 'DEMO-GCASH-000048', 'uploads/demo/payment-proof-0048.txt', 9, '2026-04-04 09:00:00', '2026-04-04 09:00:00', '2026-04-04 08:00:00'),
(49, 49, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-04 10:00:00', '2026-04-04 10:00:00', '2026-04-04 09:00:00'),
(50, 50, 2, 0.00, 'Pending', 'DEMO-GCASH-000050', 'uploads/demo/payment-proof-0050.txt', NULL, NULL, NULL, '2026-04-04 10:00:00'),
(51, 51, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-04 11:00:00'),
(52, 52, 2, 0.00, 'Verified', 'DEMO-GCASH-000052', 'uploads/demo/payment-proof-0052.txt', 3, '2026-04-04 13:00:00', '2026-04-04 13:00:00', '2026-04-04 12:00:00'),
(53, 53, 1, 0.00, 'Rejected', NULL, NULL, 4, '2026-04-04 14:00:00', '2026-04-04 14:00:00', '2026-04-04 13:00:00'),
(54, 54, 2, 0.00, 'Verified', 'DEMO-GCASH-000054', 'uploads/demo/payment-proof-0054.txt', 5, '2026-04-04 15:00:00', '2026-04-04 15:00:00', '2026-04-04 14:00:00'),
(55, 55, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-04 16:00:00', '2026-04-04 16:00:00', '2026-04-04 15:00:00'),
(56, 56, 2, 0.00, 'Verified', 'DEMO-GCASH-000056', 'uploads/demo/payment-proof-0056.txt', 7, '2026-04-04 17:00:00', '2026-04-04 17:00:00', '2026-04-04 16:00:00'),
(57, 57, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-04 17:00:00'),
(58, 58, 2, 0.00, 'Pending', 'DEMO-GCASH-000058', 'uploads/demo/payment-proof-0058.txt', NULL, NULL, NULL, '2026-04-04 18:00:00'),
(59, 59, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-04 20:00:00', '2026-04-04 20:00:00', '2026-04-04 19:00:00'),
(60, 60, 2, 0.00, 'Rejected', 'DEMO-GCASH-000060', 'uploads/demo/payment-proof-0060.txt', 11, '2026-04-04 21:00:00', '2026-04-04 21:00:00', '2026-04-04 20:00:00'),
(61, 61, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-04 22:00:00', '2026-04-04 22:00:00', '2026-04-04 21:00:00'),
(62, 62, 2, 0.00, 'Verified', 'DEMO-GCASH-000062', 'uploads/demo/payment-proof-0062.txt', 3, '2026-04-04 23:00:00', '2026-04-04 23:00:00', '2026-04-04 22:00:00'),
(63, 63, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-05 00:00:00', '2026-04-05 00:00:00', '2026-04-04 23:00:00'),
(64, 64, 2, 0.00, 'Pending', 'DEMO-GCASH-000064', 'uploads/demo/payment-proof-0064.txt', NULL, NULL, NULL, '2026-04-05 00:00:00'),
(65, 65, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-05 01:00:00'),
(66, 66, 2, 0.00, 'Verified', 'DEMO-GCASH-000066', 'uploads/demo/payment-proof-0066.txt', 7, '2026-04-05 03:00:00', '2026-04-05 03:00:00', '2026-04-05 02:00:00'),
(67, 67, 1, 0.00, 'Rejected', NULL, NULL, 8, '2026-04-05 04:00:00', '2026-04-05 04:00:00', '2026-04-05 03:00:00'),
(68, 68, 2, 0.00, 'Verified', 'DEMO-GCASH-000068', 'uploads/demo/payment-proof-0068.txt', 9, '2026-04-05 05:00:00', '2026-04-05 05:00:00', '2026-04-05 04:00:00'),
(69, 69, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-05 06:00:00', '2026-04-05 06:00:00', '2026-04-05 05:00:00'),
(70, 70, 2, 0.00, 'Verified', 'DEMO-GCASH-000070', 'uploads/demo/payment-proof-0070.txt', 11, '2026-04-05 07:00:00', '2026-04-05 07:00:00', '2026-04-05 06:00:00'),
(71, 71, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-05 07:00:00'),
(72, 72, 2, 0.00, 'Pending', 'DEMO-GCASH-000072', 'uploads/demo/payment-proof-0072.txt', NULL, NULL, NULL, '2026-04-05 08:00:00'),
(73, 73, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-05 10:00:00', '2026-04-05 10:00:00', '2026-04-05 09:00:00'),
(74, 74, 2, 0.00, 'Rejected', 'DEMO-GCASH-000074', 'uploads/demo/payment-proof-0074.txt', 5, '2026-04-05 11:00:00', '2026-04-05 11:00:00', '2026-04-05 10:00:00'),
(75, 75, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-05 12:00:00', '2026-04-05 12:00:00', '2026-04-05 11:00:00'),
(76, 76, 2, 0.00, 'Verified', 'DEMO-GCASH-000076', 'uploads/demo/payment-proof-0076.txt', 7, '2026-04-05 13:00:00', '2026-04-05 13:00:00', '2026-04-05 12:00:00'),
(77, 77, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-05 14:00:00', '2026-04-05 14:00:00', '2026-04-05 13:00:00'),
(78, 78, 2, 0.00, 'Pending', 'DEMO-GCASH-000078', 'uploads/demo/payment-proof-0078.txt', NULL, NULL, NULL, '2026-04-05 14:00:00'),
(79, 79, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-05 15:00:00'),
(80, 80, 2, 0.00, 'Verified', 'DEMO-GCASH-000080', 'uploads/demo/payment-proof-0080.txt', 11, '2026-04-05 17:00:00', '2026-04-05 17:00:00', '2026-04-05 16:00:00'),
(81, 81, 1, 0.00, 'Rejected', NULL, NULL, 2, '2026-04-05 18:00:00', '2026-04-05 18:00:00', '2026-04-05 17:00:00'),
(82, 82, 2, 0.00, 'Verified', 'DEMO-GCASH-000082', 'uploads/demo/payment-proof-0082.txt', 3, '2026-04-05 19:00:00', '2026-04-05 19:00:00', '2026-04-05 18:00:00'),
(83, 83, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-05 20:00:00', '2026-04-05 20:00:00', '2026-04-05 19:00:00'),
(84, 84, 2, 0.00, 'Verified', 'DEMO-GCASH-000084', 'uploads/demo/payment-proof-0084.txt', 5, '2026-04-05 21:00:00', '2026-04-05 21:00:00', '2026-04-05 20:00:00'),
(85, 85, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-05 21:00:00'),
(86, 86, 2, 0.00, 'Pending', 'DEMO-GCASH-000086', 'uploads/demo/payment-proof-0086.txt', NULL, NULL, NULL, '2026-04-05 22:00:00'),
(87, 87, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-06 00:00:00', '2026-04-06 00:00:00', '2026-04-05 23:00:00'),
(88, 88, 2, 0.00, 'Rejected', 'DEMO-GCASH-000088', 'uploads/demo/payment-proof-0088.txt', 9, '2026-04-06 01:00:00', '2026-04-06 01:00:00', '2026-04-06 00:00:00'),
(89, 89, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-06 02:00:00', '2026-04-06 02:00:00', '2026-04-06 01:00:00'),
(90, 90, 2, 0.00, 'Verified', 'DEMO-GCASH-000090', 'uploads/demo/payment-proof-0090.txt', 11, '2026-04-06 03:00:00', '2026-04-06 03:00:00', '2026-04-06 02:00:00'),
(91, 91, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-06 04:00:00', '2026-04-06 04:00:00', '2026-04-06 03:00:00'),
(92, 92, 2, 0.00, 'Pending', 'DEMO-GCASH-000092', 'uploads/demo/payment-proof-0092.txt', NULL, NULL, NULL, '2026-04-06 04:00:00'),
(93, 93, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-06 05:00:00'),
(94, 94, 2, 0.00, 'Verified', 'DEMO-GCASH-000094', 'uploads/demo/payment-proof-0094.txt', 5, '2026-04-06 07:00:00', '2026-04-06 07:00:00', '2026-04-06 06:00:00'),
(95, 95, 1, 0.00, 'Rejected', NULL, NULL, 6, '2026-04-06 08:00:00', '2026-04-06 08:00:00', '2026-04-06 07:00:00'),
(96, 96, 2, 0.00, 'Verified', 'DEMO-GCASH-000096', 'uploads/demo/payment-proof-0096.txt', 7, '2026-04-06 09:00:00', '2026-04-06 09:00:00', '2026-04-06 08:00:00'),
(97, 97, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-06 10:00:00', '2026-04-06 10:00:00', '2026-04-06 09:00:00'),
(98, 98, 2, 0.00, 'Verified', 'DEMO-GCASH-000098', 'uploads/demo/payment-proof-0098.txt', 9, '2026-04-06 11:00:00', '2026-04-06 11:00:00', '2026-04-06 10:00:00'),
(99, 99, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-06 11:00:00'),
(100, 100, 2, 0.00, 'Pending', 'DEMO-GCASH-000100', 'uploads/demo/payment-proof-0100.txt', NULL, NULL, NULL, '2026-04-06 12:00:00'),
(101, 101, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-06 14:00:00', '2026-04-06 14:00:00', '2026-04-06 13:00:00'),
(102, 102, 2, 0.00, 'Rejected', 'DEMO-GCASH-000102', 'uploads/demo/payment-proof-0102.txt', 3, '2026-04-06 15:00:00', '2026-04-06 15:00:00', '2026-04-06 14:00:00'),
(103, 103, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-06 16:00:00', '2026-04-06 16:00:00', '2026-04-06 15:00:00'),
(104, 104, 2, 0.00, 'Verified', 'DEMO-GCASH-000104', 'uploads/demo/payment-proof-0104.txt', 5, '2026-04-06 17:00:00', '2026-04-06 17:00:00', '2026-04-06 16:00:00'),
(105, 105, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-06 18:00:00', '2026-04-06 18:00:00', '2026-04-06 17:00:00'),
(106, 106, 2, 0.00, 'Pending', 'DEMO-GCASH-000106', 'uploads/demo/payment-proof-0106.txt', NULL, NULL, NULL, '2026-04-06 18:00:00'),
(107, 107, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-06 19:00:00'),
(108, 108, 2, 0.00, 'Verified', 'DEMO-GCASH-000108', 'uploads/demo/payment-proof-0108.txt', 9, '2026-04-06 21:00:00', '2026-04-06 21:00:00', '2026-04-06 20:00:00'),
(109, 109, 1, 0.00, 'Rejected', NULL, NULL, 10, '2026-04-06 22:00:00', '2026-04-06 22:00:00', '2026-04-06 21:00:00'),
(110, 110, 2, 0.00, 'Verified', 'DEMO-GCASH-000110', 'uploads/demo/payment-proof-0110.txt', 11, '2026-04-06 23:00:00', '2026-04-06 23:00:00', '2026-04-06 22:00:00'),
(111, 111, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-07 00:00:00', '2026-04-07 00:00:00', '2026-04-06 23:00:00'),
(112, 112, 2, 0.00, 'Verified', 'DEMO-GCASH-000112', 'uploads/demo/payment-proof-0112.txt', 3, '2026-04-07 01:00:00', '2026-04-07 01:00:00', '2026-04-07 00:00:00'),
(113, 113, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-07 01:00:00'),
(114, 114, 2, 0.00, 'Pending', 'DEMO-GCASH-000114', 'uploads/demo/payment-proof-0114.txt', NULL, NULL, NULL, '2026-04-07 02:00:00'),
(115, 115, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-07 04:00:00', '2026-04-07 04:00:00', '2026-04-07 03:00:00'),
(116, 116, 2, 0.00, 'Rejected', 'DEMO-GCASH-000116', 'uploads/demo/payment-proof-0116.txt', 7, '2026-04-07 05:00:00', '2026-04-07 05:00:00', '2026-04-07 04:00:00'),
(117, 117, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-07 06:00:00', '2026-04-07 06:00:00', '2026-04-07 05:00:00'),
(118, 118, 2, 0.00, 'Verified', 'DEMO-GCASH-000118', 'uploads/demo/payment-proof-0118.txt', 9, '2026-04-07 07:00:00', '2026-04-07 07:00:00', '2026-04-07 06:00:00'),
(119, 119, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-07 08:00:00', '2026-04-07 08:00:00', '2026-04-07 07:00:00'),
(120, 120, 2, 0.00, 'Pending', 'DEMO-GCASH-000120', 'uploads/demo/payment-proof-0120.txt', NULL, NULL, NULL, '2026-04-07 08:00:00'),
(121, 121, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-07 09:00:00'),
(122, 122, 2, 0.00, 'Verified', 'DEMO-GCASH-000122', 'uploads/demo/payment-proof-0122.txt', 3, '2026-04-07 11:00:00', '2026-04-07 11:00:00', '2026-04-07 10:00:00'),
(123, 123, 1, 0.00, 'Rejected', NULL, NULL, 4, '2026-04-07 12:00:00', '2026-04-07 12:00:00', '2026-04-07 11:00:00'),
(124, 124, 2, 0.00, 'Verified', 'DEMO-GCASH-000124', 'uploads/demo/payment-proof-0124.txt', 5, '2026-04-07 13:00:00', '2026-04-07 13:00:00', '2026-04-07 12:00:00'),
(125, 125, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-07 14:00:00', '2026-04-07 14:00:00', '2026-04-07 13:00:00'),
(126, 126, 2, 0.00, 'Verified', 'DEMO-GCASH-000126', 'uploads/demo/payment-proof-0126.txt', 7, '2026-04-07 15:00:00', '2026-04-07 15:00:00', '2026-04-07 14:00:00'),
(127, 127, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-07 15:00:00'),
(128, 128, 2, 0.00, 'Pending', 'DEMO-GCASH-000128', 'uploads/demo/payment-proof-0128.txt', NULL, NULL, NULL, '2026-04-07 16:00:00'),
(129, 129, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-07 18:00:00', '2026-04-07 18:00:00', '2026-04-07 17:00:00'),
(130, 130, 2, 0.00, 'Rejected', 'DEMO-GCASH-000130', 'uploads/demo/payment-proof-0130.txt', 11, '2026-04-07 19:00:00', '2026-04-07 19:00:00', '2026-04-07 18:00:00'),
(131, 131, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-07 20:00:00', '2026-04-07 20:00:00', '2026-04-07 19:00:00'),
(132, 132, 2, 0.00, 'Verified', 'DEMO-GCASH-000132', 'uploads/demo/payment-proof-0132.txt', 3, '2026-04-07 21:00:00', '2026-04-07 21:00:00', '2026-04-07 20:00:00'),
(133, 133, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-07 22:00:00', '2026-04-07 22:00:00', '2026-04-07 21:00:00'),
(134, 134, 2, 0.00, 'Pending', 'DEMO-GCASH-000134', 'uploads/demo/payment-proof-0134.txt', NULL, NULL, NULL, '2026-04-07 22:00:00'),
(135, 135, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-07 23:00:00'),
(136, 136, 2, 0.00, 'Verified', 'DEMO-GCASH-000136', 'uploads/demo/payment-proof-0136.txt', 7, '2026-04-08 01:00:00', '2026-04-08 01:00:00', '2026-04-08 00:00:00'),
(137, 137, 1, 0.00, 'Rejected', NULL, NULL, 8, '2026-04-08 02:00:00', '2026-04-08 02:00:00', '2026-04-08 01:00:00'),
(138, 138, 2, 0.00, 'Verified', 'DEMO-GCASH-000138', 'uploads/demo/payment-proof-0138.txt', 9, '2026-04-08 03:00:00', '2026-04-08 03:00:00', '2026-04-08 02:00:00'),
(139, 139, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-08 04:00:00', '2026-04-08 04:00:00', '2026-04-08 03:00:00'),
(140, 140, 2, 0.00, 'Verified', 'DEMO-GCASH-000140', 'uploads/demo/payment-proof-0140.txt', 11, '2026-04-08 05:00:00', '2026-04-08 05:00:00', '2026-04-08 04:00:00'),
(141, 141, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-08 05:00:00'),
(142, 142, 2, 0.00, 'Pending', 'DEMO-GCASH-000142', 'uploads/demo/payment-proof-0142.txt', NULL, NULL, NULL, '2026-04-08 06:00:00'),
(143, 143, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-08 08:00:00', '2026-04-08 08:00:00', '2026-04-08 07:00:00'),
(144, 144, 2, 0.00, 'Rejected', 'DEMO-GCASH-000144', 'uploads/demo/payment-proof-0144.txt', 5, '2026-04-08 09:00:00', '2026-04-08 09:00:00', '2026-04-08 08:00:00'),
(145, 145, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-08 10:00:00', '2026-04-08 10:00:00', '2026-04-08 09:00:00'),
(146, 146, 2, 0.00, 'Verified', 'DEMO-GCASH-000146', 'uploads/demo/payment-proof-0146.txt', 7, '2026-04-08 11:00:00', '2026-04-08 11:00:00', '2026-04-08 10:00:00'),
(147, 147, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-08 12:00:00', '2026-04-08 12:00:00', '2026-04-08 11:00:00'),
(148, 148, 2, 0.00, 'Pending', 'DEMO-GCASH-000148', 'uploads/demo/payment-proof-0148.txt', NULL, NULL, NULL, '2026-04-08 12:00:00'),
(149, 149, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-08 13:00:00'),
(150, 150, 2, 0.00, 'Verified', 'DEMO-GCASH-000150', 'uploads/demo/payment-proof-0150.txt', 11, '2026-04-08 15:00:00', '2026-04-08 15:00:00', '2026-04-08 14:00:00'),
(151, 151, 1, 0.00, 'Rejected', NULL, NULL, 2, '2026-04-08 16:00:00', '2026-04-08 16:00:00', '2026-04-08 15:00:00'),
(152, 152, 2, 0.00, 'Verified', 'DEMO-GCASH-000152', 'uploads/demo/payment-proof-0152.txt', 3, '2026-04-08 17:00:00', '2026-04-08 17:00:00', '2026-04-08 16:00:00'),
(153, 153, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-08 18:00:00', '2026-04-08 18:00:00', '2026-04-08 17:00:00'),
(154, 154, 2, 0.00, 'Verified', 'DEMO-GCASH-000154', 'uploads/demo/payment-proof-0154.txt', 5, '2026-04-08 19:00:00', '2026-04-08 19:00:00', '2026-04-08 18:00:00'),
(155, 155, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-08 19:00:00'),
(156, 156, 2, 0.00, 'Pending', 'DEMO-GCASH-000156', 'uploads/demo/payment-proof-0156.txt', NULL, NULL, NULL, '2026-04-08 20:00:00'),
(157, 157, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-08 22:00:00', '2026-04-08 22:00:00', '2026-04-08 21:00:00'),
(158, 158, 2, 0.00, 'Rejected', 'DEMO-GCASH-000158', 'uploads/demo/payment-proof-0158.txt', 9, '2026-04-08 23:00:00', '2026-04-08 23:00:00', '2026-04-08 22:00:00'),
(159, 159, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-09 00:00:00', '2026-04-09 00:00:00', '2026-04-08 23:00:00'),
(160, 160, 2, 0.00, 'Verified', 'DEMO-GCASH-000160', 'uploads/demo/payment-proof-0160.txt', 11, '2026-04-09 01:00:00', '2026-04-09 01:00:00', '2026-04-09 00:00:00'),
(161, 161, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-09 02:00:00', '2026-04-09 02:00:00', '2026-04-09 01:00:00'),
(162, 162, 2, 0.00, 'Pending', 'DEMO-GCASH-000162', 'uploads/demo/payment-proof-0162.txt', NULL, NULL, NULL, '2026-04-09 02:00:00'),
(163, 163, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-09 03:00:00'),
(164, 164, 2, 0.00, 'Verified', 'DEMO-GCASH-000164', 'uploads/demo/payment-proof-0164.txt', 5, '2026-04-09 05:00:00', '2026-04-09 05:00:00', '2026-04-09 04:00:00'),
(165, 165, 1, 0.00, 'Rejected', NULL, NULL, 6, '2026-04-09 06:00:00', '2026-04-09 06:00:00', '2026-04-09 05:00:00'),
(166, 166, 2, 0.00, 'Verified', 'DEMO-GCASH-000166', 'uploads/demo/payment-proof-0166.txt', 7, '2026-04-09 07:00:00', '2026-04-09 07:00:00', '2026-04-09 06:00:00'),
(167, 167, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-09 08:00:00', '2026-04-09 08:00:00', '2026-04-09 07:00:00'),
(168, 168, 2, 0.00, 'Verified', 'DEMO-GCASH-000168', 'uploads/demo/payment-proof-0168.txt', 9, '2026-04-09 09:00:00', '2026-04-09 09:00:00', '2026-04-09 08:00:00'),
(169, 169, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-09 09:00:00'),
(170, 170, 2, 0.00, 'Pending', 'DEMO-GCASH-000170', 'uploads/demo/payment-proof-0170.txt', NULL, NULL, NULL, '2026-04-09 10:00:00'),
(171, 171, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-09 12:00:00', '2026-04-09 12:00:00', '2026-04-09 11:00:00'),
(172, 172, 2, 0.00, 'Rejected', 'DEMO-GCASH-000172', 'uploads/demo/payment-proof-0172.txt', 3, '2026-04-09 13:00:00', '2026-04-09 13:00:00', '2026-04-09 12:00:00'),
(173, 173, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-09 14:00:00', '2026-04-09 14:00:00', '2026-04-09 13:00:00'),
(174, 174, 2, 0.00, 'Verified', 'DEMO-GCASH-000174', 'uploads/demo/payment-proof-0174.txt', 5, '2026-04-09 15:00:00', '2026-04-09 15:00:00', '2026-04-09 14:00:00'),
(175, 175, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-09 16:00:00', '2026-04-09 16:00:00', '2026-04-09 15:00:00'),
(176, 176, 2, 0.00, 'Pending', 'DEMO-GCASH-000176', 'uploads/demo/payment-proof-0176.txt', NULL, NULL, NULL, '2026-04-09 16:00:00'),
(177, 177, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-09 17:00:00'),
(178, 178, 2, 0.00, 'Verified', 'DEMO-GCASH-000178', 'uploads/demo/payment-proof-0178.txt', 9, '2026-04-09 19:00:00', '2026-04-09 19:00:00', '2026-04-09 18:00:00'),
(179, 179, 1, 0.00, 'Rejected', NULL, NULL, 10, '2026-04-09 20:00:00', '2026-04-09 20:00:00', '2026-04-09 19:00:00'),
(180, 180, 2, 0.00, 'Verified', 'DEMO-GCASH-000180', 'uploads/demo/payment-proof-0180.txt', 11, '2026-04-09 21:00:00', '2026-04-09 21:00:00', '2026-04-09 20:00:00'),
(181, 181, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-09 22:00:00', '2026-04-09 22:00:00', '2026-04-09 21:00:00'),
(182, 182, 2, 0.00, 'Verified', 'DEMO-GCASH-000182', 'uploads/demo/payment-proof-0182.txt', 3, '2026-04-09 23:00:00', '2026-04-09 23:00:00', '2026-04-09 22:00:00'),
(183, 183, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-09 23:00:00'),
(184, 184, 2, 0.00, 'Pending', 'DEMO-GCASH-000184', 'uploads/demo/payment-proof-0184.txt', NULL, NULL, NULL, '2026-04-10 00:00:00'),
(185, 185, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-10 02:00:00', '2026-04-10 02:00:00', '2026-04-10 01:00:00'),
(186, 186, 2, 0.00, 'Rejected', 'DEMO-GCASH-000186', 'uploads/demo/payment-proof-0186.txt', 7, '2026-04-10 03:00:00', '2026-04-10 03:00:00', '2026-04-10 02:00:00'),
(187, 187, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-10 04:00:00', '2026-04-10 04:00:00', '2026-04-10 03:00:00'),
(188, 188, 2, 0.00, 'Verified', 'DEMO-GCASH-000188', 'uploads/demo/payment-proof-0188.txt', 9, '2026-04-10 05:00:00', '2026-04-10 05:00:00', '2026-04-10 04:00:00'),
(189, 189, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-10 06:00:00', '2026-04-10 06:00:00', '2026-04-10 05:00:00'),
(190, 190, 2, 0.00, 'Pending', 'DEMO-GCASH-000190', 'uploads/demo/payment-proof-0190.txt', NULL, NULL, NULL, '2026-04-10 06:00:00'),
(191, 191, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-10 07:00:00'),
(192, 192, 2, 0.00, 'Verified', 'DEMO-GCASH-000192', 'uploads/demo/payment-proof-0192.txt', 3, '2026-04-10 09:00:00', '2026-04-10 09:00:00', '2026-04-10 08:00:00'),
(193, 193, 1, 0.00, 'Rejected', NULL, NULL, 4, '2026-04-10 10:00:00', '2026-04-10 10:00:00', '2026-04-10 09:00:00'),
(194, 194, 2, 0.00, 'Verified', 'DEMO-GCASH-000194', 'uploads/demo/payment-proof-0194.txt', 5, '2026-04-10 11:00:00', '2026-04-10 11:00:00', '2026-04-10 10:00:00'),
(195, 195, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-10 12:00:00', '2026-04-10 12:00:00', '2026-04-10 11:00:00'),
(196, 196, 2, 0.00, 'Verified', 'DEMO-GCASH-000196', 'uploads/demo/payment-proof-0196.txt', 7, '2026-04-10 13:00:00', '2026-04-10 13:00:00', '2026-04-10 12:00:00'),
(197, 197, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-10 13:00:00'),
(198, 198, 2, 0.00, 'Pending', 'DEMO-GCASH-000198', 'uploads/demo/payment-proof-0198.txt', NULL, NULL, NULL, '2026-04-10 14:00:00'),
(199, 199, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-10 16:00:00', '2026-04-10 16:00:00', '2026-04-10 15:00:00'),
(200, 200, 2, 0.00, 'Rejected', 'DEMO-GCASH-000200', 'uploads/demo/payment-proof-0200.txt', 11, '2026-04-10 17:00:00', '2026-04-10 17:00:00', '2026-04-10 16:00:00'),
(201, 201, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-10 18:00:00', '2026-04-10 18:00:00', '2026-04-10 17:00:00'),
(202, 202, 2, 0.00, 'Verified', 'DEMO-GCASH-000202', 'uploads/demo/payment-proof-0202.txt', 3, '2026-04-10 19:00:00', '2026-04-10 19:00:00', '2026-04-10 18:00:00'),
(203, 203, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-10 20:00:00', '2026-04-10 20:00:00', '2026-04-10 19:00:00'),
(204, 204, 2, 0.00, 'Pending', 'DEMO-GCASH-000204', 'uploads/demo/payment-proof-0204.txt', NULL, NULL, NULL, '2026-04-10 20:00:00'),
(205, 205, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-10 21:00:00'),
(206, 206, 2, 0.00, 'Verified', 'DEMO-GCASH-000206', 'uploads/demo/payment-proof-0206.txt', 7, '2026-04-10 23:00:00', '2026-04-10 23:00:00', '2026-04-10 22:00:00'),
(207, 207, 1, 0.00, 'Rejected', NULL, NULL, 8, '2026-04-11 00:00:00', '2026-04-11 00:00:00', '2026-04-10 23:00:00'),
(208, 208, 2, 0.00, 'Verified', 'DEMO-GCASH-000208', 'uploads/demo/payment-proof-0208.txt', 9, '2026-04-11 01:00:00', '2026-04-11 01:00:00', '2026-04-11 00:00:00'),
(209, 209, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-11 02:00:00', '2026-04-11 02:00:00', '2026-04-11 01:00:00'),
(210, 210, 2, 0.00, 'Verified', 'DEMO-GCASH-000210', 'uploads/demo/payment-proof-0210.txt', 11, '2026-04-11 03:00:00', '2026-04-11 03:00:00', '2026-04-11 02:00:00'),
(211, 211, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-11 03:00:00'),
(212, 212, 2, 0.00, 'Pending', 'DEMO-GCASH-000212', 'uploads/demo/payment-proof-0212.txt', NULL, NULL, NULL, '2026-04-11 04:00:00'),
(213, 213, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-11 06:00:00', '2026-04-11 06:00:00', '2026-04-11 05:00:00'),
(214, 214, 2, 0.00, 'Rejected', 'DEMO-GCASH-000214', 'uploads/demo/payment-proof-0214.txt', 5, '2026-04-11 07:00:00', '2026-04-11 07:00:00', '2026-04-11 06:00:00'),
(215, 215, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-11 08:00:00', '2026-04-11 08:00:00', '2026-04-11 07:00:00'),
(216, 216, 2, 0.00, 'Verified', 'DEMO-GCASH-000216', 'uploads/demo/payment-proof-0216.txt', 7, '2026-04-11 09:00:00', '2026-04-11 09:00:00', '2026-04-11 08:00:00'),
(217, 217, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-11 10:00:00', '2026-04-11 10:00:00', '2026-04-11 09:00:00'),
(218, 218, 2, 0.00, 'Pending', 'DEMO-GCASH-000218', 'uploads/demo/payment-proof-0218.txt', NULL, NULL, NULL, '2026-04-11 10:00:00'),
(219, 219, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-11 11:00:00'),
(220, 220, 2, 0.00, 'Verified', 'DEMO-GCASH-000220', 'uploads/demo/payment-proof-0220.txt', 11, '2026-04-11 13:00:00', '2026-04-11 13:00:00', '2026-04-11 12:00:00'),
(221, 221, 1, 0.00, 'Rejected', NULL, NULL, 2, '2026-04-11 14:00:00', '2026-04-11 14:00:00', '2026-04-11 13:00:00'),
(222, 222, 2, 0.00, 'Verified', 'DEMO-GCASH-000222', 'uploads/demo/payment-proof-0222.txt', 3, '2026-04-11 15:00:00', '2026-04-11 15:00:00', '2026-04-11 14:00:00'),
(223, 223, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-11 16:00:00', '2026-04-11 16:00:00', '2026-04-11 15:00:00'),
(224, 224, 2, 0.00, 'Verified', 'DEMO-GCASH-000224', 'uploads/demo/payment-proof-0224.txt', 5, '2026-04-11 17:00:00', '2026-04-11 17:00:00', '2026-04-11 16:00:00'),
(225, 225, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-11 17:00:00'),
(226, 226, 2, 0.00, 'Pending', 'DEMO-GCASH-000226', 'uploads/demo/payment-proof-0226.txt', NULL, NULL, NULL, '2026-04-11 18:00:00'),
(227, 227, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-11 20:00:00', '2026-04-11 20:00:00', '2026-04-11 19:00:00'),
(228, 228, 2, 0.00, 'Rejected', 'DEMO-GCASH-000228', 'uploads/demo/payment-proof-0228.txt', 9, '2026-04-11 21:00:00', '2026-04-11 21:00:00', '2026-04-11 20:00:00'),
(229, 229, 1, 0.00, 'Verified', NULL, NULL, 10, '2026-04-11 22:00:00', '2026-04-11 22:00:00', '2026-04-11 21:00:00'),
(230, 230, 2, 0.00, 'Verified', 'DEMO-GCASH-000230', 'uploads/demo/payment-proof-0230.txt', 11, '2026-04-11 23:00:00', '2026-04-11 23:00:00', '2026-04-11 22:00:00'),
(231, 231, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-12 00:00:00', '2026-04-12 00:00:00', '2026-04-11 23:00:00'),
(232, 232, 2, 0.00, 'Pending', 'DEMO-GCASH-000232', 'uploads/demo/payment-proof-0232.txt', NULL, NULL, NULL, '2026-04-12 00:00:00'),
(233, 233, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-12 01:00:00'),
(234, 234, 2, 0.00, 'Verified', 'DEMO-GCASH-000234', 'uploads/demo/payment-proof-0234.txt', 5, '2026-04-12 03:00:00', '2026-04-12 03:00:00', '2026-04-12 02:00:00'),
(235, 235, 1, 0.00, 'Rejected', NULL, NULL, 6, '2026-04-12 04:00:00', '2026-04-12 04:00:00', '2026-04-12 03:00:00'),
(236, 236, 2, 0.00, 'Verified', 'DEMO-GCASH-000236', 'uploads/demo/payment-proof-0236.txt', 7, '2026-04-12 05:00:00', '2026-04-12 05:00:00', '2026-04-12 04:00:00'),
(237, 237, 1, 0.00, 'Verified', NULL, NULL, 8, '2026-04-12 06:00:00', '2026-04-12 06:00:00', '2026-04-12 05:00:00'),
(238, 238, 2, 0.00, 'Verified', 'DEMO-GCASH-000238', 'uploads/demo/payment-proof-0238.txt', 9, '2026-04-12 07:00:00', '2026-04-12 07:00:00', '2026-04-12 06:00:00'),
(239, 239, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-12 07:00:00'),
(240, 240, 2, 0.00, 'Pending', 'DEMO-GCASH-000240', 'uploads/demo/payment-proof-0240.txt', NULL, NULL, NULL, '2026-04-12 08:00:00'),
(241, 241, 1, 0.00, 'Verified', NULL, NULL, 2, '2026-04-12 10:00:00', '2026-04-12 10:00:00', '2026-04-12 09:00:00'),
(242, 242, 2, 0.00, 'Rejected', 'DEMO-GCASH-000242', 'uploads/demo/payment-proof-0242.txt', 3, '2026-04-12 11:00:00', '2026-04-12 11:00:00', '2026-04-12 10:00:00'),
(243, 243, 1, 0.00, 'Verified', NULL, NULL, 4, '2026-04-12 12:00:00', '2026-04-12 12:00:00', '2026-04-12 11:00:00'),
(244, 244, 2, 0.00, 'Verified', 'DEMO-GCASH-000244', 'uploads/demo/payment-proof-0244.txt', 5, '2026-04-12 13:00:00', '2026-04-12 13:00:00', '2026-04-12 12:00:00'),
(245, 245, 1, 0.00, 'Verified', NULL, NULL, 6, '2026-04-12 14:00:00', '2026-04-12 14:00:00', '2026-04-12 13:00:00'),
(246, 246, 2, 0.00, 'Pending', 'DEMO-GCASH-000246', 'uploads/demo/payment-proof-0246.txt', NULL, NULL, NULL, '2026-04-12 14:00:00'),
(247, 247, 1, 0.00, 'Pending', NULL, NULL, NULL, NULL, NULL, '2026-04-12 15:00:00'),
(248, 248, 2, 0.00, 'Verified', 'DEMO-GCASH-000248', 'uploads/demo/payment-proof-0248.txt', 9, '2026-04-12 17:00:00', '2026-04-12 17:00:00', '2026-04-12 16:00:00'),
(249, 249, 1, 0.00, 'Rejected', NULL, NULL, 10, '2026-04-12 18:00:00', '2026-04-12 18:00:00', '2026-04-12 17:00:00'),
(250, 250, 2, 0.00, 'Verified', 'DEMO-GCASH-000250', 'uploads/demo/payment-proof-0250.txt', 11, '2026-04-12 19:00:00', '2026-04-12 19:00:00', '2026-04-12 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`payment_method_id`, `method_name`, `description`, `is_active`) VALUES
(1, 'Cash', 'Cash payment at barangay office', 1),
(2, 'GCash', 'GCash electronic payment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `request_statuses`
--

CREATE TABLE `request_statuses` (
  `request_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_statuses`
--

INSERT INTO `request_statuses` (`request_status_id`, `status_name`, `description`) VALUES
(1, 'Pending', 'Awaiting review'),
(2, 'Under Review', 'Being reviewed'),
(3, 'Approved', 'Approved for processing'),
(4, 'Rejected', 'Request rejected'),
(5, 'Processing', 'Being processed'),
(6, 'Ready for Release', 'Ready for release'),
(7, 'Completed', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `requirement_id` int(11) NOT NULL,
  `requirement_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requirement_files`
--

CREATE TABLE `requirement_files` (
  `requirement_file_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `uploaded_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resident_information`
--

CREATE TABLE `resident_information` (
  `resident_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resident_information`
--

INSERT INTO `resident_information` (`resident_id`, `user_id`, `first_name`, `middle_name`, `last_name`, `sex`, `birth_date`, `address`, `contact_number`, `status`, `created_at`) VALUES
(1, 12, 'Alex', 'A.', 'Santos', 'Male', '1980-04-07', 'Purok 1, Sample Street, Barangay Poblacion', '09100000001', 'Verified', '2026-01-03 08:00:00'),
(2, 13, 'Jamie', 'B.', 'Reyes', 'Female', '1980-07-13', 'Purok 2, Sample Street, Barangay Poblacion', '09100000002', 'Verified', '2026-01-04 08:00:00'),
(3, 14, 'Taylor', 'C.', 'Cruz', 'Male', '1980-10-18', 'Purok 3, Sample Street, Barangay Poblacion', '09100000003', 'Verified', '2026-01-05 08:00:00'),
(4, 15, 'Jordan', 'D.', 'Garcia', 'Female', '1981-01-23', 'Purok 4, Sample Street, Barangay Poblacion', '09100000004', 'Verified', '2026-01-06 08:00:00'),
(5, 16, 'Casey', 'E.', 'Mendoza', 'Male', '1981-04-30', 'Purok 5, Sample Street, Barangay Poblacion', '09100000005', 'Pending', '2026-01-07 08:00:00'),
(6, 17, 'Riley', 'F.', 'Flores', 'Female', '1981-08-05', 'Purok 6, Sample Street, Barangay Poblacion', '09100000006', 'Verified', '2026-01-08 08:00:00'),
(7, 18, 'Morgan', 'G.', 'Ramos', 'Male', '1981-11-10', 'Purok 7, Sample Street, Barangay Poblacion', '09100000007', 'Verified', '2026-01-09 08:00:00'),
(8, 19, 'Avery', 'H.', 'Castillo', 'Female', '1982-02-15', 'Purok 8, Sample Street, Barangay Poblacion', '09100000008', 'Verified', '2026-01-10 08:00:00'),
(9, 20, 'Sam', 'A.', 'Bautista', 'Male', '1982-05-23', 'Purok 1, Sample Street, Barangay Poblacion', '09100000009', 'Verified', '2026-01-11 08:00:00'),
(10, 21, 'Cameron', 'B.', 'Rivera', 'Female', '1982-08-28', 'Purok 2, Sample Street, Barangay Poblacion', '09100000010', 'Pending', '2026-01-12 08:00:00'),
(11, 22, 'Alex', 'C.', 'Santos', 'Male', '1982-12-03', 'Purok 3, Sample Street, Barangay Poblacion', '09100000011', 'Verified', '2026-01-13 08:00:00'),
(12, 23, 'Jamie', 'D.', 'Reyes', 'Female', '1983-03-10', 'Purok 4, Sample Street, Barangay Poblacion', '09100000012', 'Verified', '2026-01-14 08:00:00'),
(13, 24, 'Taylor', 'E.', 'Cruz', 'Male', '1983-06-15', 'Purok 5, Sample Street, Barangay Poblacion', '09100000013', 'Verified', '2026-01-15 08:00:00'),
(14, 25, 'Jordan', 'F.', 'Garcia', 'Female', '1983-09-20', 'Purok 6, Sample Street, Barangay Poblacion', '09100000014', 'Verified', '2026-01-16 08:00:00'),
(15, 26, 'Casey', 'G.', 'Mendoza', 'Male', '1983-12-26', 'Purok 7, Sample Street, Barangay Poblacion', '09100000015', 'Pending', '2026-01-17 08:00:00'),
(16, 27, 'Riley', 'H.', 'Flores', 'Female', '1984-04-01', 'Purok 8, Sample Street, Barangay Poblacion', '09100000016', 'Verified', '2026-01-18 08:00:00'),
(17, 28, 'Morgan', 'A.', 'Ramos', 'Male', '1984-07-07', 'Purok 1, Sample Street, Barangay Poblacion', '09100000017', 'Verified', '2026-01-19 08:00:00'),
(18, 29, 'Avery', 'B.', 'Castillo', 'Female', '1984-10-12', 'Purok 2, Sample Street, Barangay Poblacion', '09100000018', 'Verified', '2026-01-20 08:00:00'),
(19, 30, 'Sam', 'C.', 'Bautista', 'Male', '1985-01-17', 'Purok 3, Sample Street, Barangay Poblacion', '09100000019', 'Verified', '2026-01-21 08:00:00'),
(20, 31, 'Cameron', 'D.', 'Rivera', 'Female', '1985-04-24', 'Purok 4, Sample Street, Barangay Poblacion', '09100000020', 'Pending', '2026-01-22 08:00:00'),
(21, 32, 'Alex', 'E.', 'Santos', 'Male', '1985-07-30', 'Purok 5, Sample Street, Barangay Poblacion', '09100000021', 'Verified', '2026-01-23 08:00:00'),
(22, 33, 'Jamie', 'F.', 'Reyes', 'Female', '1985-11-04', 'Purok 6, Sample Street, Barangay Poblacion', '09100000022', 'Verified', '2026-01-24 08:00:00'),
(23, 34, 'Taylor', 'G.', 'Cruz', 'Male', '1986-02-09', 'Purok 7, Sample Street, Barangay Poblacion', '09100000023', 'Verified', '2026-01-25 08:00:00'),
(24, 35, 'Jordan', 'H.', 'Garcia', 'Female', '1986-05-17', 'Purok 8, Sample Street, Barangay Poblacion', '09100000024', 'Verified', '2026-01-26 08:00:00'),
(25, 36, 'Casey', 'A.', 'Mendoza', 'Male', '1986-08-22', 'Purok 1, Sample Street, Barangay Poblacion', '09100000025', 'Pending', '2026-01-27 08:00:00'),
(26, 37, 'Riley', 'B.', 'Flores', 'Female', '1986-11-27', 'Purok 2, Sample Street, Barangay Poblacion', '09100000026', 'Verified', '2026-01-28 08:00:00'),
(27, 38, 'Morgan', 'C.', 'Ramos', 'Male', '1987-03-04', 'Purok 3, Sample Street, Barangay Poblacion', '09100000027', 'Verified', '2026-01-29 08:00:00'),
(28, 39, 'Avery', 'D.', 'Castillo', 'Female', '1987-06-09', 'Purok 4, Sample Street, Barangay Poblacion', '09100000028', 'Verified', '2026-01-30 08:00:00'),
(29, 40, 'Sam', 'E.', 'Bautista', 'Male', '1987-09-14', 'Purok 5, Sample Street, Barangay Poblacion', '09100000029', 'Verified', '2026-01-31 08:00:00'),
(30, 41, 'Cameron', 'F.', 'Rivera', 'Female', '1987-12-20', 'Purok 6, Sample Street, Barangay Poblacion', '09100000030', 'Pending', '2026-02-01 08:00:00'),
(31, 42, 'Alex', 'G.', 'Santos', 'Male', '1988-03-26', 'Purok 7, Sample Street, Barangay Poblacion', '09100000031', 'Verified', '2026-02-02 08:00:00'),
(32, 43, 'Jamie', 'H.', 'Reyes', 'Female', '1988-07-01', 'Purok 8, Sample Street, Barangay Poblacion', '09100000032', 'Verified', '2026-02-03 08:00:00'),
(33, 44, 'Taylor', 'A.', 'Cruz', 'Male', '1988-10-06', 'Purok 1, Sample Street, Barangay Poblacion', '09100000033', 'Verified', '2026-02-04 08:00:00'),
(34, 45, 'Jordan', 'B.', 'Garcia', 'Female', '1989-01-11', 'Purok 2, Sample Street, Barangay Poblacion', '09100000034', 'Verified', '2026-02-05 08:00:00'),
(35, 46, 'Casey', 'C.', 'Mendoza', 'Male', '1989-04-18', 'Purok 3, Sample Street, Barangay Poblacion', '09100000035', 'Pending', '2026-02-06 08:00:00'),
(36, 47, 'Riley', 'D.', 'Flores', 'Female', '1989-07-24', 'Purok 4, Sample Street, Barangay Poblacion', '09100000036', 'Verified', '2026-02-07 08:00:00'),
(37, 48, 'Morgan', 'E.', 'Ramos', 'Male', '1989-10-29', 'Purok 5, Sample Street, Barangay Poblacion', '09100000037', 'Verified', '2026-02-08 08:00:00'),
(38, 49, 'Avery', 'F.', 'Castillo', 'Female', '1990-02-03', 'Purok 6, Sample Street, Barangay Poblacion', '09100000038', 'Verified', '2026-02-09 08:00:00'),
(39, 50, 'Sam', 'G.', 'Bautista', 'Male', '1990-05-11', 'Purok 7, Sample Street, Barangay Poblacion', '09100000039', 'Verified', '2026-02-10 08:00:00'),
(40, 51, 'Cameron', 'H.', 'Rivera', 'Female', '1990-08-16', 'Purok 8, Sample Street, Barangay Poblacion', '09100000040', 'Pending', '2026-02-11 08:00:00'),
(41, 52, 'Alex', 'A.', 'Santos', 'Male', '1990-11-21', 'Purok 1, Sample Street, Barangay Poblacion', '09100000041', 'Verified', '2026-02-12 08:00:00'),
(42, 53, 'Jamie', 'B.', 'Reyes', 'Female', '1991-02-26', 'Purok 2, Sample Street, Barangay Poblacion', '09100000042', 'Verified', '2026-02-13 08:00:00'),
(43, 54, 'Taylor', 'C.', 'Cruz', 'Male', '1991-06-03', 'Purok 3, Sample Street, Barangay Poblacion', '09100000043', 'Verified', '2026-02-14 08:00:00'),
(44, 55, 'Jordan', 'D.', 'Garcia', 'Female', '1991-09-08', 'Purok 4, Sample Street, Barangay Poblacion', '09100000044', 'Verified', '2026-02-15 08:00:00'),
(45, 56, 'Casey', 'E.', 'Mendoza', 'Male', '1991-12-14', 'Purok 5, Sample Street, Barangay Poblacion', '09100000045', 'Pending', '2026-02-16 08:00:00'),
(46, 57, 'Riley', 'F.', 'Flores', 'Female', '1992-03-20', 'Purok 6, Sample Street, Barangay Poblacion', '09100000046', 'Verified', '2026-02-17 08:00:00'),
(47, 58, 'Morgan', 'G.', 'Ramos', 'Male', '1992-06-25', 'Purok 7, Sample Street, Barangay Poblacion', '09100000047', 'Verified', '2026-02-18 08:00:00'),
(48, 59, 'Avery', 'H.', 'Castillo', 'Female', '1992-09-30', 'Purok 8, Sample Street, Barangay Poblacion', '09100000048', 'Verified', '2026-02-19 08:00:00'),
(49, 60, 'Sam', 'A.', 'Bautista', 'Male', '1993-01-05', 'Purok 1, Sample Street, Barangay Poblacion', '09100000049', 'Verified', '2026-02-20 08:00:00'),
(50, 61, 'Cameron', 'B.', 'Rivera', 'Female', '1993-04-12', 'Purok 2, Sample Street, Barangay Poblacion', '09100000050', 'Pending', '2026-02-21 08:00:00'),
(51, 62, 'Alex', 'C.', 'Santos', 'Male', '1993-07-18', 'Purok 3, Sample Street, Barangay Poblacion', '09100000051', 'Verified', '2026-02-22 08:00:00'),
(52, 63, 'Jamie', 'D.', 'Reyes', 'Female', '1993-10-23', 'Purok 4, Sample Street, Barangay Poblacion', '09100000052', 'Verified', '2026-02-23 08:00:00'),
(53, 64, 'Taylor', 'E.', 'Cruz', 'Male', '1994-01-28', 'Purok 5, Sample Street, Barangay Poblacion', '09100000053', 'Verified', '2026-02-24 08:00:00'),
(54, 65, 'Jordan', 'F.', 'Garcia', 'Female', '1994-05-05', 'Purok 6, Sample Street, Barangay Poblacion', '09100000054', 'Verified', '2026-02-25 08:00:00'),
(55, 66, 'Casey', 'G.', 'Mendoza', 'Male', '1994-08-10', 'Purok 7, Sample Street, Barangay Poblacion', '09100000055', 'Pending', '2026-02-26 08:00:00'),
(56, 67, 'Riley', 'H.', 'Flores', 'Female', '1994-11-15', 'Purok 8, Sample Street, Barangay Poblacion', '09100000056', 'Verified', '2026-02-27 08:00:00'),
(57, 68, 'Morgan', 'A.', 'Ramos', 'Male', '1995-02-20', 'Purok 1, Sample Street, Barangay Poblacion', '09100000057', 'Verified', '2026-02-28 08:00:00'),
(58, 69, 'Avery', 'B.', 'Castillo', 'Female', '1995-05-28', 'Purok 2, Sample Street, Barangay Poblacion', '09100000058', 'Verified', '2026-03-01 08:00:00'),
(59, 70, 'Sam', 'C.', 'Bautista', 'Male', '1995-09-02', 'Purok 3, Sample Street, Barangay Poblacion', '09100000059', 'Verified', '2026-03-02 08:00:00'),
(60, 71, 'Cameron', 'D.', 'Rivera', 'Female', '1995-12-08', 'Purok 4, Sample Street, Barangay Poblacion', '09100000060', 'Pending', '2026-03-03 08:00:00'),
(61, 72, 'Alex', 'E.', 'Santos', 'Male', '1996-03-14', 'Purok 5, Sample Street, Barangay Poblacion', '09100000061', 'Verified', '2026-03-04 08:00:00'),
(62, 73, 'Jamie', 'F.', 'Reyes', 'Female', '1996-06-19', 'Purok 6, Sample Street, Barangay Poblacion', '09100000062', 'Verified', '2026-03-05 08:00:00'),
(63, 74, 'Taylor', 'G.', 'Cruz', 'Male', '1996-09-24', 'Purok 7, Sample Street, Barangay Poblacion', '09100000063', 'Verified', '2026-03-06 08:00:00'),
(64, 75, 'Jordan', 'H.', 'Garcia', 'Female', '1996-12-30', 'Purok 8, Sample Street, Barangay Poblacion', '09100000064', 'Verified', '2026-03-07 08:00:00'),
(65, 76, 'Casey', 'A.', 'Mendoza', 'Male', '1997-04-06', 'Purok 1, Sample Street, Barangay Poblacion', '09100000065', 'Pending', '2026-03-08 08:00:00'),
(66, 77, 'Riley', 'B.', 'Flores', 'Female', '1997-07-12', 'Purok 2, Sample Street, Barangay Poblacion', '09100000066', 'Verified', '2026-03-09 08:00:00'),
(67, 78, 'Morgan', 'C.', 'Ramos', 'Male', '1997-10-17', 'Purok 3, Sample Street, Barangay Poblacion', '09100000067', 'Verified', '2026-03-10 08:00:00'),
(68, 79, 'Avery', 'D.', 'Castillo', 'Female', '1998-01-22', 'Purok 4, Sample Street, Barangay Poblacion', '09100000068', 'Verified', '2026-03-11 08:00:00'),
(69, 80, 'Sam', 'E.', 'Bautista', 'Male', '1998-04-29', 'Purok 5, Sample Street, Barangay Poblacion', '09100000069', 'Verified', '2026-03-12 08:00:00'),
(70, 81, 'Cameron', 'F.', 'Rivera', 'Female', '1998-08-04', 'Purok 6, Sample Street, Barangay Poblacion', '09100000070', 'Pending', '2026-03-13 08:00:00'),
(71, 82, 'Alex', 'G.', 'Santos', 'Male', '1998-11-09', 'Purok 7, Sample Street, Barangay Poblacion', '09100000071', 'Verified', '2026-03-14 08:00:00'),
(72, 83, 'Jamie', 'H.', 'Reyes', 'Female', '1999-02-14', 'Purok 8, Sample Street, Barangay Poblacion', '09100000072', 'Verified', '2026-03-15 08:00:00'),
(73, 84, 'Taylor', 'A.', 'Cruz', 'Male', '1999-05-22', 'Purok 1, Sample Street, Barangay Poblacion', '09100000073', 'Verified', '2026-03-16 08:00:00'),
(74, 85, 'Jordan', 'B.', 'Garcia', 'Female', '1999-08-27', 'Purok 2, Sample Street, Barangay Poblacion', '09100000074', 'Verified', '2026-03-17 08:00:00'),
(75, 86, 'Casey', 'C.', 'Mendoza', 'Male', '1999-12-02', 'Purok 3, Sample Street, Barangay Poblacion', '09100000075', 'Pending', '2026-03-18 08:00:00'),
(76, 87, 'Riley', 'D.', 'Flores', 'Female', '2000-03-08', 'Purok 4, Sample Street, Barangay Poblacion', '09100000076', 'Verified', '2026-03-19 08:00:00'),
(77, 88, 'Morgan', 'E.', 'Ramos', 'Male', '2000-06-13', 'Purok 5, Sample Street, Barangay Poblacion', '09100000077', 'Verified', '2026-03-20 08:00:00'),
(78, 89, 'Avery', 'F.', 'Castillo', 'Female', '2000-09-18', 'Purok 6, Sample Street, Barangay Poblacion', '09100000078', 'Verified', '2026-03-21 08:00:00'),
(79, 90, 'Sam', 'G.', 'Bautista', 'Male', '2000-12-24', 'Purok 7, Sample Street, Barangay Poblacion', '09100000079', 'Verified', '2026-03-22 08:00:00'),
(80, 91, 'Cameron', 'H.', 'Rivera', 'Female', '2001-03-31', 'Purok 8, Sample Street, Barangay Poblacion', '09100000080', 'Pending', '2026-03-23 08:00:00'),
(81, 92, 'Alex', 'A.', 'Santos', 'Male', '2001-07-06', 'Purok 1, Sample Street, Barangay Poblacion', '09100000081', 'Verified', '2026-03-24 08:00:00'),
(82, 93, 'Jamie', 'B.', 'Reyes', 'Female', '2001-10-11', 'Purok 2, Sample Street, Barangay Poblacion', '09100000082', 'Verified', '2026-03-25 08:00:00'),
(83, 94, 'Taylor', 'C.', 'Cruz', 'Male', '2002-01-16', 'Purok 3, Sample Street, Barangay Poblacion', '09100000083', 'Verified', '2026-03-26 08:00:00'),
(84, 95, 'Jordan', 'D.', 'Garcia', 'Female', '2002-04-23', 'Purok 4, Sample Street, Barangay Poblacion', '09100000084', 'Verified', '2026-03-27 08:00:00'),
(85, 96, 'Casey', 'E.', 'Mendoza', 'Male', '2002-07-29', 'Purok 5, Sample Street, Barangay Poblacion', '09100000085', 'Pending', '2026-03-28 08:00:00'),
(86, 97, 'Riley', 'F.', 'Flores', 'Female', '2002-11-03', 'Purok 6, Sample Street, Barangay Poblacion', '09100000086', 'Verified', '2026-03-29 08:00:00'),
(87, 98, 'Morgan', 'G.', 'Ramos', 'Male', '2003-02-08', 'Purok 7, Sample Street, Barangay Poblacion', '09100000087', 'Verified', '2026-03-30 08:00:00'),
(88, 99, 'Avery', 'H.', 'Castillo', 'Female', '2003-05-16', 'Purok 8, Sample Street, Barangay Poblacion', '09100000088', 'Verified', '2026-03-31 08:00:00'),
(89, 100, 'Sam', 'A.', 'Bautista', 'Male', '2003-08-21', 'Purok 1, Sample Street, Barangay Poblacion', '09100000089', 'Verified', '2026-04-01 08:00:00'),
(90, 101, 'Cameron', 'B.', 'Rivera', 'Female', '2003-11-26', 'Purok 2, Sample Street, Barangay Poblacion', '09100000090', 'Pending', '2026-04-02 08:00:00'),
(91, 102, 'Alex', 'C.', 'Santos', 'Male', '2004-03-02', 'Purok 3, Sample Street, Barangay Poblacion', '09100000091', 'Verified', '2026-04-03 08:00:00'),
(92, 103, 'Jamie', 'D.', 'Reyes', 'Female', '2004-06-07', 'Purok 4, Sample Street, Barangay Poblacion', '09100000092', 'Verified', '2026-04-04 08:00:00'),
(93, 104, 'Taylor', 'E.', 'Cruz', 'Male', '2004-09-12', 'Purok 5, Sample Street, Barangay Poblacion', '09100000093', 'Verified', '2026-04-05 08:00:00'),
(94, 105, 'Jordan', 'F.', 'Garcia', 'Female', '2004-12-18', 'Purok 6, Sample Street, Barangay Poblacion', '09100000094', 'Verified', '2026-04-06 08:00:00'),
(95, 106, 'Casey', 'G.', 'Mendoza', 'Male', '2005-03-25', 'Purok 7, Sample Street, Barangay Poblacion', '09100000095', 'Pending', '2026-04-07 08:00:00'),
(96, 107, 'Riley', 'H.', 'Flores', 'Female', '2005-06-30', 'Purok 8, Sample Street, Barangay Poblacion', '09100000096', 'Verified', '2026-04-08 08:00:00'),
(97, 108, 'Morgan', 'A.', 'Ramos', 'Male', '2005-10-05', 'Purok 1, Sample Street, Barangay Poblacion', '09100000097', 'Verified', '2026-04-09 08:00:00'),
(98, 109, 'Avery', 'B.', 'Castillo', 'Female', '2006-01-10', 'Purok 2, Sample Street, Barangay Poblacion', '09100000098', 'Verified', '2026-04-10 08:00:00'),
(99, 110, 'Sam', 'C.', 'Bautista', 'Male', '2006-04-17', 'Purok 3, Sample Street, Barangay Poblacion', '09100000099', 'Verified', '2026-04-11 08:00:00'),
(100, 111, 'Cameron', 'D.', 'Rivera', 'Female', '2006-07-23', 'Purok 4, Sample Street, Barangay Poblacion', '09100000100', 'Pending', '2026-04-12 08:00:00'),
(101, 112, 'Juan', NULL, 'Dela Cruz', '', '0000-00-00', '', NULL, 'Pending', '2026-10-29 15:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `resident_verification_documents`
--

CREATE TABLE `resident_verification_documents` (
  `verification_document_id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `verification_method` varchar(100) NOT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `review_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `uploaded_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`) VALUES
(1, 'Resident', 'Resident system user'),
(2, 'Barangay Staff', 'Authorized barangay staff'),
(3, 'Administrator', 'System administrator');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `request_id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `request_status_id` int(11) NOT NULL,
  `processed_by` int(11) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `fee_amount` decimal(10,2) NOT NULL,
  `remarks` text DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`request_id`, `resident_id`, `service_type_id`, `request_status_id`, `processed_by`, `purpose`, `request_date`, `fee_amount`, `remarks`, `processed_at`) VALUES
(1, 1, 1, 1, NULL, 'Employment requirement', '2026-04-01 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(2, 2, 2, 2, 3, 'School requirement', '2026-04-01 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(3, 3, 1, 3, 4, 'Personal records', '2026-04-01 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 13:00:00'),
(4, 4, 2, 4, NULL, 'Financial assistance application', '2026-04-01 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 14:00:00'),
(5, 5, 1, 5, 6, 'General documentation', '2026-04-01 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 15:00:00'),
(6, 6, 2, 6, 7, 'Employment requirement', '2026-04-01 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 16:00:00'),
(7, 7, 1, 7, 8, 'School requirement', '2026-04-01 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 17:00:00'),
(8, 8, 2, 1, NULL, 'Personal records', '2026-04-01 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(9, 9, 1, 2, 10, 'Financial assistance application', '2026-04-01 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(10, 10, 2, 3, 11, 'General documentation', '2026-04-01 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 20:00:00'),
(11, 11, 1, 4, NULL, 'Employment requirement', '2026-04-01 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 21:00:00'),
(12, 12, 2, 5, 3, 'School requirement', '2026-04-01 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 22:00:00'),
(13, 13, 1, 6, 4, 'Personal records', '2026-04-01 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-01 23:00:00'),
(14, 14, 2, 7, 5, 'Financial assistance application', '2026-04-01 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 00:00:00'),
(15, 15, 1, 1, NULL, 'General documentation', '2026-04-02 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(16, 16, 2, 2, 7, 'Employment requirement', '2026-04-02 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(17, 17, 1, 3, 8, 'School requirement', '2026-04-02 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 03:00:00'),
(18, 18, 2, 4, NULL, 'Personal records', '2026-04-02 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 04:00:00'),
(19, 19, 1, 5, 10, 'Financial assistance application', '2026-04-02 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 05:00:00'),
(20, 20, 2, 6, 11, 'General documentation', '2026-04-02 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 06:00:00'),
(21, 21, 1, 7, 2, 'Employment requirement', '2026-04-02 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 07:00:00'),
(22, 22, 2, 1, NULL, 'School requirement', '2026-04-02 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(23, 23, 1, 2, 4, 'Personal records', '2026-04-02 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(24, 24, 2, 3, 5, 'Financial assistance application', '2026-04-02 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 10:00:00'),
(25, 25, 1, 4, NULL, 'General documentation', '2026-04-02 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 11:00:00'),
(26, 26, 2, 5, 7, 'Employment requirement', '2026-04-02 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 12:00:00'),
(27, 27, 1, 6, 8, 'School requirement', '2026-04-02 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 13:00:00'),
(28, 28, 2, 7, 9, 'Personal records', '2026-04-02 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 14:00:00'),
(29, 29, 1, 1, NULL, 'Financial assistance application', '2026-04-02 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(30, 30, 2, 2, 11, 'General documentation', '2026-04-02 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(31, 31, 1, 3, 2, 'Employment requirement', '2026-04-02 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 17:00:00'),
(32, 32, 2, 4, NULL, 'School requirement', '2026-04-02 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 18:00:00'),
(33, 33, 1, 5, 4, 'Personal records', '2026-04-02 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 19:00:00'),
(34, 34, 2, 6, 5, 'Financial assistance application', '2026-04-02 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 20:00:00'),
(35, 35, 1, 7, 6, 'General documentation', '2026-04-02 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-02 21:00:00'),
(36, 36, 2, 1, NULL, 'Employment requirement', '2026-04-02 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(37, 37, 1, 2, 8, 'School requirement', '2026-04-02 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(38, 38, 2, 3, 9, 'Personal records', '2026-04-02 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 00:00:00'),
(39, 39, 1, 4, NULL, 'Financial assistance application', '2026-04-03 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 01:00:00'),
(40, 40, 2, 5, 11, 'General documentation', '2026-04-03 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 02:00:00'),
(41, 41, 1, 6, 2, 'Employment requirement', '2026-04-03 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 03:00:00'),
(42, 42, 2, 7, 3, 'School requirement', '2026-04-03 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 04:00:00'),
(43, 43, 1, 1, NULL, 'Personal records', '2026-04-03 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(44, 44, 2, 2, 5, 'Financial assistance application', '2026-04-03 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(45, 45, 1, 3, 6, 'General documentation', '2026-04-03 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 07:00:00'),
(46, 46, 2, 4, NULL, 'Employment requirement', '2026-04-03 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 08:00:00'),
(47, 47, 1, 5, 8, 'School requirement', '2026-04-03 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 09:00:00'),
(48, 48, 2, 6, 9, 'Personal records', '2026-04-03 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 10:00:00'),
(49, 49, 1, 7, 10, 'Financial assistance application', '2026-04-03 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 11:00:00'),
(50, 50, 2, 1, NULL, 'General documentation', '2026-04-03 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(51, 51, 1, 2, 2, 'Employment requirement', '2026-04-03 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(52, 52, 2, 3, 3, 'School requirement', '2026-04-03 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 14:00:00'),
(53, 53, 1, 4, NULL, 'Personal records', '2026-04-03 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 15:00:00'),
(54, 54, 2, 5, 5, 'Financial assistance application', '2026-04-03 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 16:00:00'),
(55, 55, 1, 6, 6, 'General documentation', '2026-04-03 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 17:00:00'),
(56, 56, 2, 7, 7, 'Employment requirement', '2026-04-03 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 18:00:00'),
(57, 57, 1, 1, NULL, 'School requirement', '2026-04-03 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(58, 58, 2, 2, 9, 'Personal records', '2026-04-03 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(59, 59, 1, 3, 10, 'Financial assistance application', '2026-04-03 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 21:00:00'),
(60, 60, 2, 4, NULL, 'General documentation', '2026-04-03 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 22:00:00'),
(61, 61, 1, 5, 2, 'Employment requirement', '2026-04-03 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-03 23:00:00'),
(62, 62, 2, 6, 3, 'School requirement', '2026-04-03 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 00:00:00'),
(63, 63, 1, 7, 4, 'Personal records', '2026-04-04 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 01:00:00'),
(64, 64, 2, 1, NULL, 'Financial assistance application', '2026-04-04 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(65, 65, 1, 2, 6, 'General documentation', '2026-04-04 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(66, 66, 2, 3, 7, 'Employment requirement', '2026-04-04 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 04:00:00'),
(67, 67, 1, 4, NULL, 'School requirement', '2026-04-04 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 05:00:00'),
(68, 68, 2, 5, 9, 'Personal records', '2026-04-04 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 06:00:00'),
(69, 69, 1, 6, 10, 'Financial assistance application', '2026-04-04 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 07:00:00'),
(70, 70, 2, 7, 11, 'General documentation', '2026-04-04 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 08:00:00'),
(71, 71, 1, 1, NULL, 'Employment requirement', '2026-04-04 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(72, 72, 2, 2, 3, 'School requirement', '2026-04-04 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(73, 73, 1, 3, 4, 'Personal records', '2026-04-04 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 11:00:00'),
(74, 74, 2, 4, NULL, 'Financial assistance application', '2026-04-04 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 12:00:00'),
(75, 75, 1, 5, 6, 'General documentation', '2026-04-04 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 13:00:00'),
(76, 76, 2, 6, 7, 'Employment requirement', '2026-04-04 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 14:00:00'),
(77, 77, 1, 7, 8, 'School requirement', '2026-04-04 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 15:00:00'),
(78, 78, 2, 1, NULL, 'Personal records', '2026-04-04 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(79, 79, 1, 2, 10, 'Financial assistance application', '2026-04-04 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(80, 80, 2, 3, 11, 'General documentation', '2026-04-04 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 18:00:00'),
(81, 81, 1, 4, NULL, 'Employment requirement', '2026-04-04 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 19:00:00'),
(82, 82, 2, 5, 3, 'School requirement', '2026-04-04 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 20:00:00'),
(83, 83, 1, 6, 4, 'Personal records', '2026-04-04 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 21:00:00'),
(84, 84, 2, 7, 5, 'Financial assistance application', '2026-04-04 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-04 22:00:00'),
(85, 85, 1, 1, NULL, 'General documentation', '2026-04-04 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(86, 86, 2, 2, 7, 'Employment requirement', '2026-04-04 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(87, 87, 1, 3, 8, 'School requirement', '2026-04-05 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 01:00:00'),
(88, 88, 2, 4, NULL, 'Personal records', '2026-04-05 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 02:00:00'),
(89, 89, 1, 5, 10, 'Financial assistance application', '2026-04-05 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 03:00:00'),
(90, 90, 2, 6, 11, 'General documentation', '2026-04-05 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 04:00:00'),
(91, 91, 1, 7, 2, 'Employment requirement', '2026-04-05 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 05:00:00'),
(92, 92, 2, 1, NULL, 'School requirement', '2026-04-05 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(93, 93, 1, 2, 4, 'Personal records', '2026-04-05 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(94, 94, 2, 3, 5, 'Financial assistance application', '2026-04-05 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 08:00:00'),
(95, 95, 1, 4, NULL, 'General documentation', '2026-04-05 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 09:00:00'),
(96, 96, 2, 5, 7, 'Employment requirement', '2026-04-05 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 10:00:00'),
(97, 97, 1, 6, 8, 'School requirement', '2026-04-05 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 11:00:00'),
(98, 98, 2, 7, 9, 'Personal records', '2026-04-05 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 12:00:00'),
(99, 99, 1, 1, NULL, 'Financial assistance application', '2026-04-05 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(100, 100, 2, 2, 11, 'General documentation', '2026-04-05 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(101, 1, 1, 3, 2, 'Employment requirement', '2026-04-05 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 15:00:00'),
(102, 2, 2, 4, NULL, 'School requirement', '2026-04-05 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 16:00:00'),
(103, 3, 1, 5, 4, 'Personal records', '2026-04-05 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 17:00:00'),
(104, 4, 2, 6, 5, 'Financial assistance application', '2026-04-05 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 18:00:00'),
(105, 5, 1, 7, 6, 'General documentation', '2026-04-05 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 19:00:00'),
(106, 6, 2, 1, NULL, 'Employment requirement', '2026-04-05 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(107, 7, 1, 2, 8, 'School requirement', '2026-04-05 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(108, 8, 2, 3, 9, 'Personal records', '2026-04-05 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 22:00:00'),
(109, 9, 1, 4, NULL, 'Financial assistance application', '2026-04-05 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-05 23:00:00'),
(110, 10, 2, 5, 11, 'General documentation', '2026-04-05 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 00:00:00'),
(111, 11, 1, 6, 2, 'Employment requirement', '2026-04-06 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 01:00:00'),
(112, 12, 2, 7, 3, 'School requirement', '2026-04-06 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 02:00:00'),
(113, 13, 1, 1, NULL, 'Personal records', '2026-04-06 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(114, 14, 2, 2, 5, 'Financial assistance application', '2026-04-06 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(115, 15, 1, 3, 6, 'General documentation', '2026-04-06 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 05:00:00'),
(116, 16, 2, 4, NULL, 'Employment requirement', '2026-04-06 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 06:00:00'),
(117, 17, 1, 5, 8, 'School requirement', '2026-04-06 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 07:00:00'),
(118, 18, 2, 6, 9, 'Personal records', '2026-04-06 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 08:00:00'),
(119, 19, 1, 7, 10, 'Financial assistance application', '2026-04-06 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 09:00:00'),
(120, 20, 2, 1, NULL, 'General documentation', '2026-04-06 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(121, 21, 1, 2, 2, 'Employment requirement', '2026-04-06 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(122, 22, 2, 3, 3, 'School requirement', '2026-04-06 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 12:00:00'),
(123, 23, 1, 4, NULL, 'Personal records', '2026-04-06 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 13:00:00'),
(124, 24, 2, 5, 5, 'Financial assistance application', '2026-04-06 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 14:00:00'),
(125, 25, 1, 6, 6, 'General documentation', '2026-04-06 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 15:00:00'),
(126, 26, 2, 7, 7, 'Employment requirement', '2026-04-06 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 16:00:00'),
(127, 27, 1, 1, NULL, 'School requirement', '2026-04-06 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(128, 28, 2, 2, 9, 'Personal records', '2026-04-06 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(129, 29, 1, 3, 10, 'Financial assistance application', '2026-04-06 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 19:00:00'),
(130, 30, 2, 4, NULL, 'General documentation', '2026-04-06 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 20:00:00'),
(131, 31, 1, 5, 2, 'Employment requirement', '2026-04-06 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 21:00:00'),
(132, 32, 2, 6, 3, 'School requirement', '2026-04-06 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 22:00:00'),
(133, 33, 1, 7, 4, 'Personal records', '2026-04-06 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-06 23:00:00'),
(134, 34, 2, 1, NULL, 'Financial assistance application', '2026-04-06 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(135, 35, 1, 2, 6, 'General documentation', '2026-04-07 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(136, 36, 2, 3, 7, 'Employment requirement', '2026-04-07 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 02:00:00'),
(137, 37, 1, 4, NULL, 'School requirement', '2026-04-07 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 03:00:00'),
(138, 38, 2, 5, 9, 'Personal records', '2026-04-07 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 04:00:00'),
(139, 39, 1, 6, 10, 'Financial assistance application', '2026-04-07 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 05:00:00'),
(140, 40, 2, 7, 11, 'General documentation', '2026-04-07 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 06:00:00'),
(141, 41, 1, 1, NULL, 'Employment requirement', '2026-04-07 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(142, 42, 2, 2, 3, 'School requirement', '2026-04-07 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(143, 43, 1, 3, 4, 'Personal records', '2026-04-07 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 09:00:00'),
(144, 44, 2, 4, NULL, 'Financial assistance application', '2026-04-07 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 10:00:00'),
(145, 45, 1, 5, 6, 'General documentation', '2026-04-07 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 11:00:00'),
(146, 46, 2, 6, 7, 'Employment requirement', '2026-04-07 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 12:00:00'),
(147, 47, 1, 7, 8, 'School requirement', '2026-04-07 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 13:00:00'),
(148, 48, 2, 1, NULL, 'Personal records', '2026-04-07 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(149, 49, 1, 2, 10, 'Financial assistance application', '2026-04-07 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(150, 50, 2, 3, 11, 'General documentation', '2026-04-07 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 16:00:00'),
(151, 51, 1, 4, NULL, 'Employment requirement', '2026-04-07 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 17:00:00'),
(152, 52, 2, 5, 3, 'School requirement', '2026-04-07 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 18:00:00'),
(153, 53, 1, 6, 4, 'Personal records', '2026-04-07 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 19:00:00'),
(154, 54, 2, 7, 5, 'Financial assistance application', '2026-04-07 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 20:00:00'),
(155, 55, 1, 1, NULL, 'General documentation', '2026-04-07 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(156, 56, 2, 2, 7, 'Employment requirement', '2026-04-07 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(157, 57, 1, 3, 8, 'School requirement', '2026-04-07 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-07 23:00:00'),
(158, 58, 2, 4, NULL, 'Personal records', '2026-04-07 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 00:00:00'),
(159, 59, 1, 5, 10, 'Financial assistance application', '2026-04-08 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 01:00:00'),
(160, 60, 2, 6, 11, 'General documentation', '2026-04-08 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 02:00:00'),
(161, 61, 1, 7, 2, 'Employment requirement', '2026-04-08 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 03:00:00'),
(162, 62, 2, 1, NULL, 'School requirement', '2026-04-08 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(163, 63, 1, 2, 4, 'Personal records', '2026-04-08 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(164, 64, 2, 3, 5, 'Financial assistance application', '2026-04-08 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 06:00:00'),
(165, 65, 1, 4, NULL, 'General documentation', '2026-04-08 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 07:00:00'),
(166, 66, 2, 5, 7, 'Employment requirement', '2026-04-08 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 08:00:00'),
(167, 67, 1, 6, 8, 'School requirement', '2026-04-08 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 09:00:00'),
(168, 68, 2, 7, 9, 'Personal records', '2026-04-08 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 10:00:00'),
(169, 69, 1, 1, NULL, 'Financial assistance application', '2026-04-08 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(170, 70, 2, 2, 11, 'General documentation', '2026-04-08 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(171, 71, 1, 3, 2, 'Employment requirement', '2026-04-08 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 13:00:00'),
(172, 72, 2, 4, NULL, 'School requirement', '2026-04-08 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 14:00:00'),
(173, 73, 1, 5, 4, 'Personal records', '2026-04-08 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 15:00:00'),
(174, 74, 2, 6, 5, 'Financial assistance application', '2026-04-08 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 16:00:00'),
(175, 75, 1, 7, 6, 'General documentation', '2026-04-08 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 17:00:00'),
(176, 76, 2, 1, NULL, 'Employment requirement', '2026-04-08 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(177, 77, 1, 2, 8, 'School requirement', '2026-04-08 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(178, 78, 2, 3, 9, 'Personal records', '2026-04-08 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 20:00:00'),
(179, 79, 1, 4, NULL, 'Financial assistance application', '2026-04-08 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 21:00:00'),
(180, 80, 2, 5, 11, 'General documentation', '2026-04-08 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 22:00:00'),
(181, 81, 1, 6, 2, 'Employment requirement', '2026-04-08 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-08 23:00:00'),
(182, 82, 2, 7, 3, 'School requirement', '2026-04-08 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 00:00:00'),
(183, 83, 1, 1, NULL, 'Personal records', '2026-04-09 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(184, 84, 2, 2, 5, 'Financial assistance application', '2026-04-09 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(185, 85, 1, 3, 6, 'General documentation', '2026-04-09 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 03:00:00'),
(186, 86, 2, 4, NULL, 'Employment requirement', '2026-04-09 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 04:00:00'),
(187, 87, 1, 5, 8, 'School requirement', '2026-04-09 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 05:00:00'),
(188, 88, 2, 6, 9, 'Personal records', '2026-04-09 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 06:00:00'),
(189, 89, 1, 7, 10, 'Financial assistance application', '2026-04-09 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 07:00:00'),
(190, 90, 2, 1, NULL, 'General documentation', '2026-04-09 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(191, 91, 1, 2, 2, 'Employment requirement', '2026-04-09 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(192, 92, 2, 3, 3, 'School requirement', '2026-04-09 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 10:00:00'),
(193, 93, 1, 4, NULL, 'Personal records', '2026-04-09 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 11:00:00'),
(194, 94, 2, 5, 5, 'Financial assistance application', '2026-04-09 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 12:00:00'),
(195, 95, 1, 6, 6, 'General documentation', '2026-04-09 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 13:00:00'),
(196, 96, 2, 7, 7, 'Employment requirement', '2026-04-09 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 14:00:00'),
(197, 97, 1, 1, NULL, 'School requirement', '2026-04-09 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(198, 98, 2, 2, 9, 'Personal records', '2026-04-09 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(199, 99, 1, 3, 10, 'Financial assistance application', '2026-04-09 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 17:00:00'),
(200, 100, 2, 4, NULL, 'General documentation', '2026-04-09 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 18:00:00'),
(201, 1, 1, 5, 2, 'Employment requirement', '2026-04-09 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 19:00:00'),
(202, 2, 2, 6, 3, 'School requirement', '2026-04-09 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 20:00:00'),
(203, 3, 1, 7, 4, 'Personal records', '2026-04-09 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-09 21:00:00'),
(204, 4, 2, 1, NULL, 'Financial assistance application', '2026-04-09 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(205, 5, 1, 2, 6, 'General documentation', '2026-04-09 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(206, 6, 2, 3, 7, 'Employment requirement', '2026-04-09 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 00:00:00'),
(207, 7, 1, 4, NULL, 'School requirement', '2026-04-10 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 01:00:00'),
(208, 8, 2, 5, 9, 'Personal records', '2026-04-10 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 02:00:00'),
(209, 9, 1, 6, 10, 'Financial assistance application', '2026-04-10 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 03:00:00'),
(210, 10, 2, 7, 11, 'General documentation', '2026-04-10 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 04:00:00'),
(211, 11, 1, 1, NULL, 'Employment requirement', '2026-04-10 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(212, 12, 2, 2, 3, 'School requirement', '2026-04-10 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(213, 13, 1, 3, 4, 'Personal records', '2026-04-10 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 07:00:00'),
(214, 14, 2, 4, NULL, 'Financial assistance application', '2026-04-10 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 08:00:00'),
(215, 15, 1, 5, 6, 'General documentation', '2026-04-10 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 09:00:00'),
(216, 16, 2, 6, 7, 'Employment requirement', '2026-04-10 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 10:00:00'),
(217, 17, 1, 7, 8, 'School requirement', '2026-04-10 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 11:00:00'),
(218, 18, 2, 1, NULL, 'Personal records', '2026-04-10 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(219, 19, 1, 2, 10, 'Financial assistance application', '2026-04-10 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(220, 20, 2, 3, 11, 'General documentation', '2026-04-10 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 14:00:00'),
(221, 21, 1, 4, NULL, 'Employment requirement', '2026-04-10 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 15:00:00'),
(222, 22, 2, 5, 3, 'School requirement', '2026-04-10 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 16:00:00'),
(223, 23, 1, 6, 4, 'Personal records', '2026-04-10 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 17:00:00'),
(224, 24, 2, 7, 5, 'Financial assistance application', '2026-04-10 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 18:00:00'),
(225, 25, 1, 1, NULL, 'General documentation', '2026-04-10 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(226, 26, 2, 2, 7, 'Employment requirement', '2026-04-10 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(227, 27, 1, 3, 8, 'School requirement', '2026-04-10 20:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 21:00:00'),
(228, 28, 2, 4, NULL, 'Personal records', '2026-04-10 21:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 22:00:00'),
(229, 29, 1, 5, 10, 'Financial assistance application', '2026-04-10 22:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-10 23:00:00'),
(230, 30, 2, 6, 11, 'General documentation', '2026-04-10 23:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 00:00:00'),
(231, 31, 1, 7, 2, 'Employment requirement', '2026-04-11 00:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 01:00:00'),
(232, 32, 2, 1, NULL, 'School requirement', '2026-04-11 01:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(233, 33, 1, 2, 4, 'Personal records', '2026-04-11 02:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(234, 34, 2, 3, 5, 'Financial assistance application', '2026-04-11 03:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 04:00:00'),
(235, 35, 1, 4, NULL, 'General documentation', '2026-04-11 04:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 05:00:00'),
(236, 36, 2, 5, 7, 'Employment requirement', '2026-04-11 05:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 06:00:00'),
(237, 37, 1, 6, 8, 'School requirement', '2026-04-11 06:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 07:00:00'),
(238, 38, 2, 7, 9, 'Personal records', '2026-04-11 07:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 08:00:00'),
(239, 39, 1, 1, NULL, 'Financial assistance application', '2026-04-11 08:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(240, 40, 2, 2, 11, 'General documentation', '2026-04-11 09:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(241, 41, 1, 3, 2, 'Employment requirement', '2026-04-11 10:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 11:00:00'),
(242, 42, 2, 4, NULL, 'School requirement', '2026-04-11 11:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 12:00:00'),
(243, 43, 1, 5, 4, 'Personal records', '2026-04-11 12:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 13:00:00'),
(244, 44, 2, 6, 5, 'Financial assistance application', '2026-04-11 13:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 14:00:00'),
(245, 45, 1, 7, 6, 'General documentation', '2026-04-11 14:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 15:00:00'),
(246, 46, 2, 1, NULL, 'Employment requirement', '2026-04-11 15:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(247, 47, 1, 2, 8, 'School requirement', '2026-04-11 16:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', NULL),
(248, 48, 2, 3, 9, 'Personal records', '2026-04-11 17:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 18:00:00'),
(249, 49, 1, 4, NULL, 'Financial assistance application', '2026-04-11 18:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 19:00:00'),
(250, 50, 2, 5, 11, 'General documentation', '2026-04-11 19:00:00', 0.00, 'DEMO DATA ONLY - confirm actual fee policy with barangay', '2026-04-11 20:00:00'),
(251, 1, 1, 6, 2, 'TEST ONLY - Employment requirement', '2026-10-22 21:44:06', 0.00, 'TEST: Document prepared and ready for release', '2026-10-29 15:48:02'),
(252, 101, 1, 3, 2, 'TEST ONLY - Employment requirement', '2026-10-29 15:59:56', 0.00, 'Approved by Barangay Staff', '2026-10-29 15:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `service_requirements`
--

CREATE TABLE `service_requirements` (
  `service_requirement_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `service_type_id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `processing_days` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`service_type_id`, `service_name`, `description`, `fee`, `processing_days`, `is_active`, `created_at`) VALUES
(1, 'Barangay Residency Certificate', 'Subject to approved barangay policy and verification', 0.00, 1, 1, '2026-10-13 23:53:24'),
(2, 'Barangay Clearance', 'Subject to approved barangay policy and requirements', 0.00, 1, 1, '2026-10-13 23:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `account_status` varchar(30) NOT NULL DEFAULT 'Active',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `username`, `email`, `password_hash`, `profile_image`, `account_status`, `created_by`, `created_at`) VALUES
(1, 3, 'Jp_admin', 'claudeljohnpaul@gmail.com', 'claudel2323', NULL, 'Active', NULL, '2026-01-01 09:00:00'),
(2, 2, 'demo_staff_01', 'demo_001@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:01:00'),
(3, 2, 'demo_staff_02', 'demo_002@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:02:00'),
(4, 2, 'demo_staff_03', 'demo_003@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:03:00'),
(5, 2, 'demo_staff_04', 'demo_004@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:04:00'),
(6, 2, 'demo_staff_05', 'demo_005@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:05:00'),
(7, 2, 'demo_staff_06', 'demo_006@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:06:00'),
(8, 2, 'demo_staff_07', 'demo_007@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:07:00'),
(9, 2, 'demo_staff_08', 'demo_008@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:08:00'),
(10, 2, 'demo_staff_09', 'demo_009@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:09:00'),
(11, 2, 'demo_staff_10', 'demo_010@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:10:00'),
(12, 1, 'demo_resident_001', 'demo_011@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:11:00'),
(13, 1, 'demo_resident_002', 'demo_012@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:12:00'),
(14, 1, 'demo_resident_003', 'demo_013@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:13:00'),
(15, 1, 'demo_resident_004', 'demo_014@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:14:00'),
(16, 1, 'demo_resident_005', 'demo_015@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:15:00'),
(17, 1, 'demo_resident_006', 'demo_016@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:16:00'),
(18, 1, 'demo_resident_007', 'demo_017@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:17:00'),
(19, 1, 'demo_resident_008', 'demo_018@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:18:00'),
(20, 1, 'demo_resident_009', 'demo_019@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:19:00'),
(21, 1, 'demo_resident_010', 'demo_020@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:20:00'),
(22, 1, 'demo_resident_011', 'demo_021@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:21:00'),
(23, 1, 'demo_resident_012', 'demo_022@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:22:00'),
(24, 1, 'demo_resident_013', 'demo_023@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:23:00'),
(25, 1, 'demo_resident_014', 'demo_024@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:24:00'),
(26, 1, 'demo_resident_015', 'demo_025@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:25:00'),
(27, 1, 'demo_resident_016', 'demo_026@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:26:00'),
(28, 1, 'demo_resident_017', 'demo_027@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:27:00'),
(29, 1, 'demo_resident_018', 'demo_028@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:28:00'),
(30, 1, 'demo_resident_019', 'demo_029@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:29:00'),
(31, 1, 'demo_resident_020', 'demo_030@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:30:00'),
(32, 1, 'demo_resident_021', 'demo_031@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:31:00'),
(33, 1, 'demo_resident_022', 'demo_032@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:32:00'),
(34, 1, 'demo_resident_023', 'demo_033@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:33:00'),
(35, 1, 'demo_resident_024', 'demo_034@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:34:00'),
(36, 1, 'demo_resident_025', 'demo_035@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:35:00'),
(37, 1, 'demo_resident_026', 'demo_036@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:36:00'),
(38, 1, 'demo_resident_027', 'demo_037@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:37:00'),
(39, 1, 'demo_resident_028', 'demo_038@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:38:00'),
(40, 1, 'demo_resident_029', 'demo_039@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:39:00'),
(41, 1, 'demo_resident_030', 'demo_040@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:40:00'),
(42, 1, 'demo_resident_031', 'demo_041@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:41:00'),
(43, 1, 'demo_resident_032', 'demo_042@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:42:00'),
(44, 1, 'demo_resident_033', 'demo_043@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:43:00'),
(45, 1, 'demo_resident_034', 'demo_044@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:44:00'),
(46, 1, 'demo_resident_035', 'demo_045@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:45:00'),
(47, 1, 'demo_resident_036', 'demo_046@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:46:00'),
(48, 1, 'demo_resident_037', 'demo_047@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:47:00'),
(49, 1, 'demo_resident_038', 'demo_048@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:48:00'),
(50, 1, 'demo_resident_039', 'demo_049@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:49:00'),
(51, 1, 'demo_resident_040', 'demo_050@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:50:00'),
(52, 1, 'demo_resident_041', 'demo_051@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:51:00'),
(53, 1, 'demo_resident_042', 'demo_052@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:52:00'),
(54, 1, 'demo_resident_043', 'demo_053@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:53:00'),
(55, 1, 'demo_resident_044', 'demo_054@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:54:00'),
(56, 1, 'demo_resident_045', 'demo_055@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:55:00'),
(57, 1, 'demo_resident_046', 'demo_056@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:56:00'),
(58, 1, 'demo_resident_047', 'demo_057@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:57:00'),
(59, 1, 'demo_resident_048', 'demo_058@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:58:00'),
(60, 1, 'demo_resident_049', 'demo_059@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 09:59:00'),
(61, 1, 'demo_resident_050', 'demo_060@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:00:00'),
(62, 1, 'demo_resident_051', 'demo_061@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:01:00'),
(63, 1, 'demo_resident_052', 'demo_062@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:02:00'),
(64, 1, 'demo_resident_053', 'demo_063@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:03:00'),
(65, 1, 'demo_resident_054', 'demo_064@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:04:00'),
(66, 1, 'demo_resident_055', 'demo_065@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:05:00'),
(67, 1, 'demo_resident_056', 'demo_066@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:06:00'),
(68, 1, 'demo_resident_057', 'demo_067@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:07:00'),
(69, 1, 'demo_resident_058', 'demo_068@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:08:00'),
(70, 1, 'demo_resident_059', 'demo_069@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:09:00'),
(71, 1, 'demo_resident_060', 'demo_070@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:10:00'),
(72, 1, 'demo_resident_061', 'demo_071@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:11:00'),
(73, 1, 'demo_resident_062', 'demo_072@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:12:00'),
(74, 1, 'demo_resident_063', 'demo_073@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:13:00'),
(75, 1, 'demo_resident_064', 'demo_074@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:14:00'),
(76, 1, 'demo_resident_065', 'demo_075@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:15:00'),
(77, 1, 'demo_resident_066', 'demo_076@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:16:00'),
(78, 1, 'demo_resident_067', 'demo_077@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:17:00'),
(79, 1, 'demo_resident_068', 'demo_078@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:18:00'),
(80, 1, 'demo_resident_069', 'demo_079@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:19:00'),
(81, 1, 'demo_resident_070', 'demo_080@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:20:00'),
(82, 1, 'demo_resident_071', 'demo_081@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:21:00'),
(83, 1, 'demo_resident_072', 'demo_082@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:22:00'),
(84, 1, 'demo_resident_073', 'demo_083@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:23:00'),
(85, 1, 'demo_resident_074', 'demo_084@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:24:00'),
(86, 1, 'demo_resident_075', 'demo_085@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:25:00'),
(87, 1, 'demo_resident_076', 'demo_086@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:26:00'),
(88, 1, 'demo_resident_077', 'demo_087@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:27:00'),
(89, 1, 'demo_resident_078', 'demo_088@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:28:00'),
(90, 1, 'demo_resident_079', 'demo_089@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:29:00'),
(91, 1, 'demo_resident_080', 'demo_090@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:30:00'),
(92, 1, 'demo_resident_081', 'demo_091@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:31:00'),
(93, 1, 'demo_resident_082', 'demo_092@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:32:00'),
(94, 1, 'demo_resident_083', 'demo_093@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:33:00'),
(95, 1, 'demo_resident_084', 'demo_094@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:34:00'),
(96, 1, 'demo_resident_085', 'demo_095@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:35:00'),
(97, 1, 'demo_resident_086', 'demo_096@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:36:00'),
(98, 1, 'demo_resident_087', 'demo_097@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:37:00'),
(99, 1, 'demo_resident_088', 'demo_098@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:38:00'),
(100, 1, 'demo_resident_089', 'demo_099@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:39:00'),
(101, 1, 'demo_resident_090', 'demo_100@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:40:00'),
(102, 1, 'demo_resident_091', 'demo_101@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:41:00'),
(103, 1, 'demo_resident_092', 'demo_102@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:42:00'),
(104, 1, 'demo_resident_093', 'demo_103@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:43:00'),
(105, 1, 'demo_resident_094', 'demo_104@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:44:00'),
(106, 1, 'demo_resident_095', 'demo_105@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:45:00'),
(107, 1, 'demo_resident_096', 'demo_106@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:46:00'),
(108, 1, 'demo_resident_097', 'demo_107@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:47:00'),
(109, 1, 'demo_resident_098', 'demo_108@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:48:00'),
(110, 1, 'demo_resident_099', 'demo_109@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:49:00'),
(111, 1, 'demo_resident_100', 'demo_110@example.test', '$2y$12$KHt5OFV1qdh22jTgqHvx/.WljC2fnaWCOuPNg5yvhnTqlvFYZY1pm', NULL, 'Active', 1, '2026-01-01 10:50:00'),
(112, 1, 'demo_resident_502', '', 'REPLACE_WITH_PASSWORD_HASH', NULL, 'Active', NULL, '2026-10-29 15:59:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `fk_announce_creator` (`created_by`);

--
-- Indexes for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  ADD PRIMARY KEY (`official_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `census_activities`
--
ALTER TABLE `census_activities`
  ADD PRIMARY KEY (`census_id`),
  ADD KEY `fk_census_activity_creator` (`created_by`);

--
-- Indexes for table `census_records`
--
ALTER TABLE `census_records`
  ADD PRIMARY KEY (`census_record_id`),
  ADD UNIQUE KEY `uq_census_resident` (`census_id`,`resident_id`),
  ADD KEY `fk_census_record_household` (`household_id`),
  ADD KEY `fk_census_record_resident` (`resident_id`),
  ADD KEY `fk_census_record_verifier` (`verified_by`);

--
-- Indexes for table `concerns`
--
ALTER TABLE `concerns`
  ADD PRIMARY KEY (`concern_id`),
  ADD KEY `fk_con_resident` (`resident_id`),
  ADD KEY `fk_con_status` (`concern_status_id`),
  ADD KEY `fk_con_assignee` (`assigned_to`);

--
-- Indexes for table `concern_statuses`
--
ALTER TABLE `concern_statuses`
  ADD PRIMARY KEY (`concern_status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`),
  ADD UNIQUE KEY `document_number` (`document_number`),
  ADD UNIQUE KEY `qr_token` (`qr_token`),
  ADD KEY `fk_doc_request` (`request_id`),
  ADD KEY `fk_doc_type` (`document_type_id`),
  ADD KEY `fk_doc_generator` (`generated_by`),
  ADD KEY `fk_doc_replaces` (`replaces_document_id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`document_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `households`
--
ALTER TABLE `households`
  ADD PRIMARY KEY (`household_id`),
  ADD UNIQUE KEY `household_number` (`household_number`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_logs_user` (`user_id`);

--
-- Indexes for table `lupon_schedules`
--
ALTER TABLE `lupon_schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `fk_lupon_concern` (`concern_id`),
  ADD KEY `fk_lupon_user` (`scheduled_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notif_user` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_pay_request` (`request_id`),
  ADD KEY `fk_pay_method` (`payment_method_id`),
  ADD KEY `fk_pay_verifier` (`verified_by`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`payment_method_id`),
  ADD UNIQUE KEY `method_name` (`method_name`);

--
-- Indexes for table `request_statuses`
--
ALTER TABLE `request_statuses`
  ADD PRIMARY KEY (`request_status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`requirement_id`),
  ADD UNIQUE KEY `requirement_name` (`requirement_name`);

--
-- Indexes for table `requirement_files`
--
ALTER TABLE `requirement_files`
  ADD PRIMARY KEY (`requirement_file_id`),
  ADD KEY `fk_rf_request` (`request_id`),
  ADD KEY `fk_rf_requirement` (`requirement_id`),
  ADD KEY `fk_rf_uploader` (`uploaded_by`);

--
-- Indexes for table `resident_information`
--
ALTER TABLE `resident_information`
  ADD PRIMARY KEY (`resident_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `resident_verification_documents`
--
ALTER TABLE `resident_verification_documents`
  ADD PRIMARY KEY (`verification_document_id`),
  ADD KEY `fk_rvd_resident` (`resident_id`),
  ADD KEY `fk_rvd_reviewer` (`reviewed_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_req_resident` (`resident_id`),
  ADD KEY `fk_req_service` (`service_type_id`),
  ADD KEY `fk_req_status` (`request_status_id`),
  ADD KEY `fk_req_processor` (`processed_by`);

--
-- Indexes for table `service_requirements`
--
ALTER TABLE `service_requirements`
  ADD PRIMARY KEY (`service_requirement_id`),
  ADD UNIQUE KEY `uq_service_requirement` (`service_type_id`,`requirement_id`),
  ADD KEY `fk_sreq_requirement` (`requirement_id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`service_type_id`),
  ADD UNIQUE KEY `service_name` (`service_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_role` (`role_id`),
  ADD KEY `fk_users_creator` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  MODIFY `official_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `census_activities`
--
ALTER TABLE `census_activities`
  MODIFY `census_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `census_records`
--
ALTER TABLE `census_records`
  MODIFY `census_record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `concerns`
--
ALTER TABLE `concerns`
  MODIFY `concern_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `concern_statuses`
--
ALTER TABLE `concern_statuses`
  MODIFY `concern_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `households`
--
ALTER TABLE `households`
  MODIFY `household_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `lupon_schedules`
--
ALTER TABLE `lupon_schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request_statuses`
--
ALTER TABLE `request_statuses`
  MODIFY `request_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `requirement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requirement_files`
--
ALTER TABLE `requirement_files`
  MODIFY `requirement_file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resident_information`
--
ALTER TABLE `resident_information`
  MODIFY `resident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `resident_verification_documents`
--
ALTER TABLE `resident_verification_documents`
  MODIFY `verification_document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `service_requirements`
--
ALTER TABLE `service_requirements`
  MODIFY `service_requirement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `service_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_announce_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  ADD CONSTRAINT `fk_official_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `census_activities`
--
ALTER TABLE `census_activities`
  ADD CONSTRAINT `fk_census_activity_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `census_records`
--
ALTER TABLE `census_records`
  ADD CONSTRAINT `fk_census_record_activity` FOREIGN KEY (`census_id`) REFERENCES `census_activities` (`census_id`),
  ADD CONSTRAINT `fk_census_record_household` FOREIGN KEY (`household_id`) REFERENCES `households` (`household_id`),
  ADD CONSTRAINT `fk_census_record_resident` FOREIGN KEY (`resident_id`) REFERENCES `resident_information` (`resident_id`),
  ADD CONSTRAINT `fk_census_record_verifier` FOREIGN KEY (`verified_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `concerns`
--
ALTER TABLE `concerns`
  ADD CONSTRAINT `fk_con_assignee` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_con_resident` FOREIGN KEY (`resident_id`) REFERENCES `resident_information` (`resident_id`),
  ADD CONSTRAINT `fk_con_status` FOREIGN KEY (`concern_status_id`) REFERENCES `concern_statuses` (`concern_status_id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_doc_generator` FOREIGN KEY (`generated_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_doc_replaces` FOREIGN KEY (`replaces_document_id`) REFERENCES `documents` (`document_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_doc_request` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`request_id`),
  ADD CONSTRAINT `fk_doc_type` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`document_type_id`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `fk_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `lupon_schedules`
--
ALTER TABLE `lupon_schedules`
  ADD CONSTRAINT `fk_lupon_concern` FOREIGN KEY (`concern_id`) REFERENCES `concerns` (`concern_id`),
  ADD CONSTRAINT `fk_lupon_user` FOREIGN KEY (`scheduled_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_pay_method` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`payment_method_id`),
  ADD CONSTRAINT `fk_pay_request` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`request_id`),
  ADD CONSTRAINT `fk_pay_verifier` FOREIGN KEY (`verified_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `requirement_files`
--
ALTER TABLE `requirement_files`
  ADD CONSTRAINT `fk_rf_request` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`request_id`),
  ADD CONSTRAINT `fk_rf_requirement` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`requirement_id`),
  ADD CONSTRAINT `fk_rf_uploader` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `resident_information`
--
ALTER TABLE `resident_information`
  ADD CONSTRAINT `fk_resident_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `resident_verification_documents`
--
ALTER TABLE `resident_verification_documents`
  ADD CONSTRAINT `fk_rvd_resident` FOREIGN KEY (`resident_id`) REFERENCES `resident_information` (`resident_id`),
  ADD CONSTRAINT `fk_rvd_reviewer` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `fk_req_processor` FOREIGN KEY (`processed_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_req_resident` FOREIGN KEY (`resident_id`) REFERENCES `resident_information` (`resident_id`),
  ADD CONSTRAINT `fk_req_service` FOREIGN KEY (`service_type_id`) REFERENCES `service_types` (`service_type_id`),
  ADD CONSTRAINT `fk_req_status` FOREIGN KEY (`request_status_id`) REFERENCES `request_statuses` (`request_status_id`);

--
-- Constraints for table `service_requirements`
--
ALTER TABLE `service_requirements`
  ADD CONSTRAINT `fk_sreq_requirement` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`requirement_id`),
  ADD CONSTRAINT `fk_sreq_service` FOREIGN KEY (`service_type_id`) REFERENCES `service_types` (`service_type_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
