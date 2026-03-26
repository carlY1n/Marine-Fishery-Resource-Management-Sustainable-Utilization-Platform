-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: system
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `app_account`
--

DROP TABLE IF EXISTS `app_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_account`
--

LOCK TABLES `app_account` WRITE;
/*!40000 ALTER TABLE `app_account` DISABLE KEYS */;
INSERT INTO `app_account` VALUES (1,'1','2'),(2,'2','3'),(3,'4','5'),(4,'3','4'),(5,'5','6'),(6,'10','3');
/*!40000 ALTER TABLE `app_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add account',7,'add_account'),(26,'Can change account',7,'change_account'),(27,'Can delete account',7,'delete_account'),(28,'Can view account',7,'view_account');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_management`
--

DROP TABLE IF EXISTS `data_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_management` (
  `ID` int NOT NULL,
  `ocean_researcher` int DEFAULT NULL,
  `ocean_observation_station` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ocean_researcher` (`ocean_researcher`),
  KEY `ocean_observation_station` (`ocean_observation_station`),
  CONSTRAINT `data_management_ibfk_1` FOREIGN KEY (`ocean_researcher`) REFERENCES `ocean_researcher` (`ID`),
  CONSTRAINT `data_management_ibfk_2` FOREIGN KEY (`ocean_observation_station`) REFERENCES `ocean_observation_station` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_management`
--

LOCK TABLES `data_management` WRITE;
/*!40000 ALTER TABLE `data_management` DISABLE KEYS */;
INSERT INTO `data_management` VALUES (1,5,1);
/*!40000 ALTER TABLE `data_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','account'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-05 06:37:16.132241'),(2,'auth','0001_initial','2025-01-05 06:37:16.408389'),(3,'admin','0001_initial','2025-01-05 06:37:16.486731'),(4,'admin','0002_logentry_remove_auto_add','2025-01-05 06:37:16.486731'),(5,'admin','0003_logentry_add_action_flag_choices','2025-01-05 06:37:16.499318'),(6,'app','0001_initial','2025-01-05 06:37:16.519915'),(7,'contenttypes','0002_remove_content_type_name','2025-01-05 06:37:16.568749'),(8,'auth','0002_alter_permission_name_max_length','2025-01-05 06:37:16.623445'),(9,'auth','0003_alter_user_email_max_length','2025-01-05 06:37:16.628462'),(10,'auth','0004_alter_user_username_opts','2025-01-05 06:37:16.640208'),(11,'auth','0005_alter_user_last_login_null','2025-01-05 06:37:16.678592'),(12,'auth','0006_require_contenttypes_0002','2025-01-05 06:37:16.679693'),(13,'auth','0007_alter_validators_add_error_messages','2025-01-05 06:37:16.683899'),(14,'auth','0008_alter_user_username_max_length','2025-01-05 06:37:16.720199'),(15,'auth','0009_alter_user_last_name_max_length','2025-01-05 06:37:16.755598'),(16,'auth','0010_alter_group_name_max_length','2025-01-05 06:37:16.767535'),(17,'auth','0011_update_proxy_permissions','2025-01-05 06:37:16.772426'),(18,'auth','0012_alter_user_first_name_max_length','2025-01-05 06:37:16.812145'),(19,'sessions','0001_initial','2025-01-05 06:37:16.822012');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment_data`
--

DROP TABLE IF EXISTS `environment_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environment_data` (
  `ID` int NOT NULL,
  `marine` int DEFAULT NULL,
  `collection_time` datetime NOT NULL,
  `water_quality` varchar(10) NOT NULL,
  `water_temperature` int NOT NULL,
  `salinity` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `marine` (`marine`),
  CONSTRAINT `environment_data_ibfk_1` FOREIGN KEY (`marine`) REFERENCES `marine` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment_data`
--

LOCK TABLES `environment_data` WRITE;
/*!40000 ALTER TABLE `environment_data` DISABLE KEYS */;
INSERT INTO `environment_data` VALUES (2,2,'2025-01-05 14:30:00','1',1,1),(1001,10,'2025-01-01 10:00:00','Good',25,3);
/*!40000 ALTER TABLE `environment_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishery_activity`
--

DROP TABLE IF EXISTS `fishery_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishery_activity` (
  `ID` int NOT NULL,
  `marine` int DEFAULT NULL,
  `environment_data` int DEFAULT NULL,
  `fishery_resource` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `marine` (`marine`),
  KEY `environment_data` (`environment_data`),
  KEY `fishery_resource` (`fishery_resource`),
  CONSTRAINT `fishery_activity_ibfk_1` FOREIGN KEY (`marine`) REFERENCES `marine` (`ID`),
  CONSTRAINT `fishery_activity_ibfk_2` FOREIGN KEY (`environment_data`) REFERENCES `environment_data` (`ID`),
  CONSTRAINT `fishery_activity_ibfk_3` FOREIGN KEY (`fishery_resource`) REFERENCES `fishery_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishery_activity`
--

LOCK TABLES `fishery_activity` WRITE;
/*!40000 ALTER TABLE `fishery_activity` DISABLE KEYS */;
INSERT INTO `fishery_activity` VALUES (1,10,1001,1001),(2,2,1001,1001);
/*!40000 ALTER TABLE `fishery_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishery_activity_application`
--

DROP TABLE IF EXISTS `fishery_activity_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishery_activity_application` (
  `ID` int NOT NULL,
  `fishery_activity` int DEFAULT NULL,
  `activity_period` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  `application_time` datetime NOT NULL DEFAULT '2025-01-01 00:00:00',
  `approval_status` tinyint(1) NOT NULL DEFAULT '1',
  `approval_time` datetime NOT NULL DEFAULT '2025-01-01 00:00:00',
  `approver` int DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `fishery_activity` (`fishery_activity`),
  KEY `approver` (`approver`),
  CONSTRAINT `fishery_activity_application_ibfk_1` FOREIGN KEY (`fishery_activity`) REFERENCES `fishery_activity` (`ID`),
  CONSTRAINT `fishery_activity_application_ibfk_2` FOREIGN KEY (`approver`) REFERENCES `ocean_management` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishery_activity_application`
--

LOCK TABLES `fishery_activity_application` WRITE;
/*!40000 ALTER TABLE `fishery_activity_application` DISABLE KEYS */;
INSERT INTO `fishery_activity_application` VALUES (1,1,'2025-01-01 to 2025-01-05','2025-01-01 09:00:00',1,'2025-01-02 10:00:00',4);
/*!40000 ALTER TABLE `fishery_activity_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishery_resource`
--

DROP TABLE IF EXISTS `fishery_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishery_resource` (
  `ID` int NOT NULL,
  `marine` int DEFAULT NULL,
  `collection_time` datetime NOT NULL,
  `types` varchar(10) NOT NULL,
  `quantities` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `marine` (`marine`),
  CONSTRAINT `fishery_resource_ibfk_1` FOREIGN KEY (`marine`) REFERENCES `marine` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishery_resource`
--

LOCK TABLES `fishery_resource` WRITE;
/*!40000 ALTER TABLE `fishery_resource` DISABLE KEYS */;
INSERT INTO `fishery_resource` VALUES (2,2,'2025-01-01 00:00:00','1','1'),(1001,10,'2025-01-01 12:00:00','Fish','1000');
/*!40000 ALTER TABLE `fishery_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishery_user`
--

DROP TABLE IF EXISTS `fishery_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishery_user` (
  `ID` int NOT NULL COMMENT '用户唯一标识',
  `company_id` int NOT NULL COMMENT '营业执照编号',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `state` tinyint(1) NOT NULL COMMENT '违规状态',
  PRIMARY KEY (`ID`),
  CONSTRAINT `fishery_user_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishery_user`
--

LOCK TABLES `fishery_user` WRITE;
/*!40000 ALTER TABLE `fishery_user` DISABLE KEYS */;
INSERT INTO `fishery_user` VALUES (2,101,'Bob','Address A',1);
/*!40000 ALTER TABLE `fishery_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geographical_location`
--

DROP TABLE IF EXISTS `geographical_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geographical_location` (
  `longitude` varchar(10) NOT NULL,
  `latitude` varchar(10) NOT NULL,
  PRIMARY KEY (`longitude`,`latitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geographical_location`
--

LOCK TABLES `geographical_location` WRITE;
/*!40000 ALTER TABLE `geographical_location` DISABLE KEYS */;
INSERT INTO `geographical_location` VALUES ('120.5','30.5');
/*!40000 ALTER TABLE `geographical_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_of_fishery_practitioners`
--

DROP TABLE IF EXISTS `management_of_fishery_practitioners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_of_fishery_practitioners` (
  `ID` int NOT NULL,
  `fishery_user` int DEFAULT NULL,
  `ocean_management` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fishery_user` (`fishery_user`),
  KEY `ocean_management` (`ocean_management`),
  CONSTRAINT `management_of_fishery_practitioners_ibfk_1` FOREIGN KEY (`fishery_user`) REFERENCES `fishery_user` (`ID`),
  CONSTRAINT `management_of_fishery_practitioners_ibfk_2` FOREIGN KEY (`ocean_management`) REFERENCES `ocean_management` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_of_fishery_practitioners`
--

LOCK TABLES `management_of_fishery_practitioners` WRITE;
/*!40000 ALTER TABLE `management_of_fishery_practitioners` DISABLE KEYS */;
INSERT INTO `management_of_fishery_practitioners` VALUES (1,2,4);
/*!40000 ALTER TABLE `management_of_fishery_practitioners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marine`
--

DROP TABLE IF EXISTS `marine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marine` (
  `ID` int NOT NULL,
  `geographical_location` varchar(20) NOT NULL,
  `range` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marine`
--

LOCK TABLES `marine` WRITE;
/*!40000 ALTER TABLE `marine` DISABLE KEYS */;
INSERT INTO `marine` VALUES (1,'1','1'),(2,'1','1'),(3,'1','1'),(4,'1','1'),(10,'120.5,30.5','Region A'),(20,'1','1'),(104,'1','1');
/*!40000 ALTER TABLE `marine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normal_user`
--

DROP TABLE IF EXISTS `normal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normal_user` (
  `ID` int NOT NULL COMMENT '用户唯一标识',
  PRIMARY KEY (`ID`),
  CONSTRAINT `normal_user_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normal_user`
--

LOCK TABLES `normal_user` WRITE;
/*!40000 ALTER TABLE `normal_user` DISABLE KEYS */;
INSERT INTO `normal_user` VALUES (3);
/*!40000 ALTER TABLE `normal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocean_management`
--

DROP TABLE IF EXISTS `ocean_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocean_management` (
  `ID` int NOT NULL,
  `work_id` int NOT NULL,
  `sea_id` int DEFAULT NULL,
  `work` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `sea_id` (`sea_id`),
  CONSTRAINT `ocean_management_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `ocean_management_ibfk_2` FOREIGN KEY (`sea_id`) REFERENCES `marine` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocean_management`
--

LOCK TABLES `ocean_management` WRITE;
/*!40000 ALTER TABLE `ocean_management` DISABLE KEYS */;
INSERT INTO `ocean_management` VALUES (4,101,10,'Marine Management Work');
/*!40000 ALTER TABLE `ocean_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocean_observation_station`
--

DROP TABLE IF EXISTS `ocean_observation_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocean_observation_station` (
  `ID` int NOT NULL,
  `marine` int DEFAULT NULL,
  `environment_data` int DEFAULT NULL,
  `fishery_resource` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `marine` (`marine`),
  KEY `environment_data` (`environment_data`),
  KEY `fishery_resource` (`fishery_resource`),
  CONSTRAINT `ocean_observation_station_ibfk_1` FOREIGN KEY (`marine`) REFERENCES `marine` (`ID`),
  CONSTRAINT `ocean_observation_station_ibfk_2` FOREIGN KEY (`environment_data`) REFERENCES `environment_data` (`ID`),
  CONSTRAINT `ocean_observation_station_ibfk_3` FOREIGN KEY (`fishery_resource`) REFERENCES `fishery_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocean_observation_station`
--

LOCK TABLES `ocean_observation_station` WRITE;
/*!40000 ALTER TABLE `ocean_observation_station` DISABLE KEYS */;
INSERT INTO `ocean_observation_station` VALUES (1,10,1001,1001);
/*!40000 ALTER TABLE `ocean_observation_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocean_observation_station_management`
--

DROP TABLE IF EXISTS `ocean_observation_station_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocean_observation_station_management` (
  `ID` int NOT NULL,
  `ocean_researcher` int DEFAULT NULL,
  `ocean_observation_station` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ocean_researcher` (`ocean_researcher`),
  KEY `ocean_observation_station` (`ocean_observation_station`),
  CONSTRAINT `ocean_observation_station_management_ibfk_1` FOREIGN KEY (`ocean_researcher`) REFERENCES `ocean_researcher` (`ID`),
  CONSTRAINT `ocean_observation_station_management_ibfk_2` FOREIGN KEY (`ocean_observation_station`) REFERENCES `ocean_observation_station` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocean_observation_station_management`
--

LOCK TABLES `ocean_observation_station_management` WRITE;
/*!40000 ALTER TABLE `ocean_observation_station_management` DISABLE KEYS */;
INSERT INTO `ocean_observation_station_management` VALUES (1,5,1);
/*!40000 ALTER TABLE `ocean_observation_station_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocean_researcher`
--

DROP TABLE IF EXISTS `ocean_researcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocean_researcher` (
  `ID` int NOT NULL,
  `work_id` int NOT NULL,
  `sea_id` int DEFAULT NULL,
  `work` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `sea_id` (`sea_id`),
  CONSTRAINT `ocean_researcher_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `ocean_researcher_ibfk_2` FOREIGN KEY (`sea_id`) REFERENCES `marine` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocean_researcher`
--

LOCK TABLES `ocean_researcher` WRITE;
/*!40000 ALTER TABLE `ocean_researcher` DISABLE KEYS */;
INSERT INTO `ocean_researcher` VALUES (5,303,10,'Marine Research and Data Collection');
/*!40000 ALTER TABLE `ocean_researcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `ID` int NOT NULL,
  `responsible_person` int DEFAULT NULL,
  `announcement_content` varchar(1000) NOT NULL,
  `time_period` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `responsible_person` (`responsible_person`),
  CONSTRAINT `policy_ibfk_1` FOREIGN KEY (`responsible_person`) REFERENCES `ocean_management` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (1,4,'Policy announcement text...','2025-01-01 to 2025-12-31'),(2,4,'1123','100');
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestion`
--

DROP TABLE IF EXISTS `suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestion` (
  `ID` int NOT NULL,
  `submitter` int DEFAULT NULL,
  `suggested_content` varchar(1000) NOT NULL,
  `approver` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `submitter` (`submitter`),
  KEY `approver` (`approver`),
  CONSTRAINT `suggestion_ibfk_1` FOREIGN KEY (`submitter`) REFERENCES `user` (`ID`),
  CONSTRAINT `suggestion_ibfk_2` FOREIGN KEY (`approver`) REFERENCES `ocean_management` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestion`
--

LOCK TABLES `suggestion` WRITE;
/*!40000 ALTER TABLE `suggestion` DISABLE KEYS */;
INSERT INTO `suggestion` VALUES (1,1,'Suggestion content text...',4),(2,2,'123',4);
/*!40000 ALTER TABLE `suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL COMMENT '用户唯一标识',
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `identity` int NOT NULL COMMENT '用户身份',
  `tel` varchar(15) NOT NULL COMMENT '电话',
  `gender` varchar(10) NOT NULL COMMENT '性别',
  PRIMARY KEY (`ID`),
  CONSTRAINT `User_check_2` CHECK ((`identity` in (1,2,3,4))),
  CONSTRAINT `User_check_3` CHECK ((`gender` in (_utf8mb4'male',_utf8mb4'female')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Alice','password123',1,'13812345678','female'),(2,'Bob','password123',2,'13912345678','male'),(3,'Charlie','password123',1,'13712345678','male'),(4,'John Doe','password123',3,'1234567890','male'),(5,'Alice Green','password789',4,'1231231230','female');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-06  0:56:01
