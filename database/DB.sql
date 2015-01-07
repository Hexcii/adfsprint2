-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 07, 2015 at 03:32 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `app_dev_assignment1`
--
CREATE DATABASE IF NOT EXISTS `app_dev_assignment1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `app_dev_assignment1`;

-- --------------------------------------------------------

--
-- Table structure for table `deferral`
--

CREATE TABLE IF NOT EXISTS `deferral` (
  `id_deferral` int(11) NOT NULL AUTO_INCREMENT,
  `deferral_date` date NOT NULL,
  `id_program` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `program_deferred` tinyint(1) DEFAULT NULL,
  `id_deferral_status` int(11) NOT NULL,
  PRIMARY KEY (`id_deferral`),
  KEY `fk_defferal_student1_idx` (`id_student`),
  KEY `fk_deferral_defferal_status1_idx` (`id_deferral_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `deferral`
--

INSERT INTO `deferral` (`id_deferral`, `deferral_date`, `id_program`, `id_student`, `program_deferred`, `id_deferral_status`) VALUES
(21, '2015-01-05', 2, 2, 1, 4),
(22, '2015-01-05', 3, 1, 0, 1),
(23, '2015-01-05', 2, 2, 0, 4),
(24, '2015-01-05', 1, 1, 0, 1),
(25, '2015-01-05', 4, 3, 1, 3),
(26, '2015-01-05', 5, 4, 1, 3),
(27, '2015-01-05', 4, 4, 0, 3),
(28, '2015-01-07', 1, 4, 0, 1),
(29, '2015-01-07', 1, 3, 1, 1),
(30, '2015-01-07', 1, 3, 1, 1),
(31, '2015-01-07', 2, 2, 1, 1),
(32, '2015-01-07', 2, 2, 1, 1),
(33, '2015-01-07', 2, 1, 1, 1),
(34, '2015-01-07', 2, 1, 1, 1),
(35, '2015-01-07', 2, 2, 1, 1),
(36, '2015-01-07', 2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deferral_status_types`
--

CREATE TABLE IF NOT EXISTS `deferral_status_types` (
  `id_deferral_status` int(11) NOT NULL,
  `deferral_status_name` varchar(25) NOT NULL,
  PRIMARY KEY (`id_deferral_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deferral_status_types`
--

INSERT INTO `deferral_status_types` (`id_deferral_status`, `deferral_status_name`) VALUES
(1, 'UPLOADED'),
(2, 'APPROVED'),
(3, 'DELETED'),
(4, 'DOWNLOADED_BY_LECTURER'),
(5, 'SIGNED_BY_LECTURER'),
(6, 'DOWNLOADED_CORD'),
(7, 'SIGNED_CORD');

-- --------------------------------------------------------

--
-- Table structure for table `deferred_modules`
--

CREATE TABLE IF NOT EXISTS `deferred_modules` (
  `id_modules_deferred` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `id_deferral` int(11) NOT NULL,
  PRIMARY KEY (`id_modules_deferred`),
  KEY `fk_defferal_has_module_module1_idx` (`id_module`),
  KEY `fk_deferred_modules_deferral1_idx` (`id_deferral`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `deferred_modules`
--

INSERT INTO `deferred_modules` (`id_modules_deferred`, `id_module`, `id_deferral`) VALUES
(1, 1, 36),
(2, 1, 36);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE IF NOT EXISTS `lecturer` (
  `id_lecturer` int(11) NOT NULL AUTO_INCREMENT,
  `roomNumber` varchar(5) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `idManagedProgram` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lecturer`),
  KEY `fk_lecturer_program1_idx` (`idManagedProgram`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`id_lecturer`, `roomNumber`, `email`, `firstName`, `lastName`, `phoneNumber`, `idManagedProgram`) VALUES
