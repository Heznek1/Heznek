-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2018 at 10:21 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hezneklaatid`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Sn` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`Sn`, `Name`) VALUES
(1, 'בנק אגוד לישראל בע\"מ'),
(2, 'בנק אוצר החייל בע\"מ'),
(3, 'בנק דיסקונט לישראל בע\"מ'),
(4, 'בנק דקסיה ישראל בע\"מ'),
(5, 'בנק הפועלים בע\"מ'),
(6, 'בנק יהב לעובדי המדינה בע\"מ'),
(7, 'בנק ירושלים בע\"מ'),
(8, 'בנק לאומי לישראל בע\"מ'),
(9, 'בנק מזרחי טפחות בע\"מ'),
(10, 'בנק מסד בע\"מ'),
(11, 'בנק מרכנתיל דיסקונט בע\"מ'),
(12, 'בנק ערבי ישראלי בע\"מ'),
(13, 'בנק פועלי אגודת ישראל בע\"מ'),
(14, 'הבנק הבינלאומי הראשון לישראל בע\"מ'),
(15, 'יובנק בע\"מ');

-- --------------------------------------------------------

--
-- Table structure for table `contactstudentcandidate`
--

CREATE TABLE `contactstudentcandidate` (
  `idStudent` char(9) NOT NULL,
  `idCandidate` char(9) NOT NULL,
  `dateOfCall` date DEFAULT NULL,
  `updating` text
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

-- --------------------------------------------------------

--
-- Table structure for table `eventtbl`
--

CREATE TABLE `eventtbl` (
  `sn` int(11) NOT NULL,
  `nameEvent` varchar(300) NOT NULL,
  `subjectEvent` varchar(300) DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `eventHour` time DEFAULT NULL,
  `eventLocation` varchar(500) DEFAULT NULL,
  `typeOfParticipants` varchar(100) NOT NULL,
  `numParticipantsExpected` int(11) DEFAULT NULL,
  `numOfActualParticipants` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `sn` int(11) NOT NULL,
  `fromUser` varchar(100) DEFAULT NULL,
  `toUser` varchar(100) DEFAULT NULL,
  `subject` text,
  `content` text,
  `hour` time DEFAULT NULL,
  `dateOfMessage` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

-- --------------------------------------------------------

--
-- Table structure for table `participantinevent`
--

CREATE TABLE `participantinevent` (
  `sn` int(11) NOT NULL,
  `id` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

-- --------------------------------------------------------

--
-- Table structure for table `scholarship`
--

CREATE TABLE `scholarship` (
  `sn` int(11) NOT NULL,
  `scholarshipName` varchar(100) NOT NULL,
  `budgetScholarship` int(11) DEFAULT NULL,
  `admission` text,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

-- --------------------------------------------------------

--
-- Table structure for table `servicetbl`
--

CREATE TABLE `servicetbl` (
  `sn` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `longOfService` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

--
-- Dumping data for table `servicetbl`
--

INSERT INTO `servicetbl` (`sn`, `type`, `longOfService`) VALUES
(1, 'MILITARY', 'FULL'),
(2, 'MILITARY', 'PARTIAL'),
(3, 'NATIONAL SERVICE', 'FULL'),
(4, 'NATIONAL SERVICE', 'PARTIAL'),
(5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statustbl`
--

CREATE TABLE `statustbl` (
  `numOfStatus` int(11) NOT NULL,
  `primaryStatusName` varchar(100) NOT NULL,
  `secondaryStatusName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

--
-- Dumping data for table `statustbl`
--

INSERT INTO `statustbl` (`numOfStatus`, `primaryStatusName`, `secondaryStatusName`) VALUES
(1, 'STUDENT', 'NEW SCHOLARSHIP'),
(2, 'STUDENT', 'CONTINUES SCHOLARSHIP'),
(3, 'STUDENT', 'FORMER SCHOLARSHIP'),
(4, 'CANDIDATE', 'AWARE'),
(5, 'CANDIDATE', 'UNAWARE'),
(6, 'GRADUATE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studentscholarship`
--

CREATE TABLE `studentscholarship` (
  `id` char(9) NOT NULL,
  `sn` int(11) NOT NULL,
  `amountOfGivanScholarship` int(11) DEFAULT NULL,
  `numOfDeposits` int(11) DEFAULT NULL,
  `currentYear` int(11) DEFAULT NULL,
  `wasGivenInPast` char(1) NOT NULL,
  `numOfVolunteerHours` int(11) DEFAULT NULL,
  `numOfHoursDone` int(11) DEFAULT NULL,
  `numOfHoursLeft` int(11) AS (numOfVolunteerHours-numOfHoursDone) VIRTUAL,
  `amountDeposited` int(11) DEFAULT NULL,
  `amountLeftToDeposit` int(11) AS (amountOfGivanScholarship-amountDeposited) VIRTUAL,
  `remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

-- --------------------------------------------------------

--
-- Table structure for table `usertbl`
--

CREATE TABLE `usertbl` (
  `id` char(9) NOT NULL,
  `password` varchar(10) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `yearsInTheProgram` int(11) DEFAULT NULL,
  `requestStatus` char(1) DEFAULT NULL,
  `userType` int(11) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(10000) DEFAULT NULL,
  `address` text,
  `numOfSiblings` int(11) DEFAULT NULL,
  `academicParents` int(1) DEFAULT NULL,
  `school` text,
  `yearFinishSchool` int(11) DEFAULT NULL,
  `typeOfService` int(1) NOT NULL,
  `academicInstitution` text,
  `studyField` text,
  `startYear` int(11) DEFAULT NULL,
  `excpectedCompletionYear` int(11) DEFAULT NULL,
  `learningDisabilities` varchar(3) DEFAULT NULL,
  `psychometricGrade` int(11) DEFAULT NULL,
  `anotherScholarship` varchar(3) DEFAULT NULL,
  `educationFunding` text,
  `difficulties` text,
  `bankName` int(11) DEFAULT NULL,
  `numOfBank` int(11) DEFAULT NULL,
  `numAccount` int(11) DEFAULT NULL,
  `files` text,
  `profilePicture` text
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`id`, `password`, `firstName`, `lastName`, `dateOfBirth`, `status`, `yearsInTheProgram`, `requestStatus`, `userType`, `gender`, `phone`, `email`, `address`, `numOfSiblings`, `academicParents`, `school`, `yearFinishSchool`, `typeOfService`, `academicInstitution`, `studyField`, `startYear`, `excpectedCompletionYear`, `learningDisabilities`, `psychometricGrade`, `anotherScholarship`, `educationFunding`, `difficulties`, `bankName`, `numOfBank`, `numAccount`, `files`, `profilePicture`) VALUES
('203936752', '12345678', 'Elinor', 'Azran', '0000-00-00', 2, 2, NULL, 1, 'F', '0506360155', 'elinoraz21@gmail.com', 'Ben Zvi, Beit-Shean', 5, 1, 'Rabin, Kfar-Sava', 2010, 1, 'אוניברסיטת חיפה', 'inforamtion system', 2015, 2019, 'Yes', 685, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('307992180', '12345678', 'Mor', 'Azran', '1993-07-20', 2, 1, NULL, 3, 'F', '0526561060', 'moraz1919@gmail.com', 'Ben Zvi, Beit-Shean', 5, 1, 'Rabin, Kfar-Sava', 2012, 1, 'אוניברסיטת חיפה', 'מדעי המדינה', 2017, 2021, 'No', 600, 'No', 'אין עוד מלגה נוספת', 'קשיים בריאותים- עתידה לעבור ניתוח באוזן, מרבה לבקר בבתי חולים.', 9, 439, 213013, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usertypetbl`
--

CREATE TABLE `usertypetbl` (
  `numOfType` int(11) NOT NULL,
  `userType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

--
-- Dumping data for table `usertypetbl`
--

INSERT INTO `usertypetbl` (`numOfType`, `userType`) VALUES
(1, 'MANAGER'),
(2, 'MANAGER HELPER'),
(3, 'REGULAR USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`Sn`);

--
-- Indexes for table `contactstudentcandidate`
--
ALTER TABLE `contactstudentcandidate`
  ADD PRIMARY KEY (`idStudent`,`idCandidate`),
  ADD KEY `idCandidate` (`idCandidate`);

--
-- Indexes for table `eventtbl`
--
ALTER TABLE `eventtbl`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `participantinevent`
--
ALTER TABLE `participantinevent`
  ADD PRIMARY KEY (`sn`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `servicetbl`
--
ALTER TABLE `servicetbl`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `statustbl`
--
ALTER TABLE `statustbl`
  ADD PRIMARY KEY (`numOfStatus`);

--
-- Indexes for table `studentscholarship`
--
ALTER TABLE `studentscholarship`
  ADD PRIMARY KEY (`id`,`sn`),
  ADD KEY `sn` (`sn`);

--
-- Indexes for table `usertbl`
--
ALTER TABLE `usertbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `userType` (`userType`),
  ADD KEY `typeOfService` (`typeOfService`),
  ADD KEY `bankName` (`bankName`);

--
-- Indexes for table `usertypetbl`
--
ALTER TABLE `usertypetbl`
  ADD PRIMARY KEY (`numOfType`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `Sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `eventtbl`
--
ALTER TABLE `eventtbl`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scholarship`
--
ALTER TABLE `scholarship`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicetbl`
--
ALTER TABLE `servicetbl`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `statustbl`
--
ALTER TABLE `statustbl`
  MODIFY `numOfStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usertypetbl`
--
ALTER TABLE `usertypetbl`
  MODIFY `numOfType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contactstudentcandidate`
--
ALTER TABLE `contactstudentcandidate`
  ADD CONSTRAINT `contactstudentcandidate_ibfk_1` FOREIGN KEY (`idStudent`) REFERENCES `usertbl` (`id`),
  ADD CONSTRAINT `contactstudentcandidate_ibfk_2` FOREIGN KEY (`idCandidate`) REFERENCES `usertbl` (`id`);

--
-- Constraints for table `participantinevent`
--
ALTER TABLE `participantinevent`
  ADD CONSTRAINT `participantinevent_ibfk_1` FOREIGN KEY (`sn`) REFERENCES `eventtbl` (`sn`),
  ADD CONSTRAINT `participantinevent_ibfk_2` FOREIGN KEY (`id`) REFERENCES `usertbl` (`id`);

--
-- Constraints for table `studentscholarship`
--
ALTER TABLE `studentscholarship`
  ADD CONSTRAINT `studentscholarship_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usertbl` (`id`),
  ADD CONSTRAINT `studentscholarship_ibfk_2` FOREIGN KEY (`sn`) REFERENCES `scholarship` (`sn`);

--
-- Constraints for table `usertbl`
--
ALTER TABLE `usertbl`
  ADD CONSTRAINT `usertbl_ibfk_1` FOREIGN KEY (`status`) REFERENCES `statustbl` (`numOfStatus`),
  ADD CONSTRAINT `usertbl_ibfk_2` FOREIGN KEY (`userType`) REFERENCES `usertypetbl` (`numOfType`),
  ADD CONSTRAINT `usertbl_ibfk_3` FOREIGN KEY (`typeOfService`) REFERENCES `servicetbl` (`sn`),
  ADD CONSTRAINT `usertbl_ibfk_4` FOREIGN KEY (`bankName`) REFERENCES `bank` (`Sn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
