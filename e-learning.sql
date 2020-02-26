-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 فبراير 2020 الساعة 18:48
-- إصدار الخادم: 10.1.34-MariaDB
-- PHP Version: 7.2.7

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
(54, 'kotlin', 'kotlin', 'level3_4', 0, 0, '0000-00-00 00:00:00', NULL);

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
(5, 36, 'كورس تعلم البرمجة من الصفر وحتى الاحتراف', '&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;strong dir=&quot;rtl&quot;&gt;2. محول WebM إلى MP4 على شبكة الانترنت&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;هناك بعض المواقع الإلكترونية التي يمكنك زيارتها حيث تحصل على محول على شبكة الانترنت يسمح لك بتحويل WebM إلى MP4. يمكنك كذلك الاستفادة من العديد من الخيارات عندما يتعلق الأمر باستخدام محول WebM إلى MP4 من على شبكة الانترنت:&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.zamzar.com/&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;Zamzar&lt;/a&gt;&amp;nbsp;هو محول مجاني على شبكة الانترنت يسمح لك بتحويل الملفات إلى تنسيق mp4 عبر الانترنت مجانا. كل ما عليك فعله هو الحصول على اتصال جيد بشبكة الانترنت لتحويل الملفات بنجاح. يمكن استخدام Zamzar لتحويل ملفات WebM إلى مختلف التنسيقات مثل 3gp, 3g2, aac, ac3, avi, flv, flac, gif, mp3, mp4, mpg, ogg, wav و wmv. لاستخدامه، عليك زيارة الموقع الرسمي Zamzar والاتصال بالانترنت لبدء تحويل الملفات. واحد من أفضل الأمور التي عليك معرفتها حول هذا المحول هو أنه يمكنه تحويل الملفات بسرعة كبيرة للغاية. هو برنامج مجاني وسهل الاستخدام. المشكلة الوحيدة هو أنه لا يمكنك استخدامه قط إن لم تكن متصلا بالانترنت.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.apowersoft.com/free-online-video-converter&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;أبوويرسوفت&lt;/a&gt;&amp;nbsp;هو خيار آخر رائع لتحويل الملفات عبر شبكة الانترنت. هو محول قوي من تنسيق webm إلى MP4 يمكن استخدامه لتحويل الملفات عبر الانترنت مجانا. هذه الأداة عبر الانترنت لن تحتاج إلى تنزيل برنامج لها لاستخدامها. يوفر لك تحويل سريع للملفات بسرعة كبيرة للغاية. يدعم نطاق واسع من تنسيقات الفيديو والصوت مثل VCD, DVD, PSP, آي باد وآي فون. الخصائص الأخرى التي يقدمها هي التحويل السريع والجودة العالية التي تتراوح بين 144p حتى 1080p وتنسيقات المخرج الكثيرة وكذلك الإعدادات وسهولة الاستخدام. مثل تطبيق Zamzar، العيب الوحيد بهذا المحول هو أنه عليك الاتصال بالانترنت لاستخدامه.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;strong dir=&quot;rtl&quot;&gt;3. محول WebM إلى MP4 المجاني&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;ماذا عن تحويل الملفات دون الاتصال بالانترنت؟ هذا ممكن بالتأكيد! يمكنك القيام بذلك عبر تحميل محول يمكنه تحويل الملفات دون الاتصال بالإنترنت. الانترنت يوفر لك العديد من الخيارات للاختيار من بينها بما فيها:&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.apowersoft.com/video-converter-studio.html&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;محول فيديو ستوديو&lt;/a&gt;&amp;nbsp;هو محول عالي الكفاءة الذي صمم خصيصا لتحويل كافة تنسيقات الفيديو والصوت. يقدم لك المحول خصائص متقدمة وكذلك مميزات مثل تحرير الفيديو التي تشمل قص مقاطع الفيديو وضبط تأثيرات الفيديو وقص حجم الفيديو واستيراد الترجمة الخارجية ودمج عدة مقاطع من الفيديو وكذلك تحويل الفيديو إلى تنسيقات متوافقة مع الأجهزة المحمولة مثل أندرويد. من السهل استخدامه كما ترغب ولا تحتاج إلى الاتصال بالانترنت حتى تبدأ تحويل الملفات. المشكلة التي ربما تواجهك هي سرعة التحويل حيث يستغرق وقتا أطول بالمقارنة مع التطبيقات عبر الانترنت.&lt;/p&gt;\r\n&lt;p dir=&quot;rtl&quot; style=&quot;margin: 0px; padding: 0px; text-size-adjust: none; font-size: 16px; line-height: 1.6em; color: #413e3f; font-family: ProximaNova-Regular, sans-serif, Arial, Helvetica;&quot;&gt;يمكنك كذلك استخدام&amp;nbsp;&lt;a style=&quot;outline: none; text-decoration-line: none; color: #67419e; transition: all 0.3s ease 0s;&quot; href=&quot;http://www.any-video-converter.com/products/for_video_free/&quot; target=&quot;_blank&quot; rel=&quot;nofollow noopener&quot;&gt;إني فيديو كوفيرتر&lt;/a&gt;&amp;nbsp;لتحويل الملفات إلى mp4 اليوم. تماما مثلما ذكرنا، هذا المحول يوفر لك سهولة الاستخدام ودعم نطاق واسع من تنسيقات الملفات عند التحويل. يمكنك استخدام محول الفيديو أني لتحويل ملفات webm إلى كافة التنسيقات المتوافرة تقريبا. المشكلة الوحيد هو أنه يستغرق أكثر من ساعة لتحويل الملف. تحويل الملفات سوف يتسبب بالتأكيد في استغراق مزيدا من الوقت.&lt;/p&gt;', '/images/site/1.jpg', 0, 20, '', '&lt;p&gt;[l[l&lt;/p&gt;', '&lt;p&gt;[l[l&lt;/p&gt;', '[\"8\"]', 0, 1, NULL, 1),
(7, 43, 'اندرويد', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '/images/courses/1.png', 150, 100, '', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '&lt;h1 id=&quot;firstHeading&quot; class=&quot;firstHeading&quot; style=&quot;margin: 60px 0px 10px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 300; line-height: 30px; color: #6c336d; text-rendering: optimizelegibility; font-size: 30px; background-color: #ffffff;&quot;&gt;View source for TinyMCE editor&lt;/h1&gt;\r\n&lt;div id=&quot;bodyContent&quot; style=&quot;color: #212121; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;&quot;&gt;\r\n&lt;div id=&quot;contentSub&quot; style=&quot;margin-bottom: 20px;&quot;&gt;&amp;larr;&amp;nbsp;&lt;a style=&quot;color: #005685; text-decoration-line: none;&quot; title=&quot;TinyMCE editor&quot; href=&quot;https://docs.moodle.org/38/en/TinyMCE_editor&quot;&gt;TinyMCE editor&lt;/a&gt;&lt;/div&gt;\r\n&lt;div id=&quot;jump-to-nav&quot; style=&quot;overflow: hidden; height: 0px; zoom: 1; user-select: none;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div id=&quot;mw-content-text&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You do not have permission to edit this page, for the following reason:&lt;/p&gt;\r\n&lt;div class=&quot;permissions-errors&quot;&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;The action you have requested is limited to users in the group:&amp;nbsp;&lt;a class=&quot;new&quot; style=&quot;color: #ba0000; text-decoration-line: none;&quot; title=&quot;MoodleDocs:Users (page does not exist)&quot; href=&quot;https://docs.moodle.org/38/en/index.php?title=MoodleDocs:Users&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Users&lt;/a&gt;.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr style=&quot;margin: 20px 0px; border-bottom-width: 1px; border-right-style: initial; border-left-style: initial; border-image: initial; border-color: #eeeeee initial #ffffff initial;&quot; /&gt;\r\n&lt;p style=&quot;margin: 10px 0px;&quot;&gt;You can view and copy the source of this page.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '[\"10\"]', 0, 1, NULL, 1),
(8, 39, 'دورة ذكاء اصطناعي', '&lt;p&gt;دورة ذكاء اصطناعي&lt;/p&gt;', '/images/courses/1581356840straw_hat_pirates_jolly_roger (1).jpg', 100, 50, '', '&lt;p&gt;.&lt;/p&gt;', '&lt;p&gt;.&lt;/p&gt;', '[\"8\"]', 0, 1, NULL, 1);

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
(16, '/videos/1580884294______What is GitHub.webm', '', 'chapter3', 5, '0000-00-00 00:00:00', 0, ''),
(17, '/videos/1580885180______What Is Version Control- - YouTube.webm', '', 'chapter3', 5, '0000-00-00 00:00:00', 0, ''),
(18, '/videos/1580885377______What is GitHub.webm', '', 'chapter4', 5, '0000-00-00 00:00:00', 0, ''),
(19, '/videos/1580884294______What is GitHub.webm', '', 'chapter4', 5, '0000-00-00 00:00:00', 0, ''),
(20, '/videos/1580903859______What Is Version Control- - YouTube.webm', '', 'chapter5', 5, '0000-00-00 00:00:00', 0, ''),
(21, '/videos/1580932663______What is GitHub.mp4.webm', '', 'chapter3', 5, '0000-00-00 00:00:00', 0, ''),
(22, '/videos/1580932891______اصابك عشق نجوى فاروق_زهرات♡حديقتي   (اغار عليها من.mp4.webm', '', 'chapter1', 5, '0000-00-00 00:00:00', 0, ''),
(23, '/videos/1580993588______موشح أندلسي _ يامليح اللمى.mp4.webm', '', 'مرحلة التقسيم ', 5, '0000-00-00 00:00:00', 0, ''),
(24, '/videos/1580994042______يا من هواه - عبدالرحمن محمد وغسان ابو حلتم.mp4.webm', '', 'مقدمة', 7, '0000-00-00 00:00:00', 0, ''),
(25, '/videos/1580994191______يا من هواه - عبدالرحمن محمد وغسان ابو حلتم.mp4.webm', '', 'الفصل الاول', 7, '0000-00-00 00:00:00', 0, ''),
(27, '/videos/1581360721______1__Git__version_control_system.mp4.webm', '', 'الفصل الثاني', 8, '0000-00-00 00:00:00', 0, ''),
(28, '/videos/1581855753______1  Laravel API with  JWT and CRUD_HD.mp4.webm', '', 'مقدمة الى الدورة', 8, '0000-00-00 00:00:00', 0, '');

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
(2004, 2, 1),
(2005, 2, 2),
(2006, 2, 3),
(2007, 2, 4),
(2008, 2, 5),
(2009, 2, 6),
(2010, 2, 7),
(2011, 2, 8),
(2012, 2, 9),
(2013, 2, 11),
(2014, 2, 12),
(2015, 2, 13),
(2016, 2, 14),
(2017, 2, 15),
(2018, 2, 16),
(2019, 2, 17),
(2020, 2, 18),
(2021, 2, 19),
(2022, 2, 20),
(2023, 2, 21),
(2024, 2, 22),
(2025, 2, 23),
(2026, 2, 24),
(2027, 2, 25),
(2028, 2, 26),
(2029, 2, 27),
(2030, 2, 45),
(2031, 2, 46),
(2032, 2, 47),
(2033, 2, 48),
(2034, 2, 49),
(2035, 2, 50),
(2036, 2, 51),
(2037, 2, 52),
(2038, 2, 53),
(2039, 2, 54),
(2040, 2, 55),
(2041, 2, 56),
(2042, 2, 57),
(2043, 2, 58),
(2044, 2, 59),
(2045, 2, 60),
(2046, 2, 61),
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
(2071, 4, 52);

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
(5, 29, 'TaHer Al-SamAwi', '', '/images/universities/document/default.png', '6619188912', '', '1', '0000-00-00 00:00:00', NULL),
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
(22, 45, 'طاهر ', '/images/users/profiles/default.png', '', '773871', 'male', '1', '0000-00-00 00:00:00', NULL),
(23, 46, 'جامعة صنعاء ', '/images/users/profiles/default.png', 'git.PNG', '6619188912', '', '', '0000-00-00 00:00:00', NULL),
(24, 47, 'osama mohammed ahmed ', '/images/users/profiles/default.png', '', '6619188912', 'male', '1', '0000-00-00 00:00:00', NULL),
(25, 48, 'جامعة الاندلس', '/images/users/profiles/default.png', 'صورة1.jpg', '789789752', '', '', '0000-00-00 00:00:00', NULL),
(26, 773569041, 'osama mohammed ', '/images/users/profiles/default.png', NULL, '773569041', 'male', NULL, '0000-00-00 00:00:00', NULL),
(27, 773569042, ' ali sasd ', '/images/users/profiles/default.png', '‏‏لقطة الشاشة (30).png', '66191889712', '', '', '0000-00-00 00:00:00', NULL),
(28, 773569043, 'عبي محمد سعد', '/images/users/profiles/default.png', '', '11111111', 'male', '1', '0000-00-00 00:00:00', NULL);

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
(14, 'نتنت', 5, '2020-02-16 01:06:31', 47, 1, 7),
(16, 'nice', 5, '2020-02-16 01:18:40', 47, 1, 5),
(19, 'dd', 5, '2020-02-24 02:14:48', 29, 1, 8),
(20, '54', 4, '2020-02-24 02:18:50', 29, 1, 8),
(23, 'هههههههههههههههه', 0, '2020-02-25 05:17:21', 29, 1, 5),
(24, '', 5, '2020-02-25 05:17:29', 29, 1, 5),
(25, 'd\n                                                        ', 2, '2020-02-25 05:35:41', 29, 1, 5),
(26, '\n             kjbdfsjkb                                            ', 5, '2020-02-25 05:37:23', 29, 1, 5),
(27, '55\n\n                                                        ', 1, '2020-02-25 05:37:32', 29, 1, 5),
(28, '                                                        ', 2, '2020-02-25 06:06:29', 29, 1, 5),
(29, '                                                        jbmj', 0, '2020-02-25 07:38:24', 29, 1, 5),
(30, '                      .,m d,                                  ', 2, '2020-02-25 08:02:34', 29, 1, 5);

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
(29, 0, 'mmmkkkmm@f.ff', 'ali', '28707e14e88523777d295deaad67407b', '6025', 1),
(30, 0, 'll@e.s', 'njkj njikn hjbkj', 'e8836edf9ff4213a9f3c4588a116db21', '3496', 0),
(31, 0, 'll@e.sll', 'njkj njikn hjbkj jhiiu', 'e8836edf9ff4213a9f3c4588a116db21', '2375', 1),
(32, 0, 'kkll@e.sll', 'njkj njikn hjmmmm', 'e8836edf9ff4213a9f3c4588a116db21', '4702', 0),
(33, 1, 'straw4ha2t@gmail.com', 'osama5', '4855d34ff1b1fb69203b7de9e33de8a1', '2438', 0),
(34, 1, 'straw44xhat@gmail.com', 't1', 'e8836edf9ff4213a9f3c4588a116db21', '6488', 0),
(35, 1, '1@1.d', 't2', 'e8836edf9ff4213a9f3c4588a116db21', '1449', 0),
(36, 48, 'straw4hnjhlat@gmail.com', 't4', 'e8836edf9ff4213a9f3c4588a116db21', '3264', 0),
(37, NULL, 'osama1287@gmail.com', 'hiuh uhgou okop', 'e8836edf9ff4213a9f3c4588a116db21', '2071', 0),
(38, NULL, 'u@u.c', 'sanaa', 'e8836edf9ff4213a9f3c4588a116db21', '4965', 1),
(39, 38, 'r@r.com', 'ryad', 'e8836edf9ff4213a9f3c4588a116db21', '1432', 0),
(40, NULL, 'straw4hat@gmail.com', 'njkj njikn hjbkllll', 'e8836edf9ff4213a9f3c4588a116db21', '8882', 0),
(41, NULL, 's@s.com', 's1', 'e8836edf9ff4213a9f3c4588a116db21', '2470', 0),
(42, NULL, 'u11@u.d', 'saba', 'e8836edf9ff4213a9f3c4588a116db21', '7442', 1),
(43, 42, 'straw4kpokhat@gmail.com', 'hitam ', 'e8836edf9ff4213a9f3c4588a116db21', '1959', 0),
(44, NULL, 'straw4hat@gmail.coml', '', 'ca47cc4e62f7cb066889b386402a5d9a', '2548', 0),
(45, NULL, 'straw4h5at@gmail.com', 'tahar', 'e8836edf9ff4213a9f3c4588a116db21', '1422', 0),
(46, NULL, 'straw4h00at@gmail.com', 'asanaa', 'e8836edf9ff4213a9f3c4588a116db21', '5776', 0),
(47, NULL, 'straw42hat@gmail.com', 'straw4hat', 'e8836edf9ff4213a9f3c4588a116db21', '4357', 1),
(48, NULL, 'u3@gmail.com', 'u3', 'e8836edf9ff4213a9f3c4588a116db21', '7913', 1),
(773569041, 0, 'osama1234@gmail.com', 'osama', '28707e14e88523777d295deaad67407b', '', 1),
(773569042, NULL, 'w4hkkkalt@gmail.com', 'alisaad', 'e8836edf9ff4213a9f3c4588a116db21', '2277', 0),
(773569043, 42, 'p@d.d', 'ali9', 'e8836edf9ff4213a9f3c4588a116db21', '9364', 0);

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
(29, 29, ',8,5', '5\r\n,5  >\n                               <i class=,5'),
(32, 47, '', ',5'),
(33, 48, '', ',8');

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
(26, 773569043, 4, '');

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
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_resources`
--
ALTER TABLE `course_resources`
  MODIFY `resources_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `permission_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2072;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=773569044;

--
-- AUTO_INCREMENT for table `users_courses`
--
ALTER TABLE `users_courses`
  MODIFY `users_courses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
