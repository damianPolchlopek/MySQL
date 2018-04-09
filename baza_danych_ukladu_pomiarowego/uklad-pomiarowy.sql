unlock tables;
CREATE DATABASE  IF NOT EXISTS `praca_licencjacka` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `praca_licencjacka`;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11)  NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(15)  NOT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
INSERT INTO `person` VALUES 
	(1,'damian1', 'Damian','Polchlopek','damian','damian', 111111111),
	(2,'daniel1', 'Daniel','Kowalski','daniel.kowalski@gmail.com','daniel', 222222222),
	(3,'dawidd1', 'Dawidd','Nowakdddd','dawid.nowak@gmail.com','dawid', 333333333),
	(4,'dominik1', 'Dominik','Kowalski','dominik.kowalski@gmail.com','dominik', 444444444);
	
UNLOCK TABLES;

--
-- Table structure for table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
CREATE TABLE `measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_measurement` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `person_id_meas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PERSON_id` (`person_id_meas`),
  
  CONSTRAINT `FK_PERSON` FOREIGN KEY (`person_id_meas`) 
  REFERENCES `person` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
  
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement`
--

LOCK TABLES `measurement` WRITE;
INSERT INTO `measurement` VALUES 
	(1, '2018-12-17', 'pomiar temp z poniedzialku', 1),
	(2, '2018-12-17', 'pomiar temp z wtorku', 2),
    (3, '2018-12-17', 'pomiar temp z srody', 3);

UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_log` date DEFAULT NULL,
  `time_log` time DEFAULT NULL,
  `location_log` varchar(45) DEFAULT NULL,
  `person_id_login` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`),
  KEY `FK_PERSON_id2` (`person_id_login`),
  
  CONSTRAINT `FK_PERSON_id2` FOREIGN KEY (`person_id_login`) 
  REFERENCES `person` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
INSERT INTO `login` VALUES 
	(1,'2015-12-17','11:22:33','Krosno', 1),
	(2,'2015-12-17','11:22:33','AGH', 1),
	(3,'2015-12-17','11:22:33','UJ', 2),
	(4,'2015-12-17','11:22:33','Krakow', 3),
	(5,'2015-12-17','11:22:33','Sanok', 4);
	
UNLOCK TABLES;

--
-- Table structure for table `meas_arrays`
--

DROP TABLE IF EXISTS `meas_arrays`;
CREATE TABLE `meas_arrays` (
  `id` int(11)  NOT NULL AUTO_INCREMENT,
  `node_x` int(11) NOT NULL,
  `node_y` int(11) NOT NULL,
  `id_meas` int(11),
  PRIMARY KEY (`id`),
  KEY (`id_meas`),
  
  CONSTRAINT `FK_MEAS` FOREIGN KEY (`id_meas`) 
  REFERENCES `measurement` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
  
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meas_arrays`
--

LOCK TABLES `meas_arrays` WRITE;
INSERT INTO `meas_arrays` VALUES 
-- Pierwsza doba	
    (1, 1, 3, 1),
    (2, 2, 4, 1),
    (3, 3, 5, 1),
    (4, 4, 4, 1),
    (5, 5, 3, 1),
    (6, 6, 2, 1),
    (7, 7, 1, 1),
    (8, 8, 3, 1),
    (9, 9, 4, 1),
    (10, 10, 5, 1),
    (11, 11, 4, 1),
    (12, 12, 3, 1),
    (13, 13, 2, 1),
    (14, 14, 1, 1),
    (15, 15, 3, 1),
    (16, 16, 4, 1),
    (17, 17, 5, 1),
    (18, 18, 4, 1),
    (19, 19, 3, 1),
    (20, 20, 2, 1),
    (21, 21, 1, 1),
	(22, 22, 3, 1),
    (23, 23, 2, 1),
    (24, 24, 1, 1),
    
-- Druga doba    
    (25, 1, 3, 2),
    (26, 2, 4, 2),
    (27, 3, 3, 2),
    (28, 4, 4, 2),
    (29, 5, 3, 2),
    (30, 6, 2, 2),
    (31, 7, 3, 2),
    (32, 8, 3, 2),
    (33, 9, 4, 2),
    (34, 10, 3, 2),
    (35, 11, 4, 2),
    (36, 12, 3, 2),
    (37, 13, 2, 2),
    (38, 14, 3, 2),
    (39, 15, 3, 2),
    (40, 16, 3, 2),
    (41, 17, 3, 2),
    (42, 18, 4, 2),
    (43, 19, 3, 2),
    (44, 20, 2, 2),
    (45, 21, 1, 2),
	(46, 22, 3, 2),
    (47, 23, 2, 2),
    (48, 24, 3, 2);

	
UNLOCK TABLES;
