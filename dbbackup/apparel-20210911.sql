-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: apparel
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_entries`
--

DROP TABLE IF EXISTS `cart_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kf8bmus1lj3o9jr0site5is4s` (`cart_id`),
  CONSTRAINT `FK_kf8bmus1lj3o9jr0site5is4s` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_entries`
--

LOCK TABLES `cart_entries` WRITE;
/*!40000 ALTER TABLE `cart_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2n3awjv8ah4gl5ca1bq26sori` (`parent_id`),
  CONSTRAINT `FK_2n3awjv8ah4gl5ca1bq26sori` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,NULL,NULL,'1001','Kadın',NULL),(2,NULL,NULL,NULL,'1002','Erkek',NULL),(3,NULL,NULL,NULL,'1003','Çocuk',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  KEY `FK_ac25kv0aljr3ts4lux00s93yt` (`category_id`),
  KEY `FK_cm5vajyq5tshew4w6xvutslrw` (`product_id`),
  CONSTRAINT `FK_ac25kv0aljr3ts4lux00s93yt` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_cm5vajyq5tshew4w6xvutslrw` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(1,2),(2,2),(1,3),(6,3),(5,3);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,NULL,NULL,NULL,'1','Kırmızı Elbise',100,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),(2,NULL,NULL,NULL,'2','Sarı Elbise',111,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),(3,NULL,NULL,NULL,'3','Mavi Elbise',123,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),(4,NULL,NULL,NULL,'4','Mor Elbise',114,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),(5,NULL,NULL,NULL,'5','Turuncu Elbise',99,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),(6,NULL,NULL,NULL,'6','Siyah Elbise',132,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rolename` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `banned` int DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `last_ip` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `last_session_id` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `e_mail` varchar(60) COLLATE utf8_turkish_ci NOT NULL,
  `mobile_phone` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sex` varchar(6) COLLATE utf8_turkish_ci DEFAULT NULL,
  `static_phone` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surname` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `token_expiration` datetime DEFAULT NULL,
  `type` int DEFAULT NULL,
  `username` varchar(60) COLLATE utf8_turkish_ci NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FK_qleu8ddawkdltal07p8e6hgva` (`role_id`),
  CONSTRAINT `FK_qleu8ddawkdltal07p8e6hgva` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-11 13:20:04
