-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11 فبراير 2020 الساعة 08:05
-- إصدار الخادم: 10.1.37-MariaDB
-- PHP Version: 7.3.1

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
  `category_parents` text,
  `category_status` int(10) NOT NULL,
  `category_visibility` int(10) NOT NULL,
  `category_date` datetime NOT NULL,
  `category_updates` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `category_parents`, `category_status`, `category_visibility`, `category_date`, `category_updates`) VALUES
(1, 'IT', 'it', '0', 1, 0, '2020-01-28 00:00:00', '2'),
(2, 'Helath', 'Helath', '0', 1, 0, '0000-00-00 00:00:00', NULL),
(3, 'web', '', '1', 0, 1, '0000-00-00 00:00:00', NULL),
(4, 'Android', '', '1', 0, 0, '0000-00-00 00:00:00', NULL),
(5, 'DataMining', '', '1', 1, 1, '0000-00-00 00:00:00', NULL),
(7, 'php', '', 'level3_3', 1, 0, '0000-00-00 00:00:00', NULL),
(8, 'paython', '', 'level3_3', 1, 1, '0000-00-00 00:00:00', NULL),
(9, 'flutter', '', 'level3_4', 1, 1, '0000-00-00 00:00:00', NULL),
(10, 'java', '', 'level3_4', 1, 1, '0000-00-00 00:00:00', NULL),
(48, 'network', '                ', '1', 0, 1, '0000-00-00 00:00:00', NULL),
(49, 'CNNA', '                ', 'level3_48', 0, 0, '0000-00-00 00:00:00', NULL),
(50, 'js', '                ', 'level3_3', 0, 0, '0000-00-00 00:00:00', NULL),
(51, 'enginnering', '                ', '0', 0, 0, '0000-00-00 00:00:00', NULL),
(52, 'electrestic', '                ', '51', 0, 0, '0000-00-00 00:00:00', NULL),
(53, 'rechnology', '&lt;p&gt;oij&lt;/p&gt;', '0', 0, 0, '0000-00-00 00:00:00', NULL),
(54, 'kotlin', 'kotlin', 'level3_4', 0, 0, '0000-00-00 00:00:00', NULL),
(55, 'j9oj', '                hnoij[', '0', 0, 0, '0000-00-00 00:00:00', NULL);

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
  `course_owner` int(11) NOT NULL,
  `course_title` text NOT NULL,
  `course_description` text NOT NULL,
  `courses_image` text NOT NULL,
  `course_price` float NOT NULL,
  `course_price_afterDiscount` int(11) NOT NULL,
  `course_requirements` text NOT NULL,
  `course_students_target` text NOT NULL,
  `course_goals` text NOT NULL,
  `categories_ids` text NOT NULL,
  `course_date` int(11) NOT NULL,
  `course_status` int(10) DEFAULT '1',
  `course_updates` text,
  `course_visibility` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `courses`
--

