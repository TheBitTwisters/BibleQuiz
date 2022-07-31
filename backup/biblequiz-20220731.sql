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
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4;
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
(308,104,'','Beelzebul',1);
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
(2,1,'Matthew 1 to 6','2022-07-02',45,'2022-07-06 22:58:52'),
(3,1,'Matthew 7 to 12','2022-07-09',76,'2022-07-08 08:29:51');
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
  `locked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_question_game` (`game_id`,`question`) USING HASH,
  KEY `fk_question_game` (`game_id`),
  KEY `fk_question_level` (`level_id`),
  KEY `fk_question_type` (`type_id`),
  CONSTRAINT `fk_question_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_type` FOREIGN KEY (`type_id`) REFERENCES `quest_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES
(45,1,2,1,1,1,'Who is the father of Joseph, the wife of Mary?','Matthew 1:16',3,'2022-07-17 23:04:12',NULL),
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
(104,1,3,3,3,30,'He is the prince of demon who can only drive out demons.','Matthew 12:24',10,'2022-07-24 09:22:45',NULL);
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
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
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
(1,1,'player','angelo.sison','','Sison','Angelo','Angelo Sison','2022-07-01 16:40:50'),
(2,1,'player','amalia.acido','','Acido','Amy','Amy Acido','2022-07-07 00:34:43'),
(3,1,'player','april.acido','','Acido','April','April Acido','2022-07-07 00:35:31'),
(4,1,'player','cassandra.sebes','','Sebes','Cassandra','Cassandra Sebes','2022-07-07 00:35:56'),
(5,1,'player','christian.patricio','','Patricio','Christian','Christian Patricio','2022-07-07 00:36:19'),
(6,1,'player','elmer.manaytay','','Manaytay','Elmer','Elmer Manaytay','2022-07-07 00:36:48'),
(7,1,'player','james.cuaresma','','Cuaresma','James','James Cuaresma','2022-07-07 00:37:29'),
(8,1,'player','jewel.razon','','Razon','Rose Jewel','Rose Jewel Razon','2022-07-07 00:37:43'),
(9,1,'player','johndave.sebes','','Sebes','John Dave','John Dave Sebes','2022-07-07 00:38:22'),
(10,1,'player','marjorie.pascua','','Pascua','Marjorie','Marjorie Pascua','2022-07-07 00:38:36'),
(11,1,'player','meanne.acido','','Acido','Meanne','Meanne Acido','2022-07-07 00:38:53'),
(12,1,'player','rogelio.razon','','Razon','Rogelio Jr.','Rogelio Razon Jr.','2022-07-07 00:39:08'),
(13,1,'player','ralph.vidad','','Vidad','Ralph','Ralph Vidad','2022-07-07 00:39:23'),
(14,1,'player','ralph.villas','','Villas','Ralph','Ralph Villas','2022-07-07 00:39:36'),
(15,1,'player','rovielyn.cuaresma','','Cuaresma','Rovielyn','Rovielyn Cuaresma','2022-07-07 00:39:48'),
(16,1,'player','roni.vidad','','Vidad','Roni','Roni Vidad','2022-07-07 00:39:55'),
(17,1,'player','shiena.garcia','','Garcia','Shiena','Shiena Garcia','2022-07-07 00:40:03'),
(18,1,'player','trician.pascua','','Pascua','Trician James','Trician James Pascua','2022-07-07 00:40:19'),
(19,1,'player','karen.acido','','Acido','Karen','Karen Acido','2022-07-09 15:32:29'),
(20,1,'player','lea.acido','','Acido','Lea','Lea Acido','2022-07-09 15:32:39'),
(21,1,'manager','shyne','$2a$04$RdpoaMnOoJnXNjGPQ0V4guCNILk1OJXQ4iySEfp3cjdp9zIJDJnWK','Shyne','','Shyne','2022-07-11 12:03:09');
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

-- Dump completed on 2022-08-01  1:10:55