(1, 'B180A', 'donna.oshea@cit.ie', 'Donna', 'OShea', '0123456789', NULL),
(2, 'B180A', 'ted.scully@cit.ie', 'Ted', 'Scully', '0123456789', NULL),
(3, 'B204K', 'quam.dignissim@necleo.org', 'Imogene', 'Marks', '(968) 385-9399', 1),
(4, 'B204Q', 'interdum.libero.dui@orciin.co.uk', 'Zelda', 'Bates', '(312) 500-3632', 1),
(5, 'B204M', 'senectus@diam.net', 'Sybil', 'Garza', '(898) 925-5762', 1),
(6, 'B204F', 'rhoncus.Donec.est@tinciduntDonecvitae.org', 'Unity', 'Booth', '(436) 183-7628', 1),
(7, 'B204K', 'nec.ante.Maecenas@elementumategestas.edu', 'Sophia', 'Mcbride', '(696) 359-9971', 1),
(8, 'B204K', 'sem@gravidanuncsed.edu', 'Glenna', 'Chen', '(108) 485-6189', 2),
(9, 'B204F', 'sit.amet@augueSed.net', 'Zelda', 'Aguilar', '(953) 716-7431', 2),
(10, 'B204X', 'molestie@in.com', 'Emma', 'Guzman', '(572) 557-8147', 1),
(11, 'B204O', 'erat@ametdiam.net', 'Dominique', 'Bruce', '(941) 395-1300', 1),
(12, 'B204Q', 'sit.amet@sedduiFusce.com', 'Patricia', 'Clay', '(822) 803-6713', 1),
(13, 'B204K', 'quam.dignissim@necleo.org', 'Imogene', 'Marks', '(968) 385-9399', 1),
(14, 'B204Q', 'interdum.libero.dui@orciin.co.uk', 'Zelda', 'Bates', '(312) 500-3632', 1),
(15, 'B204M', 'senectus@diam.net', 'Sybil', 'Garza', '(898) 925-5762', 1),
(16, 'B204F', 'rhoncus.Donec.est@tinciduntDonecvitae.org', 'Unity', 'Booth', '(436) 183-7628', 1),
(17, 'B204K', 'nec.ante.Maecenas@elementumategestas.edu', 'Sophia', 'Mcbride', '(696) 359-9971', 1),
(18, 'B204K', 'sem@gravidanuncsed.edu', 'Glenna', 'Chen', '(108) 485-6189', 2),
(19, 'B204F', 'sit.amet@augueSed.net', 'Zelda', 'Aguilar', '(953) 716-7431', 2),
(20, 'B204X', 'molestie@in.com', 'Emma', 'Guzman', '(572) 557-8147', 1),
(21, 'B204O', 'erat@ametdiam.net', 'Dominique', 'Bruce', '(941) 395-1300', 1),
(22, 'B204Q', 'sit.amet@sedduiFusce.com', 'Patricia', 'Clay', '(822) 803-6713', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_teaches_module`
--

CREATE TABLE IF NOT EXISTS `lecturer_teaches_module` (
  `idLecturer` int(11) NOT NULL,
  `idModule` int(11) NOT NULL,
  PRIMARY KEY (`idLecturer`,`idModule`),
  KEY `fk_lecturer_has_module_module1_idx` (`idModule`),
  KEY `fk_lecturer_has_module_lecturer1_idx` (`idLecturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lecturer_teaches_module`
--

INSERT INTO `lecturer_teaches_module` (`idLecturer`, `idModule`) VALUES
(2, 1),
(11, 1),
(2, 2),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `id_module` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(9) DEFAULT NULL,
  `crn` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id_module`, `code`, `crn`, `name`, `semester`) VALUES