INSERT INTO `courses` (`course_id`, `course_owner`, `course_title`, `course_description`, `courses_image`, `course_price`, `course_price_afterDiscount`, `course_requirements`, `course_students_target`, `course_goals`, `categories_ids`, `course_date`, `course_status`, `course_updates`, `course_visibility`) VALUES
(5, 36, 'github', '&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;strong dir=&quot;rtl&quot;&gt;2. محول WebM إلى MP4 على شبكة الانترنت&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;هناك بعض المواقع الإلكترونية التي يمكنك زيارتها حيث تحصل على محول على شبكة الانترنت يسمح لك بتحويل WebM إلى MP4. يمكنك كذلك الاستفادة من العديد من الخيارات عندما يتعلق الأمر باستخدام محول WebM إلى MP4 من على شبكة الانترنت:&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.zamzar.com/&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;Zamzar&lt;/a&gt;&amp;nbsp;هو محول مجاني على شبكة الانترنت يسمح لك بتحويل الملفات إلى تنسيق mp4 عبر الانترنت مجانا. كل ما عليك فعله هو الحصول على اتصال جيد بشبكة الانترنت لتحويل الملفات بنجاح. يمكن استخدام Zamzar لتحويل ملفات WebM إلى مختلف التنسيقات مثل 3gp, 3g2, aac, ac3, avi, flv, flac, gif, mp3, mp4, mpg, ogg, wav و wmv. لاستخدامه، عليك زيارة الموقع الرسمي Zamzar والاتصال بالانترنت لبدء تحويل الملفات. واحد من أفضل الأمور التي عليك معرفتها حول هذا المحول هو أنه يمكنه تحويل الملفات بسرعة كبيرة للغاية. هو برنامج مجاني وسهل الاستخدام. المشكلة الوحيدة هو أنه لا يمكنك استخدامه قط إن لم تكن متصلا بالانترنت.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.apowersoft.com/free-online-video-converter&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;أبوويرسوفت&lt;/a&gt;&amp;nbsp;هو خيار آخر رائع لتحويل الملفات عبر شبكة الانترنت. هو محول قوي من تنسيق webm إلى MP4 يمكن استخدامه لتحويل الملفات عبر الانترنت مجانا. هذه الأداة عبر الانترنت لن تحتاج إلى تنزيل برنامج لها لاستخدامها. يوفر لك تحويل سريع للملفات بسرعة كبيرة للغاية. يدعم نطاق واسع من تنسيقات الفيديو والصوت مثل VCD, DVD, PSP, آي باد وآي فون. الخصائص الأخرى التي يقدمها هي التحويل السريع والجودة العالية التي تتراوح بين 144p حتى 1080p وتنسيقات المخرج الكثيرة وكذلك الإعدادات وسهولة الاستخدام. مثل تطبيق Zamzar، العيب الوحيد بهذا المحول هو أنه عليك الاتصال بالانترنت لاستخدامه.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;strong dir=&quot;rtl&quot;&gt;3. محول WebM إلى MP4 المجاني&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;ماذا عن تحويل الملفات دون الاتصال بالانترنت؟ هذا ممكن بالتأكيد! يمكنك القيام بذلك عبر تحميل محول يمكنه تحويل الملفات دون الاتصال بالإنترنت. الانترنت يوفر لك العديد من الخيارات للاختيار من بينها بما فيها:&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.apowersoft.com/video-converter-studio.html&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;محول فيديو ستوديو&lt;/a&gt;&amp;nbsp;هو محول عالي الكفاءة الذي صمم خصيصا لتحويل كافة تنسيقات الفيديو والصوت. يقدم لك المحول خصائص متقدمة وكذلك مميزات مثل تحرير الفيديو التي تشمل قص مقاطع الفيديو وضبط تأثيرات الفيديو وقص حجم الفيديو واستيراد الترجمة الخارجية ودمج عدة مقاطع من الفيديو وكذلك تحويل الفيديو إلى تنسيقات متوافقة مع الأجهزة المحمولة مثل أندرويد. من السهل استخدامه كما ترغب ولا تحتاج إلى الاتصال بالانترنت حتى تبدأ تحويل الملفات. المشكلة التي ربما تواجهك هي سرعة التحويل حيث يستغرق وقتا أطول بالمقارنة مع التطبيقات عبر الانترنت.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;يمكنك كذلك استخدام&amp;nbsp;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.any-video-converter.com/products/for_video_free/&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;إني فيديو كوفيرتر&lt;/a&gt;&amp;nbsp;لتحويل الملفات إلى mp4 اليوم. تماما مثلما ذكرنا، هذا المحول يوفر لك سهولة الاستخدام ودعم نطاق واسع من تنسيقات الملفات عند التحويل. يمكنك استخدام محول الفيديو أني لتحويل ملفات webm إلى كافة التنسيقات المتوافرة تقريبا. المشكلة الوحيد هو أنه يستغرق أكثر من ساعة لتحويل الملف. تحويل الملفات سوف يتسبب بالتأكيد في استغراق مزيدا من الوقت.&lt;/p&gt;', '/images/site/1.jpg', 55, 20, '', '&lt;p&gt;[l[l&lt;/p&gt;', '&lt;p&gt;[l[l&lt;/p&gt;', '[\"8\"]', 0, 1, NULL, 1),
(7, 43, 'اندرويد', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '/images/site/1.jpg', 150, 100, '', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '[\"10\"]', 0, 1, NULL, 1);

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

--
-- إرجاع أو استيراد بيانات الجدول `course_resources`
--

