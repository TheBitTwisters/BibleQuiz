-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for osx10.17 (arm64)
--
-- Host: localhost    Database: biblequiz
-- ------------------------------------------------------
-- Server version	10.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `biblequiz`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `biblequiz` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `biblequiz`;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT 0,
  `submitted_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_answers_question_user` (`question_id`,`attendance_id`) USING BTREE,
  KEY `fk_answer_question` (`question_id`),
  KEY `fk_anwer_game` (`game_id`),
  KEY `fk_anwer_user` (`attendance_id`) USING BTREE,
  CONSTRAINT `FK_answer_attendance` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anwer_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES
(42,2,45,37,'B',3,'2022-08-12 23:22:34'),
(43,2,45,40,'A',0,'2022-08-12 23:27:38'),
(44,2,45,38,'B',3,'2022-08-13 00:38:51'),
(45,2,45,39,'B',3,'2022-08-13 02:45:30'),
(46,2,45,41,'B',3,'2022-08-13 02:45:55'),
(47,2,45,42,'B',3,'2022-08-13 02:46:16'),
(48,2,45,43,'B',3,'2022-08-13 02:46:33'),
(49,2,45,44,'B',3,'2022-08-13 02:46:45'),
(50,2,45,45,'B',3,'2022-08-13 02:47:14'),
(51,2,45,46,'B',3,'2022-08-13 02:47:27'),
(52,2,45,49,'B',3,'2022-08-13 02:47:49'),
(53,2,45,51,'B',3,'2022-08-13 02:48:01'),
(54,2,45,52,'A',0,'2022-08-13 02:49:55'),
(55,2,45,50,'A',0,'2022-08-13 02:50:12'),
(56,2,46,50,'C',0,'2022-08-13 04:01:58');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(16) NOT NULL,
  `pass` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_attendance_game_group_member` (`game_id`,`group_id`,`member_id`),
  KEY `fk_attendance_game` (`game_id`),
  KEY `fk_attendance_group` (`group_id`),
  KEY `fk_attendance_user` (`member_id`) USING BTREE,
  CONSTRAINT `fk_attendance_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES
(32,2,2,NULL,'Amy','amy'),
(37,2,3,NULL,'April','april'),
(38,2,4,NULL,'Cassandra','cass'),
(39,2,5,NULL,'Christian','christian'),
(40,2,6,NULL,'Elmer','elmer'),
(41,2,7,NULL,'James','james'),
(42,2,8,NULL,'Jewel','jewel'),
(43,2,9,NULL,'John Dave','dave'),
(44,2,10,NULL,'Majo','majo'),
(45,2,11,NULL,'Meanne','meanne'),
(46,2,12,NULL,'Rogelio','pogi'),
(47,2,13,NULL,'Ralph Vidad','ralphvidad'),
(48,2,14,NULL,'Ralph Villas','ralphvillas'),
(49,2,15,NULL,'Rovie','rovie'),
(50,2,16,NULL,'Ronie','ronie'),
(51,2,17,NULL,'Shiena','shiena'),
(52,2,18,NULL,'Trician James','trician');
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choices`
--

DROP TABLE IF EXISTS `choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `label` varchar(8) NOT NULL,
  `value` text NOT NULL,
  `is_answer` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_choice_question` (`question_id`),
  CONSTRAINT `fk_choice_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES
