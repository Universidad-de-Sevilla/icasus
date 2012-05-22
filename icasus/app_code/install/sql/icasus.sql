-- MySQL dump 10.11
--
-- Host: localhost    Database: icasus
-- ------------------------------------------------------
-- Server version	5.0.51a-3ubuntu5.4-log

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
-- Table structure for table `dimension`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dimension` (
  `id_dimension` int(11) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_dimension`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` VALUES (1,'participacion'),(2,'comunicacion'),(3,'empatia'),(4,'elementos tangibles'),(5,'seguridad'),(6,'capacidad de respuesta'),(7,'fiabilidad');
/*!40000 ALTER TABLE `dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidad`
--

DROP TABLE IF EXISTS `entidad`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `entidad` (
  `id_entidad` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(75) NOT NULL default '',
  `web` varchar(250) default NULL,
  PRIMARY KEY  (`id_entidad`),
  KEY `Index_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `entidad`
--

LOCK TABLES `entidad` WRITE;
/*!40000 ALTER TABLE `entidad` DISABLE KEYS */;
INSERT INTO `entidad` VALUES (1,'AdministraciÃ³n Icasus','http://icasus.forja.rediris.es/');
/*!40000 ALTER TABLE `entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicador`
--

DROP TABLE IF EXISTS `indicador`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `indicador` (
  `id_indicador` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `descripcion` text NOT NULL,
  `formulacion` text NOT NULL,
  `umbral` varchar(50) NOT NULL default '0',
  `id_entidad` int(10) unsigned NOT NULL default '0',
  `id_responsable` int(10) unsigned default '0',
  `periodicidad` varchar(50) NOT NULL default '',
  `fuente` varchar(100) NOT NULL default '',
  `objetivo` varchar(50) default NULL,
  `id_dimension` int(11) default NULL,
  `id_proceso` int(11) default NULL,
  `codigo` varchar(10) default NULL,
  PRIMARY KEY  (`id_indicador`),
  KEY `Index_nombre` (`nombre`),
  KEY `Index_entidad` (`id_entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;


--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permiso` (
  `id_usuario` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  PRIMARY KEY  USING BTREE (`id_usuario`,`page`,`id_objeto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proceso` (
  `id_proceso` int(11) NOT NULL auto_increment,
  `nombre` varchar(250) NOT NULL,
  `id_propietario` int(11) default NULL,
  `id_entidad` int(11) NOT NULL,
  `codigo` varchar(50) default NULL,
  PRIMARY KEY  (`id_proceso`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;


--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL auto_increment,
  `nombre` varchar(250) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY  (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'responsable',2),(2,'miembro',1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuario` (
  `id_usuario` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(15) NOT NULL default '',
  `clave` varchar(45) NOT NULL default '',
  `nombre` varchar(45) NOT NULL default '',
  `apellidos` varchar(75) NOT NULL default '',
  `nif` varchar(10) NOT NULL default '',
  `correo` varchar(45) NOT NULL default '',
  `telefono` varchar(15) default NULL,
  PRIMARY KEY  (`id_usuario`),
  KEY `Index_login` (`login`),
  KEY `Index_apellidos` (`apellidos`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin','Administrador','Icasus','11111111H','admin@icasus.es','999999999');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_entidad`
--

DROP TABLE IF EXISTS `usuario_entidad`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuario_entidad` (
  `id_usuario` int(10) unsigned NOT NULL default '0',
  `id_entidad` int(10) unsigned NOT NULL default '0',
  `id_rol` int(11) default NULL,
  PRIMARY KEY  (`id_usuario`,`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuario_entidad`
--

LOCK TABLES `usuario_entidad` WRITE;
/*!40000 ALTER TABLE `usuario_entidad` DISABLE KEYS */;
INSERT INTO `usuario_entidad` VALUES (1,1,1);
/*!40000 ALTER TABLE `usuario_entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor`
--

DROP TABLE IF EXISTS `valor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `valor` (
  `id_valor` int(10) unsigned NOT NULL auto_increment,
  `id_indicador` int(10) unsigned NOT NULL default '0',
  `fecha_recogida` bigint(20) default NULL,
  `fecha_entrada` bigint(20) default NULL,
  `valor` char(50) NOT NULL default '0',
  `periodo` char(45) NOT NULL default '',
  `id_usuario` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id_valor`),
  KEY `Index_indicador` (`id_indicador`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
SET character_set_client = @saved_cs_client;

/*!40000 ALTER TABLE `valor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-03-11 15:28:54
