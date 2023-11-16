CREATE DATABASE  IF NOT EXISTS `db_sistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_sistema`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_sistema
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `idarticulo` int NOT NULL AUTO_INCREMENT,
  `idcategoria` int NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idarticulo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_articulo_categoria_idx` (`idcategoria`),
  CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,1,'12345','Leche',6,'dasfkjl','1686661105.png',1);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Lactios','todo tipo de lactios',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ingreso`
--

DROP TABLE IF EXISTS `detalle_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int NOT NULL AUTO_INCREMENT,
  `idingreso` int NOT NULL,
  `idarticulo` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  KEY `fk_detalle_ingreso_ingreso_idx` (`idingreso`),
  KEY `fk_detalle_ingreso_articulo_idx` (`idarticulo`),
  CONSTRAINT `fk_detalle_ingreso_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`),
  CONSTRAINT `fk_detalle_ingreso_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingreso`
--

LOCK TABLES `detalle_ingreso` WRITE;
/*!40000 ALTER TABLE `detalle_ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ingreso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
 UPDATE articulo SET stock = stock + NEW.cantidad 
 WHERE articulo.idarticulo = NEW.idarticulo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nuevo_detalle_ingresoAuditoria` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO detalle_ingresoAuditoria (iddetalle_ingreso,idingreso,idarticulo,cantidad,precio_compra,precio_venta,usuarioAud,fechaAud,estadoAud)
    VALUES (NEW.iddetalle_ingreso, NEW.idingreso, NEW.idarticulo,NEW.cantidad,NEW.precio_compra,NEW.precio_venta,usuarioAud,fecha_actual,'NUEVO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizado_detalle_ingresoAuditoria` AFTER UPDATE ON `detalle_ingreso` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO detalle_ingresoAuditoria (iddetalle_ingreso,idingreso,idarticulo,cantidad,precio_compra,precio_venta,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.iddetalle_ingreso,OLD.idingreso, OLD.idarticulo,OLD.cantidad,OLD.precio_compra,OLD.precio_venta,usuarioAud,fecha_actual, 'ACTUALIZADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_detalle_ingresoAuditoria` BEFORE DELETE ON `detalle_ingreso` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO detalle_ingresoAuditoria (iddetalle_ingreso,idingreso,idarticulo,cantidad,precio_compra,precio_venta,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.iddetalle_ingreso,OLD.idingreso, OLD.idarticulo,OLD.cantidad,OLD.precio_compra,OLD.precio_venta,usuarioAud, fecha_actual,'ELIMINADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_ingresoauditoria`
--

DROP TABLE IF EXISTS `detalle_ingresoauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ingresoauditoria` (
  `iddetalle_ingreso` int NOT NULL,
  `idingreso` int NOT NULL,
  `idarticulo` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `usuarioAud` varchar(20) NOT NULL,
  `fechaAud` datetime NOT NULL,
  `estadoAud` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingresoauditoria`
--

LOCK TABLES `detalle_ingresoauditoria` WRITE;
/*!40000 ALTER TABLE `detalle_ingresoauditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ingresoauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int NOT NULL AUTO_INCREMENT,
  `idventa` int NOT NULL,
  `idarticulo` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_venta_idx` (`idventa`),
  KEY `fk_detalle_venta_articulo_idx` (`idarticulo`),
  CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`),
  CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,10,20.00,0.00),(2,2,1,3,45.00,0.00),(3,2,1,1,45.00,0.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
 UPDATE articulo SET stock = stock - NEW.cantidad 
 WHERE articulo.idarticulo = NEW.idarticulo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nuevo_detalle_ventaAuditoria` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO detalle_ventaauditoria (iddetalle_venta, idventa, idarticulo, cantidad, precio_venta, descuento,usuarioAud,fechaAud,estadoAud)
    VALUES (NEW.iddetalle_venta, NEW.idventa, NEW.idarticulo,NEW.cantidad,NEW.precio_venta,NEW.descuento,usuarioAud, fecha_actual,'NUEVO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizado_detalle_ventaAuditoria` AFTER UPDATE ON `detalle_venta` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO detalle_ventaauditoria (iddetalle_venta, idventa, idarticulo, cantidad, precio_venta, descuento,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.iddetalle_venta, OLD.idventa, OLD.idarticulo,OLD.cantidad,OLD.precio_venta,OLD.descuento,usuarioAud, fecha_actual, 'ACTUALIZADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_detalle_ventaAuditoria` BEFORE DELETE ON `detalle_venta` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO detalle_ventaauditoria (iddetalle_venta, idventa, idarticulo, cantidad, precio_venta, descuento,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.iddetalle_venta, OLD.idventa, OLD.idarticulo,OLD.cantidad,OLD.precio_venta,OLD.descuento,usuarioAud, fecha_actual, 'ELIMINADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_ventaauditoria`
--

DROP TABLE IF EXISTS `detalle_ventaauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventaauditoria` (
  `iddetalle_venta` int NOT NULL,
  `idventa` int NOT NULL,
  `idarticulo` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `usuarioAud` varchar(20) NOT NULL,
  `fechaAud` datetime NOT NULL,
  `estadoAud` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventaauditoria`
--

LOCK TABLES `detalle_ventaauditoria` WRITE;
/*!40000 ALTER TABLE `detalle_ventaauditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ventaauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso` (
  `idingreso` int NOT NULL AUTO_INCREMENT,
  `idproveedor` int NOT NULL,
  `idusuario` int NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idingreso`),
  KEY `fk_ingreso_persona_idx` (`idproveedor`),
  KEY `fk_ingreso_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nuevo_ingresoAuditoria` AFTER INSERT ON `ingreso` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO ingresoAuditoria (idingreso, idproveedor, idusuario, tipo_comprobante, serie_comprobante, num_comprobante,fecha_hora,total_compra,estado,usuarioAud,fechaAud,estadoAud)
    VALUES (NEW.idingreso, NEW.idproveedor, NEW.idusuario,NEW.tipo_comprobante,NEW.serie_comprobante,NEW.num_comprobante,NEW.fecha_hora,NEW.total_compra,NEW.estado, usuarioAud, fecha_actual,'NUEVO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizado_ingresoAuditoria` AFTER UPDATE ON `ingreso` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO ingresoAuditoria (idingreso, idproveedor, idusuario, tipo_comprobante, serie_comprobante, num_comprobante,fecha_hora,total_compra,estado,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idingreso, OLD.idproveedor, OLD.idusuario,OLD.tipo_comprobante,OLD.serie_comprobante,OLD.num_comprobante,OLD.fecha_hora,OLD.total_compra,OLD.estado,usuarioAud,fecha_actual,'ACTUALIZADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_ingresoAuditoria` BEFORE DELETE ON `ingreso` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO personaAuditoria (idingreso, idproveedor, idusuario, tipo_comprobante, serie_comprobante, num_comprobante,fecha_hora,total_compra,estado,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idingreso, OLD.idproveedor, OLD.idusuario,OLD.tipo_comprobante,OLD.serie_comprobante,OLD.num_comprobante,OLD.fecha_hora,OLD.total_compra,OLD.estado,usuarioAud, fecha_actual,'ELIMINADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ingresoauditoria`
--

DROP TABLE IF EXISTS `ingresoauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresoauditoria` (
  `idingreso` int NOT NULL,
  `idproveedor` int NOT NULL,
  `idusuario` int NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `usuarioAud` varchar(20) NOT NULL,
  `fechaAud` datetime NOT NULL,
  `estadoAud` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresoauditoria`
--

LOCK TABLES `ingresoauditoria` WRITE;
/*!40000 ALTER TABLE `ingresoauditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresoauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idpersona` int NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ci_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Cliente','Juan','4343543','fasdf','75555555','ndbhalerao91@gmail.com'),(7,'Cliente','Pedro','123456','La Paz','7654321','kare@mail.com'),(9,'Cliente','maria','123456','La Paz','7654321','kare@mail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nuevo_personaAuditoria` AFTER INSERT ON `persona` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO personaAuditoria (idpersona, tipo_persona, nombre, ci_documento, direccion, telefono,email,usuarioAud,fechaAud,estadoAud)
    VALUES (NEW.idpersona, NEW.tipo_persona, NEW.nombre,NEW.ci_documento,NEW.direccion,NEW.telefono,NEW.email,  usuarioAud, fecha_actual, 'NUEVO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizado_personaAuditoria` AFTER UPDATE ON `persona` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO personaAuditoria (idpersona, tipo_persona, nombre, ci_documento, direccion, telefono,email,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idpersona, OLD.tipo_persona, OLD.nombre,OLD.ci_documento,OLD.direccion,OLD.telefono,OLD.email,  usuarioAud, fecha_actual, 'ACTUALIZADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_personaAuditoria` BEFORE DELETE ON `persona` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO personaAuditoria (idpersona, tipo_persona, nombre, ci_documento, direccion, telefono,email,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idpersona, OLD.tipo_persona, OLD.nombre,OLD.ci_documento,OLD.direccion,OLD.telefono,OLD.email, usuarioAud, fecha_actual, 'ELIMINADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personaauditoria`
--

DROP TABLE IF EXISTS `personaauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personaauditoria` (
  `idpersona` int NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ci_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `usuarioAud` varchar(20) NOT NULL,
  `fechaAud` datetime NOT NULL,
  `estadoAud` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaauditoria`
--

LOCK TABLES `personaauditoria` WRITE;
/*!40000 ALTER TABLE `personaauditoria` DISABLE KEYS */;
INSERT INTO `personaauditoria` VALUES (5,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','0000-00-00 00:00:00','ELIMINADO'),(6,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 19:02:04','ELIMINADO'),(0,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 00:00:00','NUEVO'),(0,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 19:07:12','ELIMINADO'),(0,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 19:10:20','NUEVO'),(0,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 19:12:03','NUEVO'),(11,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 19:12:42','ELIMINADO'),(10,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 19:15:07','ELIMINADO'),(0,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-09 15:18:57','NUEVO'),(8,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-15 00:00:00','ACTUALIZADO'),(8,'Cliente','Pedrito','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-15 00:00:00','ACTUALIZADO'),(8,'Cliente','Pedro','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-15 00:00:00','ACTUALIZADO'),(12,'Cliente','maria','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-15 19:27:04','ELIMINADO'),(8,'Cliente','Carlos','123456','La Paz','7654321','kare@mail.com','root@localhost','2023-11-15 19:29:37','ELIMINADO'),(16,'Cliente','Marihuana','123456','La Paz','7654321','huana@mail.com','root@localhost','2023-11-15 19:34:52','NUEVO'),(16,'Cliente','Marihuana','123456','La Paz','7654321','huana@mail.com','root@localhost','2023-11-15 19:35:47','ACTUALIZADO'),(16,'Cliente','paTRICIO','123456','La Paz','7654321','huana@mail.com','root@localhost','2023-11-15 19:37:24','ELIMINADO');
/*!40000 ALTER TABLE `personaauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Privilegios completos'),(2,'Empleado','Tiene privilegios para realizar transacciones sobre el sistema y generar reportes');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ci_documento` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `idrol` int DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_usuario_rol` (`idrol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Marco Tarqui','68091780','gmiranda@mail.com','Ingeniero Sistemas','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nuevo_usuarioAuditoria` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO usuarioAuditoria (idusuario,nombre,ci_documento,email,cargo,login,clave,condicion,idrol,usuarioAud,fechaAud,estadoAud)
    VALUES (NEW.idusuario, NEW.nombre, NEW.ci_documento,NEW.email,NEW.cargo,NEW.login,NEW.clave,NEW.condicion,NEW.idrol,usuarioAud,fecha_actual,'NUEVO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizado_usuarioAuditoria` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO usuarioAuditoria (idusuario,nombre,ci_documento,email,cargo,login,clave,condicion,idrol,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idusuario, OLD.nombre, OLD.ci_documento,OLD.email,OLD.cargo,OLD.login,OLD.clave,OLD.condicion,OLD.idrol,usuarioAud,fecha_actual,'ACTUALIZADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_usuarioAuditoria` BEFORE DELETE ON `usuario` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO usuarioAuditoria (idusuario,nombre,ci_documento,email,cargo,login,clave,condicion,idrol,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idusuario, OLD.nombre, OLD.ci_documento,OLD.email,OLD.cargo,OLD.login,OLD.clave,OLD.condicion,OLD.idrol,usuarioAud,fecha_actual,'ELIMINADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarioauditoria`
--

DROP TABLE IF EXISTS `usuarioauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarioauditoria` (
  `idusuario` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ci_documento` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `clave` varchar(64) DEFAULT NULL,
  `condicion` varchar(20) DEFAULT NULL,
  `idrol` varchar(50) DEFAULT NULL,
  `usuarioAud` varchar(20) NOT NULL,
  `fechaAud` datetime NOT NULL,
  `estadoAud` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioauditoria`
--

LOCK TABLES `usuarioauditoria` WRITE;
/*!40000 ALTER TABLE `usuarioauditoria` DISABLE KEYS */;
INSERT INTO `usuarioauditoria` VALUES (1,'German Miranda','68091780','gmiranda@mail.com','Ingeniero Sistemas','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','1','1','root@localhost','2023-11-15 19:58:42','ACTUALIZADO'),(2,'Stefany Miranda','9982345','smiranda@mail.com','contadora','admin2','1c142b2d01aa34e9a36bde480645a57fd69e14155dacfab5a3f9257b77fdc8d8','1','2','root@localhost','2023-11-15 19:59:46','ELIMINADO');
/*!40000 ALTER TABLE `usuarioauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `idcliente` int NOT NULL,
  `idusuario` int NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(10) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,1,'Boleta','454','0001','2023-06-13 00:00:00',200.00,'Aceptado'),(2,1,1,'Ticket','454','0001','2023-11-09 00:00:00',180.00,'Anulado');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nuevo_ventaAuditoria` AFTER INSERT ON `venta` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO ventaauditoria (idventa, idcliente, idusuario,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,total_venta,estado,usuarioAud,fechaAud,estadoAud)
    VALUES (NEW.idventa, NEW.idcliente, NEW.idusuario,NEW.tipo_comprobante,NEW.serie_comprobante,NEW.num_comprobante,NEW.fecha_hora,NEW.total_venta,NEW.estado, usuarioAud,fecha_actual,'NUEVO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizado_ventaAuditoria` AFTER UPDATE ON `venta` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO ventaauditoria (idventa, idcliente, idusuario,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,total_venta,estado,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idventa, OLD.idcliente, OLD.idusuario,OLD.tipo_comprobante,OLD.serie_comprobante,OLD.num_comprobante,OLD.fecha_hora,OLD.total_venta,OLD.estado,usuarioAud,fecha_actual,'ACTUALIZADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_ventaAuditoria` BEFORE DELETE ON `venta` FOR EACH ROW BEGIN
    DECLARE usuarioAud VARCHAR(50);
    DECLARE fecha_actual DATETIME;
    DECLARE estadoAud VARCHAR(50);
    
    SELECT USER() INTO usuarioAud;
    SET fecha_actual = NOW();

    INSERT INTO ventaauditoria (idventa, idcliente, idusuario,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,total_venta,estado,usuarioAud,fechaAud,estadoAud)
    VALUES (OLD.idventa, OLD.idcliente, OLD.idusuario,OLD.tipo_comprobante,OLD.serie_comprobante,OLD.num_comprobante,OLD.fecha_hora,OLD.total_venta,OLD.estado,usuarioAud,fecha_actual,'ELIMINADO');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ventaauditoria`
--

DROP TABLE IF EXISTS `ventaauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventaauditoria` (
  `idventa` int NOT NULL,
  `idcliente` int NOT NULL,
  `idusuario` int NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `usuarioAud` varchar(20) NOT NULL,
  `fechaAud` varchar(20) NOT NULL,
  `estadoAud` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventaauditoria`
--

LOCK TABLES `ventaauditoria` WRITE;
/*!40000 ALTER TABLE `ventaauditoria` DISABLE KEYS */;
INSERT INTO `ventaauditoria` VALUES (2,1,1,'Ticket','454','0001','2023-11-09 00:00:00',180.00,'Aceptado','root@localhost','2023-11-15 20:26:42','ACTUALIZADO');
/*!40000 ALTER TABLE `ventaauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_sistema'
--

--
-- Dumping routines for database 'db_sistema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15 21:37:37
