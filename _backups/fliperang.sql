-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fliperang
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Current Database: `fliperang`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fliperang` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fliperang`;

--
-- Table structure for table `aerolinea`
--

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aerolinea` (
  `id_aerolinea` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_aerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolinea`
--

LOCK TABLES `aerolinea` WRITE;
/*!40000 ALTER TABLE `aerolinea` DISABLE KEYS */;
/*!40000 ALTER TABLE `aerolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Electrónica',1),(2,'Perfumes',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('cfkvp2k3s34ohrrt1m6fop3nurodckda','::1',1606413405,'__ci_last_regenerate|i:1606413405;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('13kpjr6bms19dngbr9avb894hdakfhe7','::1',1606413706,'__ci_last_regenerate|i:1606413706;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('j69uc4r3t2ncmjrp9djb2jkc0llu4mp2','::1',1606414198,'__ci_last_regenerate|i:1606414198;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('i22is1cuo7nuomnhvjlvrhjmp8alrb5o','::1',1606414562,'__ci_last_regenerate|i:1606414562;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('2svc0kj7mr3ki4ptpuj4q7ip15a6ukts','::1',1606414880,'__ci_last_regenerate|i:1606414880;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('3dgfv7lh735opnujev200ggq152lgvvh','::1',1606415330,'__ci_last_regenerate|i:1606415330;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('5ov1houh3jfb2blu9p325i2fu9qg7vts','::1',1606415913,'__ci_last_regenerate|i:1606415913;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('o39ech7aud8mka0jnfh6qb3f0qjhb9fp','::1',1606421547,'__ci_last_regenerate|i:1606421547;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('7kgkspvh0bg64gegg5g4a0ll1sofjgs9','::1',1606421955,'__ci_last_regenerate|i:1606421955;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('1t1cme88ch9npi57f7rocc7nstqmulba','::1',1606422263,'__ci_last_regenerate|i:1606422263;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('gedc2kto65s23cc9b365mr2ij27ogq5b','::1',1606422849,'__ci_last_regenerate|i:1606422263;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:10:\"Equicomx12\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|N;celular|N;'),('98d1c05jg33s14mt73bmdklengu4clc5','::1',1606441140,'__ci_last_regenerate|i:1606441140;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('3ki8p1dfboslo7mafo63jj4o435ru44k','::1',1606441474,'__ci_last_regenerate|i:1606441474;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('1bedp9b61tanarkgfseqp4snij84epfv','::1',1606441824,'__ci_last_regenerate|i:1606441824;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('ebr9ben7r25fa9job9ekdkjgrp2l3akm','::1',1606442212,'__ci_last_regenerate|i:1606442212;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('da2g952hv95mtn5giq5l238nph1ujuen','::1',1606442654,'__ci_last_regenerate|i:1606442654;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('h975i208c0e0661vabpd133dc12eqa1l','::1',1606442965,'__ci_last_regenerate|i:1606442965;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('he2o7j5d30b183o3lbhi2t9k0080klgo','::1',1606443322,'__ci_last_regenerate|i:1606443322;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('2c4rc7gtgjs7876p537qi00l3o2qrocm','::1',1606443844,'__ci_last_regenerate|i:1606443844;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('3esmbcj93p67fkp6tj3vut9ujq6hhqvp','::1',1606445228,'__ci_last_regenerate|i:1606445228;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('3tfo8cnrlqqh9a163euta9f1v64gkn3k','::1',1606445568,'__ci_last_regenerate|i:1606445568;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('4pklqcbrv6s9jl6amt1t41summo678iq','::1',1606446791,'__ci_last_regenerate|i:1606446791;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('bhpl8lhb379ukmfivjisla13mk16ko96','::1',1606447147,'__ci_last_regenerate|i:1606447147;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('9vma0i4i0b4jggs111m352mamjubpg2b','::1',1606447488,'__ci_last_regenerate|i:1606447488;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('43hofnqjd4o8mp1plfga105v3lgeqdem','::1',1606447805,'__ci_last_regenerate|i:1606447805;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('oidq3svreu5ou80ck6uinuc5f9pqqjqb','::1',1606448283,'__ci_last_regenerate|i:1606448283;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('1raeurj94bvjeq1v9b9nnlim1i7e4hdt','::1',1606448655,'__ci_last_regenerate|i:1606448655;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('d2qi6h6e2n5ejqjdb3805brcplqb2job','::1',1606448960,'__ci_last_regenerate|i:1606448960;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('3ra4grdlnn3a0sjj1j7kaiqjqpqcpgis','::1',1606449591,'__ci_last_regenerate|i:1606449591;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('mu6rkqckn6fl97rosk45vnsgj3n2pom8','::1',1606449975,'__ci_last_regenerate|i:1606449975;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('0t4e4fgjesphrkfbbe1dfu9gt41g95as','::1',1606450350,'__ci_last_regenerate|i:1606450350;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('b34ni9ab7dqtqsg62honna2nijc556il','::1',1606450657,'__ci_last_regenerate|i:1606450657;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('nv4kcp1vgi3clojaa1np9vvmsr1jd68g','::1',1606451009,'__ci_last_regenerate|i:1606451009;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('oojsnvoa1j26u5qjq03fm96dpavfs0ju','::1',1606451541,'__ci_last_regenerate|i:1606451541;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('4vefleje0ai8iep39av89rmr3v81018g','::1',1606451891,'__ci_last_regenerate|i:1606451891;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('inbre4kkmc97ba0c4c4jm8nlp4ge78qe','::1',1606452213,'__ci_last_regenerate|i:1606452213;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('451ocm1c956dh7kf63uu4ing0r0vd1p6','::1',1606452525,'__ci_last_regenerate|i:1606452525;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('uitj6jnijgeti9khdqdpl4l6jov9ul89','::1',1606452835,'__ci_last_regenerate|i:1606452835;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";'),('0ametk11ulp4du4qp7mps2pp0fvfmjd2','::1',1606452916,'__ci_last_regenerate|i:1606452835;id_usuario|s:1:\"1\";id_persona|s:1:\"1\";nombre_usuario|s:3:\"wai\";rol|s:1:\"3\";id_membresia|s:1:\"1\";estado|s:1:\"1\";fecha_registro|s:19:\"2020-03-23 01:03:51\";fecha_actualizacion|s:19:\"2020-10-11 01:32:55\";usuario_registro|s:1:\"1\";usuario_actualizacion|s:2:\"53\";nombres|N;apellido_paterno|N;apellido_materno|N;nombre_completo|s:14:\"WAI TECHNOLOGY\";foto|s:36:\"a51f56d89312879ba5a7c9890c98a1b7.png\";archivo_1|s:36:\"679521abc509f8b34a377ae1b775ae1a.cer\";archivo_2|s:36:\"2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key\";clave_publica|s:19:\"TestFirmasDigitales\";tipo_documento|s:1:\"6\";numero_documento|s:11:\"20999999999\";tipo_persona|s:1:\"2\";email|s:21:\"walter@wai.technology\";celular|s:9:\"902425910\";direccion|s:14:\"Calle Lima 805\";distrito|s:8:\"La Union\";provincia|s:5:\"Piura\";departamento|s:5:\"Piura\";');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` tinyint(4) NOT NULL DEFAULT 1,
  `nombre_completo` varchar(255) NOT NULL,
  `numero_documento` varchar(16) NOT NULL,
  `foto` varchar(64) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `direccion_referencia` text DEFAULT NULL,
  `direccion_2` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_2` varchar(255) DEFAULT NULL,
  `celular` varchar(16) DEFAULT NULL,
  `celular_2` varchar(16) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `usuario_registro` int(11) NOT NULL,
  `usuario_actualizacion` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `usuario_registro` (`usuario_registro`),
  KEY `usuario_actualizacion` (`usuario_actualizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,'CRUZ MARIA ZETA CHUNGA','02726999','7973de9dca1478fe6dd6f1f745e4f44c.jpg','ddddd','eeee','sdfsdf','maricruzzeta@gmail.com','dd@msn.com','958453640','555',1,'2020-11-20 02:00:47','2020-11-20 22:10:16',1,1),(2,1,'JOSE HUMBERTO MONTENEGRO FIESTAS','02722566',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-11-20 02:02:42','2020-11-20 02:02:42',1,1),(3,1,'FRANCISCO SAGASTI HOCHHAUSLER','45454545','00775f8c903773b0948ce4c112526300.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-11-20 22:14:47','2020-11-20 22:14:47',1,1),(4,1,'DANILO MONTENEGRO','70392780',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-11-25 03:34:21','2020-11-26 00:53:09',1,1),(5,1,'EDWIN LOPEZ MERINO','39393939',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-11-26 10:05:06','2020-11-26 10:05:06',1,1),(6,1,'GERMAN TUESTAS','45897433',NULL,NULL,NULL,NULL,'goto@mail.com','','999888666',NULL,1,'2020-11-26 12:42:27','2020-11-26 12:42:27',1,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_envio`
--

DROP TABLE IF EXISTS `estado_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_envio` (
  `id_estado_envio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_estado_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_envio`
--

LOCK TABLES `estado_envio` WRITE;
/*!40000 ALTER TABLE `estado_envio` DISABLE KEYS */;
INSERT INTO `estado_envio` VALUES (1,'COMPRA',NULL,1),(2,'EN VIAJE',NULL,1),(3,'RECEPCIONADO',NULL,1),(4,'COMPLETADO',NULL,1);
/*!40000 ALTER TABLE `estado_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institucion` (
  `id_institucion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `nombre_corto` varchar(32) NOT NULL,
  `titulo_sistema` varchar(64) NOT NULL,
  `configuracion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`configuracion`)),
  PRIMARY KEY (`id_institucion`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (1,'Fliperang - Lo quieres, lo tienes','Fliperang - Lo quieres, lo tienes','fliperang, comprar en usa','Fliperang','Lumine - Teatro desde tu casa','{\"externo\":{\"externo_social\":\"\",\"archivos_permitidos\":[\"jpg\",\"gif\",\"png\",\"tif\",\"bpm\",\"jpeg\"],\"movie_id\":[null],\"tipo_documento_validar_cut\":[11],\"url_centro_ayuda\":\"https:\\/\\/www.groovehq.com\\/?help\",\"texto_centro_ayuda\":\"Centro de Ayuda\",\"texto_terminos_condiciones\":\"T\\u00e9rminos de uso\",\"url_terminos_condiciones\":\"https:\\/\\/www.groovehq.com\\/?terms\",\"telefono\":\"\",\"email\":\"\",\"whatsapp\":\"\",\"video_principal_url\":\"\",\"video_principal_image\":\"\"},\"payment\":{\"culqi_secret_key\":\"sk_test_d697be948552465d\",\"culqi_public_key\":\"pk_test_3638fbbb48a96e7d\"}}');
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `id_local` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` tinyint(4) NOT NULL DEFAULT 1,
  `nombre` longtext COLLATE utf8_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 active, 0 inactive',
  PRIMARY KEY (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,2,'PROCESO COMPRA','',NULL,1),(2,2,'MIAMI','MIAMI ST. 20491111',NULL,1),(3,1,'AGENCIA LIMA',NULL,NULL,1),(4,2,'PIURA',NULL,NULL,1);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeracion`
--

DROP TABLE IF EXISTS `numeracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeracion` (
  `id_numeracion` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(5) NOT NULL,
  `anho` year(4) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id_numeracion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeracion`
--

LOCK TABLES `numeracion` WRITE;
/*!40000 ALTER TABLE `numeracion` DISABLE KEYS */;
INSERT INTO `numeracion` VALUES (5,'TRA',2020,938);
/*!40000 ALTER TABLE `numeracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros_valores`
--

DROP TABLE IF EXISTS `parametros_valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros_valores` (
  `id_parametro_valor` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(6) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `codigo_hex` varchar(6) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `valor_1` decimal(10,2) DEFAULT NULL,
  `valor_2` int(11) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_parametro_valor`)
) ENGINE=InnoDB AUTO_INCREMENT=2427 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros_valores`
--

LOCK TABLES `parametros_valores` WRITE;
/*!40000 ALTER TABLE `parametros_valores` DISABLE KEYS */;
INSERT INTO `parametros_valores` VALUES (1,'DOCIDE','0','NPR','No presenta',0.00,16,2),(2,'DOCIDE','1','DNI','DNI',1.00,8,1),(3,'DOCIDE','6','RUC','RUC',6.00,11,1),(4,'DOCIDE','4','CE','Carnet Extranjería',4.00,16,1),(5,'DOCIDE','7','PAS','Pasaporte',7.00,16,1),(6,'ESTCIV','SO','','SOLTERO(A)',NULL,NULL,1),(7,'ESTCIV','CA','','CASADO(A)',NULL,NULL,1),(8,'ESTCIV','CV','','CONVIVIENTE',NULL,NULL,1),(9,'ESTCIV','DI','','DIVORCIADO(A)',NULL,NULL,1),(10,'ESTCIV','VI','','VIUDO(A)',NULL,NULL,1),(11,'ESTREG','AC','','ACTIVO',NULL,NULL,1),(12,'ESTREG','IN','','INACTIVO',NULL,NULL,1),(13,'ESTREG','4','','ELIMINADO',NULL,NULL,1),(20,'TIPMON','USD','','DÓLAR',2.00,NULL,1),(21,'TIPMON','EUR','','EURO',9.00,NULL,2),(22,'IGV','1','','IMPUESTO GENERAL A LAS VENTAS',0.18,NULL,1),(23,'IGV','2','','IMPUESTO BOLSAS DE PLÁSTICO',0.10,NULL,1),(27,'SEXO','M','','MASCULINO',NULL,NULL,1),(28,'SEXO','F','','FEMENINO',NULL,NULL,1),(29,'TIPMON','PEN','','SOL',1.00,NULL,1),(2359,'DOCIDE','11','PTP','PTP',NULL,16,1),(2367,'FRECUE','1','','DIARIO',NULL,NULL,1),(2368,'FRECUE','2','','INTERDIARIO',NULL,NULL,1),(2369,'ESTCRE','1','','POR APROBAR',NULL,NULL,1),(2370,'ESTCRE','2','','APROBADO',NULL,NULL,1),(2371,'ESTCRE','3','','ENTREGADO',NULL,NULL,1),(2372,'ESTCRE','4','','PARAM RESERVA',NULL,NULL,1),(2373,'ESTCRE','5','','ANULADO',NULL,NULL,1),(2374,'ESTPAG','1','','DEBE',NULL,NULL,1),(2375,'ESTPAG','2','','PAGADO',NULL,NULL,1),(2377,'FRECUE','3','','SEMANAL',NULL,NULL,1),(2378,'FRECUE','4','','QUINCENAL',NULL,NULL,1),(2379,'FRECUE','5','','MENSUAL',NULL,NULL,1),(2380,'PROCAT','1','','INFORMACIÓN DEL CLIENTE',NULL,NULL,1),(2381,'PROCAT','2','','EXPERIENCIA CREDITICIA',NULL,NULL,1),(2382,'PROCAT','3','','EVALUACIÓN, ANÁLISIS FINANCIERO',NULL,NULL,1),(2383,'PROCAT','4','','GARANTÍAS DE CRÉDITO',NULL,NULL,1),(2384,'PROCAT','5','','CONCLUSIONES',NULL,NULL,1),(2385,'PROCAT','6','','PRINCIPALES CLIENTES',NULL,NULL,1),(2386,'PROCAT','7','','PRINCIPALES PROVEEDORES',NULL,NULL,1),(2387,'PROCAT','8','','OTROS',NULL,NULL,1),(2388,'USOBIE','1','','A. Fijo',NULL,NULL,1),(2389,'USOBIE','2','','Garantía',NULL,NULL,1),(2390,'USOBIE','3','','A.F y Gar.',NULL,NULL,1),(2391,'GASNEG','1','','Servicios Básicos Negocio (Agua,Luz,Telef.)',NULL,NULL,1),(2392,'GASNEG','2','','Alquiler de Local(es).',NULL,NULL,1),(2393,'GASNEG','3','','Sueldos:(administ, contador, ventas, otros)',NULL,NULL,1),(2394,'GASNEG','4','','Gastos de publicidad, promociones.',NULL,NULL,1),(2395,'GASNEG','5','','Transportes (fletes, movilidad).',NULL,NULL,1),(2396,'GASNEG','6','','Impuestos (Sunat, Municipalidad,SISA, etc)',NULL,NULL,1),(2397,'GASNEG','7','','Imprevistos y Otros',NULL,NULL,1),(2398,'GASFAM','1','','Alimentación',NULL,NULL,1),(2399,'GASFAM','2','','Alquiler Casa + Tributos Municipales',NULL,NULL,1),(2400,'GASFAM','3','','Luz, agua, teléfono, etc.',NULL,NULL,1),(2401,'GASFAM','4','','Educación',NULL,NULL,1),(2402,'GASFAM','5','','Transporte (pasajes)',NULL,NULL,1),(2403,'GASFAM','6','','Salud y medicinas',NULL,NULL,1),(2404,'GASFAM','7','','Otros',NULL,NULL,1),(2405,'SECTOR','1','','SERVICIOS',NULL,NULL,1),(2406,'SECTOR','2','','PRODUCCION',NULL,NULL,1),(2407,'SECTOR','3','','COMERCIO',NULL,NULL,1),(2408,'TIPSOL','1','','NUEVO',NULL,NULL,1),(2409,'TIPSOL','2','','RECURRENTE SIN SALDO',NULL,NULL,1),(2410,'TIPSOL','3','','RECURRENTE CON SALDO',NULL,NULL,1),(2411,'TIPSOL','4','','PARALELO',NULL,NULL,1),(2412,'ROLES','1','','Usuario',NULL,NULL,1),(2413,'ROLES','2','','Editor',NULL,NULL,1),(2414,'ROLES','3','','Administrador',NULL,NULL,1),(2415,'TIPPER','1','','PERSONA',NULL,NULL,1),(2416,'TIPPER','2','','EMPRESA',NULL,NULL,1),(2417,'PRIORI','3','ababab','NORMAL',NULL,NULL,1),(2418,'PRIORI','6','ffab00','MEDIA',NULL,NULL,1),(2419,'PRIORI','9','ff2300','ALTA',NULL,NULL,1),(2420,'PAGINA','1','','CONTENIDO',NULL,NULL,1),(2421,'PAGINA','2','','CONTENIDO 2',NULL,NULL,0),(2422,'PAGINA','3','','CONTENIDO 3',NULL,NULL,0),(2423,'TIPLOC','1','','LOCAL',NULL,NULL,1),(2424,'TIPLOC','2','','RECEPCIÓN',NULL,NULL,1),(2425,'TIPVIA','1','','VIAJERO',NULL,NULL,1),(2426,'TIPVIA','2','','CARGA',NULL,NULL,1);
/*!40000 ALTER TABLE `parametros_valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(255) DEFAULT 'NULL',
  `tipo_documento` int(11) NOT NULL DEFAULT 1,
  `numero_documento` varchar(16) DEFAULT NULL,
  `nombres` varchar(128) DEFAULT NULL,
  `apellido_paterno` varchar(128) DEFAULT NULL,
  `apellido_materno` varchar(128) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `tipo_persona` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:Persona, 2:Empresa',
  `sexo` tinyint(1) NOT NULL DEFAULT 1,
  `foto` varchar(64) DEFAULT NULL,
  `archivo_1` varchar(64) DEFAULT NULL,
  `archivo_2` varchar(64) DEFAULT NULL,
  `clave_publica` varchar(64) DEFAULT NULL,
  `ubigeo` char(6) DEFAULT '000000',
  `direccion` varchar(255) DEFAULT NULL,
  `direccion_referencia` varchar(255) DEFAULT NULL,
  `direccion_2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_2` varchar(255) DEFAULT NULL,
  `telefono` varchar(64) DEFAULT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `celular_2` varchar(12) DEFAULT NULL,
  `tipo_negocio` int(11) NOT NULL DEFAULT 1,
  `tipo_negocio_otro` varchar(128) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_registro` int(11) NOT NULL DEFAULT 1,
  `usuario_actualizacion` int(11) NOT NULL DEFAULT 1,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `numero_documento` (`numero_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'WAI TECHNOLOGY',6,'20999999999',NULL,NULL,NULL,NULL,2,1,'a51f56d89312879ba5a7c9890c98a1b7.png','679521abc509f8b34a377ae1b775ae1a.cer','2ed1bb05d1f4cc6c98ec7e1c8a4f520f.key','TestFirmasDigitales','200110','Calle Lima 805',NULL,NULL,'walter@wai.technology',NULL,NULL,'902425910',NULL,1,NULL,'2020-03-23 01:03:51','2020-10-11 01:30:50',1,1,1),(2,'CHAPILLIQUEN ZETA WALTER GERMAN',1,'45897437',NULL,NULL,NULL,NULL,1,1,'8a4665a26713fabd7428cde3693ada95.png',NULL,NULL,NULL,'000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-03-23 01:03:51','2020-05-19 08:11:43',1,9,1),(3,'EDWIN LOPEZ',1,'45568978',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'edwin.lopez@gmail.com',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1),(4,'LEYDI ESPARZA',1,'41526359',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'leydi.esparza@gmail.com',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1),(5,'JHONATAN VIERA',1,'45956587',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'jhonatan.viera@gmail.com',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1),(6,'LUIS CASTRO TANDAZO',1,'41564849',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'luis.castro@gmail.com',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1),(7,'LIZBETH MECHAN',1,'45568974',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'lizbeth.mechan@gmail.com',NULL,NULL,NULL,NULL,1,NULL,'2020-08-24 15:42:27','2020-08-24 15:42:27',2,2,1),(8,'ANDRÉ VALLEJO',1,'45568595',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'andre.vallejo@gmail.com',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1),(51,'NULL',1,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'wz.vang@gmail.com',NULL,NULL,NULL,NULL,1,NULL,'2020-10-11 00:18:04','2020-10-11 00:18:04',1,1,1),(52,'NULL',1,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'wz.vang@gmail.com',NULL,NULL,NULL,NULL,1,NULL,'2020-10-11 00:48:38','2020-10-11 00:48:38',1,1,1),(53,'FLIPERANG',6,'20483906755',NULL,NULL,NULL,NULL,2,1,'83f5bd5753182248980fd4735ed06f3c.png',NULL,NULL,NULL,'000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-10-11 01:32:20','2020-11-20 00:12:55',1,1,1),(55,'FIORELLA',1,'00000002',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'000000',NULL,NULL,NULL,'fcast009@fiu.edu',NULL,NULL,NULL,NULL,1,NULL,'2020-10-11 08:34:25','2020-10-11 08:34:25',1,1,1);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios`
--

DROP TABLE IF EXISTS `precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precios` (
  `id_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_unidad_medida` int(11) DEFAULT NULL,
  `precio` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_precio`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_unidad_medida` (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios`
--

LOCK TABLES `precios` WRITE;
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` VALUES (1,NULL,NULL,1,0.00);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'eBay','https://www.ebay.com','8b5fcf38d2d8f4edf0eed04911ffb639.jpg',1),(2,'Amazon','https://www.amazon.com','9ff997b3cd036dcfe4a961e544d4ad5f.gif',1),(3,'AliExpress','https://www.aliexpress.com','fc2f0643646331566b6b545574178c09.png',1),(4,'BestBuy','https://www.bestbuy.com','ef436bf9ea1e8cbe581c56a33e1b1df4.jpg',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 active, 0 inactive',
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Silver','bc40b98a637671ad5367f4fb104b85fb.png',1),(2,'Gold','a4d2ae074583beb2a00c33fba02db754.png',1);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transporte` (
  `id_transporte` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_transporte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporte`
--

LOCK TABLES `transporte` WRITE;
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
INSERT INTO `transporte` VALUES (1,'EMP. TRANSPORTES ABC',NULL,1);
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubigeo`
--

DROP TABLE IF EXISTS `ubigeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubigeo` (
  `id_ubigeo` char(6) NOT NULL DEFAULT '',
  `distrito` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `estreg` varchar(45) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`id_ubigeo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubigeo`
--

LOCK TABLES `ubigeo` WRITE;
/*!40000 ALTER TABLE `ubigeo` DISABLE KEYS */;
INSERT INTO `ubigeo` VALUES ('000000','NINGUNO','NINGUNO','NINGUNO','AC'),('010101','Chachapoyas','Chachapoyas','Amazonas','AC'),('010102','Asuncion','Chachapoyas','Amazonas','AC'),('010103','Balsas','Chachapoyas','Amazonas','AC'),('010104','Cheto','Chachapoyas','Amazonas','AC'),('010105','Chiliquin','Chachapoyas','Amazonas','AC'),('010106','Chuquibamba','Chachapoyas','Amazonas','AC'),('010107','Granada','Chachapoyas','Amazonas','AC'),('010108','Huancas','Chachapoyas','Amazonas','AC'),('010109','La Jalca','Chachapoyas','Amazonas','AC'),('010110','Leimebamba','Chachapoyas','Amazonas','AC'),('010111','Levanto','Chachapoyas','Amazonas','AC'),('010112','Magdalena','Chachapoyas','Amazonas','AC'),('010113','Mariscal Castilla','Chachapoyas','Amazonas','AC'),('010114','Molinopampa','Chachapoyas','Amazonas','AC'),('010115','Montevideo','Chachapoyas','Amazonas','AC'),('010116','Olleros','Chachapoyas','Amazonas','AC'),('010117','Quinjalca','Chachapoyas','Amazonas','AC'),('010118','San Francisco de Daguas','Chachapoyas','Amazonas','AC'),('010119','San Isidro de Maino','Chachapoyas','Amazonas','AC'),('010120','Soloco','Chachapoyas','Amazonas','AC'),('010121','Sonche','Chachapoyas','Amazonas','AC'),('010201','Bagua','Bagua','Amazonas','AC'),('010202','Aramango','Bagua','Amazonas','AC'),('010203','Copallin','Bagua','Amazonas','AC'),('010204','El Parco','Bagua','Amazonas','AC'),('010205','Imaza','Bagua','Amazonas','AC'),('010206','La Peca','Bagua','Amazonas','AC'),('010301','Jumbilla','Bongara','Amazonas','AC'),('010302','Chisquilla','Bongara','Amazonas','AC'),('010303','Churuja','Bongara','Amazonas','AC'),('010304','Corosha','Bongara','Amazonas','AC'),('010305','Cuispes','Bongara','Amazonas','AC'),('010306','Florida','Bongara','Amazonas','AC'),('010307','Jazan','Bongara','Amazonas','AC'),('010308','Recta','Bongara','Amazonas','AC'),('010309','San Carlos','Bongara','Amazonas','AC'),('010310','Shipasbamba','Bongara','Amazonas','AC'),('010311','Valera','Bongara','Amazonas','AC'),('010312','Yambrasbamba','Bongara','Amazonas','AC'),('010401','Nieva','Condorcanqui','Amazonas','AC'),('010402','El Cenepa','Condorcanqui','Amazonas','AC'),('010403','Rio Santiago','Condorcanqui','Amazonas','AC'),('010501','Lamud','Luya','Amazonas','AC'),('010502','Camporredondo','Luya','Amazonas','AC'),('010503','Cocabamba','Luya','Amazonas','AC'),('010504','Colcamar','Luya','Amazonas','AC'),('010505','Conila','Luya','Amazonas','AC'),('010506','Inguilpata','Luya','Amazonas','AC'),('010507','Longuita','Luya','Amazonas','AC'),('010508','Lonya Chico','Luya','Amazonas','AC'),('010509','Luya','Luya','Amazonas','AC'),('010510','Luya Viejo','Luya','Amazonas','AC'),('010511','Maria','Luya','Amazonas','AC'),('010512','Ocalli','Luya','Amazonas','AC'),('010513','Ocumal','Luya','Amazonas','AC'),('010514','Pisuquia','Luya','Amazonas','AC'),('010515','Providencia','Luya','Amazonas','AC'),('010516','San Cristobal','Luya','Amazonas','AC'),('010517','San Francisco del Yeso','Luya','Amazonas','AC'),('010518','San Jeronimo','Luya','Amazonas','AC'),('010519','San Juan de Lopecancha','Luya','Amazonas','AC'),('010520','Santa Catalina','Luya','Amazonas','AC'),('010521','Santo Tomas','Luya','Amazonas','AC'),('010522','Tingo','Luya','Amazonas','AC'),('010523','Trita','Luya','Amazonas','AC'),('010601','San Nicolas','Rodriguez de Mendoza','Amazonas','AC'),('010602','Chirimoto','Rodriguez de Mendoza','Amazonas','AC'),('010603','Cochamal','Rodriguez de Mendoza','Amazonas','AC'),('010604','Huambo','Rodriguez de Mendoza','Amazonas','AC'),('010605','Limabamba','Rodriguez de Mendoza','Amazonas','AC'),('010606','Longar','Rodriguez de Mendoza','Amazonas','AC'),('010607','Mariscal Benavides','Rodriguez de Mendoza','Amazonas','AC'),('010608','Milpuc','Rodriguez de Mendoza','Amazonas','AC'),('010609','Omia','Rodriguez de Mendoza','Amazonas','AC'),('010610','Santa Rosa','Rodriguez de Mendoza','Amazonas','AC'),('010611','Totora','Rodriguez de Mendoza','Amazonas','AC'),('010612','Vista Alegre','Rodriguez de Mendoza','Amazonas','AC'),('010701','Bagua Grande','Utcubamba','Amazonas','AC'),('010702','Cajaruro','Utcubamba','Amazonas','AC'),('010703','Cumba','Utcubamba','Amazonas','AC'),('010704','El Milagro','Utcubamba','Amazonas','AC'),('010705','Jamalca','Utcubamba','Amazonas','AC'),('010706','Lonya Grande','Utcubamba','Amazonas','AC'),('010707','Yamon','Utcubamba','Amazonas','AC'),('020101','Huaraz','Huaraz','Ancash','AC'),('020102','Cochabamba','Huaraz','Ancash','AC'),('020103','Colcabamba','Huaraz','Ancash','AC'),('020104','Huanchay','Huaraz','Ancash','AC'),('020105','Independencia','Huaraz','Ancash','AC'),('020106','Jangas','Huaraz','Ancash','AC'),('020107','La Libertad','Huaraz','Ancash','AC'),('020108','Olleros','Huaraz','Ancash','AC'),('020109','Pampas','Huaraz','Ancash','AC'),('020110','Pariacoto','Huaraz','Ancash','AC'),('020111','Pira','Huaraz','Ancash','AC'),('020112','Tarica','Huaraz','Ancash','AC'),('020201','Aija','Aija','Ancash','AC'),('020202','Coris','Aija','Ancash','AC'),('020203','Huacllan','Aija','Ancash','AC'),('020204','La Merced','Aija','Ancash','AC'),('020205','Succha','Aija','Ancash','AC'),('020301','Llamellin','Antonio Raymondi','Ancash','AC'),('020302','Aczo','Antonio Raymondi','Ancash','AC'),('020303','Chaccho','Antonio Raymondi','Ancash','AC'),('020304','Chingas','Antonio Raymondi','Ancash','AC'),('020305','Mirgas','Antonio Raymondi','Ancash','AC'),('020306','San Juan de Rontoy','Antonio Raymondi','Ancash','AC'),('020401','Chacas','Asuncion','Ancash','AC'),('020402','Acochaca','Asuncion','Ancash','AC'),('020501','Chiquian','Bolognesi','Ancash','AC'),('020502','Abelardo Pardo Lezameta','Bolognesi','Ancash','AC'),('020503','Antonio Raymondi','Bolognesi','Ancash','AC'),('020504','Aquia','Bolognesi','Ancash','AC'),('020505','Cajacay','Bolognesi','Ancash','AC'),('020506','Canis','Bolognesi','Ancash','AC'),('020507','Colquioc','Bolognesi','Ancash','AC'),('020508','Huallanca','Bolognesi','Ancash','AC'),('020509','Huasta','Bolognesi','Ancash','AC'),('020510','Huayllacayan','Bolognesi','Ancash','AC'),('020511','La Primavera','Bolognesi','Ancash','AC'),('020512','Mangas','Bolognesi','Ancash','AC'),('020513','Pacllon','Bolognesi','Ancash','AC'),('020514','San Miguel de Corpanqui','Bolognesi','Ancash','AC'),('020515','Ticllos','Bolognesi','Ancash','AC'),('020601','Carhuaz','Carhuaz','Ancash','AC'),('020602','Acopampa','Carhuaz','Ancash','AC'),('020603','Amashca','Carhuaz','Ancash','AC'),('020604','Anta','Carhuaz','Ancash','AC'),('020605','Ataquero','Carhuaz','Ancash','AC'),('020606','Marcara','Carhuaz','Ancash','AC'),('020607','Pariahuanca','Carhuaz','Ancash','AC'),('020608','San Miguel de Aco','Carhuaz','Ancash','AC'),('020609','Shilla','Carhuaz','Ancash','AC'),('020610','Tinco','Carhuaz','Ancash','AC'),('020611','Yungar','Carhuaz','Ancash','AC'),('020701','San Luis','Carlos Fermin Fitzca','Ancash','AC'),('020702','San Nicolas','Carlos Fermin Fitzca','Ancash','AC'),('020703','Yauya','Carlos Fermin Fitzca','Ancash','AC'),('020801','Casma','Casma','Ancash','AC'),('020802','Buena Vista Alta','Casma','Ancash','AC'),('020803','Comandante Noel','Casma','Ancash','AC'),('020804','Yautan','Casma','Ancash','AC'),('020901','Corongo','Corongo','Ancash','AC'),('020902','Aco','Corongo','Ancash','AC'),('020903','Bambas','Corongo','Ancash','AC'),('020904','Cusca','Corongo','Ancash','AC'),('020905','La Pampa','Corongo','Ancash','AC'),('020906','Yanac','Corongo','Ancash','AC'),('020907','Yupan','Corongo','Ancash','AC'),('021001','Huari','Huari','Ancash','AC'),('021002','Anra','Huari','Ancash','AC'),('021003','Cajay','Huari','Ancash','AC'),('021004','Chavin de Huantar','Huari','Ancash','AC'),('021005','Huacachi','Huari','Ancash','AC'),('021006','Huacchis','Huari','Ancash','AC'),('021007','Huachis','Huari','Ancash','AC'),('021008','Huantar','Huari','Ancash','AC'),('021009','Masin','Huari','Ancash','AC'),('021010','Paucas','Huari','Ancash','AC'),('021011','Ponto','Huari','Ancash','AC'),('021012','Rahuapampa','Huari','Ancash','AC'),('021013','Rapayan','Huari','Ancash','AC'),('021014','San Marcos','Huari','Ancash','AC'),('021015','San Pedro de Chana','Huari','Ancash','AC'),('021016','Uco','Huari','Ancash','AC'),('021101','Huarmey','Huarmey','Ancash','AC'),('021102','Cochapeti','Huarmey','Ancash','AC'),('021103','Culebras','Huarmey','Ancash','AC'),('021104','Huayan','Huarmey','Ancash','AC'),('021105','Malvas','Huarmey','Ancash','AC'),('021201','Caraz','Huaylas','Ancash','AC'),('021202','Huallanca','Huaylas','Ancash','AC'),('021203','Huata','Huaylas','Ancash','AC'),('021204','Huaylas','Huaylas','Ancash','AC'),('021205','Mato','Huaylas','Ancash','AC'),('021206','Pamparomas','Huaylas','Ancash','AC'),('021207','Pueblo Libre','Huaylas','Ancash','AC'),('021208','Santa Cruz','Huaylas','Ancash','AC'),('021209','Santo Toribio','Huaylas','Ancash','AC'),('021210','Yuracmarca','Huaylas','Ancash','AC'),('021301','Piscobamba','Mariscal Luzuriaga','Ancash','AC'),('021302','Casca','Mariscal Luzuriaga','Ancash','AC'),('021303','Eleazar Guzman Barron','Mariscal Luzuriaga','Ancash','AC'),('021304','Fidel Olivas Escudero','Mariscal Luzuriaga','Ancash','AC'),('021305','Llama','Mariscal Luzuriaga','Ancash','AC'),('021306','Llumpa','Mariscal Luzuriaga','Ancash','AC'),('021307','Lucma','Mariscal Luzuriaga','Ancash','AC'),('021308','Musga','Mariscal Luzuriaga','Ancash','AC'),('021401','Ocros','Ocros','Ancash','AC'),('021402','Acas','Ocros','Ancash','AC'),('021403','Cajamarquilla','Ocros','Ancash','AC'),('021404','Carhuapampa','Ocros','Ancash','AC'),('021405','Cochas','Ocros','Ancash','AC'),('021406','Congas','Ocros','Ancash','AC'),('021407','Llipa','Ocros','Ancash','AC'),('021408','San Cristobal de Rajan','Ocros','Ancash','AC'),('021409','San Pedro','Ocros','Ancash','AC'),('021410','Santiago de Chilcas','Ocros','Ancash','AC'),('021501','Cabana','Pallasca','Ancash','AC'),('021502','Bolognesi','Pallasca','Ancash','AC'),('021503','Conchucos','Pallasca','Ancash','AC'),('021504','Huacaschuque','Pallasca','Ancash','AC'),('021505','Huandoval','Pallasca','Ancash','AC'),('021506','Lacabamba','Pallasca','Ancash','AC'),('021507','Llapo','Pallasca','Ancash','AC'),('021508','Pallasca','Pallasca','Ancash','AC'),('021509','Pampas','Pallasca','Ancash','AC'),('021510','Santa Rosa','Pallasca','Ancash','AC'),('021511','Tauca','Pallasca','Ancash','AC'),('021601','Pomabamba','Pomabamba','Ancash','AC'),('021602','Huayllan','Pomabamba','Ancash','AC'),('021603','Parobamba','Pomabamba','Ancash','AC'),('021604','Quinuabamba','Pomabamba','Ancash','AC'),('021701','Recuay','Recuay','Ancash','AC'),('021702','Catac','Recuay','Ancash','AC'),('021703','Cotaparaco','Recuay','Ancash','AC'),('021704','Huayllapampa','Recuay','Ancash','AC'),('021705','Llacllin','Recuay','Ancash','AC'),('021706','Marca','Recuay','Ancash','AC'),('021707','Pampas Chico','Recuay','Ancash','AC'),('021708','Pararin','Recuay','Ancash','AC'),('021709','Tapacocha','Recuay','Ancash','AC'),('021710','Ticapampa','Recuay','Ancash','AC'),('021801','Chimbote','Santa','Ancash','AC'),('021802','Caceres del Peru','Santa','Ancash','AC'),('021803','Coishco','Santa','Ancash','AC'),('021804','Macate','Santa','Ancash','AC'),('021805','Moro','Santa','Ancash','AC'),('021806','Nepe¤a','Santa','Ancash','AC'),('021807','Samanco','Santa','Ancash','AC'),('021808','Santa','Santa','Ancash','AC'),('021809','Nuevo Chimbote','Santa','Ancash','AC'),('021901','Sihuas','Sihuas','Ancash','AC'),('021902','Acobamba','Sihuas','Ancash','AC'),('021903','Alfonso Ugarte','Sihuas','Ancash','AC'),('021904','Cashapampa','Sihuas','Ancash','AC'),('021905','Chingalpo','Sihuas','Ancash','AC'),('021906','Huayllabamba','Sihuas','Ancash','AC'),('021907','Quiches','Sihuas','Ancash','AC'),('021908','Ragash','Sihuas','Ancash','AC'),('021909','San Juan','Sihuas','Ancash','AC'),('021910','Sicsibamba','Sihuas','Ancash','AC'),('022001','Yungay','Yungay','Ancash','AC'),('022002','Cascapara','Yungay','Ancash','AC'),('022003','Mancos','Yungay','Ancash','AC'),('022004','Matacoto','Yungay','Ancash','AC'),('022005','Quillo','Yungay','Ancash','AC'),('022006','Ranrahirca','Yungay','Ancash','AC'),('022007','Shupluy','Yungay','Ancash','AC'),('022008','Yanama','Yungay','Ancash','AC'),('030101','Abancay','Abancay','Apurimac','AC'),('030102','Chacoche','Abancay','Apurimac','AC'),('030103','Circa','Abancay','Apurimac','AC'),('030104','Curahuasi','Abancay','Apurimac','AC'),('030105','Huanipaca','Abancay','Apurimac','AC'),('030106','Lambrama','Abancay','Apurimac','AC'),('030107','Pichirhua','Abancay','Apurimac','AC'),('030108','San Pedro de Cachora','Abancay','Apurimac','AC'),('030109','Tamburco','Abancay','Apurimac','AC'),('030201','Andahuaylas','Andahuaylas','Apurimac','AC'),('030202','Andarapa','Andahuaylas','Apurimac','AC'),('030203','Chiara','Andahuaylas','Apurimac','AC'),('030204','Huancarama','Andahuaylas','Apurimac','AC'),('030205','Huancaray','Andahuaylas','Apurimac','AC'),('030206','Huayana','Andahuaylas','Apurimac','AC'),('030207','Kishuara','Andahuaylas','Apurimac','AC'),('030208','Pacobamba','Andahuaylas','Apurimac','AC'),('030209','Pacucha','Andahuaylas','Apurimac','AC'),('030210','Pampachiri','Andahuaylas','Apurimac','AC'),('030211','Pomacocha','Andahuaylas','Apurimac','AC'),('030212','San Antonio de Cachi','Andahuaylas','Apurimac','AC'),('030213','San Jeronimo','Andahuaylas','Apurimac','AC'),('030214','San Miguel de Chaccrampa','Andahuaylas','Apurimac','AC'),('030215','Santa Maria de Chicmo','Andahuaylas','Apurimac','AC'),('030216','Talavera','Andahuaylas','Apurimac','AC'),('030217','Tumay Huaraca','Andahuaylas','Apurimac','AC'),('030218','Turpo','Andahuaylas','Apurimac','AC'),('030219','Kaquiabamba','Andahuaylas','Apurimac','AC'),('030220','Jos‚ Mar¡a Arguedas','Andahuaylas','Apurimac','AC'),('030301','Antabamba','Antabamba','Apurimac','AC'),('030302','El Oro','Antabamba','Apurimac','AC'),('030303','Huaquirca','Antabamba','Apurimac','AC'),('030304','Juan Espinoza Medrano','Antabamba','Apurimac','AC'),('030305','Oropesa','Antabamba','Apurimac','AC'),('030306','Pachaconas','Antabamba','Apurimac','AC'),('030307','Sabaino','Antabamba','Apurimac','AC'),('030401','Chalhuanca','Aymaraes','Apurimac','AC'),('030402','Capaya','Aymaraes','Apurimac','AC'),('030403','Caraybamba','Aymaraes','Apurimac','AC'),('030404','Chapimarca','Aymaraes','Apurimac','AC'),('030405','Colcabamba','Aymaraes','Apurimac','AC'),('030406','Cotaruse','Aymaraes','Apurimac','AC'),('030407','Huayllo','Aymaraes','Apurimac','AC'),('030408','Justo Apu Sahuaraura','Aymaraes','Apurimac','AC'),('030409','Lucre','Aymaraes','Apurimac','AC'),('030410','Pocohuanca','Aymaraes','Apurimac','AC'),('030411','San Juan de Chac¤a','Aymaraes','Apurimac','AC'),('030412','Sa¤ayca','Aymaraes','Apurimac','AC'),('030413','Soraya','Aymaraes','Apurimac','AC'),('030414','Tapairihua','Aymaraes','Apurimac','AC'),('030415','Tintay','Aymaraes','Apurimac','AC'),('030416','Toraya','Aymaraes','Apurimac','AC'),('030417','Yanaca','Aymaraes','Apurimac','AC'),('030501','Tambobamba','Cotabambas','Apurimac','AC'),('030502','Cotabambas','Cotabambas','Apurimac','AC'),('030503','Coyllurqui','Cotabambas','Apurimac','AC'),('030504','Haquira','Cotabambas','Apurimac','AC'),('030505','Mara','Cotabambas','Apurimac','AC'),('030506','Challhuahuacho','Cotabambas','Apurimac','AC'),('030601','Chincheros','Chincheros','Apurimac','AC'),('030602','Anco_Huallo','Chincheros','Apurimac','AC'),('030603','Cocharcas','Chincheros','Apurimac','AC'),('030604','Huaccana','Chincheros','Apurimac','AC'),('030605','Ocobamba','Chincheros','Apurimac','AC'),('030606','Ongoy','Chincheros','Apurimac','AC'),('030607','Uranmarca','Chincheros','Apurimac','AC'),('030608','Ranracancha','Chincheros','Apurimac','AC'),('030609','Rocchacc','Chincheros','Apurimac','AC'),('030610','El Porvenir','Chincheros','Apurimac','AC'),('030611','Los Chankas','Chincheros','Apurimac','AC'),('030701','Chuquibambilla','Grau','Apurimac','AC'),('030702','Curpahuasi','Grau','Apurimac','AC'),('030703','Gamarra','Grau','Apurimac','AC'),('030704','Huayllati','Grau','Apurimac','AC'),('030705','Mamara','Grau','Apurimac','AC'),('030706','Micaela Bastidas','Grau','Apurimac','AC'),('030707','Pataypampa','Grau','Apurimac','AC'),('030708','Progreso','Grau','Apurimac','AC'),('030709','San Antonio','Grau','Apurimac','AC'),('030710','Santa Rosa','Grau','Apurimac','AC'),('030711','Turpay','Grau','Apurimac','AC'),('030712','Vilcabamba','Grau','Apurimac','AC'),('030713','Virundo','Grau','Apurimac','AC'),('030714','Curasco','Grau','Apurimac','AC'),('040101','Arequipa','Arequipa','Arequipa','AC'),('040102','Alto Selva Alegre','Arequipa','Arequipa','AC'),('040103','Cayma','Arequipa','Arequipa','AC'),('040104','Cerro Colorado','Arequipa','Arequipa','AC'),('040105','Characato','Arequipa','Arequipa','AC'),('040106','Chiguata','Arequipa','Arequipa','AC'),('040107','Jacobo Hunter','Arequipa','Arequipa','AC'),('040108','La Joya','Arequipa','Arequipa','AC'),('040109','Mariano Melgar','Arequipa','Arequipa','AC'),('040110','Miraflores','Arequipa','Arequipa','AC'),('040111','Mollebaya','Arequipa','Arequipa','AC'),('040112','Paucarpata','Arequipa','Arequipa','AC'),('040113','Pocsi','Arequipa','Arequipa','AC'),('040114','Polobaya','Arequipa','Arequipa','AC'),('040115','Queque¤a','Arequipa','Arequipa','AC'),('040116','Sabandia','Arequipa','Arequipa','AC'),('040117','Sachaca','Arequipa','Arequipa','AC'),('040118','San Juan de Siguas','Arequipa','Arequipa','AC'),('040119','San Juan de Tarucani','Arequipa','Arequipa','AC'),('040120','Santa Isabel de Siguas','Arequipa','Arequipa','AC'),('040121','Santa Rita de Siguas','Arequipa','Arequipa','AC'),('040122','Socabaya','Arequipa','Arequipa','AC'),('040123','Tiabaya','Arequipa','Arequipa','AC'),('040124','Uchumayo','Arequipa','Arequipa','AC'),('040125','Vitor','Arequipa','Arequipa','AC'),('040126','Yanahuara','Arequipa','Arequipa','AC'),('040127','Yarabamba','Arequipa','Arequipa','AC'),('040128','Yura','Arequipa','Arequipa','AC'),('040129','Jose Luis Bustamante y Rivero','Arequipa','Arequipa','AC'),('040201','Camana','Camana','Arequipa','AC'),('040202','Jose Maria Quimper','Camana','Arequipa','AC'),('040203','Mariano Nicolas Valcarcel','Camana','Arequipa','AC'),('040204','Mariscal Caceres','Camana','Arequipa','AC'),('040205','Nicolas de Pierola','Camana','Arequipa','AC'),('040206','Oco¤a','Camana','Arequipa','AC'),('040207','Quilca','Camana','Arequipa','AC'),('040208','Samuel Pastor','Camana','Arequipa','AC'),('040301','Caraveli','Caraveli','Arequipa','AC'),('040302','Acari','Caraveli','Arequipa','AC'),('040303','Atico','Caraveli','Arequipa','AC'),('040304','Atiquipa','Caraveli','Arequipa','AC'),('040305','Bella Union','Caraveli','Arequipa','AC'),('040306','Cahuacho','Caraveli','Arequipa','AC'),('040307','Chala','Caraveli','Arequipa','AC'),('040308','Chaparra','Caraveli','Arequipa','AC'),('040309','Huanuhuanu','Caraveli','Arequipa','AC'),('040310','Jaqui','Caraveli','Arequipa','AC'),('040311','Lomas','Caraveli','Arequipa','AC'),('040312','Quicacha','Caraveli','Arequipa','AC'),('040313','Yauca','Caraveli','Arequipa','AC'),('040401','Aplao','Castilla','Arequipa','AC'),('040402','Andagua','Castilla','Arequipa','AC'),('040403','Ayo','Castilla','Arequipa','AC'),('040404','Chachas','Castilla','Arequipa','AC'),('040405','Chilcaymarca','Castilla','Arequipa','AC'),('040406','Choco','Castilla','Arequipa','AC'),('040407','Huancarqui','Castilla','Arequipa','AC'),('040408','Machaguay','Castilla','Arequipa','AC'),('040409','Orcopampa','Castilla','Arequipa','AC'),('040410','Pampacolca','Castilla','Arequipa','AC'),('040411','Tipan','Castilla','Arequipa','AC'),('040412','U¤on','Castilla','Arequipa','AC'),('040413','Uraca','Castilla','Arequipa','AC'),('040414','Viraco','Castilla','Arequipa','AC'),('040501','Chivay','Caylloma','Arequipa','AC'),('040502','Achoma','Caylloma','Arequipa','AC'),('040503','Cabanaconde','Caylloma','Arequipa','AC'),('040504','Callalli','Caylloma','Arequipa','AC'),('040505','Caylloma','Caylloma','Arequipa','AC'),('040506','Coporaque','Caylloma','Arequipa','AC'),('040507','Huambo','Caylloma','Arequipa','AC'),('040508','Huanca','Caylloma','Arequipa','AC'),('040509','Ichupampa','Caylloma','Arequipa','AC'),('040510','Lari','Caylloma','Arequipa','AC'),('040511','Lluta','Caylloma','Arequipa','AC'),('040512','Maca','Caylloma','Arequipa','AC'),('040513','Madrigal','Caylloma','Arequipa','AC'),('040514','San Antonio de Chuca','Caylloma','Arequipa','AC'),('040515','Sibayo','Caylloma','Arequipa','AC'),('040516','Tapay','Caylloma','Arequipa','AC'),('040517','Tisco','Caylloma','Arequipa','AC'),('040518','Tuti','Caylloma','Arequipa','AC'),('040519','Yanque','Caylloma','Arequipa','AC'),('040520','Majes','Caylloma','Arequipa','AC'),('040601','Chuquibamba','Condesuyos','Arequipa','AC'),('040602','Andaray','Condesuyos','Arequipa','AC'),('040603','Cayarani','Condesuyos','Arequipa','AC'),('040604','Chichas','Condesuyos','Arequipa','AC'),('040605','Iray','Condesuyos','Arequipa','AC'),('040606','Rio Grande','Condesuyos','Arequipa','AC'),('040607','Salamanca','Condesuyos','Arequipa','AC'),('040608','Yanaquihua','Condesuyos','Arequipa','AC'),('040701','Mollendo','Islay','Arequipa','AC'),('040702','Cocachacra','Islay','Arequipa','AC'),('040703','Dean Valdivia','Islay','Arequipa','AC'),('040704','Islay','Islay','Arequipa','AC'),('040705','Mejia','Islay','Arequipa','AC'),('040706','Punta de Bombon','Islay','Arequipa','AC'),('040801','Cotahuasi','La Union','Arequipa','AC'),('040802','Alca','La Union','Arequipa','AC'),('040803','Charcana','La Union','Arequipa','AC'),('040804','Huaynacotas','La Union','Arequipa','AC'),('040805','Pampamarca','La Union','Arequipa','AC'),('040806','Puyca','La Union','Arequipa','AC'),('040807','Quechualla','La Union','Arequipa','AC'),('040808','Sayla','La Union','Arequipa','AC'),('040809','Tauria','La Union','Arequipa','AC'),('040810','Tomepampa','La Union','Arequipa','AC'),('040811','Toro','La Union','Arequipa','AC'),('050101','Ayacucho','Huamanga','Ayacucho','AC'),('050102','Acocro','Huamanga','Ayacucho','AC'),('050103','Acos Vinchos','Huamanga','Ayacucho','AC'),('050104','Carmen Alto','Huamanga','Ayacucho','AC'),('050105','Chiara','Huamanga','Ayacucho','AC'),('050106','Ocros','Huamanga','Ayacucho','AC'),('050107','Pacaycasa','Huamanga','Ayacucho','AC'),('050108','Quinua','Huamanga','Ayacucho','AC'),('050109','San Jose de Ticllas','Huamanga','Ayacucho','AC'),('050110','San Juan Bautista','Huamanga','Ayacucho','AC'),('050111','Santiago de Pischa','Huamanga','Ayacucho','AC'),('050112','Socos','Huamanga','Ayacucho','AC'),('050113','Tambillo','Huamanga','Ayacucho','AC'),('050114','Vinchos','Huamanga','Ayacucho','AC'),('050115','Jesus Nazareno','Huamanga','Ayacucho','AC'),('050116','Andr‚s Avelino C ceres Dorregaray','Huamanga','Ayacucho','AC'),('050201','Cangallo','Cangallo','Ayacucho','AC'),('050202','Chuschi','Cangallo','Ayacucho','AC'),('050203','Los Morochucos','Cangallo','Ayacucho','AC'),('050204','Maria Parado de Bellido','Cangallo','Ayacucho','AC'),('050205','Paras','Cangallo','Ayacucho','AC'),('050206','Totos','Cangallo','Ayacucho','AC'),('050301','Sancos','Huanca Sancos','Ayacucho','AC'),('050302','Carapo','Huanca Sancos','Ayacucho','AC'),('050303','Sacsamarca','Huanca Sancos','Ayacucho','AC'),('050304','Santiago de Lucanamarca','Huanca Sancos','Ayacucho','AC'),('050401','Huanta','Huanta','Ayacucho','AC'),('050402','Ayahuanco','Huanta','Ayacucho','AC'),('050403','Huamanguilla','Huanta','Ayacucho','AC'),('050404','Iguain','Huanta','Ayacucho','AC'),('050405','Luricocha','Huanta','Ayacucho','AC'),('050406','Santillana','Huanta','Ayacucho','AC'),('050407','Sivia','Huanta','Ayacucho','AC'),('050408','Llochegua','Huanta','Ayacucho','AC'),('050409','Canayre','Huanta','Ayacucho','AC'),('050410','Uchuraccay','Huanta','Ayacucho','AC'),('050411','Pucacolpa','Huanta','Ayacucho','AC'),('050412','Chaca','Huanta','Ayacucho','AC'),('050501','San Miguel','La Mar','Ayacucho','AC'),('050502','Anco','La Mar','Ayacucho','AC'),('050503','Ayna','La Mar','Ayacucho','AC'),('050504','Chilcas','La Mar','Ayacucho','AC'),('050505','Chungui','La Mar','Ayacucho','AC'),('050506','Luis Carranza','La Mar','Ayacucho','AC'),('050507','Santa Rosa','La Mar','Ayacucho','AC'),('050508','Tambo','La Mar','Ayacucho','AC'),('050509','Samugari','La Mar','Ayacucho','AC'),('050510','Anchihuay','La Mar','Ayacucho','AC'),('050511','Oronccoy','La Mar','Ayacucho','AC'),('050601','Puquio','Lucanas','Ayacucho','AC'),('050602','Aucara','Lucanas','Ayacucho','AC'),('050603','Cabana','Lucanas','Ayacucho','AC'),('050604','Carmen Salcedo','Lucanas','Ayacucho','AC'),('050605','Chavi¤a','Lucanas','Ayacucho','AC'),('050606','Chipao','Lucanas','Ayacucho','AC'),('050607','Huac-Huas','Lucanas','Ayacucho','AC'),('050608','Laramate','Lucanas','Ayacucho','AC'),('050609','Leoncio Prado','Lucanas','Ayacucho','AC'),('050610','Llauta','Lucanas','Ayacucho','AC'),('050611','Lucanas','Lucanas','Ayacucho','AC'),('050612','Oca¤a','Lucanas','Ayacucho','AC'),('050613','Otoca','Lucanas','Ayacucho','AC'),('050614','Saisa','Lucanas','Ayacucho','AC'),('050615','San Cristobal','Lucanas','Ayacucho','AC'),('050616','San Juan','Lucanas','Ayacucho','AC'),('050617','San Pedro','Lucanas','Ayacucho','AC'),('050618','San Pedro de Palco','Lucanas','Ayacucho','AC'),('050619','Sancos','Lucanas','Ayacucho','AC'),('050620','Santa Ana de Huaycahuacho','Lucanas','Ayacucho','AC'),('050621','Santa Lucia','Lucanas','Ayacucho','AC'),('050701','Coracora','Parinacochas','Ayacucho','AC'),('050702','Chumpi','Parinacochas','Ayacucho','AC'),('050703','Coronel Casta¤eda','Parinacochas','Ayacucho','AC'),('050704','Pacapausa','Parinacochas','Ayacucho','AC'),('050705','Pullo','Parinacochas','Ayacucho','AC'),('050706','Puyusca','Parinacochas','Ayacucho','AC'),('050707','San Francisco de Ravacayco','Parinacochas','Ayacucho','AC'),('050708','Upahuacho','Parinacochas','Ayacucho','AC'),('050801','Pausa','Paucar del Sara Sara','Ayacucho','AC'),('050802','Colta','Paucar del Sara Sara','Ayacucho','AC'),('050803','Corculla','Paucar del Sara Sara','Ayacucho','AC'),('050804','Lampa','Paucar del Sara Sara','Ayacucho','AC'),('050805','Marcabamba','Paucar del Sara Sara','Ayacucho','AC'),('050806','Oyolo','Paucar del Sara Sara','Ayacucho','AC'),('050807','Pararca','Paucar del Sara Sara','Ayacucho','AC'),('050808','San Javier de Alpabamba','Paucar del Sara Sara','Ayacucho','AC'),('050809','San Jose de Ushua','Paucar del Sara Sara','Ayacucho','AC'),('050810','Sara Sara','Paucar del Sara Sara','Ayacucho','AC'),('050901','Querobamba','Sucre','Ayacucho','AC'),('050902','Belen','Sucre','Ayacucho','AC'),('050903','Chalcos','Sucre','Ayacucho','AC'),('050904','Chilcayoc','Sucre','Ayacucho','AC'),('050905','Huaca¤a','Sucre','Ayacucho','AC'),('050906','Morcolla','Sucre','Ayacucho','AC'),('050907','Paico','Sucre','Ayacucho','AC'),('050908','San Pedro de Larcay','Sucre','Ayacucho','AC'),('050909','San Salvador de Quije','Sucre','Ayacucho','AC'),('050910','Santiago de Paucaray','Sucre','Ayacucho','AC'),('050911','Soras','Sucre','Ayacucho','AC'),('051001','Huancapi','Victor Fajardo','Ayacucho','AC'),('051002','Alcamenca','Victor Fajardo','Ayacucho','AC'),('051003','Apongo','Victor Fajardo','Ayacucho','AC'),('051004','Asquipata','Victor Fajardo','Ayacucho','AC'),('051005','Canaria','Victor Fajardo','Ayacucho','AC'),('051006','Cayara','Victor Fajardo','Ayacucho','AC'),('051007','Colca','Victor Fajardo','Ayacucho','AC'),('051008','Huamanquiquia','Victor Fajardo','Ayacucho','AC'),('051009','Huancaraylla','Victor Fajardo','Ayacucho','AC'),('051010','Huaya','Victor Fajardo','Ayacucho','AC'),('051011','Sarhua','Victor Fajardo','Ayacucho','AC'),('051012','Vilcanchos','Victor Fajardo','Ayacucho','AC'),('051101','Vilcas Huaman','Vilcas Huaman','Ayacucho','AC'),('051102','Accomarca','Vilcas Huaman','Ayacucho','AC'),('051103','Carhuanca','Vilcas Huaman','Ayacucho','AC'),('051104','Concepcion','Vilcas Huaman','Ayacucho','AC'),('051105','Huambalpa','Vilcas Huaman','Ayacucho','AC'),('051106','Independencia','Vilcas Huaman','Ayacucho','AC'),('051107','Saurama','Vilcas Huaman','Ayacucho','AC'),('051108','Vischongo','Vilcas Huaman','Ayacucho','AC'),('060101','Cajamarca','Cajamarca','Cajamarca','AC'),('060102','Asuncion','Cajamarca','Cajamarca','AC'),('060103','Chetilla','Cajamarca','Cajamarca','AC'),('060104','Cospan','Cajamarca','Cajamarca','AC'),('060105','Enca¤ada','Cajamarca','Cajamarca','AC'),('060106','Jesus','Cajamarca','Cajamarca','AC'),('060107','Llacanora','Cajamarca','Cajamarca','AC'),('060108','Los Ba¤os del Inca','Cajamarca','Cajamarca','AC'),('060109','Magdalena','Cajamarca','Cajamarca','AC'),('060110','Matara','Cajamarca','Cajamarca','AC'),('060111','Namora','Cajamarca','Cajamarca','AC'),('060112','San Juan','Cajamarca','Cajamarca','AC'),('060201','Cajabamba','Cajabamba','Cajamarca','AC'),('060202','Cachachi','Cajabamba','Cajamarca','AC'),('060203','Condebamba','Cajabamba','Cajamarca','AC'),('060204','Sitacocha','Cajabamba','Cajamarca','AC'),('060301','Celendin','Celendin','Cajamarca','AC'),('060302','Chumuch','Celendin','Cajamarca','AC'),('060303','Cortegana','Celendin','Cajamarca','AC'),('060304','Huasmin','Celendin','Cajamarca','AC'),('060305','Jorge Chavez','Celendin','Cajamarca','AC'),('060306','Jose Galvez','Celendin','Cajamarca','AC'),('060307','Miguel Iglesias','Celendin','Cajamarca','AC'),('060308','Oxamarca','Celendin','Cajamarca','AC'),('060309','Sorochuco','Celendin','Cajamarca','AC'),('060310','Sucre','Celendin','Cajamarca','AC'),('060311','Utco','Celendin','Cajamarca','AC'),('060312','La Libertad de Pallan','Celendin','Cajamarca','AC'),('060401','Chota','Chota','Cajamarca','AC'),('060402','Anguia','Chota','Cajamarca','AC'),('060403','Chadin','Chota','Cajamarca','AC'),('060404','Chiguirip','Chota','Cajamarca','AC'),('060405','Chimban','Chota','Cajamarca','AC'),('060406','Choropampa','Chota','Cajamarca','AC'),('060407','Cochabamba','Chota','Cajamarca','AC'),('060408','Conchan','Chota','Cajamarca','AC'),('060409','Huambos','Chota','Cajamarca','AC'),('060410','Lajas','Chota','Cajamarca','AC'),('060411','Llama','Chota','Cajamarca','AC'),('060412','Miracosta','Chota','Cajamarca','AC'),('060413','Paccha','Chota','Cajamarca','AC'),('060414','Pion','Chota','Cajamarca','AC'),('060415','Querocoto','Chota','Cajamarca','AC'),('060416','San Juan de Licupis','Chota','Cajamarca','AC'),('060417','Tacabamba','Chota','Cajamarca','AC'),('060418','Tocmoche','Chota','Cajamarca','AC'),('060419','Chalamarca','Chota','Cajamarca','AC'),('060501','Contumaza','Contumaza','Cajamarca','AC'),('060502','Chilete','Contumaza','Cajamarca','AC'),('060503','Cupisnique','Contumaza','Cajamarca','AC'),('060504','Guzmango','Contumaza','Cajamarca','AC'),('060505','San Benito','Contumaza','Cajamarca','AC'),('060506','Santa Cruz de Toled','Contumaza','Cajamarca','AC'),('060507','Tantarica','Contumaza','Cajamarca','AC'),('060508','Yonan','Contumaza','Cajamarca','AC'),('060601','Cutervo','Cutervo','Cajamarca','AC'),('060602','Callayuc','Cutervo','Cajamarca','AC'),('060603','Choros','Cutervo','Cajamarca','AC'),('060604','Cujillo','Cutervo','Cajamarca','AC'),('060605','La Ramada','Cutervo','Cajamarca','AC'),('060606','Pimpingos','Cutervo','Cajamarca','AC'),('060607','Querocotillo','Cutervo','Cajamarca','AC'),('060608','San Andres de Cutervo','Cutervo','Cajamarca','AC'),('060609','San Juan de Cutervo','Cutervo','Cajamarca','AC'),('060610','San Luis de Lucma','Cutervo','Cajamarca','AC'),('060611','Santa Cruz','Cutervo','Cajamarca','AC'),('060612','Santo Domingo de La Capilla','Cutervo','Cajamarca','AC'),('060613','Santo Tomas','Cutervo','Cajamarca','AC'),('060614','Socota','Cutervo','Cajamarca','AC'),('060615','Toribio Casanova','Cutervo','Cajamarca','AC'),('060701','Bambamarca','Hualgayoc','Cajamarca','AC'),('060702','Chugur','Hualgayoc','Cajamarca','AC'),('060703','Hualgayoc','Hualgayoc','Cajamarca','AC'),('060801','Jaen','Jaen','Cajamarca','AC'),('060802','Bellavista','Jaen','Cajamarca','AC'),('060803','Chontali','Jaen','Cajamarca','AC'),('060804','Colasay','Jaen','Cajamarca','AC'),('060805','Huabal','Jaen','Cajamarca','AC'),('060806','Las Pirias','Jaen','Cajamarca','AC'),('060807','Pomahuaca','Jaen','Cajamarca','AC'),('060808','Pucara','Jaen','Cajamarca','AC'),('060809','Sallique','Jaen','Cajamarca','AC'),('060810','San Felipe','Jaen','Cajamarca','AC'),('060811','San Jose del Alto','Jaen','Cajamarca','AC'),('060812','Santa Rosa','Jaen','Cajamarca','AC'),('060901','San Ignacio','San Ignacio','Cajamarca','AC'),('060902','Chirinos','San Ignacio','Cajamarca','AC'),('060903','Huarango','San Ignacio','Cajamarca','AC'),('060904','La Coipa','San Ignacio','Cajamarca','AC'),('060905','Namballe','San Ignacio','Cajamarca','AC'),('060906','San Jose de Lourdes','San Ignacio','Cajamarca','AC'),('060907','Tabaconas','San Ignacio','Cajamarca','AC'),('061001','Pedro Galvez','San Marcos','Cajamarca','AC'),('061002','Chancay','San Marcos','Cajamarca','AC'),('061003','Eduardo Villanueva','San Marcos','Cajamarca','AC'),('061004','Gregorio Pita','San Marcos','Cajamarca','AC'),('061005','Ichocan','San Marcos','Cajamarca','AC'),('061006','Jose Manuel Quiroz','San Marcos','Cajamarca','AC'),('061007','Jose Sabogal','San Marcos','Cajamarca','AC'),('061101','San Miguel','San Miguel','Cajamarca','AC'),('061102','Bolivar','San Miguel','Cajamarca','AC'),('061103','Calquis','San Miguel','Cajamarca','AC'),('061104','Catilluc','San Miguel','Cajamarca','AC'),('061105','El Prado','San Miguel','Cajamarca','AC'),('061106','La Florida','San Miguel','Cajamarca','AC'),('061107','Llapa','San Miguel','Cajamarca','AC'),('061108','Nanchoc','San Miguel','Cajamarca','AC'),('061109','Niepos','San Miguel','Cajamarca','AC'),('061110','San Gregorio','San Miguel','Cajamarca','AC'),('061111','San Silvestre de Cochan','San Miguel','Cajamarca','AC'),('061112','Tongod','San Miguel','Cajamarca','AC'),('061113','Union Agua Blanca','San Miguel','Cajamarca','AC'),('061201','San Pablo','San Pablo','Cajamarca','AC'),('061202','San Bernardino','San Pablo','Cajamarca','AC'),('061203','San Luis','San Pablo','Cajamarca','AC'),('061204','Tumbaden','San Pablo','Cajamarca','AC'),('061301','Santa Cruz','Santa Cruz','Cajamarca','AC'),('061302','Andabamba','Santa Cruz','Cajamarca','AC'),('061303','Catache','Santa Cruz','Cajamarca','AC'),('061304','Chancayba¤os','Santa Cruz','Cajamarca','AC'),('061305','La Esperanza','Santa Cruz','Cajamarca','AC'),('061306','Ninabamba','Santa Cruz','Cajamarca','AC'),('061307','Pulan','Santa Cruz','Cajamarca','AC'),('061308','Saucepampa','Santa Cruz','Cajamarca','AC'),('061309','Sexi','Santa Cruz','Cajamarca','AC'),('061310','Uticyacu','Santa Cruz','Cajamarca','AC'),('061311','Yauyucan','Santa Cruz','Cajamarca','AC'),('070101','Callao','Callao','Callao','AC'),('070102','Bellavista','Callao','Callao','AC'),('070103','Carmen de La Legua','Callao','Callao','AC'),('070104','La Perla','Callao','Callao','AC'),('070105','La Punta','Callao','Callao','AC'),('070106','Ventanilla','Callao','Callao','AC'),('070107','Mi Peru','Callao','Callao','AC'),('080101','Cusco','Cusco','Cusco','AC'),('080102','Ccorca','Cusco','Cusco','AC'),('080103','Poroy','Cusco','Cusco','AC'),('080104','San Jeronimo','Cusco','Cusco','AC'),('080105','San Sebastian','Cusco','Cusco','AC'),('080106','Santiago','Cusco','Cusco','AC'),('080107','Saylla','Cusco','Cusco','AC'),('080108','Wanchaq','Cusco','Cusco','AC'),('080201','Acomayo','Acomayo','Cusco','AC'),('080202','Acopia','Acomayo','Cusco','AC'),('080203','Acos','Acomayo','Cusco','AC'),('080204','Mosoc Llacta','Acomayo','Cusco','AC'),('080205','Pomacanchi','Acomayo','Cusco','AC'),('080206','Rondocan','Acomayo','Cusco','AC'),('080207','Sangarara','Acomayo','Cusco','AC'),('080301','Anta','Anta','Cusco','AC'),('080302','Ancahuasi','Anta','Cusco','AC'),('080303','Cachimayo','Anta','Cusco','AC'),('080304','Chinchaypujio','Anta','Cusco','AC'),('080305','Huarocondo','Anta','Cusco','AC'),('080306','Limatambo','Anta','Cusco','AC'),('080307','Mollepata','Anta','Cusco','AC'),('080308','Pucyura','Anta','Cusco','AC'),('080309','Zurite','Anta','Cusco','AC'),('080401','Calca','Calca','Cusco','AC'),('080402','Coya','Calca','Cusco','AC'),('080403','Lamay','Calca','Cusco','AC'),('080404','Lares','Calca','Cusco','AC'),('080405','Pisac','Calca','Cusco','AC'),('080406','San Salvador','Calca','Cusco','AC'),('080407','Taray','Calca','Cusco','AC'),('080408','Yanatile','Calca','Cusco','AC'),('080501','Yanaoca','Canas','Cusco','AC'),('080502','Checca','Canas','Cusco','AC'),('080503','Kunturkanki','Canas','Cusco','AC'),('080504','Langui','Canas','Cusco','AC'),('080505','Layo','Canas','Cusco','AC'),('080506','Pampamarca','Canas','Cusco','AC'),('080507','Quehue','Canas','Cusco','AC'),('080508','Tupac Amaru','Canas','Cusco','AC'),('080601','Sicuani','Canchis','Cusco','AC'),('080602','Checacupe','Canchis','Cusco','AC'),('080603','Combapata','Canchis','Cusco','AC'),('080604','Marangani','Canchis','Cusco','AC'),('080605','Pitumarca','Canchis','Cusco','AC'),('080606','San Pablo','Canchis','Cusco','AC'),('080607','San Pedro','Canchis','Cusco','AC'),('080608','Tinta','Canchis','Cusco','AC'),('080701','Santo Tomas','Chumbivilcas','Cusco','AC'),('080702','Capacmarca','Chumbivilcas','Cusco','AC'),('080703','Chamaca','Chumbivilcas','Cusco','AC'),('080704','Colquemarca','Chumbivilcas','Cusco','AC'),('080705','Livitaca','Chumbivilcas','Cusco','AC'),('080706','Llusco','Chumbivilcas','Cusco','AC'),('080707','Qui¤ota','Chumbivilcas','Cusco','AC'),('080708','Velille','Chumbivilcas','Cusco','AC'),('080801','Espinar','Espinar','Cusco','AC'),('080802','Condoroma','Espinar','Cusco','AC'),('080803','Coporaque','Espinar','Cusco','AC'),('080804','Ocoruro','Espinar','Cusco','AC'),('080805','Pallpata','Espinar','Cusco','AC'),('080806','Pichigua','Espinar','Cusco','AC'),('080807','Suyckutambo','Espinar','Cusco','AC'),('080808','Alto Pichigua','Espinar','Cusco','AC'),('080901','Santa Ana','La Convencion','Cusco','AC'),('080902','Echarate','La Convencion','Cusco','AC'),('080903','Huayopata','La Convencion','Cusco','AC'),('080904','Maranura','La Convencion','Cusco','AC'),('080905','Ocobamba','La Convencion','Cusco','AC'),('080906','Quellouno','La Convencion','Cusco','AC'),('080907','Kimbiri','La Convencion','Cusco','AC'),('080908','Santa Teresa','La Convencion','Cusco','AC'),('080909','Vilcabamba','La Convencion','Cusco','AC'),('080910','Pichari','La Convencion','Cusco','AC'),('080911','Inkawasi','La Convencion','Cusco','AC'),('080912','Villa Virgen','La Convencion','Cusco','AC'),('080913','Villa Kintiarina','La Convencion','Cusco','AC'),('080914','Megantoni','La Convencion','Cusco','AC'),('081001','Paruro','Paruro','Cusco','AC'),('081002','Accha','Paruro','Cusco','AC'),('081003','Ccapi','Paruro','Cusco','AC'),('081004','Colcha','Paruro','Cusco','AC'),('081005','Huanoquite','Paruro','Cusco','AC'),('081006','Omacha','Paruro','Cusco','AC'),('081007','Paccaritambo','Paruro','Cusco','AC'),('081008','Pillpinto','Paruro','Cusco','AC'),('081009','Yaurisque','Paruro','Cusco','AC'),('081101','Paucartambo','Paucartambo','Cusco','AC'),('081102','Caicay','Paucartambo','Cusco','AC'),('081103','Challabamba','Paucartambo','Cusco','AC'),('081104','Colquepata','Paucartambo','Cusco','AC'),('081105','Huancarani','Paucartambo','Cusco','AC'),('081106','Kos¤ipata','Paucartambo','Cusco','AC'),('081201','Urcos','Quispicanchi','Cusco','AC'),('081202','Andahuaylillas','Quispicanchi','Cusco','AC'),('081203','Camanti','Quispicanchi','Cusco','AC'),('081204','Ccarhuayo','Quispicanchi','Cusco','AC'),('081205','Ccatca','Quispicanchi','Cusco','AC'),('081206','Cusipata','Quispicanchi','Cusco','AC'),('081207','Huaro','Quispicanchi','Cusco','AC'),('081208','Lucre','Quispicanchi','Cusco','AC'),('081209','Marcapata','Quispicanchi','Cusco','AC'),('081210','Ocongate','Quispicanchi','Cusco','AC'),('081211','Oropesa','Quispicanchi','Cusco','AC'),('081212','Quiquijana','Quispicanchi','Cusco','AC'),('081301','Urubamba','Urubamba','Cusco','AC'),('081302','Chinchero','Urubamba','Cusco','AC'),('081303','Huayllabamba','Urubamba','Cusco','AC'),('081304','Machupicchu','Urubamba','Cusco','AC'),('081305','Maras','Urubamba','Cusco','AC'),('081306','Ollantaytambo','Urubamba','Cusco','AC'),('081307','Yucay','Urubamba','Cusco','AC'),('090101','Huancavelica','Huancavelica','Huancavelica','AC'),('090102','Acobambilla','Huancavelica','Huancavelica','AC'),('090103','Acoria','Huancavelica','Huancavelica','AC'),('090104','Conayca','Huancavelica','Huancavelica','AC'),('090105','Cuenca','Huancavelica','Huancavelica','AC'),('090106','Huachocolpa','Huancavelica','Huancavelica','AC'),('090107','Huayllahuara','Huancavelica','Huancavelica','AC'),('090108','Izcuchaca','Huancavelica','Huancavelica','AC'),('090109','Laria','Huancavelica','Huancavelica','AC'),('090110','Manta','Huancavelica','Huancavelica','AC'),('090111','Mariscal Caceres','Huancavelica','Huancavelica','AC'),('090112','Moya','Huancavelica','Huancavelica','AC'),('090113','Nuevo Occoro','Huancavelica','Huancavelica','AC'),('090114','Palca','Huancavelica','Huancavelica','AC'),('090115','Pilchaca','Huancavelica','Huancavelica','AC'),('090116','Vilca','Huancavelica','Huancavelica','AC'),('090117','Yauli','Huancavelica','Huancavelica','AC'),('090118','Ascension','Huancavelica','Huancavelica','AC'),('090119','Huando','Huancavelica','Huancavelica','AC'),('090201','Acobamba','Acobamba','Huancavelica','AC'),('090202','Andabamba','Acobamba','Huancavelica','AC'),('090203','Anta','Acobamba','Huancavelica','AC'),('090204','Caja','Acobamba','Huancavelica','AC'),('090205','Marcas','Acobamba','Huancavelica','AC'),('090206','Paucara','Acobamba','Huancavelica','AC'),('090207','Pomacocha','Acobamba','Huancavelica','AC'),('090208','Rosario','Acobamba','Huancavelica','AC'),('090301','Lircay','Angaraes','Huancavelica','AC'),('090302','Anchonga','Angaraes','Huancavelica','AC'),('090303','Callanmarca','Angaraes','Huancavelica','AC'),('090304','Ccochaccasa','Angaraes','Huancavelica','AC'),('090305','Chincho','Angaraes','Huancavelica','AC'),('090306','Congalla','Angaraes','Huancavelica','AC'),('090307','Huanca-Huanca','Angaraes','Huancavelica','AC'),('090308','Huayllay Grande','Angaraes','Huancavelica','AC'),('090309','Julcamarca','Angaraes','Huancavelica','AC'),('090310','San Antonio de Antaparco','Angaraes','Huancavelica','AC'),('090311','Santo Tomas de Pata','Angaraes','Huancavelica','AC'),('090312','Secclla','Angaraes','Huancavelica','AC'),('090401','Castrovirreyna','Castrovirreyna','Huancavelica','AC'),('090402','Arma','Castrovirreyna','Huancavelica','AC'),('090403','Aurahua','Castrovirreyna','Huancavelica','AC'),('090404','Capillas','Castrovirreyna','Huancavelica','AC'),('090405','Chupamarca','Castrovirreyna','Huancavelica','AC'),('090406','Cocas','Castrovirreyna','Huancavelica','AC'),('090407','Huachos','Castrovirreyna','Huancavelica','AC'),('090408','Huamatambo','Castrovirreyna','Huancavelica','AC'),('090409','Mollepampa','Castrovirreyna','Huancavelica','AC'),('090410','San Juan','Castrovirreyna','Huancavelica','AC'),('090411','Santa Ana','Castrovirreyna','Huancavelica','AC'),('090412','Tantara','Castrovirreyna','Huancavelica','AC'),('090413','Ticrapo','Castrovirreyna','Huancavelica','AC'),('090501','Churcampa','Churcampa','Huancavelica','AC'),('090502','Anco','Churcampa','Huancavelica','AC'),('090503','Chinchihuasi','Churcampa','Huancavelica','AC'),('090504','El Carmen','Churcampa','Huancavelica','AC'),('090505','La Merced','Churcampa','Huancavelica','AC'),('090506','Locroja','Churcampa','Huancavelica','AC'),('090507','Paucarbamba','Churcampa','Huancavelica','AC'),('090508','San Miguel de Mayocc','Churcampa','Huancavelica','AC'),('090509','San Pedro de Coris','Churcampa','Huancavelica','AC'),('090510','Pachamarca','Churcampa','Huancavelica','AC'),('090511','Cosme','Churcampa','Huancavelica','AC'),('090601','Huaytara','Huaytara','Huancavelica','AC'),('090602','Ayavi','Huaytara','Huancavelica','AC'),('090603','Cordova','Huaytara','Huancavelica','AC'),('090604','Huayacundo Arma','Huaytara','Huancavelica','AC'),('090605','Laramarca','Huaytara','Huancavelica','AC'),('090606','Ocoyo','Huaytara','Huancavelica','AC'),('090607','Pilpichaca','Huaytara','Huancavelica','AC'),('090608','Querco','Huaytara','Huancavelica','AC'),('090609','Quito-Arma','Huaytara','Huancavelica','AC'),('090610','San Antonio de Cusicancha','Huaytara','Huancavelica','AC'),('090611','San Francisco de Sangayaico','Huaytara','Huancavelica','AC'),('090612','San Isidro','Huaytara','Huancavelica','AC'),('090613','Santiago de Chocorvos','Huaytara','Huancavelica','AC'),('090614','Santiago de Quirahuara','Huaytara','Huancavelica','AC'),('090615','Santo Domingo de Capillas','Huaytara','Huancavelica','AC'),('090616','Tambo','Huaytara','Huancavelica','AC'),('090701','Pampas','Tayacaja','Huancavelica','AC'),('090702','Acostambo','Tayacaja','Huancavelica','AC'),('090703','Acraquia','Tayacaja','Huancavelica','AC'),('090704','Ahuaycha','Tayacaja','Huancavelica','AC'),('090705','Colcabamba','Tayacaja','Huancavelica','AC'),('090706','Daniel Hernandez','Tayacaja','Huancavelica','AC'),('090707','Huachocolpa','Tayacaja','Huancavelica','AC'),('090709','Huaribamba','Tayacaja','Huancavelica','AC'),('090710','¥ahuimpuquio','Tayacaja','Huancavelica','AC'),('090711','Pazos','Tayacaja','Huancavelica','AC'),('090713','Quishuar','Tayacaja','Huancavelica','AC'),('090714','Salcabamba','Tayacaja','Huancavelica','AC'),('090715','Salcahuasi','Tayacaja','Huancavelica','AC'),('090716','San Marcos de Rocchac','Tayacaja','Huancavelica','AC'),('090717','Surcubamba','Tayacaja','Huancavelica','AC'),('090718','Tintay Puncu','Tayacaja','Huancavelica','AC'),('090719','Quichuas','Tayacaja','Huancavelica','AC'),('090720','Andaymarca','Tayacaja','Huancavelica','AC'),('090721','Roble','Tayacaja','Huancavelica','AC'),('090722','Pichos','Tayacaja','Huancavelica','AC'),('090723','Santiago de T£cuma','Tayacaja','Huancavelica','AC'),('100101','Huanuco','Huanuco','Huanuco','AC'),('100102','Amarilis','Huanuco','Huanuco','AC'),('100103','Chinchao','Huanuco','Huanuco','AC'),('100104','Churubamba','Huanuco','Huanuco','AC'),('100105','Margos','Huanuco','Huanuco','AC'),('100106','Quisqui','Huanuco','Huanuco','AC'),('100107','San Francisco de Cayran','Huanuco','Huanuco','AC'),('100108','San Pedro de Chaulan','Huanuco','Huanuco','AC'),('100109','Santa Maria del Valle','Huanuco','Huanuco','AC'),('100110','Yarumayo','Huanuco','Huanuco','AC'),('100111','Pillco Marca','Huanuco','Huanuco','AC'),('100112','Yacus','Huanuco','Huanuco','AC'),('100113','San Pablo de Pillao','Huanuco','Huanuco','AC'),('100201','Ambo','Ambo','Huanuco','AC'),('100202','Cayna','Ambo','Huanuco','AC'),('100203','Colpas','Ambo','Huanuco','AC'),('100204','Conchamarca','Ambo','Huanuco','AC'),('100205','Huacar','Ambo','Huanuco','AC'),('100206','San Francisco','Ambo','Huanuco','AC'),('100207','San Rafael','Ambo','Huanuco','AC'),('100208','Tomay Kichwa','Ambo','Huanuco','AC'),('100301','La Union','Dos de Mayo','Huanuco','AC'),('100307','Chuquis','Dos de Mayo','Huanuco','AC'),('100311','Marias','Dos de Mayo','Huanuco','AC'),('100313','Pachas','Dos de Mayo','Huanuco','AC'),('100316','Quivilla','Dos de Mayo','Huanuco','AC'),('100317','Ripan','Dos de Mayo','Huanuco','AC'),('100321','Shunqui','Dos de Mayo','Huanuco','AC'),('100322','Sillapata','Dos de Mayo','Huanuco','AC'),('100323','Yanas','Dos de Mayo','Huanuco','AC'),('100401','Huacaybamba','Huacaybamba','Huanuco','AC'),('100402','Canchabamba','Huacaybamba','Huanuco','AC'),('100403','Cochabamba','Huacaybamba','Huanuco','AC'),('100404','Pinra','Huacaybamba','Huanuco','AC'),('100501','Llata','Huamalies','Huanuco','AC'),('100502','Arancay','Huamalies','Huanuco','AC'),('100503','Chavin de Pariarca','Huamalies','Huanuco','AC'),('100504','Jacas Grande','Huamalies','Huanuco','AC'),('100505','Jircan','Huamalies','Huanuco','AC'),('100506','Miraflores','Huamalies','Huanuco','AC'),('100507','Monzon','Huamalies','Huanuco','AC'),('100508','Punchao','Huamalies','Huanuco','AC'),('100509','Pu¤os','Huamalies','Huanuco','AC'),('100510','Singa','Huamalies','Huanuco','AC'),('100511','Tantamayo','Huamalies','Huanuco','AC'),('100601','Rupa-Rupa','Leoncio Prado','Huanuco','AC'),('100602','Daniel Alomias Robles','Leoncio Prado','Huanuco','AC'),('100603','Hermilio Valdizan','Leoncio Prado','Huanuco','AC'),('100604','Jose Crespo y Castillo','Leoncio Prado','Huanuco','AC'),('100605','Luyando','Leoncio Prado','Huanuco','AC'),('100606','Mariano Damaso Beraun','Leoncio Prado','Huanuco','AC'),('100607','Pucayacu','Leoncio Prado','Huanuco','AC'),('100608','Castillo Grande','Leoncio Prado','Huanuco','AC'),('100609','Pueblo Nuevo','Leoncio Prado','Huanuco','AC'),('100610','Santo Domingo de Anda','Leoncio Prado','Huanuco','AC'),('100701','Huacrachuco','Mara¤on','Huanuco','AC'),('100702','Cholon','Mara¤on','Huanuco','AC'),('100703','San Buenaventura','Mara¤on','Huanuco','AC'),('100704','La Morada','Mara¤on','Huanuco','AC'),('100705','Santa Rosa de Alto Yanajanca','Mara¤on','Huanuco','AC'),('100801','Panao','Pachitea','Huanuco','AC'),('100802','Chaglla','Pachitea','Huanuco','AC'),('100803','Molino','Pachitea','Huanuco','AC'),('100804','Umari','Pachitea','Huanuco','AC'),('100901','Puerto Inca','Puerto Inca','Huanuco','AC'),('100902','Codo del Pozuzo','Puerto Inca','Huanuco','AC'),('100903','Honoria','Puerto Inca','Huanuco','AC'),('100904','Tournavista','Puerto Inca','Huanuco','AC'),('100905','Yuyapichis','Puerto Inca','Huanuco','AC'),('101001','Jesus','Lauricocha','Huanuco','AC'),('101002','Ba¤os','Lauricocha','Huanuco','AC'),('101003','Jivia','Lauricocha','Huanuco','AC'),('101004','Queropalca','Lauricocha','Huanuco','AC'),('101005','Rondos','Lauricocha','Huanuco','AC'),('101006','San Francisco de Asis','Lauricocha','Huanuco','AC'),('101007','San Miguel de Cauri','Lauricocha','Huanuco','AC'),('101101','Chavinillo','Yarowilca','Huanuco','AC'),('101102','Cahuac','Yarowilca','Huanuco','AC'),('101103','Chacabamba','Yarowilca','Huanuco','AC'),('101104','Aparicio Pomares','Yarowilca','Huanuco','AC'),('101105','Jacas Chico','Yarowilca','Huanuco','AC'),('101106','Obas','Yarowilca','Huanuco','AC'),('101107','Pampamarca','Yarowilca','Huanuco','AC'),('101108','Choras','Yarowilca','Huanuco','AC'),('110101','Ica','Ica','Ica','AC'),('110102','La Tingui¤a','Ica','Ica','AC'),('110103','Los Aquijes','Ica','Ica','AC'),('110104','Ocucaje','Ica','Ica','AC'),('110105','Pachacutec','Ica','Ica','AC'),('110106','Parcona','Ica','Ica','AC'),('110107','Pueblo Nuevo','Ica','Ica','AC'),('110108','Salas','Ica','Ica','AC'),('110109','San Jose de los Molinos','Ica','Ica','AC'),('110110','San Juan Bautista','Ica','Ica','AC'),('110111','Santiago','Ica','Ica','AC'),('110112','Subtanjalla','Ica','Ica','AC'),('110113','Tate','Ica','Ica','AC'),('110114','Yauca del Rosario','Ica','Ica','AC'),('110201','Chincha Alta','Chincha','Ica','AC'),('110202','Alto Laran','Chincha','Ica','AC'),('110203','Chavin','Chincha','Ica','AC'),('110204','Chincha Baja','Chincha','Ica','AC'),('110205','El Carmen','Chincha','Ica','AC'),('110206','Grocio Prado','Chincha','Ica','AC'),('110207','Pueblo Nuevo','Chincha','Ica','AC'),('110208','San Juan de Yanac','Chincha','Ica','AC'),('110209','San Pedro de Huacarpana','Chincha','Ica','AC'),('110210','Sunampe','Chincha','Ica','AC'),('110211','Tambo de Mora','Chincha','Ica','AC'),('110301','Nazca','Nazca','Ica','AC'),('110302','Changuillo','Nazca','Ica','AC'),('110303','El Ingenio','Nazca','Ica','AC'),('110304','Marcona','Nazca','Ica','AC'),('110305','Vista Alegre','Nazca','Ica','AC'),('110401','Palpa','Palpa','Ica','AC'),('110402','Llipata','Palpa','Ica','AC'),('110403','Rio Grande','Palpa','Ica','AC'),('110404','Santa Cruz','Palpa','Ica','AC'),('110405','Tibillo','Palpa','Ica','AC'),('110501','Pisco','Pisco','Ica','AC'),('110502','Huancano','Pisco','Ica','AC'),('110503','Humay','Pisco','Ica','AC'),('110504','Independencia','Pisco','Ica','AC'),('110505','Paracas','Pisco','Ica','AC'),('110506','San Andres','Pisco','Ica','AC'),('110507','San Clemente','Pisco','Ica','AC'),('110508','Tupac Amaru Inca','Pisco','Ica','AC'),('120101','Huancayo','Huancayo','Junin','AC'),('120104','Carhuacallanga','Huancayo','Junin','AC'),('120105','Chacapampa','Huancayo','Junin','AC'),('120106','Chicche','Huancayo','Junin','AC'),('120107','Chilca','Huancayo','Junin','AC'),('120108','Chongos Alto','Huancayo','Junin','AC'),('120111','Chupuro','Huancayo','Junin','AC'),('120112','Colca','Huancayo','Junin','AC'),('120113','Cullhuas','Huancayo','Junin','AC'),('120114','El Tambo','Huancayo','Junin','AC'),('120116','Huacrapuquio','Huancayo','Junin','AC'),('120117','Hualhuas','Huancayo','Junin','AC'),('120119','Huancan','Huancayo','Junin','AC'),('120120','Huasicancha','Huancayo','Junin','AC'),('120121','Huayucachi','Huancayo','Junin','AC'),('120122','Ingenio','Huancayo','Junin','AC'),('120124','Pariahuanca','Huancayo','Junin','AC'),('120125','Pilcomayo','Huancayo','Junin','AC'),('120126','Pucara','Huancayo','Junin','AC'),('120127','Quichuay','Huancayo','Junin','AC'),('120128','Quilcas','Huancayo','Junin','AC'),('120129','San Agustin','Huancayo','Junin','AC'),('120130','San Jeronimo de Tunan','Huancayo','Junin','AC'),('120132','Sa¤o','Huancayo','Junin','AC'),('120133','Sapallanga','Huancayo','Junin','AC'),('120134','Sicaya','Huancayo','Junin','AC'),('120135','Santo Domingo de Acobamba','Huancayo','Junin','AC'),('120136','Viques','Huancayo','Junin','AC'),('120201','Concepcion','Concepcion','Junin','AC'),('120202','Aco','Concepcion','Junin','AC'),('120203','Andamarca','Concepcion','Junin','AC'),('120204','Chambara','Concepcion','Junin','AC'),('120205','Cochas','Concepcion','Junin','AC'),('120206','Comas','Concepcion','Junin','AC'),('120207','Heroinas Toledo','Concepcion','Junin','AC'),('120208','Manzanares','Concepcion','Junin','AC'),('120209','Mariscal Castilla','Concepcion','Junin','AC'),('120210','Matahuasi','Concepcion','Junin','AC'),('120211','Mito','Concepcion','Junin','AC'),('120212','Nueve de Julio','Concepcion','Junin','AC'),('120213','Orcotuna','Concepcion','Junin','AC'),('120214','San Jose de Quero','Concepcion','Junin','AC'),('120215','Santa Rosa de Ocopa','Concepcion','Junin','AC'),('120301','Chanchamayo','Chanchamayo','Junin','AC'),('120302','Perene','Chanchamayo','Junin','AC'),('120303','Pichanaqui','Chanchamayo','Junin','AC'),('120304','San Luis de Shuaro','Chanchamayo','Junin','AC'),('120305','San Ramon','Chanchamayo','Junin','AC'),('120306','Vitoc','Chanchamayo','Junin','AC'),('120401','Jauja','Jauja','Junin','AC'),('120402','Acolla','Jauja','Junin','AC'),('120403','Apata','Jauja','Junin','AC'),('120404','Ataura','Jauja','Junin','AC'),('120405','Canchayllo','Jauja','Junin','AC'),('120406','Curicaca','Jauja','Junin','AC'),('120407','El Mantaro','Jauja','Junin','AC'),('120408','Huamali','Jauja','Junin','AC'),('120409','Huaripampa','Jauja','Junin','AC'),('120410','Huertas','Jauja','Junin','AC'),('120411','Janjaillo','Jauja','Junin','AC'),('120412','Julcan','Jauja','Junin','AC'),('120413','Leonor Ordo¤ez','Jauja','Junin','AC'),('120414','Llocllapampa','Jauja','Junin','AC'),('120415','Marco','Jauja','Junin','AC'),('120416','Masma','Jauja','Junin','AC'),('120417','Masma Chicche','Jauja','Junin','AC'),('120418','Molinos','Jauja','Junin','AC'),('120419','Monobamba','Jauja','Junin','AC'),('120420','Muqui','Jauja','Junin','AC'),('120421','Muquiyauyo','Jauja','Junin','AC'),('120422','Paca','Jauja','Junin','AC'),('120423','Paccha','Jauja','Junin','AC'),('120424','Pancan','Jauja','Junin','AC'),('120425','Parco','Jauja','Junin','AC'),('120426','Pomacancha','Jauja','Junin','AC'),('120427','Ricran','Jauja','Junin','AC'),('120428','San Lorenzo','Jauja','Junin','AC'),('120429','San Pedro de Chunan','Jauja','Junin','AC'),('120430','Sausa','Jauja','Junin','AC'),('120431','Sincos','Jauja','Junin','AC'),('120432','Tunan Marca','Jauja','Junin','AC'),('120433','Yauli','Jauja','Junin','AC'),('120434','Yauyos','Jauja','Junin','AC'),('120501','Junin','Junin','Junin','AC'),('120502','Carhuamayo','Junin','Junin','AC'),('120503','Ondores','Junin','Junin','AC'),('120504','Ulcumayo','Junin','Junin','AC'),('120601','Satipo','Satipo','Junin','AC'),('120602','Coviriali','Satipo','Junin','AC'),('120603','Llaylla','Satipo','Junin','AC'),('120604','Mazamari','Satipo','Junin','AC'),('120605','Pampa Hermosa','Satipo','Junin','AC'),('120606','Pangoa','Satipo','Junin','AC'),('120607','Rio Negro','Satipo','Junin','AC'),('120608','Rio Tambo','Satipo','Junin','AC'),('120609','Vizcat n del Ene','Satipo','Junin','AC'),('120701','Tarma','Tarma','Junin','AC'),('120702','Acobamba','Tarma','Junin','AC'),('120703','Huaricolca','Tarma','Junin','AC'),('120704','Huasahuasi','Tarma','Junin','AC'),('120705','La Union','Tarma','Junin','AC'),('120706','Palca','Tarma','Junin','AC'),('120707','Palcamayo','Tarma','Junin','AC'),('120708','San Pedro de Cajas','Tarma','Junin','AC'),('120709','Tapo','Tarma','Junin','AC'),('120801','La Oroya','Yauli','Junin','AC'),('120802','Chacapalpa','Yauli','Junin','AC'),('120803','Huay-Huay','Yauli','Junin','AC'),('120804','Marcapomacocha','Yauli','Junin','AC'),('120805','Morococha','Yauli','Junin','AC'),('120806','Paccha','Yauli','Junin','AC'),('120807','Santa Barbara de Carhuacayan','Yauli','Junin','AC'),('120808','Santa Rosa de Sacco','Yauli','Junin','AC'),('120809','Suitucancha','Yauli','Junin','AC'),('120810','Yauli','Yauli','Junin','AC'),('120901','Chupaca','Chupaca','Junin','AC'),('120902','Ahuac','Chupaca','Junin','AC'),('120903','Chongos Bajo','Chupaca','Junin','AC'),('120904','Huachac','Chupaca','Junin','AC'),('120905','Huamancaca Chico','Chupaca','Junin','AC'),('120906','San Juan de Yscos','Chupaca','Junin','AC'),('120907','San Juan de Jarpa','Chupaca','Junin','AC'),('120908','Tres de Diciembre','Chupaca','Junin','AC'),('120909','Yanacancha','Chupaca','Junin','AC'),('130101','Trujillo','Trujillo','La Libertad','AC'),('130102','El Porvenir','Trujillo','La Libertad','AC'),('130103','Florencia de Mora','Trujillo','La Libertad','AC'),('130104','Huanchaco','Trujillo','La Libertad','AC'),('130105','La Esperanza','Trujillo','La Libertad','AC'),('130106','Laredo','Trujillo','La Libertad','AC'),('130107','Moche','Trujillo','La Libertad','AC'),('130108','Poroto','Trujillo','La Libertad','AC'),('130109','Salaverry','Trujillo','La Libertad','AC'),('130110','Simbal','Trujillo','La Libertad','AC'),('130111','Victor Larco Herrera','Trujillo','La Libertad','AC'),('130201','Ascope','Ascope','La Libertad','AC'),('130202','Chicama','Ascope','La Libertad','AC'),('130203','Chocope','Ascope','La Libertad','AC'),('130204','Magdalena de Cao','Ascope','La Libertad','AC'),('130205','Paijan','Ascope','La Libertad','AC'),('130206','Razuri','Ascope','La Libertad','AC'),('130207','Santiago de Cao','Ascope','La Libertad','AC'),('130208','Casa Grande','Ascope','La Libertad','AC'),('130301','Bolivar','Bolivar','La Libertad','AC'),('130302','Bambamarca','Bolivar','La Libertad','AC'),('130303','Condormarca','Bolivar','La Libertad','AC'),('130304','Longotea','Bolivar','La Libertad','AC'),('130305','Uchumarca','Bolivar','La Libertad','AC'),('130306','Ucuncha','Bolivar','La Libertad','AC'),('130401','Chepen','Chepen','La Libertad','AC'),('130402','Pacanga','Chepen','La Libertad','AC'),('130403','Pueblo Nuevo','Chepen','La Libertad','AC'),('130501','Julcan','Julcan','La Libertad','AC'),('130502','Calamarca','Julcan','La Libertad','AC'),('130503','Carabamba','Julcan','La Libertad','AC'),('130504','Huaso','Julcan','La Libertad','AC'),('130601','Otuzco','Otuzco','La Libertad','AC'),('130602','Agallpampa','Otuzco','La Libertad','AC'),('130604','Charat','Otuzco','La Libertad','AC'),('130605','Huaranchal','Otuzco','La Libertad','AC'),('130606','La Cuesta','Otuzco','La Libertad','AC'),('130608','Mache','Otuzco','La Libertad','AC'),('130610','Paranday','Otuzco','La Libertad','AC'),('130611','Salpo','Otuzco','La Libertad','AC'),('130613','Sinsicap','Otuzco','La Libertad','AC'),('130614','Usquil','Otuzco','La Libertad','AC'),('130701','San Pedro de Lloc','Pacasmayo','La Libertad','AC'),('130702','Guadalupe','Pacasmayo','La Libertad','AC'),('130703','Jequetepeque','Pacasmayo','La Libertad','AC'),('130704','Pacasmayo','Pacasmayo','La Libertad','AC'),('130705','San Jose','Pacasmayo','La Libertad','AC'),('130801','Tayabamba','Pataz','La Libertad','AC'),('130802','Buldibuyo','Pataz','La Libertad','AC'),('130803','Chillia','Pataz','La Libertad','AC'),('130804','Huancaspata','Pataz','La Libertad','AC'),('130805','Huaylillas','Pataz','La Libertad','AC'),('130806','Huayo','Pataz','La Libertad','AC'),('130807','Ongon','Pataz','La Libertad','AC'),('130808','Parcoy','Pataz','La Libertad','AC'),('130809','Pataz','Pataz','La Libertad','AC'),('130810','Pias','Pataz','La Libertad','AC'),('130811','Santiago de Challas','Pataz','La Libertad','AC'),('130812','Taurija','Pataz','La Libertad','AC'),('130813','Urpay','Pataz','La Libertad','AC'),('130901','Huamachuco','Sanchez Carrion','La Libertad','AC'),('130902','Chugay','Sanchez Carrion','La Libertad','AC'),('130903','Cochorco','Sanchez Carrion','La Libertad','AC'),('130904','Curgos','Sanchez Carrion','La Libertad','AC'),('130905','Marcabal','Sanchez Carrion','La Libertad','AC'),('130906','Sanagoran','Sanchez Carrion','La Libertad','AC'),('130907','Sarin','Sanchez Carrion','La Libertad','AC'),('130908','Sartimbamba','Sanchez Carrion','La Libertad','AC'),('131001','Santiago de Chuco','Santiago de Chuco','La Libertad','AC'),('131002','Angasmarca','Santiago de Chuco','La Libertad','AC'),('131003','Cachicadan','Santiago de Chuco','La Libertad','AC'),('131004','Mollebamba','Santiago de Chuco','La Libertad','AC'),('131005','Mollepata','Santiago de Chuco','La Libertad','AC'),('131006','Quiruvilca','Santiago de Chuco','La Libertad','AC'),('131007','Santa Cruz de Chuca','Santiago de Chuco','La Libertad','AC'),('131008','Sitabamba','Santiago de Chuco','La Libertad','AC'),('131101','Cascas','Gran Chimu','La Libertad','AC'),('131102','Lucma','Gran Chimu','La Libertad','AC'),('131103','Compin','Gran Chimu','La Libertad','AC'),('131104','Sayapullo','Gran Chimu','La Libertad','AC'),('131201','Viru','Viru','La Libertad','AC'),('131202','Chao','Viru','La Libertad','AC'),('131203','Guadalupito','Viru','La Libertad','AC'),('140101','Chiclayo','Chiclayo','Lambayeque','AC'),('140102','Chongoyape','Chiclayo','Lambayeque','AC'),('140103','Eten','Chiclayo','Lambayeque','AC'),('140104','Eten Puerto','Chiclayo','Lambayeque','AC'),('140105','Jose Leonardo Ortiz','Chiclayo','Lambayeque','AC'),('140106','La Victoria','Chiclayo','Lambayeque','AC'),('140107','Lagunas','Chiclayo','Lambayeque','AC'),('140108','Monsefu','Chiclayo','Lambayeque','AC'),('140109','Nueva Arica','Chiclayo','Lambayeque','AC'),('140110','Oyotun','Chiclayo','Lambayeque','AC'),('140111','Picsi','Chiclayo','Lambayeque','AC'),('140112','Pimentel','Chiclayo','Lambayeque','AC'),('140113','Reque','Chiclayo','Lambayeque','AC'),('140114','Santa Rosa','Chiclayo','Lambayeque','AC'),('140115','Sa¤a','Chiclayo','Lambayeque','AC'),('140116','Cayalti','Chiclayo','Lambayeque','AC'),('140117','Patapo','Chiclayo','Lambayeque','AC'),('140118','Pomalca','Chiclayo','Lambayeque','AC'),('140119','Pucala','Chiclayo','Lambayeque','AC'),('140120','Tuman','Chiclayo','Lambayeque','AC'),('140201','Ferre¤afe','Ferre¤afe','Lambayeque','AC'),('140202','Ca¤aris','Ferre¤afe','Lambayeque','AC'),('140203','Incahuasi','Ferre¤afe','Lambayeque','AC'),('140204','Manuel Antonio Mesones Muro','Ferre¤afe','Lambayeque','AC'),('140205','Pitipo','Ferre¤afe','Lambayeque','AC'),('140206','Pueblo Nuevo','Ferre¤afe','Lambayeque','AC'),('140301','Lambayeque','Lambayeque','Lambayeque','AC'),('140302','Chochope','Lambayeque','Lambayeque','AC'),('140303','Illimo','Lambayeque','Lambayeque','AC'),('140304','Jayanca','Lambayeque','Lambayeque','AC'),('140305','Mochumi','Lambayeque','Lambayeque','AC'),('140306','Morrope','Lambayeque','Lambayeque','AC'),('140307','Motupe','Lambayeque','Lambayeque','AC'),('140308','Olmos','Lambayeque','Lambayeque','AC'),('140309','Pacora','Lambayeque','Lambayeque','AC'),('140310','Salas','Lambayeque','Lambayeque','AC'),('140311','San Jose','Lambayeque','Lambayeque','AC'),('140312','Tucume','Lambayeque','Lambayeque','AC'),('150101','Lima','Lima','Lima','AC'),('150102','Ancon','Lima','Lima','AC'),('150103','Ate','Lima','Lima','AC'),('150104','Barranco','Lima','Lima','AC'),('150105','Bre¤a','Lima','Lima','AC'),('150106','Carabayllo','Lima','Lima','AC'),('150107','Chaclacayo','Lima','Lima','AC'),('150108','Chorrillos','Lima','Lima','AC'),('150109','Cieneguilla','Lima','Lima','AC'),('150110','Comas','Lima','Lima','AC'),('150111','El Agustino','Lima','Lima','AC'),('150112','Independencia','Lima','Lima','AC'),('150113','Jesus Maria','Lima','Lima','AC'),('150114','La Molina','Lima','Lima','AC'),('150115','La Victoria','Lima','Lima','AC'),('150116','Lince','Lima','Lima','AC'),('150117','Los Olivos','Lima','Lima','AC'),('150118','Lurigancho','Lima','Lima','AC'),('150119','Lurin','Lima','Lima','AC'),('150120','Magdalena del Mar','Lima','Lima','AC'),('150121','Pueblo Libre','Lima','Lima','AC'),('150122','Miraflores','Lima','Lima','AC'),('150123','Pachacamac','Lima','Lima','AC'),('150124','Pucusana','Lima','Lima','AC'),('150125','Puente Piedra','Lima','Lima','AC'),('150126','Punta Hermosa','Lima','Lima','AC'),('150127','Punta Negra','Lima','Lima','AC'),('150128','Rimac','Lima','Lima','AC'),('150129','San Bartolo','Lima','Lima','AC'),('150130','San Borja','Lima','Lima','AC'),('150131','San Isidro','Lima','Lima','AC'),('150132','San Juan de Lurigancho','Lima','Lima','AC'),('150133','San Juan de Miraflores','Lima','Lima','AC'),('150134','San Luis','Lima','Lima','AC'),('150135','San Martin de Porres','Lima','Lima','AC'),('150136','San Miguel','Lima','Lima','AC'),('150137','Santa Anita','Lima','Lima','AC'),('150138','Santa Maria del Mar','Lima','Lima','AC'),('150139','Santa Rosa','Lima','Lima','AC'),('150140','Santiago de Surco','Lima','Lima','AC'),('150141','Surquillo','Lima','Lima','AC'),('150142','Villa El Salvador','Lima','Lima','AC'),('150143','Villa Maria del Triunfo','Lima','Lima','AC'),('150201','Barranca','Barranca','Lima','AC'),('150202','Paramonga','Barranca','Lima','AC'),('150203','Pativilca','Barranca','Lima','AC'),('150204','Supe','Barranca','Lima','AC'),('150205','Supe Puerto','Barranca','Lima','AC'),('150301','Cajatambo','Cajatambo','Lima','AC'),('150302','Copa','Cajatambo','Lima','AC'),('150303','Gorgor','Cajatambo','Lima','AC'),('150304','Huancapon','Cajatambo','Lima','AC'),('150305','Manas','Cajatambo','Lima','AC'),('150401','Canta','Canta','Lima','AC'),('150402','Arahuay','Canta','Lima','AC'),('150403','Huamantanga','Canta','Lima','AC'),('150404','Huaros','Canta','Lima','AC'),('150405','Lachaqui','Canta','Lima','AC'),('150406','San Buenaventura','Canta','Lima','AC'),('150407','Santa Rosa de Quives','Canta','Lima','AC'),('150501','San Vicente de Ca¤ete','Ca¤ete','Lima','AC'),('150502','Asia','Ca¤ete','Lima','AC'),('150503','Calango','Ca¤ete','Lima','AC'),('150504','Cerro Azul','Ca¤ete','Lima','AC'),('150505','Chilca','Ca¤ete','Lima','AC'),('150506','Coayllo','Ca¤ete','Lima','AC'),('150507','Imperial','Ca¤ete','Lima','AC'),('150508','Lunahuana','Ca¤ete','Lima','AC'),('150509','Mala','Ca¤ete','Lima','AC'),('150510','Nuevo Imperial','Ca¤ete','Lima','AC'),('150511','Pacaran','Ca¤ete','Lima','AC'),('150512','Quilmana','Ca¤ete','Lima','AC'),('150513','San Antonio','Ca¤ete','Lima','AC'),('150514','San Luis','Ca¤ete','Lima','AC'),('150515','Santa Cruz de Flores','Ca¤ete','Lima','AC'),('150516','Zu¤iga','Ca¤ete','Lima','AC'),('150601','Huaral','Huaral','Lima','AC'),('150602','Atavillos Alto','Huaral','Lima','AC'),('150603','Atavillos Bajo','Huaral','Lima','AC'),('150604','Aucallama','Huaral','Lima','AC'),('150605','Chancay','Huaral','Lima','AC'),('150606','Ihuari','Huaral','Lima','AC'),('150607','Lampian','Huaral','Lima','AC'),('150608','Pacaraos','Huaral','Lima','AC'),('150609','San Miguel de Acos','Huaral','Lima','AC'),('150610','Santa Cruz de Andamarca','Huaral','Lima','AC'),('150611','Sumbilca','Huaral','Lima','AC'),('150612','Veintisiete de Noviembre','Huaral','Lima','AC'),('150701','Matucana','Huarochiri','Lima','AC'),('150702','Antioquia','Huarochiri','Lima','AC'),('150703','Callahuanca','Huarochiri','Lima','AC'),('150704','Carampoma','Huarochiri','Lima','AC'),('150705','Chicla','Huarochiri','Lima','AC'),('150706','Cuenca','Huarochiri','Lima','AC'),('150707','Huachupampa','Huarochiri','Lima','AC'),('150708','Huanza','Huarochiri','Lima','AC'),('150709','Huarochiri','Huarochiri','Lima','AC'),('150710','Lahuaytambo','Huarochiri','Lima','AC'),('150711','Langa','Huarochiri','Lima','AC'),('150712','Laraos','Huarochiri','Lima','AC'),('150713','Mariatana','Huarochiri','Lima','AC'),('150714','Ricardo Palma','Huarochiri','Lima','AC'),('150715','San Andres de Tupicocha','Huarochiri','Lima','AC'),('150716','San Antonio','Huarochiri','Lima','AC'),('150717','San Bartolome','Huarochiri','Lima','AC'),('150718','San Damian','Huarochiri','Lima','AC'),('150719','San Juan de Iris','Huarochiri','Lima','AC'),('150720','San Juan de Tantaranche','Huarochiri','Lima','AC'),('150721','San Lorenzo de Quinti','Huarochiri','Lima','AC'),('150722','San Mateo','Huarochiri','Lima','AC'),('150723','San Mateo de Otao','Huarochiri','Lima','AC'),('150724','San Pedro de Casta','Huarochiri','Lima','AC'),('150725','San Pedro de Huancayre','Huarochiri','Lima','AC'),('150726','Sangallaya','Huarochiri','Lima','AC'),('150727','Santa Cruz de Cocachacra','Huarochiri','Lima','AC'),('150728','Santa Eulalia','Huarochiri','Lima','AC'),('150729','Santiago de Anchucaya','Huarochiri','Lima','AC'),('150730','Santiago de Tuna','Huarochiri','Lima','AC'),('150731','Santo Domingo de los Olleros','Huarochiri','Lima','AC'),('150732','Surco','Huarochiri','Lima','AC'),('150801','Huacho','Huaura','Lima','AC'),('150802','Ambar','Huaura','Lima','AC'),('150803','Caleta de Carquin','Huaura','Lima','AC'),('150804','Checras','Huaura','Lima','AC'),('150805','Hualmay','Huaura','Lima','AC'),('150806','Huaura','Huaura','Lima','AC'),('150807','Leoncio Prado','Huaura','Lima','AC'),('150808','Paccho','Huaura','Lima','AC'),('150809','Santa Leonor','Huaura','Lima','AC'),('150810','Santa Maria','Huaura','Lima','AC'),('150811','Sayan','Huaura','Lima','AC'),('150812','Vegueta','Huaura','Lima','AC'),('150901','Oyon','Oyon','Lima','AC'),('150902','Andajes','Oyon','Lima','AC'),('150903','Caujul','Oyon','Lima','AC'),('150904','Cochamarca','Oyon','Lima','AC'),('150905','Navan','Oyon','Lima','AC'),('150906','Pachangara','Oyon','Lima','AC'),('151001','Yauyos','Yauyos','Lima','AC'),('151002','Alis','Yauyos','Lima','AC'),('151003','Ayauca','Yauyos','Lima','AC'),('151004','Ayaviri','Yauyos','Lima','AC'),('151005','Azangaro','Yauyos','Lima','AC'),('151006','Cacra','Yauyos','Lima','AC'),('151007','Carania','Yauyos','Lima','AC'),('151008','Catahuasi','Yauyos','Lima','AC'),('151009','Chocos','Yauyos','Lima','AC'),('151010','Cochas','Yauyos','Lima','AC'),('151011','Colonia','Yauyos','Lima','AC'),('151012','Hongos','Yauyos','Lima','AC'),('151013','Huampara','Yauyos','Lima','AC'),('151014','Huancaya','Yauyos','Lima','AC'),('151015','Huangascar','Yauyos','Lima','AC'),('151016','Huantan','Yauyos','Lima','AC'),('151017','Hua¤ec','Yauyos','Lima','AC'),('151018','Laraos','Yauyos','Lima','AC'),('151019','Lincha','Yauyos','Lima','AC'),('151020','Madean','Yauyos','Lima','AC'),('151021','Miraflores','Yauyos','Lima','AC'),('151022','Omas','Yauyos','Lima','AC'),('151023','Putinza','Yauyos','Lima','AC'),('151024','Quinches','Yauyos','Lima','AC'),('151025','Quinocay','Yauyos','Lima','AC'),('151026','San Joaquin','Yauyos','Lima','AC'),('151027','San Pedro de Pilas','Yauyos','Lima','AC'),('151028','Tanta','Yauyos','Lima','AC'),('151029','Tauripampa','Yauyos','Lima','AC'),('151030','Tomas','Yauyos','Lima','AC'),('151031','Tupe','Yauyos','Lima','AC'),('151032','Vi¤ac','Yauyos','Lima','AC'),('151033','Vitis','Yauyos','Lima','AC'),('160101','Iquitos','Maynas','Loreto','AC'),('160102','Alto Nanay','Maynas','Loreto','AC'),('160103','Fernando Lores','Maynas','Loreto','AC'),('160104','Indiana','Maynas','Loreto','AC'),('160105','Las Amazonas','Maynas','Loreto','AC'),('160106','Mazan','Maynas','Loreto','AC'),('160107','Napo','Maynas','Loreto','AC'),('160108','Punchana','Maynas','Loreto','AC'),('160110','Torres Causana','Maynas','Loreto','AC'),('160112','Belen','Maynas','Loreto','AC'),('160113','San Juan Bautista','Maynas','Loreto','AC'),('160201','Yurimaguas','Alto Amazonas','Loreto','AC'),('160202','Balsapuerto','Alto Amazonas','Loreto','AC'),('160205','Jeberos','Alto Amazonas','Loreto','AC'),('160206','Lagunas','Alto Amazonas','Loreto','AC'),('160210','Santa Cruz','Alto Amazonas','Loreto','AC'),('160211','Teniente Cesar Lopez Rojas','Alto Amazonas','Loreto','AC'),('160301','Nauta','Loreto','Loreto','AC'),('160302','Parinari','Loreto','Loreto','AC'),('160303','Tigre','Loreto','Loreto','AC'),('160304','Trompeteros','Loreto','Loreto','AC'),('160305','Urarinas','Loreto','Loreto','AC'),('160401','Ramon Castilla','Mariscal Ramon Castilla','Loreto','AC'),('160402','Pebas','Mariscal Ramon Castilla','Loreto','AC'),('160403','Yavari','Mariscal Ramon Castilla','Loreto','AC'),('160404','San Pablo','Mariscal Ramon Castilla','Loreto','AC'),('160501','Requena','Requena','Loreto','AC'),('160502','Alto Tapiche','Requena','Loreto','AC'),('160503','Capelo','Requena','Loreto','AC'),('160504','Emilio San Martin','Requena','Loreto','AC'),('160505','Maquia','Requena','Loreto','AC'),('160506','Puinahua','Requena','Loreto','AC'),('160507','Saquena','Requena','Loreto','AC'),('160508','Soplin','Requena','Loreto','AC'),('160509','Tapiche','Requena','Loreto','AC'),('160510','Jenaro Herrera','Requena','Loreto','AC'),('160511','Yaquerana','Requena','Loreto','AC'),('160601','Contamana','Ucayali','Loreto','AC'),('160602','Inahuaya','Ucayali','Loreto','AC'),('160603','Padre Marquez','Ucayali','Loreto','AC'),('160604','Pampa Hermosa','Ucayali','Loreto','AC'),('160605','Sarayacu','Ucayali','Loreto','AC'),('160606','Vargas Guerra','Ucayali','Loreto','AC'),('160701','Barranca','Datem del Mara¤on','Loreto','AC'),('160702','Cahuapanas','Datem del Mara¤on','Loreto','AC'),('160703','Manseriche','Datem del Mara¤on','Loreto','AC'),('160704','Morona','Datem del Mara¤on','Loreto','AC'),('160705','Pastaza','Datem del Mara¤on','Loreto','AC'),('160706','Andoas','Datem del Mara¤on','Loreto','AC'),('160801','Putumayo','Maynas','Loreto','AC'),('160802','Rosa Panduro','Maynas','Loreto','AC'),('160803','Teniente Manuel Clavero','Maynas','Loreto','AC'),('160804','Yaguas','Maynas','Loreto','AC'),('170101','Tambopata','Tambopata','Madre de Dios','AC'),('170102','Inambari','Tambopata','Madre de Dios','AC'),('170103','Las Piedras','Tambopata','Madre de Dios','AC'),('170104','Laberinto','Tambopata','Madre de Dios','AC'),('170201','Manu','Manu','Madre de Dios','AC'),('170202','Fitzcarrald','Manu','Madre de Dios','AC'),('170203','Madre de Dios','Manu','Madre de Dios','AC'),('170204','Huepetuhe','Manu','Madre de Dios','AC'),('170301','I¤apari','Tahuamanu','Madre de Dios','AC'),('170302','Iberia','Tahuamanu','Madre de Dios','AC'),('170303','Tahuamanu','Tahuamanu','Madre de Dios','AC'),('180101','Moquegua','Mariscal Nieto','Moquegua','AC'),('180102','Carumas','Mariscal Nieto','Moquegua','AC'),('180103','Cuchumbaya','Mariscal Nieto','Moquegua','AC'),('180104','Samegua','Mariscal Nieto','Moquegua','AC'),('180105','San Cristobal','Mariscal Nieto','Moquegua','AC'),('180106','Torata','Mariscal Nieto','Moquegua','AC'),('180201','Omate','General Sanchez Cerr','Moquegua','AC'),('180202','Chojata','General Sanchez Cerr','Moquegua','AC'),('180203','Coalaque','General Sanchez Cerr','Moquegua','AC'),('180204','Ichu¤a','General Sanchez Cerr','Moquegua','AC'),('180205','La Capilla','General Sanchez Cerr','Moquegua','AC'),('180206','Lloque','General Sanchez Cerr','Moquegua','AC'),('180207','Matalaque','General Sanchez Cerr','Moquegua','AC'),('180208','Puquina','General Sanchez Cerr','Moquegua','AC'),('180209','Quinistaquillas','General Sanchez Cerr','Moquegua','AC'),('180210','Ubinas','General Sanchez Cerr','Moquegua','AC'),('180211','Yunga','General Sanchez Cerr','Moquegua','AC'),('180301','Ilo','Ilo','Moquegua','AC'),('180302','El Algarrobal','Ilo','Moquegua','AC'),('180303','Pacocha','Ilo','Moquegua','AC'),('190101','Chaupimarca','Pasco','Pasco','AC'),('190102','Huachon','Pasco','Pasco','AC'),('190103','Huariaca','Pasco','Pasco','AC'),('190104','Huayllay','Pasco','Pasco','AC'),('190105','Ninacaca','Pasco','Pasco','AC'),('190106','Pallanchacra','Pasco','Pasco','AC'),('190107','Paucartambo','Pasco','Pasco','AC'),('190108','San Francisco de Asis de Yarusyacan','Pasco','Pasco','AC'),('190109','Simon Bolivar','Pasco','Pasco','AC'),('190110','Ticlacayan','Pasco','Pasco','AC'),('190111','Tinyahuarco','Pasco','Pasco','AC'),('190112','Vicco','Pasco','Pasco','AC'),('190113','Yanacancha','Pasco','Pasco','AC'),('190201','Yanahuanca','Daniel Alcides Carri','Pasco','AC'),('190202','Chacayan','Daniel Alcides Carri','Pasco','AC'),('190203','Goyllarisquizga','Daniel Alcides Carri','Pasco','AC'),('190204','Paucar','Daniel Alcides Carri','Pasco','AC'),('190205','San Pedro de Pillao','Daniel Alcides Carri','Pasco','AC'),('190206','Santa Ana de Tusi','Daniel Alcides Carri','Pasco','AC'),('190207','Tapuc','Daniel Alcides Carri','Pasco','AC'),('190208','Vilcabamba','Daniel Alcides Carri','Pasco','AC'),('190301','Oxapampa','Oxapampa','Pasco','AC'),('190302','Chontabamba','Oxapampa','Pasco','AC'),('190303','Huancabamba','Oxapampa','Pasco','AC'),('190304','Palcazu','Oxapampa','Pasco','AC'),('190305','Pozuzo','Oxapampa','Pasco','AC'),('190306','Puerto Bermudez','Oxapampa','Pasco','AC'),('190307','Villa Rica','Oxapampa','Pasco','AC'),('190308','Constituci¢n','Oxapampa','Pasco','AC'),('200101','Piura','Piura','Piura','AC'),('200104','Castilla','Piura','Piura','AC'),('200105','Catacaos','Piura','Piura','AC'),('200107','Cura Mori','Piura','Piura','AC'),('200108','El Tallan','Piura','Piura','AC'),('200109','La Arena','Piura','Piura','AC'),('200110','La Union','Piura','Piura','AC'),('200111','Las Lomas','Piura','Piura','AC'),('200114','Tambo Grande','Piura','Piura','AC'),('200115','26 de Octubre','Piura','Piura','AC'),('200201','Ayabaca','Ayabaca','Piura','AC'),('200202','Frias','Ayabaca','Piura','AC'),('200203','Jilili','Ayabaca','Piura','AC'),('200204','Lagunas','Ayabaca','Piura','AC'),('200205','Montero','Ayabaca','Piura','AC'),('200206','Pacaipampa','Ayabaca','Piura','AC'),('200207','Paimas','Ayabaca','Piura','AC'),('200208','Sapillica','Ayabaca','Piura','AC'),('200209','Sicchez','Ayabaca','Piura','AC'),('200210','Suyo','Ayabaca','Piura','AC'),('200301','Huancabamba','Huancabamba','Piura','AC'),('200302','Canchaque','Huancabamba','Piura','AC'),('200303','El Carmen de La Frontera','Huancabamba','Piura','AC'),('200304','Huarmaca','Huancabamba','Piura','AC'),('200305','Lalaquiz','Huancabamba','Piura','AC'),('200306','San Miguel de El Faique','Huancabamba','Piura','AC'),('200307','Sondor','Huancabamba','Piura','AC'),('200308','Sondorillo','Huancabamba','Piura','AC'),('200401','Chulucanas','Morropon','Piura','AC'),('200402','Buenos Aires','Morropon','Piura','AC'),('200403','Chalaco','Morropon','Piura','AC'),('200404','La Matanza','Morropon','Piura','AC'),('200405','Morropon','Morropon','Piura','AC'),('200406','Salitral','Morropon','Piura','AC'),('200407','San Juan de Bigote','Morropon','Piura','AC'),('200408','Santa Catalina de Mossa','Morropon','Piura','AC'),('200409','Santo Domingo','Morropon','Piura','AC'),('200410','Yamango','Morropon','Piura','AC'),('200501','Paita','Paita','Piura','AC'),('200502','Amotape','Paita','Piura','AC'),('200503','Arenal','Paita','Piura','AC'),('200504','Colan','Paita','Piura','AC'),('200505','La Huaca','Paita','Piura','AC'),('200506','Tamarindo','Paita','Piura','AC'),('200507','Vichayal','Paita','Piura','AC'),('200601','Sullana','Sullana','Piura','AC'),('200602','Bellavista','Sullana','Piura','AC'),('200603','Ignacio Escudero','Sullana','Piura','AC'),('200604','Lancones','Sullana','Piura','AC'),('200605','Marcavelica','Sullana','Piura','AC'),('200606','Miguel Checa','Sullana','Piura','AC'),('200607','Querecotillo','Sullana','Piura','AC'),('200608','Salitral','Sullana','Piura','AC'),('200701','Pari¤as','Talara','Piura','AC'),('200702','El Alto','Talara','Piura','AC'),('200703','La Brea','Talara','Piura','AC'),('200704','Lobitos','Talara','Piura','AC'),('200705','Los Organos','Talara','Piura','AC'),('200706','Mancora','Talara','Piura','AC'),('200801','Sechura','Sechura','Piura','AC'),('200802','Bellavista de La Union','Sechura','Piura','AC'),('200803','Bernal','Sechura','Piura','AC'),('200804','Cristo Nos Valga','Sechura','Piura','AC'),('200805','Vice','Sechura','Piura','AC'),('200806','Rinconada Llicuar','Sechura','Piura','AC'),('210101','Puno','Puno','Puno','AC'),('210102','Acora','Puno','Puno','AC'),('210103','Amantani','Puno','Puno','AC'),('210104','Atuncolla','Puno','Puno','AC'),('210105','Capachica','Puno','Puno','AC'),('210106','Chucuito','Puno','Puno','AC'),('210107','Coata','Puno','Puno','AC'),('210108','Huata','Puno','Puno','AC'),('210109','Ma¤azo','Puno','Puno','AC'),('210110','Paucarcolla','Puno','Puno','AC'),('210111','Pichacani','Puno','Puno','AC'),('210112','Plateria','Puno','Puno','AC'),('210113','San Antonio','Puno','Puno','AC'),('210114','Tiquillaca','Puno','Puno','AC'),('210115','Vilque','Puno','Puno','AC'),('210201','Azangaro','Azangaro','Puno','AC'),('210202','Achaya','Azangaro','Puno','AC'),('210203','Arapa','Azangaro','Puno','AC'),('210204','Asillo','Azangaro','Puno','AC'),('210205','Caminaca','Azangaro','Puno','AC'),('210206','Chupa','Azangaro','Puno','AC'),('210207','Jose Domingo Choquehuanca','Azangaro','Puno','AC'),('210208','Mu¤ani','Azangaro','Puno','AC'),('210209','Potoni','Azangaro','Puno','AC'),('210210','Saman','Azangaro','Puno','AC'),('210211','San Anton','Azangaro','Puno','AC'),('210212','San Jose','Azangaro','Puno','AC'),('210213','San Juan de Salinas','Azangaro','Puno','AC'),('210214','Santiago de Pupuja','Azangaro','Puno','AC'),('210215','Tirapata','Azangaro','Puno','AC'),('210301','Macusani','Carabaya','Puno','AC'),('210302','Ajoyani','Carabaya','Puno','AC'),('210303','Ayapata','Carabaya','Puno','AC'),('210304','Coasa','Carabaya','Puno','AC'),('210305','Corani','Carabaya','Puno','AC'),('210306','Crucero','Carabaya','Puno','AC'),('210307','Ituata','Carabaya','Puno','AC'),('210308','Ollachea','Carabaya','Puno','AC'),('210309','San Gaban','Carabaya','Puno','AC'),('210310','Usicayos','Carabaya','Puno','AC'),('210401','Juli','Chucuito','Puno','AC'),('210402','Desaguadero','Chucuito','Puno','AC'),('210403','Huacullani','Chucuito','Puno','AC'),('210404','Kelluyo','Chucuito','Puno','AC'),('210405','Pisacoma','Chucuito','Puno','AC'),('210406','Pomata','Chucuito','Puno','AC'),('210407','Zepita','Chucuito','Puno','AC'),('210501','Ilave','El Collao','Puno','AC'),('210502','Capazo','El Collao','Puno','AC'),('210503','Pilcuyo','El Collao','Puno','AC'),('210504','Santa Rosa','El Collao','Puno','AC'),('210505','Conduriri','El Collao','Puno','AC'),('210601','Huancane','Huancane','Puno','AC'),('210602','Cojata','Huancane','Puno','AC'),('210603','Huatasani','Huancane','Puno','AC'),('210604','Inchupalla','Huancane','Puno','AC'),('210605','Pusi','Huancane','Puno','AC'),('210606','Rosaspata','Huancane','Puno','AC'),('210607','Taraco','Huancane','Puno','AC'),('210608','Vilque Chico','Huancane','Puno','AC'),('210701','Lampa','Lampa','Puno','AC'),('210702','Cabanilla','Lampa','Puno','AC'),('210703','Calapuja','Lampa','Puno','AC'),('210704','Nicasio','Lampa','Puno','AC'),('210705','Ocuviri','Lampa','Puno','AC'),('210706','Palca','Lampa','Puno','AC'),('210707','Paratia','Lampa','Puno','AC'),('210708','Pucara','Lampa','Puno','AC'),('210709','Santa Lucia','Lampa','Puno','AC'),('210710','Vilavila','Lampa','Puno','AC'),('210801','Ayaviri','Melgar','Puno','AC'),('210802','Antauta','Melgar','Puno','AC'),('210803','Cupi','Melgar','Puno','AC'),('210804','Llalli','Melgar','Puno','AC'),('210805','Macari','Melgar','Puno','AC'),('210806','Nu¤oa','Melgar','Puno','AC'),('210807','Orurillo','Melgar','Puno','AC'),('210808','Santa Rosa','Melgar','Puno','AC'),('210809','Umachiri','Melgar','Puno','AC'),('210901','Moho','Moho','Puno','AC'),('210902','Conima','Moho','Puno','AC'),('210903','Huayrapata','Moho','Puno','AC'),('210904','Tilali','Moho','Puno','AC'),('211001','Putina','San Antonio de Putin','Puno','AC'),('211002','Ananea','San Antonio de Putin','Puno','AC'),('211003','Pedro Vilca Apaza','San Antonio de Putin','Puno','AC'),('211004','Quilcapuncu','San Antonio de Putin','Puno','AC'),('211005','Sina','San Antonio de Putin','Puno','AC'),('211101','Juliaca','San Roman','Puno','AC'),('211102','Cabana','San Roman','Puno','AC'),('211103','Cabanillas','San Roman','Puno','AC'),('211104','Caracoto','San Roman','Puno','AC'),('211105','San Miguel','San Roman','Puno','AC'),('211201','Sandia','Sandia','Puno','AC'),('211202','Cuyocuyo','Sandia','Puno','AC'),('211203','Limbani','Sandia','Puno','AC'),('211204','Patambuco','Sandia','Puno','AC'),('211205','Phara','Sandia','Puno','AC'),('211206','Quiaca','Sandia','Puno','AC'),('211207','San Juan del Oro','Sandia','Puno','AC'),('211208','Yanahuaya','Sandia','Puno','AC'),('211209','Alto Inambari','Sandia','Puno','AC'),('211210','San Pedro de Putina Punco','Sandia','Puno','AC'),('211301','Yunguyo','Yunguyo','Puno','AC'),('211302','Anapia','Yunguyo','Puno','AC'),('211303','Copani','Yunguyo','Puno','AC'),('211304','Cuturapi','Yunguyo','Puno','AC'),('211305','Ollaraya','Yunguyo','Puno','AC'),('211306','Tinicachi','Yunguyo','Puno','AC'),('211307','Unicachi','Yunguyo','Puno','AC'),('220101','Moyobamba','Moyobamba','San Martin','AC'),('220102','Calzada','Moyobamba','San Martin','AC'),('220103','Habana','Moyobamba','San Martin','AC'),('220104','Jepelacio','Moyobamba','San Martin','AC'),('220105','Soritor','Moyobamba','San Martin','AC'),('220106','Yantalo','Moyobamba','San Martin','AC'),('220201','Bellavista','Bellavista','San Martin','AC'),('220202','Alto Biavo','Bellavista','San Martin','AC'),('220203','Bajo Biavo','Bellavista','San Martin','AC'),('220204','Huallaga','Bellavista','San Martin','AC'),('220205','San Pablo','Bellavista','San Martin','AC'),('220206','San Rafael','Bellavista','San Martin','AC'),('220301','San Jose de Sisa','El Dorado','San Martin','AC'),('220302','Agua Blanca','El Dorado','San Martin','AC'),('220303','San Martin','El Dorado','San Martin','AC'),('220304','Santa Rosa','El Dorado','San Martin','AC'),('220305','Shatoja','El Dorado','San Martin','AC'),('220401','Saposoa','Huallaga','San Martin','AC'),('220402','Alto Saposoa','Huallaga','San Martin','AC'),('220403','El Eslabon','Huallaga','San Martin','AC'),('220404','Piscoyacu','Huallaga','San Martin','AC'),('220405','Sacanche','Huallaga','San Martin','AC'),('220406','Tingo de Saposoa','Huallaga','San Martin','AC'),('220501','Lamas','Lamas','San Martin','AC'),('220502','Alonso de Alvarado','Lamas','San Martin','AC'),('220503','Barranquita','Lamas','San Martin','AC'),('220504','Caynarachi','Lamas','San Martin','AC'),('220505','Cu¤umbuqui','Lamas','San Martin','AC'),('220506','Pinto Recodo','Lamas','San Martin','AC'),('220507','Rumisapa','Lamas','San Martin','AC'),('220508','San Roque de Cumbaza','Lamas','San Martin','AC'),('220509','Shanao','Lamas','San Martin','AC'),('220510','Tabalosos','Lamas','San Martin','AC'),('220511','Zapatero','Lamas','San Martin','AC'),('220601','Juanjui','Mariscal Caceres','San Martin','AC'),('220602','Campanilla','Mariscal Caceres','San Martin','AC'),('220603','Huicungo','Mariscal Caceres','San Martin','AC'),('220604','Pachiza','Mariscal Caceres','San Martin','AC'),('220605','Pajarillo','Mariscal Caceres','San Martin','AC'),('220701','Picota','Picota','San Martin','AC'),('220702','Buenos Aires','Picota','San Martin','AC'),('220703','Caspisapa','Picota','San Martin','AC'),('220704','Pilluana','Picota','San Martin','AC'),('220705','Pucacaca','Picota','San Martin','AC'),('220706','San Cristobal','Picota','San Martin','AC'),('220707','San Hilarion','Picota','San Martin','AC'),('220708','Shamboyacu','Picota','San Martin','AC'),('220709','Tingo de Ponasa','Picota','San Martin','AC'),('220710','Tres Unidos','Picota','San Martin','AC'),('220801','Rioja','Rioja','San Martin','AC'),('220802','Awajun','Rioja','San Martin','AC'),('220803','Elias Soplin Vargas','Rioja','San Martin','AC'),('220804','Nueva Cajamarca','Rioja','San Martin','AC'),('220805','Pardo Miguel','Rioja','San Martin','AC'),('220806','Posic','Rioja','San Martin','AC'),('220807','San Fernando','Rioja','San Martin','AC'),('220808','Yorongos','Rioja','San Martin','AC'),('220809','Yuracyacu','Rioja','San Martin','AC'),('220901','Tarapoto','San Martin','San Martin','AC'),('220902','Alberto Leveau','San Martin','San Martin','AC'),('220903','Cacatachi','San Martin','San Martin','AC'),('220904','Chazuta','San Martin','San Martin','AC'),('220905','Chipurana','San Martin','San Martin','AC'),('220906','El Porvenir','San Martin','San Martin','AC'),('220907','Huimbayoc','San Martin','San Martin','AC'),('220908','Juan Guerra','San Martin','San Martin','AC'),('220909','La Banda de Shilcayo','San Martin','San Martin','AC'),('220910','Morales','San Martin','San Martin','AC'),('220911','Papaplaya','San Martin','San Martin','AC'),('220912','San Antonio','San Martin','San Martin','AC'),('220913','Sauce','San Martin','San Martin','AC'),('220914','Shapaja','San Martin','San Martin','AC'),('221001','Tocache','Tocache','San Martin','AC'),('221002','Nuevo Progreso','Tocache','San Martin','AC'),('221003','Polvora','Tocache','San Martin','AC'),('221004','Shunte','Tocache','San Martin','AC'),('221005','Uchiza','Tocache','San Martin','AC'),('230101','Tacna','Tacna','Tacna','AC'),('230102','Alto de La Alianza','Tacna','Tacna','AC'),('230103','Calana','Tacna','Tacna','AC'),('230104','Ciudad Nueva','Tacna','Tacna','AC'),('230105','Inclan','Tacna','Tacna','AC'),('230106','Pachia','Tacna','Tacna','AC'),('230107','Palca','Tacna','Tacna','AC'),('230108','Pocollay','Tacna','Tacna','AC'),('230109','Sama','Tacna','Tacna','AC'),('230110','Coronel Gregorio Albarracin Lanchipa','Tacna','Tacna','AC'),('230111','La Yarada-Los Palos','Tacna','Tacna','AC'),('230201','Candarave','Candarave','Tacna','AC'),('230202','Cairani','Candarave','Tacna','AC'),('230203','Camilaca','Candarave','Tacna','AC'),('230204','Curibaya','Candarave','Tacna','AC'),('230205','Huanuara','Candarave','Tacna','AC'),('230206','Quilahuani','Candarave','Tacna','AC'),('230301','Locumba','Jorge Basadre','Tacna','AC'),('230302','Ilabaya','Jorge Basadre','Tacna','AC'),('230303','Ite','Jorge Basadre','Tacna','AC'),('230401','Tarata','Tarata','Tacna','AC'),('230402','Heroes Albarracin','Tarata','Tacna','AC'),('230403','Estique','Tarata','Tacna','AC'),('230404','Estique-Pampa','Tarata','Tacna','AC'),('230405','Sitajara','Tarata','Tacna','AC'),('230406','Susapaya','Tarata','Tacna','AC'),('230407','Tarucachi','Tarata','Tacna','AC'),('230408','Ticaco','Tarata','Tacna','AC'),('240101','Tumbes','Tumbes','Tumbes','AC'),('240102','Corrales','Tumbes','Tumbes','AC'),('240103','La Cruz','Tumbes','Tumbes','AC'),('240104','Pampas de Hospital','Tumbes','Tumbes','AC'),('240105','San Jacinto','Tumbes','Tumbes','AC'),('240106','San Juan de La Virgen','Tumbes','Tumbes','AC'),('240201','Zorritos','Contralmirante Villa','Tumbes','AC'),('240202','Casitas','Contralmirante Villa','Tumbes','AC'),('240203','Canoas de Punta Sal','Contralmirante Villa','Tumbes','AC'),('240301','Zarumilla','Zarumilla','Tumbes','AC'),('240302','Aguas Verdes','Zarumilla','Tumbes','AC'),('240303','Matapalo','Zarumilla','Tumbes','AC'),('240304','Papayal','Zarumilla','Tumbes','AC'),('250101','Calleria','Coronel Portillo','Ucayali','AC'),('250102','Campoverde','Coronel Portillo','Ucayali','AC'),('250103','Iparia','Coronel Portillo','Ucayali','AC'),('250104','Masisea','Coronel Portillo','Ucayali','AC'),('250105','Yarinacocha','Coronel Portillo','Ucayali','AC'),('250106','Nueva Requena','Coronel Portillo','Ucayali','AC'),('250107','Manantay','Coronel Portillo','Ucayali','AC'),('250201','Raymondi','Atalaya','Ucayali','AC'),('250202','Sepahua','Atalaya','Ucayali','AC'),('250203','Tahuania','Atalaya','Ucayali','AC'),('250204','Yurua','Atalaya','Ucayali','AC'),('250301','Padre Abad','Padre Abad','Ucayali','AC'),('250302','Irazola','Padre Abad','Ucayali','AC'),('250303','Curimana','Padre Abad','Ucayali','AC'),('250304','Neshuya','Padre Abad','Ucayali','AC'),('250305','Alexander von Humboldt','Padre Abad','Ucayali','AC'),('250401','Purus','Purus','Ucayali','AC');
/*!40000 ALTER TABLE `ubigeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'PIEZA',1),(2,'LIBRAS',1);
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `nombre_usuario` varchar(64) NOT NULL,
  `clave` varchar(64) DEFAULT NULL,
  `rol` int(11) NOT NULL DEFAULT 1,
  `id_membresia` int(11) NOT NULL DEFAULT 1,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `usuario_registro` int(11) NOT NULL DEFAULT 1,
  `usuario_actualizacion` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  KEY `id_persona` (`id_persona`),
  KEY `usuario_registro` (`usuario_registro`),
  KEY `usuario_actualizacion` (`usuario_actualizacion`),
  KEY `id_membresia` (`id_membresia`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'wai','$2y$10$C7RhUyanB/rKOZ1wybPz0.yO4PcTWNrbVicrgSmus1v0B30tg5zMu',3,1,1,'2020-03-23 01:03:51','2020-10-11 01:32:55',1,53),(2,2,'walter.chapilliquen','$2y$10$twwxUk/FbhFcDZGfufYVBufotILXm9GdsGXiaFCsndEy.RYio0a7i',3,3,1,'2020-03-23 01:03:51','2020-08-13 03:22:10',1,1),(3,3,'edwin.lopez@gmail.com','$2y$10$MtbmOSFKwjFv5ZeHUYzYXuV2s8pSwOwqs7t0b38XMaFN41J5CMU8G',1,1,0,'2020-08-24 15:31:11','2020-08-24 15:31:11',2,2),(4,4,'leydi.esparza@gmail.com','$2y$10$h8QZKV7X8gSAnDcqJ6Dr2OjxEpr9rva9LQp3sq.iC5Jyj6jEZiPYC',1,1,0,'2020-08-24 15:31:51','2020-08-24 15:31:51',2,2),(5,5,'jhonatan.viera@gmail.com','$2y$10$huiTNDTKkYHNJ9W8DbOOWORAWLnMVTk8ZVnUoh/V5Flwpa.LEKGpa',1,1,0,'2020-08-24 15:32:32','2020-08-24 15:32:32',2,2),(6,6,'luis.castro@gmail.com','$2y$10$OSXAUqAKhf97UF5KG41vheAvhz5jSw9wZnKg89/cyf5lcbxJSpWVu',1,1,0,'2020-08-24 15:33:02','2020-08-24 15:33:02',2,2),(7,7,'lizbeth.mechan@gmail.com','$2y$10$jVPMxvEdm1Vq5Lh34HPT4.H9yNmThTQhA7lumi77Ishlo/RuPeX.u',1,1,0,'2020-08-24 15:42:27','2020-08-24 15:44:03',2,2),(8,8,'andre.vallejo@gmail.com','$2y$10$on7AlGfmnR/Ocky5tJ9o0eaPh1rQwRGPRbKnr9cB9vkLMN8p63KY6',1,1,0,'2020-08-24 15:43:29','2020-08-24 15:43:29',2,2),(53,53,'fliperang','$2y$10$0KOfjlfSJ5yEHzU/x/wC3ulVisPwsR1.slLusOeCnCCFla5k9WdLy',3,1,1,'2020-10-11 01:32:20','2020-11-20 00:13:09',1,1),(55,55,'fiorella','$2y$10$aMW.73RNedPzROX5Cp/vFers1hf9hjWLhQcWkSqJBw98mEUvVGh9G',3,1,1,'2020-10-11 08:34:25','2020-11-20 01:19:49',1,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_servicio` tinyint(4) NOT NULL DEFAULT 1,
  `id_cliente` int(11) NOT NULL,
  `flag_compra_cliente` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Si la compra en la página la realizó a nombre del cliente',
  `flag_envio_cliente` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Si el envío está a nombre del cliente',
  `id_local_actual` int(11) NOT NULL,
  `estado_envio` tinyint(4) NOT NULL DEFAULT 1,
  `fecha` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_local_actual` (`id_local_actual`),
  CONSTRAINT `for_id_clientr` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,1,1,1,1,'2020-11-26 10:03:06','2020-11-26 10:03:06'),(2,2,5,0,0,1,1,'2020-11-26 10:05:33','2020-11-26 10:05:33'),(3,1,6,1,0,1,1,'2020-11-26 12:48:32','2020-11-26 12:48:32'),(4,2,3,0,1,1,1,'2020-11-26 22:30:49','2020-11-26 22:30:49');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_productos`
--

DROP TABLE IF EXISTS `ventas_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_productos` (
  `id_venta_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) DEFAULT NULL,
  `cantidad` decimal(12,2) NOT NULL DEFAULT 1.00,
  `upc` varchar(16) DEFAULT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `id_categoria` int(11) NOT NULL DEFAULT 1,
  `id_unidad_medida` int(11) NOT NULL DEFAULT 1,
  `id_local_actual` int(11) NOT NULL DEFAULT 1,
  `id_estado_envio` int(4) NOT NULL DEFAULT 1,
  `precio` decimal(12,2) NOT NULL DEFAULT 0.00,
  `fecha` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_venta_producto`),
  KEY `id_venta` (`id_venta`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_unidad_medida` (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_productos`
--

LOCK TABLES `ventas_productos` WRITE;
/*!40000 ALTER TABLE `ventas_productos` DISABLE KEYS */;
INSERT INTO `ventas_productos` VALUES (1,1,1.00,NULL,'THE BOXCODE','1bccfe6cc0c4b0d76df9f292d24ddcef.jpg',1,2,1,1,3.00,'2020-11-26 10:03:06','2020-11-26 10:03:06',1),(2,1,1.00,NULL,'HP PRINT 3535','f7cb1458e164f6ca410e728dc18bd610.jpg',1,1,1,1,3.00,'2020-11-26 10:03:06','2020-11-26 10:03:06',1),(3,1,1.00,NULL,'FLOWER','7402ee2bf9d61cbea9cae64b65867160.jpg',1,1,1,1,3.00,'2020-11-26 10:03:06','2020-11-26 10:03:06',1),(4,2,1.00,NULL,'MACBOOK AIR','09a49062eb9c7d0e8bed471068ca9345.jpg',1,2,1,1,3.00,'2020-11-26 10:05:33','2020-11-26 10:05:33',1),(5,3,1.00,NULL,'LAPTOP HP 777','c46a3b48892715201311037d4fd96f85.jpg',1,1,4,4,15.00,'2020-11-26 12:48:32','2020-11-26 13:23:39',1),(6,3,28.00,NULL,'DRONE DJI 98',NULL,1,2,2,3,2.00,'2020-11-26 12:48:32','2020-11-26 13:01:06',1),(7,4,1.00,NULL,'SOUL','564f1d39e6998713cb882e4619e2bbcb.jpg',2,2,1,1,3.00,'2020-11-26 22:30:49','2020-11-26 22:30:49',1);
/*!40000 ALTER TABLE `ventas_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_productos_tmp`
--

DROP TABLE IF EXISTS `ventas_productos_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_productos_tmp` (
  `id_venta_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_venta_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_productos_tmp`
--

LOCK TABLES `ventas_productos_tmp` WRITE;
/*!40000 ALTER TABLE `ventas_productos_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_productos_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajeros`
--

DROP TABLE IF EXISTS `viajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viajeros` (
  `id_viajero` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_viajero` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1.viajero,2:carga',
  `tipo_documento` tinyint(4) NOT NULL DEFAULT 1,
  `nombre_completo` varchar(255) NOT NULL,
  `numero_documento` varchar(16) NOT NULL,
  `foto` varchar(64) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `direccion_referencia` text DEFAULT NULL,
  `direccion_2` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_2` varchar(255) DEFAULT NULL,
  `celular` varchar(16) DEFAULT NULL,
  `celular_2` varchar(16) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `usuario_registro` int(11) NOT NULL,
  `usuario_actualizacion` int(11) NOT NULL,
  PRIMARY KEY (`id_viajero`),
  KEY `usuario_registro` (`usuario_registro`),
  KEY `usuario_actualizacion` (`usuario_actualizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajeros`
--

LOCK TABLES `viajeros` WRITE;
/*!40000 ALTER TABLE `viajeros` DISABLE KEYS */;
INSERT INTO `viajeros` VALUES (1,1,4,'JOHN DEERE','23948204481','8f46b999e47811c308c010a5f61d6e93.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-11-22 12:31:38','2020-11-26 00:45:10',1,1),(2,2,6,'AQP Express Cargo S.A.C','20312239117','58dfe4fe57c6e92e2d305bb692a19493.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-11-26 00:51:31','2020-11-26 00:51:31',1,1),(3,2,6,'OLTURSA','20483906789',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-11-26 13:21:43','2020-11-26 13:21:43',1,1);
/*!40000 ALTER TABLE `viajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viajes` (
  `id_viaje` int(11) NOT NULL AUTO_INCREMENT,
  `origen` tinyint(4) NOT NULL DEFAULT 1,
  `id_local` int(11) DEFAULT NULL,
  `id_estado_envio` int(11) NOT NULL DEFAULT 1,
  `observacion` text DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `id_local` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes`
--

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` VALUES (2,2,2,3,NULL,'2020-11-26 13:01:06','2020-11-26 13:01:06'),(3,1,3,2,NULL,'2020-11-26 13:06:23','2020-11-26 13:06:23'),(4,2,3,3,NULL,'2020-11-26 13:20:03','2020-11-26 13:20:03'),(5,1,4,2,NULL,'2020-11-26 13:22:48','2020-11-26 13:22:48'),(6,2,4,4,NULL,'2020-11-26 13:23:39','2020-11-26 13:23:39');
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_detalles`
--

DROP TABLE IF EXISTS `viajes_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viajes_detalles` (
  `id_viaje_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL,
  `id_venta_producto` int(11) NOT NULL,
  `id_estado_envio` int(11) NOT NULL DEFAULT 1,
  `fecha` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_viaje_detalle`),
  KEY `id_viaje` (`id_viaje`),
  KEY `id_venta_producto` (`id_venta_producto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `for_id_venta_producto` FOREIGN KEY (`id_venta_producto`) REFERENCES `ventas_productos` (`id_venta_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_detalles`
--

LOCK TABLES `viajes_detalles` WRITE;
/*!40000 ALTER TABLE `viajes_detalles` DISABLE KEYS */;
INSERT INTO `viajes_detalles` VALUES (1,2,6,3,'2020-11-26 13:01:06','2020-11-26 13:01:06',1),(2,2,5,3,'2020-11-26 13:01:06','2020-11-26 13:01:06',1),(3,3,5,2,'2020-11-26 13:06:23','2020-11-26 13:06:23',1),(4,4,5,3,'2020-11-26 13:20:03','2020-11-26 13:20:03',1),(5,5,5,2,'2020-11-26 13:22:48','2020-11-26 13:22:48',1),(6,6,5,4,'2020-11-26 13:23:39','2020-11-26 13:23:39',1);
/*!40000 ALTER TABLE `viajes_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_categorias`
--

DROP TABLE IF EXISTS `vista_categorias`;
/*!50001 DROP VIEW IF EXISTS `vista_categorias`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_categorias` (
  `id_categoria` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `estado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_usuarios`
--

DROP TABLE IF EXISTS `vista_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_usuarios` (
  `id_usuario` tinyint NOT NULL,
  `id_persona` tinyint NOT NULL,
  `nombre_usuario` tinyint NOT NULL,
  `clave` tinyint NOT NULL,
  `rol` tinyint NOT NULL,
  `id_membresia` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `fecha_registro` tinyint NOT NULL,
  `fecha_actualizacion` tinyint NOT NULL,
  `usuario_registro` tinyint NOT NULL,
  `usuario_actualizacion` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellido_paterno` tinyint NOT NULL,
  `apellido_materno` tinyint NOT NULL,
  `nombre_completo` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `archivo_1` tinyint NOT NULL,
  `archivo_2` tinyint NOT NULL,
  `clave_publica` tinyint NOT NULL,
  `tipo_documento` tinyint NOT NULL,
  `numero_documento` tinyint NOT NULL,
  `tipo_persona` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `direccion` tinyint NOT NULL,
  `distrito` tinyint NOT NULL,
  `provincia` tinyint NOT NULL,
  `departamento` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_ventas_productos`
--

DROP TABLE IF EXISTS `vista_ventas_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_productos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_ventas_productos` (
  `id_venta_producto` tinyint NOT NULL,
  `id_venta` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL,
  `upc` tinyint NOT NULL,
  `nombre_producto` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `id_categoria` tinyint NOT NULL,
  `id_unidad_medida` tinyint NOT NULL,
  `id_local_actual` tinyint NOT NULL,
  `id_estado_envio` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `fecha` tinyint NOT NULL,
  `fecha_actualizacion` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `unidad_medida` tinyint NOT NULL,
  `cliente` tinyint NOT NULL,
  `numero_documento` tinyint NOT NULL,
  `tipo_documento` tinyint NOT NULL,
  `servicio` tinyint NOT NULL,
  `local_actual` tinyint NOT NULL,
  `estado_envio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_viajes_detalles`
--

DROP TABLE IF EXISTS `vista_viajes_detalles`;
/*!50001 DROP VIEW IF EXISTS `vista_viajes_detalles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_viajes_detalles` (
  `id_viaje_detalle` tinyint NOT NULL,
  `fecha_detalle` tinyint NOT NULL,
  `id_venta_producto` tinyint NOT NULL,
  `id_venta` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL,
  `upc` tinyint NOT NULL,
  `nombre_producto` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `id_categoria` tinyint NOT NULL,
  `id_unidad_medida` tinyint NOT NULL,
  `id_local_actual` tinyint NOT NULL,
  `id_estado_envio` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `fecha` tinyint NOT NULL,
  `fecha_actualizacion` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `unidad_medida` tinyint NOT NULL,
  `cliente` tinyint NOT NULL,
  `servicio` tinyint NOT NULL,
  `local_actual` tinyint NOT NULL,
  `local_detalle` tinyint NOT NULL,
  `estado_envio` tinyint NOT NULL,
  `nombre_usuario` tinyint NOT NULL,
  `usuario_nombre_completo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `fliperang`
--

USE `fliperang`;

--
-- Final view structure for view `vista_categorias`
--

/*!50001 DROP TABLE IF EXISTS `vista_categorias`*/;
/*!50001 DROP VIEW IF EXISTS `vista_categorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_categorias` AS select `c`.`id_categoria` AS `id_categoria`,`c`.`nombre` AS `nombre`,`c`.`estado` AS `estado` from `categorias` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios`
--

/*!50001 DROP TABLE IF EXISTS `vista_usuarios`*/;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`id_persona` AS `id_persona`,`u`.`nombre_usuario` AS `nombre_usuario`,`u`.`clave` AS `clave`,`u`.`rol` AS `rol`,`u`.`id_membresia` AS `id_membresia`,`u`.`estado` AS `estado`,`u`.`fecha_registro` AS `fecha_registro`,`u`.`fecha_actualizacion` AS `fecha_actualizacion`,`u`.`usuario_registro` AS `usuario_registro`,`u`.`usuario_actualizacion` AS `usuario_actualizacion`,`p`.`nombres` AS `nombres`,`p`.`apellido_paterno` AS `apellido_paterno`,`p`.`apellido_materno` AS `apellido_materno`,`p`.`nombre_completo` AS `nombre_completo`,`p`.`foto` AS `foto`,`p`.`archivo_1` AS `archivo_1`,`p`.`archivo_2` AS `archivo_2`,`p`.`clave_publica` AS `clave_publica`,`p`.`tipo_documento` AS `tipo_documento`,`p`.`numero_documento` AS `numero_documento`,`p`.`tipo_persona` AS `tipo_persona`,`p`.`email` AS `email`,`p`.`celular` AS `celular`,`p`.`direccion` AS `direccion`,`ub`.`distrito` AS `distrito`,`ub`.`provincia` AS `provincia`,`ub`.`departamento` AS `departamento` from ((`usuarios` `u` join `personas` `p` on(`p`.`id_persona` = `u`.`id_persona`)) join `ubigeo` `ub` on(`ub`.`id_ubigeo` = `p`.`ubigeo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_productos`
--

/*!50001 DROP TABLE IF EXISTS `vista_ventas_productos`*/;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_productos` AS select `vp`.`id_venta_producto` AS `id_venta_producto`,`vp`.`id_venta` AS `id_venta`,`vp`.`cantidad` AS `cantidad`,`vp`.`upc` AS `upc`,`vp`.`nombre_producto` AS `nombre_producto`,`vp`.`foto` AS `foto`,`vp`.`id_categoria` AS `id_categoria`,`vp`.`id_unidad_medida` AS `id_unidad_medida`,`vp`.`id_local_actual` AS `id_local_actual`,`vp`.`id_estado_envio` AS `id_estado_envio`,`vp`.`precio` AS `precio`,`vp`.`fecha` AS `fecha`,`vp`.`fecha_actualizacion` AS `fecha_actualizacion`,`vp`.`estado` AS `estado`,`ca`.`nombre` AS `categoria`,`u`.`nombre` AS `unidad_medida`,`c`.`nombre_completo` AS `cliente`,`c`.`numero_documento` AS `numero_documento`,`c`.`tipo_documento` AS `tipo_documento`,`s`.`name` AS `servicio`,`la`.`nombre` AS `local_actual`,`ee`.`nombre` AS `estado_envio` from (((((((`ventas_productos` `vp` join `ventas` `v` on(`v`.`id_venta` = `vp`.`id_venta`)) join `categorias` `ca` on(`ca`.`id_categoria` = `vp`.`id_categoria`)) join `unidad_medida` `u` on(`u`.`id_unidad_medida` = `vp`.`id_unidad_medida`)) join `clientes` `c` on(`c`.`id_cliente` = `v`.`id_cliente`)) join `servicios` `s` on(`s`.`id_servicio` = `v`.`id_servicio`)) join `estado_envio` `ee` on(`ee`.`id_estado_envio` = `vp`.`id_estado_envio`)) left join `locales` `la` on(`la`.`id_local` = `vp`.`id_local_actual`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_viajes_detalles`
--

/*!50001 DROP TABLE IF EXISTS `vista_viajes_detalles`*/;
/*!50001 DROP VIEW IF EXISTS `vista_viajes_detalles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_viajes_detalles` AS select `vd`.`id_viaje_detalle` AS `id_viaje_detalle`,`vd`.`fecha` AS `fecha_detalle`,`vp`.`id_venta_producto` AS `id_venta_producto`,`vp`.`id_venta` AS `id_venta`,`vp`.`cantidad` AS `cantidad`,`vp`.`upc` AS `upc`,`vp`.`nombre_producto` AS `nombre_producto`,`vp`.`foto` AS `foto`,`vp`.`id_categoria` AS `id_categoria`,`vp`.`id_unidad_medida` AS `id_unidad_medida`,`vp`.`id_local_actual` AS `id_local_actual`,`vp`.`id_estado_envio` AS `id_estado_envio`,`vp`.`precio` AS `precio`,`vp`.`fecha` AS `fecha`,`vp`.`fecha_actualizacion` AS `fecha_actualizacion`,`vp`.`estado` AS `estado`,`ca`.`nombre` AS `categoria`,`u`.`nombre` AS `unidad_medida`,`c`.`nombre_completo` AS `cliente`,`s`.`name` AS `servicio`,`la`.`nombre` AS `local_actual`,`ld`.`nombre` AS `local_detalle`,`ee`.`nombre` AS `estado_envio`,`us`.`nombre_usuario` AS `nombre_usuario`,`p`.`nombre_completo` AS `usuario_nombre_completo` from ((((((((((((`viajes_detalles` `vd` join `viajes` `vj` on(`vj`.`id_viaje` = `vd`.`id_viaje`)) join `ventas_productos` `vp` on(`vp`.`id_venta_producto` = `vd`.`id_venta_producto`)) join `ventas` `v` on(`v`.`id_venta` = `vp`.`id_venta`)) join `categorias` `ca` on(`ca`.`id_categoria` = `vp`.`id_categoria`)) join `unidad_medida` `u` on(`u`.`id_unidad_medida` = `vp`.`id_unidad_medida`)) join `clientes` `c` on(`c`.`id_cliente` = `v`.`id_cliente`)) join `servicios` `s` on(`s`.`id_servicio` = `v`.`id_servicio`)) join `estado_envio` `ee` on(`ee`.`id_estado_envio` = `vd`.`id_estado_envio`)) join `usuarios` `us` on(`us`.`id_usuario` = `vd`.`id_usuario`)) join `personas` `p` on(`p`.`id_persona` = `us`.`id_persona`)) join `locales` `ld` on(`ld`.`id_local` = `vj`.`id_local`)) left join `locales` `la` on(`la`.`id_local` = `vp`.`id_local_actual`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-26 23:57:54
