-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 26, 2023 at 02:19 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nba`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `point_table` ()   BEGIN
	SELECT result,count(result)*3 as points,count(result) as 'WINS' from games group by(result) having result<>'NULL' ORDER BY `points` DESC; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `coach_id` int(4) NOT NULL,
  `t_id` char(3) DEFAULT NULL,
  `coach_name` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`coach_id`, `t_id`, `coach_name`, `position`) VALUES
(1001, 'LAL', 'DARVIN HAM', 'HEAD'),
(1002, 'BOS', 'JOE MAZZULLA', 'HEAD'),
(1003, 'GSW', 'STEVE KERR', 'HEAD'),
(1004, 'CLT', 'BIFF POGGI', 'HEAD'),
(1005, 'ATL', 'NATE McMILLAN', 'HEAD'),
(1006, 'SAC', 'MIKE BROWN', 'HEAD'),
(1007, 'ATL', 'MICHEAL IRR', 'STRENGTH'),
(1008, 'ATL', 'JOE PRUNTY', 'ASSISTANT'),
(1009, 'LAL', 'ED STREIT', 'STRENGTH'),
(1010, 'LAL', 'JORDON OTT', 'ASSISTANT'),
(1011, 'GSW', 'JACOB RUBIN', 'PLAYER DEVELOPMENT'),
(1012, 'GSW', 'BRUCE FRASER', 'ASSISTANT'),
(1013, 'CLT', 'ADAM LINENS', 'STRENGTH'),
(1014, 'CLT', 'MARLON GARNETT', 'ASSISTANT'),
(1015, 'BOS', 'TAYLOR YEATON', 'STRENGTH'),
(1016, 'BOS', 'AARON MILES', 'ASSISTANT'),
(1017, 'SAC', 'DEIVIDAS DULKYS', 'PLAYER DEVELOPMENT'),
(1018, 'SAC', 'JORDI FERNANDEZ', 'ASSISTANT');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `g_id` int(4) NOT NULL,
  `home_id` char(3) DEFAULT NULL,
  `away_id` char(3) DEFAULT NULL,
  `s_id` int(4) DEFAULT NULL,
  `result` char(3) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `spo_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`g_id`, `home_id`, `away_id`, `s_id`, `result`, `date`, `spo_id`) VALUES
(4001, 'ATL', 'BOS', 2005, 'ATL', '2023-01-01', 5001),
(4002, 'CLT', 'GSW', 2004, 'GSW', '2023-01-02', 5002),
(4003, 'LAL', 'SAC', 2001, 'LAL', '2023-01-03', 5005),
(4004, 'ATL', 'BOS', 2002, 'ATL', '2023-01-06', 5007),
(4005, 'CLT', 'GSW', 2003, 'CLT', '2023-01-07', 5003),
(4006, 'LAL', 'SAC', 2006, 'LAL', '2023-01-08', 5001),
(4007, 'ATL', 'CLT', 2005, 'CLT', '2023-01-10', 5004),
(4008, 'BOS', 'GSW', 2002, 'GSW', '2023-01-11', 5002),
(4009, 'LAL', 'ATL', 2001, 'ATL', '2023-01-13', 5006),
(4010, 'GSW', 'CLT', 2004, 'GSW', '2023-01-14', 5005),
(4011, 'LAL', 'BOS', 2002, 'LAL', '2023-01-15', 5002),
(4012, 'SAC', 'GSW', 2006, 'SAC', '2023-01-17', 5004),
(4013, 'LAL', 'CLT', 2001, 'CLT', '2023-01-18', 5007),
(4014, 'ATL', 'SAC', 2005, 'SAC', '2023-01-19', 5006),
(4015, 'GSW', 'CLT', 2003, 'GSW', '2023-01-22', 5006),
(4016, 'LAL', 'BOS', 2002, 'LAL', '2023-01-23', 5001),
(4017, 'ATL', 'SAC', 2006, 'ATL', '2023-01-24', 5004),
(4018, 'BOS', 'SAC', 2002, 'BOS', '2023-01-28', 5007),
(4019, 'SAC', 'GSW', 2006, 'GSW', '2023-01-25', 5004),
(4020, 'LAL', 'ATL', 2001, 'LAL', '2023-01-26', 5006),
(4033, 'BOS', 'LAL', 2004, 'LAL', '2023-01-11', 5005),
(4034, 'LAL', 'GSW', 2001, 'LAL', '2023-01-16', 5005),
(4038, 'LAL', 'CLT', 2003, 'LAL', '2023-01-31', 5003);

