-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.8.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for biblequiz
CREATE DATABASE IF NOT EXISTS `biblequiz` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `biblequiz`;

-- Dumping structure for table biblequiz.answers
CREATE TABLE IF NOT EXISTS `answers` (
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

-- Dumping data for table biblequiz.answers: ~5 rows (approximately)
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
REPLACE INTO `answers` (`id`, `game_id`, `question_id`, `user_id`, `answer`, `score`, `submitted_at`) VALUES
	(25, 2, 6, 1, 'A', 0, '2022-07-09 15:07:37'),
	(31, 2, 6, 7, 'A', 0, '2022-07-09 15:10:19'),
	(39, 2, 7, 7, 'B', 0, '2022-07-09 15:17:31'),
	(40, 2, 7, 1, 'A', 0, '2022-07-09 15:18:29'),
	(41, 2, 5, 1, 'A', 0, '2022-07-09 15:20:05');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table biblequiz.attendances
CREATE TABLE IF NOT EXISTS `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_game` (`game_id`),
  KEY `fk_attendance_user` (`user_id`) USING BTREE,
  CONSTRAINT `fk_attendance_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.attendances: ~18 rows (approximately)
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
REPLACE INTO `attendances` (`id`, `game_id`, `user_id`) VALUES
	(1, 2, 2),
	(2, 2, 1),
	(3, 2, 3),
	(4, 2, 4),
	(5, 2, 5),
	(6, 2, 6),
	(7, 2, 7),
	(8, 2, 8),
	(9, 2, 9),
	(10, 2, 10),
	(11, 2, 11),
	(12, 2, 13),
	(13, 2, 14),
	(14, 2, 12),
	(15, 2, 16),
	(16, 2, 15),
	(17, 2, 17),
	(18, 2, 18);
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;

-- Dumping structure for table biblequiz.choices
CREATE TABLE IF NOT EXISTS `choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `label` varchar(8) NOT NULL,
  `value` text NOT NULL,
  `is_answer` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_choice_question` (`question_id`),
  CONSTRAINT `fk_choice_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.choices: ~93 rows (approximately)
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
REPLACE INTO `choices` (`id`, `question_id`, `label`, `value`, `is_answer`) VALUES
	(25, 4, '', 'True', 1),
	(26, 4, '', 'False', 0),
	(35, 2, '', 'An', 1),
	(36, 2, '', 'Wr', 0),
	(37, 2, '', 'Wr', 0),
	(38, 2, '', 'Wr', 0),
	(51, 6, '', 'Ramah', 0),
	(52, 6, '', 'An angel', 1),
	(53, 6, '', 'Wise man', 0),
	(54, 6, '', 'Magi', 0),
	(59, 5, '', 'Matthan', 0),
	(60, 5, '', 'Jacob', 1),
	(61, 5, '', 'Akim', 0),
	(62, 5, '', 'Josiah', 0),
	(67, 8, '', 'Nile River', 0),
	(68, 8, '', 'Jordan River', 1),
	(69, 8, '', 'Sea of Galilee', 0),
	(70, 8, '', 'Euphrates River', 0),
	(71, 9, '', '20 days & 20 nights', 0),
	(72, 9, '', '30 days & 30 nights', 0),
	(73, 9, '', '120 days & 120 nights', 0),
	(74, 9, '', '40 days & 40 nights', 1),
	(75, 7, '', 'Egypt', 1),
	(76, 7, '', 'Nazareth', 0),
	(77, 7, '', 'Bethlehem', 0),
	(78, 7, '', 'Judea', 0),
	(80, 10, '', 'Speck of sawdust', 1),
	(81, 10, '', 'Speck of water', 0),
	(82, 10, '', 'Tears', 0),
	(83, 11, '', 'Sand', 0),
	(84, 11, '', 'Plain', 0),
	(85, 11, '', 'Rock', 1),
	(86, 11, '', 'Mountain', 0),
	(87, 12, '', 'Capernaum', 1),
	(88, 12, '', 'Judea', 0),
	(89, 12, '', 'Galilee', 0),
	(90, 12, '', 'Gadarenes', 0),
	(91, 13, '', 'Dogs', 0),
	(92, 13, '', 'Pigs', 1),
	(93, 13, '', 'Monkeys', 0),
	(94, 13, '', 'Horses', 0),
	(95, 14, '', 'Peace', 0),
	(96, 14, '', 'Money', 0),
	(97, 14, '', 'Rest', 1),
	(98, 14, '', 'Home', 0),
	(99, 15, '', 'lion, lamb', 0),
	(100, 15, '', 'lamb, lion', 0),
	(101, 15, '', 'snakes, doves', 1),
	(102, 15, '', 'doves, snakes', 0),
	(103, 16, '', '4', 0),
	(104, 16, '', '7', 1),
	(105, 16, '', '20', 0),
	(106, 16, '', '40', 0),
	(107, 17, '', 'Blasphemer', 1),
	(108, 17, '', 'Teacher', 0),
	(109, 17, '', 'Healer', 0),
	(110, 17, '', 'Tax Collector', 0),
	(111, 18, '', 'Righteous', 0),
	(112, 18, '', 'Sick', 0),
	(113, 18, '', 'Sinners', 1),
	(114, 18, '', 'Tired', 0),
	(115, 19, '', 'Peter', 0),
	(116, 19, '', 'Matthew', 1),
	(117, 19, '', 'James', 0),
	(118, 19, '', 'Bartholomew', 0),
	(119, 20, '', 'True', 0),
	(120, 20, '', 'False', 1),
	(122, 21, '', 'False', 1),
	(123, 22, '', 'True', 0),
	(124, 22, '', 'False', 1),
	(126, 23, '', 'False', 0),
	(127, 24, '', 'True', 0),
	(128, 24, '', 'False', 1),
	(129, 25, '', 'True', 0),
	(130, 25, '', 'False', 1),
	(131, 26, '', 'True', 1),
	(132, 26, '', 'False', 0),
	(133, 27, '', 'True', 0),
	(134, 27, '', 'False', 1),
	(135, 28, '', 'True', 0),
	(136, 28, '', 'False', 1),
	(137, 29, '', 'True', 1),
	(138, 29, '', 'False', 0),
	(139, 30, '', 'Ferocious Wolves', 1),
	(140, 31, '', 'Blind, mute, deaf, leprosy, casted out demons', 1),
	(141, 32, '', 'Peter', 1),
	(142, 33, '', 'Disciples', 1),
	(143, 34, '', 'Gadarenes', 1),
	(144, 35, '', '12 years', 1),
	(145, 36, '', 'Thaddeus and Philip', 1),
	(146, 37, '', 'Destroy both soul and body', 1),
	(147, 38, '', 'Israel', 1),
	(148, 39, '', 'Beelzebul', 1);
/*!40000 ALTER TABLE `choices` ENABLE KEYS */;

-- Dumping structure for table biblequiz.games
CREATE TABLE IF NOT EXISTS `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `title` varchar(64) NOT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  `current_question_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.games: ~3 rows (approximately)
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
REPLACE INTO `games` (`id`, `active`, `title`, `date`, `current_question_id`, `created_at`) VALUES
	(1, 1, 'Test', '2022-06-30', 2, '2022-06-29 16:17:24'),
	(2, 1, 'Matthew 1 to 6', '2022-07-02', 5, '2022-07-06 22:58:52'),
	(3, 1, 'Matthew 7 to 12', '2022-07-09', 0, '2022-07-08 08:29:51');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;

-- Dumping structure for table biblequiz.levels
CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.levels: ~3 rows (approximately)
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
REPLACE INTO `levels` (`id`, `name`, `score`) VALUES
	(1, 'Easy', 3),
	(2, 'Average', 5),
	(3, 'Hard', 10);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;

-- Dumping structure for table biblequiz.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `game_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `order` tinyint(3) unsigned NOT NULL,
  `question` text NOT NULL,
  `reference` varchar(255) NOT NULL,
  `layout` varchar(16) NOT NULL DEFAULT '2x2',
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.questions: ~37 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
REPLACE INTO `questions` (`id`, `active`, `game_id`, `level_id`, `type_id`, `order`, `question`, `reference`, `layout`, `score`, `created_at`) VALUES
	(2, 1, 1, 1, 1, 0, 'Mei posse tantas cetero ex, ullum mucius omittantur sit cu. Id cum veri diceret, causae petentium periculis te quo. Est virtute maluisset at. At dicant verear pri. Ad eros laudem sententiae mel, ei harum indoctum his, vim clita evertitur consetetur in.', 'ref', '2x2', 1, '2022-06-30 11:53:47'),
	(4, 1, 1, 2, 2, 0, 'T or F', 'refff', '2x2', 2, '2022-06-30 15:53:29'),
	(5, 1, 2, 1, 1, 0, 'Who is the father of Joseph, the wife of Mary?', 'Matthew 1:16', '2x2', 3, '2022-07-07 01:08:35'),
	(6, 1, 2, 1, 1, 0, 'Who told Joseph in Egypt to go to the land of Israel because Herod already died?', 'Matthew 2:21', '2x2', 3, '2022-07-08 23:14:57'),
	(7, 1, 2, 1, 1, 0, 'Where did Joseph and Mary escape when Herod was trying to kill Jesus?', 'Matthew 2:13', '2x2', 3, '2022-07-09 00:39:03'),
	(8, 1, 2, 1, 1, 0, 'Where was Jesus baptized?', 'Matthew 3:16', '2x2', 3, '2022-07-09 00:40:10'),
	(9, 1, 2, 1, 1, 0, 'How many days did Jesus fast in the wilderness?', 'Matthew 4:1', '2x2', 3, '2022-07-09 00:41:22'),
	(10, 1, 3, 1, 1, 0, 'What shouldn’t we look at on our brothers’ eyes because we, ourselves, also have it?', 'Matt. 7', '2x2', 3, '2022-07-09 14:45:02'),
	(11, 1, 3, 1, 1, 0, 'Where did the wise man build his house on?', 'Matt. 7:24', '2x2', 3, '2022-07-09 14:45:54'),
	(12, 1, 3, 1, 1, 0, 'Where did the paralyze man who was suffering terribly lived?', 'Matt. 8:5-6', '2x2', 3, '2022-07-09 14:46:45'),
	(13, 1, 3, 1, 1, 0, 'On what animals where the demons casted out?', 'Matt. 8:30-33', '2x2', 3, '2022-07-09 14:54:45'),
	(14, 1, 3, 1, 1, 0, '“Come to me all you who are weary and burdened, and I will give you ____”.', 'Matt. 11:28', '2x2', 3, '2022-07-09 14:55:25'),
	(15, 1, 3, 1, 1, 0, '“I am sending you out like a sheep among wolves. Therefore, be as shrewd as ____ and as innocent as ____”. ', 'Matt. 10:16', '2x2', 3, '2022-07-09 14:56:12'),
	(16, 1, 3, 1, 1, 0, 'If an impure spirit comes out of a person, how many more wicked spirits does he take with him?', 'Matt. 12:43-45', '2x2', 3, '2022-07-09 14:56:51'),
	(17, 1, 3, 1, 1, 0, 'According to Matt. 9:3, what did the teachers of the law think about Jesus?', 'Matt 9:3', '2x2', 3, '2022-07-09 14:58:07'),
	(18, 1, 3, 1, 1, 0, 'According to Matthew 9:13, who did Jesus come to call?', 'Matt: 9:13', '2x2', 3, '2022-07-09 14:59:16'),
	(19, 1, 3, 1, 1, 0, 'He is a disciple who is a tax collector. ', 'Matt 9:10', '2x2', 3, '2022-07-09 14:59:56'),
	(20, 1, 3, 2, 2, 0, '“Do not give pigs what is sacred; do not throw your pearls to dogs. If you do, they may trample them under their feet, and turn and tear you into pieces. “', 'Matt 7:6', '1x2', 5, '2022-07-09 15:00:44'),
	(21, 1, 3, 2, 2, 0, '“Enter into the wide gate for it is broad and you will have many choices in it.”', 'Matt. 7:13-14', '1x2', 5, '2022-07-09 15:01:30'),
	(22, 1, 3, 2, 2, 0, '“Everyone who calls to me, ‘Lord, Lord’ will enter the kingdom of heaven”', 'Matt 7:21', '1x2', 5, '2022-07-09 15:02:47'),
	(23, 1, 3, 2, 2, 0, 'Jesus told them, “Follow me and let the dead bur their own dead.”', 'Matt. 8:22', '1x2', 5, '2022-07-09 15:03:21'),
	(24, 1, 3, 2, 2, 0, 'Doctors heal those who are well and sick, and Jesus came to call everyone, the righteous and sinners.', 'Matt. 9:12', '1x2', 5, '2022-07-09 15:03:58'),
	(25, 1, 3, 2, 2, 0, 'Jesus said, “Go away, the girl is already dead and we can do nothing to help her”.', 'Matt. 9:24', '1x2', 5, '2022-07-09 15:04:28'),
	(26, 1, 3, 2, 2, 0, 'Jesus went through all the towns and villages, teaching in their synagogues, proclaiming good news and healing every disease and sickness.', 'Matt. 9:35', '1x2', 5, '2022-07-09 15:05:00'),
	(27, 1, 3, 2, 2, 0, 'Jesus instructed His disciples that it is fine to take silver or gold from people they healed and who wants to give any to them.', 'Matt. 10:9', '1x2', 5, '2022-07-09 15:05:33'),
	(28, 1, 3, 2, 2, 0, 'Students can sometimes teach their teachers especially if they are really knowledgeable about what they say.', 'Matt. 10:24', '1x2', 5, '2022-07-09 15:06:06'),
	(29, 1, 3, 2, 2, 0, '“No one knows the Son except the Father, and no one knows the Father except the Son and those to whom the Son chooses to reveal Him.”', 'Matt. 11:27', '1x2', 5, '2022-07-09 15:06:57'),
	(30, 1, 3, 3, 3, 0, 'Jesus warns us about false prophets for they come to us in sheep’s clothing but inwardly, they are what?', 'Matt. 7:15', '1x1', 10, '2022-07-09 15:08:19'),
	(31, 1, 3, 3, 3, 0, 'Name atleast 2 sickness that Jesus healed.', 'Matt.7-12', '1x1', 10, '2022-07-09 15:09:05'),
	(32, 1, 3, 3, 3, 0, 'Whose disciple’s mother-in-law lays in bed with fever?', 'Matt 8:14', '1x1', 10, '2022-07-09 15:10:00'),
	(33, 1, 3, 3, 3, 0, 'To whom did Jesus said these words, “You of little faith, why are you so afraid?”', 'Matt. 8:26', '1x1', 10, '2022-07-09 15:10:32'),
	(34, 1, 3, 3, 3, 0, 'Where were the two demon possessed men from?', 'Matt. 8:28', '1x1', 10, '2022-07-09 15:11:13'),
	(35, 1, 3, 3, 3, 0, 'There was a woman who came up behind Jesus, and touched his cloak. She had been bleeding for how many years?', 'Matt. 9:20', '1x1', 10, '2022-07-09 15:12:14'),
	(36, 1, 3, 3, 3, 0, 'Who are the missing disciples? \nPeter, Andrew, James, Thomas, James, Matthew, John, Simon, Judas, Bartholomew.', 'Matt. 7-12', '1x1', 10, '2022-07-09 15:13:02'),
	(37, 1, 3, 3, 3, 0, 'Do not be afraid of those who kill the body but cannot kill the soul. Rather, be afraid of the one who _____?', 'Matt. 10:26', '1x1', 10, '2022-07-09 15:14:02'),
	(38, 1, 3, 3, 3, 0, 'Jesus sent out the disciples to go among the Gentiles or enter any town in Samaritans, but go to the lost sheep of _____.', 'Matt. 10:5-7', '1x1', 10, '2022-07-09 15:14:36'),
	(39, 1, 3, 3, 3, 0, 'He is the prince of demon who can only drive out demons.', 'Matt. 12:24', '1x1', 10, '2022-07-09 15:15:28');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table biblequiz.quest_types
CREATE TABLE IF NOT EXISTS `quest_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `choices_count` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.quest_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `quest_types` DISABLE KEYS */;
REPLACE INTO `quest_types` (`id`, `name`, `choices_count`) VALUES
	(1, 'Multiple Choice', 4),
	(2, 'True or False', 2),
	(3, 'Identification', 1);
/*!40000 ALTER TABLE `quest_types` ENABLE KEYS */;

-- Dumping structure for table biblequiz.users
CREATE TABLE IF NOT EXISTS `users` (
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

-- Dumping data for table biblequiz.users: ~20 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `active`, `type`, `name`, `pin`, `fullname`, `joined_at`) VALUES
	(1, 1, 'player', 'angelo.sison', '', 'Angelo', '2022-07-01 16:40:50'),
	(2, 1, 'player', 'amalia.acido', '', 'Amy', '2022-07-07 00:34:43'),
	(3, 1, 'player', 'april.acido', '', 'April', '2022-07-07 00:35:31'),
	(4, 1, 'player', 'cassandra.cebes', '', 'Cassandra', '2022-07-07 00:35:56'),
	(5, 1, 'player', 'christian.patricio', '', 'Christian', '2022-07-07 00:36:19'),
	(6, 1, 'player', 'elmer.manaytay', '', 'Elmer', '2022-07-07 00:36:48'),
	(7, 1, 'player', 'james.cuaresma', '', 'James', '2022-07-07 00:37:29'),
	(8, 1, 'player', 'jewel.razon', '', 'Rose Jewel', '2022-07-07 00:37:43'),
	(9, 1, 'player', 'johndave.cebes', '', 'John Dave', '2022-07-07 00:38:22'),
	(10, 1, 'player', 'marjorie.pascua', '', 'Majo', '2022-07-07 00:38:36'),
	(11, 1, 'player', 'meanne.acido', '', 'Meanne', '2022-07-07 00:38:53'),
	(12, 1, 'player', 'rogelio.razon', '', 'Rogelio', '2022-07-07 00:39:08'),
	(13, 1, 'player', 'ralph', '', 'Ralph', '2022-07-07 00:39:23'),
	(14, 1, 'player', 'ralph.villas', '', 'RV', '2022-07-07 00:39:36'),
	(15, 1, 'player', 'rovielyn.cuaresma', '', 'Rhovie', '2022-07-07 00:39:48'),
	(16, 1, 'player', 'roni', '', 'Roni', '2022-07-07 00:39:55'),
	(17, 1, 'player', 'shiena', '', 'Shiena', '2022-07-07 00:40:03'),
	(18, 1, 'player', 'tricianjames.pascua', '', 'TJ', '2022-07-07 00:40:19'),
	(19, 1, 'player', 'karen.acido', '', 'Karen', '2022-07-09 15:32:29'),
	(20, 1, 'player', 'leah.acido', '', 'Leah', '2022-07-09 15:32:39'),
	(21, 1, 'manager', 'shyne', '$2a$04$RdpoaMnOoJnXNjGPQ0V4guCNILk1OJXQ4iySEfp3cjdp9zIJDJnWK', 'Shyne', '2022-07-11 12:03:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
