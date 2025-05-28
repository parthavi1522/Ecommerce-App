-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce_app_development
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.20.04.1

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
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint NOT NULL,
  `blob_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (17,'profile','User',4,17,'2025-05-20 09:28:38.474710'),(18,'image','ActiveStorage::VariantRecord',4,18,'2025-05-20 09:28:39.882289'),(19,'image','ActiveStorage::VariantRecord',5,19,'2025-05-20 09:38:52.996549'),(20,'image','Product',1,20,'2025-05-22 09:11:34.585568'),(21,'image','Product',2,21,'2025-05-22 09:11:43.569722'),(22,'image','Product',3,22,'2025-05-22 09:11:52.407872'),(23,'image','Product',4,23,'2025-05-22 09:12:01.418605'),(24,'image','Product',5,24,'2025-05-22 09:12:10.491358'),(26,'image','Product',7,26,'2025-05-22 09:19:04.023714'),(28,'profile','User',11,28,'2025-05-22 09:31:47.201152');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint NOT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (17,'nh0gppg7hxzbp52yxxh5ldfzsnlk','RBF_8998.JPG','image/jpeg','{\"identified\":true,\"width\":4480,\"height\":6720,\"analyzed\":true}','local',12020934,'m1xUkBVtAgEKnqqqlrQORA==','2025-05-20 09:28:38.471430'),(18,'yjb763ji52zpmnx8cktllqk5qx5u','RBF_8998.jpg','image/jpeg','{\"identified\":true,\"width\":150,\"height\":150,\"analyzed\":true}','local',31275,'J3LWJ40AjR2W9dGYs34Z+g==','2025-05-20 09:28:39.877875'),(19,'eh6j0wvjccrxnvsr38jyl0d0dy1y','RBF_8998.jpg','image/jpeg','{\"identified\":true,\"width\":50,\"height\":50,\"analyzed\":true}','local',27681,'eInYr9CVkvPZHFqMrljEWg==','2025-05-20 09:38:52.991877'),(20,'pkd3r32dhu0gttfyaalf198a0bej','lap1.jpeg','image/jpeg','{\"identified\":true,\"width\":275,\"height\":183,\"analyzed\":true}','local',5800,'/EokBsFVgrVmyQlXbgRDsQ==','2025-05-22 09:11:34.578964'),(21,'nlgbrcpxjem6t9min1is5nxeg6sf','chair.jpeg','image/jpeg','{\"identified\":true,\"width\":225,\"height\":225,\"analyzed\":true}','local',4931,'zB0+F/8QRqmanEDPVydYxg==','2025-05-22 09:11:43.566463'),(22,'g6s8n88fk3spyoj4d3msaw72qg6y','bottle.jpeg','image/jpeg','{\"identified\":true,\"width\":183,\"height\":275,\"analyzed\":true}','local',5710,'Hts1gI/tMd/vQSI46KoFZQ==','2025-05-22 09:11:52.403912'),(23,'5vzexw5rvxon4hc7metze7uu73ne','daba.jpg','image/jpeg','{\"identified\":true,\"width\":1500,\"height\":1269,\"analyzed\":true}','local',69033,'/TCyK3fzyIk7alxEkm9NmA==','2025-05-22 09:12:01.415658'),(24,'1w6ubaaqlvo7t6qx0b8pxy50m5f2','food.avif','image/avif','{\"identified\":true,\"analyzed\":true}','local',15017,'Ay9DfvSzw2tyX0pSFuTlHA==','2025-05-22 09:12:10.487448'),(26,'qdv9y3m93fkegcid7gzka2lixzyk','4Y1A0251.JPG','image/jpeg','{\"identified\":true,\"width\":4480,\"height\":6720,\"analyzed\":true}','local',14432344,'sz5T9HtH/xs/6b4w6Brf+A==','2025-05-22 09:19:04.019983'),(28,'t1dzggyqkx248fq7mcbt3ucw4168','4Y1A0594.JPG','image/jpeg','{\"identified\":true,\"width\":6720,\"height\":4480,\"analyzed\":true}','local',8381178,'LXkijFLEiAjlM8/kzRv5AQ==','2025-05-22 09:31:47.197811');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_variant_records`
--

