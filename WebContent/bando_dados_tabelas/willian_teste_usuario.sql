-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: willian_teste
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `peso` varchar(50) DEFAULT NULL,
  `altura` varchar(50) DEFAULT NULL,
  `empresa_filiada` varchar(255) DEFAULT NULL,
  `data_inicial` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'willian','alves','04301799443','wasdas','123','123','1123','asdasda','23/05/2018 10:34:16',NULL),(2,'qewqweq','qweqw','qweq','qweq','45245','4524','454','eqweqewqw','23/05/2018 10:39:15',NULL),(3,'willian','alves','1120','adad','asdasd','asad','asdasd','asdasd','asdasda',NULL),(4,'willian','alves','1120','adad','asdasd','asad','asdasd','asdasd','asdasda',NULL),(5,'adasdasdasdasdadasd','asdasdasdasd','sdasdasdasd','asdasdasdasd','123','14141.0','414.0','dsasdasdas','23/05/2018 10:44:55',NULL),(6,'willian123333','alves','04301799443','wasdas','123','123.0','1123.0','asdasda','23/05/2018 10:47:01',NULL),(7,'sdasd','sdasd','asda','root','usbw','42452.0','524524.0','asdasdasd','23/05/2018 10:52:28',NULL),(8,'dadqweqq','weqwe','qweqw','rootweqwe','usbw','211.0','42524.0','qweqw','23/05/2018 11:04:21',NULL),(9,'dadqweqqasdasda','weqwe','qweqw','rootweqwe','445454','211.0','42524.0','qweqw','23/05/2018 11:07:01',NULL),(10,'dadqweqqasdasda','weqwe','qweqw','rootweqwe','sdfsd','211.0','42524.0','qweqw','23/05/2018 11:09:21',NULL),(11,'dadqweqqasdasdaadasdasdasda','weqwe','qweqw','rootweqwe','sdfsd','211.0','42524.0','qweqw','23/05/2018 11:09:29',NULL),(12,'willian','alves','11202121564','willian','123','1223.0','123.0','wwww','24/05/2018 11:02:28',NULL),(13,'willian2','alves','11202121564','willian','12345','1223.0','123.0','wwww','24/05/2018 11:07:50',NULL),(14,'willian2','alves','11202121564','willian','14444','1223.0','123.0','wwww','24/05/2018 11:09:43',NULL),(15,'willian2','alves','11202121564','willian','5858','1223.0','123.0','wwww','24/05/2018 11:10:00',NULL),(16,'willian oi','willian','1223322','root','123','123.0','123.0','1234','24/05/2018 11:30:50',NULL),(17,'asdasda','asda','sdasd','rooasddt','123','725.0','75785.0','sadas','24/05/2018 11:34:34',NULL),(18,'asd','sdsda','sdasdasdas','rootasdada','123578','427.0','74172.0','sdas','24/05/2018 11:36:54',NULL),(19,'willian','alves','1234567810','willian123','123','123.0','123.0','alfa maximo','2018/05/24','willian@gmail.com'),(20,'willian','alves','11111111111','willian12345','123','123.0','182.0','mv','2018/05/28','williamalves_vipis@hotmail.com'),(21,'willian1234','alves','11111111111','willian1234','123','111.0','11.0','1234','2018/05/29','asdadas@gmail'),(22,'ssss','dasd','asda','mv','123','111.0','11.0','mv','2018/05/29','dasd@hhaa');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-31 14:15:50
