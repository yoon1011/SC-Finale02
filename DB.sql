/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.7.26 : Database - dbscs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbscs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbscs`;

/*Table structure for table `assigns` */

DROP TABLE IF EXISTS `assigns`;

CREATE TABLE `assigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tec_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sem` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `assigns` */

insert  into `assigns`(`id`,`tec_id`,`sub_id`,`sem`,`sy`,`created_at`,`updated_at`) values (2,'5','3','1','2019-2020','2020-08-29 03:39:36','2020-08-29 03:39:36'),(3,'19','5','2','2019-2020','2020-08-31 08:50:05','2020-08-31 08:50:05');

/*Table structure for table `clearances` */

DROP TABLE IF EXISTS `clearances`;

CREATE TABLE `clearances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sec_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stud_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `clearances` */

insert  into `clearances`(`id`,`sub_id`,`sec_id`,`stud_id`,`stat`,`remark`,`created_at`,`updated_at`) values (7,'3','3','3','ok','none','2020-08-31 00:36:14','2020-08-31 00:36:14'),(6,'3','3','6','drop','none','2020-08-31 00:36:09','2020-08-31 01:20:49'),(8,'5','4','3','ok','none','2020-08-31 08:49:03','2020-08-31 08:49:03'),(9,'5','4','18','not ok','Final exam missing!','2020-08-31 08:49:11','2020-08-31 08:52:30'),(10,'5','4','11','ok','none','2020-08-31 08:49:17','2020-08-31 08:49:17'),(11,'5','4','9','drop','3 meeting absents','2020-08-31 08:49:26','2020-08-31 08:52:58');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2020_08_28_031837_create_subjects_table',1),(2,'2020_08_28_065825_create_sections_table',2),(3,'2020_08_28_075955_create_clearances_table',3),(4,'2020_08_29_022248_create_assigns_table',4);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` int(10) DEFAULT NULL,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sections` */