INSERT INTO `course_resources` (`resources_id`, `resources_video`, `resources_file`, `resources_chapter`, `course_id`, `resources_date`, `resources_status`, `resources_updates`) VALUES
(16, '/videos/videoplayback (3).mp4', '', 'chapter3', 5, '0000-00-00 00:00:00', 0, ''),
(17, '/videos/videoplayback (3).mp4', '', 'chapter3', 5, '0000-00-00 00:00:00', 0, ''),
(18, '/videos/videoplayback (3).mp4', '', 'chapter4', 5, '0000-00-00 00:00:00', 0, ''),
(19, '/videos/videoplayback (3).mp4', '', 'chapter4', 5, '0000-00-00 00:00:00', 0, ''),
(20, '/videos/videoplayback (3).mp4', '', 'chapter5', 5, '0000-00-00 00:00:00', 0, ''),
(21, '/videos/videoplayback (3).mp4', '', 'chapter3', 5, '0000-00-00 00:00:00', 0, ''),
(22, '/videos/videoplayback (3).mp4', '', 'chapter1', 5, '0000-00-00 00:00:00', 0, ''),
(23, '/videos/videoplayback (3).mp4', '', 'مرحلة التقسيم ', 5, '0000-00-00 00:00:00', 0, ''),
(24, '/videos/videoplayback (3).mp4', '', 'مقدمة', 7, '0000-00-00 00:00:00', 0, ''),
(25, '/videos/videoplayback (3).mp4', '', 'الفصل الاول', 7, '0000-00-00 00:00:00', 0, '');

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

