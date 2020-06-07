# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: bk2017083
# Generation Time: 2020-06-07 06:43:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'HTML','html','html-2020-06-03-5ed76a41739be.jpeg','2020-06-03 09:15:45','2020-06-03 09:15:45'),
	(2,'Laravel','laravel','laravel-2020-06-03-5ed76a4f9d271.jpeg','2020-06-03 09:15:59','2020-06-03 09:15:59'),
	(3,'Database','database','database-2020-06-03-5ed76a5e78efb.jpeg','2020-06-03 09:16:14','2020-06-03 09:16:14'),
	(4,'Javascript','javascript','javascript-2020-06-03-5ed76a7422a09.jpeg','2020-06-03 09:16:36','2020-06-03 09:16:36'),
	(5,'jQuery','jquery','jquery-2020-06-03-5ed76a844c3b8.jpeg','2020-06-03 09:16:52','2020-06-03 09:16:52'),
	(6,'MySql','mysql','mysql-2020-06-03-5ed76a95db56e.jpeg','2020-06-03 09:17:10','2020-06-03 09:17:10'),
	(7,'Seque','seque','seque-2020-06-03-5ed76ab7e464a.jpeg','2020-06-03 09:17:44','2020-06-03 09:17:44');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_post`;

CREATE TABLE `category_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `category_post` WRITE;
/*!40000 ALTER TABLE `category_post` DISABLE KEYS */;

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`)
VALUES
	(7,4,2,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(8,4,3,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(9,4,6,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(10,4,7,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(11,5,1,'2020-06-03 09:28:22','2020-06-03 09:28:22'),
	(12,5,4,'2020-06-03 09:28:22','2020-06-03 09:28:22'),
	(13,5,5,'2020-06-03 09:28:22','2020-06-03 09:28:22'),
	(14,6,3,'2020-06-03 09:29:49','2020-06-03 09:29:49'),
	(18,9,1,'2020-06-03 09:33:31','2020-06-03 09:33:31'),
	(19,9,4,'2020-06-03 09:33:31','2020-06-03 09:33:31'),
	(20,9,6,'2020-06-03 09:33:31','2020-06-03 09:33:31'),
	(21,10,1,'2020-06-03 11:05:12','2020-06-03 11:05:12'),
	(22,10,2,'2020-06-03 11:05:12','2020-06-03 11:05:12');

/*!40000 ALTER TABLE `category_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `status`, `created_at`, `updated_at`)
VALUES
	(1,9,5,'comment 1',0,'2020-06-03 10:57:32','2020-06-03 10:57:32'),
	(3,6,5,'comment 3',1,'2020-06-03 10:59:06','2020-06-03 10:59:06'),
	(4,5,5,'comment 4',0,'2020-06-03 10:59:18','2020-06-03 10:59:18'),
	(9,10,1,'comment test',1,'2020-06-03 11:08:04','2020-06-03 11:08:04'),
	(10,10,3,'blogger test comment',1,'2020-06-03 11:11:36','2020-06-03 11:11:36');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2018_04_21_145313_create_roles_table',1),
	(4,'2018_04_24_134132_create_tags_table',1),
	(5,'2018_04_26_144755_create_categories_table',1),
	(6,'2018_04_30_163457_create_posts_table',1),
	(7,'2018_04_30_163658_create_category_post_table',1),
	(8,'2018_04_30_163710_create_post_tag_table',1),
	(9,'2018_06_07_054134_create_subscribers_table',1),
	(10,'2018_06_13_082204_create_jobs_table',1),
	(11,'2018_07_12_154144_create_post_user_table',1),
	(12,'2018_07_18_142248_create_comments_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;

INSERT INTO `password_resets` (`email`, `token`, `created_at`)
VALUES
	('sieroniekuggy@gmail.com','$2y$10$ZLu3PI5CJiwMyRYhcBx7dOAIhqpkOWaPb64CMyrUjzN1AQtHS21xe','2020-06-03 15:21:17');

/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_tag`;

CREATE TABLE `post_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`)
VALUES
	(6,4,7,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(7,4,8,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(8,4,9,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(9,5,3,'2020-06-03 09:28:22','2020-06-03 09:28:22'),
	(10,5,4,'2020-06-03 09:28:22','2020-06-03 09:28:22'),
	(11,5,5,'2020-06-03 09:28:22','2020-06-03 09:28:22'),
	(12,5,6,'2020-06-03 09:28:22','2020-06-03 09:28:22'),
	(13,6,9,'2020-06-03 09:29:49','2020-06-03 09:29:49'),
	(17,9,3,'2020-06-03 09:33:31','2020-06-03 09:33:31'),
	(18,9,6,'2020-06-03 09:33:31','2020-06-03 09:33:31'),
	(19,9,8,'2020-06-03 09:33:31','2020-06-03 09:33:31'),
	(20,10,2,'2020-06-03 11:05:12','2020-06-03 11:05:12'),
	(21,10,6,'2020-06-03 11:05:12','2020-06-03 11:05:12');

/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_user`;

CREATE TABLE `post_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_post_id_foreign` (`post_id`),
  CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_user` WRITE;
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(5,10,1,'2020-06-03 11:08:07','2020-06-03 11:08:07'),
	(6,10,5,'2020-06-03 11:08:19','2020-06-03 11:08:19'),
	(7,9,3,'2020-06-03 11:16:52','2020-06-03 11:16:52');

/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`)
VALUES
	(4,1,'Admin Post 3','admin-post-3','admin-post-3-2020-06-03-5ed76cd85269f.jpeg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium vulputate sapien nec sagittis aliquam. Cum sociis natoque penatibus et magnis dis parturient. Accumsan sit amet nulla facilisi morbi tempus iaculis. Velit aliquet sagittis id consectetur. In nisl nisi scelerisque eu. Nisl pretium fusce id velit ut tortor pretium viverra suspendisse. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor. Tincidunt eget nullam non nisi est sit amet facilisis magna. Massa massa ultricies mi quis hendrerit dolor magna eget. Bibendum enim facilisis gravida neque convallis a cras semper auctor. Tincidunt id aliquet risus feugiat. Velit ut tortor pretium viverra suspendisse potenti. Arcu odio ut sem nulla pharetra diam sit amet.</p>',0,0,1,'2020-06-03 09:26:48','2020-06-03 09:26:48'),
	(5,3,'Learn it. Do it.','learn-it-do-it','learn-it-do-it-2020-06-03-5ed76d364f6a6.jpeg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium vulputate sapien nec sagittis aliquam. Cum sociis natoque penatibus et magnis dis parturient. Accumsan sit amet nulla facilisi morbi tempus iaculis. Velit aliquet sagittis id consectetur. In nisl nisi scelerisque eu. Nisl pretium fusce id velit ut tortor pretium viverra suspendisse. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor. Tincidunt eget nullam non nisi est sit amet facilisis magna. Massa massa ultricies mi quis hendrerit dolor magna eget. Bibendum enim facilisis gravida neque convallis a cras semper auctor. Tincidunt id aliquet risus feugiat. Velit ut tortor pretium viverra suspendisse potenti. Arcu odio ut sem nulla pharetra diam sit amet.</p>',1,1,1,'2020-06-03 09:28:22','2020-06-03 10:56:00'),
	(6,5,'Test News Blog','test-news-blog','test-news-blog-2020-06-03-5ed76d8c7f096.png','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium vulputate sapien nec sagittis aliquam. Cum sociis natoque penatibus et magnis dis parturient. Accumsan sit amet nulla facilisi morbi tempus iaculis. Velit aliquet sagittis id consectetur. In nisl nisi scelerisque eu. Nisl pretium fusce id velit ut tortor pretium viverra suspendisse. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor. Tincidunt eget nullam non nisi est sit amet facilisis magna. Massa massa ultricies mi quis hendrerit dolor magna eget. Bibendum enim facilisis gravida neque convallis a cras semper auctor. Tincidunt id aliquet risus feugiat. Velit ut tortor pretium viverra suspendisse potenti. Arcu odio ut sem nulla pharetra diam sit amet.</p>',2,1,1,'2020-06-03 09:29:49','2020-06-03 13:09:04'),
	(9,1,'Blo System Site','blo-system-site','blo-system-site-2020-06-03-5ed76e6b33162.jpeg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium vulputate sapien nec sagittis aliquam. Cum sociis natoque penatibus et magnis dis parturient. Accumsan sit amet nulla facilisi morbi tempus iaculis. Velit aliquet sagittis id consectetur. In nisl nisi scelerisque eu. Nisl pretium fusce id velit ut tortor pretium viverra suspendisse. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor. Tincidunt eget nullam non nisi est sit amet facilisis magna. Massa massa ultricies mi quis hendrerit dolor magna eget. Bibendum enim facilisis gravida neque convallis a cras semper auctor. Tincidunt id aliquet risus feugiat. Velit ut tortor pretium viverra suspendisse potenti. Arcu odio ut sem nulla pharetra diam sit amet.</p>',4,1,1,'2020-06-03 09:33:31','2020-06-03 11:21:17'),
	(10,5,'Test Test Test','test-test-test','test-test-test-2020-06-03-5ed783e81b816.jpeg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium vulputate sapien nec sagittis aliquam. Cum sociis natoque penatibus et magnis dis parturient. Accumsan sit amet nulla facilisi morbi tempus iaculis. Velit aliquet sagittis id consectetur. In nisl nisi scelerisque eu. Nisl pretium fusce id velit ut tortor pretium viverra suspendisse. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor. Tincidunt eget nullam non nisi est sit amet facilisis magna. Massa massa ultricies mi quis hendrerit dolor magna eget. Bibendum enim facilisis gravida neque convallis a cras semper auctor. Tincidunt id aliquet risus feugiat. Velit ut tortor pretium viverra suspendisse potenti. Arcu odio ut sem nulla pharetra diam sit amet.</p>',4,1,1,'2020-06-03 11:05:12','2020-06-03 11:17:13');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin','2020-06-03 08:21:23','2020-06-03 08:21:23'),
	(2,'Author','author','2020-06-03 08:21:23','2020-06-03 08:21:23');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subscribers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscribers`;

CREATE TABLE `subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'cod3trojans@gmail.com','2020-06-03 09:02:01','2020-06-03 09:02:01'),
	(2,'admin@blog.com','2020-06-03 09:02:04','2020-06-03 09:02:04'),
	(3,'sieroniekuggy@gmail.com','2020-06-03 09:02:08','2020-06-03 09:02:08'),
	(4,'srkuggy@gmail.com','2020-06-03 09:02:11','2020-06-03 09:02:11'),
	(5,'skug@skug.com','2020-06-03 09:02:15','2020-06-03 09:02:15');

