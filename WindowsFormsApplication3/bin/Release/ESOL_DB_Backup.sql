-- MySqlBackup.NET 2.0.11
-- Dump Time: 2018-03-03 14:42:39
-- --------------------------------------
-- Server version 5.7.21-0ubuntu0.16.04.1 (Ubuntu)


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of Book
-- 

DROP TABLE IF EXISTS `Book`;
CREATE TABLE IF NOT EXISTS `Book` (
  `DateAdded` date DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT '',
  `LastName` varchar(20) NOT NULL,
  `NumPeople` int(1) NOT NULL,
  `Car` varchar(4) NOT NULL,
  `phone` varchar(10) DEFAULT '',
  `Email` varchar(50) DEFAULT '',
  `DAddress` varchar(10) NOT NULL,
  `DAInfo` varchar(30) DEFAULT '',
  `MOArrival` varchar(10) NOT NULL,
  `ADate` date NOT NULL,
  `ATime` varchar(10) NOT NULL,
  `IDBook` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(10) NOT NULL,
  `Driver` int(11) DEFAULT NULL,
  `Remarks` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IDBook`),
  UNIQUE KEY `IDBook` (`IDBook`),
  KEY `FK_ID` (`ID`),
  KEY `fk_driver` (`Driver`),
  CONSTRAINT `FK_ID` FOREIGN KEY (`ID`) REFERENCES `Users` (`ID`),
  CONSTRAINT `fk_driver` FOREIGN KEY (`Driver`) REFERENCES `Drivers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table Book
-- 

/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book`(`DateAdded`,`FirstName`,`LastName`,`NumPeople`,`Car`,`phone`,`Email`,`DAddress`,`DAInfo`,`MOArrival`,`ADate`,`ATime`,`IDBook`,`ID`,`Driver`,`Remarks`) VALUES
('2018-02-22 00:00:00','a','a',1,'TAXI','','','AIRPORT','','HIGH SPEED','2018-02-25 00:00:00','12:15',208,'User1',2,''),
('2018-02-22 00:00:00','b','b',2,'TAXI','','','KIFISIA','','BLUE STAR','2018-04-15 00:00:00','12:15',209,'User1',NULL,''),
('2018-02-22 00:00:00','c','c',8,'VAN','','','GLYFADA','','HIGH SPEED','2018-02-27 00:00:00','12:15',210,'User1',2,''),
('2017-12-28 00:00:00','','?',1,'TAXI','','','SYNTAGMA','','HIGH SPEED','2018-03-02 00:00:00','12:15',215,'Admin',NULL,''),
('2017-12-28 00:00:00','','Naki',8,'VAN','','','SYNTAGMA','','BLUE STAR','2018-03-31 00:00:00','13:00',216,'Admin',NULL,''),
('2017-12-28 00:00:00','','???????',5,'VAN','','','SYNTAGMA','','BLUE STAR','2018-03-03 00:00:00','12:15',217,'Admin',NULL,'');
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;

-- 
-- Definition of DAddress
-- 

DROP TABLE IF EXISTS `DAddress`;
CREATE TABLE IF NOT EXISTS `DAddress` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(15) DEFAULT NULL,
  `TPrice` int(11) NOT NULL,
  `VPrice` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table DAddress
-- 

/*!40000 ALTER TABLE `DAddress` DISABLE KEYS */;
INSERT INTO `DAddress`(`ID`,`location`,`TPrice`,`VPrice`) VALUES
(1,'AIRPORT',10,20),
(2,'SYNTAGMA',10,20),
(3,'GLYFADA',10,20),
(4,'KIFISIA',10,20),
(23,'?????T?S',90,120);
/*!40000 ALTER TABLE `DAddress` ENABLE KEYS */;

-- 
-- Definition of DeleteBook
-- 

DROP TABLE IF EXISTS `DeleteBook`;
CREATE TABLE IF NOT EXISTS `DeleteBook` (
  `HaveSeen` bit(1) DEFAULT b'0',
  `DateAdded` date DEFAULT NULL,
  `ADate` date DEFAULT NULL,
  `DAddress` varchar(10) NOT NULL,
  `Car` varchar(4) NOT NULL,
  `IDBook` int(11) NOT NULL,
  `ID` varchar(10) DEFAULT NULL,
  `Driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDBook`),
  KEY `FK_IDD` (`ID`),
  KEY `FK_DrivD` (`Driver`),
  CONSTRAINT `FK_DrivD` FOREIGN KEY (`Driver`) REFERENCES `Drivers` (`ID`),
  CONSTRAINT `FK_IDD` FOREIGN KEY (`ID`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table DeleteBook
-- 

/*!40000 ALTER TABLE `DeleteBook` DISABLE KEYS */;
INSERT INTO `DeleteBook`(`HaveSeen`,`DateAdded`,`ADate`,`DAddress`,`Car`,`IDBook`,`ID`,`Driver`) VALUES
(1,'2017-12-28 00:00:00','2018-02-23 00:00:00','AIRPORT','TAXI',203,'Admin',2),
(1,'2017-12-28 00:00:00','2018-02-24 00:00:00','SYNTAGMA','TAXI',204,'User1',NULL),
(1,'2017-12-28 00:00:00','2018-02-24 00:00:00','SYNTAGMA','VAN',205,'User1',NULL),
(1,'2017-12-28 00:00:00','2018-03-02 00:00:00','KIFISIA','TAXI',206,'User1',NULL),
(1,'2017-12-28 00:00:00','2018-02-25 00:00:00','AIRPORT','TAXI',207,'User1',NULL),
(0,'2017-12-28 00:00:00','2018-02-27 00:00:00','SYNTAGMA','TAXI',213,'Admin',NULL);
/*!40000 ALTER TABLE `DeleteBook` ENABLE KEYS */;

-- 
-- Definition of Drivers
-- 

DROP TABLE IF EXISTS `Drivers`;
CREATE TABLE IF NOT EXISTS `Drivers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(15) DEFAULT NULL,
  `LastName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table Drivers
-- 

/*!40000 ALTER TABLE `Drivers` DISABLE KEYS */;
INSERT INTO `Drivers`(`ID`,`FirstName`,`LastName`) VALUES
(2,'vasilis','kostoglou'),
(3,'a','a'),
(8,'Evie','Naki');
/*!40000 ALTER TABLE `Drivers` ENABLE KEYS */;

-- 
-- Definition of MOArrival
-- 

DROP TABLE IF EXISTS `MOArrival`;
CREATE TABLE IF NOT EXISTS `MOArrival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table MOArrival
-- 

/*!40000 ALTER TABLE `MOArrival` DISABLE KEYS */;
INSERT INTO `MOArrival`(`id`,`location`) VALUES
(1,'HIGH SPEED'),
(2,'BLUE STAR');
/*!40000 ALTER TABLE `MOArrival` ENABLE KEYS */;

-- 
-- Definition of Users
-- 

DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `UserName` varchar(10) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `ID` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table Users
-- 

/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users`(`UserName`,`Password`,`ID`) VALUES
('admin','admin','Admin'),
('user1','user1','User1');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2018-03-03 14:42:42
-- Total time: 0:0:0:3:284 (d:h:m:s:ms)