DROP TABLE IF EXISTS `active_storage_variant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_variant_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blob_id` bigint NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_variant_records`
--

LOCK TABLES `active_storage_variant_records` WRITE;
/*!40000 ALTER TABLE `active_storage_variant_records` DISABLE KEYS */;
INSERT INTO `active_storage_variant_records` VALUES (5,17,'GyzYIu+zT3Z1KLIYonIEAiG3aAY='),(4,17,'K83dhcEzX+Dk/C2whs0TkHwfWMA=');
/*!40000 ALTER TABLE `active_storage_variant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2025-04-02 10:15:49.374848','2025-04-02 10:15:49.374852');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cart_items_on_cart_id` (`cart_id`),
  KEY `index_cart_items_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_681a180e84` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_6cdb1f0139` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (17,1,7,1,1000.00,1000.00,'2025-05-22 09:25:38.399443','2025-05-22 09:25:38.399443');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_carts_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_ea59a35211` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,4,'2025-04-11 09:56:33.153057','2025-04-11 12:12:53.458801'),(3,12,'2025-04-25 11:23:16.308492','2025-04-25 11:23:16.308492'),(4,2,'2025-05-07 10:45:59.547876','2025-05-07 10:45:59.547876');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Parthavi','parthavikk1522@gmail.com','testing purpose','2025-04-03 13:09:53.455331','2025-04-03 13:09:53.455331'),(2,'Parthavi','parthavikk15@gmail.com','testing contact us page','2025-04-09 10:37:43.309258','2025-04-09 10:37:43.309258');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `feedback_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_feedbacks_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_c57bb6cf28` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,NULL,'John','The checkout process was smooth!','2025-04-03','2025-04-03 08:42:36.886473','2025-04-03 08:42:36.886473'),(2,NULL,'Doe','This is the basic feedback!','2025-04-03','2025-04-03 08:43:39.869115','2025-04-03 08:43:39.869115'),(3,NULL,'test','testing feedback','2025-04-03','2025-04-03 12:21:21.611632','2025-04-03 12:21:21.611632'),(4,NULL,'test','testing purpose','2025-04-09','2025-04-09 10:37:12.439416','2025-04-09 10:37:12.439416'),(5,NULL,NULL,'dsfdfegre','2025-05-20','2025-05-20 09:20:24.787113','2025-05-20 09:20:24.787113'),(6,4,NULL,'testing\r\n','2025-05-20','2025-05-20 09:26:30.004891','2025-05-20 09:26:30.004891');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `item_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_items_on_order_id` (`order_id`),
  KEY `index_order_items_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_e3cb28f071` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_rails_f1a29ddd47` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (51,31,2,1,1000.00,1000.00,'2025-05-07 09:49:05.788468','2025-05-07 09:49:05.788468'),(52,31,5,1,1000.00,1000.00,'2025-05-07 09:49:05.819967','2025-05-07 09:49:05.819967'),(54,33,3,1,100.00,100.00,'2025-05-07 11:45:38.092930','2025-05-07 11:45:38.092930'),(55,34,3,1,100.00,100.00,'2025-05-09 10:26:10.139551','2025-05-09 10:26:10.139551'),(56,35,4,1,200.00,200.00,'2025-05-09 10:27:13.622914','2025-05-09 10:27:13.622914'),(57,36,2,1,1000.00,1000.00,'2025-05-22 09:23:59.179494','2025-05-22 09:23:59.179494');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_status` int DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `shipping_address` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_f868b47f6a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (31,4,'ORD1DF611E69E','2025-05-07 00:00:00.000000',0,2000.00,'Cash on Delivery',1,'parthavi address','2025-05-07 09:49:05.744920','2025-05-07 09:52:18.868773'),(33,2,'ORD0D1E0BFEBF','2025-05-07 00:00:00.000000',2,100.00,'Credit Card',1,'demo add','2025-05-07 11:45:38.039451','2025-05-07 11:57:35.868708'),(34,4,'ORD04829E9696','2025-05-09 00:00:00.000000',1,100.00,'Credit Card',1,'address','2025-05-09 10:26:10.117872','2025-05-22 09:22:01.788246'),(35,12,'ORDBD77B1AC9C','2025-05-09 00:00:00.000000',3,200.00,'Credit Card',0,'demo 12 add','2025-05-09 10:27:13.592017','2025-05-09 10:27:18.214525'),(36,4,'ORD115E7FC29B','2025-05-22 00:00:00.000000',0,1000.00,'Credit Card',1,'demo address','2025-05-22 09:23:59.151300','2025-05-22 09:24:35.472781');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop','Laptop 1',50000.00,'2025-04-05 11:13:10.730026','2025-05-22 09:11:35.043106'),(2,'Chair','Chair',1000.00,'2025-04-05 11:13:26.651408','2025-05-22 09:11:43.684555'),(3,'Bottle','Bottle',100.00,'2025-04-09 08:59:52.856669','2025-05-22 09:11:52.518800'),(4,'Dabba','Dabba',200.00,'2025-04-09 09:00:14.715804','2025-05-22 09:12:01.520141'),(5,'Food','Food',1000.00,'2025-04-09 09:01:28.130418','2025-05-22 09:12:10.846150'),(7,'demo','demo 12',1000.00,'2025-05-22 09:18:50.678670','2025-05-22 09:19:04.238493');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20250324094543'),('20250327090651'),('20250401091226'),('20250402095008'),('20250402121236'),('20250403124121'),('20250410094306'),('20250410094344'),('20250410101856');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime(6) DEFAULT NULL,
  `remember_created_at` datetime(6) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` text,
  `mobile_number` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@example.com','$2a$12$Qokzsx3obmc1ZLBseGFOuu6TYY/v.bAnUIV8BE9TrFNK/V6CJ38EG',NULL,NULL,NULL,'admin','user','admin',NULL,'6789543210',1,'2025-04-02 10:15:58.456185','2025-04-02 10:15:58.456185'),(2,'demo@example.com','$2a$12$zWoF2NAgYWZCquh5JXUKKeQMKpb8E4q.e0I5NFYILWCO2L9bGr/N2',NULL,NULL,NULL,'demo','user','demo',NULL,'6789543211',0,'2025-04-02 11:11:27.579004','2025-04-02 11:11:27.579004'),(4,'parthavikk1522@gmail.com','$2a$12$At11V8FRpEA7bo33yREr9u3s.gn2QrZKa.8CdAXnqftRTkLcw9YlK',NULL,NULL,NULL,'Parthavi','Kevadiya','parthavi','329, Gadhpur Township','9067010238',0,'2025-04-05 10:04:46.138588','2025-05-22 09:37:35.365992'),(11,'test@gmail.com','$2a$12$Jlml6lvgg1qII5cOD7h5e.iLl/lBZV2YkVePHTXG3.2CWTy0DWiye',NULL,NULL,NULL,'test','user','test','tesing','8906712345',0,'2025-04-09 11:11:43.919915','2025-05-22 09:31:47.352813'),(12,'demo@test.com','$2a$12$gHMAoUFPBs2wgnEcu10NXeLkCVkkGnIpE1jX1C.P42OQMkmcqfMLG',NULL,NULL,NULL,'demo','user','demo12','demo 123','7896541230',0,'2025-04-25 11:02:53.609320','2025-04-25 11:02:53.609320');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-22 15:23:45
