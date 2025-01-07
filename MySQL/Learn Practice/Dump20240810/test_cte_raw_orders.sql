-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: test_cte
-- ------------------------------------------------------
-- Server version	5.5.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `raw_orders`
--

DROP TABLE IF EXISTS `raw_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_orders` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` text,
  `status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw_orders`
--

LOCK TABLES `raw_orders` WRITE;
/*!40000 ALTER TABLE `raw_orders` DISABLE KEYS */;
INSERT INTO `raw_orders` VALUES (1,1,'2018-01-01','returned'),(2,3,'2018-01-02','completed'),(3,94,'2018-01-04','completed'),(4,50,'2018-01-05','completed'),(5,64,'2018-01-05','completed'),(6,54,'2018-01-07','completed'),(7,88,'2018-01-09','completed'),(8,2,'2018-01-11','returned'),(9,53,'2018-01-12','completed'),(10,7,'2018-01-14','completed'),(11,99,'2018-01-14','completed'),(12,59,'2018-01-15','completed'),(13,84,'2018-01-17','completed'),(14,40,'2018-01-17','returned'),(15,25,'2018-01-17','completed'),(16,39,'2018-01-18','completed'),(17,71,'2018-01-18','completed'),(18,64,'2018-01-20','returned'),(19,54,'2018-01-22','completed'),(20,20,'2018-01-23','completed'),(21,71,'2018-01-23','completed'),(22,86,'2018-01-24','completed'),(23,22,'2018-01-26','return_pending'),(24,3,'2018-01-27','completed'),(25,51,'2018-01-28','completed'),(26,32,'2018-01-28','completed'),(27,94,'2018-01-29','completed'),(28,8,'2018-01-29','completed'),(29,57,'2018-01-31','completed'),(30,69,'2018-02-02','completed'),(31,16,'2018-02-02','completed'),(32,28,'2018-02-04','completed'),(33,42,'2018-02-04','completed'),(34,38,'2018-02-06','completed'),(35,80,'2018-02-08','completed'),(36,85,'2018-02-10','completed'),(37,1,'2018-02-10','completed'),(38,51,'2018-02-10','completed'),(39,26,'2018-02-11','completed'),(40,33,'2018-02-13','completed'),(41,99,'2018-02-14','completed'),(42,92,'2018-02-16','completed'),(43,31,'2018-02-17','completed'),(44,66,'2018-02-17','completed'),(45,22,'2018-02-17','completed'),(46,6,'2018-02-19','completed'),(47,50,'2018-02-20','completed'),(48,27,'2018-02-21','completed'),(49,35,'2018-02-21','completed'),(50,51,'2018-02-23','completed'),(51,71,'2018-02-24','completed'),(52,54,'2018-02-25','return_pending'),(53,34,'2018-02-26','completed'),(54,54,'2018-02-26','completed'),(55,18,'2018-02-27','completed'),(56,79,'2018-02-28','completed'),(57,93,'2018-03-01','completed'),(58,22,'2018-03-01','completed'),(59,30,'2018-03-02','completed'),(60,12,'2018-03-03','completed'),(61,63,'2018-03-03','completed'),(62,57,'2018-03-05','completed'),(63,70,'2018-03-06','completed'),(64,13,'2018-03-07','completed'),(65,26,'2018-03-08','completed'),(66,36,'2018-03-10','completed'),(67,79,'2018-03-11','completed'),(68,53,'2018-03-11','completed'),(69,3,'2018-03-11','completed'),(70,8,'2018-03-12','completed'),(71,42,'2018-03-12','shipped'),(72,30,'2018-03-14','shipped'),(73,19,'2018-03-16','completed'),(74,9,'2018-03-17','shipped'),(75,69,'2018-03-18','completed'),(76,25,'2018-03-20','completed'),(77,35,'2018-03-21','shipped'),(78,90,'2018-03-23','shipped'),(79,52,'2018-03-23','shipped'),(80,11,'2018-03-23','shipped'),(81,76,'2018-03-23','shipped'),(82,46,'2018-03-24','shipped'),(83,54,'2018-03-24','shipped'),(84,70,'2018-03-26','placed'),(85,47,'2018-03-26','shipped'),(86,68,'2018-03-26','placed'),(87,46,'2018-03-27','placed'),(88,91,'2018-03-27','shipped'),(89,21,'2018-03-28','placed'),(90,66,'2018-03-30','shipped'),(91,47,'2018-03-31','placed'),(92,84,'2018-04-02','placed'),(93,66,'2018-04-03','placed'),(94,63,'2018-04-03','placed'),(95,27,'2018-04-04','placed'),(96,90,'2018-04-06','placed'),(97,89,'2018-04-07','placed'),(98,41,'2018-04-07','placed'),(99,85,'2018-04-09','placed');
/*!40000 ALTER TABLE `raw_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-10 15:33:06
