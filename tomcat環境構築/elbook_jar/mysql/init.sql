-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: elbook2022
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `elbook2022`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `elbook2022` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `elbook2022`;

--
-- Table structure for table `el_book`
--

DROP TABLE IF EXISTS `el_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(60) NOT NULL,
  `book_author` varchar(30) NOT NULL,
  `book_publisher` varchar(30) NOT NULL,
  `book_releasetime` date DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_book`
--

LOCK TABLES `el_book` WRITE;
/*!40000 ALTER TABLE `el_book` DISABLE KEYS */;
INSERT INTO `el_book` VALUES (1,'たこ','oohira','エル','2022-12-01','2023-01-07 06:33:55',NULL,'1.jpg',3),(2,'たこ2','oohira','エル','2022-12-01','2023-01-07 06:38:38','2023-01-14 20:11:34','2.jpg',5),(3,'たこ3','oohira','エル','2022-12-01','2023-01-07 06:39:19',NULL,NULL,1),(4,'たこ4','oohira','エル','2022-12-01','2023-01-07 06:40:15',NULL,NULL,0),(5,'たこ2','oohira','エル','2022-12-01','2023-01-07 06:43:57',NULL,NULL,0),(6,'たこ2','oohira','エル','2022-12-01','2023-01-07 06:46:30',NULL,NULL,2),(7,'たこ2','oohira','エル','2022-12-01','2023-01-07 06:50:59',NULL,NULL,4),(8,'たこ2','oohira','エル','2022-12-01','2023-01-07 07:04:46',NULL,NULL,NULL),(9,'たこz','oohira','エル','2022-12-02','2023-01-07 07:47:00',NULL,NULL,NULL),(10,'たこy','oohira','エル','2022-12-03','2023-01-07 08:27:04',NULL,NULL,0),(11,'たこf','oohira','エル','2022-12-04','2023-01-07 08:28:25',NULL,NULL,4),(12,'たこd','oohira','エル','2022-12-05','2023-01-07 08:33:14',NULL,NULL,0),(13,'たこssss','oohira','エル','2022-12-08','2023-01-07 10:38:55',NULL,NULL,4),(14,'ああああ','oohira','エル','2022-12-09','2023-01-07 11:09:44','2023-01-14 19:47:46','14.jpg',81),(15,'スパイファミリー　7巻','oohira','エル','2022-12-01','2023-01-14 10:49:57','2023-01-14 21:23:14','15.jpg',0),(16,'たこz','oohira','エル','2022-12-01','2023-01-14 10:56:49','2023-01-14 21:14:21','14.jpg',1),(17,'ぽじゃｗじぇおｆｊそｆ','あえぽｆｊｓどｆ','ｓｄ；おｆじょ；お','2023-03-26','2023-03-25 15:41:11',NULL,'17.jpg',222),(18,'asdf','asrf','adsf','2022-12-01','2023-03-25 15:45:47',NULL,'18.jpg',888),(19,'たこ2','asefsdesあ','エル','2022-12-01','2023-03-25 15:50:06',NULL,'19.jpg',888),(20,'たこz','oohira','エル','2022-12-21','2023-03-25 15:52:14',NULL,'20.jpg',88),(21,'たこzdd','oohira','エル','2022-12-07','2023-03-25 15:54:23',NULL,'21.jpg',4566),(22,'スパイファミリー　3巻','awefssd','dfs','2022-12-01','2023-03-25 15:56:06',NULL,'22.jpg',9999),(23,'酸っぱいファミリー','oohira','エル','2022-12-01','2023-03-25 16:48:16',NULL,'23.jpg',788),(24,'たこ2','x','エル','2022-12-01','2023-03-25 16:56:07',NULL,'24.jpg',111);
/*!40000 ALTER TABLE `el_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_rent`
--

DROP TABLE IF EXISTS `el_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_rent` (
  `rent_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `rent_day` timestamp NULL DEFAULT NULL,
  `return_day` timestamp NULL DEFAULT NULL,
  `dlt_flg` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_rent`
--

LOCK TABLES `el_rent` WRITE;
/*!40000 ALTER TABLE `el_rent` DISABLE KEYS */;
INSERT INTO `el_rent` VALUES (1,90,1,'2023-01-09 05:27:19',NULL,0),(2,90,2,'2023-01-09 05:31:14',NULL,0),(3,90,1,'2023-01-09 13:02:03',NULL,0),(4,15,14,'2023-01-14 05:04:48',NULL,1),(5,15,14,'2023-01-14 06:14:44',NULL,1),(6,15,14,'2023-01-14 06:14:56',NULL,1),(7,15,14,'2023-01-14 06:14:58',NULL,1),(8,15,13,'2023-01-14 06:15:16',NULL,1),(9,15,14,'2023-01-14 06:15:18',NULL,1),(10,15,14,'2023-01-14 06:15:21',NULL,1),(11,15,14,'2023-01-14 06:15:38',NULL,1),(12,15,14,'2023-01-14 06:15:40',NULL,1),(13,15,14,'2023-01-14 06:15:41',NULL,1),(14,15,14,'2023-01-14 06:15:44',NULL,1),(15,15,14,'2023-01-14 06:15:50',NULL,1),(16,15,14,'2023-01-14 06:15:55',NULL,1),(17,15,14,'2023-01-14 06:16:07',NULL,1),(18,15,1,'2023-01-14 06:29:24',NULL,1),(19,15,14,'2023-01-14 07:06:54',NULL,1),(20,15,14,'2023-01-14 07:24:15',NULL,1),(21,15,13,'2023-01-14 07:24:19',NULL,1),(22,15,11,'2023-01-14 07:24:21',NULL,1),(23,15,6,'2023-01-14 07:24:28',NULL,1),(24,15,7,'2023-01-14 07:24:31',NULL,1),(25,15,5,'2023-01-14 07:24:33',NULL,1),(26,15,3,'2023-01-14 07:24:36',NULL,1),(27,15,2,'2023-01-14 07:24:38',NULL,1),(28,15,1,'2023-01-14 07:24:40',NULL,1),(29,15,14,'2023-01-14 07:24:57',NULL,1),(30,15,14,'2023-01-14 07:26:13',NULL,1),(31,15,14,'2023-01-14 07:32:36',NULL,1),(32,15,5,'2023-01-14 07:32:39',NULL,1),(33,15,13,'2023-01-14 08:08:44',NULL,1),(34,15,2,'2023-01-14 08:08:49',NULL,1),(35,15,11,'2023-01-14 08:09:22',NULL,1),(36,15,2,'2023-01-14 11:11:13',NULL,1),(37,22,14,'2023-01-15 04:48:13',NULL,0),(38,22,13,'2023-01-15 04:48:15',NULL,0),(39,22,5,'2023-01-15 04:48:20',NULL,0),(40,15,14,'2023-03-25 15:14:30',NULL,0),(41,15,15,'2023-03-25 15:14:36',NULL,0);
/*!40000 ALTER TABLE `el_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_user`
--

DROP TABLE IF EXISTS `el_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `pass` varchar(256) NOT NULL DEFAULT '9999',
  `create_time` timestamp NULL DEFAULT NULL,
  `delete_flg` tinyint(1) NOT NULL DEFAULT '0',
  `authority` enum('ADMIN','USER') DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_user`
--

LOCK TABLES `el_user` WRITE;
/*!40000 ALTER TABLE `el_user` DISABLE KEYS */;
INSERT INTO `el_user` VALUES (15,'city','test@com','92e7d0ed04e062d134b011232169e07634bb34e4f745a22db05e5a676e778b1d358a028ad7d37b01','2023-01-07 02:52:24',0,'ADMIN'),(16,'tako2','test@com','8173fe759c718bf523c7dd84f8d5aebdb127c20dc823969d64f9e6158df94bdf13a805516efdc6f5','2023-01-07 02:52:26',0,'USER'),(17,'dsfawfawfsdf','test@com','test','2023-01-07 07:38:20',0,'ADMIN'),(22,'admin2','test@com','fe9a57d6b568039176b6b99c58ad61c97eb641ad4ba1e82d86f3f9e47dce64173fcd45d8a4d6ae9f','2023-01-15 04:47:50',0,'ADMIN'),(23,'ore','test@com','1f3b2b88ac52a9ee9618af0185d76e005b221d65de3e97d30554924193c11efb9abf4b59087ca981','2023-01-15 05:19:44',0,'ADMIN'),(25,'lite','test@com','f39f3ed53d61d27826121addfbe5e5f8a9faa4160a56b151b52f878e60bf8ac083285dada9578fb8','2023-01-15 05:26:38',0,'USER'),(26,'member1','test@com','b304a43a39f0aeb94af00e13927e577de1ad804a169bc5cbcb649ef433044df1e70c0d348f91f2cc','2023-01-15 05:37:46',0,'USER'),(27,'dsfawfawfsdf','test@com','c950b04143739603bba694de7628fc78f495cd504e44847570f28e71e899d7d9c7954b0f723264f5','2023-01-15 06:23:26',0,'USER'),(28,'dsfawfawfsｄふぁｓ','test@com','ece998f9ef4cb4aa63731a78e9dbf2b84027e6c1a04527c25f7f76f0ea7ff85f4b68b02570d85f9c','2023-01-15 06:26:25',0,'USER'),(29,'tako','test@com','1acb924877cef0c8f2f42ebbe54a54408cd9102454f4eaa99e3aeb512bcbde90bc3f32e93a772871','2023-01-15 06:36:03',0,'USER'),(30,'oreore','test@com','216e6d336a424825e7dee8bc54dc6230ce872fe434567d5297a13428dc5b0e720459a5a8a33212dc','2023-01-15 06:38:03',0,'ADMIN'),(38,'えいえいおー','test@com','b438786dc64ec9633d8aabc702e4b5b2cfeeb5e4b5b8674849709e78592ccfb05d451e9c4eb4f281','2023-03-25 18:18:28',0,'USER'),(39,'えいえいおー02','test@com','32a69b064dac207f8d930a17696437a891882cf06f5ff9d5e7345b545c3c66b666980f1cd1b3b915','2023-03-25 18:18:49',0,'USER');
/*!40000 ALTER TABLE `el_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02  0:13:35
