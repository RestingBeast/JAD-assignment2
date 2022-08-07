CREATE DATABASE  IF NOT EXISTS `assignment1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `assignment1`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment1
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `slots_taken` int NOT NULL,
  `fk_user_id` int NOT NULL,
  `fk_tour_id` int NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_payment_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id_idx` (`fk_user_id`),
  KEY `tourid_idx` (`fk_tour_id`),
  KEY `payment_id_idx` (`fk_payment_id`),
  CONSTRAINT `payment_id` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`),
  CONSTRAINT `tourid1` FOREIGN KEY (`fk_tour_id`) REFERENCES `tour` (`tourid`),
  CONSTRAINT `user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (11,15,1,3,1200,'2022-08-07 21:18:17',1),(12,20,1,7,3000,'2022-08-07 21:18:17',1),(13,30,2,8,2970,'2022-08-07 21:20:59',4);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryid` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Group','Explore together and forge lifelong friendships with people from all walks of life! '),(2,'Private','Explore with friends and families and enjoy a catered experience!'),(3,'Self-Guided','Customize your own journey however you want!');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `message` varchar(300) NOT NULL,
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'u1','u1@gmail.com','+123 456','Error','Error! Please Help!!!'),(2,'ff','ff','ff','ff','ff'),(3,'u3','u3@test.com','+123 456','Error','???'),(4,'u1','u1@gmail.com','+123 456','Error','!!!');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `phone_number` varchar(9) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `address` varchar(45) NOT NULL,
  `payment` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `userid_idx` (`fk_user_id`),
  CONSTRAINT `userid1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'JJ','67430912','326790','Dover',4200,'2022-08-07 21:18:09'),(4,2,'MM','89374920','285748','Clementi',2970,'2022-08-07 21:20:49');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `fk_user_id` int NOT NULL,
  `fk_tour_id` int NOT NULL,
  `review_id` int NOT NULL AUTO_INCREMENT,
  `review_desc` varchar(255) DEFAULT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `userid_idx` (`fk_user_id`),
  KEY `tourid_idx` (`fk_tour_id`),
  CONSTRAINT `tourid` FOREIGN KEY (`fk_tour_id`) REFERENCES `tour` (`tourid`),
  CONSTRAINT `userid` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `tourid` int NOT NULL AUTO_INCREMENT,
  `tour` varchar(45) NOT NULL,
  `brief_desc` varchar(100) DEFAULT NULL,
  `detailed_desc` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `slots` int NOT NULL,
  `fk_category_id` int NOT NULL,
  `tour_pic_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tourid`),
  KEY `fk_category_id_idx` (`fk_category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Let\'s Go Kelong Tour','Go on a sea adventure to explore Singaporean\'s waters for a unique experience!','Escape the concrete jungle, it\'s time for an adventure! Get out to sea on our fine catamaran and discover the North Eastern Banks of Singapore on this 3 hour Kelong Tour.',134.99,50,1,'kelong-tour.jpg','2022-06-19 18:37:17'),(2,'Bike & Bites Food Tour','Wanna sample local delights while working up an appetite?','Cycle through the streets and taste yummy local food with our experienced local guides. The 3 main ethnic groups in Singapore are the Chinese, Malays and Indians.',90,25,1,'bike-bite.jpg','2022-06-19 18:37:17'),(3,'Beyond Michelin Food Tour','This exciting food tour is a feast for your senses.','Let us take you beyond the famous Michelin food stalls and restaurants for an insider food tour to try some of the best Singapore dishes that only we locals know of.',80,30,1,'michelin.jpg','2022-06-19 18:37:17'),(4,'Chek Jawa Boardwalk Nature Tour','Let’s escape the urban jungle into a delightful green sanctuary.','Explore the Chek Jawa wetlands with a veteran Nature Guide and rediscover a treasure trove of biodiversity.  This rustic wonderland is home to an abundance of wildlife and diverse ecosystems, ranging from coastal forests to seagrass lagoons.',119.99,60,2,'boardway.jpg','2022-06-19 18:37:17'),(5,'Marina Bay Night Tour',' Get ready to be awed on our Marina Bay Night Tour!','If you think the Marina Bay is beautiful by day, wait till the sun sets! Get ready to be awed on our Marina Bay Night Tour!',60,40,2,'marina-bay.jpg','2022-06-19 18:37:17'),(6,'Cultural Appreciation: Melting Pot of Tea','We proudly present to you Singapore\'s first-ever tea appreciation tour. ','Immerse yourself in an unique experience of Singapore\'s history and heritage through tea appreciation.',125,80,2,'tea.jpg','2022-06-19 18:37:17'),(7,'Pulau Ubin Sunset Dinner Cruise','Set sail into the golden busk of sunset!','Let’s set sail into the sunset, rediscover the waters around Pulau Ubin!',150,100,3,'dinner-cruise.jpg','2022-06-19 18:37:17'),(8,'Pulau Ubin Tour: The Wild Side','We will take you on an in-depth tour of the treasures that Pulau Ubin has to offer.','If you are a nature lover, embark on a little adventure and rediscover Pulau Ubin in a whole new light!',99.99,35,3,'wild-side.jpg','2022-06-19 18:37:17'),(9,'Chinese Street Food Tour','Explore Singapore’s unique food culture!','More than just a Singapore street food tour, delve deeper into the local ingredients used and understand the evolution of taste over time.',74.99,75,3,'chinese-food.jpg','2022-06-19 18:37:17');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(45) NOT NULL,
  `profile_pic_url` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'u1','u1@gmail.com','p1','Member','profile-image.png','2022-06-19 17:45:29'),(2,'u2','u2@gmail.com','p2','Admin','profile-image.png','2022-06-19 17:45:46'),(3,'u3','u3@test.com','p3','Member','profile-image.png','2022-06-30 07:35:23'),(4,'u9','u9@abc.com','p9','Member','profile-image.png','2022-06-30 08:21:47');
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

-- Dump completed on 2022-08-08  6:47:28
