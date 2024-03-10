-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mathbuddy
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add topic',7,'add_topic'),(26,'Can change topic',7,'change_topic'),(27,'Can delete topic',7,'delete_topic'),(28,'Can view topic',7,'view_topic'),(29,'Can add room',8,'add_room'),(30,'Can change room',8,'change_room'),(31,'Can delete room',8,'delete_room'),(32,'Can view room',8,'view_room'),(33,'Can add message',9,'add_message'),(34,'Can change message',9,'change_message'),(35,'Can delete message',9,'delete_message'),(36,'Can view message',9,'view_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_message`
--

DROP TABLE IF EXISTS `base_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_message_room_id_6b04a640_fk_base_room_id` (`room_id`),
  KEY `base_message_user_id_46a57e37_fk_base_user_id` (`user_id`),
  CONSTRAINT `base_message_room_id_6b04a640_fk_base_room_id` FOREIGN KEY (`room_id`) REFERENCES `base_room` (`id`),
  CONSTRAINT `base_message_user_id_46a57e37_fk_base_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_message`
--

LOCK TABLES `base_message` WRITE;
/*!40000 ALTER TABLE `base_message` DISABLE KEYS */;
INSERT INTO `base_message` VALUES (1,'Question: There are 5 apples in one basket and 3 apples in another basket. How many apples are there altogether?','2024-03-10 06:18:44.106249','2024-03-10 06:18:44.106249',7,3),(2,'To find the total number of apples, we add the number of apples in each basket. 5 apples (first basket) + 3 apples (second basket) = 8 apples altogether.','2024-03-10 06:18:59.749127','2024-03-10 06:18:59.749127',7,3),(3,'There are 5 apples in one basket, 3 apples in another basket, and 2 more apples in another basket. How many apples are there altogether?','2024-03-10 06:20:46.049705','2024-03-10 06:20:46.049705',7,1),(4,'To find the total number of apples, we add the number of apples in each basket. 5 apples (first basket) + 3 apples (second basket) + 2 apples (third basket) = 10 apples altogether.  So, there are 10 apples altogether.','2024-03-10 06:24:35.218077','2024-03-10 06:24:35.218077',7,2),(5,'Next Question for all of you','2024-03-10 06:24:42.433404','2024-03-10 06:24:42.433404',7,2),(6,'Question: Sarah has 8 pencils. She gives 3 pencils to her friend. How many pencils does Sarah have left?  Solution: To find out how many pencils Sarah has left, we need to subtract the number of pencils she gave to her friend from the total number of pencils she had originally. 8 pencils (total) - 3 pencils (given to friend) = 5 pencils left.  So, Sarah has 5 pencils left.','2024-03-10 06:24:54.637955','2024-03-10 06:24:54.637955',7,2),(13,'Which of the following shapes has no corners or angles?  a) Square b) Triangle c) Circle d) Rectangle','2024-03-10 06:38:59.224156','2024-03-10 06:38:59.224156',8,2),(14,'To answer this question, we need to remember that a shape with no corners or angles is called a circle. Among the options provided, the shape labeled \"circle\" has no corners or angles, as it is a curved shape.','2024-03-10 06:39:11.966377','2024-03-10 06:39:11.966377',8,2),(16,'thank sir','2024-03-10 06:43:09.102532','2024-03-10 06:43:09.102532',8,3),(17,'Question: Which shape has three sides?  a) Circle b) Square c) Triangle d) Rectangle','2024-03-10 06:43:39.004848','2024-03-10 06:43:39.004848',8,2),(18,' a shape with three sides is called a triangle. Among the options provided, the shape labeled \"triangle\" has three sides.','2024-03-10 06:44:11.118067','2024-03-10 06:44:11.118067',8,3),(19,'Consider the following sets: Set A = {red, blue, green, yellow} Set B = {green, orange, purple}  a) What are the elements in the union of sets A and B? b) What are the elements in the intersection of sets A and B?','2024-03-10 06:58:00.272955','2024-03-10 06:58:00.272955',6,2),(20,'a) The elements in the union of sets A and B are {red, blue, green, yellow, orange, purple}. b) The elements in the intersection of sets A and B are {green}.','2024-03-10 06:58:19.294085','2024-03-10 06:58:19.294085',6,2),(21,'Maria bought a dress for $50 and sold it for $70. Did she make a profit or a loss, and by how much?','2024-03-10 06:59:05.947624','2024-03-10 06:59:05.947624',4,3),(22,'Solution: To find out if Maria made a profit or a loss, we need to compare the selling price with the buying price.  Buying price = $50 Selling price = $70  Profit/Loss = Selling price - Buying price  Profit/Loss = $70 - $50 Profit/Loss = $20  Since the result is positive ($20), Maria made a profit. The amount of profit is $20.  So, Maria made a profit of $20.','2024-03-10 06:59:26.165868','2024-03-10 06:59:26.165868',4,2),(23,'John bought a toy for $25 and sold it for $20. Did he make a profit or a loss, and by how much?','2024-03-10 06:59:48.587200','2024-03-10 06:59:48.587200',4,2),(24,'Solution: To determine if John made a profit or a loss, we compare the selling price with the buying price.  Buying price = $25 Selling price = $20  Profit/Loss = Selling price - Buying price  Profit/Loss = $20 - $25 Profit/Loss = -$5  Since the result is negative (-$5), John made a loss. The amount of loss is $5.  So, John made a loss of $5.','2024-03-10 07:00:06.827886','2024-03-10 07:00:06.827886',4,3),(25,'Let\'s start todays attendance.','2024-03-10 07:09:41.176339','2024-03-10 07:09:41.176339',1,2),(26,'yes','2024-03-10 07:09:52.225315','2024-03-10 07:09:52.225315',1,3);
/*!40000 ALTER TABLE `base_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_room`
--

DROP TABLE IF EXISTS `base_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `host_id` bigint(20) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_room_host_id_6c009082_fk_base_user_id` (`host_id`),
  KEY `base_room_topic_id_42a6b2b8_fk_base_topic_id` (`topic_id`),
  CONSTRAINT `base_room_host_id_6c009082_fk_base_user_id` FOREIGN KEY (`host_id`) REFERENCES `base_user` (`id`),
  CONSTRAINT `base_room_topic_id_42a6b2b8_fk_base_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `base_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_room`
