-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2015 at 11:28 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `asd`
--
--
-- Database: `eart`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblkomentari`
--

CREATE TABLE IF NOT EXISTS `tblkomentari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `autor` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `komentar` text COLLATE utf8_slovenian_ci NOT NULL,
  `datum` date NOT NULL,
  `novost` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novost` (`novost`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tblkomentari`
--

INSERT INTO `tblkomentari` (`id`, `email`, `autor`, `komentar`, `datum`, `novost`) VALUES
(6, 'xxx', 'zzz', 'aaa', '0000-00-00', 1),
(7, 'xxx', 'zzz', 'aaa', '0000-00-00', 1),
(8, 'sss', 'zzz', 'xxx', '0000-00-00', 1),
(10, 'sss', 'zzz', 'ssss', '0000-00-00', 1),
(11, '', '', '', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblkorisnici`
--

CREATE TABLE IF NOT EXISTS `tblkorisnici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `surname` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `username` varchar(25) COLLATE utf8_slovenian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_slovenian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tblkorisnici`
--

INSERT INTO `tblkorisnici` (`id`, `name`, `surname`, `username`, `password`, `email`) VALUES
(1, 'faruk', 'mustafic', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'fmustafic1@etf.unsa.ba'),
(4, 'xxx', 'yyyxxx', 'xamp123', '96e79218965eb72c92a549dd5a330112', 'fm@etf.unsa.ba'),
(5, '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', ''),
(6, 'xxxxxxxxxxxx', 'zzzzzzzzzzzzzz', 'almir', '47bce5c74f589f4867dbd57e9ca9f808', 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `tblnovosti`
--

CREATE TABLE IF NOT EXISTS `tblnovosti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autor` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `naslov` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `tekst` text COLLATE utf8_slovenian_ci NOT NULL,
  `detalji` text COLLATE utf8_slovenian_ci NOT NULL,
  `datum` date NOT NULL,
  `urlslike` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tblnovosti`
--

INSERT INTO `tblnovosti` (`id`, `autor`, `naslov`, `tekst`, `detalji`, `datum`, `urlslike`) VALUES
(1, 'Veca', 'Nova vijest', '   Sokantno otkrice mladog Dzafera.   xxx', '   Ne smijemo vam ni reci. xxx aaaaaaaaaaaaa ', '2015-05-25', 'http://stampasrbija.rs/artikli/TN_DEC0021.PNG'),
(16, 'admin', 'Nova vijest', ' Sokantno otkrice mladog Dzafera. ', ' Ne smijemo vam ni reci. ', '2015-05-28', 'http://stampasrbija.rs/artikli/TN_DEC0021.PNG');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblkomentari`
--
ALTER TABLE `tblkomentari`
  ADD CONSTRAINT `tblkomentari_ibfk_1` FOREIGN KEY (`novost`) REFERENCES `tblnovosti` (`id`);
--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `kartoni`
--

CREATE TABLE IF NOT EXISTS `kartoni` (
  `ID` int(11) NOT NULL,
  `ID_K` int(11) NOT NULL,
  `ID_D` int(11) NOT NULL,
  `ID_Pr` int(11) NOT NULL,
  `ID_E` int(11) NOT NULL,
  `ID_Ps` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Kartoni_Korisnici1_idx` (`ID_K`),
  KEY `fk_Kartoni_Radnici1_idx` (`ID_D`),
  KEY `fk_Kartoni_Radnici2_idx` (`ID_Pr`),
  KEY `fk_Kartoni_Radnici3_idx` (`ID_E`),
  KEY `fk_Kartoni_Radnici4_idx` (`ID_Ps`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE IF NOT EXISTS `korisnici` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(45) NOT NULL,
  `Prezime` varchar(45) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Lokacija_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Korisnici_Lokacija_idx` (`Lokacija_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lokacije`
--

CREATE TABLE IF NOT EXISTS `lokacije` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adresa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `radnici`
--

CREATE TABLE IF NOT EXISTS `radnici` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(45) DEFAULT NULL,
  `Prezime` varchar(45) DEFAULT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Opis` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rasporedi`
--

CREATE TABLE IF NOT EXISTS `rasporedi` (
  `ID` int(11) NOT NULL,
  `Dan` varchar(45) DEFAULT NULL,
  `Vrijeme` time DEFAULT NULL,
  `ID_R` int(11) NOT NULL,
  `ID_K` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Rasporedi_Radnici1_idx` (`ID_R`),
  KEY `fk_Rasporedi_Korisnici1_idx` (`ID_K`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status_d`
--

CREATE TABLE IF NOT EXISTS `status_d` (
  `ID` int(11) NOT NULL,
  `ID_K` int(11) NOT NULL,
  `ID_R` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Status_D_Korisnici1_idx` (`ID_K`),
  KEY `fk_Status_D_Radnici1_idx` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status_e`
--

CREATE TABLE IF NOT EXISTS `status_e` (
  `ID` int(11) NOT NULL,
  `ID_K` int(11) NOT NULL,
  `ID_R` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Status_E_Korisnici1_idx` (`ID_K`),
  KEY `fk_Status_E_Radnici1_idx` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status_pr`
--

CREATE TABLE IF NOT EXISTS `status_pr` (
  `ID` int(11) NOT NULL,
  `Status_Prcol` varchar(45) DEFAULT NULL,
  `ID_K` int(11) NOT NULL,
  `ID_R` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Status_Pr_Korisnici1_idx` (`ID_K`),
  KEY `fk_Status_Pr_Radnici1_idx` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status_ps`
--

CREATE TABLE IF NOT EXISTS `status_ps` (
  `ID` int(11) NOT NULL,
  `ID_K` int(11) NOT NULL,
  `ID_R` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Status_Ps_Korisnici1_idx` (`ID_K`),
  KEY `fk_Status_Ps_Radnici1_idx` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kartoni`
--
ALTER TABLE `kartoni`
  ADD CONSTRAINT `fk_Kartoni_Korisnici1` FOREIGN KEY (`ID_K`) REFERENCES `korisnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Kartoni_Radnici1` FOREIGN KEY (`ID_D`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Kartoni_Radnici2` FOREIGN KEY (`ID_Pr`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Kartoni_Radnici3` FOREIGN KEY (`ID_E`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Kartoni_Radnici4` FOREIGN KEY (`ID_Ps`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD CONSTRAINT `fk_Korisnici_Lokacija` FOREIGN KEY (`Lokacija_ID`) REFERENCES `lokacije` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rasporedi`
--
ALTER TABLE `rasporedi`
  ADD CONSTRAINT `fk_Rasporedi_Korisnici1` FOREIGN KEY (`ID_K`) REFERENCES `korisnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Rasporedi_Radnici1` FOREIGN KEY (`ID_R`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `status_d`
--
ALTER TABLE `status_d`
  ADD CONSTRAINT `fk_Status_D_Korisnici1` FOREIGN KEY (`ID_K`) REFERENCES `korisnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Status_D_Radnici1` FOREIGN KEY (`ID_R`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `status_e`
--
ALTER TABLE `status_e`
  ADD CONSTRAINT `fk_Status_E_Korisnici1` FOREIGN KEY (`ID_K`) REFERENCES `korisnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Status_E_Radnici1` FOREIGN KEY (`ID_R`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `status_pr`
--
ALTER TABLE `status_pr`
  ADD CONSTRAINT `fk_Status_Pr_Korisnici1` FOREIGN KEY (`ID_K`) REFERENCES `korisnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Status_Pr_Radnici1` FOREIGN KEY (`ID_R`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `status_ps`
--
ALTER TABLE `status_ps`
  ADD CONSTRAINT `fk_Status_Ps_Korisnici1` FOREIGN KEY (`ID_K`) REFERENCES `korisnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Status_Ps_Radnici1` FOREIGN KEY (`ID_R`) REFERENCES `radnici` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `test`
--
--
-- Database: `tetestsatastast`
--

-- --------------------------------------------------------

--
-- Table structure for table `asdasdsa`
--

CREATE TABLE IF NOT EXISTS `asdasdsa` (
  `asdasddddzz` int(11) NOT NULL,
  `asdasdddd` int(11) NOT NULL,
  `asdasdaaa` int(11) NOT NULL,
  `asdasdasdasda` int(11) NOT NULL,
  `asdasdsad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asdasdsa`
--

INSERT INTO `asdasdsa` (`asdasddddzz`, `asdasdddd`, `asdasdaaa`, `asdasdasdasda`, `asdasdsad`) VALUES
(1, 123, 1231234, 123, 1233),
(1, 123, 1231234, 123, 1233);
--
-- Database: `wt`
--

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vijest` int(11) NOT NULL,
  `tekst` text COLLATE utf8_slovenian_ci NOT NULL,
  `autor` varchar(20) COLLATE utf8_slovenian_ci NOT NULL,
  `vrijeme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vijest` (`vijest`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=948 ;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `vijest`, `tekst`, `autor`, `vrijeme`) VALUES
(1, 1, 'Ovo je tekst vezan za KomentarJedan i VijestJedan', 'AutorJedan', '2015-05-12 13:29:44'),
(2, 3, 'asdasd', 'lksdkdf', '2015-05-19 13:53:01'),
(3, 3, 'xxxxxxxx', 'lksdkdf', '2015-05-19 13:53:05'),
(4, 3, '', 'lksdkdf', '2015-05-19 13:53:07'),
(5, 3, '', 'lksdkdf', '2015-05-19 13:53:10'),
(6, 3, '', 'lksdkdf', '2015-05-19 13:53:50'),
(7, 3, '', 'lksdkdf', '2015-05-19 13:53:51'),
(8, 3, '', 'lksdkdf', '2015-05-19 13:53:51'),
(9, 3, '', 'lksdkdf', '2015-05-19 13:53:51'),
(10, 3, '', 'lksdkdf', '2015-05-19 13:53:51'),
(11, 3, '', 'lksdkdf', '2015-05-19 13:53:51'),
(12, 3, '', 'lksdkdf', '2015-05-19 13:53:52'),
(13, 3, 'xxxxxxx', 'lksdkdf', '2015-05-19 13:54:05'),
(14, 3, 'ifjgoidfjgoidfjgoifdgjfdoig', 'lksdkdf', '2015-05-19 13:54:13'),
(15, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:54:18'),
(16, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:20'),
(17, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:22'),
(18, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:22'),
(19, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:23'),
(20, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:23'),
(21, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:23'),
(22, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:23'),
(23, 3, 'zzzzzzzzz', 'lksdkdf', '2015-05-19 13:55:23'),
(24, 3, 'dasdasdsadsadsad', 'lksdkdf', '2015-05-19 13:55:30'),
(25, 3, 'dasdasdsadsadsad', 'lksdkdf', '2015-05-19 13:56:20'),
(26, 3, '', 'lksdkdf', '2015-05-19 13:56:21'),
(27, 3, 'sadasd', 'lksdkdf', '2015-05-19 13:56:24'),
(28, 3, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:27'),
(29, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:45'),
(30, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:45'),
(31, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:46'),
(32, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:46'),
(33, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:46'),
(34, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:46'),
(35, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:46'),
(36, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:46'),
(37, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:46'),
(38, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:47'),
(39, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:54'),
(40, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:54'),
(41, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:54'),
(42, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:55'),
(43, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:55'),
(44, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:55'),
(45, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:55'),
(46, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:55'),
(47, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:55'),
(48, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(49, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(50, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(51, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(52, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(53, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(54, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(55, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(56, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(57, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(58, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(59, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(60, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(61, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(62, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(63, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(64, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(65, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(66, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(67, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(68, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(69, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(70, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(71, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(72, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(73, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(74, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:56'),
(75, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(76, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(77, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(78, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(79, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(80, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(81, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(82, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(83, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:57'),
(84, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(85, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(86, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(87, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(88, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(89, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(90, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(91, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(92, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(93, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(94, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(95, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(96, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(97, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(98, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(99, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(100, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(101, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(102, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(103, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(104, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:58'),
(105, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(106, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(107, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(108, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(109, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(110, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(111, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(112, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(113, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(114, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(115, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(116, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(117, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(118, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(119, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(120, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(121, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(122, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(123, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(124, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(125, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(126, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(127, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(128, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(129, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(130, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(131, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(132, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(133, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(134, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(135, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(136, 1, 'xxxxx', 'lksdkdf', '2015-05-19 13:56:59'),
(137, 3, '', 'lksdkdf', '2015-05-19 13:59:39'),
(138, 3, '&lt;input type=&quot;text&quot; value=&quot;vvv&quot;&gt;', 'lksdkdf', '2015-05-19 13:59:59'),
(139, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:39'),
(140, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:42'),
(141, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(142, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(143, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(144, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(145, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(146, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(147, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(148, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(149, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:43'),
(150, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(151, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(152, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(153, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(154, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(155, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(156, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(157, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(158, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(159, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(160, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:44'),
(161, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(162, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(163, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(164, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(165, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(166, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(167, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(168, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(169, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(170, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(171, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(172, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(173, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(174, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(175, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(176, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(177, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(178, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(179, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(180, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(181, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(182, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(183, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(184, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(185, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(186, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(187, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(188, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:45'),
(189, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(190, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(191, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(192, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(193, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(194, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(195, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(196, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(197, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(198, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(199, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(200, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(201, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(202, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(203, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(204, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(205, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(206, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(207, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(208, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(209, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(210, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(211, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(212, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(213, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(214, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:46'),
(215, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(216, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(217, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(218, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(219, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(220, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(221, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(222, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(223, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(224, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(225, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:47'),
(226, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:49'),
(227, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:49'),
(228, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:49'),
(229, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:49'),
(230, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:49'),
(231, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(232, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(233, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(234, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(235, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(236, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(237, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(238, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(239, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(240, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(241, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(242, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(243, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(244, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(245, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(246, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(247, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(248, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(249, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(250, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(251, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(252, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(253, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(254, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(255, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:50'),
(256, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(257, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(258, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(259, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(260, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(261, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(262, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(263, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(264, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(265, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(266, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(267, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(268, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(269, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(270, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(271, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(272, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(273, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(274, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(275, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(276, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(277, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(278, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(279, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(280, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:51'),
(281, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(282, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(283, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(284, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(285, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(286, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(287, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(288, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(289, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(290, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(291, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(292, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(293, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(294, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(295, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(296, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(297, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(298, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(299, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(300, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(301, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(302, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(303, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(304, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(305, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(306, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(307, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(308, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:52'),
(309, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(310, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(311, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(312, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(313, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(314, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(315, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(316, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(317, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(318, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(319, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(320, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(321, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(322, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(323, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(324, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(325, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(326, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(327, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(328, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(329, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(330, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(331, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(332, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(333, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(334, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(335, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:53'),
(336, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(337, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(338, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(339, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(340, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(341, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(342, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(343, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(344, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(345, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(346, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(347, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(348, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(349, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(350, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(351, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(352, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(353, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(354, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(355, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:35:54'),
(356, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:03'),
(357, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(358, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(359, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(360, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(361, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(362, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(363, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(364, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(365, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(366, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(367, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(368, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(369, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(370, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(371, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(372, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(373, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(374, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(375, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(376, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(377, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(378, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(379, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(380, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:04'),
(381, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(382, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(383, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(384, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(385, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(386, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(387, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(388, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(389, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(390, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(391, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(392, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(393, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(394, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(395, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(396, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(397, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(398, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(399, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(400, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(401, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(402, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(403, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(404, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(405, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(406, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(407, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:05'),
(408, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(409, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(410, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(411, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(412, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(413, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(414, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(415, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(416, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(417, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(418, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(419, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(420, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(421, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(422, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(423, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(424, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(425, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(426, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(427, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(428, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(429, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(430, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(431, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(432, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(433, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(434, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(435, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(436, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:06'),
(437, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(438, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(439, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(440, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(441, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(442, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(443, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(444, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(445, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(446, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(447, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(448, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(449, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(450, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(451, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(452, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(453, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(454, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(455, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(456, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(457, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(458, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(459, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(460, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(461, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(462, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(463, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(464, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(465, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:07'),
(466, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(467, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(468, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(469, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(470, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(471, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(472, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(473, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(474, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(475, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:08'),
(476, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:14'),
(477, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:14'),
(478, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:14'),
(479, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:14'),
(480, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(481, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(482, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(483, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(484, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(485, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(486, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(487, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(488, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(489, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(490, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(491, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(492, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(493, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(494, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(495, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(496, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(497, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(498, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(499, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(500, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(501, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(502, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(503, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(504, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(505, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(506, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(507, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(508, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:15'),
(509, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:16'),
(510, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:16'),
(511, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:16'),
(512, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:16'),
(513, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:16'),
(514, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:16'),
(515, 1, 'asdasdasd', 'lksdkdf', '2015-05-19 14:36:16'),
(516, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:47'),
(517, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:49'),
(518, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:53'),
(519, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:53'),
(520, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:53'),
(521, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(522, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(523, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(524, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(525, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(526, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(527, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(528, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(529, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(530, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(531, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(532, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(533, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(534, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(535, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:54'),
(536, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(537, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(538, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(539, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(540, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(541, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(542, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(543, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(544, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(545, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(546, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(547, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(548, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(549, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(550, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(551, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(552, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(553, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:55'),
(554, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(555, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(556, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(557, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(558, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(559, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(560, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(561, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(562, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(563, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(564, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(565, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(566, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(567, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(568, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(569, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(570, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(571, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:56'),
(572, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(573, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(574, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(575, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(576, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(577, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(578, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(579, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(580, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(581, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(582, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(583, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(584, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(585, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(586, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(587, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(588, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:57'),
(589, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(590, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(591, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(592, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(593, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(594, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(595, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(596, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(597, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(598, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(599, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(600, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(601, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(602, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(603, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:58'),
(604, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(605, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(606, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(607, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(608, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(609, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(610, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(611, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(612, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(613, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(614, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(615, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(616, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(617, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(618, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(619, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(620, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(621, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(622, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(623, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:20:59'),
(624, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(625, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(626, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(627, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(628, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(629, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(630, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(631, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(632, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(633, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(634, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(635, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(636, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(637, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(638, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(639, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(640, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(641, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(642, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:00'),
(643, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(644, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(645, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(646, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(647, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(648, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(649, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(650, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(651, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(652, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(653, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(654, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(655, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(656, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(657, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(658, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(659, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(660, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(661, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:01'),
(662, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(663, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(664, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(665, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(666, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(667, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(668, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(669, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(670, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(671, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(672, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(673, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(674, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:02'),
(675, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:03'),
(676, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:03'),
(677, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:03'),
(678, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:03'),
(679, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:03'),
(680, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:03'),
(681, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:03'),
(682, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(683, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(684, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(685, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(686, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(687, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(688, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(689, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(690, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(691, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(692, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(693, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(694, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(695, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:04'),
(696, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(697, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(698, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(699, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(700, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(701, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(702, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(703, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(704, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(705, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(706, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(707, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(708, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(709, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(710, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(711, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(712, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:05'),
(713, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(714, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(715, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(716, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(717, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(718, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(719, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(720, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(721, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(722, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(723, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(724, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(725, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(726, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(727, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(728, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(729, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:06'),
(730, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:07'),
(731, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:10'),
(732, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:10'),
(733, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:10'),
(734, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:10'),
(735, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(736, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(737, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(738, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(739, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(740, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(741, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(742, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(743, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(744, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(745, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(746, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(747, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(748, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(749, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(750, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(751, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:11'),
(752, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(753, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(754, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(755, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(756, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(757, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(758, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(759, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(760, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(761, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(762, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(763, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(764, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(765, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(766, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(767, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(768, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:12'),
(769, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(770, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(771, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(772, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(773, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(774, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(775, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(776, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(777, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(778, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(779, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(780, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(781, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(782, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(783, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(784, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(785, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(786, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:13'),
(787, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(788, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(789, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(790, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(791, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(792, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(793, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(794, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(795, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(796, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(797, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(798, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(799, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(800, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(801, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(802, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:14'),
(803, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(804, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(805, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(806, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(807, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(808, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(809, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(810, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(811, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(812, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(813, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(814, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(815, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(816, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(817, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(818, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(819, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(820, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(821, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:15'),
(822, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(823, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(824, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(825, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(826, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(827, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(828, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(829, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(830, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(831, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(832, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(833, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(834, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(835, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(836, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(837, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(838, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(839, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(840, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:16'),
(841, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(842, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(843, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(844, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(845, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(846, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(847, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(848, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(849, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(850, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(851, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(852, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(853, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(854, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(855, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(856, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(857, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(858, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(859, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(860, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:17'),
(861, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(862, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(863, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(864, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(865, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(866, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(867, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(868, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(869, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(870, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(871, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18');
INSERT INTO `komentar` (`id`, `vijest`, `tekst`, `autor`, `vrijeme`) VALUES
(872, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(873, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(874, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(875, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(876, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(877, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:18'),
(878, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:19'),
(879, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:19'),
(880, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:19'),
(881, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:19'),
(882, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:19'),
(883, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:19'),
(884, 1, 'oidfugifohjgfoih', 'lksdkdf', '2015-05-26 13:21:19'),
(885, 1, 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzv', 'lksdkdf', '2015-05-26 13:22:47'),
(886, 1, 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzv', 'lksdkdf', '2015-05-26 13:22:53'),
(887, 1, '', 'lksdkdf', '2015-05-26 13:23:07'),
(888, 1, 'zz', 'lksdkdf', '2015-05-26 13:23:12'),
(889, 1, 'zz', 'lksdkdf', '2015-05-26 13:35:30'),
(890, 1, 'zz', 'lksdkdf', '2015-05-26 13:35:42'),
(891, 1, 'zz', 'lksdkdf', '2015-05-26 13:36:42'),
(892, 1, 'zz', 'lksdkdf', '2015-05-26 13:37:51'),
(893, 1, 'zz', 'lksdkdf', '2015-05-26 13:37:57'),
(894, 1, 'zz', 'lksdkdf', '2015-05-26 13:38:53'),
(895, 1, 'zz', 'lksdkdf', '2015-05-26 13:39:08'),
(896, 1, 'zz', 'lksdkdf', '2015-05-26 13:39:18'),
(897, 1, 'zz', 'lksdkdf', '2015-05-26 13:39:56'),
(898, 1, 'zz', 'lksdkdf', '2015-05-26 13:40:27'),
(899, 1, 'zz', 'lksdkdf', '2015-05-26 13:40:34'),
(900, 1, 'zz', 'lksdkdf', '2015-05-26 13:40:40'),
(901, 1, 'zz', 'lksdkdf', '2015-05-26 13:41:06'),
(902, 1, 'zz', 'lksdkdf', '2015-05-26 13:41:19'),
(903, 1, 'zz', 'lksdkdf', '2015-05-26 13:44:16'),
(904, 1, 'zz', 'lksdkdf', '2015-05-26 13:45:17'),
(905, 1, 'zz', 'lksdkdf', '2015-05-26 13:45:40'),
(906, 1, 'zz', 'lksdkdf', '2015-05-26 13:48:03'),
(907, 1, 'zz', 'lksdkdf', '2015-05-26 13:48:20'),
(908, 1, 'zz', 'lksdkdf', '2015-05-26 13:49:25'),
(909, 1, 'zz', 'lksdkdf', '2015-05-26 13:49:47'),
(910, 1, 'zz', 'lksdkdf', '2015-05-26 13:51:01'),
(911, 1, 'zz', 'lksdkdf', '2015-05-26 13:51:16'),
(912, 1, 'zz', 'lksdkdf', '2015-05-26 13:51:25'),
(913, 1, 'zz', 'lksdkdf', '2015-05-26 13:51:34'),
(914, 1, 'zz', 'lksdkdf', '2015-05-26 13:51:57'),
(915, 1, 'zz', 'lksdkdf', '2015-05-26 13:52:12'),
(916, 1, 'zz', 'lksdkdf', '2015-05-26 13:52:25'),
(917, 1, 'zz', 'lksdkdf', '2015-05-26 13:52:37'),
(918, 1, 'zz', 'lksdkdf', '2015-05-26 13:52:44'),
(919, 1, 'zz', 'lksdkdf', '2015-05-26 13:52:56'),
(920, 1, 'zz', 'lksdkdf', '2015-05-26 13:53:07'),
(921, 1, 'zz', 'lksdkdf', '2015-05-26 13:53:15'),
(922, 1, 'zz', 'lksdkdf', '2015-05-26 13:53:24'),
(923, 1, 'zz', 'lksdkdf', '2015-05-26 13:53:37'),
(924, 1, 'zz', 'lksdkdf', '2015-05-26 13:53:44'),
(925, 1, 'zz', 'lksdkdf', '2015-05-26 13:54:24'),
(926, 1, 'zz', 'lksdkdf', '2015-05-26 13:55:03'),
(927, 1, 'zz', 'lksdkdf', '2015-05-26 13:55:08'),
(928, 1, 'zz', 'lksdkdf', '2015-05-26 13:55:28'),
(929, 1, 'zz', 'lksdkdf', '2015-05-26 13:55:42'),
(930, 1, 'zz', 'lksdkdf', '2015-05-26 13:55:51'),
(931, 1, 'zz', 'lksdkdf', '2015-05-26 13:56:00'),
(932, 1, 'zz', 'lksdkdf', '2015-05-26 13:59:07'),
(933, 1, 'zz', 'lksdkdf', '2015-05-26 13:59:48'),
(934, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:06:55'),
(935, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:08:57'),
(936, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:09:34'),
(937, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:09:48'),
(938, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:10:08'),
(939, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:10:12'),
(940, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:10:30'),
(941, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:10:39'),
(942, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:10:44'),
(943, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:10:58'),
(944, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:11:02'),
(945, 3, 'xxxxxxxxxxxx', 'lksdkdf', '2015-05-26 14:11:41'),
(946, 3, 'ajda', 'lksdkdf', '2015-05-26 14:22:58'),
(947, 3, 'selma', 'lksdkdf', '2015-05-26 14:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE IF NOT EXISTS `korisnik` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `username`, `password`) VALUES
(0, 'faruk', 'mustafic'),
(1, 'faruk', 'mustafic');

-- --------------------------------------------------------

--
-- Table structure for table `vijest`
--

CREATE TABLE IF NOT EXISTS `vijest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `tekst` text COLLATE utf8_slovenian_ci NOT NULL,
  `autor` varchar(20) COLLATE utf8_slovenian_ci NOT NULL,
  `vrijeme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vijest`
--

INSERT INTO `vijest` (`id`, `naslov`, `tekst`, `autor`, `vrijeme`) VALUES
(1, 'NaslovJedan', 'Ovo je tekst ta NaslovJedan', 'AutorJedan', '2015-05-12 13:28:09'),
(2, 'NaslovDva', 'Ovo je teksta za NaslovDva', 'AutorDva', '2015-05-12 13:28:52'),
(3, 'armatura', 'cupaaaaaas', 'toni milun', '2015-05-19 13:44:01');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`vijest`) REFERENCES `vijest` (`id`);
--
-- Database: `wt8`
--

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

CREATE TABLE IF NOT EXISTS `komentari` (
  `id` int(11) NOT NULL,
  `vijest` int(11) NOT NULL,
  `tekst` text COLLATE utf8_slovenian_ci NOT NULL,
  `autor` varchar(20) COLLATE utf8_slovenian_ci NOT NULL,
  `vrijeme` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vijest` (`vijest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE IF NOT EXISTS `vijesti` (
  `id` int(11) NOT NULL,
  `naslov` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `tekst` text COLLATE utf8_slovenian_ci NOT NULL,
  `autor` varchar(20) COLLATE utf8_slovenian_ci NOT NULL,
  `vrijeme` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentari`
--
ALTER TABLE `komentari`
  ADD CONSTRAINT `komentari_ibfk_1` FOREIGN KEY (`vijest`) REFERENCES `vijesti` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
