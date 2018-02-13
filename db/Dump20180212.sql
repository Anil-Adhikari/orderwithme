CREATE DATABASE  IF NOT EXISTS `orderwithme` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `orderwithme`;
-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: orderwithme
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

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
-- Table structure for table `orderwihme_menu`
--

DROP TABLE IF EXISTS `orderwihme_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderwihme_menu` (
  `menuId` int(11) NOT NULL,
  `ord_menu_restaurantId` int(11) NOT NULL,
  `ord_menu_createdDate` datetime DEFAULT NULL,
  `ord_menu_isUpdated` int(11) DEFAULT NULL,
  `ord_menu_updated_date` datetime DEFAULT NULL,
  `ord_menu_isDeleted` int(11) DEFAULT NULL,
  `ord_menu_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `fk_menu_restaurant_idx` (`ord_menu_restaurantId`),
  CONSTRAINT `fk_menu_restaurant` FOREIGN KEY (`ord_menu_restaurantId`) REFERENCES `orderwithme_restaurant` (`resturantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderwihme_menu`
--

LOCK TABLES `orderwihme_menu` WRITE;
/*!40000 ALTER TABLE `orderwihme_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderwihme_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderwithme_image`
--

DROP TABLE IF EXISTS `orderwithme_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderwithme_image` (
  `imageId` int(11) NOT NULL,
  `ord_image_imageUrl` varchar(200) DEFAULT NULL,
  `ord_image_caption` varchar(400) DEFAULT NULL,
  `ord_image_description` text,
  `ord_image_uploaded_date` datetime NOT NULL,
  `ord_image_isDeleted` int(11) DEFAULT NULL,
  `ord_image_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderwithme_image`
--

LOCK TABLES `orderwithme_image` WRITE;
/*!40000 ALTER TABLE `orderwithme_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderwithme_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderwithme_item`
--

DROP TABLE IF EXISTS `orderwithme_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderwithme_item` (
  `itemId` int(11) NOT NULL,
  `ord_item_menuId` int(11) NOT NULL,
  `ord_item_name` varchar(200) NOT NULL,
  `ord_item_type` varchar(50) NOT NULL,
  `ord_item_price` decimal(8,2) NOT NULL,
  `ord_item_created_date` datetime NOT NULL,
  `ord_item_isUpdated` int(11) DEFAULT NULL,
  `ord_item_updated_date` datetime DEFAULT NULL,
  `ord_item_isDeleted` int(11) DEFAULT NULL,
  `ord_item_deleted_date` datetime DEFAULT NULL,
  `ord_item_imageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `fk_item_menu_idx` (`ord_item_menuId`),
  KEY `fk_item_image_idx` (`ord_item_imageId`),
  CONSTRAINT `fk_item_image` FOREIGN KEY (`ord_item_imageId`) REFERENCES `orderwithme_image` (`imageId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_menu` FOREIGN KEY (`ord_item_menuId`) REFERENCES `orderwihme_menu` (`menuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderwithme_item`
--

LOCK TABLES `orderwithme_item` WRITE;
/*!40000 ALTER TABLE `orderwithme_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderwithme_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderwithme_restaurant`
--

DROP TABLE IF EXISTS `orderwithme_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderwithme_restaurant` (
  `resturantId` int(11) NOT NULL,
  `ord_restaurant_slug` varchar(400) DEFAULT NULL,
  `ord_restaurant_name` varchar(200) NOT NULL,
  `ord_restaurant_address` varchar(200) NOT NULL,
  `ord_resturant_phone` varchar(50) NOT NULL,
  `ord_resturant_geolocation` varchar(100) DEFAULT NULL,
  `ord_restaurant_ownerId` int(11) NOT NULL,
  `ord_restaurant_created_date` datetime NOT NULL,
  `ord_restaurant_isUpdated` int(11) DEFAULT NULL,
  `ord_restaurant_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`resturantId`),
  UNIQUE KEY `ord_restaurant_slug_UNIQUE` (`ord_restaurant_slug`),
  KEY `fk_restaurant_owner_idx` (`ord_restaurant_ownerId`),
  CONSTRAINT `fk_restaurant_owner` FOREIGN KEY (`ord_restaurant_ownerId`) REFERENCES `orderwithme_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderwithme_restaurant`
--

LOCK TABLES `orderwithme_restaurant` WRITE;
/*!40000 ALTER TABLE `orderwithme_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderwithme_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderwithme_user`
--

DROP TABLE IF EXISTS `orderwithme_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderwithme_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `ord_user_uuid` varchar(400) DEFAULT NULL,
  `ord_user_firstname` varchar(200) NOT NULL,
  `ord_user_lastname` varchar(200) NOT NULL,
  `ord_user_address` varchar(500) NOT NULL,
  `ord_user_email` varchar(100) NOT NULL,
  `ord_user_phone` varchar(45) DEFAULT NULL,
  `ord_user_created_date` datetime NOT NULL,
  `ord_user_isupdated` int(11) DEFAULT NULL,
  `ord_user_updated_date` datetime DEFAULT NULL,
  `ord_user_iscustomer` int(11) NOT NULL,
  `ord_user_password` varchar(200) DEFAULT NULL,
  `ord_user_password_reset_token` varchar(255) DEFAULT NULL,
  `ord_user_password_hash` varchar(255) DEFAULT NULL,
  `ord_user_geolocation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderwithme_user`
--

LOCK TABLES `orderwithme_user` WRITE;
/*!40000 ALTER TABLE `orderwithme_user` DISABLE KEYS */;
INSERT INTO `orderwithme_user` VALUES (1,'Ùm6ïIÞé·„&dÏ','Anil','Adhikari','1522 Charles Blvd Apt 127','link.anil200@gmail.com','2524818608','2018-02-12 23:12:56',0,NULL,1,'',NULL,NULL,NULL),(2,'û’PÝ€DDœ,“ƒ—yú','Dev','Raj Budhathoki','1522 Charles Blvd Apt 127','defeatnly@gmail.com','2524818607','2018-02-12 23:18:29',0,NULL,1,'devbudhathoki',NULL,NULL,NULL);
/*!40000 ALTER TABLE `orderwithme_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-12 23:57:37
