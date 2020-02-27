-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27 فبراير 2020 الساعة 14:44
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
  `category_parents` text DEFAULT NULL,
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
(3, 'web', '', '1', 0, 0, '0000-00-00 00:00:00', NULL),
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
(54, 'kotlin', 'kotlin', 'level3_4', 0, 0, '0000-00-00 00:00:00', NULL),
(56, 'node Js', '&lt;p&gt;&amp;nbsp;..&lt;/p&gt;', 'level3_3', 0, 0, '0000-00-00 00:00:00', NULL),
(57, 'wordpress', '&lt;p&gt;&amp;nbsp;k&lt;/p&gt;', 'level3_3', 0, 0, '0000-00-00 00:00:00', NULL),
(58, 'multiMedia', '&lt;p&gt;&amp;nbsp;.&lt;/p&gt;', '0', 0, 0, '0000-00-00 00:00:00', NULL),
(59, 'graphics', '&lt;p&gt;.&lt;/p&gt;', '58', 0, 0, '0000-00-00 00:00:00', NULL),
(60, 'Adobe Xd', '&lt;p&gt;.&lt;/p&gt;', 'level3_59', 0, 0, '0000-00-00 00:00:00', NULL),
(61, 'photoshop', '&lt;p&gt;.&lt;/p&gt;', 'level3_59', 1, 0, '0000-00-00 00:00:00', NULL),
(62, 'c#', '&lt;p&gt;.&lt;/p&gt;', 'level3_3', 0, 0, '0000-00-00 00:00:00', NULL);

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
  `course_status` int(10) DEFAULT 1,
  `course_updates` text DEFAULT NULL,
  `course_visibility` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `courses`
--

