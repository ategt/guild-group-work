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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Category One');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_post`
--

LOCK TABLES `category_post` WRITE;
/*!40000 ALTER TABLE `category_post` DISABLE KEYS */;
INSERT INTO `category_post` VALUES (1,2,7),(2,2,9),(3,2,10),(4,2,11),(5,2,12),(6,2,13),(7,2,14),(8,2,15),(9,2,16),(10,2,17),(11,2,18),(12,2,19),(13,2,20),(14,2,21),(15,2,22),(16,2,23),(17,2,24),(18,2,25),(19,2,26),(20,2,27),(21,2,28),(22,2,29);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag_post`
--

LOCK TABLES `hashtag_post` WRITE;
/*!40000 ALTER TABLE `hashtag_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `hashtag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(150) DEFAULT NULL,
  `image` mediumblob,
  `original_name` text,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `content_type` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'http://swc.patsdresses.com/3924b887-648d-4fef-a856-08a723cf4d63','�	�� �z%C �W�\ruSAj�','befc826e-e2af-41c3-95d1-3674149c408b',0,0,'A pretty picture e219668c-40b4-4096-ab8e-df4ec4e89133',NULL),(2,'http://swc.patsdresses.com/2858afa5-c94f-42a8-9906-8ddf5cb17df1','�<�wD�i�M�Ʊ^OY�','59591f1a-4138-4fae-b8ff-c31c7401c535',0,0,'A pretty picture 3bc3381b-93c5-4940-b205-50cdcfc2586d',NULL),(3,'http://swc.patsdresses.com/fb7b9d2a-c4dc-42e0-bf7a-a9a50f84844b','��?\"�6\0ZЮqSC¿�n�:�','ed71389f-6400-42e2-b273-cd5d3a9e0e3e',0,0,'A pretty picture 0c8e9726-dc12-4b9d-ab1e-72c970df4731',NULL),(4,'http://swc.patsdresses.com/17756b80-cee2-4559-9f3d-a1a069e47978','���͛�ځy\"1VQ�UX�1','5cfd29d9-7314-4a00-973f-b554e9db970a',0,0,'A pretty picture 50574aeb-f580-4308-8afb-00e8cec6e399',NULL),(5,NULL,NULL,NULL,0,0,NULL,NULL),(6,'http://swc.patsdresses.com/34934aae-ec99-4a97-8a23-f2010e99655a','�d��Fc�B��\"D&��\'0�','900c6434-e28a-45b1-8802-8821c1dbb355',0,0,'A pretty picture 7481f017-c4da-4d09-bb23-41762b565bf3',NULL),(7,'http://swc.patsdresses.com/c1f8206d-c57b-4140-85a1-5806ce349cbd','�IM��w���UM���s���','a0814506-832b-45d0-b45e-0ff6b4fea037',0,0,'Billy in the winter.',NULL),(8,'http://swc.patsdresses.com/47b6f49b-8995-4491-b504-14e60d4ebba1','+�-j^*�ёeͳM!\0��','f918c9bd-f18c-42c6-ba9d-bf40be73482b',0,0,'Billy in the winter.',NULL),(9,'http://swc.patsdresses.com/263313bd-5b6a-482a-80b6-beeb2c4ec6d5',')ݪ�=�NlF{!P<�*�','e3a8ca40-b563-44f4-80da-43d83c8eeb50',0,0,'A pretty picture 97c14a8c-db3a-4fa1-9056-732858853025',NULL),(10,'http://swc.patsdresses.com/f4703733-e9dd-41c3-95c0-7c0995710d1e','������m���D���o','2b45ae3d-f387-4a53-9300-f089c81b43a9',0,0,'A pretty picture 79525a89-b17a-4e17-be9d-1bfe7317451c',NULL),(11,'http://swc.patsdresses.com/da18b67e-d5e2-4a61-9a80-06314e1fee51','�����o̾%R��Kr','310f85ff-0540-4513-bee9-e6e39350c5c5',0,0,'A pretty picture 923a43ff-79a6-4dde-b85c-cd9e1b5a48f5',NULL),(12,'http://swc.patsdresses.com/200a2013-a336-4dc9-bea3-7e3d65f3c291','�p�Tqb���H!;#����^�$','9f3fffee-eb8e-41fa-9936-e9b41acfd589',0,0,'A pretty picture 7f5b0a9d-6aac-4742-9f05-6acd15c41494',NULL),(13,'http://swc.patsdresses.com/6f5902b0-ef13-415b-b530-8bf7b6138b5f','� V��+*2��s4�j�&','30afea17-5981-4bf1-b539-ede83621a4ae',0,0,'A pretty picture 2f532752-9a23-4711-9221-2cf4ddcd4960',NULL),(14,'http://swc.patsdresses.com/af2e78ed-fdaf-41d8-8dcd-44e6d7eff622','n��Ip�_��T�����','51579378-822c-4f01-a675-632f77171b36',0,0,'A pretty picture f7f2df9a-58ff-4f5e-a15b-8993411a6a67',NULL),(15,'http://swc.patsdresses.com/b67ef1bf-8c8b-4bf8-9925-ccce38ee7717','Ȁ/T�zR��5�ٴ��q�','1a2e8fc9-024c-49fa-9bff-57142bbe58b2',0,0,'A pretty picture 6aa68a20-b624-4a15-a5f2-14333aa30dc4',NULL),(16,NULL,NULL,NULL,0,0,NULL,NULL),(17,'http://swc.patsdresses.com/3805ad54-a523-48b2-a9a0-47735d105545',')�r��vVh�����m��','ef2ea463-693a-44a9-b028-793699a99f1d',0,0,'A pretty picture db0b883f-3dc2-40bf-a786-cdc40300e786',NULL),(19,'http://swc.patsdresses.com/d3b807a4-b75b-48f3-9175-b1b84c54342a','x��7Wx�X�to��PW�\Z�','4f976648-c52f-4c33-943e-c482632d9dfa',0,0,'Billy in the winter.',NULL),(20,'http://swc.patsdresses.com/6eca671d-7915-4f47-813f-7e3a73f4cc1f','T�@Q�HyȎ�}�/�H=�y','2ff90415-f383-43d8-b6db-0bd5ced216e3',0,0,'A pretty picture fd2ee4aa-c125-455c-991d-2b92fa6ef404',NULL),(21,'http://swc.patsdresses.com/f9e2a518-3b75-4b2a-a06a-76c0ecac9cc7','l92{i��s�z;+���Y{�','ad1ca36c-4409-4227-a64c-f25f3406a689',0,0,'A pretty picture 3d30052a-05ac-4ee5-9b45-126e0616ee22',NULL),(22,'http://swc.patsdresses.com/bd3807f0-18fb-489b-9bae-35f2b9b025d0','#=�l��ل��2@/���ʛ','d970d521-aa26-4132-98b2-b2a7dfee5c59',0,0,'A pretty picture b6de1769-b974-4355-9b52-e64b53279142',NULL),(23,'http://swc.patsdresses.com/cf0b8e99-4f7e-4c8a-931b-2a8563c77ffc','�U3�g_�I+�ł�b','3e39caec-74a0-4704-add2-a19365c1cf4f',0,0,'A pretty picture 84b034b8-bf15-419a-a1ed-776ec8d441ac',NULL),(24,NULL,NULL,NULL,0,0,NULL,NULL),(25,'http://swc.patsdresses.com/40057acf-2fbc-436f-bbfc-194470af0d7d','+�0�N���i;����B','e8519d8a-0fc1-4fcd-b8a0-7e13b7394705',0,0,'A pretty picture 4264adda-5d0a-43a7-acf1-2ef4eecf242e',NULL),(27,'http://swc.patsdresses.com/c874515a-9dcd-4b5b-a346-f666dd06e9c9','AߦЁ�~bK{+ �R��aNq�','e608a5dd-a2f7-4973-ac18-792f5c24c5b0',0,0,'Billy in the winter.',NULL),(28,'http://swc.patsdresses.com/18045d01-b0d7-467b-b578-323ae0942eee','7�^@���1t�@��׿�N','2ed03092-9ca7-4e98-8160-1974f29f966f',0,0,'A pretty picture ebd52514-afaa-4d5d-b8b7-7a96598bd841',NULL),(29,'http://swc.patsdresses.com/eea9b57f-5a7f-41b5-95e0-5ce5bb5f4267','H\'z�N���rb�pe�p�.','b13c831d-ed46-492e-a3e0-26a2ff425093',0,0,'A pretty picture dd978c87-c7ff-4758-a4fe-61a8caa603a5',NULL),(30,'http://swc.patsdresses.com/aea7e8dd-b2ef-48ab-925f-560640c42e7e','�n*���]`�_X��B�P�','7ef53459-b008-4b27-92da-75440ccf4a5a',0,0,'A pretty picture 41c7ba31-a642-421e-834c-2759814c4b6c',NULL),(31,'http://swc.patsdresses.com/8f690a5c-531b-4bd1-8605-583658965cb7','�-�М���,�d�\Z\r���I','94c68297-b1ca-4a94-8fba-a1804c83a6c6',0,0,'A pretty picture d4705e20-e888-4a9e-8b5a-1f9c665a97c1',NULL),(32,NULL,NULL,NULL,0,0,NULL,NULL),(33,'http://swc.patsdresses.com/fd5c4546-9a75-4cb8-8043-d49d6ee5eefd','��]��-��&Q�D�e','9941eab4-1060-47bb-b9fb-c7cd9f7e8bc8',0,0,'A pretty picture 4fda74a9-8301-4cd3-948b-cb8002c5fbff',NULL),(35,'http://swc.patsdresses.com/ead0b218-ae26-4e07-bc7e-25a0cb5d9ebc','e����6ia�������K','a9e4dca4-5b61-44d6-bbfb-d08a175ad6a6',0,0,'Billy in the winter.',NULL),(36,'http://swc.patsdresses.com/0cd5c369-1989-4d13-b5c8-89071246d342','t�z���M-��|�����<%','71441d94-ce0a-4067-bf59-6be7d8d5ed66',0,0,'A pretty picture 47aa341a-08b7-4709-909e-a414e745b78b',NULL),(37,'http://swc.patsdresses.com/11ebc1f5-c543-47a2-8c97-7c7cd5bde926','�R0�I�.>t���}�q','9316194b-3fd7-4776-9565-d9827046b50f',0,0,'A pretty picture c32cba8c-97fb-4818-b2c1-51f04467c139',NULL),(38,'http://swc.patsdresses.com/5c387260-0ef4-4aed-98fb-40f20eb87f64','�/�dU��؇��r��|�88','5d4ed8de-2ba3-4b2d-be0b-4e235e63e81f',0,0,'A pretty picture f2093aa0-74f0-4afc-b6fc-4400823b94ac',NULL),(39,'http://swc.patsdresses.com/68cf9d86-6b4c-4357-a2dd-e3a095464f96','�נ�5�oZ�J����','5867cf91-494b-4e8e-a714-415a1dc166ca',0,0,'A pretty picture f2b26e00-e072-43fa-9ac3-799eb594e02a',NULL),(40,NULL,NULL,NULL,0,0,NULL,NULL),(41,'http://swc.patsdresses.com/a67e9029-0eda-45ea-9c1c-437bd2f92f8f','�{��K=o�B(bbk�8Qo','5235f214-7771-4c63-bbaa-fe8499d3791d',0,0,'A pretty picture bc2824fe-177d-48c8-b8bd-6d4a15c39895',NULL),(43,'http://swc.patsdresses.com/0c4c83c1-8ea9-4105-b469-904c1e705607','�>��\0Z���tb�AҳaYU�','2cf9aa0b-69b4-4ba3-83d6-63bdf2d61b6f',0,0,'Billy in the winter.',NULL),(44,'http://swc.patsdresses.com/996b74aa-414e-4063-80d4-ba4bfca2f254','Qt��*�C1�Oo���m','c07bc34d-10af-4a70-9e7f-e264b9a1c747',0,0,'A pretty picture 5b383357-7bd0-47e3-825c-c2ae70af38a5',NULL),(45,'http://swc.patsdresses.com/d5f211fd-790d-4453-a61e-bbdae3fc2ac7','�POK�X�b��b�\Z��	��','fa206cc1-f5c2-4c30-b179-1abbf42b6860',0,0,'A pretty picture a2790285-467d-4ef2-86cc-6ee791e89004',NULL),(46,'http://swc.patsdresses.com/a1e53968-e956-4be8-994d-9978c150bd36','jXy�6 fv�t�Sz�]۪�','f2c2b77e-2cd1-45f5-a3a9-c9a6086dcf50',0,0,'A pretty picture 580a742e-bf7e-4195-9c51-0390b81ca27f',NULL),(47,'http://swc.patsdresses.com/6c7ee4f0-f808-432d-b154-137314227ce1','7!�0x>���G�/=��9�','055c6c87-525c-4326-a2c5-d1c85e374c47',0,0,'A pretty picture 13e59974-24d0-46d2-ad3c-780ce29b1181',NULL),(48,NULL,NULL,NULL,0,0,NULL,NULL),(49,'http://swc.patsdresses.com/6c706775-968c-4335-9903-c85f31589e86','�a�ٓ*�췲:�X�i�.H�','7989676b-7157-4688-b6b4-81a589f4206d',0,0,'A pretty picture 15f43de0-bdd2-411b-b230-ea220f5e15bf',NULL),(51,'http://swc.patsdresses.com/0645dbe8-c76b-4e50-a5fd-69ac1c8c79bb','7\Z㔽����\"\Z����K�','16bb216e-d897-410f-bc57-07db41aad8b5',0,0,'Billy in the winter.',NULL),(52,'http://swc.patsdresses.com/6ef2aad3-1ec0-4402-ab3f-70eb01cd25a0','z�6��_!.�g������<','b6f938bf-49c7-40d1-9342-e4251cc17ba6',0,0,'A pretty picture 873f8159-6759-449a-9067-411410d5fa63',NULL),(53,'http://swc.patsdresses.com/a72cc827-6cc0-4b93-ba13-a8be29c9eddc','܂��c��<;r�+}	�O`�','6f9f0fed-06da-4099-95d0-9ca0ffba5c37',0,0,'A pretty picture c60d27fe-915c-42a8-8ca4-47bf99d579c9',NULL),(54,'http://swc.patsdresses.com/09d59661-de93-4ea1-abe1-bfd08be2669d','�����\Z.�ڥ���ç���\"�','e24be643-5385-47bc-9cb6-de707076653b',0,0,'A pretty picture cb750044-7283-46ea-94de-5880f68554dc',NULL),(55,'http://swc.patsdresses.com/c952b7c7-8224-4392-b9c1-1cc4b201e56c','��{r:tk.z@�](��z','b0581aa6-d9b6-4f74-a97d-5aa71804c76d',0,0,'A pretty picture ee8c0f7f-ef54-43c4-a5df-0860fb80a4f2',NULL),(56,NULL,NULL,NULL,0,0,NULL,NULL),(57,'http://swc.patsdresses.com/42611329-baa7-424b-99ba-5311bb2bd78e','\0U-��	~c$�\\��fh��','4036eae3-df39-4c47-9cad-a23aa0b90f02',0,0,'A pretty picture ab9f64e0-9912-4133-9cd1-52caef214531',NULL),(59,'http://swc.patsdresses.com/4e55b92c-965d-4c87-9518-15d2d7fd9b84','\Z5��tM�U�<5%�)�EY�','4e68fba1-f085-4d9c-9395-883e1ad8adb3',0,0,'Billy in the winter.',NULL),(60,'http://swc.patsdresses.com/6f946817-94a7-4655-85dd-f57c9aa8899c','�;1,\r��e��1���nw','2273ddca-2cfe-4286-878b-a0486055964f',0,0,'A pretty picture 924381c0-ea0c-4933-a2c3-580a0876db15',NULL),(61,'http://swc.patsdresses.com/6b4ee1fc-7422-438d-b63d-a25a1de1ca2f','�1�\r�\'�����J�a���i','bb9aeacf-7ec0-4e3a-ab3e-e5ce078ae5c3',0,0,'A pretty picture 0199ae89-4b9f-4873-b926-06d1e53afff8',NULL),(62,'http://swc.patsdresses.com/3e15e1ae-9964-403c-adac-e3a0e354caaa','o ־Є�`����q!�','4c52b9b7-3e86-4e59-9f90-81096525ea34',0,0,'A pretty picture 1bc2c430-cb67-4382-9131-462fe24d55dc',NULL),(63,'http://swc.patsdresses.com/032cc36f-5efd-4d34-ad38-dc013aab75c4','�sr)�2�]�J6�S\nӒs��','267d2401-f1ee-484d-8801-35b74c7b9dc2',0,0,'A pretty picture f8e27997-11d6-4b3e-8944-34bb02d079ce',NULL),(64,NULL,NULL,NULL,0,0,NULL,NULL),(65,'http://swc.patsdresses.com/93a7fd58-7f24-47c1-96b9-dd4561b02440','Q�} x��\Z��>Pixe���Z','bd4720e8-403a-423c-b70b-e5b9ce3e9355',0,0,'A pretty picture 8acc068e-059e-4267-9a2f-710a787fc33b',NULL),(67,'http://swc.patsdresses.com/236965a8-624e-4746-b2de-ddaf28c74d11','��ǿ)��)�MiVA���?','fa45007e-dc4e-4b99-a492-698d8c26ecf6',0,0,'Billy in the winter.',NULL),(68,'http://swc.patsdresses.com/a2a73af7-55c4-4fb6-8ef1-0eac46759ab3','��ǁ,�&W\r#��d���=��','0da7e0ba-8fc6-4ebc-a284-75a0c2fdaa22',0,0,'A pretty picture c0c9c095-742c-4372-b98e-2d786f1eda4d',NULL),(69,'http://swc.patsdresses.com/302648fb-115d-44ae-b38e-9c67bf206dc5','��7�\r�)!�7T�Q��y�QR�','5725ee36-5aa4-4016-8561-b5bdb23b460f',0,0,'A pretty picture ac0220c3-2d1f-40f8-b80e-f0985c5a9d70',NULL),(70,'http://swc.patsdresses.com/efa85585-0291-489b-b470-8bbb76fb7677','��R�%���\\���ւ�r�','47ba11d8-e35d-46d4-8301-84859196f87c',0,0,'A pretty picture 7f2e8b91-d541-4a85-9a51-5a32d2d225f8',NULL),(71,'http://swc.patsdresses.com/efe438a7-c6e2-413e-bcb3-fd9fdbea7443','�F�93��!oJ�>ʘ\n> &','87ff03ad-0d21-4dd2-86b3-7151489eed56',0,0,'A pretty picture 68aaf33e-3b5c-473e-924c-cc3bc3b028cb',NULL),(72,NULL,NULL,NULL,0,0,NULL,NULL),(73,'http://swc.patsdresses.com/80374626-d960-44e0-80af-9ad81daec4f4','�~w\'l:mD;�F��O���EV~','387ad360-00ae-49be-8d7e-d3f14a09d183',0,0,'A pretty picture c21d818a-9216-4a2d-8ec6-d73205010f17',NULL),(75,'http://swc.patsdresses.com/c35ca480-39b6-4800-a278-4c7186784902','������o��W`�','58d43c78-d5c7-4979-be3d-a531bd8ba0ae',0,0,'Billy in the winter.',NULL),(76,'http://swc.patsdresses.com/8d30528b-8121-4b3f-b4b2-9bd1f909854c','��wpx+Ueb	��$���Ϫ`','e02a7e45-b0dc-4faf-b422-72a5f541f0ae',0,0,'A pretty picture 1a258c38-d8b5-4552-aa78-08cc9b4cdafc',NULL),(77,'http://swc.patsdresses.com/4b93eeab-01a3-4af8-9e6a-b4c653304b76','���$���~2�Jv���','d272d69e-c3db-46e1-9e39-12010b98ff7f',0,0,'A pretty picture c07f26f4-c03f-41a5-9bb9-e6ff7a9be463',NULL),(78,'http://swc.patsdresses.com/a4821c96-fbfc-4d98-914a-f36301ff582e','#2Ճt\"�,<�E��Bٜ!P�','d7800e96-7370-46aa-b283-0bcf0c636d2e',0,0,'A pretty picture 616f0ec9-3c91-4295-b501-86e675ad76ab',NULL),(79,'http://swc.patsdresses.com/026b3cbc-91f7-4893-ada4-0dd728af6fd0','w�+ლ\Z$X*�x\n��ߔ\"','9dc37193-1355-4383-abaf-612b090173ef',0,0,'A pretty picture 549f11bc-3dca-4442-b7db-d10287d3a920',NULL),(80,NULL,NULL,NULL,0,0,NULL,NULL),(81,'http://swc.patsdresses.com/02ed7717-6667-4888-855b-5e6473aa7b0d','պ��\nꤹDH�[�)b6','4ebcf480-0d08-4751-ba9b-7b58cc4ec9c1',0,0,'A pretty picture f1020a5e-88d7-4a4d-aef5-ba82edc855d0',NULL),(83,'http://swc.patsdresses.com/ee43a546-2bff-404a-8d91-0f0b8098abbb','(#�pE`�P��}�3N����','a8cb270c-d17a-4430-9d3c-278156ba70b6',0,0,'Billy in the winter.',NULL),(84,'http://swc.patsdresses.com/4dffb77f-e622-479f-8e3f-8281feb7755c','�k1�y�j���57u.E8�\0!','98bfac3d-f852-434c-8afc-0eee39f521cc',0,0,'A pretty picture fb077f18-327e-4ccb-aa13-28fdb9128171',NULL),(85,'http://swc.patsdresses.com/1a06932f-d92f-4beb-a28b-5c7c74eeb3ce','�B(���q/d\r��i�)x�','76f1ffd7-3679-4551-abf5-5df3cf6ae759',0,0,'A pretty picture a7dc91e1-beb7-460b-ac6b-2902c958da98',NULL),(86,'http://swc.patsdresses.com/2074616c-d4ab-49e3-b004-cd580ea7da25','�O�\n���ŝ���tᔨf','5d7d4411-c514-48aa-8ab2-c2fafffcfb69',0,0,'A pretty picture f9e44262-959d-4e73-8ab8-9058ed822f25',NULL),(87,'http://swc.patsdresses.com/9e7cd48b-78dc-406e-a46f-61c4ad5b5b72','�#�j\'^�3�!�iO-\"�','02a360d0-7222-4ef4-bdb1-127feb131ae0',0,0,'A pretty picture 9cad60cd-2f65-4325-871e-5a4ea1d3d19d',NULL),(88,NULL,NULL,NULL,0,0,NULL,NULL),(89,'http://swc.patsdresses.com/ce468c94-5f43-4526-aec0-17496f0e06bb','��F�=S�\0�]7to��|�','35871bac-91fe-4dc6-b5ee-76c0f1928350',0,0,'A pretty picture 08652236-8af5-426d-94d6-87d0c292b970',NULL),(91,'http://swc.patsdresses.com/885cca4e-71ee-48f2-b52f-54bb08bb2320',':��dO�T�����c��/�','62c3f00c-7c48-4d36-9241-f6889930bc24',0,0,'Billy in the winter.',NULL),(92,'http://swc.patsdresses.com/5cdd6ad9-eafe-4f7d-805e-9883d21c3c5d','����H2�P!��� �:�','5ae9050d-4a98-431e-89ef-79534b1a7a74',0,0,'A pretty picture f479c510-3cca-4b66-8324-15c3d87fc735',NULL),(93,'http://swc.patsdresses.com/e0e9efb1-f2b3-4088-8e94-852cf208dbe5','X��.�+mk�g������P','8aabb607-3294-4caf-835d-ba97dde273e7',0,0,'A pretty picture e1c1664e-51ee-45f2-8f4e-77cf69f404ea',NULL),(94,'http://swc.patsdresses.com/d33133da-fb5e-45d2-9c62-cd0942d900d8','��\n�.���C�}�Uf�,!��','b76e7db1-9de6-4ada-b41c-8959375cf47f',0,0,'A pretty picture e5716be6-cbdc-4a94-802d-0a4a5a71b1f5',NULL),(95,'http://swc.patsdresses.com/5d9605bf-cfdf-406d-a94a-74e22ac90374','%@����m�9�:����','f5a81609-b92a-413b-8459-1fbc0e872cff',0,0,'A pretty picture fce01526-8893-4ea2-9ef6-d046e5aa50cd',NULL),(96,NULL,NULL,NULL,0,0,NULL,NULL),(97,'http://swc.patsdresses.com/43f9da0b-c3b0-4664-9ce6-5769d9b3666b','+K��9LΏ�Qp^R���','33f749fe-0053-4c17-b125-255741b35c7f',0,0,'A pretty picture 144ee03f-f134-4a4c-923a-de0ba28889f5',NULL),(99,'http://swc.patsdresses.com/dab1e86c-6a84-47f6-8e81-c577f38245ca','�4���XڲWN���^��;','98522b02-9351-4e20-a360-1be0c5dacaf6',0,0,'Billy in the winter.',NULL),(100,'http://swc.patsdresses.com/271ae7c3-ca39-449a-b951-bc674becf1b3','�W�\"���<G����Ef�','885b5be4-7c2f-4358-8387-12b3de568ce2',0,0,'A pretty picture da329559-0293-4b17-9a44-077433f76191',NULL),(101,'http://swc.patsdresses.com/97416532-5b2d-43f1-a94a-2a6bb86b15a0','�5H#��!5���])���U1','6aabbfb3-3bc9-4058-ab1b-9156dc323350',0,0,'A pretty picture 495c3eec-2a65-4049-beab-977e17f07fbc',NULL),(102,'http://swc.patsdresses.com/a04275a5-0f36-46bc-aaaa-1f95280f5cf5','}[�q:���ɜ�{�����K','de110ac9-8e4c-4414-9ffa-1fce82a3ec18',0,0,'A pretty picture d9092efd-d80d-4691-a7b0-33c0731400f9',NULL),(103,'http://swc.patsdresses.com/0cae876f-14e0-43ee-9da5-3782c31dc503','e����4]�	���!\Z�Mѧ','0d0e3c36-f639-4308-9241-6e0c34a62ffd',0,0,'A pretty picture be4fe790-5197-4095-a36f-3037f3f11f21',NULL),(104,NULL,NULL,NULL,0,0,NULL,NULL),(105,'http://swc.patsdresses.com/d610014e-19f1-4bba-b5e8-7d2936bcacfd','K�9@�ɹGY�6��EFxr','5f777f1f-fb97-4491-bac1-769088b9d1f2',0,0,'A pretty picture c092516a-7e5a-444d-bc31-764144e479a1',NULL),(107,'http://swc.patsdresses.com/1d555fe7-2439-4f1b-8ba4-dcd535fa7ea8','�p*�~s$5��ׅ�����A','ecb0866c-2837-49c8-9242-2d1c73aa0e82',0,0,'Billy in the winter.',NULL),(108,'http://swc.patsdresses.com/6c4df209-e874-4f39-97ed-b8abfe29c8bb','��K��f+SV�V�>ω�}g','3673f0fc-4a80-4d88-a488-6fe1d5400e18',0,0,'A pretty picture f34ec23e-a360-4a3f-b984-369d8dd27744',NULL),(109,'http://swc.patsdresses.com/bc66f04d-5908-4d8d-80cb-c9d006053a1e','��Q��P40��i��.���','b3757d52-70d6-45fa-8a82-f1bc7a4d9ecb',0,0,'A pretty picture 23443f2a-5dfb-4ba8-ad4e-35d8e1a4aa5a',NULL),(110,'http://swc.patsdresses.com/bcc9ba16-ddec-4842-9909-a3dd575e83b5','�[�C��7Ų��,��','18eaa08b-a840-4ac0-b784-080ae2dccbf5',0,0,'A pretty picture ed953f10-1675-4c2b-800b-6382857f3842',NULL),(111,'http://swc.patsdresses.com/a2d8e35f-6250-4e78-8bc1-6f146559c42e','\"w�^���h��Ԙ��_�','8eaa6952-5a44-4c2d-a5cb-ca423d233197',0,0,'A pretty picture 544d55aa-8ff9-4f66-b5aa-cfd748798249',NULL),(112,NULL,NULL,NULL,0,0,NULL,NULL),(113,'http://swc.patsdresses.com/eeb0dae8-63a1-4f1f-9ddf-cac02e3de79d','��4�&��\n���c��;�d!','25fdd682-65ae-49b8-b779-f6f5c71d7a83',0,0,'A pretty picture 632be832-6c9d-4e20-8797-604afa5c53ca',NULL),(115,'http://swc.patsdresses.com/5a7902c3-1887-45bd-8c91-7ecf19e859db','�B�ib����F{�s��','7497f1d8-7282-4de5-90b9-f03f054748af',0,0,'Billy in the winter.',NULL),(116,'http://swc.patsdresses.com/b52c350a-b1f1-44de-b1f7-7bd90f0e0767','����ԤN�!n���)�mj','9a80e996-32fe-40a7-9f7c-32455bea600d',0,0,'A pretty picture 447aefa6-fcca-4496-a142-49f4e4e84c30',NULL),(117,'http://swc.patsdresses.com/dace70b4-a723-4dcc-b206-9ca75ae7ae8e','MG\Z��O���<_��>�49','ff4f08da-62ac-4667-b714-f9d89b70e56d',0,0,'A pretty picture 8cfee21d-ef35-4c6e-ac71-82c13addfd32',NULL),(118,'http://swc.patsdresses.com/d68c0892-b254-4e65-8f07-c134afe4fcb0','�lH���ҰCf�l�HK��m�','47e04d2e-64c0-4508-bc98-f2ea5be5da02',0,0,'A pretty picture f5b0fd31-48f7-4f00-a0c9-6a664658f407',NULL),(119,'http://swc.patsdresses.com/952f8ad4-f4a6-4b4d-a8bd-0a1540f4030c','�&�����\Z@J��Tr��	','141f10d0-6fe9-43e4-8a20-7c78530ea60d',0,0,'A pretty picture 58201143-74fa-4f0f-a014-ee17c0603219',NULL),(120,NULL,NULL,NULL,0,0,NULL,NULL),(121,'http://swc.patsdresses.com/89d4b699-e96d-4e62-bcf8-42fc1f34ddfb','Qm��\Z�����׸Zq���','1b142a80-63c6-4cdb-b74c-7cf85e6da78a',0,0,'A pretty picture 4eb4e6c7-6a20-4bf7-9014-ae3dc93f2407',NULL),(123,'http://swc.patsdresses.com/06991ff6-a9f9-44a9-b54f-fafbda1dcf4e',',�Q�z����(��|��M','aa174853-e6b6-4d5a-8c14-c1692d877577',0,0,'Billy in the winter.',NULL),(124,'http://swc.patsdresses.com/0bd69e0b-4977-4adc-a196-ac80084aa3d1','�����{Dg�R�(��0�','20d30871-d5e9-4fd8-8d8e-bd374edf518b',0,0,'A pretty picture c8b45e99-ebb8-46e3-8f25-44505367326a',NULL),(125,'http://swc.patsdresses.com/9a02345c-6185-4a27-82e2-985938f09b3c','����KXA\0�%�7�S��p�','92e7244e-7d65-46f7-bd77-e3366fc6e58d',0,0,'A pretty picture 4004fb58-8312-4c6d-aa08-ad46a9a436fb',NULL),(126,'http://swc.patsdresses.com/9855d4c6-d319-4306-b6bd-065537953e42','b���,=d���q]`}l&-g','06a047e9-f890-4e0f-bce4-bc49650e6cf5',0,0,'A pretty picture 7f55fd42-2c2d-4b12-af7e-38d10ab3a6ac',NULL),(127,'http://swc.patsdresses.com/ac349cba-498e-4b77-9570-d5605b633692','ٕ�������;<����s�I�','1363d993-d5a4-4770-9550-0befaac03c6d',0,0,'A pretty picture a5ff58b6-3b9f-4d3a-8907-667b193fbc0e',NULL),(128,NULL,NULL,NULL,0,0,NULL,NULL),(129,'http://swc.patsdresses.com/032b9f7f-5f24-49a3-81a5-6af99ccf96af',';D���Ze������V�pV7�','c2e7094f-41c9-4f07-9a77-4f4a9284741b',0,0,'A pretty picture b77e7989-5ae8-4a29-b20b-2083f2edc2a1',NULL),(131,'http://swc.patsdresses.com/5730099d-e865-42fe-a155-d3f76709c4ae','��֝��It墄�Ʊ֜Z%}','912a1fe3-f56b-4c05-80af-81083c7297e7',0,0,'Billy in the winter.',NULL),(132,'http://swc.patsdresses.com/ecff2c6c-c3e6-4886-817e-9a55459dea87','�N1Np��!&t��>r�a','5090ea79-3c5f-4a0e-854d-61171a526c5a',0,0,'A pretty picture 5b4a4df6-dad8-4e1c-bea0-554ddaf761d8',NULL),(133,'http://swc.patsdresses.com/1f535b4e-b24d-41f0-b979-877c35f8f5c6','E��M�L�JU\0h~A���','a3687ac1-1da8-4b1a-b134-1cd4970169fa',0,0,'A pretty picture 567f26ed-961a-4692-b784-3d3db43f8bf0',NULL),(134,'http://swc.patsdresses.com/6befb878-505d-44be-b7f9-ee5e5beb578c','��/�q��FS�d��','2aeb9815-26aa-4126-b2d8-ed206dcd2b02',0,0,'A pretty picture fbc887c9-700a-409f-bd69-2a9c2b5ca017',NULL),(135,'http://swc.patsdresses.com/fc5affde-478a-4e39-8b95-2f69445e910a','��*̾u�������c���W�{','3accdceb-99e5-4dd9-b204-194a640e9764',0,0,'A pretty picture 528df01d-9cb8-4ac1-bc49-e936844f691e',NULL),(136,NULL,NULL,NULL,0,0,NULL,NULL),(137,'http://swc.patsdresses.com/622a372d-aa0d-4d87-b1aa-c84b3875ee9e','Q����>�����d�s���Sn','0b896275-2cab-4209-814d-66cb478c0f38',0,0,'A pretty picture faded214-412f-4a4f-bfe8-a29ba9d5f695',NULL),(139,'http://swc.patsdresses.com/a0422a5c-643d-44dc-bdf5-2344083c1043','<F��)^��\n�[��O랗','e95efd4e-5ee6-4f1d-af67-4d6018b79916',0,0,'Billy in the winter.',NULL),(140,'http://swc.patsdresses.com/eaac6113-3b1c-41f2-a522-6adf00cb6fa1','�#��}H>�Z~�5eVT�*','7a225f35-4104-4bdf-aa10-6ef407ce438f',0,0,'A pretty picture 35d57113-422a-45b4-82c7-d5a30e76f3e9',NULL),(141,'http://swc.patsdresses.com/deabde04-2d03-469b-aa9d-f42420f883b4','�\r�\"��tG�P�ɥYM#','5d06527b-40a8-43b3-bcc0-5c25641f4254',0,0,'A pretty picture ea713fd2-40b2-411e-b78d-46ba0986e142',NULL),(142,'http://swc.patsdresses.com/70206a26-6603-4df9-a103-e87877939369','�����+���uť����u','7f55edd5-8aeb-4911-a791-5888497e85c0',0,0,'A pretty picture 506fa45a-dba8-4ae0-912f-1d8917771717',NULL),(143,'http://swc.patsdresses.com/f4869751-a24e-44e7-98ce-9381ad64e920','覱2�Õ��S��h�VJjY','926730f0-76b6-4eb7-886b-01c8b7efbc8f',0,0,'A pretty picture 49f906e4-e08f-4e1f-bcb7-e5169370f497',NULL),(144,NULL,NULL,NULL,0,0,NULL,NULL),(145,'http://swc.patsdresses.com/df50e4ee-11ab-4f3e-8c5d-aec5ae21758e','<ߏ{زҊv�ϳO5�L,w*@','1cbc0ad6-db47-4fdb-9ecd-8790a1988101',0,0,'A pretty picture 4b5bf486-cbaf-4c32-b5db-fda9da7f1920',NULL),(147,'http://swc.patsdresses.com/8cc22a0c-dfd4-455c-a5a2-16dbe9509f31','��=�U�Z\Zj�>�{����','d4b60da8-748c-4539-9ed6-4500b476d1f2',0,0,'Billy in the winter.',NULL),(148,'http://swc.patsdresses.com/93ce74c9-8463-4d04-9a98-cd99569ffe27','�����o�%�w\'\0t o','6dd27ed9-ba32-471d-9091-1820b95ef006',0,0,'A pretty picture 2694061d-9c2b-424a-845e-72099e78e906',NULL),(149,'http://swc.patsdresses.com/38bb223e-7555-443b-ab80-165f3c5a6a59','������}�����,o2��','108efb22-fb35-4d83-a86e-1e73820553db',0,0,'A pretty picture 79a61557-ed13-4924-aac2-0b9e64dd8468',NULL),(150,'http://swc.patsdresses.com/04baeb50-d508-41b9-acf1-7f100922fb9f','\"��Ź}p9Y�u~������B','9564c5b1-b584-49ef-872c-eb3bf81b53ee',0,0,'A pretty picture 480e6495-b567-4ce5-8814-38a405a4f349',NULL),(151,'http://swc.patsdresses.com/7e0bcf51-7bef-4dc9-827e-650510aef828','�\ZĒ~>�8�0�H��_˅��','89ceff45-54a4-44f3-b6a6-601235a9a0b3',0,0,'A pretty picture 2411521f-f77d-427c-aee4-5a6adbb82c03',NULL),(152,NULL,NULL,NULL,0,0,NULL,NULL),(153,'http://swc.patsdresses.com/6f8a31cb-7276-4728-90aa-7dd61f4497aa','G1jSY�Л���a�(�6','59e465db-2058-4608-af6c-cc4247da2aa7',0,0,'A pretty picture b6f9e97c-39c6-4018-a14c-198dd1e78b38',NULL),(155,'http://swc.patsdresses.com/d2897798-d312-4742-b3a3-a055ddf66ae4','\Z���\rd�=�~���nu���S','90486ef5-4554-43f9-8ba7-08575ad84d87',0,0,'Billy in the winter.',NULL),(156,NULL,NULL,NULL,0,0,NULL,NULL),(157,'http://swc.patsdresses.com/913f5718-9e48-4bf8-8e6d-ea3d9dd8e97d','�)k~�en��o�~���<�','5db1286a-e102-46f4-8674-e2b5dd10b685',0,0,'A pretty picture 27963aa4-bf32-48a9-8f90-43fd89695dd0','image/jpeg'),(158,'http://swc.patsdresses.com/6d87c439-0ea3-4079-b25d-4e60819a4aa7','��C�e�ݬ8��1�4����','fa1994ef-0686-4d1a-ae7e-64f2d4a263ad',0,0,'A pretty picture ea33d023-bbee-4bad-aee0-25b65e49d416','image/jpeg'),(159,'http://swc.patsdresses.com/0547b72f-f465-42a9-a8c0-3574a3a61587','��`#�?�%e�-Y�)���','4fd120f0-198c-4349-b0b8-8164f37be06c',0,0,'A pretty picture 471a44ae-6a0c-4da0-b19c-b2cb55f407ff','image/jpeg'),(160,'http://swc.patsdresses.com/a7cd8d52-b78b-4108-a172-4715c2f5845a','��M����e���n�#��','1488159f-ea87-4337-b564-4fd3930f2d32',0,0,'A pretty picture ab8b1075-ec26-48aa-a1cb-adac53b09e35','image/jpeg'),(161,NULL,NULL,NULL,0,0,NULL,NULL),(162,'http://swc.patsdresses.com/67d065da-5710-4b18-a0e5-19e1d5d92986','ؓŶ?��ˮ!{������I','9ad95b84-c1fd-43f8-b7e8-48d3210dfd0f',0,0,'A pretty picture 2f2c6082-3dad-4f4f-8c1c-4bf631825a9d','image/jpeg'),(164,'http://swc.patsdresses.com/bd4547ab-eba3-4488-9d6a-f52f9206833b','0,��@t\'1\rq���I��','bc82e4fb-638d-43b8-af60-f93b47849cc4',0,0,'Billy in the winter.','image/jpeg');
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
  `title` varchar(150) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `content` mediumtext,
  `date_posted` datetime DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `post_on` datetime DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_post_1_idx` (`user_id`),
  CONSTRAINT `fk_post_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (7,'Test Blog Post',1,'<p>blah</p>','2016-06-24 10:50:15','2016-06-24 10:50:15','2016-06-24 10:50:15',NULL),(9,'Test 1',1,'Testing 1.2.3..','2016-06-24 16:24:02','2016-06-24 16:24:02','2016-06-24 16:24:02',NULL),(10,'Test 1',1,'Testing 1.2.3..','2016-06-24 16:39:49','2016-06-24 16:39:49','2016-06-24 16:39:49',NULL),(11,'189a79ee-0d13-4d6d-94fe-11f6c21603aa',1,'08ec754e-939a-444a-a46f-12c45d46338c','2016-06-24 16:39:49','2016-06-24 16:39:49','2016-06-24 16:39:49',NULL),(12,'Test 1',1,'Testing 1.2.3..','2016-06-24 16:45:17','2016-06-24 16:45:17','2016-06-24 16:45:17',NULL),(13,'1952118d-cee7-4f85-94a3-f85808c42076',1,'e0f1f946-0d0a-4742-895c-f1e7ba3a50d8','2016-06-24 16:45:17','2016-06-24 16:45:17','2016-06-24 16:45:17',NULL),(14,'Test 1',1,'Testing 1.2.3..','2016-06-24 16:46:01','2016-06-24 16:46:01','2016-06-24 16:46:01',NULL),(15,'be601850-77c6-46ae-8969-c53dbc44e3de',1,'bbf9edbe-9c06-4d08-bccd-8bce4b04d65c','2016-06-24 16:46:02','2016-06-24 16:46:02','2016-06-24 16:46:02',NULL),(16,'Test 1',1,'Testing 1.2.3..','2016-06-27 16:33:04','2016-06-27 16:33:04','2016-06-27 16:33:04',NULL),(17,'Test 1',1,'Testing 1.2.3..','2016-06-27 16:39:55','2016-06-27 16:39:55','2016-06-27 16:39:55',NULL),(18,'Test 1',1,'Testing 1.2.3..','2016-06-27 16:42:03','2016-06-27 16:42:03','2016-06-27 16:42:03',NULL),(19,'Test 1',1,'Testing 1.2.3..','2016-06-27 16:49:00','2016-06-27 16:49:00','2016-06-27 16:49:00',NULL),(20,'Test 1',1,'Testing 1.2.3..','2016-06-27 16:50:52','2016-06-27 16:50:52','2016-06-27 16:50:52',NULL),(21,'Test 1',1,'Testing 1.2.3..','2016-06-27 16:52:20','2016-06-27 16:52:20','2016-06-27 16:52:20',NULL),(22,'Test 1',1,'Testing 1.2.3..','2016-06-27 17:09:32','2016-06-27 17:09:32','2016-06-27 17:09:32',NULL),(23,'Test 1',1,'Testing 1.2.3..','2016-06-27 20:31:32','2016-06-27 20:31:32','2016-06-27 20:31:32',NULL),(24,'Test 1',1,'Testing 1.2.3..','2016-06-27 20:42:11','2016-06-27 20:42:11','2016-06-27 20:42:11',NULL),(25,'Test 1',1,'Testing 1.2.3..','2016-06-27 20:42:31','2016-06-27 20:42:31','2016-06-27 20:42:31',NULL),(26,'Test 1',1,'Testing 1.2.3..','2016-06-27 20:45:48','2016-06-27 20:45:48','2016-06-27 20:45:48',NULL),(27,'Test 1',1,'Testing 1.2.3..','2016-06-27 20:46:05','2016-06-27 20:46:05','2016-06-27 20:46:05',NULL),(28,'Test 1',1,'Testing 1.2.3..','2016-06-27 20:47:36','2016-06-27 20:47:36','2016-06-27 20:47:36',NULL),(29,'Test 1',1,'Testing 1.2.3..','2016-06-27 20:58:46','2016-06-27 20:58:46','2016-06-27 20:58:46',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page`
--

LOCK TABLES `static_page` WRITE;
/*!40000 ALTER TABLE `static_page` DISABLE KEYS */;
INSERT INTO `static_page` VALUES (1,'BOB','TEST',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 15:35:03'),(2,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 15:37:54'),(3,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 15:42:02'),(4,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 16:04:19'),(5,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 16:30:51'),(6,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 16:30:52'),(7,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 16:30:52'),(8,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 16:33:25'),(9,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 16:33:25'),(10,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-22 16:33:26'),(11,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 08:56:43'),(12,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 08:56:43'),(13,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 15:42:49'),(14,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 15:42:50'),(15,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 15:52:00'),(16,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 15:52:00'),(17,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 16:28:20'),(18,'Billy Bob','Gretal','StinkyCheese1','GreatBilly@JimsBarbiqueEmporium.com',3,'2016-06-23 16:28:20');
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

-- Dump completed on 2016-06-28 12:01:14