--
-- Triggers `games`
--
DELIMITER $$
CREATE TRIGGER `notsame` BEFORE UPDATE ON `games` FOR EACH ROW begin 
if(new.result <> (select home_id from games where new.g_id = games.g_id) and new.result <> (select away_id from games where new.g_id = games.g_id)) THEN
    set new.result='???';
end IF;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sponser`
--

CREATE TABLE `sponser` (
  `sponser_id` int(4) NOT NULL,
  `sponser_name` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponser`
--

INSERT INTO `sponser` (`sponser_id`, `sponser_name`, `type`, `budget`) VALUES
(5001, 'KIA', 'AUTOMOBILE', 100),
(5002, 'NIKE', 'SPORT', 100),
(5003, 'JORDON', 'SPORT', 70),
(5004, 'AT&T', 'COMMUNICATION', 75),
(5005, 'MOTOROLA', 'TELECOMMUNICATIONS', 100),
(5006, 'FEDEX', 'TRANSPORTATION', 90),
(5007, 'ADIDAS', 'SPORT', 100);

-- --------------------------------------------------------

--
-- Table structure for table `squad`
--

CREATE TABLE `squad` (
  `p_id` int(4) NOT NULL,
  `p_name` varchar(25) DEFAULT NULL,
  `head_c_id` int(4) DEFAULT NULL,
  `te_id` char(3) DEFAULT NULL,
  `games` int(11) DEFAULT NULL,
  `2p` float DEFAULT NULL,
  `3p` float DEFAULT NULL,
  `ast` float DEFAULT NULL,
  `pos` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `squad`
--

INSERT INTO `squad` (`p_id`, `p_name`, `head_c_id`, `te_id`, `games`, `2p`, `3p`, `ast`, `pos`) VALUES
(3001, 'DEJOUNTE MURRAY', 1005, 'ATL', 35, 6.2, 1.9, 6.1, 'SG'),
(3002, 'TRAE YOUNG', 1005, 'ATL', 36, 6.5, 2.2, 9.8, 'PG'),
(3003, 'DE\'ANDRE HUNTER', 1005, 'ATL', 32, 4.1, 1.5, 1.2, 'SF'),
(3004, 'JOHN COLLINS', 1005, 'ATL', 32, 4.4, 0.8, 1.3, 'PF'),
(3005, 'BOGDAN BOGDANOVIC', 1005, 'ATL', 17, 3, 3.1, 2.5, 'SG'),
(3006, 'JAYSON TATUM', 1002, 'BOS', 39, 6.9, 3.2, 4.2, 'PF'),
(3007, 'JAYLEN BROWN', 1002, 'BOS', 39, 7.6, 2.4, 3.3, 'SF'),
(3008, 'MARCUS SMART', 1002, 'BOS', 36, 2.2, 1.8, 7.2, 'PG'),
(3009, 'AL HORFORD', 1002, 'BOS', 32, 1.5, 2, 2.6, 'C'),
(3010, 'GRANT WILLIAMS', 1002, 'BOS', 40, 1.6, 1.6, 1.6, 'PF'),
(3011, 'STEPHEN CURRY', 1003, 'GSW', 27, 5, 5, 6.7, 'PG'),
(3012, 'KLAY THOMPSON', 1003, 'GSW', 32, 3.5, 4, 2.4, 'SG'),
(3013, 'ANDREW WIGGINS', 1003, 'GSW', 24, 4.3, 2.9, 2.2, 'SF'),
(3014, 'DRAYMOND GREEN', 1003, 'GSW', 37, 2.5, 0.6, 6.7, 'PF'),
(3015, 'JORDAN POOLE', 1003, 'GSW', 41, 4.5, 2.5, 4.5, 'SG'),
(3016, 'TERRY ROZIER', 1004, 'CLT', 32, 5.3, 2.6, 5.3, 'PG'),
(3017, 'LaMELO BALL', 1004, 'CLT', 18, 4.1, 4.2, 8.6, 'PG'),
(3018, 'GORDON HAYWARD', 1004, 'CLT', 21, 4, 1.1, 3.9, 'SF'),
(3019, 'KELLY OUBRE JR', 1004, 'CLT', 35, 5.2, 2.3, 1.2, 'SF'),
(3020, 'P.J WASHINGTON', 1004, 'CLT', 41, 3.8, 2, 2.3, 'PF'),
(3021, 'LEBRON JAMES', 1001, 'LAL', 31, 9.4, 2, 6.7, 'PF'),
(3022, 'ANTHONY DAVIS', 1001, 'LAL', 25, 9.8, 0.4, 2.6, 'c'),
(3023, 'LONNIE WALKER IV', 1001, 'LAL', 32, 3.3, 2.1, 1.4, 'SG'),
(3024, 'AUSTIN REAVES', 1001, 'LAL', 36, 2.2, 1.3, 2.2, 'SG'),
(3025, 'RUSSELL WESTBROOK', 1001, 'LAL', 38, 4.4, 4, 7.9, 'PG'),
(3026, 'DOMANTAS SABONIS', 1006, 'SAC', 38, 6.4, 0.5, 6.8, 'PF'),
(3027, 'De\'AARON FOX', 1006, 'SAC', 36, 7.2, 1.6, 6, 'PG'),
(3028, 'HARRISON BARNES', 1006, 'SAC', 39, 3.1, 1.4, 1.7, 'PF'),
(3029, 'KEVIN HUERTER', 1006, 'SAC', 38, 2.7, 3, 2.9, 'SG'),
(3030, 'KEEGAN MURRAY', 1006, 'SAC', 37, 1.9, 2.4, 0.9, 'SF');

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `stadium_id` int(4) NOT NULL,
  `stadium_name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`stadium_id`, `stadium_name`, `location`, `seats`) VALUES
(2001, 'CRYPTO.COM ARENA', 'LOS ANGELES', 20000),
(2002, 'TD GARDEN', 'MASSACHUSETTS', 19580),
(2003, 'CHASE CENTER', 'SAN FRANCISCO', 18064),
(2004, 'SPECTRUM CENTER', 'NORTH CAROLINA', 20200),
(2005, 'STATE FARM ARENA', 'ATLANTA GEORGIA', 21100),
(2006, 'GOLDEN 1 CENTER', 'CALIFORNIA', 17608);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` char(3) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `owner` varchar(200) DEFAULT NULL,
  `stad_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`, `owner`, `stad_id`) VALUES
