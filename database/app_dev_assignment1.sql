-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2015 at 05:45 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `app_dev_assignment1`
--
CREATE DATABASE IF NOT EXISTS `app_dev_assignment1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `app_dev_assignment1`;

-- --------------------------------------------------------

--
-- Table structure for table `deferral`
--

CREATE TABLE IF NOT EXISTS `deferral` (
`id_deferral` int(11) NOT NULL,
  `deferral_date` date NOT NULL,
  `id_program` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `program_deferred` tinyint(1) DEFAULT NULL,
  `id_deferral_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deferral_status_types`
--

CREATE TABLE IF NOT EXISTS `deferral_status_types` (
  `id_deferral_status` int(11) NOT NULL,
  `deferral_status_name` varchar(25) NOT NULL
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
`id_modules_deferred` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `id_deferral` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE IF NOT EXISTS `lecturer` (
`id_lecturer` int(11) NOT NULL,
  `roomNumber` varchar(5) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `idManagedProgram` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_teaches_module`
--

CREATE TABLE IF NOT EXISTS `lecturer_teaches_module` (
  `idLecturer` int(11) NOT NULL,
  `idModule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
`id_module` int(11) NOT NULL,
  `code` varchar(9) DEFAULT NULL,
  `crn` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
`id_program` int(11) NOT NULL,
  `program_name` varchar(30) DEFAULT NULL,
  `year_number` mediumint(9) DEFAULT NULL,
  `program_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `program_has_semseters`
--

CREATE TABLE IF NOT EXISTS `program_has_semseters` (
  `id_program` int(11) NOT NULL,
  `semseter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
`id_student` int(11) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `studentNumber` varchar(10) DEFAULT NULL,
  `addressLine1` varchar(30) DEFAULT NULL,
  `addressLine2` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_enrolls_for`
--

CREATE TABLE IF NOT EXISTS `student_enrolls_for` (
  `id_module` int(11) NOT NULL,
  `idStudent` int(11) NOT NULL,
  `enroment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deferral`
--
ALTER TABLE `deferral`
 ADD PRIMARY KEY (`id_deferral`), ADD KEY `fk_defferal_student1_idx` (`id_student`), ADD KEY `fk_deferral_defferal_status1_idx` (`id_deferral_status`);

--
-- Indexes for table `deferral_status_types`
--
ALTER TABLE `deferral_status_types`
 ADD PRIMARY KEY (`id_deferral_status`);

--
-- Indexes for table `deferred_modules`
--
ALTER TABLE `deferred_modules`
 ADD PRIMARY KEY (`id_modules_deferred`), ADD KEY `fk_defferal_has_module_module1_idx` (`id_module`), ADD KEY `fk_deferred_modules_deferral1_idx` (`id_deferral`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
 ADD PRIMARY KEY (`id_lecturer`), ADD KEY `fk_lecturer_program1_idx` (`idManagedProgram`);

--
-- Indexes for table `lecturer_teaches_module`
--
ALTER TABLE `lecturer_teaches_module`
 ADD PRIMARY KEY (`idLecturer`,`idModule`), ADD KEY `fk_lecturer_has_module_module1_idx` (`idModule`), ADD KEY `fk_lecturer_has_module_lecturer1_idx` (`idLecturer`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
 ADD PRIMARY KEY (`id_module`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
 ADD PRIMARY KEY (`id_program`);

--
-- Indexes for table `program_has_semseters`
--
ALTER TABLE `program_has_semseters`
 ADD PRIMARY KEY (`id_program`), ADD KEY `fk_program_has_module_program1_idx` (`id_program`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`id_student`);

--
-- Indexes for table `student_enrolls_for`
--
ALTER TABLE `student_enrolls_for`
 ADD PRIMARY KEY (`id_module`,`idStudent`), ADD KEY `fk_module_has_student_student1_idx` (`idStudent`), ADD KEY `fk_module_has_student_module_idx` (`id_module`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deferral`
--
ALTER TABLE `deferral`
MODIFY `id_deferral` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deferred_modules`
--
ALTER TABLE `deferred_modules`
MODIFY `id_modules_deferred` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lecturer`
--
ALTER TABLE `lecturer`
MODIFY `id_lecturer` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
MODIFY `id_program` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
MODIFY `id_student` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `deferral`
--
ALTER TABLE `deferral`
ADD CONSTRAINT `fk_defferal_student` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`) ON DELETE CASCADE ON UPDATE CASCADE,
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
