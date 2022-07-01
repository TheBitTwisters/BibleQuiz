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
  `player_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT 0,
  `submitted_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_answer_question` (`question_id`),
  KEY `fk_anwer_player` (`player_id`),
  KEY `fk_anwer_game` (`game_id`),
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anwer_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anwer_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.answers: ~0 rows (approximately)
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
REPLACE INTO `answers` (`id`, `game_id`, `question_id`, `player_id`, `answer`, `score`, `submitted_at`) VALUES
	(1, 1, 4, 1, 'T', 1, '2022-07-01 17:12:10'),
	(2, 1, 2, 1, 'A', 2, '2022-07-01 17:17:20');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table biblequiz.attendances
CREATE TABLE IF NOT EXISTS `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_game` (`game_id`),
  KEY `fk_attendance_player` (`player_id`),
  CONSTRAINT `fk_attendance_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.attendances: ~0 rows (approximately)
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;

-- Dumping structure for table biblequiz.choices
CREATE TABLE IF NOT EXISTS `choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `is_answer` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_choice_question` (`question_id`),
  CONSTRAINT `fk_choice_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.choices: ~6 rows (approximately)
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
REPLACE INTO `choices` (`id`, `question_id`, `value`, `is_answer`) VALUES
	(21, 2, 'AA', 0),
	(22, 2, 'D', 0),
	(23, 2, 'A', 1),
	(24, 2, 'C', 0),
	(25, 4, 'True', 1),
	(26, 4, 'False', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.games: ~0 rows (approximately)
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
REPLACE INTO `games` (`id`, `active`, `title`, `date`, `current_question_id`, `created_at`) VALUES
	(1, 1, 'Test', '2022-06-30', 0, '2022-06-29 16:17:24');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;

-- Dumping structure for table biblequiz.levels
CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.levels: ~2 rows (approximately)
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
REPLACE INTO `levels` (`id`, `name`, `score`) VALUES
	(1, 'Easy', 1),
	(2, 'Average', 2),
	(3, 'Hard', 3);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;

-- Dumping structure for table biblequiz.managers
CREATE TABLE IF NOT EXISTS `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `pin` varchar(60) NOT NULL,
  `current_game_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.managers: ~1 rows (approximately)
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
REPLACE INTO `managers` (`id`, `name`, `pin`, `current_game_id`) VALUES
	(1, 'shyne', '$2a$04$RdpoaMnOoJnXNjGPQ0V4guCNILk1OJXQ4iySEfp3cjdp9zIJDJnWK', 0);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;

-- Dumping structure for table biblequiz.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `name` varchar(64) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.players: ~0 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
REPLACE INTO `players` (`id`, `active`, `name`, `fullname`, `joined_at`) VALUES
	(1, 1, 'michael01angelo', 'Michael Angelo', '2022-07-01 16:40:50');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table biblequiz.questions
CREATE TABLE IF NOT EXISTS `questions` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.questions: ~2 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
REPLACE INTO `questions` (`id`, `active`, `game_id`, `level_id`, `type_id`, `score`, `question`, `reference`, `created_at`) VALUES
	(2, 1, 1, 1, 1, 1, 'TEST', 'ref', '2022-06-30 11:53:47'),
	(4, 1, 1, 2, 2, 2, 'T or F', 'refff', '2022-06-30 15:53:29');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table biblequiz.quest_types
CREATE TABLE IF NOT EXISTS `quest_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `choices_count` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table biblequiz.quest_types: ~2 rows (approximately)
/*!40000 ALTER TABLE `quest_types` DISABLE KEYS */;
REPLACE INTO `quest_types` (`id`, `name`, `choices_count`) VALUES
	(1, 'Multiple Choice', 4),
	(2, 'True or False', 2),
	(3, 'Identification', 1);
/*!40000 ALTER TABLE `quest_types` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
