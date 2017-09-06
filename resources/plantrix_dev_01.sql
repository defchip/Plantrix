-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: 10.169.0.57
-- Generation Time: Sep 06, 2017 at 08:52 AM
-- Server version: 5.6.21
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plantrix_dev_01`
--
CREATE DATABASE IF NOT EXISTS `plantrix_dev_01` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `plantrix_dev_01`;

-- --------------------------------------------------------

--
-- Table structure for table `ACCOUNTS`
--

CREATE TABLE IF NOT EXISTS `ACCOUNTS` (
  `ACCOUNT_ID` int(11) NOT NULL,
  `ACCOUNT_NAME` varchar(64) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ACCOUNTS`
--

INSERT INTO `ACCOUNTS` (`ACCOUNT_ID`, `ACCOUNT_NAME`, `IS_DELETED`) VALUES
(1, 'Pure Sight Ltd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ACTIVITIES`
--

CREATE TABLE IF NOT EXISTS `ACTIVITIES` (
  `ACTIVITY_ID` int(11) NOT NULL,
  `ACTIVITY` varchar(100) NOT NULL,
  `IS_CHARGEABLE` smallint(6) NOT NULL DEFAULT '0',
  `ACCOUNT_ID` int(11) NOT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ACTIVITIES`
--

INSERT INTO `ACTIVITIES` (`ACTIVITY_ID`, `ACTIVITY`, `IS_CHARGEABLE`, `ACCOUNT_ID`, `ITEM_ORDER`, `IS_DELETED`) VALUES
(1, 'Project Work', -1, 1, NULL, 0),
(2, 'Maternity Leave', 0, 1, NULL, 0),
(3, 'Unpaid Absence', 0, 1, NULL, 0),
(4, 'Sick', 0, 1, NULL, 0),
(5, 'Holiday', 0, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CONSULTANTS`
--

CREATE TABLE IF NOT EXISTS `CONSULTANTS` (
  `CONSULTANT_ID` int(11) NOT NULL,
  `FORENAMES` varchar(64) NOT NULL,
  `SURNAME` varchar(64) NOT NULL,
  `SALARY` decimal(9,2) DEFAULT NULL,
  `POSTCODE` varchar(8) DEFAULT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CONSULTANTS`
--

INSERT INTO `CONSULTANTS` (`CONSULTANT_ID`, `FORENAMES`, `SURNAME`, `SALARY`, `POSTCODE`, `ACCOUNT_ID`, `TEAM_ID`, `IS_DELETED`) VALUES
(1, 'Jared', 'Brittner', '55000.00', 'BS2 0TZ', 1, 1, -1),
(2, 'Peter', 'Rutherford', '47500.00', 'EC1N 2PZ', 1, 1, 0),
(3, 'Marla', 'Griffin', '52000.00', 'RG1 1DA', 1, 1, 0),
(4, 'Sunil', 'Keradia', '57500.00', 'OX4 2BH', 1, 4, 0),
(5, 'Marcos', 'Sallis', '46750.00', 'EX2 5WR', 1, 1, 0),
(6, 'James', 'Meyers', '44566.00', 'BS1 5LF', 1, 4, 0),
(7, 'Mary', 'Ford', '36500.00', 'GU32 3EH', 1, 3, 0),
(8, 'Nathaniel', 'Cooke', '29000.00', 'NN1 5AQ', 1, 4, 0),
(9, 'Nicholas', 'Flatt', '43233.00', 'L2 2ET', 1, 2, 0),
(10, 'Brian', 'Geech', '54022.00', 'GU32 3ES', 1, 2, 0),
(11, 'Jerome', 'Norton-Smith', '66430.00', 'BA3 2HJ', 1, 1, 0),
(12, 'Rosie', 'Andrews', '27459.00', 'BS20 7AN', 1, 2, 0),
(13, 'Rosie', 'Andrews', '27456.00', 'BS20 7AN', 1, 3, -1),
(14, 'Ciaran', 'Ledroi', '43913.00', 'BS23 5TT', 1, 4, 0),
(15, 'Jusse', 'Frenr', '37243.00', 'N8 4RR', 1, 3, 0),
(16, 'Ryan', 'Sands', '54000.00', 'LE1 6AS', 1, 3, 0),
(17, 'Theo', 'Wright', '34677.00', 'BS22 5TT', 1, 1, 0),
(18, 'Ursula', 'Osbourne', '38709.00', 'DE4 6DE', 1, 2, 0),
(19, 'Andrew', 'Parker', '88343.00', 'N6 4BQ', 1, 2, 0),
(21, 'David', 'Eagles', '55344.00', 'LE2 7QQ', 1, 4, 0),
(23, 'Pam', 'Stute', '36504.00', 'E1 2EE', 1, 1, 0),
(24, 'wwef', 'wefwef', '0.00', 'efwefwef', 1, 2, -1),
(26, 'Kevin', 'Wu', '45000.00', 'LE34 6RT', 1, 3, 0),
(28, 'Shsyz', 'Fifkf', '34577.00', 'Bs31 6gg', 1, 3, 0),
(29, 'Bobby', 'Alexrod', '1000000.00', 'BA1 2PW', 1, 2, 0),
(30, 'Ian', 'Turnbull', '345000.00', 'EC3 4ER', 1, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CONSULTANTS_SKILLS`
--

CREATE TABLE IF NOT EXISTS `CONSULTANTS_SKILLS` (
  `CONSULTANT_ID` int(11) NOT NULL,
  `SKILL_ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CONSULTANTS_SKILLS`
--

INSERT INTO `CONSULTANTS_SKILLS` (`CONSULTANT_ID`, `SKILL_ID`, `ACCOUNT_ID`, `IS_DELETED`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMERS`
--

CREATE TABLE IF NOT EXISTS `CUSTOMERS` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `CUSTOMER` varchar(100) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CUSTOMERS`
--

INSERT INTO `CUSTOMERS` (`CUSTOMER_ID`, `CUSTOMER`, `ACCOUNT_ID`, `ITEM_ORDER`, `IS_DELETED`) VALUES
(1, 'Growth Logistics Ltd', 1, NULL, 0),
(2, 'Warehouse Solutions UK Ltd', 1, NULL, 0),
(3, 'Advanced Alloys (Petersfield) Ltd', 1, NULL, 0),
(4, 'Pendulate Ltd', 1, NULL, 0),
(5, 'The Media Corp Plc', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMERS_PROJECTS`
--

CREATE TABLE IF NOT EXISTS `CUSTOMERS_PROJECTS` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `PROJECT_ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CUSTOMERS_PROJECTS`
--

INSERT INTO `CUSTOMERS_PROJECTS` (`CUSTOMER_ID`, `PROJECT_ID`, `ACCOUNT_ID`, `IS_DELETED`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PROJECTS`
--

CREATE TABLE IF NOT EXISTS `PROJECTS` (
  `PROJECT_ID` int(11) NOT NULL,
  `PROJECT` varchar(100) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROJECTS`
--

INSERT INTO `PROJECTS` (`PROJECT_ID`, `PROJECT`, `ACCOUNT_ID`, `ITEM_ORDER`, `IS_DELETED`) VALUES
(1, 'Warehouse Efficiency', 1, NULL, 0),
(2, 'Retail Efficiency', 1, NULL, 0),
(3, 'Management Efficiency', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PROJECT_LOCATIONS`
--

CREATE TABLE IF NOT EXISTS `PROJECT_LOCATIONS` (
  `LOCATION_ID` int(11) NOT NULL,
  `LOCATION` varchar(64) NOT NULL,
  `PROJECT_ID` int(11) NOT NULL,
  `POSTCODE` varchar(8) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PROJECT_ROLES`
--

CREATE TABLE IF NOT EXISTS `PROJECT_ROLES` (
  `PROJECT_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `COST` decimal(9,2) DEFAULT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROJECT_ROLES`
--

INSERT INTO `PROJECT_ROLES` (`PROJECT_ID`, `ROLE_ID`, `COST`, `ACCOUNT_ID`, `IS_DELETED`) VALUES
(1, 1, '0.00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ROLES`
--

CREATE TABLE IF NOT EXISTS `ROLES` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE` varchar(64) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ROLES`
--

INSERT INTO `ROLES` (`ROLE_ID`, `ROLE`, `ACCOUNT_ID`, `ITEM_ORDER`, `IS_DELETED`) VALUES
(1, 'Business Analyst', 1, NULL, 0),
(2, 'Product Owner', 1, NULL, 0),
(3, 'Scrum Master', 1, NULL, 0),
(4, 'Developer', 1, NULL, 0),
(5, 'Lead Developer', 1, NULL, 0),
(6, 'Customer Support', 1, NULL, 0),
(7, 'Business Support', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ROLE_SKILLS`
--

CREATE TABLE IF NOT EXISTS `ROLE_SKILLS` (
  `ROLE_ID` int(11) NOT NULL,
  `SKILL_ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ROLE_SKILLS`
--

INSERT INTO `ROLE_SKILLS` (`ROLE_ID`, `SKILL_ID`, `ACCOUNT_ID`, `IS_DELETED`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SCHEDULES`
--

CREATE TABLE IF NOT EXISTS `SCHEDULES` (
  `SCHEDULE_ITEM_ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `SCHEDULE_DATE` datetime NOT NULL,
  `CONSULTANT_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `PROJECT_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `ACTIVITY_ID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEDULES`
--

INSERT INTO `SCHEDULES` (`SCHEDULE_ITEM_ID`, `ACCOUNT_ID`, `SCHEDULE_DATE`, `CONSULTANT_ID`, `CUSTOMER_ID`, `PROJECT_ID`, `ROLE_ID`, `ACTIVITY_ID`) VALUES
(1, 1, '2015-10-25 00:00:00', 1, 1, 3, 2, 1),
(2, 1, '2015-10-25 00:00:00', 2, 2, 1, 2, 1),
(3, 1, '2015-10-25 00:00:00', 3, 3, 1, 5, 1),
(4, 1, '2015-10-25 00:00:00', 4, 4, 2, 5, 1),
(5, 1, '2015-10-25 00:00:00', 5, 5, 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SKILLS`
--

CREATE TABLE IF NOT EXISTS `SKILLS` (
  `SKILL_ID` int(11) NOT NULL,
  `SKILL` varchar(100) NOT NULL,
  `STACK_ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ITEM_ORDER_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SKILLS`
--

INSERT INTO `SKILLS` (`SKILL_ID`, `SKILL`, `STACK_ID`, `ACCOUNT_ID`, `ITEM_ORDER_ID`, `IS_DELETED`) VALUES
(1, 'Productivity Applications', 4, 1, 0, 0),
(2, 'Business Analysis', 4, 1, 0, 0),
(3, 'Project Management/Agile', 4, 1, 0, 0),
(4, 'HTML/CSS', 1, 1, 0, 0),
(5, 'ASP.NET', 1, 1, 0, 0),
(6, 'JavaScript', 1, 1, 0, 0),
(7, 'PHP', 1, 1, 0, 0),
(8, 'SQL', 4, 1, 0, 0),
(9, 'Native Mobile (iOS)', 2, 1, 0, 0),
(10, 'Native Mobile (Droid)', 2, 1, 0, 0),
(11, 'Cross-Platform Mobile (Xamarin)', 2, 1, 0, 0),
(12, 'C#', 3, 1, 0, 0),
(13, 'Java', 3, 1, 0, 0),
(14, 'Django', 1, 1, 0, 0),
(15, 'Ruby on Rails', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `STACKS`
--

CREATE TABLE IF NOT EXISTS `STACKS` (
  `STACK_ID` int(11) NOT NULL,
  `STACK` varchar(100) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ITEM_ORDER_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STACKS`
--

INSERT INTO `STACKS` (`STACK_ID`, `STACK`, `ACCOUNT_ID`, `ITEM_ORDER_ID`, `IS_DELETED`) VALUES
(1, 'Web', 1, 0, 0),
(2, 'Mobile', 1, 0, 0),
(3, 'Enterprise/Desktop', 1, 0, 0),
(4, 'n/a', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `TEAMS`
--

CREATE TABLE IF NOT EXISTS `TEAMS` (
  `TEAM_ID` int(11) NOT NULL,
  `TEAM` varchar(100) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TEAMS`
--

INSERT INTO `TEAMS` (`TEAM_ID`, `TEAM`, `ACCOUNT_ID`, `ITEM_ORDER`, `IS_DELETED`) VALUES
(1, 'Agile', 1, NULL, 0),
(2, 'Overseas', 1, NULL, 0),
(3, 'Operations', 1, NULL, 0),
(4, 'Technical', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE IF NOT EXISTS `USERS` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(64) NOT NULL,
  `PWORD` varchar(256) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `IS_DELETED` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`USER_ID`, `USERNAME`, `PWORD`, `ACCOUNT_ID`, `IS_DELETED`) VALUES
(1, 'myaccount', '$2y$10$d22Ks1I7gyvQ5tFLkvs/l.ZoEg3y0oMjHJ4woji/xkZEPOtP/iFii', 1, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_CONSULTANTS`
--
CREATE TABLE IF NOT EXISTS `V_CONSULTANTS` (
`CONSULTANT_ID` int(11)
,`ACCOUNT_ID` int(11)
,`SURNAME` varchar(64)
,`FORENAMES` varchar(64)
,`TEAM_ID` int(11)
,`TEAM` varchar(100)
,`SALARY` decimal(9,2)
,`POSTCODE` varchar(8)
,`IS_DELETED` smallint(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_SCHEDULES`
--
CREATE TABLE IF NOT EXISTS `V_SCHEDULES` (
`SCHEDULE_ITEM_ID` int(11)
,`SCHEDULE_DATE` datetime
,`CUSTOMER` varchar(100)
,`CONSULTANT` varchar(129)
,`ACTIVITY` varchar(100)
,`ROLE` varchar(64)
,`ACCOUNT_ID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_SKILLS`
--
CREATE TABLE IF NOT EXISTS `V_SKILLS` (
`SKILL_ID` int(11)
,`SKILL` varchar(100)
,`STACK` varchar(100)
,`ACCOUNT_ID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_USER_ACCOUNTS`
--
CREATE TABLE IF NOT EXISTS `V_USER_ACCOUNTS` (
`ACCOUNT_ID` int(11)
,`ACCOUNT_NAME` varchar(64)
,`USERNAME` varchar(64)
,`PWORD` varchar(256)
,`IS_DELETED` smallint(6)
);

-- --------------------------------------------------------

--
-- Structure for view `V_CONSULTANTS`
--
DROP TABLE IF EXISTS `V_CONSULTANTS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`plantrix_admin`@`%` SQL SECURITY DEFINER VIEW `V_CONSULTANTS` AS select `A`.`CONSULTANT_ID` AS `CONSULTANT_ID`,`A`.`ACCOUNT_ID` AS `ACCOUNT_ID`,`A`.`SURNAME` AS `SURNAME`,`A`.`FORENAMES` AS `FORENAMES`,`A`.`TEAM_ID` AS `TEAM_ID`,`B`.`TEAM` AS `TEAM`,`A`.`SALARY` AS `SALARY`,`A`.`POSTCODE` AS `POSTCODE`,`A`.`IS_DELETED` AS `IS_DELETED` from (`CONSULTANTS` `A` join `TEAMS` `B` on((`A`.`TEAM_ID` = `B`.`TEAM_ID`)));

-- --------------------------------------------------------

--
-- Structure for view `V_SCHEDULES`
--
DROP TABLE IF EXISTS `V_SCHEDULES`;

CREATE ALGORITHM=UNDEFINED DEFINER=`plantrix_admin`@`%` SQL SECURITY DEFINER VIEW `V_SCHEDULES` AS select `A`.`SCHEDULE_ITEM_ID` AS `SCHEDULE_ITEM_ID`,`A`.`SCHEDULE_DATE` AS `SCHEDULE_DATE`,`D`.`CUSTOMER` AS `CUSTOMER`,concat(`B`.`FORENAMES`,' ',`B`.`SURNAME`) AS `CONSULTANT`,`C`.`ACTIVITY` AS `ACTIVITY`,`E`.`ROLE` AS `ROLE`,`A`.`ACCOUNT_ID` AS `ACCOUNT_ID` from ((((`SCHEDULES` `A` join `CONSULTANTS` `B` on((`A`.`CONSULTANT_ID` = `B`.`CONSULTANT_ID`))) join `ACTIVITIES` `C` on((`A`.`ACTIVITY_ID` = `C`.`ACTIVITY_ID`))) join `CUSTOMERS` `D` on((`A`.`CUSTOMER_ID` = `D`.`CUSTOMER_ID`))) join `ROLES` `E` on((`A`.`ROLE_ID` = `E`.`ROLE_ID`)));

-- --------------------------------------------------------

--
-- Structure for view `V_SKILLS`
--
DROP TABLE IF EXISTS `V_SKILLS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`plantrix_admin`@`%` SQL SECURITY DEFINER VIEW `V_SKILLS` AS select `A`.`SKILL_ID` AS `SKILL_ID`,`A`.`SKILL` AS `SKILL`,`B`.`STACK` AS `STACK`,`A`.`ACCOUNT_ID` AS `ACCOUNT_ID` from (`SKILLS` `A` join `STACKS` `B` on((`A`.`STACK_ID` = `B`.`STACK_ID`)));

-- --------------------------------------------------------

--
-- Structure for view `V_USER_ACCOUNTS`
--
DROP TABLE IF EXISTS `V_USER_ACCOUNTS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`plantrix_admin`@`%` SQL SECURITY DEFINER VIEW `V_USER_ACCOUNTS` AS select `A`.`ACCOUNT_ID` AS `ACCOUNT_ID`,`A`.`ACCOUNT_NAME` AS `ACCOUNT_NAME`,`B`.`USERNAME` AS `USERNAME`,`B`.`PWORD` AS `PWORD`,`A`.`IS_DELETED` AS `IS_DELETED` from (`ACCOUNTS` `A` join `USERS` `B` on((`A`.`ACCOUNT_ID` = `B`.`ACCOUNT_ID`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ACCOUNTS`
--
ALTER TABLE `ACCOUNTS`
  ADD PRIMARY KEY (`ACCOUNT_ID`),
  ADD UNIQUE KEY `ACCOUNT_NAME` (`ACCOUNT_NAME`);

--
-- Indexes for table `ACTIVITIES`
--
ALTER TABLE `ACTIVITIES`
  ADD PRIMARY KEY (`ACTIVITY_ID`),
  ADD UNIQUE KEY `ACTIVITY` (`ACTIVITY`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `CONSULTANTS`
--
ALTER TABLE `CONSULTANTS`
  ADD PRIMARY KEY (`CONSULTANT_ID`),
  ADD KEY `TEAM_ID` (`TEAM_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `CONSULTANTS_SKILLS`
--
ALTER TABLE `CONSULTANTS_SKILLS`
  ADD PRIMARY KEY (`CONSULTANT_ID`,`SKILL_ID`),
  ADD KEY `SKILL_ID` (`SKILL_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `CUSTOMERS`
--
ALTER TABLE `CUSTOMERS`
  ADD PRIMARY KEY (`CUSTOMER_ID`),
  ADD UNIQUE KEY `CUSTOMER` (`CUSTOMER`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `CUSTOMERS_PROJECTS`
--
ALTER TABLE `CUSTOMERS_PROJECTS`
  ADD PRIMARY KEY (`CUSTOMER_ID`,`PROJECT_ID`),
  ADD KEY `PROJECT_ID` (`PROJECT_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `PROJECTS`
--
ALTER TABLE `PROJECTS`
  ADD PRIMARY KEY (`PROJECT_ID`),
  ADD UNIQUE KEY `PROJECT` (`PROJECT`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `PROJECT_LOCATIONS`
--
ALTER TABLE `PROJECT_LOCATIONS`
  ADD PRIMARY KEY (`LOCATION_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `PROJECT_ID` (`PROJECT_ID`);

--
-- Indexes for table `PROJECT_ROLES`
--
ALTER TABLE `PROJECT_ROLES`
  ADD PRIMARY KEY (`PROJECT_ID`,`ROLE_ID`),
  ADD KEY `ROLE_ID` (`ROLE_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `ROLES`
--
ALTER TABLE `ROLES`
  ADD PRIMARY KEY (`ROLE_ID`),
  ADD UNIQUE KEY `ROLE` (`ROLE`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `ROLE_SKILLS`
--
ALTER TABLE `ROLE_SKILLS`
  ADD PRIMARY KEY (`ROLE_ID`,`SKILL_ID`),
  ADD KEY `SKILL_ID` (`SKILL_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `SCHEDULES`
--
ALTER TABLE `SCHEDULES`
  ADD PRIMARY KEY (`SCHEDULE_ITEM_ID`),
  ADD UNIQUE KEY `SCHEDULE_DATE` (`SCHEDULE_DATE`,`CONSULTANT_ID`),
  ADD KEY `ACTIVITY_ID` (`ACTIVITY_ID`),
  ADD KEY `CONSULTANT_ID` (`CONSULTANT_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `PROJECT_ID` (`PROJECT_ID`),
  ADD KEY `ROLE_ID` (`ROLE_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `SKILLS`
--
ALTER TABLE `SKILLS`
  ADD PRIMARY KEY (`SKILL_ID`),
  ADD UNIQUE KEY `SKILL` (`SKILL`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `STACK_ID` (`STACK_ID`);

--
-- Indexes for table `STACKS`
--
ALTER TABLE `STACKS`
  ADD PRIMARY KEY (`STACK_ID`),
  ADD UNIQUE KEY `STACK` (`STACK`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `TEAMS`
--
ALTER TABLE `TEAMS`
  ADD PRIMARY KEY (`TEAM_ID`),
  ADD UNIQUE KEY `TEAM` (`TEAM`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`USER_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ACTIVITIES`
--
ALTER TABLE `ACTIVITIES`
  MODIFY `ACTIVITY_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `CONSULTANTS`
--
ALTER TABLE `CONSULTANTS`
  MODIFY `CONSULTANT_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `CUSTOMERS`
--
ALTER TABLE `CUSTOMERS`
  MODIFY `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `PROJECTS`
--
ALTER TABLE `PROJECTS`
  MODIFY `PROJECT_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `PROJECT_LOCATIONS`
--
ALTER TABLE `PROJECT_LOCATIONS`
  MODIFY `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ROLES`
--
ALTER TABLE `ROLES`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `SCHEDULES`
--
ALTER TABLE `SCHEDULES`
  MODIFY `SCHEDULE_ITEM_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `SKILLS`
--
ALTER TABLE `SKILLS`
  MODIFY `SKILL_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `STACKS`
--
ALTER TABLE `STACKS`
  MODIFY `STACK_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `TEAMS`
--
ALTER TABLE `TEAMS`
  MODIFY `TEAM_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ACTIVITIES`
--
ALTER TABLE `ACTIVITIES`
  ADD CONSTRAINT `ACTIVITIES_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `CONSULTANTS`
--
ALTER TABLE `CONSULTANTS`
  ADD CONSTRAINT `CONSULTANTS_ibfk_1` FOREIGN KEY (`TEAM_ID`) REFERENCES `TEAMS` (`TEAM_ID`),
  ADD CONSTRAINT `CONSULTANTS_ibfk_2` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `CONSULTANTS_SKILLS`
--
ALTER TABLE `CONSULTANTS_SKILLS`
  ADD CONSTRAINT `CONSULTANTS_SKILLS_ibfk_1` FOREIGN KEY (`CONSULTANT_ID`) REFERENCES `CONSULTANTS` (`CONSULTANT_ID`),
  ADD CONSTRAINT `CONSULTANTS_SKILLS_ibfk_2` FOREIGN KEY (`SKILL_ID`) REFERENCES `SKILLS` (`SKILL_ID`),
  ADD CONSTRAINT `CONSULTANTS_SKILLS_ibfk_3` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `CUSTOMERS`
--
ALTER TABLE `CUSTOMERS`
  ADD CONSTRAINT `CUSTOMERS_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `CUSTOMERS_PROJECTS`
--
ALTER TABLE `CUSTOMERS_PROJECTS`
  ADD CONSTRAINT `CUSTOMERS_PROJECTS_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMERS` (`CUSTOMER_ID`),
  ADD CONSTRAINT `CUSTOMERS_PROJECTS_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`PROJECT_ID`),
  ADD CONSTRAINT `CUSTOMERS_PROJECTS_ibfk_3` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `PROJECTS`
--
ALTER TABLE `PROJECTS`
  ADD CONSTRAINT `PROJECTS_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `PROJECT_LOCATIONS`
--
ALTER TABLE `PROJECT_LOCATIONS`
  ADD CONSTRAINT `PROJECT_LOCATIONS_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`),
  ADD CONSTRAINT `PROJECT_LOCATIONS_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`PROJECT_ID`);

--
-- Constraints for table `PROJECT_ROLES`
--
ALTER TABLE `PROJECT_ROLES`
  ADD CONSTRAINT `PROJECT_ROLES_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`PROJECT_ID`),
  ADD CONSTRAINT `PROJECT_ROLES_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ROLE_ID`),
  ADD CONSTRAINT `PROJECT_ROLES_ibfk_3` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `ROLES`
--
ALTER TABLE `ROLES`
  ADD CONSTRAINT `ROLES_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `ROLE_SKILLS`
--
ALTER TABLE `ROLE_SKILLS`
  ADD CONSTRAINT `ROLE_SKILLS_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ROLE_ID`),
  ADD CONSTRAINT `ROLE_SKILLS_ibfk_2` FOREIGN KEY (`SKILL_ID`) REFERENCES `SKILLS` (`SKILL_ID`),
  ADD CONSTRAINT `ROLE_SKILLS_ibfk_3` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `SCHEDULES`
--
ALTER TABLE `SCHEDULES`
  ADD CONSTRAINT `SCHEDULES_ibfk_1` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `ACTIVITIES` (`ACTIVITY_ID`),
  ADD CONSTRAINT `SCHEDULES_ibfk_2` FOREIGN KEY (`CONSULTANT_ID`) REFERENCES `CONSULTANTS` (`CONSULTANT_ID`),
  ADD CONSTRAINT `SCHEDULES_ibfk_3` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMERS` (`CUSTOMER_ID`),
  ADD CONSTRAINT `SCHEDULES_ibfk_4` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`PROJECT_ID`),
  ADD CONSTRAINT `SCHEDULES_ibfk_5` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ROLE_ID`),
  ADD CONSTRAINT `SCHEDULES_ibfk_6` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `SKILLS`
--
ALTER TABLE `SKILLS`
  ADD CONSTRAINT `SKILLS_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`),
  ADD CONSTRAINT `SKILLS_ibfk_2` FOREIGN KEY (`STACK_ID`) REFERENCES `STACKS` (`STACK_ID`);

--
-- Constraints for table `STACKS`
--
ALTER TABLE `STACKS`
  ADD CONSTRAINT `STACKS_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `TEAMS`
--
ALTER TABLE `TEAMS`
  ADD CONSTRAINT `TEAMS_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

--
-- Constraints for table `USERS`
--
ALTER TABLE `USERS`
  ADD CONSTRAINT `USERS_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS` (`ACCOUNT_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