(153,45,'A','Matthan',0),
(154,45,'B','Jacob',1),
(155,45,'C','Akim',0),
(156,45,'D','Josiah',0),
(157,46,'A','Wise man',0),
(158,46,'B','Ramah',0),
(159,46,'C','An angel',1),
(160,46,'D','Magi',0),
(169,47,'A','Egypt',1),
(170,47,'B','Nazareth',0),
(171,47,'C','Bethlehem',0),
(172,47,'D','Judea',0),
(173,48,'A','Nile River',0),
(174,48,'B','Jordan River',1),
(175,48,'C','Sea of Galilee',0),
(176,48,'D','Euphrates River',0),
(181,49,'A','20 days & 20 nights',0),
(182,49,'B','30 days & 30 nights',0),
(183,49,'C','40 days & 40 nights',1),
(184,49,'D','120 days & 120 nights',0),
(189,50,'A','James & John',0),
(190,50,'B','Simon Peter & Andrew',1),
(191,50,'C','James & Bartholomew',0),
(192,50,'D','James & Andrew',0),
(193,51,'A','Be filled',0),
(194,51,'B','Obtain mercy',0),
(195,51,'C','See God',0),
(196,51,'D','Be comforted',1),
(197,52,'A','Bread',1),
(198,52,'B','Life',0),
(199,52,'C','Trials',0),
(200,52,'D','Food',0),
(201,53,'A','Mind',0),
(202,53,'B','Ears',0),
(203,53,'C','Eyes',1),
(204,53,'D','Heart',0),
(205,54,'A','Don\'t walk',0),
(206,54,'B','2 miles',1),
(207,54,'C','3 miles',0),
(208,54,'D','4 miles',0),
(209,55,'True','',1),
(210,55,'False','',0),
(211,56,'True','',0),
(212,56,'False','',1),
(213,57,'True','',0),
(214,57,'False','',1),
(215,58,'True','',0),
(216,58,'False','',1),
(217,59,'True','',1),
(218,59,'False','',0),
(219,60,'True','',0),
(220,60,'False','',1),
(221,61,'True','',0),
(222,61,'False','',1),
(223,62,'True','',0),
(224,62,'False','',1),
(225,63,'True','',0),
(226,63,'False','',1),
(227,64,'True','',1),
(228,64,'False','',0),
(229,65,'','Fourteen',1),
(230,66,'','God with us',1),
(231,67,'','Gold, incense, myrrh',1),
(232,68,'','Locusts & wild honey',1),
(233,69,'','Galilee',1),
(234,70,'','Kingdoms of the world',1),
(235,71,'','Gold & money',1),
(236,72,'','Birds & lilies',1),
(237,73,'','Put oil on your head and wash your face',1),
(238,74,'','Theirs is the kingdom of God',1),
(239,75,'A','Eyelashes',0),
(240,75,'B','Speck of sawdust',1),
(241,75,'C','Speck of water',0),
(242,75,'D','Tears',0),
(243,76,'A','Sand',0),
(244,76,'B','Plain',0),
(245,76,'C','Rock',1),
(246,76,'D','Mountain',0),
(247,77,'A','Capernaum',1),
(248,77,'B','Judea',0),
(249,77,'C','Galilee',0),
(250,77,'D','Gadarenes',0),
(251,78,'A','Dogs',0),
(252,78,'B','Pigs',1),
(253,78,'C','Monkeys',0),
(254,78,'D','Horses',0),
(255,79,'A','Peace',0),
(256,79,'B','Money',0),
(257,79,'C','Rest',1),
(258,79,'D','Home',0),
(259,80,'A','lion, lamb',0),
(260,80,'B','snake, dove',1),
(261,80,'C','lamb, lion',0),
(262,80,'D','dove, snake',0),
(263,81,'A','4',0),
(264,81,'B','40',0),
(265,81,'C','20',0),
(266,81,'D','7',1),
(267,82,'A','Blasphemer',1),
(268,82,'B','Teacher',0),
(269,82,'C','Healer',0),
(270,82,'D','Tax Collector',0),
(271,83,'A','Righteous',0),
(272,83,'B','Sick',0),
(273,83,'C','Sinners',1),
(274,83,'D','Tired',0),
(275,84,'A','Peter',0),
(276,84,'B','Matthew',1),
(277,84,'C','James',0),
(278,84,'D','Bartholomew',0),
(279,85,'True','',0),
(280,85,'False','',1),
(281,86,'True','',0),
(282,86,'False','',1),
(283,87,'True','',0),
(284,87,'False','',1),
(285,88,'True','',1),
(286,88,'False','',0),
(287,89,'True','',0),
(288,89,'False','',1),
(289,90,'True','',0),
(290,90,'False','',1),
(291,91,'True','',1),
(292,91,'False','',0),
(293,92,'True','',0),
(294,92,'False','',1),
(295,93,'True','',0),
(296,93,'False','',1),
(297,94,'True','',1),
(298,94,'False','',0),
(299,95,'','Ferocious Wolves',1),
(300,96,'','Blind, mute, deaf, leprosy, casted out demons',1),
(301,97,'','Peter',1),
(302,98,'','Disciples',1),
(303,99,'','Gadarenes',1),
(304,100,'','12 years',1),
(305,101,'','Thaddeus and Philip',1),
(306,102,'','Destroy both soul and body',1),
(307,103,'','Israel',1),
(308,104,'','Beelzebul',1),
(309,105,'A','Enemy',0),
(310,105,'B','Son of Man',1),
(311,105,'C','Missionaries',0),
(312,105,'D','Christians',0),
(313,106,'A','God’s Kingdom',0),
(314,106,'B','God’s words',1),
(315,106,'C','The fruits',0),
(316,106,'D','The trees',0),
(317,107,'A','10 baskets of bread and fish',0),
(318,107,'B','5 baskets of bread and fish',0),
(319,107,'C','7 baskets of bread and fish',0),
(320,107,'D','12 baskets of bread and fish',1),
(321,108,'A','Capernaum',0),
(322,108,'B','Gennesaret',1),
(323,108,'C','Nazareth',0),
(324,108,'D','Bethlehem',0),
(325,109,'A','10 loaves',0),
(326,109,'B','7 loaves',1),
(327,109,'C','5 loaves',0),
(328,109,'D','2 loaves',0),
(329,110,'A','Bethel',0),
(330,110,'B','Antioch',0),
(331,110,'C','Caesarea Philippi',1),
(332,110,'D','Jerusalem',0),
(333,111,'A','Radium',0),
(334,111,'B','Sun',1),
(335,111,'C','Fire',0),
(336,111,'D','Gems',0),
(337,112,'A','Seventy-seven times',0),
(338,112,'B','Seventy-seven times seven',0),
(339,112,'C','Seven times seven',0),
(340,112,'D','Seventy times seven',1),
(341,113,'A','Disciples of Jesus',0),
(342,113,'B','Pharisees',1),
(343,113,'C','Sadducees',0),
(344,113,'D','Scribes',0),
(345,114,'A','Jews',0),
(346,114,'B','Galileans',0),
(347,114,'C','Gentiles',1),
(348,114,'D','Sanhedrin',0),
(349,115,'True','',0),
(350,115,'False','',1),
(351,116,'True','',0),
(352,116,'False','',1),
(353,117,'True','',1),
(354,117,'False','',0),
(355,118,'True','',0),
(356,118,'False','',1),
(357,119,'True','',0),
(358,119,'False','',1),
(359,120,'True','',0),
(360,120,'False','',1),
(361,121,'True','',1),
(362,121,'False','',0),
(363,122,'True','',1),
(364,122,'False','',0),
(365,123,'True','',1),
(366,123,'False','',0),
(367,124,'True','',1),
(368,124,'False','',0),
(369,125,'','Sons of the Kingdom',1),
(370,126,'','Philip',1),
(371,127,'','Birthday',1),
(372,128,'','Tyre & Sidon',1),
(373,129,'','Key of Heaven',1),
(374,130,'','Sign of Jonah',1),
(375,131,'','Peter, James, & John',1),
(376,132,'','Forgive others too',1),
(377,133,'','Humble like the little children',1),
(378,134,'','Sell his possessions, give to the poor, and follow Jesus',1),
(379,135,'','They cried even more',1),
(380,136,'A','Galilee',1),
(381,136,'B','Capernaum',0),
(382,136,'C','Nazareth',0),
(383,136,'D','Bethany',0);
/*!40000 ALTER TABLE `choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(64) NOT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  `current_question_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES
(1,1,'test','2022-08-12',0,'2022-06-29 16:17:24'),
(2,1,'Matthew 1 to 6','2022-07-02',47,'2022-07-06 22:58:52'),
(3,1,'Matthew 7 to 12','2022-07-09',0,'2022-07-08 08:29:51'),
(4,1,'Matthew 13 to 20','2022-08-06',0,'2022-08-07 11:30:44'),
(5,1,'Matthew 21 to 28','2022-08-13',0,'2022-08-13 13:34:29');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamescores`
--

DROP TABLE IF EXISTS `gamescores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamescores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `score` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_gamescore_group` (`game_id`,`group_id`),
  KEY `fk_gamescore_group` (`group_id`),
  CONSTRAINT `fk_gamescore_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamescore_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamescores`
--

LOCK TABLES `gamescores` WRITE;
/*!40000 ALTER TABLE `gamescores` DISABLE KEYS */;
INSERT INTO `gamescores` VALUES
(1,2,1,73),
(2,2,7,35),
(3,2,11,38),
(4,2,3,59),
(6,2,2,82),
(7,2,5,33),
(8,2,4,75),
(9,2,14,13),
(10,2,15,19),
(11,2,16,28),
(12,2,17,11),
(13,2,9,19),
(14,3,1,73),
(15,3,7,31),
(16,3,3,73),
(18,3,2,84),
(19,3,5,31),
(20,3,4,81),
(21,3,8,58),
(22,3,17,35),
(23,3,11,42),
(24,4,1,152),
(25,4,7,83),
(26,4,11,55),
(27,4,3,125),
(28,4,2,144),
(29,4,5,110),
(30,4,4,119),
(31,4,9,64),
(32,4,10,44),
(33,4,6,96),
(34,4,8,76);
/*!40000 ALTER TABLE `gamescores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `name` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES
(1,1,'My-Anne','2022-08-11 18:00:50'),
(2,1,'RovieJames','2022-08-11 18:02:08'),
(3,1,'MagLola','2022-08-11 18:02:38'),
(4,1,'Pogi Group','2022-08-11 18:03:47'),
(5,1,'Small But Terrible','2022-08-11 18:04:04'),
(6,1,'Team JOB','2022-08-11 18:04:24'),
(7,1,'Joan / April','2022-08-11 18:04:37'),
(8,1,'Kar / Lea','2022-08-11 18:04:49'),
(9,1,'3 in 1','2022-08-11 18:05:01'),
(10,1,'Team John','2022-08-11 18:05:30'),
(11,1,'JOX','2022-08-11 18:05:41'),
(13,1,'S - John Michael','2022-08-11 21:32:42'),
(14,1,'S - Ralph Vidad','2022-08-12 09:18:45'),
(15,1,'S - Ralph Villas','2022-08-12 09:18:55'),
(16,1,'S - Shiena','2022-08-12 09:19:05'),
(17,1,'S - TJ','2022-08-12 09:19:16');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES
(1,'Easy',3),
(2,'Average',5),
(3,'Hard',10),
(4,'Bonus',10);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `pin` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES
(1,'shyne','$2a$04$RdpoaMnOoJnXNjGPQ0V4guCNILk1OJXQ4iySEfp3cjdp9zIJDJnWK');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `group_id` int(11) DEFAULT NULL,
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `registered_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_member_name` (`last_name`,`first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES
(2,1,1,'Acido','Amy','2022-07-07 00:34:43'),
(3,1,7,'Acido','April','2022-07-07 00:35:31'),
(4,1,11,'Sebes','Cassandra','2022-07-07 00:35:56'),
(5,1,3,'Patricio','Christian','2022-07-07 00:36:19'),
(6,1,3,'Manaytay','Elmer','2022-07-07 00:36:48'),
(7,1,2,'Cuaresma','James','2022-07-07 00:37:29'),
(8,1,4,'Razon','Rose Jewel','2022-07-07 00:37:43'),
(9,1,11,'Sebes','John Dave','2022-07-07 00:38:22'),
(10,1,5,'Pascua','Marjorie','2022-07-07 00:38:36'),
(11,1,1,'Acido','Meanne','2022-07-07 00:38:53'),
(12,1,4,'Razon','Rogelio Jr.','2022-07-07 00:39:08'),
(13,1,14,'Vidad','Ralph','2022-07-07 00:39:23'),
(14,1,15,'Villas','Ralph','2022-07-07 00:39:36'),
(15,1,2,'Cuaresma','Rovielyn','2022-07-07 00:39:48'),
(16,1,9,'Vidad','Ronie','2022-07-07 00:39:55'),
(17,1,16,'Garcia','Shiena','2022-07-07 00:40:03'),
(18,1,17,'Pascua','Trician James','2022-07-07 00:40:19'),
(19,1,8,'Acido','Karen','2022-07-09 15:32:29'),
(20,1,8,'Acido','Lea','2022-07-09 15:32:39'),
(22,1,3,'Cuaresma','Jocelyn','2022-08-11 18:26:40'),
(24,1,5,'Teofilo','Reyna','2022-08-11 18:28:32'),
(26,1,6,'Arevalo','Christopher','2022-08-11 18:32:39'),
(27,1,6,'Velchez','Christian','2022-08-11 18:33:03'),
(28,1,9,'Gutierez','James Roi','2022-08-11 21:29:46'),
(29,1,9,'Romero','Mark Joseph','2022-08-11 21:30:06'),
(30,1,10,'Vidad','Jovel','2022-08-11 21:30:28'),
(31,1,10,'Vidad','Alexa','2022-08-11 21:31:07'),
(32,1,13,'Marcos','John Michael','2022-08-11 21:32:23');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_types`
--

DROP TABLE IF EXISTS `quest_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `choices_count` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_types`
--

LOCK TABLES `quest_types` WRITE;
/*!40000 ALTER TABLE `quest_types` DISABLE KEYS */;
INSERT INTO `quest_types` VALUES
(1,'Multiple Choice',4),
(2,'True or False',2),
(3,'Identification',1);
/*!40000 ALTER TABLE `quest_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `game_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `order` tinyint(3) unsigned NOT NULL,
  `question` text NOT NULL,
  `reference` varchar(255) NOT NULL,
  `score` tinyint(4) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `locked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_question_game` (`game_id`,`question`) USING HASH,
  KEY `fk_question_game` (`game_id`),
  KEY `fk_question_level` (`level_id`),
  KEY `fk_question_type` (`type_id`),
  CONSTRAINT `fk_question_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_type` FOREIGN KEY (`type_id`) REFERENCES `quest_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES
(45,1,2,1,1,1,'Who is the father of Joseph, the wife of Mary?','Matthew 1:16',3,'2022-07-17 23:04:12','2022-08-13 11:52:30'),
(46,1,2,1,1,2,'Who told Joseph in Egypt to go to the land of Israel because Herod already died?','Matthew 2:21',3,'2022-07-17 23:32:18',NULL),
(47,1,2,1,1,3,'Where did Joseph and Mary escape when Herod was trying to kill Jesus?','Matthew 2:13',3,'2022-07-18 00:01:51',NULL),
(48,1,2,1,1,4,'Where was Jesus baptized?','Matthew 3:16',3,'2022-07-18 00:04:16',NULL),
(49,1,2,1,1,5,'How many days did Jesus fast in the wilderness?','Matthew 4:1',3,'2022-07-18 00:08:18',NULL),
(50,1,2,1,1,6,'Who were the very first disciple called by Jesus?','Matthew 4:18',3,'2022-07-18 00:10:41',NULL),
(51,1,2,1,1,7,'According to the Beatitudes, “Blessed are those who mourn for they will _____?','Matthew 5:14',3,'2022-07-18 00:11:59',NULL),
(52,1,2,1,1,8,'In the Lord’s prayer, we are asking the Lord to “give us everyday our daily _____”','Matthew 6:11',3,'2022-07-18 22:40:46',NULL),
(53,1,2,1,1,9,'This part is described as the lamp of our body.','Matthew 6:22',3,'2022-07-18 22:57:53',NULL),
(54,1,2,1,1,10,'Matthew 6:41 states that if someone forces us to go with him one mile, how much more should we walk with him?','Matthew 6:41',3,'2022-07-18 22:58:45',NULL),
(55,1,2,2,2,11,'Immanuel and the Nazarene is what we call Joseph and Mary’s child.','Matthew 1:23, 2:23',5,'2022-07-18 22:59:40',NULL),
(56,1,2,2,2,12,'Herod didn’t asked his people to search for Jesus Christ because he knows where he is.','Matthew 2:7',5,'2022-07-18 23:03:13',NULL),
(57,1,2,2,2,13,'Herod ordered that every boy who is 3 years and younger be killed in Bethlehem and its vicinity.','Matthew 2:16',5,'2022-07-18 23:04:20',NULL),
(58,1,2,2,2,14,'After Jesus’ baptism, the heavens opened and the spirit of God descended like a dove and a thunderstorm on Him.','Matthew 3:16',5,'2022-07-18 23:05:40',NULL),
(59,1,2,2,2,15,'A voice from heaven after baptism said, “This is my son, who I love; with Him I am well pleased”.','Matthew 3:17',5,'2022-07-18 23:08:51',NULL),
(60,1,2,2,2,16,'It is written; “Man does not live by bread alone, but on every word that comes from the mouth of God”.','Matthew 4:1',5,'2022-07-18 23:09:21',NULL),
(61,1,2,2,2,17,'It is written; “Always put your God to the test”.','Matthew 4:7',5,'2022-07-18 23:09:57',NULL),
(62,1,2,2,2,18,'Blessed are the peacemakers for they shall see God.','Matthew 5:6',5,'2022-07-18 23:10:27',NULL),
(63,1,2,2,2,19,'Give to the one who asks you, lend to the one who borrow from you, and confirm with them when should they pay.','Matthew 5:42',5,'2022-07-18 23:10:50',NULL),
(64,1,2,2,2,20,'It is said that we can be perfect like our Father in heaven is perfect.','Matthew 6:48',5,'2022-07-18 23:11:19',NULL),
(65,1,2,3,3,21,'How many generations were there from Abraham to David, from David to the exile of Babylon, and from the exile to Christ?','Matthew 1:17',10,'2022-07-18 23:12:48',NULL),
(66,1,2,3,3,22,'What does Immanuel mean?','Matthew 1:22',10,'2022-07-18 23:14:33',NULL),
(67,1,2,3,3,23,'What gift did the wise men bring Jesus?','Matthew 2:11',10,'2022-07-18 23:15:08',NULL),
(68,1,2,3,3,24,'What was John the Baptist’s food in the Desert of Judea?','Matthew 3:4',10,'2022-07-18 23:16:05',NULL),
(69,1,2,3,3,25,'Where was Jesus from when he went to the Jordan River to be baptized by John the Baptist?','Matthew 3:13',10,'2022-07-18 23:16:38',NULL),
(70,1,2,3,3,26,'If Jesus will bow down and worship the devil, what can Jesus have?','Matthew 4:8',10,'2022-07-18 23:17:04',NULL),
(71,1,2,3,3,27,'We should not lay treasures on earth. The bible tells us not to serve two masters. Name the two masters?','Matthew 6:19-24',10,'2022-07-18 23:17:58',NULL),
(72,1,2,3,3,28,'In Matthew 6:25, God said, “Do not worry about your life, what you eat and drink”. What two things mentioned were set as examples that God is in control?','Matthew 6:25',10,'2022-07-18 23:18:28',NULL),
(73,1,2,3,3,29,'According to Matthew 6:16-18, what should we do when we fast?','Matthew 6:16-18',10,'2022-07-18 23:19:14',NULL),
(74,1,2,3,3,30,'“Blessed are those whose persecuted for righteousness sake, for ______.”','Matthew 5:10',10,'2022-07-18 23:20:17',NULL),
(75,1,3,1,1,1,'What shouldn’t we look at on our brothers’ eyes because we, ourselves, also have it?','Matthew 7:3-5',3,'2022-07-24 03:23:21',NULL),
(76,1,3,1,1,2,'Where did the wise man build his house on?','Matthew 7:24',3,'2022-07-24 03:24:33',NULL),
(77,1,3,1,1,3,'Where did the paralyze man, who was suffering terribly, lived?','Matthew 8:5-6',3,'2022-07-24 03:27:20',NULL),
(78,1,3,1,1,4,'On what animals where the demons casted out?','Matthew 8:30-33',3,'2022-07-24 03:28:37',NULL),
(79,1,3,1,1,5,'“Come to me all you who are weary and burdened, and I will give you ____”.','Matthew 11:28',3,'2022-07-24 03:37:30',NULL),
(80,1,3,1,1,6,'“I am sending you out like a sheep among wolves. Therefore, be as shrewd as ____ and as innocent as ____”. ','Matthew 10:16',3,'2022-07-24 07:52:05',NULL),
(81,1,3,1,1,7,'If an impure spirit comes out of a person, how many more wicked spirits does he take with him?','Matthew 12:43-45',3,'2022-07-24 07:58:48',NULL),
(82,1,3,1,1,8,'According to Matthew 9:3, what did the teachers of the law think about Jesus?','Matthew 9:3',3,'2022-07-24 07:59:52',NULL),
(83,1,3,1,1,9,'According to Matthew 9:13, who did Jesus come to call?','Matthew 9:13',3,'2022-07-24 08:00:44',NULL),
(84,1,3,1,1,10,'He is a disciple who is a tax collector. ','Matthew 9:10',3,'2022-07-24 08:01:43',NULL),
(85,1,3,2,2,11,'“Do not give pigs what is sacred; do not throw your pearls to dogs. If you do, they may trample them under their feet, and turn and tear you into pieces. “','Matthew 7:6',5,'2022-07-24 08:05:57',NULL),
(86,1,3,2,2,12,'“Enter into the wide gate for it is broad and you will have many choices in it.”','Matthew 7:13-14',5,'2022-07-24 08:10:11',NULL),
(87,1,3,2,2,13,'“Everyone who calls to me, ‘Lord, Lord’ will enter the kingdom of heaven”','Matthew 7:21',5,'2022-07-24 08:10:40',NULL),
(88,1,3,2,2,14,'Jesus told them, “Follow me and let the dead bury their own dead.”','Matthew 8:22',5,'2022-07-24 08:11:13',NULL),
(89,1,3,2,2,15,'Doctors heal those who are well and sick, and Jesus came to call everyone, the righteous and sinners.','Matthew 9:12',5,'2022-07-24 09:06:37',NULL),
(90,1,3,2,2,16,'Jesus said, “Go away, the girl is already dead and we can do nothing to help her”.','Matthew 9:24',5,'2022-07-24 09:07:09',NULL),
(91,1,3,2,2,17,'Jesus went through all the towns and villages, teaching in their synagogues, proclaiming good news and healing every disease and sickness.','Matthew 9:35',5,'2022-07-24 09:07:54',NULL),
(92,1,3,2,2,18,'Jesus instructed His disciples that it is fine to take silver or gold from people they healed and who wants to give any to them.','Matthew 10:9',5,'2022-07-24 09:08:22',NULL),
(93,1,3,2,2,19,'Students can sometimes teach their teachers especially if they are knowledgeable about what they say.','Matthew 10:24',5,'2022-07-24 09:09:25',NULL),
(94,1,3,2,2,20,'“No one knows the Son except the Father, and no one knows the Father except the Son and those to whom the Son chooses to reveal Him.”','Matthew 11:27',5,'2022-07-24 09:09:49',NULL),
(95,1,3,3,3,21,'Jesus warns us about false prophets for they come to us in sheep’s clothing but inwardly, they are what?','Matthew 7:15',10,'2022-07-24 09:12:32',NULL),
(96,1,3,3,3,22,'Name at least 2 sickness that Jesus healed.','Matthew 8',10,'2022-07-24 09:15:12',NULL),
(97,1,3,3,3,23,'Whose disciple’s mother-in-law lays in bed with fever?','Matthew 8:14',10,'2022-07-24 09:16:52',NULL),
(98,1,3,3,3,24,'To whom did Jesus said these words, “You of little faith, why are you so afraid?”','Matthew 8:26',10,'2022-07-24 09:18:24',NULL),
(99,1,3,3,3,25,'Where were the two demon possessed men from?','Matthew 8:28',10,'2022-07-24 09:18:49',NULL),
(100,1,3,3,3,26,'There was a woman who came up behind Jesus and touched his cloak. She had been bleeding for how many years?','Matthew 9:12',10,'2022-07-24 09:19:28',NULL),
(101,1,3,3,3,27,'Who are the missing disciples from this list? \nPeter, Andrew, James, Thomas, James, Matthew, John, Simon, Judas, Bartholomew.','Matthew 7 - 12',10,'2022-07-24 09:20:39',NULL),
(102,1,3,3,3,28,'Do not be afraid of those who kill the body but cannot kill the soul. Rather, be afraid of the one who _____?','Matthew 10:28',10,'2022-07-24 09:21:07',NULL),
(103,1,3,3,3,29,'Jesus sent out the disciples to go among the Gentiles or enter any town in Samaritans but go to the lost sheep of _____.','Matthew 10:5-7',10,'2022-07-24 09:21:50',NULL),
(104,1,3,3,3,30,'He is the prince of demon who can only drive out demons.','Matthew 12:24',10,'2022-07-24 09:22:45',NULL),
(105,1,4,1,1,1,'In Matt. 13: 36-43, the parable of the weeds, who planted the good seed? ','Matthew 13:37',3,'2022-08-07 11:37:22',NULL),
(106,1,4,1,1,2,'In Matt. 13:18-23, what does the seed represent?','Matthew 13:18-23',3,'2022-08-07 11:38:43',NULL),
(107,1,4,1,1,3,'What quantity of food remained after the multitude finished eating?','Matthew 14:20',3,'2022-08-07 11:50:49',NULL),
(108,1,4,1,1,4,'Where did they sail to after Jesus joined His disciples in the boat by walking on the sea?','Matthew 14:34',3,'2022-08-07 11:51:54',NULL),
(109,1,4,1,1,5,'According to Matthew 15, how many loaves of bread did Jesus’ use to feed the multitude?','Matthew 15:34',3,'2022-08-07 11:53:02',NULL),
(110,1,4,1,1,6,'Where did Jesus ask His disciples to tell Him what people said about Him?','Matthew 16:13',3,'2022-08-07 11:55:46',NULL),
(111,1,4,1,1,7,'During the transfiguration, Jesus\' face shone like what?','Matthew 17:2',3,'2022-08-07 11:56:59',NULL),
(112,1,4,1,1,8,'According to Jesus, how many times should we forgive our brother if he sins against us?','Matthew 18:22',3,'2022-08-07 12:20:33',NULL),
(113,1,4,1,1,9,'Which people came to Jesus to ask a question about marriage?','Matthew 19:3',3,'2022-08-07 12:28:54',NULL),
(114,1,4,1,1,10,'In whose hands would Jesus be mocked and scourged?','Matthew 20:19',3,'2022-08-07 12:29:34',NULL),
(115,1,4,2,2,11,'The master said, \"Let the weeds and the seeds grow together and we will harvest them and put them in my barn at the same time.\"','Matthew 13:29-30',5,'2022-08-07 12:30:30',NULL),
(116,1,4,2,2,12,'Herod did not put John the Baptist to death right after arresting and imprisoning him because Herodias withheld him.','Matthew 14:5',5,'2022-08-07 12:31:17',NULL),
(117,1,4,2,2,13,'In Matthew 15, Jesus had compassion for the multitude because they have been with Him for three days and they were hungry.','Matthew 15:32',5,'2022-08-07 12:31:40',NULL),
(118,1,4,2,2,14,'According to Matthew 15, the multitudes who were fed by Jesus on the mountain has a total number of 5,000 men beside women and children.','Matthew 15:38',5,'2022-08-07 14:09:02',NULL),
(119,1,4,2,2,15,'Some Jews thought Jesus is John the Baptist, some said Elias and other, Jeremias, but not other prophets.','Matthew 16:14',5,'2022-08-07 14:09:29',NULL),
(120,1,4,2,2,16,'When Jesus told the disciples to take heed and beware of the leaven of the Pharisees and Sadducees, he meant they should beware of the leavened bread that the Pharisees and the Sadducees share at the temple.','Matthew 16:12',5,'2022-08-07 14:09:54',NULL),
(121,1,4,2,2,17,'The disciples could not cast out the lunatic demon that had possessed the child because of their unbelief.','Matthew 17:19',5,'2022-08-07 14:10:19',NULL),
(122,1,4,2,2,18,'According to Matthew 18, the condition that leads to enter the kingdom of God is to be converted and become as little children.','Matthew 18:3',5,'2022-08-07 14:10:45',NULL),
(123,1,4,2,2,19,'Jesus said, \"It is easier for a camel to go through the eye of a needle, than for a rich man to enter the kingdom of God\" because his disciples about who can be saved.','Matthew 19:24',5,'2022-08-07 14:11:04',NULL),
(124,1,4,2,2,20,'Service makes a person great in the kingdom of heaven.','Matthew 20:26',5,'2022-08-07 14:11:23',NULL),
(125,1,4,3,3,21,'What does the good seed represent?','Matthew 13:38',10,'2022-08-07 14:12:21',NULL),
(126,1,4,3,3,22,'Who is Herodias\' husband, the brother of Herod?','Matthew 14:3',10,'2022-08-07 14:12:51',NULL),
(127,1,4,3,3,23,'What event led to the death of John the Baptist?','Matthew 14:6',10,'2022-08-07 14:13:24',NULL),
(128,1,4,3,3,24,'At what place did the Canaanite woman come to Jesus for help?','Matthew 15:21',10,'2022-08-07 14:13:56',NULL),
(129,1,4,3,3,25,'According to Matthew 16, what did Jesus promise to give His disciples?','Matthew 16:19',10,'2022-08-07 14:14:27',NULL),
(130,1,4,3,3,26,'Which sign would God give mankind to prove that Jesus is the Messiah?','Matthew 16:4',10,'2022-08-07 14:14:56',NULL),
(131,1,4,3,3,27,'Who were the disciples that Jesus took to the mountain, where the transfiguration happened?','Matthew 17:1',10,'2022-08-07 14:16:13',NULL),
(132,1,4,3,3,28,'What is the condition for receiving God\'s forgiveness?','Matthew 18:35',10,'2022-08-07 14:17:03',NULL),
(133,1,4,3,3,29,'Who is the greatest in the kingdom of heaven?','Matthew 18:4',10,'2022-08-07 14:17:42',NULL),
(134,1,4,3,3,30,'According to Jesus, what should the rich man do to become perfect?','Matthew 19:21',10,'2022-08-07 14:18:39',NULL),
(135,1,4,4,3,31,'What was the reaction of the blind men when the multitude tried to silence them from crying out to Jesus?','Matthew 20:30',10,'2022-08-07 14:19:11',NULL),
(136,1,5,1,1,1,'Where did Jesus tell His disciples to meet Him after His resurrection? ','Matt 28:10',3,'2022-08-13 13:42:24',NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-13 13:43:28
