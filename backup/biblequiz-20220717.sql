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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.answers: ~6 rows (approximately)
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table biblequiz.attendances
CREATE TABLE IF NOT EXISTS `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_attendance_game_user` (`game_id`,`user_id`),
  KEY `fk_attendance_game` (`game_id`),
  KEY `fk_attendance_user` (`user_id`) USING BTREE,
  CONSTRAINT `fk_attendance_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.attendances: ~18 rows (approximately)
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
REPLACE INTO `attendances` (`id`, `game_id`, `user_id`) VALUES
	(2, 2, 1),
	(1, 2, 2),
	(3, 2, 3),
	(4, 2, 4),
	(5, 2, 5),
	(6, 2, 6),
	(7, 2, 7),
	(8, 2, 8),
	(9, 2, 9),
	(10, 2, 10),
	(11, 2, 11),
	(14, 2, 12),
	(12, 2, 13),
	(13, 2, 14),
	(16, 2, 15),
	(15, 2, 16),
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
	(1, 1, 'TEST', '2022-07-01', 2, '2022-06-29 16:17:24'),
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
	(1, 1, 'player', 'angelo.sison', '', 'Angelo Sison', '2022-07-01 16:40:50'),
	(2, 1, 'player', 'amalia.acido', '', 'Amy', '2022-07-07 00:34:43'),
	(3, 1, 'player', 'april.acido', '', 'April', '2022-07-07 00:35:31'),
	(4, 1, 'player', 'cassandra.sebes', '', 'Cassandra', '2022-07-07 00:35:56'),
	(5, 1, 'player', 'christian.patricio', '', 'Christian', '2022-07-07 00:36:19'),
	(6, 1, 'player', 'elmer.manaytay', '', 'Elmer', '2022-07-07 00:36:48'),
	(7, 1, 'player', 'james.cuaresma', '', 'James', '2022-07-07 00:37:29'),
	(8, 1, 'player', 'jewel.razon', '', 'Rose Jewel', '2022-07-07 00:37:43'),
	(9, 1, 'player', 'johndave.sebes', '', 'John Dave', '2022-07-07 00:38:22'),
	(10, 1, 'player', 'marjorie.pascua', '', 'Majo', '2022-07-07 00:38:36'),
	(11, 1, 'player', 'meanne.acido', '', 'Meanne', '2022-07-07 00:38:53'),
	(12, 1, 'player', 'rogelio.razon', '', 'Rogelio', '2022-07-07 00:39:08'),
	(13, 1, 'player', 'ralph.vidad', '', 'Ralph', '2022-07-07 00:39:23'),
	(14, 1, 'player', 'ralph.villas', '', 'Ralph Villas', '2022-07-07 00:39:36'),
	(15, 1, 'player', 'rovielyn.cuaresma', '', 'Rhovie', '2022-07-07 00:39:48'),
	(16, 1, 'player', 'roni.vidad', '', 'Roni', '2022-07-07 00:39:55'),
	(17, 1, 'player', 'shiena.garcia', '', 'Shiena', '2022-07-07 00:40:03'),
	(18, 1, 'player', 'trician.pascua', '', 'TJ', '2022-07-07 00:40:19'),
	(19, 1, 'player', 'karen.acido', '', 'Karen', '2022-07-09 15:32:29'),
	(20, 1, 'player', 'leah.acido', '', 'Leah', '2022-07-09 15:32:39'),
	(21, 1, 'manager', 'shyne', '$2a$04$RdpoaMnOoJnXNjGPQ0V4guCNILk1OJXQ4iySEfp3cjdp9zIJDJnWK', 'Shyne', '2022-07-11 12:03:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