INSERT INTO `courses` (`course_id`, `course_owner`, `course_title`, `course_description`, `courses_image`, `course_price`, `course_price_afterDiscount`, `course_requirements`, `course_students_target`, `course_goals`, `categories_ids`, `course_date`, `course_status`, `course_updates`, `course_visibility`) VALUES
(5, 36, 'github', '&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;strong dir=&quot;rtl&quot;&gt;2. محول WebM إلى MP4 على شبكة الانترنت&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;هناك بعض المواقع الإلكترونية التي يمكنك زيارتها حيث تحصل على محول على شبكة الانترنت يسمح لك بتحويل WebM إلى MP4. يمكنك كذلك الاستفادة من العديد من الخيارات عندما يتعلق الأمر باستخدام محول WebM إلى MP4 من على شبكة الانترنت:&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.zamzar.com/&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;Zamzar&lt;/a&gt;&amp;nbsp;هو محول مجاني على شبكة الانترنت يسمح لك بتحويل الملفات إلى تنسيق mp4 عبر الانترنت مجانا. كل ما عليك فعله هو الحصول على اتصال جيد بشبكة الانترنت لتحويل الملفات بنجاح. يمكن استخدام Zamzar لتحويل ملفات WebM إلى مختلف التنسيقات مثل 3gp, 3g2, aac, ac3, avi, flv, flac, gif, mp3, mp4, mpg, ogg, wav و wmv. لاستخدامه، عليك زيارة الموقع الرسمي Zamzar والاتصال بالانترنت لبدء تحويل الملفات. واحد من أفضل الأمور التي عليك معرفتها حول هذا المحول هو أنه يمكنه تحويل الملفات بسرعة كبيرة للغاية. هو برنامج مجاني وسهل الاستخدام. المشكلة الوحيدة هو أنه لا يمكنك استخدامه قط إن لم تكن متصلا بالانترنت.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.apowersoft.com/free-online-video-converter&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;أبوويرسوفت&lt;/a&gt;&amp;nbsp;هو خيار آخر رائع لتحويل الملفات عبر شبكة الانترنت. هو محول قوي من تنسيق webm إلى MP4 يمكن استخدامه لتحويل الملفات عبر الانترنت مجانا. هذه الأداة عبر الانترنت لن تحتاج إلى تنزيل برنامج لها لاستخدامها. يوفر لك تحويل سريع للملفات بسرعة كبيرة للغاية. يدعم نطاق واسع من تنسيقات الفيديو والصوت مثل VCD, DVD, PSP, آي باد وآي فون. الخصائص الأخرى التي يقدمها هي التحويل السريع والجودة العالية التي تتراوح بين 144p حتى 1080p وتنسيقات المخرج الكثيرة وكذلك الإعدادات وسهولة الاستخدام. مثل تطبيق Zamzar، العيب الوحيد بهذا المحول هو أنه عليك الاتصال بالانترنت لاستخدامه.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;strong dir=&quot;rtl&quot;&gt;3. محول WebM إلى MP4 المجاني&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;ماذا عن تحويل الملفات دون الاتصال بالانترنت؟ هذا ممكن بالتأكيد! يمكنك القيام بذلك عبر تحميل محول يمكنه تحويل الملفات دون الاتصال بالإنترنت. الانترنت يوفر لك العديد من الخيارات للاختيار من بينها بما فيها:&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.apowersoft.com/video-converter-studio.html&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;محول فيديو ستوديو&lt;/a&gt;&amp;nbsp;هو محول عالي الكفاءة الذي صمم خصيصا لتحويل كافة تنسيقات الفيديو والصوت. يقدم لك المحول خصائص متقدمة وكذلك مميزات مثل تحرير الفيديو التي تشمل قص مقاطع الفيديو وضبط تأثيرات الفيديو وقص حجم الفيديو واستيراد الترجمة الخارجية ودمج عدة مقاطع من الفيديو وكذلك تحويل الفيديو إلى تنسيقات متوافقة مع الأجهزة المحمولة مثل أندرويد. من السهل استخدامه كما ترغب ولا تحتاج إلى الاتصال بالانترنت حتى تبدأ تحويل الملفات. المشكلة التي ربما تواجهك هي سرعة التحويل حيث يستغرق وقتا أطول بالمقارنة مع التطبيقات عبر الانترنت.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;يمكنك كذلك استخدام&amp;nbsp;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.any-video-converter.com/products/for_video_free/&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;إني فيديو كوفيرتر&lt;/a&gt;&amp;nbsp;لتحويل الملفات إلى mp4 اليوم. تماما مثلما ذكرنا، هذا المحول يوفر لك سهولة الاستخدام ودعم نطاق واسع من تنسيقات الملفات عند التحويل. يمكنك استخدام محول الفيديو أني لتحويل ملفات webm إلى كافة التنسيقات المتوافرة تقريبا. المشكلة الوحيد هو أنه يستغرق أكثر من ساعة لتحويل الملف. تحويل الملفات سوف يتسبب بالتأكيد في استغراق مزيدا من الوقت.&lt;/p&gt;', '/images/site/1.jpg', 55, 20, '', '&lt;p&gt;[l[l&lt;/p&gt;', '&lt;p&gt;[l[l&lt;/p&gt;', '[\"8\"]', 0, 1, NULL, 1),
(7, 43, 'اندرويد', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '/images/courses/1.png', 150, 100, '', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '[\"10\"]', 0, 1, NULL, 1),
(8, 39, 'دورة الهاكر الاخلاقي ', '&lt;p&gt;دورة ذكاء اصطناعي&lt;/p&gt;', '/images/courses/1581356840straw_hat_pirates_jolly_roger (1).jpg', 100, 50, '', '&lt;p&gt;.&lt;/p&gt;', '&lt;p&gt;.&lt;/p&gt;', '[\"8\"]', 0, 1, NULL, 1),
(9, 36, 'OOP', '&lt;p&gt;vrfdsv&lt;/p&gt;', '/images/courses/1582635022Short-Term-Courses-after-10th.png', 100, 50, '', '&lt;p&gt;j&lt;/p&gt;', '&lt;p&gt;i&lt;/p&gt;', '[\"8\",\"7\"]', 0, 1, NULL, 1),
(10, 36, 'nodeJs', '&lt;p&gt;&lt;span style=&quot;color: #222222; font-family: \'Noto Naskh Arabic UI\', arial, sans-serif; font-size: large; text-align: right; background-color: #ffffff;&quot;&gt;Node.js هو نظام برامج مصمم لكتابة تطبيقات إنترنت قابلة للتوسع كخوادم الويب. تم اختياره بواسطة InfoWorld لجائزة تقنية العام في 2012. أنشئت Node.js على يد ريان دال ابتداءً في عام 2009، وقامت برعاية نموها Joyent، مشغله. يتألف Node.js من في 8 التابع لجوجل مع العديد من المكتبات المدمجة. وأخذت بعض مواصفات مشروع&lt;/span&gt;&lt;/p&gt;', '/images/courses/1582661021download.png', 100, 50, '', '&lt;p&gt;&lt;span style=&quot;color: #222222; font-family: \'Noto Naskh Arabic UI\', arial, sans-serif; font-size: large; text-align: right; background-color: #ffffff;&quot;&gt;Node.js هو نظام برامج مصمم لكتابة تطبيقات إنترنت قابلة للتوسع كخوادم الويب. تم اختياره بواسطة InfoWorld لجائزة تقنية العام في 2012. أنشئت Node.js على يد ريان دال ابتداءً في عام 2009، وقامت برعاية نموها Joyent، مشغله. يتألف Node.js من في 8 التابع لجوجل مع العديد من المكتبات المدمجة. وأخذت بعض مواصفات مشروع&lt;/span&gt;&lt;/p&gt;', '&lt;p&gt;&lt;span style=&quot;color: #222222; font-family: \'Noto Naskh Arabic UI\', arial, sans-serif; font-size: large; text-align: right; background-color: #ffffff;&quot;&gt;Node.js هو نظام برامج مصمم لكتابة تطبيقات إنترنت قابلة للتوسع كخوادم الويب. تم اختياره بواسطة InfoWorld لجائزة تقنية العام في 2012. أنشئت Node.js على يد ريان دال ابتداءً في عام 2009، وقامت برعاية نموها Joyent، مشغله. يتألف Node.js من في 8 التابع لجوجل مع العديد من المكتبات المدمجة. وأخذت بعض مواصفات مشروع&lt;/span&gt;&lt;/p&gt;', '[\"56\"]', 0, 1, NULL, 1),
(11, 39, 'wordpress', '&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;ما هو ووردبريس wordpress الذي اصبح يسيطر على عالم مواقع الإنترنت و لماذا صُنف&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;الووردبريس&lt;/strong&gt;&amp;nbsp;واحد من أهم منصات إدارة المحتوي الرقمي CMS الاكثر استخداماً فى العالم.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;تحدثنا من قبل عن أهم 10 اسباب تجعلك تستخدم ووردبريس فى موقعك وكانت المقالة&amp;nbsp;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/wordpress-site-10-reason-touse/&quot;&gt;مقارنة بين&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;ووردبريس&lt;/strong&gt;&amp;nbsp;و بلوجر&lt;/a&gt;، كما و أشرنا فى مقالة أخري عن&amp;nbsp;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/wrodpress-hosting/&quot;&gt;طريقة اختيار استضافة ووردبريس سريعة&lt;/a&gt;&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;فى مقالة اليوم سنعمل على شرح&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;ماهو الوورد بريس&lt;/strong&gt;&amp;nbsp;لكل من يبحث عن انشاء مدونة ووردبريس بالطريقة الصحيحة او يعرف عنه أكثر فأكثر.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;أهم نقاط المقالة:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul style=&quot;padding: 0px; margin: 0px 15px 20px 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#whatis-wordpress&quot; data-wpel-link=&quot;internal&quot;&gt;ماهو&amp;nbsp;wordpress&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpress-bestcms&quot; data-wpel-link=&quot;internal&quot;&gt;ووردبريس أفضل CMS&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpress-featuers&quot; data-wpel-link=&quot;internal&quot;&gt;مميزات الووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpresssitecoast&quot; data-wpel-link=&quot;internal&quot;&gt;تكلفة إنشاء موقع ووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpresssummary&quot; data-wpel-link=&quot;internal&quot;&gt;خلاصة تعريف الووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2 id=&quot;whatis-wordpress&quot; style=&quot;padding: 0px; margin: 25px 0px 10px; outline: none; list-style: none; border: 0px; box-sizing: border-box; font-weight: 400; line-height: 1em; font-family: Helvetica; font-size: 30px; color: #333333; background-color: #ffffff;&quot; data-wpel-link=&quot;internal&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #a81900;&quot;&gt;ما هو wordpress&lt;/span&gt;&lt;/h2&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;برنامج&amp;nbsp;&lt;/strong&gt;WordPress احد افضل و اشهر برامج ادارة المحتوي (CMS) فى العالم و المنصة الاولي فى عالم التدوين بلا منازع.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;الووردبريس منصة تستطيع من خلالها إدارة موقع الكتروني بإحترافية و بدون الحاجة إلى خبرات سابقة فى إدارة مواقع الانترنت مع إمكانية تركيب العديد من الإضافات (Plugins) المجانية و المدفوعة مثلها مثل القوالب (Templates) التى اصبحت متوفرة لجميع انواع المواقع (الشخصية &amp;ndash; التجارية &amp;ndash; العقارية &amp;ndash; المبوبات الإعلانية &amp;ndash;&amp;nbsp; إلخ).&lt;/p&gt;', '/images/courses/1582662549wordpress.png', 70, 30, '', '&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;ما هو ووردبريس wordpress الذي اصبح يسيطر على عالم مواقع الإنترنت و لماذا صُنف&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;الووردبريس&lt;/strong&gt;&amp;nbsp;واحد من أهم منصات إدارة المحتوي الرقمي CMS الاكثر استخداماً فى العالم.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;تحدثنا من قبل عن أهم 10 اسباب تجعلك تستخدم ووردبريس فى موقعك وكانت المقالة&amp;nbsp;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/wordpress-site-10-reason-touse/&quot;&gt;مقارنة بين&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;ووردبريس&lt;/strong&gt;&amp;nbsp;و بلوجر&lt;/a&gt;، كما و أشرنا فى مقالة أخري عن&amp;nbsp;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/wrodpress-hosting/&quot;&gt;طريقة اختيار استضافة ووردبريس سريعة&lt;/a&gt;&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;فى مقالة اليوم سنعمل على شرح&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;ماهو الوورد بريس&lt;/strong&gt;&amp;nbsp;لكل من يبحث عن انشاء مدونة ووردبريس بالطريقة الصحيحة او يعرف عنه أكثر فأكثر.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;أهم نقاط المقالة:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul style=&quot;padding: 0px; margin: 0px 15px 20px 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#whatis-wordpress&quot; data-wpel-link=&quot;internal&quot;&gt;ماهو&amp;nbsp;wordpress&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpress-bestcms&quot; data-wpel-link=&quot;internal&quot;&gt;ووردبريس أفضل CMS&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpress-featuers&quot; data-wpel-link=&quot;internal&quot;&gt;مميزات الووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpresssitecoast&quot; data-wpel-link=&quot;internal&quot;&gt;تكلفة إنشاء موقع ووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpresssummary&quot; data-wpel-link=&quot;internal&quot;&gt;خلاصة تعريف الووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2 id=&quot;whatis-wordpress&quot; style=&quot;padding: 0px; margin: 25px 0px 10px; outline: none; list-style: none; border: 0px; box-sizing: border-box; font-weight: 400; line-height: 1em; font-family: Helvetica; font-size: 30px; color: #333333; background-color: #ffffff;&quot; data-wpel-link=&quot;internal&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #a81900;&quot;&gt;ما هو wordpress&lt;/span&gt;&lt;/h2&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;برنامج&amp;nbsp;&lt;/strong&gt;WordPress احد افضل و اشهر برامج ادارة المحتوي (CMS) فى العالم و المنصة الاولي فى عالم التدوين بلا منازع.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;الووردبريس منصة تستطيع من خلالها إدارة موقع الكتروني بإحترافية و بدون الحاجة إلى خبرات سابقة فى إدارة مواقع الانترنت مع إمكانية تركيب العديد من الإضافات (Plugins) المجانية و المدفوعة مثلها مثل القوالب (Templates) التى اصبحت متوفرة لجميع انواع المواقع (الشخصية &amp;ndash; التجارية &amp;ndash; العقارية &amp;ndash; المبوبات الإعلانية &amp;ndash;&amp;nbsp; إلخ).&lt;/p&gt;', '&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;ما هو ووردبريس wordpress الذي اصبح يسيطر على عالم مواقع الإنترنت و لماذا صُنف&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;الووردبريس&lt;/strong&gt;&amp;nbsp;واحد من أهم منصات إدارة المحتوي الرقمي CMS الاكثر استخداماً فى العالم.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;تحدثنا من قبل عن أهم 10 اسباب تجعلك تستخدم ووردبريس فى موقعك وكانت المقالة&amp;nbsp;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/wordpress-site-10-reason-touse/&quot;&gt;مقارنة بين&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;ووردبريس&lt;/strong&gt;&amp;nbsp;و بلوجر&lt;/a&gt;، كما و أشرنا فى مقالة أخري عن&amp;nbsp;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/wrodpress-hosting/&quot;&gt;طريقة اختيار استضافة ووردبريس سريعة&lt;/a&gt;&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;فى مقالة اليوم سنعمل على شرح&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;ماهو الوورد بريس&lt;/strong&gt;&amp;nbsp;لكل من يبحث عن انشاء مدونة ووردبريس بالطريقة الصحيحة او يعرف عنه أكثر فأكثر.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;أهم نقاط المقالة:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul style=&quot;padding: 0px; margin: 0px 15px 20px 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#whatis-wordpress&quot; data-wpel-link=&quot;internal&quot;&gt;ماهو&amp;nbsp;wordpress&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpress-bestcms&quot; data-wpel-link=&quot;internal&quot;&gt;ووردبريس أفضل CMS&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpress-featuers&quot; data-wpel-link=&quot;internal&quot;&gt;مميزات الووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpresssitecoast&quot; data-wpel-link=&quot;internal&quot;&gt;تكلفة إنشاء موقع ووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;li style=&quot;padding: 0px; margin: 0px 0px 5px; outline: none; list-style: outside none disc; border: 0px; box-sizing: border-box;&quot;&gt;&lt;a style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #1b13f5; text-decoration-line: none; transition: all 0.2s ease-in-out 0s;&quot; href=&quot;https://hostingwdomain.com/what-is-wordpress/#wordpresssummary&quot; data-wpel-link=&quot;internal&quot;&gt;خلاصة تعريف الووردبريس&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2 id=&quot;whatis-wordpress&quot; style=&quot;padding: 0px; margin: 25px 0px 10px; outline: none; list-style: none; border: 0px; box-sizing: border-box; font-weight: 400; line-height: 1em; font-family: Helvetica; font-size: 30px; color: #333333; background-color: #ffffff;&quot; data-wpel-link=&quot;internal&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #a81900;&quot;&gt;ما هو wordpress&lt;/span&gt;&lt;/h2&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px; outline: none; list-style: none; border: 0px; box-sizing: border-box;&quot;&gt;برنامج&amp;nbsp;&lt;/strong&gt;WordPress احد افضل و اشهر برامج ادارة المحتوي (CMS) فى العالم و المنصة الاولي فى عالم التدوين بلا منازع.&lt;/p&gt;\r\n&lt;p style=&quot;padding: 0px; margin: 0px 0px 20px; outline: none; list-style: none; border: 0px; box-sizing: border-box; color: #333333; font-family: Tahoma, arial; font-size: 19px; background-color: #ffffff;&quot;&gt;الووردبريس منصة تستطيع من خلالها إدارة موقع الكتروني بإحترافية و بدون الحاجة إلى خبرات سابقة فى إدارة مواقع الانترنت مع إمكانية تركيب العديد من الإضافات (Plugins) المجانية و المدفوعة مثلها مثل القوالب (Templates) التى اصبحت متوفرة لجميع انواع المواقع (الشخصية &amp;ndash; التجارية &amp;ndash; العقارية &amp;ndash; المبوبات الإعلانية &amp;ndash;&amp;nbsp; إلخ).&lt;/p&gt;', '[\"57\"]', 0, 1, NULL, 1),
(12, 36, 'شرح ميزة Auto-Animate في برنامج Adobe XD', '&lt;p&gt;&lt;span style=&quot;color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 12px; white-space: pre-wrap; background-color: #ffffff;&quot;&gt;شرح ميزة Auto-Animate في برنامج Adobe XD&lt;/span&gt;&lt;/p&gt;\r\n&lt;h3 style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 20px 0px 10px; line-height: 1.1; color: #625ff2; font-size: 24px; background-color: #ffffff;&quot;&gt;ما هو برنامج Adobe XD ?&lt;/h3&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;برنامج أدوبي اكس دي هو من البرامج المميزة لتصميم واجهات الاستخدام بأنواعها المتعددة , ظهرت النسخة الأولية من أدوبي اكس دي في عام 2015 (قبل 3 سنوات) وكان الهدف الأساسي من البرنامج هو تدعيم مصممي واجهة الاستخدام ببرنامج يلبي احتياجاتهم ويسهل عليهم العمل , تطرق المصممين لوجود برامج منافسة كثيرة ك Sketch و inVision وغيرها وأن أدوبي قامت بخطوة متأخرة , حيث أن برنامج Sketch في الاساس قد استحوذ على نسبة كبيرة من السوق ولا يمكن لمنافس جديد أن يأخذ مكانه بسهولة وقد أتفق كثير من المصممين على هذا الرأي وكنت أنا بنفسي من بينهم , حتى جاء العام 2017 ...&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;أولاً لنفهم الفائدة الأساسية من Adobe XD علينا أن نفهم ما هو معنى UI/UX Designer بشكل صحيح , فمصمم واجهة الاستخدام UI/UX Designer فعلياً لا يقوم بكتابة الأكواد ولكن كتابة الأكواد هي عمل UI/UX Developer , فالمصمم هو من يقوم بعمل مخطط للتصميم ثم يقوم المختص بتحويلها الى كود فعلي , في بدايات ظهور هذا المجال كان النصيب الأكبر للورقة والقلم في التصميم , اعتمد المصممين لاحقاً على برامج مثل فوتوشوب و اليستراتور في تصميم واجهات الاستخدام , لكن مشكلة ثقل البرامج مثل فوتوشوب على بعض الأجهزة كانت عقبة كبرى , كذلك حاجة المصممين لانشاء كثير من الأمور يدوياً كانت بذرة مشروع Adobe XD و Sketch وغيرها , عند حضور Adobe XD الى الساحة كبرنامج مخصص لهؤلاء الأشخاص وجود المصممين سهولة ومرونة في التعامل مقارنة ب فوتوشوب واليستراتور , والأهم من ذلك انه مجاني !&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h3 style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 20px 0px 10px; line-height: 1.1; color: #625ff2; font-size: 24px; background-color: #ffffff;&quot;&gt;مميزات برنامج Adobe XD&lt;/h3&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;تختصر عبارة XD في اسم البرنامج جملة Experince Design و من مميزات البرنامج الرائعة هو التركيز على واجهات الاستخدام و التخصص في تصميمها , فليس سهلاً او مرجحاً تعديل صورة أو انشاء أيقونة نهائية باستخدام Adobe XD - على الرغم من توفر أدوات كافية .&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h4 style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 10px 0px; line-height: 1.1; color: #625ff2; font-size: 18px; background-color: #ffffff;&quot;&gt;ومن أهم مميزات برنامج Adobe XD&lt;/h4&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;مجاني ! يمكنك تحميله من &lt;a style=&quot;box-sizing: border-box; padding: 3px; margin: 0px; background-color: transparent; color: #625ff2; text-decoration-line: none; transition: all 0.3s ease 0s; font-weight: bold; overflow-wrap: break-word; word-break: normal;&quot; title=&quot;https://creative.adobe.com/products/download/xd&quot; href=&quot;https://creative.adobe.com/products/download/xd&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;هنا&amp;nbsp;&lt;/a&gt;&amp;nbsp;عبر Creative Cloud&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;واجهة مبسطة وفعالة&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;اختبار تجاوبية التصميم&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;ربط العناصر ببعضها واختبار المنتج&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;تحديد أماكن العناصر بدقة (Fixed&amp;nbsp; , absolute)&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;تحديد قيمة لتأثيرات الانتقال&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;ومن هذا الرابط&amp;nbsp;&lt;a style=&quot;box-sizing: border-box; padding: 3px; margin: 0px; background-color: transparent; color: #625ff2; text-decoration-line: none; transition: all 0.3s ease 0s; font-weight: bold; overflow-wrap: break-word; word-break: normal;&quot; href=&quot;https://www.adobe.com/products/xd/features.html&quot;&gt;https://www.adobe.com/products/xd/features.html&lt;/a&gt;&amp;nbsp;يمكنك تصفح الميزات الكاملة لبرنامج Adobe XD وتطوراتها منذ وصول البرنامج حتى اليوم&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h3 style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 20px 0px 10px; line-height: 1.1; color: #625ff2; font-size: 24px; background-color: #ffffff;&quot;&gt;ما الممكن تحقيقه مع Adobe XD ?&amp;nbsp;&lt;/h3&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;الكثير فعلاً , تحدت شركة أدوبي نفسها و خرجت بمنتج خيالي استطاع احتلال مكانة كبيرة بين المصممين بسهولة , ولن أطيل في الكلام عن ما يمكنك تحقيقه , مجرد فيديو قصير مدته 3 دقائق مقدم من قناة Dansky المهتمة بالتصميم ستشرح لك شيئ من ما يستطيع عمله هذا البرنامج&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-family: tajawal, tahoma, sans-serif; padding: 0px; margin: 0px 0px 10px; line-height: 2; font-size: 15px; overflow-wrap: break-word; white-space: pre-line; color: #333333; background-color: #ffffff;&quot;&gt;&amp;nbsp;&lt;/p&gt;', '/images/courses/1582705923651-366 (1).jpeg', 0, 0, '', '&lt;p&gt;&lt;span style=&quot;color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 12px; white-space: pre-wrap; background-color: #ffffff;&quot;&gt;شرح ميزة Auto-Animate في برنامج Adobe XD&lt;/span&gt;&lt;/p&gt;', '&lt;p&gt;&lt;span style=&quot;color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 12px; white-space: pre-wrap; background-color: #ffffff;&quot;&gt;شرح ميزة Auto-Animate في برنامج Adobe XD&lt;/span&gt;&lt;/p&gt;', '[\"60\"]', 0, 1, NULL, 1),
(13, 43, 'تعلم دورة photoshop', '&lt;p&gt;&lt;a style=&quot;box-sizing: border-box; color: #00537e; text-decoration-line: none; transition: color 0.15s ease 0s; font-family: ABeeZee; font-size: 25px; text-align: justify; background-color: #ffffff;&quot; href=&quot;https://www.edlibre.com/tag/%D8%AF%D9%88%D8%B1%D8%A7%D8%AA-%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9-%D9%85%D8%AC%D8%A7%D9%86%D9%8A%D8%A9-%D9%88-%D9%85%D8%AF%D9%81%D9%88%D8%B9%D8%A9&quot;&gt;دورة تعليمية كاملة&lt;/a&gt;&lt;span style=&quot;color: #333333; font-family: ABeeZee; font-size: 25px; text-align: justify; background-color: #ffffff;&quot;&gt;&amp;nbsp;لتعلم PhotoShop CC بالعربية ، برنامج الفوتوشوب ، هو البرنامج الاول عالميا من ادوبي للتعامل مع الصور و التعديل عليها ، و الفوتوشوب ليس فقط برنامج للصور &amp;hellip; بل أيضا للتصميم المواقع اللوجو و كثير من الأشياء ، و من يقول أن الفوتوشوب ستتعلمه في دقائق فتاكدوا أنكم على خطأ ، فالفوتوشوب عالم كبير به الكثير من الخصائص و المميزات لا يمكن أن تعرف إستخدامها إلا عن طريق تعلمها من خبراء في هذا المجال و لذلك خصصت دورة هذا اليوم مع خبير عربي في الفوتوشوب ليعلكم كيف و ما هو و كيف يعمل و اساسيات الفوتوشوب ، و بالظبط ستتعلمون مع النسخة الاخيرة من برنامج الفوتوشوب و هي النسخة المطورة حديثا Adobe PhotoShop CC .&lt;/span&gt;&lt;/p&gt;', '/images/courses/1582706583photoshop.jpg', 0, 0, '', '&lt;p&gt;&lt;a style=&quot;box-sizing: border-box; color: #00537e; text-decoration-line: none; transition: color 0.15s ease 0s; font-family: ABeeZee; font-size: 25px; text-align: justify; background-color: #ffffff;&quot; href=&quot;https://www.edlibre.com/tag/%D8%AF%D9%88%D8%B1%D8%A7%D8%AA-%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9-%D9%85%D8%AC%D8%A7%D9%86%D9%8A%D8%A9-%D9%88-%D9%85%D8%AF%D9%81%D9%88%D8%B9%D8%A9&quot;&gt;دورة تعليمية كاملة&lt;/a&gt;&lt;span style=&quot;color: #333333; font-family: ABeeZee; font-size: 25px; text-align: justify; background-color: #ffffff;&quot;&gt;&amp;nbsp;لتعلم PhotoShop CC بالعربية ، برنامج الفوتوشوب ، هو البرنامج الاول عالميا من ادوبي للتعامل مع الصور و التعديل عليها ، و الفوتوشوب ليس فقط برنامج للصور &amp;hellip; بل أيضا للتصميم المواقع اللوجو و كثير من الأشياء ، و من يقول أن الفوتوشوب ستتعلمه في دقائق فتاكدوا أنكم على خطأ ، فالفوتوشوب عالم كبير به الكثير من الخصائص و المميزات لا يمكن أن تعرف إستخدامها إلا عن طريق تعلمها من خبراء في هذا المجال و لذلك خصصت دورة هذا اليوم مع خبير عربي في الفوتوشوب ليعلكم كيف و ما هو و كيف يعمل و اساسيات الفوتوشوب ، و بالظبط ستتعلمون مع النسخة الاخيرة من برنامج الفوتوشوب و هي النسخة المطورة حديثا Adobe PhotoShop CC .&lt;/span&gt;&lt;/p&gt;', '&lt;p&gt;&lt;a style=&quot;box-sizing: border-box; color: #00537e; text-decoration-line: none; transition: color 0.15s ease 0s; font-family: ABeeZee; font-size: 25px; text-align: justify; background-color: #ffffff;&quot; href=&quot;https://www.edlibre.com/tag/%D8%AF%D9%88%D8%B1%D8%A7%D8%AA-%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9-%D9%85%D8%AC%D8%A7%D9%86%D9%8A%D8%A9-%D9%88-%D9%85%D8%AF%D9%81%D9%88%D8%B9%D8%A9&quot;&gt;دورة تعليمية كاملة&lt;/a&gt;&lt;span style=&quot;color: #333333; font-family: ABeeZee; font-size: 25px; text-align: justify; background-color: #ffffff;&quot;&gt;&amp;nbsp;لتعلم PhotoShop CC بالعربية ، برنامج الفوتوشوب ، هو البرنامج الاول عالميا من ادوبي للتعامل مع الصور و التعديل عليها ، و الفوتوشوب ليس فقط برنامج للصور &amp;hellip; بل أيضا للتصميم المواقع اللوجو و كثير من الأشياء ، و من يقول أن الفوتوشوب ستتعلمه في دقائق فتاكدوا أنكم على خطأ ، فالفوتوشوب عالم كبير به الكثير من الخصائص و المميزات لا يمكن أن تعرف إستخدامها إلا عن طريق تعلمها من خبراء في هذا المجال و لذلك خصصت دورة هذا اليوم مع خبير عربي في الفوتوشوب ليعلكم كيف و ما هو و كيف يعمل و اساسيات الفوتوشوب ، و بالظبط ستتعلمون مع النسخة الاخيرة من برنامج الفوتوشوب و هي النسخة المطورة حديثا Adobe PhotoShop CC .&lt;/span&gt;&lt;/p&gt;', '[\"61\"]', 0, 1, NULL, 1),
(14, 36, 'C#', '&lt;p&gt;.&lt;/p&gt;', '/images/courses/15827291131581319958download.png', 100, 0, '', '&lt;p&gt;.&lt;/p&gt;', '&lt;p&gt;.&lt;/p&gt;', '[\"54\",\"7\",\"8\"]', 0, 1, NULL, 1);

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
(30, '/videos/1582659035______1__GitHub_development_platform.mp4.webm', '', 'مقدمة الى الكورس', 5, '0000-00-00 00:00:00', 0, ''),
(31, '/videos/1582659084______2__GitHub_development_platform.mp4.webm', '', 'مقدمة الى الكورس', 5, '0000-00-00 00:00:00', 0, ''),
(32, '/videos/1582659494______3__GitHub_development_platform.mp4.webm', '', 'مقدمة الى الكورس', 5, '0000-00-00 00:00:00', 0, ''),
(33, '/videos/1582659530______4__GitHub_development_platform.mp4.webm', '', 'مقدمة الى الكورس', 5, '0000-00-00 00:00:00', 0, ''),
(34, '/videos/1582659646______5__Slack_Project_Management.mp4.webm', '', 'تطبيق على المشاريع', 5, '0000-00-00 00:00:00', 0, ''),
(35, '/videos/1582659692______7__Slack_Project_Management.mp4.webm', '', 'تطبيق على المشاريع', 5, '0000-00-00 00:00:00', 0, ''),
(36, '/videos/1582659757______Github_(8_videos).mp4.webm', '', 'شرح موقع github', 5, '0000-00-00 00:00:00', 0, ''),
(37, '/videos/1582659822______Slack_لادارة_الفرق_(4_videos).mp4.webm', '', 'شرح موقع github', 5, '0000-00-00 00:00:00', 0, ''),
(38, '/videos/1582659877______Slack_لادارة_الفرق_(4_videos).mp4.webm', '', 'نهاية الكورس', 5, '0000-00-00 00:00:00', 0, ''),
(39, '/videos/1582661101______[Arabic] Node JS _0- Course Intro _ Overview(720P_HD).mp4.webm', '', 'مقدمة الى الكورس', 10, '0000-00-00 00:00:00', 0, ''),
(40, '/videos/1582661137______[Arabic] Node JS _1- Start with Node JS(720P_HD).mp4.webm', '', 'البداية معا nodeJs', 10, '0000-00-00 00:00:00', 0, ''),
(41, '/videos/1582661229______[Arabic] Node JS _2- Node Modules(720P_HD).mp4.webm', '', 'Modules ', 10, '0000-00-00 00:00:00', 0, ''),
(44, '/videos/1582662057______PHP OOP MVC - setup and controller - 01.mp4.webm', '', 'مقدمة الى الكورس', 8, '0000-00-00 00:00:00', 0, ''),
(45, '/videos/1582662623______Mastering WordPress in Arabic _01 - Intro _ What Is WordPress_.mp4.webm', '', 'مقدمة الى الكورس', 11, '0000-00-00 00:00:00', 0, ''),
(46, '/videos/1582706103______1. اعلان الدورة.mp4.webm', '', 'تعريف بالدورة', 12, '0000-00-00 00:00:00', 0, ''),
(47, '/videos/1582706208______2. 2- ماهي الملفات التفاعلية.mp4.webm', '', 'تعريف بالدورة', 12, '0000-00-00 00:00:00', 0, ''),
(48, '/videos/1582706304______1. إنشاء مساحة عمل خاصة.mp4.webm', '', 'أساسيات الملفات التفاعلية', 12, '0000-00-00 00:00:00', 0, ''),
(49, '/videos/1582706804______134@ فكرة دروس تعلم الفوتوشوب فى 30 ثانية_HD.mp4.webm', '', 'مقدمة الى الكورس', 13, '0000-00-00 00:00:00', 0, ''),
(50, '/videos/1582706830______135@ تنصيب وتثبيت برنامج Adobe Photoshop cc2014_HD.mp4.webm', '', 'تنصيب البرنامج', 13, '0000-00-00 00:00:00', 0, ''),
(51, '/videos/1582708097______PHP OOP MVC - setup and controller - 01.mp4.webm', '', 'مقدمة الى الكورس', 9, '0000-00-00 00:00:00', 0, ''),
(52, '/videos/1582729154______1582706804______134@ فكرة دروس تعلم الفوتوشوب فى 30 ثانية_HD.mp4.webm.webm', '', 'مقدمة الى الكورس', 14, '0000-00-00 00:00:00', 0, '');

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
(10, 'course_ForseDelete', 'حذف نهائي للمادة', 0),
(11, 'category_index', 'الصفحة الرئيسية للتصنيفات', 0),
(12, 'category_showLesson', 'عرض دروس التصنيفات', 0),
(13, 'category_Active', 'تغعيل/تعطيل التصنيفات', 0),
(14, 'category_store', 'حفظ التصنيفات', 0),
(15, 'category_create', 'انشاء تصنيف', 0),
(16, 'category_update', 'تعديل تصنيف', 0),
(17, 'category_edit', 'عرض صفحة تعديل التصنيفات', 0),
(18, 'category_delete', 'حذف التصنيفات', 0),
(19, 'category_forceDelete', 'حذف بشكل نهائي للتصنيفات', 0),
(20, 'lesson_index', 'عرض الدروس', 0),
(21, 'lesson_chapterVideo', 'عرض فديوهات الدرس', 0),
(22, 'lesson_Active', 'تغعيل/تعطيل درس', 0),
(23, 'lesson_store', 'حفظ درس', 0),
(24, 'lesson_create', 'انشاء درس', 0),
(25, 'lesson_update', 'تعديل درس', 0),
(26, 'lesson_edit', 'عرض صفحة تعديل الدرس', 0),
(27, 'lesson_delete', 'حذف درس', 0),
(28, 'lesson_ForseDelete', 'حذف نهائي للدرس', 0),
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
(40, 'role_create', 'اضافة دور جديد', 0),
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
(1637, 6, 1),
(1638, 6, 2),
(1639, 6, 3),
(1640, 6, 4),
(1641, 6, 5),
(1642, 6, 6),
(1643, 6, 7),
(1644, 6, 8),
(1645, 6, 9),
(1646, 6, 10),
(1647, 6, 28),
(1648, 6, 11),
(1649, 6, 12),
(1650, 6, 13),
(1651, 6, 14),
(1652, 6, 15),
(1653, 6, 16),
(1654, 6, 17),
(1655, 6, 18),
(1656, 6, 19),
(1657, 6, 20),
(1658, 6, 21),
(1659, 6, 22),
(1660, 6, 23),
(1661, 6, 24),
(1662, 6, 25),
(1663, 6, 26),
(1664, 6, 27),
(1665, 6, 29),
(1666, 6, 30),
(1667, 6, 31),
(1668, 6, 32),
(1669, 6, 33),
(1670, 6, 34),
(1671, 6, 35),
(1672, 6, 36),
(1673, 6, 37),
(1674, 6, 38),
(1675, 6, 39),
(1676, 6, 40),
(1677, 6, 41),
(1678, 6, 42),
(1679, 6, 43),
(1680, 6, 44),
(1681, 6, 45),
(1682, 6, 46),
(1683, 6, 47),
(1684, 6, 48),
(1685, 6, 49),
(1686, 6, 50),
(1687, 6, 51),
(1688, 6, 52),
(1689, 6, 53),
(1690, 6, 54),
(1691, 6, 55),
(1692, 6, 56),
(1693, 6, 57),
(1694, 6, 58),
(1695, 6, 59),
(1696, 6, 60),
(1697, 6, 61),
(1959, 1, 1),
(1960, 1, 2),
(1961, 1, 3),
(1962, 1, 4),
(1963, 1, 5),
(1964, 1, 6),
(1965, 1, 7),
(1966, 1, 8),
(1967, 1, 9),
(1968, 1, 10),
(1969, 1, 28),
(1970, 1, 11),
(1971, 1, 12),
(1972, 1, 13),
(1973, 1, 14),
(1974, 1, 15),
(1975, 1, 16),
(1976, 1, 17),
(1977, 1, 18),
(1978, 1, 19),
(1979, 1, 20),
(1980, 1, 21),
(1981, 1, 22),
(1982, 1, 23),
(1983, 1, 24),
(1984, 1, 25),
(1985, 1, 26),
(1986, 1, 27),
(1987, 1, 45),
(1988, 1, 46),
(1989, 1, 47),
(1990, 1, 48),
(1991, 1, 49),
(1992, 1, 50),
(1993, 1, 51),
(1994, 1, 52),
(1995, 1, 53),
(1996, 1, 54),
(1997, 1, 55),
(1998, 1, 56),
(1999, 1, 57),
(2000, 1, 58),
(2001, 1, 59),
(2002, 1, 60),
(2003, 1, 61),
(2047, 4, 1),
(2048, 4, 2),
(2049, 4, 3),
(2050, 4, 4),
(2051, 4, 5),
(2052, 4, 6),
(2053, 4, 7),
(2054, 4, 8),
(2055, 4, 9),
(2056, 4, 20),
(2057, 4, 21),
(2058, 4, 22),
(2059, 4, 23),
(2060, 4, 24),
(2061, 4, 25),
(2062, 4, 26),
(2063, 4, 27),
(2064, 4, 45),
(2065, 4, 46),
(2066, 4, 47),
(2067, 4, 48),
(2068, 4, 49),
(2069, 4, 50),
(2070, 4, 51),
(2071, 4, 52),
(2181, 2, 1),
(2182, 2, 2),
(2183, 2, 3),
(2184, 2, 4),
(2185, 2, 5),
(2186, 2, 6),
(2187, 2, 7),
(2188, 2, 8),
(2189, 2, 9),
(2190, 2, 11),
(2191, 2, 12),
(2192, 2, 13),
(2193, 2, 19),
(2194, 2, 20),
(2195, 2, 21),
(2196, 2, 22),
(2197, 2, 23),
(2198, 2, 24),
(2199, 2, 25),
(2200, 2, 26),
(2201, 2, 27),
(2202, 2, 53),
(2203, 2, 61);

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
  `user_updates` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `profiles`