('???', 'BAD VALUE', 'NBA', NULL),
('ATL', 'ATLANTA HAWKS', 'ANTHONY RESSLER', 2005),
('BOS', 'BOSTON CELTICS', 'BOSTON PARTNERS', 2002),
('CLT', 'CHARLOTTE HORNETS', 'MICHEAL JORDON', 2004),
('GSW', 'GOLDEN STATE WARRIORS', 'JOE LACOB', 2003),
('LAL', 'LOS ANGELES LAKERS', 'BUSS FAMILY', 2001),
('SAC', 'SACRAMENTO KINGS', 'VIVEK RANADIVE', 2006);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`) VALUES
(123, 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`coach_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`g_id`),
  ADD KEY `home_id` (`home_id`),
  ADD KEY `away_id` (`away_id`),
  ADD KEY `result` (`result`),
  ADD KEY `spo_id` (`spo_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `sponser`
--
ALTER TABLE `sponser`
  ADD PRIMARY KEY (`sponser_id`);

--
-- Indexes for table `squad`
--
ALTER TABLE `squad`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `te_id` (`te_id`),
  ADD KEY `head_c_id` (`head_c_id`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `stad_id` (`stad_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coach`
--
ALTER TABLE `coach`
  MODIFY `coach_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1025;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `g_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4039;

--
-- AUTO_INCREMENT for table `sponser`
--
ALTER TABLE `sponser`
  MODIFY `sponser_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5013;

--
-- AUTO_INCREMENT for table `squad`
--
ALTER TABLE `squad`
  MODIFY `p_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3034;

--
-- AUTO_INCREMENT for table `stadium`
--
ALTER TABLE `stadium`
  MODIFY `stadium_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2010;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coach`
--
ALTER TABLE `coach`
  ADD CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE;

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`home_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`away_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `games_ibfk_3` FOREIGN KEY (`s_id`) REFERENCES `stadium` (`stadium_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `games_ibfk_4` FOREIGN KEY (`result`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `games_ibfk_5` FOREIGN KEY (`spo_id`) REFERENCES `sponser` (`sponser_id`),
  ADD CONSTRAINT `games_ibfk_6` FOREIGN KEY (`spo_id`) REFERENCES `sponser` (`sponser_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `games_ibfk_7` FOREIGN KEY (`s_id`) REFERENCES `stadium` (`stadium_id`) ON DELETE CASCADE;

--
-- Constraints for table `squad`
--
ALTER TABLE `squad`
  ADD CONSTRAINT `squad_ibfk_2` FOREIGN KEY (`te_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `squad_ibfk_3` FOREIGN KEY (`head_c_id`) REFERENCES `coach` (`coach_id`) ON DELETE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`stad_id`) REFERENCES `stadium` (`stadium_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
