-- MySQL dump 10.13  Distrib 5.6.43, for Win64 (x86_64)
--
-- Host: localhost    Database: syscmdb
-- ------------------------------------------------------
-- Server version	5.6.43

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
-- Current Database: `syscmdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `syscmdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `syscmdb`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add profile',7,'add_profile'),(20,'Can change profile',7,'change_profile'),(21,'Can delete profile',7,'delete_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$CtVJpYe4KU7K$r/gopka1ly9dzg/nCI2DharBqtg281GMzIi8iau1ijk=','2019-04-04 16:33:44.999166',1,'admin','','','admin@qq.com',1,1,'2019-04-04 15:43:50.334554'),(2,'pbkdf2_sha256$36000$H6tyQ4Ncl4mX$sKS9+VUkHmHkf+be9qJRuCmO2hKVZLzDGFDuT2a8Wdo=',NULL,1,'devops','','','devops@qq.com',1,0,'2019-04-04 16:54:29.255456'),(7,'pbkdf2_sha256$36000$gzPPY9Sra0fI$AcKTJrsCoVx5U+xAkd3NJyOLWI39NqcLzHd54IDCBd8=',NULL,0,'user1','','','1.qq@com',0,1,'2019-04-04 17:46:47.250872'),(8,'pbkdf2_sha256$36000$yqXlG7hYtGaT$90hqVOFENk/yK2CnhetLij19fh0Q0ZxNW8n1TMIvuoA=',NULL,0,'user2','','','2.qq@com',0,1,'2019-04-04 17:46:47.341628'),(9,'pbkdf2_sha256$36000$syo4uzMwlojq$RLVokZ7lq82wj5wHqaKLDy6Fkhabxh3EMm8yFZyk/Mo=',NULL,0,'user3','','','3.qq@com',0,1,'2019-04-04 17:46:47.432386'),(10,'pbkdf2_sha256$36000$Vjdb7xJMw8Xf$26KnPpuynoxaEqTWU+2lIsHwc0OBriyDPNdVJVFL2x4=',NULL,0,'user4','','','4.qq@com',0,1,'2019-04-04 17:46:47.506187'),(11,'pbkdf2_sha256$36000$7dvA3v008Tu8$fyRCklAz1O2xvSOkytAzgvoejSH/mkPAveCl6yp2H8s=',NULL,0,'user5','','','5.qq@com',0,1,'2019-04-04 17:46:47.579990'),(12,'pbkdf2_sha256$36000$9kz4ACCEA6Da$HKdi8oFJcnOZY1P4GJYzaBUZX2oDi0RB7/jF8gAKN3E=',NULL,0,'user6','','','6.qq@com',0,1,'2019-04-04 17:46:47.658778'),(13,'pbkdf2_sha256$36000$aVFIWWbK7VTk$NiF9FNtseWb0PRIvnx9DfzNCnAHl1tklPeRcx/9JwkA=',NULL,0,'user7','','','7.qq@com',0,1,'2019-04-04 17:46:47.758513'),(14,'pbkdf2_sha256$36000$sVNNDR730rGg$tD26aV6+xLNBA42P4Vwi0y68HuL7OhZtlu9sLQSH4nk=',NULL,0,'user8','','','8.qq@com',0,1,'2019-04-04 17:46:47.862235'),(15,'pbkdf2_sha256$36000$RfRuSjHxnv0S$pmu8FjDODOXqw3LO4sZP9JnwIThBmMDFFcbtHAmIp0k=',NULL,0,'user9','','','9.qq@com',0,1,'2019-04-04 17:46:47.948005'),(16,'pbkdf2_sha256$36000$yvKz5eiXN8sG$d6K27HD1odTCJajt1ALZFYFN8artA/6X/CsN+vxhiFg=',NULL,0,'user10','','','10.qq@com',0,1,'2019-04-04 17:46:48.038762'),(17,'pbkdf2_sha256$36000$gDHROJqz27Pc$nKxKM5oCTF8dL/MiJzAlyVI4TnTurifGoMZCx2+vqQo=',NULL,0,'user11','','','11.qq@com',0,1,'2019-04-04 17:46:48.117560'),(18,'pbkdf2_sha256$36000$7ba185Nu6hkT$pMhh0sCEinnWBLcqaM6e4f+3/V3/yCV0CkYr9cttu3g=',NULL,0,'user12','','','12.qq@com',0,1,'2019-04-04 17:46:48.193367'),(19,'pbkdf2_sha256$36000$6iM5SrtZuc0P$VU6/C7ZyOo59I8p1JrDzT2e6b7PDt8EwTCDzzEKiF5o=',NULL,0,'user13','','','13.qq@com',0,1,'2019-04-04 17:46:48.270144'),(20,'pbkdf2_sha256$36000$eSKzEcHiMUbY$8oIL6XfcNRn7fvv4Ei3EoKDZHybfOYhT8AbTKvM1zRY=',NULL,0,'user14','','','14.qq@com',0,1,'2019-04-04 17:46:48.349970'),(21,'pbkdf2_sha256$36000$fxzLDGFibkDM$cmp58mQ9Q0qOC/JE/07ILUl/PMlix59UlMAeQjdF+v0=',NULL,0,'user15','','','15.qq@com',0,1,'2019-04-04 17:46:48.441687'),(22,'pbkdf2_sha256$36000$TzoSbTvT9sWI$OO6ldy1RN3OMUSdQibW9a/aXBjjQVR5PfEcT8Ri2qvM=',NULL,0,'user16','','','16.qq@com',0,1,'2019-04-04 17:46:48.519477'),(23,'pbkdf2_sha256$36000$5TTKyqw9aRsd$LJyv6fBo38FMiqlM+hElQ+kuWeZfGq3WVS7Ui+DxEag=',NULL,0,'user17','','','17.qq@com',0,1,'2019-04-04 17:46:48.598266'),(24,'pbkdf2_sha256$36000$W7XI9Az1GFb7$dH+20RMk6dX72pgoE4tTOM7OB5YaymybNER8yZN/lvU=',NULL,0,'user18','','','18.qq@com',0,1,'2019-04-04 17:46:48.674066'),(25,'pbkdf2_sha256$36000$36dhP6V7aAb8$WEnMVPNyWKMnIDJ4ttpwtHKMDnRHrhgKcwixpNfD0u8=',NULL,0,'user19','','','19.qq@com',0,1,'2019-04-04 17:46:48.754848'),(26,'pbkdf2_sha256$36000$KjHKEwuxbRGA$t6peC/52W++l7yMyfEmBSHe1/GIUZaWHi7up2LjiA7I=',NULL,0,'user20','','','20.qq@com',0,1,'2019-04-04 17:46:48.852839'),(27,'pbkdf2_sha256$36000$OJttDL9bDGvw$9A51YrcxkLpvr+4diGUL2LWM48kNDw2Ej4mQgf5xs/g=',NULL,0,'user21','','','21.qq@com',0,1,'2019-04-04 17:46:48.933373'),(28,'pbkdf2_sha256$36000$wgbn1HuE4QGA$3ehpkzwZctGP0cCY4tFIQBIH2OI3ZrC8d7T/m0HjZxA=',NULL,0,'user22','','','22.qq@com',0,1,'2019-04-04 17:46:48.996203'),(29,'pbkdf2_sha256$36000$2ZWPwk6sd92z$2douKTpxMl8HG2YQgm9wJuXB4BRGjcfzW54j6w1H9gI=',NULL,0,'user23','','','23.qq@com',0,1,'2019-04-04 17:46:49.077985'),(30,'pbkdf2_sha256$36000$mtgrlBtCibpm$q5l8M8ebYvXnWKuwZ+uFVYK4brphNc39Bq6rkmrqgU0=',NULL,0,'user24','','','24.qq@com',0,1,'2019-04-04 17:46:49.182702'),(31,'pbkdf2_sha256$36000$GqfVCd4h4jqc$R5QLdUon3jBpFz6FGJF0gvKGt3LSNbJPZhesucn3BCw=',NULL,0,'user25','','','25.qq@com',0,1,'2019-04-04 17:46:49.266480'),(32,'pbkdf2_sha256$36000$qlQYsRU9KE8M$y8HGmRyzpKx8CUpn/AX3XauCCAbD9JJiYnr0IGpf1r4=',NULL,0,'user26','','','26.qq@com',0,1,'2019-04-04 17:46:49.345269'),(33,'pbkdf2_sha256$36000$OzGOFs26JqQz$6z7BpTlblVHepUj/AlO/6UUDf+6GEKzW62zNGbldjWM=',NULL,0,'user27','','','27.qq@com',0,1,'2019-04-04 17:46:49.433035'),(34,'pbkdf2_sha256$36000$BlimX0GMuju3$i1n5rhsRnK6SwV1yuSgiXtwCN+39A18wRDsAeQApKfk=',NULL,0,'user28','','','28.qq@com',0,1,'2019-04-04 17:46:49.504841'),(35,'pbkdf2_sha256$36000$cqfNhY5bYTjO$v5A/gtjhHyYQ7t4KmF0PfoxXIpFN+vC0ZCTxdwK+twU=',NULL,0,'user29','','','29.qq@com',0,1,'2019-04-04 17:46:49.589617'),(36,'pbkdf2_sha256$36000$X6qkZnkUrm0B$dasLoAsJnHal8JvaKZDGmu2dIBx91uBMMKM/fSReq3Y=',NULL,0,'user30','','','30.qq@com',0,1,'2019-04-04 17:46:49.670398'),(37,'pbkdf2_sha256$36000$hrMi3mpu2yAg$kpczJXc671J0PMSqWZ+W/cyPlLGr0GZYV1ytq1Z4PJ4=',NULL,0,'user31','','','31.qq@com',0,1,'2019-04-04 17:46:49.751182'),(38,'pbkdf2_sha256$36000$xDI4cSvkAMrH$sgyk8K8CodnUGdtxfphn4puMLcfHTSVRAzLpYuhH6ZQ=',NULL,0,'user32','','','32.qq@com',0,1,'2019-04-04 17:46:49.841946'),(39,'pbkdf2_sha256$36000$CuZXl0Ixjzih$jPRQCKKnVkrLz8che0REdH4kInU7LwraZKbWEb0MOrU=',NULL,0,'user33','','','33.qq@com',0,1,'2019-04-04 17:46:49.927727'),(40,'pbkdf2_sha256$36000$WkIUX69FK0Rj$CHt9wc+E2fhA/apkdhbhJHzYxjVshHVFalgK/0azDN8=',NULL,0,'user34','','','34.qq@com',0,1,'2019-04-04 17:46:50.009491'),(41,'pbkdf2_sha256$36000$bLgOqXkiQMyz$iX5nAy481sRqQ91zVMhqLGcJNc0O348Xceq5erzLUD0=',NULL,0,'user35','','','35.qq@com',0,1,'2019-04-04 17:46:50.083316'),(42,'pbkdf2_sha256$36000$Oes3biLcwkiT$P7S2HTahpePxtNRKPVKkpBm7a/RWZO9eTfYbRhWR1Zg=',NULL,0,'user36','','','36.qq@com',0,1,'2019-04-04 17:46:50.164079'),(43,'pbkdf2_sha256$36000$iGVZWcWAO9bs$sDPR4DnOX4aYqYSqWp+qEx+pueGW0O1BGA4gvJMO3qg=',NULL,0,'user37','','','37.qq@com',0,1,'2019-04-04 17:46:50.258066'),(44,'pbkdf2_sha256$36000$1Sq4LLvWVRQm$tAPDolBX0jtlNuwLWC9wJYOFd6Y4q+vvajSk757N3Bg=',NULL,0,'user38','','','38.qq@com',0,1,'2019-04-04 17:46:50.339610'),(45,'pbkdf2_sha256$36000$cTdv4b5JJlXM$DXrsmpQeR6nJcFJ8h/b7hSczCijzkxgmdEmXP2QzjI4=',NULL,0,'user39','','','39.qq@com',0,1,'2019-04-04 17:46:50.414408'),(46,'pbkdf2_sha256$36000$2BzNqPJLombo$Jxo2aQ6hTmWNkXojb36ytdkPKXlb070VTl77LJA1Ffg=',NULL,0,'user40','','','40.qq@com',0,1,'2019-04-04 17:46:50.487258'),(47,'pbkdf2_sha256$36000$pylwUgJyVJcO$aEAnxwqkGZ8JDKr42THGPKFtTaAg3pd60/xDimjsO7o=',NULL,0,'user41','','','41.qq@com',0,1,'2019-04-04 17:46:50.574981'),(48,'pbkdf2_sha256$36000$8u32nUwQ3Xm6$KBSGCPglQTlUc81dIZg/nliLM06PcOMm1wA6WOh3W3U=',NULL,0,'user42','','','42.qq@com',0,1,'2019-04-04 17:46:50.655764'),(49,'pbkdf2_sha256$36000$3LvpxvLU7QOz$fGMX3Czo99raNpv1suP4jjmxlkbijv3bCSDblBiC4qM=',NULL,0,'user43','','','43.qq@com',0,1,'2019-04-04 17:46:50.738555'),(50,'pbkdf2_sha256$36000$GrmFzK0Ewgrd$mfZA7meOvpgG06bY6RvNvALKGhSejNPts/n5x4nanpA=',NULL,0,'user44','','','44.qq@com',0,1,'2019-04-04 17:46:50.840272'),(51,'pbkdf2_sha256$36000$EetCWARKZU81$nVbUxo3or5COctGqZ5ZWMqS0j8Ary8Mjxl0nLnE+RmM=',NULL,0,'user45','','','45.qq@com',0,1,'2019-04-04 17:46:50.915070'),(52,'pbkdf2_sha256$36000$6eb5h9hJcuz6$GUe5PrbwVsyNgWRnLZpPDTyNG+fxF2eJsW5pY91TgKc=',NULL,0,'user46','','','46.qq@com',0,1,'2019-04-04 17:46:50.991867'),(53,'pbkdf2_sha256$36000$c7b65jPRlq5c$XgiBMYzTuU2fw0leWP6dGN7h7a51v0qLT880ulJQAmE=',NULL,0,'user47','','','47.qq@com',0,1,'2019-04-04 17:46:51.070660'),(54,'pbkdf2_sha256$36000$aeNtfVBjzKxN$t7v045x4kGQDuISgJ/CFn1crmRzdrM2qSYgbbhNMcrE=',NULL,0,'user48','','','48.qq@com',0,1,'2019-04-04 17:46:51.153442'),(55,'pbkdf2_sha256$36000$RsfYTYZYUF0U$/C+DXrKLyli+xRZ/Ahkyaj0Ki3FGx9c+JkeZ5ysHjpc=',NULL,0,'user49','','','49.qq@com',0,1,'2019-04-04 17:46:51.239235'),(56,'pbkdf2_sha256$36000$NsKYWSj6q9z6$aQv/0NYCEtnGMz8Z1sHoeacaYG4OssZOgnov71a1YOU=',NULL,0,'user50','','','50.qq@com',0,1,'2019-04-04 17:46:51.313005'),(57,'pbkdf2_sha256$36000$TipRp3kOHLof$umRKH8DVkXO1SFgRWtydqAH3iiP9EjpvdmHtTGDmUYI=',NULL,0,'user51','','','51.qq@com',0,1,'2019-04-04 17:46:51.395787'),(58,'pbkdf2_sha256$36000$ByVHFtdrWbm5$kXaYAo47r9X4oneisG21hkbphSjCf0Q9WxJ/VjuwomY=',NULL,0,'user52','','','52.qq@com',0,1,'2019-04-04 17:46:51.477565'),(59,'pbkdf2_sha256$36000$uyd29S9KT8Th$MNCDpWmqj8tHfjCEJcObpcXXS5yM57jV+8CXpNwnRoQ=',NULL,0,'user53','','','53.qq@com',0,1,'2019-04-04 17:46:51.559356'),(60,'pbkdf2_sha256$36000$uhRHS0Axoxp1$hYP9uXH6MATNdRCmfZ7Vscdk9WsE0IdidASFVezC6kA=',NULL,0,'user54','','','54.qq@com',0,1,'2019-04-04 17:46:51.644124'),(61,'pbkdf2_sha256$36000$vwUqjw7ibYej$2UeVZR9YWwIQBoHCsT0CRWcmP13reoB/O91UocrLczE=',NULL,0,'user55','','','55.qq@com',0,1,'2019-04-04 17:46:51.734880'),(62,'pbkdf2_sha256$36000$z2ejvaSKWmqt$5MOhQL4423bm4rTr559P3xJN7czITEeLLAULPDG5tog=',NULL,0,'user56','','','56.qq@com',0,1,'2019-04-04 17:46:51.841591'),(63,'pbkdf2_sha256$36000$xuAWgS68hDhN$HmlVLH8a5SljY+xMejXf+RZCmRaILdoydctdHu6FDcY=',NULL,0,'user57','','','57.qq@com',0,1,'2019-04-04 17:46:51.926364'),(64,'pbkdf2_sha256$36000$EWwMUUkwYKoD$CTCGZQRjei2zeoB6xFTpPe23CMRDJH3NyMsG3y2R4/8=',NULL,0,'user58','','','58.qq@com',0,1,'2019-04-04 17:46:51.998173'),(65,'pbkdf2_sha256$36000$Tn8GcNvLyNIq$8+H9THyk3sHhbaW88R1YxKXH/EVlsZMEsSWLorogCsI=',NULL,0,'user59','','','59.qq@com',0,1,'2019-04-04 17:46:52.076963'),(66,'pbkdf2_sha256$36000$dwB7a7btYB2x$NXsORTrzOD3OSlBcmJ43EufEowLGnElXV6y42nPFaKQ=',NULL,0,'user60','','','60.qq@com',0,1,'2019-04-04 17:46:52.157746'),(67,'pbkdf2_sha256$36000$cBBDAI1r64Bk$mVpsugCWv71JFco5shFB3h/CzIWp4lAWRO9LsHnw2oA=',NULL,0,'user61','','','61.qq@com',0,1,'2019-04-04 17:46:52.244513'),(68,'pbkdf2_sha256$36000$CBanLEZbsEFa$js6P8m0gNI+a13iLDP7PVjWAD5pWva89sCjPwMOCfzA=',NULL,0,'user62','','','62.qq@com',0,1,'2019-04-04 17:46:52.333277'),(69,'pbkdf2_sha256$36000$stdPp4PXUPEV$GSY4qVS/YtywDBHnVCd7inZq/avJ76EMKPRRjXVxNiw=',NULL,0,'user63','','','63.qq@com',0,1,'2019-04-04 17:46:52.423038'),(70,'pbkdf2_sha256$36000$xnFiJkO8ussz$8O4QzYTqrE2EnWBeWjXFHcI79jIM0WZSAXNbIbLMlDg=',NULL,0,'user64','','','64.qq@com',0,1,'2019-04-04 17:46:52.495841'),(71,'pbkdf2_sha256$36000$hFIytRZQMajx$8nR5p8oLFcwkQ/kaGDDTNB/kKQCf/JbbP8YhlPsCJso=',NULL,0,'user65','','','65.qq@com',0,1,'2019-04-04 17:46:52.580646'),(72,'pbkdf2_sha256$36000$f6wTekHCymQC$4BWrXEO68r6QP7EfExkaSE9y3XtcpQeEaRsmm6uTsBs=',NULL,0,'user66','','','66.qq@com',0,1,'2019-04-04 17:46:52.660402'),(73,'pbkdf2_sha256$36000$ZcvinxoVBfbO$CnBLiL1I39KySUvj8oLeF/uWqOVYd7ONTcUT5uy9J0c=',NULL,0,'user67','','','67.qq@com',0,1,'2019-04-04 17:46:52.747170'),(74,'pbkdf2_sha256$36000$m4fHDxE0Kbrq$C6fzVbgJzz+LJMAtmyjXOzyMSjrQ9V28peZOCQLfFq8=',NULL,0,'user68','','','68.qq@com',0,1,'2019-04-04 17:46:52.839921'),(75,'pbkdf2_sha256$36000$QiFmW7g8IzFK$aQpMxCw9A3UHvBpJ+wO76WGxBFsiMNma4dvUdmyDhg0=',NULL,0,'user69','','','69.qq@com',0,1,'2019-04-04 17:46:52.925691'),(76,'pbkdf2_sha256$36000$G1wHuA4bGSpe$5mGrodM7lYJ0ozh3G9lxBfgDGyX2+9WCr4KY5Ib3W2c=',NULL,0,'user70','','','70.qq@com',0,1,'2019-04-04 17:46:53.006477'),(77,'pbkdf2_sha256$36000$8vA6j2S9oUZ8$vU9Z+YQMJuWeACfzEH5KG49loqz2+LlNY50NUPg8Z88=',NULL,0,'user71','','','71.qq@com',0,1,'2019-04-04 17:46:53.083271'),(78,'pbkdf2_sha256$36000$wfmC62JcBibW$5ajAYm4hun+5RPF4n8VKuvUmrpsI8y/3oHnwaw+RQpI=',NULL,0,'user72','','','72.qq@com',0,1,'2019-04-04 17:46:53.162094'),(79,'pbkdf2_sha256$36000$2XUKg6DIeRC7$Kjl+HhkmkEnnDX22BVnQvVsiPTKB7e17KWezG6wX/Iw=',NULL,0,'user73','','','73.qq@com',0,1,'2019-04-04 17:46:53.243842'),(80,'pbkdf2_sha256$36000$G62cw15PS4gZ$52X0fvl8ZMN4AANWOvVvMzlPI3SKGeYAINMVxakqifA=',NULL,0,'user74','','','74.qq@com',0,1,'2019-04-04 17:46:53.335595'),(81,'pbkdf2_sha256$36000$R2WGXsG0ugLM$pj38GbWcrC6woIHEJWBV/+uEuOPsAT4pkLPk/1jS+zs=',NULL,0,'user75','','','75.qq@com',0,1,'2019-04-04 17:46:53.405409'),(82,'pbkdf2_sha256$36000$ZmBFLHt8uQKU$nQOZpv7slTNoM5uDylUdtobvoBNdwkV5+WY5HhyM5Zs=',NULL,0,'user76','','','76.qq@com',0,1,'2019-04-04 17:46:53.499161'),(83,'pbkdf2_sha256$36000$r7XG9EwWzbhB$z38OIFBkAdVHp2zesKYoNuAImXgjjqaTmQtVcg4RHkU=',NULL,0,'user77','','','77.qq@com',0,1,'2019-04-04 17:46:53.578965'),(84,'pbkdf2_sha256$36000$uYWdaAD0MucO$e5DY8YuAmeqO24saTc6SwPklaXWE4u3h/X2CbkwFyTo=',NULL,0,'user78','','','78.qq@com',0,1,'2019-04-04 17:46:53.659751'),(85,'pbkdf2_sha256$36000$FxJoqbbIfHH2$5EXX9CyFKzwW79OgIcRpq40o0cBNC+dfvEnjRZkNG9o=',NULL,0,'user79','','','79.qq@com',0,1,'2019-04-04 17:46:53.748508'),(86,'pbkdf2_sha256$36000$K0NZ31GH4niN$u/4vtv5o0VNl2Y33u8z45Yj56HrZ9/AhQMLV6ojj1rA=',NULL,0,'user80','','','80.qq@com',0,1,'2019-04-04 17:46:53.838256'),(87,'pbkdf2_sha256$36000$UmMHSXvOfJyF$wg0SaiFAfFvad1HI3pMuMVNkQdUNR7FpHj1YQgIayPk=',NULL,0,'user81','','','81.qq@com',0,1,'2019-04-04 17:46:53.909063'),(88,'pbkdf2_sha256$36000$108Xwj5TBPTX$6XnHG7JeKOuLr/4qQA7MMaIX2TESHgq6ksSB9NwR4Xo=',NULL,0,'user82','','','82.qq@com',0,1,'2019-04-04 17:46:53.983862'),(89,'pbkdf2_sha256$36000$w81ToAMc7X7A$+Y1wY2nqXqi50/I3CJmLyqE2AsTLmv/OLvEqD0MjUpk=',NULL,0,'user83','','','83.qq@com',0,1,'2019-04-04 17:46:54.056667'),(90,'pbkdf2_sha256$36000$OLMr7ibm74jT$LnIo/DTm9SSoPPV2kVmE9RyVney58XWccLydy9yRvMQ=',NULL,0,'user84','','','84.qq@com',0,1,'2019-04-04 17:46:54.132464'),(91,'pbkdf2_sha256$36000$Osr4mYiAIrPV$T8IghtB1nfD4N/JZyXCDRV97E9IBG3+3cra0nehwRH0=',NULL,0,'user85','','','85.qq@com',0,1,'2019-04-04 17:46:54.203274'),(92,'pbkdf2_sha256$36000$OCxqR03kcVyF$PaY2ym5lbAEMtVMmcuiqQgbmZ3bSbiJoolhXG4eXHwo=',NULL,0,'user86','','','86.qq@com',0,1,'2019-04-04 17:46:54.283061'),(93,'pbkdf2_sha256$36000$AZ0ks2v03T3t$HOeqHDnIjSJlo90+Tdy1/Veu80JBXtJNdGsLUnbYduY=',NULL,0,'user87','','','87.qq@com',0,1,'2019-04-04 17:46:54.358859'),(94,'pbkdf2_sha256$36000$DGsAUG9vuWxz$x1TaxQrs9dVgaQWiixSINIMKRVaGtwDFZ3wFDOSiq3U=',NULL,0,'user88','','','88.qq@com',0,1,'2019-04-04 17:46:54.436651'),(95,'pbkdf2_sha256$36000$h0SpSocTKJYD$3pYlGz1GpJucOu/L2F6YK6LchY6MYOi1eJpuNtZDjTg=',NULL,0,'user89','','','89.qq@com',0,1,'2019-04-04 17:46:54.520428'),(96,'pbkdf2_sha256$36000$U73HmonOKpbj$p7rjBoGS6Rid40KsKBrvD3v9+DKj6n6HFNOlciwdivA=',NULL,0,'user90','','','90.qq@com',0,1,'2019-04-04 17:46:54.599216'),(97,'pbkdf2_sha256$36000$MeyTL9Tmn7x0$aA2Vv+8JL4ljfIXkn7jCHkXU9A/7UE8LDrmoMQczZ3c=',NULL,0,'user91','','','91.qq@com',0,1,'2019-04-04 17:46:54.689974'),(98,'pbkdf2_sha256$36000$dPaFNoU3TXeP$vuZUQzztAGvylAjQDBW7ZgbFZMixsKMelQaevlPhoNU=',NULL,0,'user92','','','92.qq@com',0,1,'2019-04-04 17:46:54.771754'),(99,'pbkdf2_sha256$36000$S3Tf60kxl0TA$CPg+bBVY5CcAPgkqFgBftO2JpSpJ6mgy46nBz9ELO+c=',NULL,0,'user93','','','93.qq@com',0,1,'2019-04-04 17:46:54.873481'),(100,'pbkdf2_sha256$36000$iIEYYEsB4uWF$13q0yRvCDoCm0YBiGn3zVl2qgl5nrTfkGxSW/cuYa00=',NULL,0,'user94','','','94.qq@com',0,1,'2019-04-04 17:46:54.961247'),(101,'pbkdf2_sha256$36000$bM7FhihHuZyV$JjBzmygKaWd2CX45MFRywGMrW71r0mvFDQMslz3J4FY=',NULL,0,'user95','','','95.qq@com',0,1,'2019-04-04 17:46:55.045023'),(102,'pbkdf2_sha256$36000$BKz1AZ7ZPuGj$c86+aog45Tlq7mBe16/Z2w3a/e9+7p8tcBnmLN3VQZc=',NULL,0,'user96','','','96.qq@com',0,1,'2019-04-04 17:46:55.127801'),(103,'pbkdf2_sha256$36000$QPhzTw6jnCsT$djBIlJUE8YYhPkx8S0KZnolevkXpY7XRwNEuxf+GCqE=',NULL,0,'user97','','','97.qq@com',0,1,'2019-04-04 17:46:55.197617'),(104,'pbkdf2_sha256$36000$Q7GVo3712bWR$739iMRv+ntXr0DtiUOiMB9/seM5LRfL6VWQJHMrpWxg=',NULL,0,'user98','','','98.qq@com',0,1,'2019-04-04 17:46:55.278404'),(105,'pbkdf2_sha256$36000$Vf7cUJrEn5IB$kX+XOSlwImjUHK9SAJ78E/f5TaX0+qpuJrgRBgfSFH8=',NULL,0,'user99','','','99.qq@com',0,1,'2019-04-04 17:46:55.355208');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'users','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-04 10:26:40.933925'),(2,'auth','0001_initial','2019-04-04 10:26:41.451540'),(3,'admin','0001_initial','2019-04-04 10:26:41.544291'),(4,'admin','0002_logentry_remove_auto_add','2019-04-04 10:26:41.554264'),(5,'contenttypes','0002_remove_content_type_name','2019-04-04 10:26:41.626083'),(6,'auth','0002_alter_permission_name_max_length','2019-04-04 10:26:41.676937'),(7,'auth','0003_alter_user_email_max_length','2019-04-04 10:26:41.735779'),(8,'auth','0004_alter_user_username_opts','2019-04-04 10:26:41.750741'),(9,'auth','0005_alter_user_last_login_null','2019-04-04 10:26:41.783651'),(10,'auth','0006_require_contenttypes_0002','2019-04-04 10:26:41.789635'),(11,'auth','0007_alter_validators_add_error_messages','2019-04-04 10:26:41.800605'),(12,'auth','0008_alter_user_username_max_length','2019-04-04 10:26:41.832521'),(13,'sessions','0001_initial','2019-04-04 10:26:41.857454'),(14,'users','0001_initial','2019-04-04 17:01:22.178028');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('g8z73oktmrulqtauuasa2merh8yu0gq7','NGU5NDRhZTI0ZGI5M2QwNjhhMzBmMDY1YmUwYzFiM2RhYTJiNzIwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZDc4MThiMDc3MTBiNTUzNDc4YmNjMTczMzVkNDlmYjNmYTM0Mzg1In0=','2019-04-18 16:32:42.873322');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_cn` varchar(10) NOT NULL,
  `wechat` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `info` longtext NOT NULL,
  `Profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Profile_id` (`Profile_id`),
  CONSTRAINT `users_profile_Profile_id_773cacee_fk_auth_user_id` FOREIGN KEY (`Profile_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,'运维开发','devops','13333333333','我是运维开发人员 研究运维和开发',2),(2,'用户1','wechat_user1','1333333331','测试用户1',7),(3,'用户2','wechat_user2','1333333332','测试用户2',8),(4,'用户3','wechat_user3','1333333333','测试用户3',9),(5,'用户4','wechat_user4','1333333334','测试用户4',10),(6,'用户5','wechat_user5','1333333335','测试用户5',11),(7,'用户6','wechat_user6','1333333336','测试用户6',12),(8,'用户7','wechat_user7','1333333337','测试用户7',13),(9,'用户8','wechat_user8','1333333338','测试用户8',14),(10,'用户9','wechat_user9','1333333339','测试用户9',15),(11,'用户10','wechat_user10','13333333310','测试用户10',16),(12,'用户11','wechat_user11','13333333311','测试用户11',17),(13,'用户12','wechat_user12','13333333312','测试用户12',18),(14,'用户13','wechat_user13','13333333313','测试用户13',19),(15,'用户14','wechat_user14','13333333314','测试用户14',20),(16,'用户15','wechat_user15','13333333315','测试用户15',21),(17,'用户16','wechat_user16','13333333316','测试用户16',22),(18,'用户17','wechat_user17','13333333317','测试用户17',23),(19,'用户18','wechat_user18','13333333318','测试用户18',24),(20,'用户19','wechat_user19','13333333319','测试用户19',25),(21,'用户20','wechat_user20','13333333320','测试用户20',26),(22,'用户21','wechat_user21','13333333321','测试用户21',27),(23,'用户22','wechat_user22','13333333322','测试用户22',28),(24,'用户23','wechat_user23','13333333323','测试用户23',29),(25,'用户24','wechat_user24','13333333324','测试用户24',30),(26,'用户25','wechat_user25','13333333325','测试用户25',31),(27,'用户26','wechat_user26','13333333326','测试用户26',32),(28,'用户27','wechat_user27','13333333327','测试用户27',33),(29,'用户28','wechat_user28','13333333328','测试用户28',34),(30,'用户29','wechat_user29','13333333329','测试用户29',35),(31,'用户30','wechat_user30','13333333330','测试用户30',36),(32,'用户31','wechat_user31','13333333331','测试用户31',37),(33,'用户32','wechat_user32','13333333332','测试用户32',38),(34,'用户33','wechat_user33','13333333333','测试用户33',39),(35,'用户34','wechat_user34','13333333334','测试用户34',40),(36,'用户35','wechat_user35','13333333335','测试用户35',41),(37,'用户36','wechat_user36','13333333336','测试用户36',42),(38,'用户37','wechat_user37','13333333337','测试用户37',43),(39,'用户38','wechat_user38','13333333338','测试用户38',44),(40,'用户39','wechat_user39','13333333339','测试用户39',45),(41,'用户40','wechat_user40','13333333340','测试用户40',46),(42,'用户41','wechat_user41','13333333341','测试用户41',47),(43,'用户42','wechat_user42','13333333342','测试用户42',48),(44,'用户43','wechat_user43','13333333343','测试用户43',49),(45,'用户44','wechat_user44','13333333344','测试用户44',50),(46,'用户45','wechat_user45','13333333345','测试用户45',51),(47,'用户46','wechat_user46','13333333346','测试用户46',52),(48,'用户47','wechat_user47','13333333347','测试用户47',53),(49,'用户48','wechat_user48','13333333348','测试用户48',54),(50,'用户49','wechat_user49','13333333349','测试用户49',55),(51,'用户50','wechat_user50','13333333350','测试用户50',56),(52,'用户51','wechat_user51','13333333351','测试用户51',57),(53,'用户52','wechat_user52','13333333352','测试用户52',58),(54,'用户53','wechat_user53','13333333353','测试用户53',59),(55,'用户54','wechat_user54','13333333354','测试用户54',60),(56,'用户55','wechat_user55','13333333355','测试用户55',61),(57,'用户56','wechat_user56','13333333356','测试用户56',62),(58,'用户57','wechat_user57','13333333357','测试用户57',63),(59,'用户58','wechat_user58','13333333358','测试用户58',64),(60,'用户59','wechat_user59','13333333359','测试用户59',65),(61,'用户60','wechat_user60','13333333360','测试用户60',66),(62,'用户61','wechat_user61','13333333361','测试用户61',67),(63,'用户62','wechat_user62','13333333362','测试用户62',68),(64,'用户63','wechat_user63','13333333363','测试用户63',69),(65,'用户64','wechat_user64','13333333364','测试用户64',70),(66,'用户65','wechat_user65','13333333365','测试用户65',71),(67,'用户66','wechat_user66','13333333366','测试用户66',72),(68,'用户67','wechat_user67','13333333367','测试用户67',73),(69,'用户68','wechat_user68','13333333368','测试用户68',74),(70,'用户69','wechat_user69','13333333369','测试用户69',75),(71,'用户70','wechat_user70','13333333370','测试用户70',76),(72,'用户71','wechat_user71','13333333371','测试用户71',77),(73,'用户72','wechat_user72','13333333372','测试用户72',78),(74,'用户73','wechat_user73','13333333373','测试用户73',79),(75,'用户74','wechat_user74','13333333374','测试用户74',80),(76,'用户75','wechat_user75','13333333375','测试用户75',81),(77,'用户76','wechat_user76','13333333376','测试用户76',82),(78,'用户77','wechat_user77','13333333377','测试用户77',83),(79,'用户78','wechat_user78','13333333378','测试用户78',84),(80,'用户79','wechat_user79','13333333379','测试用户79',85),(81,'用户80','wechat_user80','13333333380','测试用户80',86),(82,'用户81','wechat_user81','13333333381','测试用户81',87),(83,'用户82','wechat_user82','13333333382','测试用户82',88),(84,'用户83','wechat_user83','13333333383','测试用户83',89),(85,'用户84','wechat_user84','13333333384','测试用户84',90),(86,'用户85','wechat_user85','13333333385','测试用户85',91),(87,'用户86','wechat_user86','13333333386','测试用户86',92),(88,'用户87','wechat_user87','13333333387','测试用户87',93),(89,'用户88','wechat_user88','13333333388','测试用户88',94),(90,'用户89','wechat_user89','13333333389','测试用户89',95),(91,'用户90','wechat_user90','13333333390','测试用户90',96),(92,'用户91','wechat_user91','13333333391','测试用户91',97),(93,'用户92','wechat_user92','13333333392','测试用户92',98),(94,'用户93','wechat_user93','13333333393','测试用户93',99),(95,'用户94','wechat_user94','13333333394','测试用户94',100),(96,'用户95','wechat_user95','13333333395','测试用户95',101),(97,'用户96','wechat_user96','13333333396','测试用户96',102),(98,'用户97','wechat_user97','13333333397','测试用户97',103),(99,'用户98','wechat_user98','13333333398','测试用户98',104),(100,'用户99','wechat_user99','13333333399','测试用户99',105);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-04 18:11:38