--

INSERT INTO `profiles` (`profile_id`, `user_id`, `user_full_name`, `user_image`, `document`, `user_phone`, `user_gender`, `user_qualification`, `user_register_date`, `user_updates`) VALUES
(5, 29, 'TaHer Al-SamAwi', '/images/users/profiles/taher.jpg', '/images/universities/document/default.png', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(6, 30, 'طاهر السماوي', '/images/users/profiles/1582727581taher.jpg', '/images/universities/document/default.png', '6619188912', '', 'حامعي', '0000-00-00 00:00:00', NULL),
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
(22, 45, 'طاهر ', '/images/users/profiles/default.png', '', '773871', 'male', '1', '0000-00-00 00:00:00', NULL),
(23, 46, 'جامعة صنعاء ', '/images/users/profiles/default.png', 'git.PNG', '6619188912', '', '', '0000-00-00 00:00:00', NULL),
(24, 47, 'osama mohammed ahmed ', '/images/users/profiles/default.png', '', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(25, 48, 'جامعة الاندلس', '/images/users/profiles/default.png', 'صورة1.jpg', '789789752', '', '', '0000-00-00 00:00:00', NULL),
(26, 773569041, 'osama mohammed ', '/images/users/profiles/default.png', NULL, '773569041', 'male', NULL, '0000-00-00 00:00:00', NULL),
(27, 773569042, ' ali sasd ', '/images/users/profiles/default.png', '‏‏لقطة الشاشة (30).png', '66191889712', '', '', '0000-00-00 00:00:00', NULL),
(28, 773569043, 'عبي محمد سعد', '/images/users/profiles/default.png', '', '11111111', 'male', '1', '0000-00-00 00:00:00', NULL),
(29, 773569044, 'محمد علي ', '/images/users/profiles/default.png', '', '777110022', 'male', '1', '0000-00-00 00:00:00', NULL),
(30, 773569045, 'طاهر السماوي', '/images/users/profiles/default.png', '', '7333564564', 'male', '1', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `rating_number` int(2) NOT NULL,
  `rating_date` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `rating_status` int(10) NOT NULL,
  `course_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `ratings`
--

INSERT INTO `ratings` (`rating_id`, `comment_text`, `rating_number`, `rating_date`, `user_id`, `rating_status`, `course_id`) VALUES
(2, 'سيء جدا', 1, '2020-02-24 00:00:00', 32, 1, 5),
(4, 'jbnknl', 4, '2020-02-12 02:52:49', 29, 1, 7),
(5, '', 5, '2020-02-12 02:53:34', 29, 1, 7),
(6, ' ksnk', 0, '2020-02-12 02:54:48', 29, 1, 7),
(7, 'snmlo', 0, '2020-02-12 02:55:03', 29, 1, 7),
(8, '', 0, '2020-02-12 02:55:15', 29, 1, 7),
(9, 'jnkjn', 3, '2020-02-12 07:18:12', 29, 1, 7),
(10, 'khkl', 0, '2020-02-12 07:22:09', 29, 1, 7),
(12, 'jlhl', 5, '2020-02-16 12:50:54', 29, 1, 5),
(14, 'نتنت', 5, '2020-02-16 01:06:31', 47, 1, 7),
(16, 'nice', 5, '2020-02-16 01:18:40', 47, 1, 5),
(19, 'قوة                         ', 4, '2020-02-25 06:33:53', 773569041, 1, 9),
(20, 'احسن واحد                                ', 5, '2020-02-26 08:55:08', 38, 1, 5),
(21, 'ممتاز جدا                                          ', 4, '2020-02-26 09:18:54', 38, 1, 8),
(22, 'بورك فيك           ', 5, '2020-02-26 09:48:25', 773569041, 1, 13),
(23, 'حالي', 4, '2020-02-26 10:15:16', 773569041, 1, 11),
(24, '                       ممتاز                                 ', 3, '2020-02-26 03:53:11', 30, 1, 13);

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
(1, 'admin', '&lt;p&gt;admins&lt;/p&gt;', 0),
(2, 'university', '&lt;p&gt;university&lt;/p&gt;', 1),
(3, 'student', 'students', 0),
(4, 'teacher', '&lt;p&gt;ijgomvjco&lt;/p&gt;', 1),
(6, 'super_admin', '&lt;p&gt;super admin&lt;/p&gt;', 1);

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
(1, 0, 'thamar@gmail.com', 'thamar', '28707e14e88523777d295deaad67407b', '123', 1),
(29, 0, 'mmmkkkmm@f.ff', 'ali', '28707e14e88523777d295deaad67407b', '6025', 1),
(30, 0, 'tahersam@gmail.com', 'taher', '28707e14e88523777d295deaad67407b', '3496', 1),
(31, 0, 'll@e.sll', 'njkj njikn hjbkj jhiiu', 'e8836edf9ff4213a9f3c4588a116db21', '2375', 1),
(32, 0, 'kkll@e.sll', 'njkj njikn hjmmmm', 'e8836edf9ff4213a9f3c4588a116db21', '4702', 0),
(33, 1, 'straw4ha2t@gmail.com', 'osama5', '4855d34ff1b1fb69203b7de9e33de8a1', '2438', 1),
(34, 1, 'straw44xhat@gmail.com', 't1', 'e8836edf9ff4213a9f3c4588a116db21', '6488', 0),
(35, 1, '1@1.d', 't2', 'e8836edf9ff4213a9f3c4588a116db21', '1449', 0),
(36, 48, 'straw4hnjhlat@gmail.com', 't4', 'e8836edf9ff4213a9f3c4588a116db21', '3264', 0),
(37, NULL, 'osama1287@gmail.com', 'hiuh uhgou okop', 'e8836edf9ff4213a9f3c4588a116db21', '2071', 0),
(38, NULL, 'u@u.c', 'sanaa', 'e8836edf9ff4213a9f3c4588a116db21', '4965', 1),
(39, 38, 'r@r.com', 'ryad', 'e8836edf9ff4213a9f3c4588a116db21', '1432', 0),
(40, NULL, 'straw4hat@gmail.com', 'njkj njikn hjbkllll', 'e8836edf9ff4213a9f3c4588a116db21', '8882', 0),
(41, NULL, 's@s.com', 's1', 'e8836edf9ff4213a9f3c4588a116db21', '2470', 0),
(42, NULL, 'u11@u.d', 'saba', 'e8836edf9ff4213a9f3c4588a116db21', '7442', 1),
(43, 42, 'straw4kpokhat@gmail.com', 'hitam ', '28707e14e88523777d295deaad67407b', '1959', 1),
(44, NULL, 'straw4hat@gmail.coml', '', 'ca47cc4e62f7cb066889b386402a5d9a', '2548', 0),
(45, NULL, 'straw4h5at@gmail.com', 'tahar', 'e8836edf9ff4213a9f3c4588a116db21', '1422', 0),
(46, NULL, 'straw4h00at@gmail.com', 'asanaa', 'e8836edf9ff4213a9f3c4588a116db21', '5776', 0),
(47, NULL, 'straw42hat@gmail.com', 'straw4hat', 'e8836edf9ff4213a9f3c4588a116db21', '4357', 1),
(48, NULL, 'u3@gmail.com', 'u3', 'e8836edf9ff4213a9f3c4588a116db21', '7913', 1),
(773569041, 0, 'osama1234@gmail.com', 'osama', '28707e14e88523777d295deaad67407b', '', 1),
(773569042, NULL, 'w4hkkkalt@gmail.com', 'alisaad', 'e8836edf9ff4213a9f3c4588a116db21', '2277', 0),
(773569043, 42, 'p@d.d', 'ali9', 'e8836edf9ff4213a9f3c4588a116db21', '9364', 0),
(773569044, 38, 'Mohammed@d.xd', 'mohammed ali', 'e8836edf9ff4213a9f3c4588a116db21', '6190', 1),
(773569045, NULL, 'taher@sam.com', '@tahersamawi', '1e70e1b0f4c35bcd7f8310f2d6122720', '1537', 0);

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
(14, 1, '', '5,7'),
(29, 29, ',5,8,7,11', ',8,5'),
(32, 47, '', ',5'),
(33, 48, ',9', ',8'),
(34, 773569041, ',5,9,7,12,13,11', ',9,8,12,11'),
(35, 38, ',8,11,5,10', ''),
(36, 30, ',8,5,13,11,14', ',7,5');

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
(10, 33, 2, ''),
(11, 36, 4, ''),
(12, 37, 3, ''),
(13, 38, 2, ''),
(14, 39, 4, ''),
(16, 41, 3, ''),
(17, 42, 2, ''),
(18, 43, 4, ''),
(19, 44, 2, ''),
(20, 45, 4, ''),
(21, 46, 2, ''),
(22, 47, 3, ''),
(23, 48, 2, ''),
(24, 773569041, 6, ''),
(25, 773569042, 2, ''),
(26, 773569043, 4, ''),
(27, 773569044, 4, ''),
(28, 773569045, 3, '');

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
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
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
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `course_resources`
--
ALTER TABLE `course_resources`
  MODIFY `resources_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `permission_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2204;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=773569046;

--
-- AUTO_INCREMENT for table `users_courses`
--
ALTER TABLE `users_courses`
  MODIFY `users_courses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
-- القيود للجدول `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- القيود للجدول `users_courses`
--
ALTER TABLE `users_courses`
  ADD CONSTRAINT `users_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