/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(2,'HTML','html','2020-06-03 09:13:06','2020-06-03 09:13:06'),
	(3,'CSS','css','2020-06-03 09:13:14','2020-06-03 09:13:14'),
	(4,'Javascript','javascript','2020-06-03 09:13:26','2020-06-03 09:13:26'),
	(5,'Ajax','ajax','2020-06-03 09:13:34','2020-06-03 09:13:34'),
	(6,'jQuery','jquery','2020-06-03 09:13:45','2020-06-03 09:13:45'),
	(7,'Laravel','laravel','2020-06-03 09:14:18','2020-06-03 09:14:18'),
	(8,'Sequel Pro','sequel-pro','2020-06-03 09:14:39','2020-06-03 09:14:39'),
	(9,'Database','database','2020-06-03 09:14:53','2020-06-03 09:14:53');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `about` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,1,'Admin : BK2017083','admin','admin@blog.com','$2y$12$asjPZW6Lmo2vrBpbq03xxesav27qdbisKp25HEPsjIOKdp0aRBsTm','admin-bk2017083-2020-06-03-5ed784f5d69e3.jpg','blogger admin','Dt0eWYeLProaf3e4IgwrerrlyObzstW1sAyu4h9NVy1Tfsi5DMUXVdZBrJml','2020-06-03 08:21:23','2020-06-03 11:09:42'),
	(2,2,'BK2017083','author','author@blog.com','$2y$12$m/RsX1fIcxUVgXBdcsdozusYiu9CVofeAY/5dyX4kp1Rdr7L9mvva','bk2017083-2020-06-03-5ed75decd4242.jpg',NULL,'juwDUy1kV2uwbtsaZeSxeMN6Iu09PJjwrgfgfL8WFQVyptLwaUWsob0EHCAx','2020-06-03 08:21:23','2020-06-03 08:23:09'),
	(3,2,'Silence Ronald Kugotsi','sieroniekuggy','sieroniekuggy@gmail.com','$2y$10$mXU.2MfqL05bUqd9E4SFc.vDW3on8jc8Snae94j.HZC3s9ot.iCQC','silence-ronald-kugotsi-2020-06-03-5ed78549648a1.jpg','PHP Laravel developer','S2Sz1YpHcdvgNrGjKaNDuBZerK4Yzc0oogDQscAd8fsvlIwtbr4ufWOoYwzD','2020-06-03 08:23:45','2020-06-03 11:11:05'),
	(5,2,'Test','test','test@blog.com','$2y$10$C8frQ4fQGPal3JQpe3rgp.y9.s9JLm2mPsNO/zdH8ikMwsX9jwYdG','test-2020-06-03-5ed7850f66ae7.jpg','blogger test','RmhJr9uIP1Cp2wOVhJ6Sj0n91x9O7rUM12vD1KOkKrDLUEBxRbDm0xcEuMRJ','2020-06-03 08:37:23','2020-06-03 11:10:07');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
