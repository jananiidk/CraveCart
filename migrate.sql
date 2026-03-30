-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: crave_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_id` int NOT NULL,
  `Admin_name` varchar(20) NOT NULL,
  `Admin_password` varchar(20) NOT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (11,'Team-FLX','FLX@2024');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(20) DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_10` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_3` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_4` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_5` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_6` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_7` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_8` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `category_ibfk_9` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (301,'South Indian',202),(302,'Chinese',201),(303,'Fast Food',203),(304,'Desserts',201),(305,'Tiffin',202);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_firstname` varchar(30) NOT NULL,
  `customer_lastname` varchar(30) NOT NULL,
  `customer_password` varchar(20) NOT NULL,
  `customer_phoneno` varchar(12) NOT NULL,
  `customer_address` varchar(60) NOT NULL,
  `customer_email` varchar(30) NOT NULL,
  `Admin_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `Admin_id` (`Admin_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`Admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (101,'Rohan','Desai','rohan@111','9123456780','Bangalore','rohan@gmail.com',11),(102,'Meera','Kapoor','meera#222','9876543210','Mumbai','meera@gmail.com',11),(103,'Aditya','Malhotra','adi$333','9988776655','Ludhiana','adi@gmail.com',11),(104,'Janani','DK','iloveme','912345677','J96 BLOCK J XYZ apartments','xoxo@gmail.com',11);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_details`
--

DROP TABLE IF EXISTS `delivery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_details` (
  `delivery_id` int NOT NULL,
  `delivery_address` varchar(60) DEFAULT NULL,
  `delivery_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_details`
--

LOCK TABLES `delivery_details` WRITE;
/*!40000 ALTER TABLE `delivery_details` DISABLE KEYS */;
INSERT INTO `delivery_details` VALUES (501,'Bangalore','Delivered'),(502,'Chennai','Preparing'),(503,'J96 BLOCK J XYZ apartments','Preparing'),(504,'J96 BLOCK J XYZ apartments','Preparing'),(505,'J96 BLOCK J XYZ apartments','Preparing'),(506,'J96 BLOCK J XYZ apartments','Preparing'),(507,'J96 BLOCK J XYZ apartments','Preparing'),(508,'J96 BLOCK J XYZ apartments','Preparing'),(509,'J96 BLOCK J XYZ apartments','Preparing'),(510,'J96 BLOCK J XYZ apartments','Preparing');
/*!40000 ALTER TABLE `delivery_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `item_code` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(30) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`item_code`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (401,'Cheese Pasta',250,303),(402,'Veg Noodles',180,302),(403,'Butter Naan',40,301),(404,'Masala Dosa',120,301),(406,'French Fies',230,303),(407,'Chowmein',220,302),(408,'Cake',220,304),(409,'Masala Dosa',202,305);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `Order_id` int NOT NULL AUTO_INCREMENT,
  `Order_time` datetime DEFAULT NULL,
  `Order_amount` int DEFAULT NULL,
  `Order_status` varchar(20) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `delivery_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `payment_id` (`payment_id`),
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_10` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_details_ibfk_11` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_details_ibfk_12` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_details_ibfk_13` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_14` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_15` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_16` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_17` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_18` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_19` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_details` (`delivery_id`),
  CONSTRAINT `order_details_ibfk_20` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_21` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_22` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payment_details` (`payment_id`),
  CONSTRAINT `order_details_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_details_ibfk_6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_details_ibfk_7` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_details_ibfk_8` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_details_ibfk_9` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (701,'2022-12-20 10:30:00',300,'Preparing',101,501,601,201),(702,'2022-12-21 13:45:00',450,'Delivered',102,502,602,203),(703,'2026-03-25 11:56:28',160,'Preparing',104,503,603,202),(704,'2026-03-25 11:58:01',70,'Preparing',104,504,604,201),(705,'2026-03-25 18:50:33',620,'Preparing',104,505,605,201),(706,'2026-03-25 18:54:33',260,'Preparing',104,506,606,201),(707,'2026-03-25 18:55:51',250,'Preparing',104,507,607,203),(708,'2026-03-25 18:59:29',460,'Preparing',104,508,608,203),(709,'2026-03-25 18:59:48',290,'Preparing',104,509,609,202),(710,'2026-03-25 21:57:10',400,'Preparing',104,510,610,201);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `quantity` int DEFAULT NULL,
  `Order_id` int DEFAULT NULL,
  `item_code` int DEFAULT NULL,
  KEY `item_code` (`item_code`),
  KEY `Order_id` (`Order_id`),
  CONSTRAINT `orders_ibfk_10` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_11` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`),
  CONSTRAINT `orders_ibfk_12` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`),
  CONSTRAINT `orders_ibfk_13` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`),
  CONSTRAINT `orders_ibfk_14` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`),
  CONSTRAINT `orders_ibfk_15` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`),
  CONSTRAINT `orders_ibfk_16` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`),
  CONSTRAINT `orders_ibfk_17` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_7` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_8` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`),
  CONSTRAINT `orders_ibfk_9` FOREIGN KEY (`item_code`) REFERENCES `menu_items` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,701,401),(1,702,402),(1,703,403),(1,703,404),(1,705,407),(1,705,402),(1,705,408),(1,706,408),(1,706,403),(1,707,401),(2,708,406),(1,709,403),(1,709,401),(1,710,402),(1,710,408);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_id` int NOT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `payment_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (601,'UPI','2022-12-10 10:15:30'),(602,'CARD','2022-12-12 12:45:10'),(603,'UPI','2026-03-25 11:56:28'),(604,'COD','2026-03-25 11:58:01'),(605,'COD','2026-03-25 18:50:33'),(606,'COD','2026-03-25 18:54:33'),(607,'COD','2026-03-25 18:55:51'),(608,'COD','2026-03-25 18:59:29'),(609,'COD','2026-03-25 18:59:48'),(610,'CARD','2026-03-25 21:57:10');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `ratings` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_10` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `rating_ibfk_11` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_12` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_13` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_14` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_15` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_16` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_17` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_18` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_19` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_20` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `rating_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `rating_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `rating_ibfk_6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `rating_ibfk_7` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `rating_ibfk_8` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `rating_ibfk_9` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (4,101,201),(5,102,203),(4,104,202),(3,104,203),(4,104,201);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(30) DEFAULT NULL,
  `restaurant_address` varchar(60) DEFAULT NULL,
  `restaurant_password` varchar(20) DEFAULT NULL,
  `restaurant_phoneno` varchar(12) DEFAULT NULL,
  `Admin_id` int DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `Admin_id` (`Admin_id`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`Admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (201,'Urban Spice','Bangalore','us@201','8045678910',11),(202,'Spice Garden','Chennai','sg@202','8765432190',11),(203,'Bombay Bites','Mumbai','bb@203','9876012345',11),(204,'Platez','Tower Junction, Chennai','platezz','9234323332',11);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-30 20:01:40
