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
  `user_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT 0,
  `submitted_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_answers_question_user` (`question_id`,`user_id`) USING BTREE,
  KEY `fk_answer_question` (`question_id`),
  KEY `fk_anwer_game` (`game_id`),
  KEY `fk_anwer_user` (`user_id`) USING BTREE,
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anwer_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anwer_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_game` (`game_id`),
  KEY `fk_attendance_user` (`user_id`) USING BTREE,
  CONSTRAINT `fk_attendance_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES
(1,2,2),
(2,2,1),
(3,2,3),
(4,2,4),
(5,2,5),
(6,2,6),
(7,2,7),
(8,2,8),
(9,2,9),
(10,2,10),
(11,2,11),
(12,2,13),
(13,2,14),
(14,2,12),
(15,2,16),
(16,2,15),
(17,2,17),
(18,2,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4;
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
(196,51,'D','Be comforted',1);
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
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `title` varchar(64) NOT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  `current_question_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES
(1,1,'TEST','2022-07-01',2,'2022-06-29 16:17:24'),
(2,1,'Matthew 1 to 6','2022-07-02',5,'2022-07-06 22:58:52'),
(3,1,'Matthew 7 to 12','2022-07-09',0,'2022-07-08 08:29:51');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES
(1,'Easy',3),
(2,'Average',5),
(3,'Hard',10);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
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
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `game_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `order` tinyint(3) unsigned NOT NULL,
  `question` text NOT NULL,
  `reference` varchar(255) NOT NULL,
  `score` tinyint(4) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_question_game` (`game_id`,`question`) USING HASH,
  KEY `fk_question_game` (`game_id`),
  KEY `fk_question_level` (`level_id`),
  KEY `fk_question_type` (`type_id`),
  CONSTRAINT `fk_question_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_type` FOREIGN KEY (`type_id`) REFERENCES `quest_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES
(45,1,2,1,1,1,'Who is the father of Joseph, the wife of Mary?','Matthew 1:16',3,'2022-07-17 23:04:12'),
(46,1,2,1,1,2,'Who told Joseph in Egypt to go to the land of Israel because Herod already died?','Matthew 2:21',3,'2022-07-17 23:32:18'),
(47,1,2,1,1,3,'Where did Joseph and Mary escape when Herod was trying to kill Jesus?','Matthew 2:13',3,'2022-07-18 00:01:51'),
(48,1,2,1,1,4,'Where was Jesus baptized?','Matthew 3:16',3,'2022-07-18 00:04:16'),
(49,1,2,1,1,5,'How many days did Jesus fast in the wilderness?','Matthew 4:1',3,'2022-07-18 00:08:18'),
(50,1,2,1,1,6,'Who were the very first disciple called by Jesus?','Matthew 4:18',3,'2022-07-18 00:10:41'),
(51,1,2,1,1,7,'According to the Beatitudes, “Blessed are those who mourn for they will _____?','Matthew 5:14',3,'2022-07-18 00:11:59');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `type` varchar(8) NOT NULL DEFAULT 'player',
  `name` varchar(64) NOT NULL,
  `pin` varchar(60) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,1,'player','angelo.sison','','Angelo Sison','2022-07-01 16:40:50'),
(2,1,'player','amalia.acido','','Amy Acido','2022-07-07 00:34:43'),
(3,1,'player','april.acido','','April Acido','2022-07-07 00:35:31'),
(4,1,'player','cassandra.sebes','','Cassandra Sebes','2022-07-07 00:35:56'),
(5,1,'player','christian.patricio','','Christian Patricio','2022-07-07 00:36:19'),
(6,1,'player','elmer.manaytay','','Elmer Manaytay','2022-07-07 00:36:48'),
(7,1,'player','james.cuaresma','','James Cuaresma','2022-07-07 00:37:29'),
(8,1,'player','jewel.razon','','Rose Jewel Razon','2022-07-07 00:37:43'),
(9,1,'player','johndave.sebes','','John Dave Sebes','2022-07-07 00:38:22'),
(10,1,'player','marjorie.pascua','','Marjorie Pascua','2022-07-07 00:38:36'),
(11,1,'player','meanne.acido','','Meanne Acido','2022-07-07 00:38:53'),
(12,1,'player','rogelio.razon','','Rogelio Razon Jr.','2022-07-07 00:39:08'),
(13,1,'player','ralph.vidad','','Ralph Vidad','2022-07-07 00:39:23'),
(14,1,'player','ralph.villas','','Ralph Villas','2022-07-07 00:39:36'),
(15,1,'player','rovielyn.cuaresma','','Rovielyn Cuaresma','2022-07-07 00:39:48'),
(16,1,'player','roni.vidad','','Roni Vidad','2022-07-07 00:39:55'),
(17,1,'player','shiena.garcia','','Shiena Garcia','2022-07-07 00:40:03'),
(18,1,'player','trician.pascua','','Trician James Pascua','2022-07-07 00:40:19'),
(19,1,'player','karen.acido','','Karen Acido','2022-07-09 15:32:29'),
(20,1,'player','lea.acido','','Lea Acido','2022-07-09 15:32:39'),
(21,1,'manager','shyne','$2a$04$RdpoaMnOoJnXNjGPQ0V4guCNILk1OJXQ4iySEfp3cjdp9zIJDJnWK','Shyne','2022-07-11 12:03:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-18 11:52:50
