-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: GestionEmergencia
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `AyudaEntregaPrimaria`
--

DROP TABLE IF EXISTS `AyudaEntregaPrimaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AyudaEntregaPrimaria` (
  `id_entrega_primaria` int(11) NOT NULL,
  `id_emergencia` int(11) DEFAULT NULL,
  `CERTIFICADO_SOCIAL` varchar(50) DEFAULT NULL,
  `GUÍA_SALIDA_BODEGA` varchar(50) DEFAULT NULL,
  `CAJA_DE_ALIMENTOS` int(11) DEFAULT NULL,
  `FRAZADAS` int(11) DEFAULT NULL,
  `COLCHON` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entrega_primaria`),
  KEY `id_emergencia` (`id_emergencia`),
  CONSTRAINT `AyudaEntregaPrimaria_ibfk_1` FOREIGN KEY (`id_emergencia`) REFERENCES `emergencias` (`id_emergencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AyudaEntregaPrimaria`
--

LOCK TABLES `AyudaEntregaPrimaria` WRITE;
/*!40000 ALTER TABLE `AyudaEntregaPrimaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `AyudaEntregaPrimaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReparacionDanoEstructural`
--

DROP TABLE IF EXISTS `ReparacionDanoEstructural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReparacionDanoEstructural` (
  `id_reparacion` int(11) NOT NULL,
  `id_emergencia` int(11) DEFAULT NULL,
  `INFORME_DECOM` varchar(50) DEFAULT NULL,
  `DECRETO` varchar(50) DEFAULT NULL,
  `CERTIFICADO_DOM` varchar(100) DEFAULT NULL,
  `MATERIALES_CONSTRUCCION` varchar(255) DEFAULT NULL,
  `MEDIAGUA` varchar(100) DEFAULT NULL,
  `OTRO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_reparacion`),
  KEY `id_emergencia` (`id_emergencia`),
  CONSTRAINT `ReparacionDanoEstructural_ibfk_1` FOREIGN KEY (`id_emergencia`) REFERENCES `emergencias` (`id_emergencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReparacionDanoEstructural`
--

LOCK TABLES `ReparacionDanoEstructural` WRITE;
/*!40000 ALTER TABLE `ReparacionDanoEstructural` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReparacionDanoEstructural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afectado`
--

DROP TABLE IF EXISTS `afectado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afectado` (
  `id_afectado` int(11) NOT NULL,
  `nombre_completo` varchar(255) DEFAULT NULL,
  `rut` varchar(20) DEFAULT NULL,
  `id_emergencia` int(11) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `etapavida` varchar(20) DEFAULT NULL,
  `tipodano` varchar(20) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_afectado`),
  KEY `id_emergencia` (`id_emergencia`),
  CONSTRAINT `afectado_ibfk_1` FOREIGN KEY (`id_emergencia`) REFERENCES `emergencias` (`id_emergencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afectado`
--

LOCK TABLES `afectado` WRITE;
/*!40000 ALTER TABLE `afectado` DISABLE KEYS */;
/*!40000 ALTER TABLE `afectado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergencias`
--

DROP TABLE IF EXISTS `emergencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergencias` (
  `id_emergencia` int(11) NOT NULL,
  `id_ficha` int(11) DEFAULT NULL,
  `sector` varchar(255) NOT NULL,
  `coordenadaLatitud` varchar(100) DEFAULT NULL,
  `coordenadaLongitud` varchar(100) DEFAULT NULL,
  `total_afectados` int(11) DEFAULT NULL,
  `total_femenino` int(11) DEFAULT NULL,
  `total_masculino` int(11) DEFAULT NULL,
  `cantidad_ninos` int(11) DEFAULT NULL,
  `cantidad_adulto` int(11) DEFAULT NULL,
  `cantidad_adultomayor` int(11) DEFAULT NULL,
  `damnificados` int(11) DEFAULT NULL,
  `fallecidos` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `danos_siniestro` text DEFAULT NULL,
  `propiedad` varchar(50) DEFAULT NULL,
  `seguro` tinyint(1) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `evaluacion_emergencias` text DEFAULT NULL,
  PRIMARY KEY (`id_emergencia`),
  KEY `id_ficha` (`id_ficha`),
  CONSTRAINT `emergencias_ibfk_1` FOREIGN KEY (`id_ficha`) REFERENCES `ficha_interna` (`id_ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergencias`
--

LOCK TABLES `emergencias` WRITE;
/*!40000 ALTER TABLE `emergencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_interna`
--

DROP TABLE IF EXISTS `ficha_interna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_interna` (
  `id_ficha` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_interna`
--

LOCK TABLES `ficha_interna` WRITE;
/*!40000 ALTER TABLE `ficha_interna` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_interna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-09 23:40:24