--
-- إرجاع أو استيراد بيانات الجدول `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission_name`, `permissions_description`, `permission_status`) VALUES
(1, 'admin_index', 'الصفحة الرئيسة للوحى التحكم', 0),
(2, 'course_index', 'الصفحة الرئيسية للمواد', 0),
(3, 'course_showLesson', 'عرض دروس المادة', 0),
(4, 'course_Active', 'تغعيل/تعطيل المادة', 0),
(5, 'course_store', 'حفظ المادة', 0),
(6, 'course_create', 'انشاء مادة', 0),
(7, 'course_update', 'تعديل مادة', 0),
(8, 'course_edit', 'عرض صفحة تعديل المادة', 0),
(9, 'course_delete', 'حذف المادة', 0),
(10, 'create_ForseDelete', 'حذف نهائي للمادة', 0),
(11, 'category_index', 'الصفحة الرئيسية للتصنيفات', 0),
(12, 'category_showLesson', 'عرض دروس التصنيفات', 0),
(13, 'category_Active', 'تغعيل/تعطيل التصنيفات', 0),
(14, 'category_store', 'حفظ التصنيفات', 0),
(15, 'category_create', 'انشاء تصنيف', 0),
(16, 'category_update', 'تعديل تصنيف', 0),
(17, 'category_edit', 'عرض صفحة تعديل التصنيفات', 0),
(18, 'category_delete', 'حذف التصنيفات', 0),
(19, 'cat_ForseDelete', 'حذف بشكل نهائي للتصنيفات', 0),
(20, 'lesson_index', 'عرض الدروس', 0),
(21, 'lesson_chapterVideo', 'عرض فديوهات الدرس', 0),
(22, 'lesson_Active', 'تغعيل/تعطيل درس', 0),
(23, 'lesson_store', 'حفظ درس', 0),
(24, 'lesson_create', 'انشاء درس', 0),
(25, 'lesson_update', 'تعديل درس', 0),
(26, 'lesson_edit', 'عرض صفحة تعديل الدرس', 0),
(27, 'lesson_delete', 'حذف درس', 0),
(28, 'create_ForseDelete', 'حذف نهائي للدرس', 0),
(29, 'permission_index', 'عرض الصلاحيات', 0),
(30, 'permission_Active', 'تفعيل/تعطيل صلاحية', 0),
(31, 'permission_store', 'حفظ صلاحية جديدة', 0),
(32, 'permission_create', 'انشاء صلاحية جديدة', 0),
(33, 'permission_update', 'تعديل الصلاحيات', 0),
(34, 'permission_edit', 'عرض صفحة تعديل الصلاحيات', 0),
(35, 'permission_delete', 'حذف صلاحية', 0),
(36, 'permission_ForseDelete', 'حذف نهائي للصلاحية', 0),
(37, 'role_index', 'عرض الادوار', 0),
(38, 'role_Active', 'تفعيل/تعطيل الادوار', 0),
(39, 'role_store', 'حفظ الادوار', 0),
(40, 'role_create', 'عرض صفحة اضافة دور جديد', 0),
(41, 'role_update', 'تعديل الادوار', 0),
(42, 'role_edit', 'عرض صفحة تعديل الادوار', 0),
(43, 'role_delete', 'حذف الدور', 0),
(44, 'role_ForseDelete', 'حذف الدور بشكل نهائي ', 0),
(45, 'teacher_index', 'عرض الاساتذة', 0),
(46, 'teacher_Active', 'تغعيل/تعطيل استاذ', 0),
(47, 'teacher_store', 'حفظ  بيانات الاستاذ', 0),
(48, 'teacher_create', 'انشاء استاذ', 0),
(49, 'teacher_update', 'تعديل بيانات الاستاذ', 0),
(50, 'teacher_edit', 'عرض صفحة تعديل بيانات استاذ', 0),
(51, 'teacher_delete', 'حذف استاذ', 0),
(52, 'teacher_ForseDelete', 'حذف نهائي للاساتذة', 0),
(53, 'university_index', 'عرض الجامعات', 0),
(54, 'university_Active', 'تغعيل/تعطيل جامعة', 0),
(55, 'university_store', 'حفظ جامعة ', 0),
(56, 'university_create', 'انشاء جامعة', 0),
(57, 'university_update', 'تعديل الجامعة', 0),
(58, 'university_edit', 'عرض صفحة تعديل الجامعة', 0),
(59, 'university_delete', 'حذف الجامعة', 0),
(60, 'university_ForseDelete', 'حذف نهائي للجامعة', 0),
(61, 'university_addTeacher', 'اضافة استاذ من قبل الجامعة', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_role_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `permission_role`
--

INSERT INTO `permission_role` (`permission_role_id`, `role_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 20),
(5, 1, 37),
(6, 1, 53);

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
  `user_gender` varchar(255) DEFAULT NULL,
  `user_qualification` varchar(255) DEFAULT NULL,
  `user_register_date` datetime NOT NULL,
  `user_updates` text
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
(9, 1, 'osama mohammed', '/images/users/profiles/default.png', '', '773569041', 'male', '', '2020-01-20 00:00:00', NULL),
(10, 33, 'osama mohammed ahmed ', '/images/users/profiles/1580057196_20191006_020221.JPG', '4.jpg', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(11, 34, '147147 oih dd ', '/images/users/profiles/1580126520git.PNG', NULL, '54545256', 'male', '1', '0000-00-00 00:00:00', NULL),
(12, 35, 'osama mohammed ', '/images/users/profiles/15801266654.jpg', '', '785', 'male', '1', '0000-00-00 00:00:00', NULL),
(13, 36, 'osama mohammed ahmed ali', '/images/users/profiles/15801268924.jpg', '', '661918890', 'male', '1', '0000-00-00 00:00:00', NULL),
(14, 37, 'p jn uhi ', '/images/users/profiles/15801270074.jpg', '/images/universities/document/default.png', '8', 'male', '1', '0000-00-00 00:00:00', NULL),
(15, 38, 'sanaa university', '/images/users/profiles/1580192088git.PNG', '1.PNG', '77456987', 'female', '1', '0000-00-00 00:00:00', NULL),
(16, 39, 'rayad alshatabi', '/images/users/profiles/15801923244.jpg', '', '451320', 'male', '1', '0000-00-00 00:00:00', NULL),
(17, 40, 'joij oijm j', '/images/users/profiles/default.png', '/images/universities/document/default.png', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(18, 41, 'io ihjoi hiho ', '/images/users/profiles/15801966504.jpg', '/images/universities/document/default.png', '4854165', 'male', '1', '0000-00-00 00:00:00', NULL),
(19, 42, 'saba university', '/images/users/profiles/default.png', '/images/universities/document/default.png', '78466', 'male', '1', '0000-00-00 00:00:00', NULL),
(20, 43, 'hitam almaqtari', '/images/users/profiles/15801973954.jpg', '', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(21, 44, '', '/images/users/profiles/default.png', '/images/universities/document/default.png', '6619188912', '', '', '0000-00-00 00:00:00', NULL),
(22, 45, 'طاهر ', '/images/users/profiles/default.png', '', '773871', 'male', '1', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `rating`
--

CREATE TABLE `rating` (
  `comment_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `rating_number` int(2) NOT NULL,
  `comment_date` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `comment_status` int(10) NOT NULL,
  `course_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'admin', 'admins', 0),
(2, 'university', 'university', 1),
(3, 'student', 'students', 0),
(4, 'teacher', 'ijgomvjco', 1),
(5, 'admin', '&lt;p&gt;ABO MENS&lt;/p&gt;', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `user_id` int(255) NOT NULL,
  `university_id` int(11) DEFAULT '0',
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
(1, 0, 'thamar@gmail.com', 'thamar', '28707e14e88523777d295deaad67407b', '123', 1),
(5, 0, 'ali2@gmail.com', 'ali2', '28707e14e88523777d295deaad67407b', '123', 1),
(29, 0, 'mmmkkkmm@f.ff', 'ali', '28707e14e88523777d295deaad67407b', '6025', 1),
(30, 0, 'll@e.s', 'njkj njikn hjbkj', 'e8836edf9ff4213a9f3c4588a116db21', '3496', 0),
(31, 0, 'll@e.sll', 'njkj njikn hjbkj jhiiu', 'e8836edf9ff4213a9f3c4588a116db21', '2375', 1),
(32, 0, 'kkll@e.sll', 'njkj njikn hjmmmm', 'e8836edf9ff4213a9f3c4588a116db21', '4702', 0),
(33, 1, 'straw4ha2t@gmail.com', 'osama5', '4855d34ff1b1fb69203b7de9e33de8a1', '2438', 0),
(34, 1, 'straw44xhat@gmail.com', 't1', 'e8836edf9ff4213a9f3c4588a116db21', '6488', 0),
(35, 1, '1@1.d', 't2', 'e8836edf9ff4213a9f3c4588a116db21', '1449', 0),
(36, 1, 'straw4hnjhlat@gmail.com', 't4', 'e8836edf9ff4213a9f3c4588a116db21', '3264', 0),
(37, NULL, 'osama1287@gmail.com', 'hiuh uhgou okop', 'e8836edf9ff4213a9f3c4588a116db21', '2071', 0),
(38, NULL, 'u@u.c', 'sanaa', 'e8836edf9ff4213a9f3c4588a116db21', '4965', 1),
(39, 38, 'r@r.com', 'ryad', 'e8836edf9ff4213a9f3c4588a116db21', '1432', 0),
(40, NULL, 'straw4hat@gmail.com', 'njkj njikn hjbkllll', 'e8836edf9ff4213a9f3c4588a116db21', '8882', 0),
(41, NULL, 's@s.com', 's1', 'e8836edf9ff4213a9f3c4588a116db21', '2470', 0),
(42, NULL, 'u11@u.d', 'saba', 'e8836edf9ff4213a9f3c4588a116db21', '7442', 1),
(43, 42, 'straw4kpokhat@gmail.com', 'hitam ', 'e8836edf9ff4213a9f3c4588a116db21', '1959', 0),
(44, NULL, 'straw4hat@gmail.coml', '', 'ca47cc4e62f7cb066889b386402a5d9a', '2548', 0),
(45, NULL, 'straw4h5at@gmail.com', 'tahar', 'e8836edf9ff4213a9f3c4588a116db21', '1422', 0);

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

--
-- إرجاع أو استيراد بيانات الجدول `users_courses`
--

INSERT INTO `users_courses` (`users_courses_id`, `user_id`, `couces_buy`, `user_wish_list`) VALUES
(13, 1, '', '5,7'),
(14, 1, '', '5,7');

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
(4, 29, 1, ''),
(5, 30, 3, ''),
(6, 31, 2, ''),
(7, 32, 3, ''),
(8, 5, 2, ''),
(10, 33, 2, ''),
(11, 36, 4, ''),
(12, 37, 3, ''),
(13, 38, 2, ''),
(14, 39, 4, ''),
(15, 40, 3, ''),
(16, 41, 3, ''),
(17, 42, 2, ''),
(18, 43, 4, ''),
(19, 44, 2, ''),
(20, 45, 4, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

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
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `course_owner` (`course_owner`);

--
-- Indexes for table `course_resources`
--
ALTER TABLE `course_resources`
  ADD PRIMARY KEY (`resources_id`),
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
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

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
  ADD PRIMARY KEY (`users_courses_id`),
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
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_resources`
--
ALTER TABLE `course_resources`
  MODIFY `resources_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `permission_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users_courses`
--
ALTER TABLE `users_courses`
  MODIFY `users_courses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`coupon_create_by`) REFERENCES `users` (`user_id`);

--
-- القيود للجدول `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `course_owner` FOREIGN KEY (`course_owner`) REFERENCES `users` (`user_id`);

--
-- القيود للجدول `course_resources`
--
ALTER TABLE `course_resources`
  ADD CONSTRAINT `course_resources_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

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
-- القيود للجدول `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- القيود للجدول `users_courses`
--
ALTER TABLE `users_courses`
  ADD CONSTRAINT `users_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