--

LOCK TABLES `base_room` WRITE;
/*!40000 ALTER TABLE `base_room` DISABLE KEYS */;
INSERT INTO `base_room` VALUES (1,'Grade 1','This is a attendance room for grade 1.','2024-03-10 03:19:20.277598','2024-03-10 03:19:20.277598',2,1),(3,'Set','This is a grade 1 room for learning algebra.','2024-03-10 03:23:00.007691','2024-03-10 03:20:32.561873',2,4),(4,'Profile and Loss','This is a grade 1 room for profit and loss.','2024-03-10 03:25:23.219637','2024-03-10 03:25:23.219637',2,4),(5,'Algebra','This is a grade  1 for Algrebra.','2024-03-10 03:26:46.970313','2024-03-10 03:26:46.970313',2,4),(6,'Set','This is a set lesson for grade 2.','2024-03-10 03:27:40.494360','2024-03-10 03:27:40.494360',2,5),(7,'Simplify','This is a simplify for grade 2.','2024-03-10 03:28:01.106762','2024-03-10 03:28:01.106762',2,5),(8,'Geometry','This is a geometry lesson for grade 2.','2024-03-10 03:28:29.290820','2024-03-10 03:28:29.290820',2,5);
/*!40000 ALTER TABLE `base_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_room_participants`
--

DROP TABLE IF EXISTS `base_room_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_room_participants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_room_participants_room_id_user_id_2e298648_uniq` (`room_id`,`user_id`),
  KEY `base_room_participants_user_id_2a86ea9a_fk_base_user_id` (`user_id`),
  CONSTRAINT `base_room_participants_room_id_8701ee11_fk_base_room_id` FOREIGN KEY (`room_id`) REFERENCES `base_room` (`id`),
  CONSTRAINT `base_room_participants_user_id_2a86ea9a_fk_base_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_room_participants`
--

LOCK TABLES `base_room_participants` WRITE;
/*!40000 ALTER TABLE `base_room_participants` DISABLE KEYS */;
INSERT INTO `base_room_participants` VALUES (25,1,2),(26,1,3),(22,4,2),(21,4,3),(19,6,2),(3,7,1),(4,7,2),(1,7,3),(13,8,2),(16,8,3);
/*!40000 ALTER TABLE `base_room_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_topic`
--

DROP TABLE IF EXISTS `base_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_topic`
--

LOCK TABLES `base_topic` WRITE;
/*!40000 ALTER TABLE `base_topic` DISABLE KEYS */;
INSERT INTO `base_topic` VALUES (1,'Attendance'),(4,'Grade 1'),(5,'Grade 2');
/*!40000 ALTER TABLE `base_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_user`
--

DROP TABLE IF EXISTS `base_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `bio` longtext DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `base_user_email_fbc4c0ff_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user`
--

LOCK TABLES `base_user` WRITE;
/*!40000 ALTER TABLE `base_user` DISABLE KEYS */;
INSERT INTO `base_user` VALUES (1,'pbkdf2_sha256$260000$zhxhXD1vQ4oUrSZDYwFlxt$1SEvTFqy10YdJX/aL3jOzxpRG3hqtcOO5vfeTZNwn8Y=','2024-03-10 06:16:12.421709',1,'admin','','','admin@gmail.com',1,1,'2024-03-10 03:15:20.400395',NULL,NULL,'avatar.svg'),(2,'pbkdf2_sha256$260000$hVsPsLZu60iJ3RtxoFLm8h$x2d6MAHzSFTXw0wrr/s7X0Ksrx55oEJlbCvYy+5ue+8=','2024-03-10 06:23:55.843906',1,'dhan','Dhan Bdr','Karki','hunterdbk5@gmail.com',1,1,'2024-03-10 03:16:51.000000','Hi, I\'m a math teacher. I teach mathematics to the enthusiatic learners.','Dhan Bdr Karki','dhan_profile.jpg'),(3,'pbkdf2_sha256$260000$0rAAGDWzH8W6V9QcKPjIXv$6uOqGNIIk44Gxxk//oS7yGAd/72ti2wc+75o9ZNVyR8=','2024-03-10 06:16:54.924100',0,'sagar','','','sagar@gmail.com',0,1,'2024-03-10 06:16:54.787298','Student','Sagar Khatri','linux.png');
/*!40000 ALTER TABLE `base_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_user_groups`
--

DROP TABLE IF EXISTS `base_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_user_groups_user_id_group_id_774631b7_uniq` (`user_id`,`group_id`),
  KEY `base_user_groups_group_id_c0eca7d6_fk_auth_group_id` (`group_id`),
  CONSTRAINT `base_user_groups_group_id_c0eca7d6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `base_user_groups_user_id_29a796b6_fk_base_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user_groups`
--

LOCK TABLES `base_user_groups` WRITE;
/*!40000 ALTER TABLE `base_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_user_user_permissions`
--

DROP TABLE IF EXISTS `base_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_user_user_permissions_user_id_permission_id_e9093277_uniq` (`user_id`,`permission_id`),
  KEY `base_user_user_permi_permission_id_0418bc02_fk_auth_perm` (`permission_id`),
  CONSTRAINT `base_user_user_permi_permission_id_0418bc02_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `base_user_user_permissions_user_id_2eec4d63_fk_base_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user_user_permissions`
--

LOCK TABLES `base_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `base_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_base_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_base_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-03-10 03:18:03.616661','1','Attendance',1,'[{\"added\": {}}]',7,2),(2,'2024-03-10 03:18:16.969175','2','Grade 1',1,'[{\"added\": {}}]',7,2),(3,'2024-03-10 03:18:30.593727','3','Grade 2',1,'[{\"added\": {}}]',7,2),(4,'2024-03-10 03:19:20.305403','1','Grade 1',1,'[{\"added\": {}}]',8,2),(5,'2024-03-10 03:19:54.361726','2','Grade 1',1,'[{\"added\": {}}]',8,2),(6,'2024-03-10 03:20:12.221033','2','Grade 1',3,'',8,2),(7,'2024-03-10 03:20:32.593376','3','Grade 2',1,'[{\"added\": {}}]',8,2),(8,'2024-03-10 03:21:34.552069','3','Grade 2',3,'',7,2),(9,'2024-03-10 03:21:34.552069','2','Grade 1',3,'',7,2),(10,'2024-03-10 03:21:58.504407','4','Grade 1',1,'[{\"added\": {}}]',7,2),(11,'2024-03-10 03:22:06.296920','5','Grade 2',1,'[{\"added\": {}}]',7,2),(12,'2024-03-10 03:23:00.023356','3','Set',2,'[{\"changed\": {\"fields\": [\"Topic\", \"Name\", \"Description\"]}}]',8,2),(13,'2024-03-10 03:25:23.235339','4','Profile and Loss',1,'[{\"added\": {}}]',8,2),(14,'2024-03-10 03:26:46.970313','5','Algebra',1,'[{\"added\": {}}]',8,2),(15,'2024-03-10 03:27:40.525741','6','Set',1,'[{\"added\": {}}]',8,2),(16,'2024-03-10 03:28:01.106762','7','Simplify',1,'[{\"added\": {}}]',8,2),(17,'2024-03-10 03:28:29.290820','8','Geometry',1,'[{\"added\": {}}]',8,2),(18,'2024-03-10 06:22:46.227288','2','hunterdbk5@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Name\", \"Email\", \"Bio\"]}}]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'base','message'),(8,'base','room'),(7,'base','topic'),(6,'base','user'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-23 06:16:27.493477'),(2,'contenttypes','0002_remove_content_type_name','2024-02-23 06:16:27.598247'),(3,'auth','0001_initial','2024-02-23 06:16:27.908457'),(4,'auth','0002_alter_permission_name_max_length','2024-02-23 06:16:27.997757'),(5,'auth','0003_alter_user_email_max_length','2024-02-23 06:16:28.005158'),(6,'auth','0004_alter_user_username_opts','2024-02-23 06:16:28.015632'),(7,'auth','0005_alter_user_last_login_null','2024-02-23 06:16:28.024261'),(8,'auth','0006_require_contenttypes_0002','2024-02-23 06:16:28.030818'),(9,'auth','0007_alter_validators_add_error_messages','2024-02-23 06:16:28.038826'),(10,'auth','0008_alter_user_username_max_length','2024-02-23 06:16:28.044921'),(11,'auth','0009_alter_user_last_name_max_length','2024-02-23 06:16:28.068028'),(12,'auth','0010_alter_group_name_max_length','2024-02-23 06:16:28.087272'),(13,'auth','0011_update_proxy_permissions','2024-02-23 06:16:28.103225'),(14,'auth','0012_alter_user_first_name_max_length','2024-02-23 06:16:28.117163'),(15,'base','0001_initial','2024-02-23 06:16:29.080133'),(16,'admin','0001_initial','2024-02-23 06:16:29.258372'),(17,'admin','0002_logentry_remove_auto_add','2024-02-23 06:16:29.282700'),(18,'admin','0003_logentry_add_action_flag_choices','2024-02-23 06:16:29.298191'),(19,'base','0002_auto_20210921_1315','2024-02-23 06:16:29.408401'),(20,'base','0003_user_avatar','2024-02-23 06:16:29.429212'),(21,'sessions','0001_initial','2024-02-23 06:16:29.465086'),(22,'base','0004_alter_user_username','2024-03-10 02:56:22.583970'),(23,'base','0005_alter_room_topic','2024-03-10 02:56:22.621294');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9p3nehbgzq7u6uuutrz4vumv9zrfm2xf','.eJxVjDsOwjAQBe_iGll2_A0lPWewdtcbHEC2FCcV4u4QKQW0b2beSyTY1pK2zkuasziLQZx-NwR6cN1BvkO9NUmtrsuMclfkQbu8tszPy-H-HRTo5VtHcplCiFlHBu_jOBm0Co31IbhJecwYRo3RacsGLLKy5BiU0zQwuSDeH-DrN9o:1rj9gf:Gc0ojlY5c2o4hFWbbHIuVRCYvUXNOfHu16UxnzApHUw','2024-03-24 03:17:21.754492'),('gv3a0ppfsmudmq4fs1hedb4e15w0f63y','.eJxVjDsOwjAQBe_iGll2_A0lPWewdtcbHEC2FCcV4u4QKQW0b2beSyTY1pK2zkuasziLQZx-NwR6cN1BvkO9NUmtrsuMclfkQbu8tszPy-H-HRTo5VtHcplCiFlHBu_jOBm0Co31IbhJecwYRo3RacsGLLKy5BiU0zQwuSDeH-DrN9o:1rjCbD:YK2XJvX7I7B30zOiD0zROUU9n10CeQeX5bk0N8WThFI','2024-03-24 06:23:55.861397'),('vgn1cxu0jz82x3icy94vq5cs250xis50','.eJxVjDsOwjAQBe_iGln-xWso6XMGy-td4wBypDipEHeHSCmgfTPzXiKmba1x67zEicRFaHH63TDlB7cd0D212yzz3NZlQrkr8qBdjjPx83q4fwc19fqt2TNqzKoQeo-ACix7W6wC57Id2FgKzlAqxmulzsFzVgQWIBQAGrR4fwDx9Tek:1rjCTk:ITp3FWyhTscNXBp18yepWh-hdDBvZkaY8u5YoZ8YBgE','2024-03-24 06:16:12.426216'),('xbi3jytg1f95u0d0nrvjc5cjne9o4pql','.eJxVjMEOwiAQBf-FsyFAoYBH7_0GsrCsVA0kpT0Z_9026UGvM_PemwXY1hK2npcwI7uygV1-WYT0zPUQ-IB6bzy1ui5z5EfCT9v51DC_bmf7d1Cgl309JswjOfKD806R1RYpRaEASZFA0jRIaYRFqbxWESAZyMIZ3LFOENnnCwAfOIs:1rjCUQ:vMsde4JrsvSpmm7vfGe5h6ofoVa2wfDAxlED6A6dYug','2024-03-24 06:16:54.928773');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-10 13:59:44