(1, 'soft661', '34551', 'RTS', 1),
(2, 'soft662', '34552', 'SWPM', 2),
(3, 'soft663', '34553', 'SE', 3),
(4, 'soft664', '34554', 'GG', 4),
(5, 'soft665', '34555', 'FF', 2),
(6, 'SOFT8020', '32389', 'Stuff And Things', 3),
(7, 'comp123', '1234', 'computer sci', 2),
(8, 'comp234', '98765', 'computers', 1),
(9, 'comp123', '1234', 'computer sci', 2),
(10, 'comp234', '98765', 'computers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `id_program` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(30) DEFAULT NULL,
  `year_number` mediumint(9) DEFAULT NULL,
  `program_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_program`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id_program`, `program_name`, `year_number`, `program_code`) VALUES
(1, 'DCOM4', NULL, 'DCOM4'),
(2, 'BEST', 1, 'code1'),
(3, 'DCOM', 4, 'code2'),
(4, 'BEST', 1, 'code1'),
(5, 'DCOM', 4, 'code2');

-- --------------------------------------------------------

--
-- Table structure for table `program_has_semseters`
--

CREATE TABLE IF NOT EXISTS `program_has_semseters` (
  `id_program` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  PRIMARY KEY (`id_program`,`id_module`),
  KEY `fk_program_has_module_program1_idx` (`id_program`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program_has_semseters`
--

INSERT INTO `program_has_semseters` (`id_program`, `id_module`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `studentNumber` varchar(10) DEFAULT NULL,
  `addressLine1` varchar(30) DEFAULT NULL,
  `addressLine2` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id_student`, `firstName`, `lastName`, `studentNumber`, `addressLine1`, `addressLine2`, `email`, `phoneNumber`) VALUES
(1, 'Simon', 'Casey', 'R00058441', 'Tramore', 'Waterford', 'simon.casey@mycit.ie', '098765433'),
(2, 'Mary', 'Casey', 'R00058442', 'Bishopstown', 'Cork', 'mary.casey@mycit.ie', '5436356432'),
(3, 'a', 'a', 'r1', 'aa', 'aa', 'a@a', '123'),
(4, 'b', 'b', 'r2', 'bb', 'bb', 'b@b', '345'),
(5, 'a', 'a', 'r1', 'aa', 'aa', 'a@a', '123'),
(6, 'b', 'b', 'r2', 'bb', 'bb', 'b@b', '345');

-- --------------------------------------------------------

--
-- Table structure for table `student_enrolls_for`
--

CREATE TABLE IF NOT EXISTS `student_enrolls_for` (
  `id_module` int(11) NOT NULL,
  `idStudent` int(11) NOT NULL,
  `enroment_date` date DEFAULT NULL,
  PRIMARY KEY (`id_module`,`idStudent`),
  KEY `fk_module_has_student_student1_idx` (`idStudent`),
  KEY `fk_module_has_student_module_idx` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_enrolls_for`
--

INSERT INTO `student_enrolls_for` (`id_module`, `idStudent`, `enroment_date`) VALUES
(1, 1, '2015-01-05'),
(2, 1, '2015-01-05'),
(3, 1, '2015-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `USER_ID` int(10) unsigned NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `USERNAME`, `PASSWORD`, `ENABLED`) VALUES
(100, 'donna', '123456', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `USER_ROLE_ID` int(10) unsigned NOT NULL,
  `USER_ID` int(10) unsigned NOT NULL,
  `AUTHORITY` varchar(45) NOT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `FK_user_roles` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`USER_ROLE_ID`, `USER_ID`, `AUTHORITY`) VALUES
(1, 100, 'ROLE_USER');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deferral`
--
ALTER TABLE `deferral`
  ADD CONSTRAINT `fk_id_deferral_status` FOREIGN KEY (`id_deferral_status`) REFERENCES `deferral_status_types` (`id_deferral_status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deferred_modules`
--
ALTER TABLE `deferred_modules`
  ADD CONSTRAINT `fk_deferred_modules_deferral4` FOREIGN KEY (`id_deferral`) REFERENCES `deferral` (`id_deferral`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_defferal_has_module_module2` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `fk_lecturer_program1` FOREIGN KEY (`idManagedProgram`) REFERENCES `program` (`id_program`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lecturer_teaches_module`
--
ALTER TABLE `lecturer_teaches_module`
  ADD CONSTRAINT `fk_lecturer_has_module_lecturer1` FOREIGN KEY (`idLecturer`) REFERENCES `lecturer` (`id_lecturer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lecturer_has_module_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program_has_semseters`
--
ALTER TABLE `program_has_semseters`
  ADD CONSTRAINT `fk_program_has_module_program1` FOREIGN KEY (`id_program`) REFERENCES `program` (`id_program`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_enrolls_for`
--
ALTER TABLE `student_enrolls_for`
  ADD CONSTRAINT `fk_module_has_student_module` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_module_has_student_student1` FOREIGN KEY (`idStudent`) REFERENCES `student` (`id_student`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK_user_roles` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
