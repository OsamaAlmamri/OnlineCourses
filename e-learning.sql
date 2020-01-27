-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27 يناير 2020 الساعة 14:14
-- إصدار الخادم: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-learning`
--

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` text NOT NULL,
  `category_parents` text DEFAULT '0',
  `category_status` int(10) NOT NULL,
  `category_visibility` int(10) NOT NULL,
  `category_date` datetime NOT NULL,
  `category_updates` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `category_parents`, `category_status`, `category_visibility`, `category_date`, `category_updates`) VALUES
(1, 'IT', 'it', '0', 1, 1, '2020-01-28 00:00:00', '2'),
(2, 'Helath', 'Helath', '0', 0, 0, '0000-00-00 00:00:00', NULL),
(3, 'web', '', '1', 1, 1, '0000-00-00 00:00:00', NULL),
(4, 'Android', '', '1', 1, 0, '0000-00-00 00:00:00', NULL),
(5, 'DataMining', '', '1', 0, 1, '0000-00-00 00:00:00', NULL),
(6, 'iugu', '', '2', 1, 0, '0000-00-00 00:00:00', NULL),
(7, 'php', '', '3', 1, 1, '0000-00-00 00:00:00', NULL),
(8, 'paython', '', '3', 1, 1, '0000-00-00 00:00:00', NULL),
(9, 'flutter', '', '4', 0, 1, '0000-00-00 00:00:00', NULL),
(10, 'java', '', '4', 1, 1, '0000-00-00 00:00:00', NULL),
(48, 'network', '                ', '1', 0, 1, '0000-00-00 00:00:00', NULL),
(49, 'CNNA', '                ', '48', 0, 0, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `comment_status` int(10) NOT NULL,
  `course_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_title` text NOT NULL,
  `coupon_date` datetime NOT NULL,
  `coupon_start_date` datetime NOT NULL,
  `coupon_end_date` datetime NOT NULL,
  `coupon_key` text NOT NULL,
  `coupon_status` int(10) NOT NULL,
  `coupon_discount` float NOT NULL,
  `coupon_create_by` int(11) NOT NULL,
  `coupon_for_courses` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_title` text NOT NULL,
  `course__description` text NOT NULL,
  `courses_image` text NOT NULL,
  `course_price` float NOT NULL,
  `course_requirements` text NOT NULL,
  `course_students_target` text NOT NULL,
  `course_goals` text NOT NULL,
  `categories_ids` text NOT NULL,
  `course_date` int(11) NOT NULL,
  `course_status` int(10) NOT NULL,
  `course_updates` text NOT NULL,
  `course_visibility` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `course_resources`
--

CREATE TABLE `course_resources` (
  `resources_id` int(11) NOT NULL,
  `resources_video` text NOT NULL,
  `resources_file` text NOT NULL,
  `resources_chapter` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `resources_date` datetime NOT NULL,
  `resources_status` int(11) NOT NULL,
  `resources_updates` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `evaluations`
--

CREATE TABLE `evaluations` (
  `evaluation_id` int(11) NOT NULL,
  `evaluation_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `evaluation_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_text` text NOT NULL,
  `user_sender_id` int(11) NOT NULL,
  `send_to` text NOT NULL,
  `notification_date` datetime NOT NULL,
  `notification_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(255) NOT NULL,
  `permissions_description` text NOT NULL,
  `permission_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_role_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `profiles`
--

CREATE TABLE `profiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_full_name` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `user_phone` text NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `user_qualification` varchar(255) DEFAULT NULL,
  `user_register_date` datetime NOT NULL,
  `user_updates` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `profiles`
--

INSERT INTO `profiles` (`profile_id`, `user_id`, `user_full_name`, `user_image`, `document`, `user_phone`, `user_gender`, `user_qualification`, `user_register_date`, `user_updates`) VALUES
(1, 5, 'hkj', 'nk', 'kjk', 'kk', '4', '4', '2020-01-20 00:00:00', NULL),
(5, 29, 'uhi iu inoi  iuh ', '/images/users/profiles/default.png', '/images/universities/document/default.png', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(6, 30, '147147 oih dd ', '/images/users/profiles/1579783172echarts (25).png', '/images/universities/document/default.png', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(7, 31, '147147 oih dd ', '/images/users/profiles/default.png', '/images/universities/document/default.png', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(8, 32, 'iy kbjkj vdshl', '/images/users/profiles/1579783653echarts (25).png', '/images/universities/document/default.png', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(9, 1, 'osama mohammed', '', '', '773569041', 'male', '', '2020-01-20 00:00:00', NULL),
(10, 33, 'osama mohammed ahmed ', '/images/users/profiles/1580057196_20191006_020221.JPG', '4.jpg', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(11, 34, '147147 oih dd ', '/images/users/profiles/1580126520git.PNG', NULL, '54545256', 'male', '1', '0000-00-00 00:00:00', NULL),
(12, 35, 'osama mohammed ', '/images/users/profiles/15801266654.jpg', '', '785', 'male', '1', '0000-00-00 00:00:00', NULL),
(13, 36, 'osama mohammed ahmed ali', '/images/users/profiles/15801268924.jpg', '', '661918890', 'male', '1', '0000-00-00 00:00:00', NULL),
(14, 37, 'p jn uhi ', '/images/users/profiles/15801270074.jpg', '/images/universities/document/default.png', '8', 'male', '1', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_description` text NOT NULL,
  `role_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `role_description`, `role_status`) VALUES
(1, 'admin', 'admins', 1),
(2, 'university', 'university', 1),
(3, 'student', 'students', 1),
(4, 'teacher', 'ijgomvjco', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `user_id` int(255) NOT NULL,
  `university_id` int(11) DEFAULT 0,
  `user_email` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` text NOT NULL,
  `user_activation_key` text NOT NULL,
  `user_status` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`user_id`, `university_id`, `user_email`, `user_name`, `user_password`, `user_activation_key`, `user_status`) VALUES
(1, 0, 'straw4hat@gmail.com', 'sam', '28707e14e88523777d295deaad67407b', '123', 1),
(5, 0, 'ali2@gmail.com', 'ali2', '28707e14e88523777d295deaad67407b', '123', 1),
(29, 0, 'mmmkkkmm@f.ff', 'ali', '28707e14e88523777d295deaad67407b', '6025', 1),
(30, 0, 'll@e.s', 'njkj njikn hjbkj', 'e8836edf9ff4213a9f3c4588a116db21', '3496', 0),
(31, 0, 'll@e.sll', 'njkj njikn hjbkj jhiiu', 'e8836edf9ff4213a9f3c4588a116db21', '2375', 1),
(32, 0, 'kkll@e.sll', 'njkj njikn hjmmmm', 'e8836edf9ff4213a9f3c4588a116db21', '4702', 0),
(33, 1, 'straw4ha2t@gmail.com', 'osama5', '4855d34ff1b1fb69203b7de9e33de8a1', '2438', 0),
(34, 1, 'straw44xhat@gmail.com', 't1', 'e8836edf9ff4213a9f3c4588a116db21', '6488', 0),
(35, 1, '1@1.d', 't2', 'e8836edf9ff4213a9f3c4588a116db21', '1449', 0),
(36, 1, 'straw4hnjhlat@gmail.com', 't4', 'e8836edf9ff4213a9f3c4588a116db21', '3264', 0),
(37, NULL, 'osama1287@gmail.com', 'hiuh uhgou okop', 'e8836edf9ff4213a9f3c4588a116db21', '2071', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `users_courses`
--

CREATE TABLE `users_courses` (
  `users_courses_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `couces_buy` text NOT NULL,
  `user_wish_list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `user_role`
--

CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `extra_permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `user_role`
--

INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`, `extra_permissions`) VALUES
(1, 1, 2, ''),
(4, 29, 2, ''),
(5, 30, 3, ''),
(6, 31, 2, ''),
(7, 32, 3, ''),
(8, 5, 2, ''),
(10, 33, 2, ''),
(11, 36, 4, ''),
(12, 37, 3, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `coupon_create_by` (`coupon_create_by`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_resources`
--
ALTER TABLE `course_resources`
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_sender_id` (`user_sender_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_role_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_profile` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `users_courses`
--
ALTER TABLE `users_courses`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_role_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `evaluation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `permission_role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- القيود للجدول `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`coupon_create_by`) REFERENCES `users` (`user_id`);

--
-- القيود للجدول `course_resources`
--
ALTER TABLE `course_resources`
  ADD CONSTRAINT `course_resources_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- القيود للجدول `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- القيود للجدول `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_sender_id`) REFERENCES `users` (`user_id`);

--
-- القيود للجدول `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`);

--
-- القيود للجدول `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `user_profile` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- القيود للجدول `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `users` (`user_id`);

--
-- القيود للجدول `users_courses`
--
ALTER TABLE `users_courses`
  ADD CONSTRAINT `users_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- القيود للجدول `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
