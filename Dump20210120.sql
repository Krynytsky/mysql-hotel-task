CREATE DATABASE  IF NOT EXISTS `SoftServeTaskDb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `SoftServeTaskDb`;
-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: SoftServeTaskDb
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `HotelID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `YearFoundation` year(4) NOT NULL,
  `Address` varchar(15) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,'Edelweiss',1937,'Pihotskogo str.',1),(4,'Neptun',2019,'Ivasjyka str.',1),(5,'Launch Fauna',2020,'Kypeleva str.',1);
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservation` (
  `ReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `StartReservation` date NOT NULL,
  `EndReservation` date NOT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `UserID_idx` (`UserID`),
  KEY `RoomID_idx` (`RoomID`),
  CONSTRAINT `RoomID` FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (1,1,1,'2021-01-18','2021-01-22'),(2,2,2,'2021-01-18','2021-01-25'),(3,3,3,'2021-01-18','2021-01-22'),(4,4,4,'2021-01-18','2021-01-22'),(5,5,5,'2021-01-18','2021-01-22'),(6,6,6,'2021-01-18','2021-01-22'),(7,7,7,'2021-01-18','2021-01-22'),(8,8,8,'2021-01-18','2021-01-22'),(9,9,9,'2021-01-18','2021-01-22'),(10,10,10,'2021-01-18','2021-01-22');
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `HotelID` int(11) NOT NULL,
  `RoomNumber` int(11) NOT NULL,
  `Price` double NOT NULL,
  `ComfortLevel` int(11) NOT NULL,
  `Capability` int(11) NOT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `HotelID_idx` (`HotelID`),
  CONSTRAINT `HotelID` FOREIGN KEY (`HotelID`) REFERENCES `Hotel` (`HotelID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,1,101,300.25,2,4),(2,1,102,300.25,1,1),(3,1,103,600.99,1,2),(4,1,104,3000.25,2,3),(5,1,105,300.25,1,2),(6,1,106,9900.25,1,4),(7,1,301,300.25,1,2),(8,4,101,2000.25,3,2),(9,4,101,1900.25,3,2),(10,5,401,8000,1,2),(11,5,601,30000.25,3,5);
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  `Email` varchar(15) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Ivan','jipo@mail.com'),(2,'Anton','lopit@mail.com'),(3,'Andrew','Ivan@mail.com'),(4,'Yosup','Ivan@mail.com'),(5,'Andrew','Ivan@mail.com'),(6,'Ivan','Ivan@mail.com'),(7,'Anton','lotrit@mail.com'),(8,'Ivanka','ivanka@mail.com'),(9,'Antonina','ritora@mail.com'),(10,'Vika','kika@mail.com');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'SoftServeTaskDb'
--

--
-- Dumping routines for database 'SoftServeTaskDb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-20  1:29:37
