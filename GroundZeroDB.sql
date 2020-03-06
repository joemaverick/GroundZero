-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2020 at 06:16 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

CREATE DATABASE GroundZero;
USE GroundZero;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GroundZero`
--

-- --------------------------------------------------------

--
-- Table structure for table `Goal`
--

CREATE TABLE IF NOT EXISTS `Goal` (
  `GoalID` int(11) NOT NULL,
  `GoalName` varchar(255) DEFAULT NULL,
  `GoalType` varchar(255) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `GoalStart` datetime DEFAULT NULL,
  `GoalEnd` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Goal`
--

INSERT INTO `Goal` (`GoalID`, `GoalName`, `GoalType`, `UserID`, `GoalStart`, `GoalEnd`) VALUES
(1, 'Lose 10 Pounds', 'Weight Loss', 1, '2020-03-09 00:00:00', '2020-05-11 00:00:00'),
(2, 'Graduate University', 'Academic ', 2, '2020-09-01 00:00:00', '2023-09-04 00:00:00'),
(3, 'Swim 500 Meters', 'Physical ', 3, '2020-03-05 00:00:00', '2020-06-05 00:00:00'),
(4, 'Drive Ferrari', 'Financial ', 4, '2020-03-05 00:00:00', '2021-03-05 00:00:00'),
(5, 'MOS Expert Certification', 'Academic ', 5, '2020-03-05 00:00:00', '2020-03-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `KVIType`
--

CREATE TABLE IF NOT EXISTS `KVIType` (
  `KVITypeId` int(11) NOT NULL,
  `KVIName` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Multiplier` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `KVIType`
--

INSERT INTO `KVIType` (`KVITypeId`, `KVIName`, `Description`, `Multiplier`) VALUES
(1, '1 pound', '1 Pound of Weight Loss', 1),
(2, 'Weightlifting', 'Lifting weight at the gym', 0.1),
(3, 'University Credit', 'University Credit earned from an accredited university. *Note most classes are multiple credits earned per class, add multiple KVI accordingly.*', 1),
(4, 'Swimming', 'Swimming exercise.', 0.1),
(5, '$1000', 'Save or earn 1000 USD.', 0.1),
(6, 'Study', 'Study for test, certification, or competency in any subject.', 0.25);

-- --------------------------------------------------------

--
-- Table structure for table `Milestone`
--

CREATE TABLE IF NOT EXISTS `Milestone` (
  `MilestoneId` int(11) NOT NULL,
  `MilestoneName` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `MilestoneType` varchar(255) DEFAULT NULL,
  `GoalId` int(11) NOT NULL,
  `KVITypeId` int(11) NOT NULL,
  `TargetKVI` double DEFAULT NULL,
  `CurrentKVI` double DEFAULT NULL,
  `TargetDate` datetime DEFAULT NULL,
  `CompletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Milestone`
--

INSERT INTO `Milestone` (`MilestoneId`, `MilestoneName`, `Description`, `MilestoneType`, `GoalId`, `KVITypeId`, `TargetKVI`, `CurrentKVI`, `TargetDate`, `CompletedDate`) VALUES
(1, 'Lose 10 Pounds', '10 Pounds of Weight lost', 'Weight Loss', 1, 1, 10, 10, '2020-03-09 00:00:00', '0000-00-00 00:00:00'),
(2, 'Graduation', 'Graduate from University', 'Academic ', 2, 3, 180, 30, '2020-09-01 00:00:00', '0000-00-00 00:00:00'),
(3, 'Swim 500 Meter', 'Swim 500 Meters nonstop', 'Physical Activity ', 3, 3, 4, 0.1, '2020-06-08 00:00:00', NULL),
(4, 'Drive Ferrari', 'Drive a Ferrari ', 'Financial', 4, 5, 25, 0.1, '2021-03-01 00:00:00', NULL),
(5, 'MOS Expert Certified', 'Microsoft Office Specialist Expert Certification ', 'Academic', 5, 6, 3, 0.25, '2020-03-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Progress`
--

CREATE TABLE IF NOT EXISTS `Progress` (
  `ProgressId` int(11) NOT NULL,
  `InputValue` double DEFAULT NULL,
  `KVIValue` double DEFAULT NULL,
  `ProgressDate` datetime DEFAULT NULL,
  `MilestoneId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Progress`
--

INSERT INTO `Progress` (`ProgressId`, `InputValue`, `KVIValue`, `ProgressDate`, `MilestoneId`) VALUES
(1, 0.1, 0.1, '2020-03-09 00:00:00', 1),
(2, 30, 30, '2020-04-01 00:00:00', 2),
(3, 1.5, 1.5, '2020-04-30 00:00:00', 3),
(4, 12.5, 12.5, '2020-08-01 00:00:00', 4),
(5, 2, 2, '2020-03-16 00:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `UserEmail` varchar(255) DEFAULT NULL,
  `UserPassword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `UserName`, `UserEmail`, `UserPassword`) VALUES
(1, 'Joseph1', 'Joseph@example.com', 'qwertyuiop'),
(2, 'Sabreezy', 'sabri@example.com', 'qwertyuiop'),
(3, 'Ivanov', 'ivan@example.com', 'qwertyuiop'),
(4, 'Dusko', 'dusan@example.com', 'qwertyuiop'),
(5, 'Tyla', 'tyler@example.com', 'qwertyuiop');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Goal`
--
ALTER TABLE `Goal`
  ADD PRIMARY KEY (`GoalID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `KVIType`
--
ALTER TABLE `KVIType`
  ADD PRIMARY KEY (`KVITypeId`);

--
-- Indexes for table `Milestone`
--
ALTER TABLE `Milestone`
  ADD PRIMARY KEY (`MilestoneId`),
  ADD KEY `GoalId` (`GoalId`),
  ADD KEY `KVITypeId` (`KVITypeId`);

--
-- Indexes for table `Progress`
--
ALTER TABLE `Progress`
  ADD PRIMARY KEY (`ProgressId`),
  ADD KEY `MilestoneId` (`MilestoneId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Goal`
--
ALTER TABLE `Goal`
  MODIFY `GoalID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `KVIType`
--
ALTER TABLE `KVIType`
  MODIFY `KVITypeId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Milestone`
--
ALTER TABLE `Milestone`
  MODIFY `MilestoneId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Progress`
--
ALTER TABLE `Progress`
  MODIFY `ProgressId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Goal`
--
ALTER TABLE `Goal`
  ADD CONSTRAINT `Goal_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `Milestone`
--
ALTER TABLE `Milestone`
  ADD CONSTRAINT `Milestone_ibfk_1` FOREIGN KEY (`GoalId`) REFERENCES `Goal` (`GoalID`),
  ADD CONSTRAINT `Milestone_ibfk_2` FOREIGN KEY (`KVITypeId`) REFERENCES `KVIType` (`KVITypeId`);

--
-- Constraints for table `Progress`
--
ALTER TABLE `Progress`
  ADD CONSTRAINT `Progress_ibfk_1` FOREIGN KEY (`MilestoneId`) REFERENCES `Milestone` (`MilestoneId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
