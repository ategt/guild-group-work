-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (20,'Dresses'),(21,'Accessories'),(22,'Shoes');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_post`
--

DROP TABLE IF EXISTS `category_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_post_1_idx` (`category_id`),
  KEY `fk_category_post_2_idx` (`post_id`),
  CONSTRAINT `fk_category_post_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_post_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_post`
--

LOCK TABLES `category_post` WRITE;
/*!40000 ALTER TABLE `category_post` DISABLE KEYS */;
INSERT INTO `category_post` VALUES (109,20,121),(110,20,122),(111,20,123);
/*!40000 ALTER TABLE `category_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `posted_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_1_idx` (`user_id`),
  KEY `fk_comment_2_idx` (`post_id`),
  CONSTRAINT `fk_comment_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `number_of_uses` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES (1,'#summer',NULL),(2,'#sales',NULL),(16,'#yes</p>',NULL),(17,'#bla',NULL),(18,'#bla',NULL),(19,'dress',1),(20,'this',1),(21,'test',1);
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag_post`
--

DROP TABLE IF EXISTS `hashtag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hashtag_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hashtag_post_1_idx` (`hashtag_id`),
  KEY `fk_hashtag_post_2_idx` (`post_id`),
  CONSTRAINT `fk_hashtag_post_1` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hashtag_post_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag_post`
--

LOCK TABLES `hashtag_post` WRITE;
/*!40000 ALTER TABLE `hashtag_post` DISABLE KEYS */;
INSERT INTO `hashtag_post` VALUES (33,1,121),(34,2,121),(35,16,121),(36,17,121),(37,19,121),(38,1,122),(39,2,122),(40,16,122),(41,17,122),(42,19,122),(43,20,123),(44,21,123),(45,1,123),(46,2,123),(47,16,123),(48,17,123),(49,19,123),(50,20,123),(51,21,123);
/*!40000 ALTER TABLE `hashtag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `image` blob,
  `original_name` text,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `content` mediumtext,
  `date_posted` datetime DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `post_on` datetime DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_post_1_idx` (`user_id`),
  KEY `fk_post_2_idx` (`category_id`),
  CONSTRAINT `fk_post_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (121,'asdfga',1,NULL,'<p>asdfg</p>','2016-06-28 16:05:36','2016-06-28 16:05:36','2016-06-28 16:05:36',NULL,'Pending'),(122,'zxcvzxcvzx',1,NULL,'<p>cvzxcvzxcv</p>','2016-06-28 16:07:05','2016-06-28 16:07:05','2016-06-28 16:07:05',NULL,'Pending'),(123,'TESTING',1,NULL,'<p>#This is a #test test</p>','2016-06-29 09:16:09','2016-06-29 09:16:09','2016-06-29 09:16:09','TESTING','Pending');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page`
--

DROP TABLE IF EXISTS `static_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_static_page_1_idx` (`image_id`),
  CONSTRAINT `fk_static_page_1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page`
--

LOCK TABLES `static_page` WRITE;
/*!40000 ALTER TABLE `static_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `role` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `num_of_comments` bigint(20) DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Chris','manager','123',NULL,NULL,NULL);
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

-- Dump completed on 2016-06-29  9:27:03
