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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT 0,
  `submitted_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_answers_question_player` (`question_id`,`player_id`),
  KEY `fk_answer_question` (`question_id`),
  KEY `fk_anwer_player` (`player_id`),
  KEY `fk_anwer_game` (`game_id`),
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anwer_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anwer_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES
(25,2,6,1,'A',0,'2022-07-09 15:07:37'),
(31,2,6,7,'A',0,'2022-07-09 15:10:19'),
(39,2,7,7,'B',0,'2022-07-09 15:17:31'),
(40,2,7,1,'A',0,'2022-07-09 15:18:29'),
(41,2,5,1,'A',0,'2022-07-09 15:20:05');
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
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_game` (`game_id`),
  KEY `fk_attendance_player` (`player_id`),
  CONSTRAINT `fk_attendance_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `value` text NOT NULL,
  `is_answer` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_choice_question` (`question_id`),
  CONSTRAINT `fk_choice_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES
(25,4,'True',1),
(26,4,'False',0),
(35,2,'An',1),
(36,2,'Wr',0),
(37,2,'Wr',0),
(38,2,'Wr',0),
(51,6,'Ramah',0),
(52,6,'An angel',1),
(53,6,'Wise man',0),
(54,6,'Magi',0),
(59,5,'Matthan',0),
(60,5,'Jacob',1),
(61,5,'Akim',0),
(62,5,'Josiah',0),
(67,8,'Nile River',0),
(68,8,'Jordan River',1),
(69,8,'Sea of Galilee',0),
(70,8,'Euphrates River',0),
(71,9,'20 days & 20 nights',0),
(72,9,'30 days & 30 nights',0),
(73,9,'120 days & 120 nights',0),
(74,9,'40 days & 40 nights',1),
(75,7,'Egypt',1),
(76,7,'Nazareth',0),
(77,7,'Bethlehem',0),
(78,7,'Judea',0),
(80,10,'Speck of sawdust',1),
(81,10,'Speck of water',0),
(82,10,'Tears',0),
(83,11,'Sand',0),
(84,11,'Plain',0),
(85,11,'Rock',1),
(86,11,'Mountain',0),
(87,12,'Capernaum',1),
(88,12,'Judea',0),
(89,12,'Galilee',0),
(90,12,'Gadarenes',0),
(91,13,'Dogs',0),
(92,13,'Pigs',1),
(93,13,'Monkeys',0),
(94,13,'Horses',0),
(95,14,'Peace',0),
(96,14,'Money',0),
(97,14,'Rest',1),
(98,14,'Home',0),
(99,15,'lion, lamb',0),
(100,15,'lamb, lion',0),
(101,15,'snakes, doves',1),
(102,15,'doves, snakes',0),
(103,16,'4',0),
(104,16,'7',1),
(105,16,'20',0),
(106,16,'40',0),
(107,17,'Blasphemer',1),
(108,17,'Teacher',0),
(109,17,'Healer',0),
(110,17,'Tax Collector',0),
(111,18,'Righteous',0),
(112,18,'Sick',0),
(113,18,'Sinners',1),
(114,18,'Tired',0),
(115,19,'Peter',0),
(116,19,'Matthew',1),
(117,19,'James',0),
(118,19,'Bartholomew',0),
(119,20,'True',0),
(120,20,'False',1),
(122,21,'False',1),
(123,22,'True',0),
(124,22,'False',1),
(126,23,'False',0),
(127,24,'True',0),
(128,24,'False',1),
(129,25,'True',0),
(130,25,'False',1),
(131,26,'True',1),
(132,26,'False',0),
(133,27,'True',0),
(134,27,'False',1),
(135,28,'True',0),
(136,28,'False',1),
(137,29,'True',1),
(138,29,'False',0),
(139,30,'Ferocious Wolves',1),
(140,31,'Blind, mute, deaf, leprosy, casted out demons',1),
(141,32,'Peter',1),
(142,33,'Disciples',1),
(143,34,'Gadarenes',1),
(144,35,'12 years',1),
(145,36,'Thaddeus and Philip',1),
(146,37,'Destroy both soul and body',1),
(147,38,'Israel',1),
(148,39,'Beelzebul',1);
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
(1,1,'Test','2022-06-30',2,'2022-06-29 16:17:24'),
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
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `pin` varchar(60) NOT NULL,
  `current_game_id` int(11) NOT NULL DEFAULT 0,
  `last_active_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES
(1,'shyne','$2a$04$RdpoaMnOoJnXNjGPQ0V4guCNILk1OJXQ4iySEfp3cjdp9zIJDJnWK',2,'2022-07-01 22:30:09');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `name` varchar(64) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES
(1,1,'angelo.sison','Michael Angelo','2022-07-01 16:40:50'),
(2,1,'amalia.acido','Amy','2022-07-07 00:34:43'),
(3,1,'april.acido','April','2022-07-07 00:35:31'),
(4,1,'cassandra.cebes','Cassandra','2022-07-07 00:35:56'),
(5,1,'christian.patricio','Christian','2022-07-07 00:36:19'),
(6,1,'elmer.manaytay','Elmer','2022-07-07 00:36:48'),
(7,1,'james.cuaresma','James','2022-07-07 00:37:29'),
(8,1,'jewel.razon','Rose Jewel','2022-07-07 00:37:43'),
(9,1,'johndave.cebes','John Dave','2022-07-07 00:38:22'),
(10,1,'marjorie.pascua','Majo','2022-07-07 00:38:36'),
(11,1,'meanne.acido','Meanne','2022-07-07 00:38:53'),
(12,1,'rogelio.razon','Rogelio','2022-07-07 00:39:08'),
(13,1,'ralph','Ralph','2022-07-07 00:39:23'),
(14,1,'ralph.villas','RV','2022-07-07 00:39:36'),
(15,1,'rovielyn.cuaresma','Rhovie','2022-07-07 00:39:48'),
(16,1,'roni','Roni','2022-07-07 00:39:55'),
(17,1,'shiena','Shiena','2022-07-07 00:40:03'),
(18,1,'tricianjames.pascua','TJ','2022-07-07 00:40:19'),
(19,1,'karen.acido','Karen','2022-07-09 15:32:29'),
(20,1,'leah.acido','Leah','2022-07-09 15:32:39');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
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
  `score` tinyint(4) unsigned NOT NULL DEFAULT 1,
  `question` text NOT NULL,
  `reference` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_question_game` (`game_id`),
  KEY `fk_question_level` (`level_id`),
  KEY `fk_question_type` (`type_id`),
  CONSTRAINT `fk_question_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_type` FOREIGN KEY (`type_id`) REFERENCES `quest_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES
(2,1,1,1,1,1,'Mei posse tantas cetero ex, ullum mucius omittantur sit cu. Id cum veri diceret, causae petentium periculis te quo. Est virtute maluisset at. At dicant verear pri. Ad eros laudem sententiae mel, ei harum indoctum his, vim clita evertitur consetetur in.','ref','2022-06-30 11:53:47'),
(4,1,1,2,2,2,'T or F','refff','2022-06-30 15:53:29'),
(5,1,2,1,1,3,'Who is the father of Joseph, the wife of Mary?','Matthew 1:16','2022-07-07 01:08:35'),
(6,1,2,1,1,3,'Who told Joseph in Egypt to go to the land of Israel because Herod already died?','Matthew 2:21','2022-07-08 23:14:57'),
(7,1,2,1,1,3,'Where did Joseph and Mary escape when Herod was trying to kill Jesus?','Matthew 2:13','2022-07-09 00:39:03'),
(8,1,2,1,1,3,'Where was Jesus baptized?','Matthew 3:16','2022-07-09 00:40:10'),
(9,1,2,1,1,3,'How many days did Jesus fast in the wilderness?','Matthew 4:1','2022-07-09 00:41:22'),
(10,1,3,1,1,3,'What shouldn’t we look at on our brothers’ eyes because we, ourselves, also have it?','Matt. 7','2022-07-09 14:45:02'),
(11,1,3,1,1,3,'Where did the wise man build his house on?','Matt. 7:24','2022-07-09 14:45:54'),
(12,1,3,1,1,3,'Where did the paralyze man who was suffering terribly lived?','Matt. 8:5-6','2022-07-09 14:46:45'),
(13,1,3,1,1,3,'On what animals where the demons casted out?','Matt. 8:30-33','2022-07-09 14:54:45'),
(14,1,3,1,1,3,'“Come to me all you who are weary and burdened, and I will give you ____”.','Matt. 11:28','2022-07-09 14:55:25'),
(15,1,3,1,1,3,'“I am sending you out like a sheep among wolves. Therefore, be as shrewd as ____ and as innocent as ____”. ','Matt. 10:16','2022-07-09 14:56:12'),
(16,1,3,1,1,3,'If an impure spirit comes out of a person, how many more wicked spirits does he take with him?','Matt. 12:43-45','2022-07-09 14:56:51'),
(17,1,3,1,1,3,'According to Matt. 9:3, what did the teachers of the law think about Jesus?','Matt 9:3','2022-07-09 14:58:07'),
(18,1,3,1,1,3,'According to Matthew 9:13, who did Jesus come to call?','Matt: 9:13','2022-07-09 14:59:16'),
(19,1,3,1,1,3,'He is a disciple who is a tax collector. ','Matt 9:10','2022-07-09 14:59:56'),
(20,1,3,2,2,5,'“Do not give pigs what is sacred; do not throw your pearls to dogs. If you do, they may trample them under their feet, and turn and tear you into pieces. “','Matt 7:6','2022-07-09 15:00:44'),
(21,1,3,2,2,5,'“Enter into the wide gate for it is broad and you will have many choices in it.”','Matt. 7:13-14','2022-07-09 15:01:30'),
(22,1,3,2,2,5,'“Everyone who calls to me, ‘Lord, Lord’ will enter the kingdom of heaven”','Matt 7:21','2022-07-09 15:02:47'),
(23,1,3,2,2,5,'Jesus told them, “Follow me and let the dead bur their own dead.”','Matt. 8:22','2022-07-09 15:03:21'),
(24,1,3,2,2,5,'Doctors heal those who are well and sick, and Jesus came to call everyone, the righteous and sinners.','Matt. 9:12','2022-07-09 15:03:58'),
(25,1,3,2,2,5,'Jesus said, “Go away, the girl is already dead and we can do nothing to help her”.','Matt. 9:24','2022-07-09 15:04:28'),
(26,1,3,2,2,5,'Jesus went through all the towns and villages, teaching in their synagogues, proclaiming good news and healing every disease and sickness.','Matt. 9:35','2022-07-09 15:05:00'),
(27,1,3,2,2,5,'Jesus instructed His disciples that it is fine to take silver or gold from people they healed and who wants to give any to them.','Matt. 10:9','2022-07-09 15:05:33'),
(28,1,3,2,2,5,'Students can sometimes teach their teachers especially if they are really knowledgeable about what they say.','Matt. 10:24','2022-07-09 15:06:06'),
(29,1,3,2,2,5,'“No one knows the Son except the Father, and no one knows the Father except the Son and those to whom the Son chooses to reveal Him.”','Matt. 11:27','2022-07-09 15:06:57'),
(30,1,3,3,3,10,'Jesus warns us about false prophets for they come to us in sheep’s clothing but inwardly, they are what?','Matt. 7:15','2022-07-09 15:08:19'),
(31,1,3,3,3,10,'Name atleast 2 sickness that Jesus healed.','Matt.7-12','2022-07-09 15:09:05'),
(32,1,3,3,3,10,'Whose disciple’s mother-in-law lays in bed with fever?','Matt 8:14','2022-07-09 15:10:00'),
(33,1,3,3,3,10,'To whom did Jesus said these words, “You of little faith, why are you so afraid?”','Matt. 8:26','2022-07-09 15:10:32'),
(34,1,3,3,3,10,'Where were the two demon possessed men from?','Matt. 8:28','2022-07-09 15:11:13'),
(35,1,3,3,3,10,'There was a woman who came up behind Jesus, and touched his cloak. She had been bleeding for how many years?','Matt. 9:20','2022-07-09 15:12:14'),
(36,1,3,3,3,10,'Who are the missing disciples? \nPeter, Andrew, James, Thomas, James, Matthew, John, Simon, Judas, Bartholomew.','Matt. 7-12','2022-07-09 15:13:02'),
(37,1,3,3,3,10,'Do not be afraid of those who kill the body but cannot kill the soul. Rather, be afraid of the one who _____?','Matt. 10:26','2022-07-09 15:14:02'),
(38,1,3,3,3,10,'Jesus sent out the disciples to go among the Gentiles or enter any town in Samaritans, but go to the lost sheep of _____.','Matt. 10:5-7','2022-07-09 15:14:36'),
(39,1,3,3,3,10,'He is the prince of demon who can only drive out demons.','Matt. 12:24','2022-07-09 15:15:28');
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

-- Dump completed on 2022-07-11 11:45:53