insert  into `sections`(`id`,`sub_id`,`section`,`sem`,`sy`,`created_at`,`updated_at`) values (3,3,'MT-2A','1','2019-2020','2020-08-31 00:36:02','2020-08-31 00:36:02'),(4,5,'BSN-2','2','2019-2020','2020-08-31 08:48:23','2020-08-31 08:48:23'),(5,5,'BSIT','2','2019-2020','2020-08-31 08:48:45','2020-08-31 08:48:45');

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subjects` */

insert  into `subjects`(`id`,`subject`,`code`,`created_at`,`updated_at`) values (3,'History','FD45','2020-08-28 06:47:41','2020-08-28 06:47:41'),(4,'Plane and Trigonometry','PT654','2020-08-31 07:37:10','2020-08-31 07:37:10'),(5,'Math 1','M-019','2020-08-31 08:47:25','2020-08-31 08:47:25');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'request',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`role`,`remember_token`,`created_at`,`updated_at`) values (8,'Jerico Sales','jericho.band@gmail.com','$2y$10$spC0JrtbaNkbh15x7pI8FOorqlulehipY6XOprwwd33W0.WxWHsxC','Admin','ITQgZMBqDH4EKJWPFGgiKvOJ0juVQcExlRJ64xjGuZM9dF9drrOsL6QClEY9','2020-08-30 10:59:48','2020-08-31 08:21:55'),(3,'Jane Bros','asdf@yahoo.com','$2y$10$spC0JrtbaNkbh15x7pI8FOorqlulehipY6XOprwwd33W0.WxWHsxC','Student','0eY7CKLdYz7m0hYUqXEDuCq0jHLV3gVYVREyVoTjf4HrhBfToGZ7Wa6vWoOG','2020-08-28 05:17:47','2020-08-28 11:21:32'),(5,'Monaliza Malingan','m.m@gmail.com','$2y$10$spC0JrtbaNkbh15x7pI8FOorqlulehipY6XOprwwd33W0.WxWHsxC','Teacher','GyA0Yay2tYjvFuhxsd6CGhIcwvVvf4VxyTKVogapYs4APbbEGN225yRTOf3k','2020-08-29 02:38:01','2020-08-29 02:38:01'),(6,'Alma Jane Ong','alma@gmail.com','$2y$10$spC0JrtbaNkbh15x7pI8FOorqlulehipY6XOprwwd33W0.WxWHsxC','Student',NULL,'2020-08-29 04:00:14','2020-08-29 04:00:14'),(7,'Halupe','samiyoon@yahoo.com','$2y$10$NeLAuUKnfLyIQQJI3hhs/uXhUZrNLDunIIUX0639Pb3OirwNsyp3G','Admin','QlcHFD8ZTIbo9TwluRnLZKBKFgvj5M99kDkJrwBh3f5prHsWHkdGMaMJJOgP','2020-08-29 04:47:25','2020-08-29 04:47:25'),(9,'Temarie Calingayan','Calingayan@gmail.com','$2y$10$spC0JrtbaNkbh15x7pI8FOorqlulehipY6XOprwwd33W0.WxWHsxC','Student','tCbEzpcBbAwB1JF087liMPNJWsL4GNONh9hEYtIaZ6wsakhb0VhTDE3qj7ai','2020-08-31 07:34:21','2020-08-31 07:34:21'),(10,'Ernesto Caluya','Caluya@gmail.com','$2y$10$Oqux0OMtuQVzz6EGts6um.9US3213yzwxiGjE1jmcX.SvpmtW1ao2','Student',NULL,'2020-08-31 07:35:00','2020-08-31 07:35:00'),(11,'Polan Dulnuan','dulnnua@gmail.com','$2y$10$iHrLPueLTYWpgMFy7nRQIe8YpmJxeZKNhwg84xo.LCFQiKSInIX7q','Student',NULL,'2020-08-31 07:35:27','2020-08-31 07:35:27'),(12,'Jon Here','here@gmail.com','$2y$10$3ICdVICSndFbJZpoJ/ENKur/bgcNDQCkozKubmObPnXOul/Yy759u','Student',NULL,'2020-08-31 07:35:48','2020-08-31 07:35:48'),(13,'Donita Logan','Ferno@gmail.com','$2y$10$5E4YQ/iPswlx2XQK1DwV7uw.fSt03ISUZz7kQOgXzILXruGiFt7ym','Student',NULL,'2020-08-31 07:36:27','2020-08-31 07:36:27'),(14,'Angelo Dela Cruz','angelo.dc@gmail.com','$2y$10$spC0JrtbaNkbh15x7pI8FOorqlulehipY6XOprwwd33W0.WxWHsxC','request','Pd4mg7APPF2cDQbyGG4h3KrBGEyBNVrpwRgA56FU6qzpbdboKPrl8IZptScR','2020-08-31 08:24:02','2020-08-31 08:24:02'),(15,'Merian Bang','merian.bang@gmail.com','$2y$10$cbFJbaTh1M8H1ZL/T9Nqyu2.1kzWnlwwEKYiZMh68X2w1Fdrw8VDG','request','dTDiKjWW6Ol5nHEBWwDUGOBrq15Tr6LmBVcFFtLoBST1OO9BGdNuIhk7PggY','2020-08-31 08:26:57','2020-08-31 08:26:57'),(16,'Ivan Dela Rosa','ivan.dr@gmail.com','$2y$10$6dWKx9UnMYW1tbjF7GGckOgQluEVimVN78bHRNgz81gNAIjWYdHSy','request','5fr1cGPjp1zUZY2yZ3SeW2L6BK6ShijW89T4HjD5TW6EgC2CVnwbIRI6Zd9o','2020-08-31 08:32:45','2020-08-31 08:32:45'),(17,'Johny Caluya','john.caluya@gmail.com','$2y$10$POD5HTYSSZ77r.1p4rGZCON7Uqlhs6nSS8CmoE5V.7.s9Zl4xJMAG','request','B2yh9yBxsGj4ubljNq91gfrdEKTvPd6D4ELOPND133gvPRmMGIHOjGuiTQjR','2020-08-31 08:40:04','2020-08-31 08:40:04'),(18,'Angel Marie Guzman','angelmarie.guzman@gmail.com','$2y$10$VlJgFtkMcu1oxF0VrRuZHeRcjx0/6ci8GYw6bOYC2Ba63q6YsGEbu','Student','umzGuaSYN30l2Su4R81vWqK8jOZdfd7BHDBUsaYRwCITEDfoB0vejm8v6aiq','2020-08-31 08:45:05','2020-08-31 08:45:49'),(19,'Tenson Malaya','tenzon.malaya@gmail.com','$2y$10$spC0JrtbaNkbh15x7pI8FOorqlulehipY6XOprwwd33W0.WxWHsxC','Teacher','3arfjCF4ky3D6dcjd1UZWxNricMOcDfriDK3GOkES2zs7VMpZWSGTtBIcp7l','2020-08-31 08:46:39','2020-08-31 08:46:39');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
