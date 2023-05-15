-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kargo_firmasi_otomasyonu
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `adres`
--

DROP TABLE IF EXISTS `adres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adres` (
  `adres_id` int NOT NULL,
  `sokakcadde_ismi` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mahalle_ismi` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bina_no` int NOT NULL,
  `daire_no` int NOT NULL,
  `il_ismi` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ilce_ismi` varchar(41) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adres`
--

LOCK TABLES `adres` WRITE;
/*!40000 ALTER TABLE `adres` DISABLE KEYS */;
/*!40000 ALTER TABLE `adres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura` (
  `fatura_id` int NOT NULL AUTO_INCREMENT,
  `musteri_id` int DEFAULT NULL,
  `gonderen_id` int DEFAULT NULL,
  `urun_fiyati` int DEFAULT NULL,
  `adres_id` int DEFAULT NULL,
  PRIMARY KEY (`fatura_id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `gonderen_id` (`gonderen_id`),
  KEY `urun_fiyati` (`urun_fiyati`),
  KEY `adres_id` (`adres_id`),
  CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`musteri_id`),
  CONSTRAINT `fatura_ibfk_2` FOREIGN KEY (`gonderen_id`) REFERENCES `gonderen` (`gonderen_id`),
  CONSTRAINT `fatura_ibfk_3` FOREIGN KEY (`urun_fiyati`) REFERENCES `fiyat_hesaplama` (`urun_fiyati`),
  CONSTRAINT `fatura_ibfk_4` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiyat_hesaplama`
--

DROP TABLE IF EXISTS `fiyat_hesaplama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiyat_hesaplama` (
  `urun_fiyati` int NOT NULL,
  PRIMARY KEY (`urun_fiyati`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiyat_hesaplama`
--

LOCK TABLES `fiyat_hesaplama` WRITE;
/*!40000 ALTER TABLE `fiyat_hesaplama` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiyat_hesaplama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gonderen`
--

DROP TABLE IF EXISTS `gonderen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gonderen` (
  `gonderen_id` int NOT NULL AUTO_INCREMENT,
  `gonderen_adsoyad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gonderen_telno` int NOT NULL,
  `gonderen_mail` varchar(40) NOT NULL,
  `adres_id` int NOT NULL,
  PRIMARY KEY (`gonderen_id`),
  KEY `adres_id` (`adres_id`),
  CONSTRAINT `gonderen_ibfk_1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gonderen`
--

LOCK TABLES `gonderen` WRITE;
/*!40000 ALTER TABLE `gonderen` DISABLE KEYS */;
/*!40000 ALTER TABLE `gonderen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kargo`
--

DROP TABLE IF EXISTS `kargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kargo` (
  `kargo_id` int NOT NULL AUTO_INCREMENT,
  `tarih` date NOT NULL,
  `agirlik` int NOT NULL,
  `musteri_id` int DEFAULT NULL,
  `gonderen_id` int DEFAULT NULL,
  PRIMARY KEY (`kargo_id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `gonderen_id` (`gonderen_id`),
  CONSTRAINT `kargo_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`musteri_id`),
  CONSTRAINT `kargo_ibfk_2` FOREIGN KEY (`gonderen_id`) REFERENCES `gonderen` (`gonderen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kargo`
--

LOCK TABLES `kargo` WRITE;
/*!40000 ALTER TABLE `kargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `kargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musteri`
--

DROP TABLE IF EXISTS `musteri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musteri` (
  `musteri_id` int NOT NULL AUTO_INCREMENT,
  `musteri_adsoyad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `musteri_telno` int NOT NULL,
  `musteri_mail` varchar(40) NOT NULL,
  `adres_id` int NOT NULL,
  PRIMARY KEY (`musteri_id`),
  KEY `adres_id` (`adres_id`),
  CONSTRAINT `musteri_ibfk_1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musteri`
--

LOCK TABLES `musteri` WRITE;
/*!40000 ALTER TABLE `musteri` DISABLE KEYS */;
/*!40000 ALTER TABLE `musteri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15  1:43:05
