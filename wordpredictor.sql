-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 18, 2019 at 10:17 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordp`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `loginproc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginproc` (IN `uid1` VARCHAR(20))  READS SQL DATA
SELECT PASSWORD FROM login WHERE uid=uid1$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jw`
--

DROP TABLE IF EXISTS `jw`;
CREATE TABLE IF NOT EXISTS `jw` (
  `J_WORDS` varchar(25) NOT NULL,
  `J_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`J_WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jw`
--

INSERT INTO `jw` (`J_WORDS`, `J_CNT`) VALUES
('import', 20),
('java.util.*;', 5),
('java.io.*;', 11),
('System.out.print', 1),
('System.out.println', 1),
('public', 12),
('static', 12),
('void', 14),
('main()', 1),
('main(String args[])', 1),
('private', 1),
('protected', 1),
('int', 1),
('char', 1),
('float', 1),
('double', 1),
('String', 1),
('unsigned int', 1),
('finally', 1),
('{', 8),
('}', 6),
('args[])', 8),
('try', 1),
('catch()', 1),
('catch(Exception e)', 1),
('byte', 1),
('boolean', 1),
('switch()', 1),
('case', 1),
('true', 1),
('false', 1),
('while', 1),
('if', 2),
('else', 1),
('if else', 1),
('for', 2),
('do', 1),
('(', 1),
(')', 1),
(';', 1),
('main(String', 1),
('class', 1),
('interface', 1),
('extends', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jwp`
--

DROP TABLE IF EXISTS `jwp`;
CREATE TABLE IF NOT EXISTS `jwp` (
  `J_PREV` varchar(25) NOT NULL,
  `J_CURR` varchar(25) NOT NULL,
  `JN_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`J_PREV`,`J_CURR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jwp`
--

INSERT INTO `jwp` (`J_PREV`, `J_CURR`, `JN_CNT`) VALUES
('import', 'java.util.*;', 1),
('import', 'java.io.*;', 1),
('public', 'static', 1),
('static', 'void', 1),
('void', 'main()', 1),
('void', 'main(String args[])', 1),
('main()', '{', 1),
('main(String args[])', '{', 1),
('{', '}', 1),
('finally', '{', 1),
('try', '{', 1),
('catch()', '{', 1),
('catch(Exception e)', '{', 1),
('switch()', '{', 1),
('(', ')', 1),
(')', ';', 1),
('main(String', 'args[])', 1),
('args[])', '{', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `uid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uid`, `password`) VALUES
('devadat', 'patil'),
('faculty', 'xyz'),
('durgesh1', 'nandan'),
('manish', 'holdur'),
('adi', 'limbekar'),
('a', 'a'),
('MR_X', 'xyz'),
('aditya', 'limbekar'),
('mainikant', 'jadhav');

--
-- Triggers `login`
--
DROP TRIGGER IF EXISTS `trigger_bkup`;
DELIMITER $$
CREATE TRIGGER `trigger_bkup` AFTER INSERT ON `login` FOR EACH ROW INSERT INTO login_backup VALUES (new.uid,new.password)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login_backup`
--

DROP TABLE IF EXISTS `login_backup`;
CREATE TABLE IF NOT EXISTS `login_backup` (
  `uid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_backup`
--

INSERT INTO `login_backup` (`uid`, `password`) VALUES
('durgesh1', 'nandan'),
('manish', 'holdur'),
('adi', 'limbekar'),
('a', 'a'),
('MR_X', 'xyz'),
('aditya', 'limbekar'),
('mainikant', 'jadhav'),
('faculty', 'xyz'),
('devadat', 'patil');

-- --------------------------------------------------------

--
-- Table structure for table `new_wordsa`
--

DROP TABLE IF EXISTS `new_wordsa`;
CREATE TABLE IF NOT EXISTS `new_wordsa` (
  `WORDS` varchar(25) NOT NULL,
  `CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_wordsa`
--

INSERT INTO `new_wordsa` (`WORDS`, `CNT`) VALUES
('hello', 2),
('friends', 2),
('kaise', 3),
('ho', 2);

-- --------------------------------------------------------

--
-- Table structure for table `new_wordsadi`
--

DROP TABLE IF EXISTS `new_wordsadi`;
CREATE TABLE IF NOT EXISTS `new_wordsadi` (
  `WORDS` varchar(25) NOT NULL,
  `CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_wordsadi`
--

INSERT INTO `new_wordsadi` (`WORDS`, `CNT`) VALUES
('a', 7),
('databasew', 1),
('database', 2),
('is', 4),
('collection', 2),
('of', 5),
('related', 3),
('data', 4),
('organised', 2),
('in', 2),
('way', 1),
('that', 1),
('can', 3),
('be', 4),
('easily', 1),
('accesssed', 1),
('managwe', 1),
('and', 2),
('updated', 2),
('any', 1),
('piece', 2),
('od', 1),
('information', 2),
('example', 1),
('name', 1),
('your', 1),
('school', 1),
('databse', 1),
('actually', 1),
('place', 1),
('where', 1),
('picw', 1),
('stored', 1),
('various', 1),
('operations', 1),
('performed', 1),
('on', 1),
('it', 1),
('hello', 3),
('how', 4),
('are', 3),
('you', 3),
('harshvardhan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `new_wordsaditya`
--

DROP TABLE IF EXISTS `new_wordsaditya`;
CREATE TABLE IF NOT EXISTS `new_wordsaditya` (
  `WORDS` varchar(25) NOT NULL,
  `CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_wordsaditya`
--

INSERT INTO `new_wordsaditya` (`WORDS`, `CNT`) VALUES
('word', 3),
('predictor', 1),
('is', 1),
('an', 1),
('application', 1),
('which', 1),
('will', 1),
('predict', 1),
('the', 1),
('next', 1),
('you', 1),
('may', 1),
('type', 1);

-- --------------------------------------------------------

--
-- Table structure for table `new_wordsdevadat`
--

DROP TABLE IF EXISTS `new_wordsdevadat`;
CREATE TABLE IF NOT EXISTS `new_wordsdevadat` (
  `WORDS` varchar(25) NOT NULL,
  `CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_wordsdevadat`
--

INSERT INTO `new_wordsdevadat` (`WORDS`, `CNT`) VALUES
('hello', 2),
('friends', 3),
('chai', 2),
('pilo', 2),
('i', 1),
('can', 1),
('ichi', 1),
('how', 1);

-- --------------------------------------------------------

--
-- Table structure for table `new_wordsfaculty`
--

DROP TABLE IF EXISTS `new_wordsfaculty`;
CREATE TABLE IF NOT EXISTS `new_wordsfaculty` (
  `WORDS` varchar(25) NOT NULL,
  `CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `new_wordsmainikant`
--

DROP TABLE IF EXISTS `new_wordsmainikant`;
CREATE TABLE IF NOT EXISTS `new_wordsmainikant` (
  `WORDS` varchar(25) NOT NULL,
  `CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_wordsmainikant`
--

INSERT INTO `new_wordsmainikant` (`WORDS`, `CNT`) VALUES
('hello', 2),
('friends', 2),
('chai', 2),
('pilo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `new_wordsmr_x`
--

DROP TABLE IF EXISTS `new_wordsmr_x`;
CREATE TABLE IF NOT EXISTS `new_wordsmr_x` (
  `WORDS` varchar(25) NOT NULL,
  `CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`WORDS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `predictiona`
--

DROP TABLE IF EXISTS `predictiona`;
CREATE TABLE IF NOT EXISTS `predictiona` (
  `PREV_WORD` varchar(25) NOT NULL,
  `CURR_WORD` varchar(25) NOT NULL,
  `N_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PREV_WORD`,`CURR_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predictiona`
--

INSERT INTO `predictiona` (`PREV_WORD`, `CURR_WORD`, `N_CNT`) VALUES
('hello', 'friends', 2),
('friends', 'kaise', 2),
('kaise', 'ho', 2);

-- --------------------------------------------------------

--
-- Table structure for table `predictionadi`
--

DROP TABLE IF EXISTS `predictionadi`;
CREATE TABLE IF NOT EXISTS `predictionadi` (
  `PREV_WORD` varchar(25) NOT NULL,
  `CURR_WORD` varchar(25) NOT NULL,
  `N_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PREV_WORD`,`CURR_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predictionadi`
--

INSERT INTO `predictionadi` (`PREV_WORD`, `CURR_WORD`, `N_CNT`) VALUES
('a', 'databasew', 1),
('a', 'database', 2),
('database', 'is', 2),
('is', 'a', 2),
('a', 'collection', 2),
('collection', 'of', 2),
('of', 'related', 2),
('related', 'data', 2),
('data', 'organised', 2),
('organised', 'in', 2),
('in', 'a', 1),
('a', 'way', 1),
('way', 'that', 1),
('that', 'data', 1),
('data', 'can', 1),
('can', 'be', 4),
('be', 'easily', 1),
('easily', 'accesssed', 1),
('accesssed', 'managwe', 1),
('managwe', 'and', 1),
('and', 'updated', 2),
('updated', 'any', 1),
('any', 'piece', 1),
('piece', 'od', 1),
('piece', 'of', 2),
('of', 'information', 2),
('information', 'can', 1),
('be', 'a', 1),
('a', 'data', 1),
('example', 'name', 1),
('name', 'of', 1),
('of', 'your', 1),
('your', 'school', 1),
('school', 'databse', 1),
('databse', 'is', 1),
('is', 'actually', 1),
('actually', 'a', 1),
('a', 'place', 1),
('place', 'where', 1),
('where', 'related', 1),
('related', 'picw', 1),
('related', 'piece', 1),
('information', 'is', 1),
('is', 'stored', 1),
('stored', 'and', 1),
('and', 'various', 1),
('various', 'operations', 1),
('operations', 'can', 1),
('be', 'performed', 1),
('performed', 'on', 1),
('on', 'it', 1),
('hello', 'how', 4),
('how', 'are', 3),
('are', 'you', 3);

-- --------------------------------------------------------

--
-- Table structure for table `predictionaditya`
--

DROP TABLE IF EXISTS `predictionaditya`;
CREATE TABLE IF NOT EXISTS `predictionaditya` (
  `PREV_WORD` varchar(25) NOT NULL,
  `CURR_WORD` varchar(25) NOT NULL,
  `N_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PREV_WORD`,`CURR_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predictionaditya`
--

INSERT INTO `predictionaditya` (`PREV_WORD`, `CURR_WORD`, `N_CNT`) VALUES
('word', 'predictor', 1),
('predictor', 'is', 1),
('is', 'an', 1),
('an', 'application', 1),
('application', 'which', 1),
('which', 'will', 1),
('will', 'predict', 1),
('predict', 'the', 1),
('the', 'next', 1),
('next', 'word', 1),
('word', 'you', 1),
('you', 'may', 1),
('may', 'type', 1);

-- --------------------------------------------------------

--
-- Table structure for table `predictiondevadat`
--

DROP TABLE IF EXISTS `predictiondevadat`;
CREATE TABLE IF NOT EXISTS `predictiondevadat` (
  `PREV_WORD` varchar(25) NOT NULL,
  `CURR_WORD` varchar(25) NOT NULL,
  `N_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PREV_WORD`,`CURR_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predictiondevadat`
--

INSERT INTO `predictiondevadat` (`PREV_WORD`, `CURR_WORD`, `N_CNT`) VALUES
('hello', 'friends', 3),
('friends', 'chai', 2),
('chai', 'pilo', 2),
('i', 'can', 1);

-- --------------------------------------------------------

--
-- Table structure for table `predictionfaculty`
--

DROP TABLE IF EXISTS `predictionfaculty`;
CREATE TABLE IF NOT EXISTS `predictionfaculty` (
  `PREV_WORD` varchar(25) NOT NULL,
  `CURR_WORD` varchar(25) NOT NULL,
  `N_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PREV_WORD`,`CURR_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `predictionmainikant`
--

DROP TABLE IF EXISTS `predictionmainikant`;
CREATE TABLE IF NOT EXISTS `predictionmainikant` (
  `PREV_WORD` varchar(25) NOT NULL,
  `CURR_WORD` varchar(25) NOT NULL,
  `N_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PREV_WORD`,`CURR_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predictionmainikant`
--

INSERT INTO `predictionmainikant` (`PREV_WORD`, `CURR_WORD`, `N_CNT`) VALUES
('hello', 'friends', 2),
('friends', 'chai', 2),
('chai', 'pilo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `predictionmr_x`
--

DROP TABLE IF EXISTS `predictionmr_x`;
CREATE TABLE IF NOT EXISTS `predictionmr_x` (
  `PREV_WORD` varchar(25) NOT NULL,
  `CURR_WORD` varchar(25) NOT NULL,
  `N_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PREV_WORD`,`CURR_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
