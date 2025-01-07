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
-- Table structure for table `raw_customers`
--

DROP TABLE IF EXISTS `raw_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_customers` (
  `id` int(11) DEFAULT NULL,
  `first_name` text,
  `last_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw_customers`
--

LOCK TABLES `raw_customers` WRITE;
/*!40000 ALTER TABLE `raw_customers` DISABLE KEYS */;
INSERT INTO `raw_customers` VALUES (1,'Michael','P.'),(2,'Shawn','M.'),(3,'Kathleen','P.'),(4,'Jimmy','C.'),(5,'Katherine','R.'),(6,'Sarah','R.'),(7,'Martin','M.'),(8,'Frank','R.'),(9,'Jennifer','F.'),(10,'Henry','W.'),(11,'Fred','S.'),(12,'Amy','D.'),(13,'Kathleen','M.'),(14,'Steve','F.'),(15,'Teresa','H.'),(16,'Amanda','H.'),(17,'Kimberly','R.'),(18,'Johnny','K.'),(19,'Virginia','F.'),(20,'Anna','A.'),(21,'Willie','H.'),(22,'Sean','H.'),(23,'Mildred','A.'),(24,'David','G.'),(25,'Victor','H.'),(26,'Aaron','R.'),(27,'Benjamin','B.'),(28,'Lisa','W.'),(29,'Benjamin','K.'),(30,'Christina','W.'),(31,'Jane','G.'),(32,'Thomas','O.'),(33,'Katherine','M.'),(34,'Jennifer','S.'),(35,'Sara','T.'),(36,'Harold','O.'),(37,'Shirley','J.'),(38,'Dennis','J.'),(39,'Louise','W.'),(40,'Maria','A.'),(41,'Gloria','C.'),(42,'Diana','S.'),(43,'Kelly','N.'),(44,'Jane','R.'),(45,'Scott','B.'),(46,'Norma','C.'),(47,'Marie','P.'),(48,'Lillian','C.'),(49,'Judy','N.'),(50,'Billy','L.'),(51,'Howard','R.'),(52,'Laura','F.'),(53,'Anne','B.'),(54,'Rose','M.'),(55,'Nicholas','R.'),(56,'Joshua','K.'),(57,'Paul','W.'),(58,'Kathryn','K.'),(59,'Adam','A.'),(60,'Norma','W.'),(61,'Timothy','R.'),(62,'Elizabeth','P.'),(63,'Edward','G.'),(64,'David','C.'),(65,'Brenda','W.'),(66,'Adam','W.'),(67,'Michael','H.'),(68,'Jesse','E.'),(69,'Janet','P.'),(70,'Helen','F.'),(71,'Gerald','C.'),(72,'Kathryn','O.'),(73,'Alan','B.'),(74,'Harry','A.'),(75,'Andrea','H.'),(76,'Barbara','W.'),(77,'Anne','W.'),(78,'Harry','H.'),(79,'Jack','R.'),(80,'Phillip','H.'),(81,'Shirley','H.'),(82,'Arthur','D.'),(83,'Virginia','R.'),(84,'Christina','R.'),(85,'Theresa','M.'),(86,'Jason','C.'),(87,'Phillip','B.'),(88,'Adam','T.'),(89,'Margaret','J.'),(90,'Paul','P.'),(91,'Todd','W.'),(92,'Willie','O.'),(93,'Frances','R.'),(94,'Gregory','H.'),(95,'Lisa','P.'),(96,'Jacqueline','A.'),(97,'Shirley','D.'),(98,'Nicole','M.'),(99,'Mary','G.'),(100,'Jean','M.');
/*!40000 ALTER TABLE `raw_customers` ENABLE KEYS */;
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
