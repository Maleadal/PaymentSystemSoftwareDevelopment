-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 05:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sd_payment_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_key`
--

INSERT INTO `api_key` (`key`) VALUES
('4ce6ac3d-326e-4643-8793-b6604ed45be5');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `last_name`, `first_name`, `middle_name`, `address`) VALUES
(5, 'Penales', 'John Mark', 'P', 'PSC 4304  Box 6580\rAPO AE 59131'),
(6, 'Luke', 'Brogan', 'F', '052 Rush Locks\r\nWest Joseph  ND 82829'),
(7, 'Mordecai', 'Tom', 'C', '382 Johnson Underpass\r\nFuentesborough  SC 06870'),
(8, 'Ricky', 'Arnold', 'F', '0583 Harris Tunnel Apt. 631\r\nBrandiberg  ID 73193'),
(9, 'Garrison', 'Justin', 'F', '069 Jasmine Viaduct\r\nAlbertmouth  MA 61232'),
(10, 'Ayden', 'Castor', 'R', '77298 Brendan Plaza\r\nAdamview  NJ 95920'),
(11, 'Brayan', 'Fernando', 'P', '88976 Andrew Isle Apt. 443\r\nNorth Nicholas  MN 80064'),
(12, 'Torin', 'Lochlan', 'W', '37541 Wise Station Apt. 222\r\nSouth Kyleview  AL 11999'),
(13, 'Dennis', 'Terrance', 'I', '0355 Manning Bypass\r\nWest John  NY 91866'),
(14, 'Jevan', 'Merick', 'E', '0155 Christopher Loop Apt. 893\r\nNicholsburgh  NC 45267'),
(15, 'Manuel', 'Jedidiah', 'S', '2760 Jennifer Pass\r\nEast Jeffreystad  VT 92930'),
(16, 'Tracey', 'Leonard', 'A', '4801 Yang Wall Suite 170\r\nNew Jonathanmouth  CO 89390'),
(17, 'Gordon', 'Reilly', 'H', 'USNV Thompson\r\nFPO AP 59129'),
(18, 'Aron', 'Jordy', 'G', '1341 Debra Stream Suite 482\r\nTurnerbury  MP 80513'),
(19, 'Lonnie', 'Stan', 'Q', '35646 Chavez Mountain Apt. 153\r\nHaasville  TX 28606'),
(20, 'Zeke', 'Kurt', 'K', '391 Wilcox Ramp Apt. 619\r\nOrtizchester  VI 31593'),
(21, 'Dewey', 'Felix', 'J', '19023 Gutierrez Isle Suite 154\r\nPort Anthony  AK 20108'),
(22, 'Landen', 'Palmer', 'O', '284 Clark Alley\r\nHughesside  PW 46405'),
(23, 'Les', 'Cyrus', 'R', '1719 Nathan Key\r\nDanielton  SC 61467'),
(24, 'Nestor', 'Karl', 'H', '57432 Lori Rapid Apt. 864\r\nSouth Katrina  FM 43429'),
(25, 'Fraser', 'Aron', 'C', '3777 Holder Spur Suite 228\r\nSouth Janetside  OK 85358'),
(26, 'Knox', 'Bret', 'F', '742 Wilson Shoal\r\nDanielleburgh  PW 41239'),
(27, 'Mat', 'Kurt', 'F', '52800 Barnett Street\r\nEast Evan  AZ 38492'),
(28, 'Emmanuel', 'Jeffry', 'C', 'USNS Carson\r\nFPO AP 64681'),
(29, 'Edwin', 'Merick', 'A', '9089 Cardenas Motorway Suite 481\r\nMonicaside  ME 18370'),
(30, 'Prince', 'Graeme', 'I', '281 Larry Expressway Suite 008\r\nKrauseport  SC 83741'),
(31, 'Jarod', 'Zain', 'V', '6332 Alyssa Burgs Apt. 931\r\nWest Davidland  WY 11189'),
(32, 'Matt', 'Waylon', 'G', '5725 Caitlin Rue Suite 035\r\nLake Yvonneside  CO 98210'),
(33, 'Raj', 'Elmer', 'K', 'PSC 9435  Box 4299\r\nAPO AE 38380'),
(34, 'Mikey', 'Enoch', 'Y', '445 Rebecca Road\r\nPortermouth  PR 30390'),
(35, 'Marcus', 'Dakota', 'V', '69989 Kelly Groves\r\nDavidside  IN 82789'),
(36, 'Moe', 'Keaton', 'C', '38835 Chad Ridges\r\nLake Garrett  WY 99929'),
(37, 'Luis', 'Jacoby', 'X', '752 Ryan Divide\r\nTaraborough  CT 31698'),
(38, 'Elmer', 'Willard', 'Y', '098 Miller Drives\r\nPort Michaelstad  FL 60855'),
(39, 'Dashawn', 'Fernando', 'N', 'Unit 8643 Box 2604\r\nDPO AA 12784'),
(40, 'Dwight', 'Alfie', 'A', '5639 Johnson Divide\r\nValenciafurt  ND 45497'),
(41, 'Cory', 'Thaddeus', 'S', '40560 Emily Valley Apt. 225\r\nNorth Michele  MO 38549'),
(42, 'Kedrick', 'Soren', 'L', '35459 Melissa View\r\nLake Andreborough  NE 68048'),
(43, 'Kyan', 'Channing', 'U', '6703 Morris Expressway\r\nMatthewstad  VI 45017'),
(44, 'Slade', 'Godric', 'O', '66327 Gibson Port\r\nJamesfort  NJ 95163'),
(45, 'Miller', 'Umar', 'R', '08232 Johnson Tunnel Suite 894\r\nNorth Timothy  MP 72581'),
(46, 'Malachi', 'Marcel', 'K', '97228 Robert Stream\r\nDarrenside  KY 70281'),
(47, 'Isaiah', 'Daniel', 'S', '623 Cody Vista\r\nLake Mark  ME 84972'),
(48, 'Percy', 'Clayton', 'J', 'PSC 7051  Box 3708\r\nAPO AA 26184'),
(49, 'Steve', 'Abraham', 'B', '033 Ward Radial\r\nSouth Davidfort  AZ 82373'),
(50, 'Rudolph', 'Julio', 'T', '25005 Stein Harbor\r\nLake Alexandramouth  NC 81534'),
(51, 'Forest', 'Jon', 'O', '2174 Kelly Road\r\nNew Michellemouth  PA 01456'),
(52, 'Sterling', 'Chase', 'L', '7561 Briggs Drives\r\nSouth Jenniferstad  OH 59597'),
(53, 'Jason', 'Rian', 'B', '900 Hamilton Freeway\r\nLaurenview  GA 94788'),
(54, 'Delbert', 'Jerome', 'K', '4104 Davis Meadow Suite 667\r\nEast Michelleshire  PR 73120'),
(55, 'Brod', 'Quinton', 'M', '561 Richard Trafficway Suite 208\r\nPittsberg  ME 75754'),
(56, 'Ricky', 'Ray', 'E', '552 Ana Fall\r\nPort Carlville  AL 06335'),
(57, 'Douglas', 'Carsen', 'D', '276 Williams Meadow\r\nMichaelton  WI 17525'),
(58, 'Ty', 'Fabian', 'W', '9244 Rodney Shoals\r\nLake Michelle  KY 23851'),
(59, 'Benjamin', 'Scot', 'P', '8949 Darrell Oval\r\nMillerland  MD 76721'),
(60, 'Merick', 'Kerry', 'C', '938 Hill Drive Suite 869\r\nPort Javiershire  CT 99517'),
(61, 'Wilbert', 'Bruno', 'P', '326 Peter Plains\r\nJoshualand  TX 76590'),
(62, 'Angus', 'Humphrey', 'L', '309 Harrison Stravenue\r\nKimville  WA 74790'),
(63, 'James', 'Josue', 'J', '78345 Jones Drives Suite 963\r\nErinmouth  NV 43717'),
(64, 'Heath', 'Christian', 'T', '427 Glenn Terrace Apt. 273\r\nJohnhaven  NJ 87200'),
(65, 'Jose', 'Nico', 'S', '538 Benjamin Island\r\nMargarettown  CA 08827'),
(66, 'Terrance', 'Rudolph', 'O', '3873 Martin Spur\r\nLake Michelleville  WA 85098'),
(67, 'Nikolas', 'Ezekiel', 'N', '9055 Hendrix Mount\r\nWhiteville  NM 93692'),
(68, 'Tex', 'Nicolas', 'M', '8328 Glover Mountains Apt. 216\r\nRachelville  PW 09826'),
(69, 'Sandy', 'Owen', 'Z', '021 Mark Plains\r\nDoyleport  PA 20009'),
(70, 'Andres', 'Edwin', 'G', '80208 Harvey Road\r\nMelissamouth  UT 63044'),
(71, 'Piers', 'Austen', 'X', '0300 Reynolds Trail\r\nKatherineberg  NV 06016'),
(72, 'Ronnie', 'Gil', 'C', 'PSC 8849  Box 2362\r\nAPO AE 91613'),
(73, 'Scottie', 'Kai', 'G', '566 Eric Ports Suite 837\r\nPort John  PW 06447'),
(74, 'Ali', 'Fernand', 'W', '318 Torres Estates Suite 000\r\nNorth Martinchester  CO 36548'),
(75, 'Angel', 'Tremaine', 'R', '79223 Michael Road Suite 192\r\nRoberthaven  MO 54318'),
(76, 'Colin', 'Tray', 'P', '49682 Newman Point Apt. 544\r\nDixonhaven  AK 41766'),
(77, 'Porter', 'Paddy', 'V', '3781 Jonathan Summit\r\nNew Laurie  AL 91999'),
(78, 'Murray', 'Rio', 'V', '33901 Karen Summit Apt. 713\r\nNew Pamela  GA 45844'),
(79, 'Raj', 'Silas', 'T', '5520 Harper Prairie\r\nEast Marie  MA 01880'),
(80, 'Kayson', 'Al', 'C', '4785 Johnson Prairie\r\nAmybury  AS 87268'),
(81, 'Isiah', 'Khalid', 'D', '241 Angela Island Apt. 749\r\nSouth Christina  AL 30062'),
(82, 'Wilfred', 'Tremaine', 'L', 'PSC 2400  Box 3600\r\nAPO AP 54232'),
(83, 'Luca', 'Fred', 'H', '4620 Bennett Shoals\r\nPort Sharon  ME 83470'),
(84, 'Paolo', 'Felix', 'X', 'USNS Mosley\r\nFPO AA 99380'),
(85, 'Howard', 'Aswin', 'U', '5326 Megan Haven Apt. 583\r\nEast John  CT 48354'),
(86, 'Luther', 'Evelyn', 'H', '157 Sharon Lodge\r\nCalderonmouth  LA 41194'),
(87, 'Efren', 'Mohammed', 'O', '806 Anderson Rue\r\nWest Jenna  NM 08632'),
(88, 'Dylan', 'Tom', 'E', '978 Brown Wells Apt. 206\r\nIrwinstad  WI 91614'),
(89, 'Nils', 'Quentin', 'P', '38187 Jose Track Apt. 365\r\nAshleyburgh  VI 90325'),
(90, 'Edouard', 'Braxton', 'D', '6211 Davis Circles Apt. 781\r\nEast Alexandrachester  UT 35521'),
(91, 'Athan', 'Erick', 'N', '275 Luis Fall Suite 261\r\nNew Jacobton  AK 58455'),
(92, 'Cain', 'Nihal', 'X', '513 Jason Via Apt. 067\r\nWest Terrybury  NV 08732'),
(93, 'Gene', 'Brandon', 'S', '27137 Richard Ramp\r\nMichaelbury  CT 51969'),
(94, 'Samir', 'Abraham', 'T', '650 Melissa Canyon Suite 573\r\nWalkerfurt  HI 05682'),
(95, 'Niall', 'Carl', 'Y', '443 Lucas Ports\r\nNormantown  FM 12506'),
(96, 'Tam', 'Nelson', 'T', '08135 Mike Plaza\r\nLake Jessicaport  AZ 62844'),
(97, 'Tim', 'Jaxon', 'C', '1525 Joy Cape\r\nJohnnybury  WY 40171'),
(98, 'Dillon', 'Ieuan', 'M', '764 Ryan Overpass Apt. 224\r\nPort Josephborough  MH 01083'),
(99, 'Ren', 'Gregor', 'H', '829 Franklin Heights Suite 086\r\nBrandonton  IN 40573'),
(100, 'Devyn', 'Cletus', 'C', '67088 Brown Pass Suite 398\r\nPort Travis  NJ 64813'),
(104, 'Hard', 'Try', 'H', 'Harder ');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `value`) VALUES
(3, 'JPCS Contribution', 350);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `records_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
