-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--
-- Table structure for table `fishing_rankings`
--

DROP TABLE IF EXISTS `fishing_rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fishing_rankings` (
  `ranking` tinyint(2) NOT NULL DEFAULT '0',
  `charid` int(11) NOT NULL DEFAULT '0',
  `charname` varchar(20) NOT NULL DEFAULT '',
  `mjob` tinyint(3) NOT NULL,
  `sjob` tinyint(3) NOT NULL,
  `mlevel` tinyint(3) NOT NULL,
  `slevel` tinyint(3) NOT NULL,
  `score` smallint(5) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `fishingrank` tinyint(2) NOT NULL,
  `race` tinyint(2) NOT NULL,
  `nation` tinyint(2) NOT NULL,
  `titlegiven` tinyint(1) NOT NULL DEFAULT '0',
  `claimed` tinyint(1) NOT NULL DEFAULT '0',
  `length` smallint(5) NOT NULL DEFAULT '0',
  `weight` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`),
  UNIQUE KEY `charid` (`charid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishing_rankings`
--

LOCK TABLES `fishing_rankings` WRITE;
/*!40000 ALTER TABLE `fishing_rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `fishing_rankings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-01  5:11:33
