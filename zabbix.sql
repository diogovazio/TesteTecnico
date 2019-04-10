-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: zabbix
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Current Database: `zabbix`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zabbix` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `zabbix`;

--
-- Table structure for table `acknowledges`
--

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `action` int(11) NOT NULL DEFAULT '0',
  `old_severity` int(11) NOT NULL DEFAULT '0',
  `new_severity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`),
  CONSTRAINT `c_acknowledges_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_acknowledges_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '1h',
  `def_shortdata` varchar(255) NOT NULL DEFAULT '',
  `def_longdata` text NOT NULL,
  `r_shortdata` varchar(255) NOT NULL DEFAULT '',
  `r_longdata` text NOT NULL,
  `formula` varchar(255) NOT NULL DEFAULT '',
  `pause_suppressed` int(11) NOT NULL DEFAULT '1',
  `ack_shortdata` varchar(255) NOT NULL DEFAULT '',
  `ack_longdata` text NOT NULL,
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actions_2` (`name`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,'0','','','','','',1,'',''),(3,'Report problems to Zabbix administrators',0,0,1,'1h','Problem: {EVENT.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','Resolved: {EVENT.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','',1,'Updated problem: {EVENT.NAME}','{USER.FULLNAME} {EVENT.UPDATE.ACTION} problem at {EVENT.UPDATE.DATE} {EVENT.UPDATE.TIME}.\r\n{EVENT.UPDATE.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}, acknowledged: {EVENT.ACK.STATUS}.'),(4,'Report not supported items',3,0,1,'1h','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','',1,'',''),(5,'Report not supported low level discovery rules',3,0,1,'1h','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','',1,'',''),(6,'Report unknown triggers',3,0,1,'1h','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','',1,'',''),(7,'Alerta ViaCep Fora do Ar',0,0,0,'1h','Problem: {EVENT.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','Resolved: {EVENT.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','',1,'Updated problem: {EVENT.NAME}','{USER.FULLNAME} {EVENT.UPDATE.ACTION} problem at {EVENT.UPDATE.DATE} {EVENT.UPDATE.TIME}.\r\n{EVENT.UPDATE.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}, acknowledged: {EVENT.ACK.STATUS}.');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  `sendto` varchar(1024) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  `p_eventid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_4` (`status`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`),
  KEY `alerts_7` (`p_eventid`),
  KEY `c_alerts_6` (`acknowledgeid`),
  CONSTRAINT `c_alerts_6` FOREIGN KEY (`acknowledgeid`) REFERENCES `acknowledges` (`acknowledgeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_4` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_5` FOREIGN KEY (`p_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (1,7,51,1,1554858839,NULL,'','Problem: HTTP service is down on API ViaCep','Problem started at 22:13:58 on 2019.04.09\r\nProblem name: HTTP service is down on API ViaCep\r\nHost: API ViaCep\r\nSeverity: Disaster\r\n\r\nOriginal problem ID: 51\r\n',2,3,'No media defined for user.',1,0,NULL,NULL),(2,7,52,1,1554858899,NULL,'','Resolved: HTTP service is down on API ViaCep','Problem has been resolved at 22:14:58 on 2019.04.09\r\nProblem name: HTTP service is down on API ViaCep\r\nHost: API ViaCep\r\nSeverity: Disaster\r\n\r\nOriginal problem ID: 51\r\n',2,3,'No media defined for user.',1,0,51,NULL);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_discovery`
--

DROP TABLE IF EXISTS `application_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_discovery` (
  `application_discoveryid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_discoveryid`),
  KEY `application_discovery_1` (`applicationid`),
  KEY `application_discovery_2` (`application_prototypeid`),
  CONSTRAINT `c_application_discovery_2` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_discovery_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_discovery`
--

LOCK TABLES `application_discovery` WRITE;
/*!40000 ALTER TABLE `application_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_prototype`
--

DROP TABLE IF EXISTS `application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_prototype` (
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_prototypeid`),
  KEY `application_prototype_1` (`itemid`),
  KEY `application_prototype_2` (`templateid`),
  CONSTRAINT `c_application_prototype_2` FOREIGN KEY (`templateid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_prototype_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_prototype`
--

LOCK TABLES `application_prototype` WRITE;
/*!40000 ALTER TABLE `application_prototype` DISABLE KEYS */;
INSERT INTO `application_prototype` VALUES (1,23665,NULL,'Startup {#SERVICE.STARTUPNAME} services');
/*!40000 ALTER TABLE `application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_template`
--

DROP TABLE IF EXISTS `application_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_template` (
  `application_templateid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`application_templateid`),
  UNIQUE KEY `application_template_1` (`applicationid`,`templateid`),
  KEY `application_template_2` (`templateid`),
  CONSTRAINT `c_application_template_2` FOREIGN KEY (`templateid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_template_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_template`
--

LOCK TABLES `application_template` WRITE;
/*!40000 ALTER TABLE `application_template` DISABLE KEYS */;
INSERT INTO `application_template` VALUES (1,207,206),(12,252,206),(13,262,206),(14,272,206),(15,282,206),(16,292,206),(17,302,206),(18,329,206),(19,345,179),(20,346,13),(21,347,5),(22,348,21),(23,349,15),(24,350,7),(25,351,1),(26,352,17),(27,353,9),(28,354,23),(29,355,207),(165,797,780),(166,799,780),(168,803,771),(167,803,784),(169,804,800),(170,805,799),(171,811,784),(172,812,800),(173,813,799),(174,820,784),(175,821,800),(176,822,799),(177,823,784),(178,824,800),(179,825,799),(180,836,826),(181,837,827),(182,838,826),(183,839,827),(185,840,771),(184,840,784),(186,841,800),(187,842,799),(191,846,800),(192,847,799),(193,856,848),(194,857,849),(195,858,852),(196,859,853),(197,860,854),(198,861,855),(205,868,848),(206,869,851),(207,870,852),(208,871,853),(209,872,854),(210,873,855),(212,874,771),(211,874,784),(213,875,800),(214,876,799),(215,883,784),(216,884,800),(217,885,799),(219,892,771),(218,892,784),(220,893,800),(221,894,799),(223,901,771),(222,901,784),(224,902,800),(225,903,799),(227,910,770),(226,910,781),(228,911,798),(229,912,797),(231,913,771),(230,913,782),(232,914,800),(233,915,799),(235,916,771),(234,916,784),(236,917,800),(237,918,799),(244,934,771),(243,934,784),(245,935,800),(246,936,799),(247,942,784),(248,943,800),(249,944,799),(251,949,771),(250,949,784),(252,950,800),(253,951,799),(263,969,784),(264,970,800),(265,971,799),(266,977,784),(267,978,800),(268,979,799),(270,986,771),(269,986,784),(271,987,800),(272,988,799),(273,992,782),(274,993,800),(275,994,799),(276,998,781),(277,999,798),(278,1000,797),(279,1014,779),(280,1015,776),(281,1016,777),(282,1017,778),(284,1018,771),(283,1018,784),(285,1019,800),(286,1020,799),(287,1021,779),(288,1022,776),(289,1023,777),(290,1024,778),(291,1025,786),(292,1026,800),(293,1027,799),(295,1028,771),(294,1028,784),(296,1029,800),(297,1030,799),(298,1037,779),(299,1038,776),(300,1039,777),(301,1040,778),(302,1041,784),(303,1042,800),(304,1043,799),(305,1048,852),(306,1049,855),(307,1050,854),(308,1051,853),(309,1052,848),(310,1053,784),(311,1054,800),(312,1055,799),(313,1057,1056),(314,1058,771),(317,1058,784),(315,1059,800),(316,1060,799),(318,1069,800),(319,1070,799),(320,1078,800),(321,1079,799),(322,1087,798),(323,1088,797),(324,1094,800),(325,1095,799),(326,1101,800),(327,1102,799),(328,1112,13),(329,1113,5),(330,1114,21),(331,1115,15),(332,1116,7),(333,1117,1),(334,1118,17),(335,1119,9),(336,1120,23),(337,1121,207),(338,1122,447);
/*!40000 ALTER TABLE `application_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  CONSTRAINT `c_applications_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,10001,'OS',0),(5,10001,'Filesystems',0),(7,10001,'Network interfaces',0),(9,10001,'Processes',0),(13,10001,'CPU',0),(15,10001,'Memory',0),(17,10001,'Performance',0),(21,10001,'General',0),(23,10001,'Security',0),(179,10047,'Zabbix server',0),(206,10050,'Zabbix agent',0),(207,10001,'Zabbix agent',0),(252,10074,'Zabbix agent',0),(253,10074,'CPU',0),(254,10074,'Filesystems',0),(255,10074,'General',0),(256,10074,'Memory',0),(257,10074,'Network interfaces',0),(258,10074,'OS',0),(259,10074,'Performance',0),(260,10074,'Processes',0),(261,10074,'Security',0),(262,10075,'Zabbix agent',0),(263,10075,'CPU',0),(264,10075,'Filesystems',0),(265,10075,'General',0),(266,10075,'Memory',0),(267,10075,'Network interfaces',0),(268,10075,'OS',0),(269,10075,'Performance',0),(270,10075,'Processes',0),(271,10075,'Security',0),(272,10076,'Zabbix agent',0),(273,10076,'CPU',0),(274,10076,'Filesystems',0),(275,10076,'General',0),(276,10076,'Memory',0),(277,10076,'Network interfaces',0),(278,10076,'OS',0),(279,10076,'Performance',0),(280,10076,'Processes',0),(281,10076,'Security',0),(282,10077,'Zabbix agent',0),(283,10077,'CPU',0),(284,10077,'Filesystems',0),(285,10077,'General',0),(286,10077,'Memory',0),(287,10077,'Network interfaces',0),(288,10077,'OS',0),(289,10077,'Performance',0),(290,10077,'Processes',0),(291,10077,'Security',0),(292,10078,'Zabbix agent',0),(293,10078,'CPU',0),(294,10078,'Filesystems',0),(295,10078,'General',0),(296,10078,'Memory',0),(297,10078,'Network interfaces',0),(298,10078,'OS',0),(299,10078,'Performance',0),(300,10078,'Processes',0),(301,10078,'Security',0),(302,10079,'Zabbix agent',0),(303,10079,'CPU',0),(304,10079,'Filesystems',0),(305,10079,'General',0),(306,10079,'Memory',0),(307,10079,'Network interfaces',0),(308,10079,'OS',0),(309,10079,'Performance',0),(310,10079,'Processes',0),(311,10079,'Security',0),(319,10081,'General',0),(320,10081,'Performance',0),(321,10081,'Services',0),(322,10081,'Filesystems',0),(323,10081,'OS',0),(324,10081,'Processes',0),(325,10081,'CPU',0),(328,10081,'Memory',0),(329,10081,'Zabbix agent',0),(330,10081,'Network interfaces',0),(331,10076,'Logical partitions',0),(345,10084,'Zabbix server',0),(346,10084,'CPU',0),(347,10084,'Filesystems',0),(348,10084,'General',0),(349,10084,'Memory',0),(350,10084,'Network interfaces',0),(351,10084,'OS',0),(352,10084,'Performance',0),(353,10084,'Processes',0),(354,10084,'Security',0),(355,10084,'Zabbix agent',0),(356,10048,'Zabbix proxy',0),(446,10093,'FTP service',0),(447,10094,'HTTP service',0),(448,10095,'HTTPS service',0),(449,10096,'IMAP service',0),(450,10097,'LDAP service',0),(451,10098,'NNTP service',0),(452,10099,'NTP service',0),(453,10100,'POP service',0),(454,10101,'SMTP service',0),(455,10102,'SSH service',0),(456,10103,'Telnet service',0),(732,10169,'Classes',0),(733,10169,'Compilation',0),(734,10169,'Garbage collector',0),(735,10169,'Memory',0),(736,10169,'Memory pool',0),(737,10169,'Operating system',0),(738,10169,'Runtime',0),(739,10169,'Threads',0),(740,10170,'MySQL',0),(741,10171,'Fans',0),(742,10171,'Temperature',0),(743,10171,'Voltage',0),(744,10172,'Fans',0),(745,10172,'Temperature',0),(746,10172,'Voltage',0),(747,10173,'Clusters',0),(748,10173,'General',0),(749,10173,'Log',0),(750,10174,'CPU',0),(751,10174,'Disks',0),(752,10174,'Filesystems',0),(753,10174,'General',0),(754,10174,'Interfaces',0),(755,10174,'Memory',0),(756,10174,'Network',0),(757,10174,'Storage',0),(758,10175,'CPU',0),(759,10175,'Datastore',0),(760,10175,'General',0),(761,10175,'Hardware',0),(762,10175,'Memory',0),(763,10175,'Network',0),(770,10182,'Network interfaces',0),(771,10183,'Network interfaces',0),(772,10184,'Internal items',0),(773,10184,'Memory',0),(774,10184,'Storage',0),(775,10184,'CPU',0),(776,10185,'Internal items',0),(777,10185,'Memory',0),(778,10185,'Storage',0),(779,10185,'CPU',0),(780,10186,'Status',0),(781,10187,'Network interfaces',0),(782,10188,'Network interfaces',0),(783,10189,'Network interfaces',0),(784,10190,'Network interfaces',0),(786,10192,'Network interfaces',0),(797,10203,'Status',0),(798,10203,'General',0),(799,10204,'Status',0),(800,10204,'General',0),(803,10207,'Network interfaces',0),(804,10207,'General',0),(805,10207,'Status',0),(806,10207,'CPU',0),(807,10207,'Memory',0),(808,10207,'Temperature',0),(809,10207,'Fans',0),(810,10207,'Inventory',0),(811,10208,'Network interfaces',0),(812,10208,'General',0),(813,10208,'Status',0),(814,10208,'CPU',0),(815,10208,'Memory',0),(816,10208,'Temperature',0),(817,10208,'Power supply',0),(818,10208,'Fans',0),(819,10208,'Inventory',0),(820,10210,'Network interfaces',0),(821,10210,'General',0),(822,10210,'Status',0),(823,10211,'Network interfaces',0),(824,10211,'General',0),(825,10211,'Status',0),(826,10209,'CPU',0),(827,10209,'Memory',0),(828,10210,'Temperature',0),(829,10210,'Power supply',0),(830,10210,'Fans',0),(831,10210,'Inventory',0),(832,10211,'Temperature',0),(833,10211,'Power supply',0),(834,10211,'Fans',0),(835,10211,'Inventory',0),(836,10210,'CPU',0),(837,10210,'Memory',0),(838,10211,'CPU',0),(839,10211,'Memory',0),(840,10218,'Network interfaces',0),(841,10218,'General',0),(842,10218,'Status',0),(846,10220,'General',0),(847,10220,'Status',0),(848,10212,'Memory',0),(849,10213,'CPU',0),(851,10215,'CPU',0),(852,10216,'Inventory',0),(853,10217,'Temperature',0),(854,10217,'Power supply',0),(855,10217,'Fans',0),(856,10218,'Memory',0),(857,10218,'CPU',0),(858,10218,'Inventory',0),(859,10218,'Temperature',0),(860,10218,'Power supply',0),(861,10218,'Fans',0),(868,10220,'Memory',0),(869,10220,'CPU',0),(870,10220,'Inventory',0),(871,10220,'Temperature',0),(872,10220,'Power supply',0),(873,10220,'Fans',0),(874,10221,'Network interfaces',0),(875,10221,'General',0),(876,10221,'Status',0),(877,10221,'CPU',0),(878,10221,'Memory',0),(879,10221,'Temperature',0),(880,10221,'Power supply',0),(881,10221,'Fans',0),(882,10221,'Inventory',0),(883,10222,'Network interfaces',0),(884,10222,'General',0),(885,10222,'Status',0),(886,10222,'CPU',0),(887,10222,'Memory',0),(888,10222,'Temperature',0),(889,10222,'Fans',0),(890,10222,'Power supply',0),(891,10222,'Inventory',0),(892,10223,'Network interfaces',0),(893,10223,'General',0),(894,10223,'Status',0),(895,10223,'CPU',0),(896,10223,'Memory',0),(897,10223,'Temperature',0),(898,10223,'Fans',0),(899,10223,'Power supply',0),(900,10223,'Inventory',0),(901,10224,'Network interfaces',0),(902,10224,'General',0),(903,10224,'Status',0),(904,10224,'CPU',0),(905,10224,'Memory',0),(906,10224,'Temperature',0),(907,10224,'Power supply',0),(908,10224,'Fans',0),(909,10224,'Inventory',0),(910,10225,'Network interfaces',0),(911,10225,'General',0),(912,10225,'Status',0),(913,10226,'Network interfaces',0),(914,10226,'General',0),(915,10226,'Status',0),(916,10227,'Network interfaces',0),(917,10227,'General',0),(918,10227,'Status',0),(919,10227,'CPU',0),(920,10227,'Memory',0),(921,10227,'Temperature',0),(922,10227,'Fans',0),(923,10227,'Power supply',0),(924,10227,'Inventory',0),(934,10229,'Network interfaces',0),(935,10229,'General',0),(936,10229,'Status',0),(937,10229,'CPU',0),(938,10229,'Memory',0),(939,10229,'Temperature',0),(940,10229,'Fans',0),(941,10229,'Inventory',0),(942,10230,'Network interfaces',0),(943,10230,'General',0),(944,10230,'Status',0),(945,10230,'Temperature',0),(946,10230,'Power supply',0),(947,10230,'Fans',0),(948,10230,'Inventory',0),(949,10231,'Network interfaces',0),(950,10231,'General',0),(951,10231,'Status',0),(952,10231,'CPU',0),(953,10231,'Memory',0),(954,10231,'Temperature',0),(955,10231,'Power supply',0),(956,10231,'Fans',0),(957,10231,'Inventory',0),(969,10233,'Network interfaces',0),(970,10233,'General',0),(971,10233,'Status',0),(972,10233,'CPU',0),(973,10233,'Memory',0),(974,10233,'Temperature',0),(975,10233,'Storage',0),(976,10233,'Inventory',0),(977,10234,'Network interfaces',0),(978,10234,'General',0),(979,10234,'Status',0),(980,10234,'CPU',0),(981,10234,'Memory',0),(982,10234,'Temperature',0),(983,10234,'Power supply',0),(984,10234,'Fans',0),(985,10234,'Inventory',0),(986,10235,'Network interfaces',0),(987,10235,'General',0),(988,10235,'Status',0),(989,10235,'CPU',0),(990,10235,'Memory',0),(991,10235,'Inventory',0),(992,10236,'Network interfaces',0),(993,10236,'General',0),(994,10236,'Status',0),(995,10236,'CPU',0),(996,10236,'Memory',0),(997,10236,'Inventory',0),(998,10237,'Network interfaces',0),(999,10237,'General',0),(1000,10237,'Status',0),(1001,10237,'CPU',0),(1002,10237,'Memory',0),(1003,10237,'Inventory',0),(1014,10248,'CPU',0),(1015,10248,'Internal items',0),(1016,10248,'Memory',0),(1017,10248,'Storage',0),(1018,10248,'Network interfaces',0),(1019,10248,'General',0),(1020,10248,'Status',0),(1021,10249,'CPU',0),(1022,10249,'Internal items',0),(1023,10249,'Memory',0),(1024,10249,'Storage',0),(1025,10249,'Network interfaces',0),(1026,10249,'General',0),(1027,10249,'Status',0),(1028,10250,'Network interfaces',0),(1029,10250,'General',0),(1030,10250,'Status',0),(1031,10250,'CPU',0),(1032,10250,'Memory',0),(1033,10250,'Temperature',0),(1034,10250,'Fans',0),(1035,10250,'Power supply',0),(1036,10250,'Inventory',0),(1037,10251,'CPU',0),(1038,10251,'Internal items',0),(1039,10251,'Memory',0),(1040,10251,'Storage',0),(1041,10251,'Network interfaces',0),(1042,10251,'General',0),(1043,10251,'Status',0),(1044,10251,'Temperature',0),(1045,10251,'Fans',0),(1046,10251,'Power supply',0),(1047,10251,'Inventory',0),(1048,10253,'Inventory',0),(1049,10253,'Fans',0),(1050,10253,'Power supply',0),(1051,10253,'Temperature',0),(1052,10253,'Memory',0),(1053,10253,'Network interfaces',0),(1054,10253,'General',0),(1055,10253,'Status',0),(1056,10252,'CPU',0),(1057,10253,'CPU',0),(1058,10254,'Network interfaces',0),(1059,10254,'General',0),(1060,10254,'Status',0),(1061,10254,'CPU',0),(1062,10254,'Fans',0),(1063,10254,'Internal items',0),(1064,10254,'Inventory',0),(1065,10254,'Memory',0),(1066,10254,'Power supply',0),(1067,10254,'Storage',0),(1068,10254,'Temperature',0),(1069,10255,'General',0),(1070,10255,'Status',0),(1071,10255,'Disk arrays',0),(1072,10255,'Fans',0),(1073,10255,'Inventory',0),(1074,10255,'Physical disks',0),(1075,10255,'Power supply',0),(1076,10255,'Temperature',0),(1077,10255,'Virtual disks',0),(1078,10256,'General',0),(1079,10256,'Status',0),(1080,10256,'Disk arrays',0),(1081,10256,'Fans',0),(1082,10256,'Inventory',0),(1083,10256,'Physical disks',0),(1084,10256,'Power supply',0),(1085,10256,'Temperature',0),(1086,10256,'Virtual disks',0),(1087,10257,'General',0),(1088,10257,'Status',0),(1089,10257,'Fans',0),(1090,10257,'Inventory',0),(1091,10257,'Physical disks',0),(1092,10257,'Power supply',0),(1093,10257,'Temperature',0),(1094,10258,'General',0),(1095,10258,'Status',0),(1096,10258,'Fans',0),(1097,10258,'Inventory',0),(1098,10258,'Physical disks',0),(1099,10258,'Power supply',0),(1100,10258,'Temperature',0),(1101,10259,'General',0),(1102,10259,'Status',0),(1103,10259,'Fans',0),(1104,10259,'Temperature',0),(1105,10260,'http-8080',0),(1106,10260,'http-8443',0),(1107,10260,'jk-8009',0),(1108,10260,'Sessions',0),(1109,10260,'Tomcat',0),(1110,10261,'Zabbix server',0),(1111,10262,'Zabbix proxy',0),(1112,10263,'CPU',0),(1113,10263,'Filesystems',0),(1114,10263,'General',0),(1115,10263,'Memory',0),(1116,10263,'Network interfaces',0),(1117,10263,'OS',0),(1118,10263,'Performance',0),(1119,10263,'Processes',0),(1120,10263,'Security',0),(1121,10263,'Zabbix agent',0),(1122,10263,'HTTP service',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`),
  CONSTRAINT `c_auditlog_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,2,1554851674,3,0,'','192.168.15.78',0,''),(2,1,1554851678,3,0,'Login failed.','192.168.15.78',0,''),(3,1,1554851679,3,0,'Login failed.','192.168.15.78',0,''),(4,1,1554851682,3,0,'Login failed.','192.168.15.78',0,''),(5,1,1554851685,3,0,'Login failed.','192.168.15.78',0,''),(6,1,1554851700,3,0,'Login failed.','192.168.15.78',0,''),(7,1,1554851730,3,0,'','192.168.15.78',0,''),(8,1,1554851969,0,14,'0','192.168.15.78',15,'API'),(9,1,1554851969,0,4,'0','192.168.15.78',10263,'API ViaCep'),(10,1,1554851985,0,13,'0','192.168.15.78',15907,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(11,1,1554851985,0,13,'0','192.168.15.78',15908,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(12,1,1554851985,0,13,'0','192.168.15.78',15909,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(13,1,1554851985,0,13,'0','192.168.15.78',15910,'Configured max number of opened files is too low on {HOST.NAME}'),(14,1,1554851985,0,13,'0','192.168.15.78',15911,'Configured max number of processes is too low on {HOST.NAME}'),(15,1,1554851985,0,13,'0','192.168.15.78',15912,'Too many processes running on {HOST.NAME}'),(16,1,1554851985,0,13,'0','192.168.15.78',15913,'Too many processes on {HOST.NAME}'),(17,1,1554851985,0,13,'0','192.168.15.78',15914,'Processor load is too high on {HOST.NAME}'),(18,1,1554851985,0,13,'0','192.168.15.78',15915,'Disk I/O is overloaded on {HOST.NAME}'),(19,1,1554851985,0,13,'0','192.168.15.78',15916,'Hostname was changed on {HOST.NAME}'),(20,1,1554851985,0,13,'0','192.168.15.78',15917,'Lack of free swap space on {HOST.NAME}'),(21,1,1554851985,0,13,'0','192.168.15.78',15918,'Host information was changed on {HOST.NAME}'),(22,1,1554851985,0,13,'0','192.168.15.78',15919,'{HOST.NAME} has just been restarted'),(23,1,1554851985,0,13,'0','192.168.15.78',15920,'/etc/passwd has been changed on {HOST.NAME}'),(24,1,1554851985,0,13,'0','192.168.15.78',15921,'Lack of available memory on server {HOST.NAME}'),(25,1,1554851985,0,31,'0','192.168.15.78',15922,'Free inodes is less than 20% on volume {#FSNAME}'),(26,1,1554851985,0,31,'0','192.168.15.78',15923,'Free disk space is less than 20% on volume {#FSNAME}'),(27,1,1554854308,0,13,'0','192.168.15.78',15930,'HTTP service is down on {HOST.NAME}'),(28,1,1554854748,0,0,'0','192.168.15.78',3,'MaxMilhas'),(29,1,1554854774,1,0,'0','192.168.15.78',1,'Admin'),(30,1,1554855370,0,30,'0','192.168.15.78',10264,'ViaCep'),(31,1,1554856160,1,31,'0','192.168.15.78',13266,'Free disk space is less than 20% on volume {#FSNAME}'),(32,1,1554856160,1,31,'0','192.168.15.78',13506,'Free disk space is less than 20% on volume {#FSNAME}'),(33,1,1554856160,1,31,'0','192.168.15.78',15923,'Free disk space is less than 20% on volume {#FSNAME}'),(34,1,1554856170,1,31,'0','192.168.15.78',13266,'Free disk space is less than 20% on volume {#FSNAME}'),(35,1,1554856170,1,31,'0','192.168.15.78',13506,'Free disk space is less than 20% on volume {#FSNAME}'),(36,1,1554856170,1,31,'0','192.168.15.78',15923,'Free disk space is less than 20% on volume {#FSNAME}'),(37,1,1554858622,0,5,'Nome: Alerta','192.168.15.78',0,''),(38,1,1554858636,1,5,'Nome: Alerta ViaCep Fora do Ar','192.168.15.78',0,''),(39,1,1554858780,1,13,'0','192.168.15.78',15930,'HTTP service is down on {HOST.NAME}');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL,
  `auditid` bigint(20) unsigned NOT NULL,
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`),
  CONSTRAINT `c_auditlog_details_1` FOREIGN KEY (`auditid`) REFERENCES `auditlog` (`auditid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
INSERT INTO `auditlog_details` VALUES (1,29,'users','lang','en_GB','pt_BR'),(2,31,'','expression','{Template OS Linux:vfs.fs.size[{#FSNAME},pfree].last(0)}<20','{Template OS Linux:vfs.fs.size[{#FSNAME},pfree].last(0)}<30'),(3,32,'','expression','{Zabbix server:vfs.fs.size[{#FSNAME},pfree].last(0)}<20','{Zabbix server:vfs.fs.size[{#FSNAME},pfree].last(0)}<30'),(4,33,'','expression','{API ViaCep:vfs.fs.size[{#FSNAME},pfree].last(0)}<20','{API ViaCep:vfs.fs.size[{#FSNAME},pfree].last(0)}<30'),(5,34,'','description','Free disk space is less than 20% on volume {#FSNAME}','Free disk space is less than 30% on volume {#FSNAME}'),(6,35,'','description','Free disk space is less than 20% on volume {#FSNAME}','Free disk space is less than 30% on volume {#FSNAME}'),(7,36,'','description','Free disk space is less than 20% on volume {#FSNAME}','Free disk space is less than 30% on volume {#FSNAME}'),(8,39,'','priority','3','5');
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(255) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`host`),
  KEY `autoreg_host_2` (`proxy_hostid`),
  CONSTRAINT `c_autoreg_host_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `value2` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`),
  CONSTRAINT `c_conditions_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,10,0,'0',''),(3,2,8,0,'9',''),(4,2,12,2,'Linux',''),(6,4,23,0,'0',''),(7,5,23,0,'2',''),(8,6,23,0,'4',''),(9,7,2,0,'15930',''),(10,7,1,0,'10263','');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL,
  `refresh_unsupported` varchar(32) NOT NULL DEFAULT '10m',
  `work_period` varchar(255) NOT NULL DEFAULT '1-5,09:00-18:00',
  `alert_usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `default_theme` varchar(128) NOT NULL DEFAULT 'blue-theme',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL,
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  `severity_color_0` varchar(6) NOT NULL DEFAULT '97AAB3',
  `severity_color_1` varchar(6) NOT NULL DEFAULT '7499FF',
  `severity_color_2` varchar(6) NOT NULL DEFAULT 'FFC859',
  `severity_color_3` varchar(6) NOT NULL DEFAULT 'FFA059',
  `severity_color_4` varchar(6) NOT NULL DEFAULT 'E97659',
  `severity_color_5` varchar(6) NOT NULL DEFAULT 'E45959',
  `severity_name_0` varchar(32) NOT NULL DEFAULT 'Not classified',
  `severity_name_1` varchar(32) NOT NULL DEFAULT 'Information',
  `severity_name_2` varchar(32) NOT NULL DEFAULT 'Warning',
  `severity_name_3` varchar(32) NOT NULL DEFAULT 'Average',
  `severity_name_4` varchar(32) NOT NULL DEFAULT 'High',
  `severity_name_5` varchar(32) NOT NULL DEFAULT 'Disaster',
  `ok_period` varchar(32) NOT NULL DEFAULT '5m',
  `blink_period` varchar(32) NOT NULL DEFAULT '2m',
  `problem_unack_color` varchar(6) NOT NULL DEFAULT 'CC0000',
  `problem_ack_color` varchar(6) NOT NULL DEFAULT 'CC0000',
  `ok_unack_color` varchar(6) NOT NULL DEFAULT '009900',
  `ok_ack_color` varchar(6) NOT NULL DEFAULT '009900',
  `problem_unack_style` int(11) NOT NULL DEFAULT '1',
  `problem_ack_style` int(11) NOT NULL DEFAULT '1',
  `ok_unack_style` int(11) NOT NULL DEFAULT '1',
  `ok_ack_style` int(11) NOT NULL DEFAULT '1',
  `snmptrap_logging` int(11) NOT NULL DEFAULT '1',
  `server_check_interval` int(11) NOT NULL DEFAULT '10',
  `hk_events_mode` int(11) NOT NULL DEFAULT '1',
  `hk_events_trigger` varchar(32) NOT NULL DEFAULT '365d',
  `hk_events_internal` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_discovery` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_autoreg` varchar(32) NOT NULL DEFAULT '1d',
  `hk_services_mode` int(11) NOT NULL DEFAULT '1',
  `hk_services` varchar(32) NOT NULL DEFAULT '365d',
  `hk_audit_mode` int(11) NOT NULL DEFAULT '1',
  `hk_audit` varchar(32) NOT NULL DEFAULT '365d',
  `hk_sessions_mode` int(11) NOT NULL DEFAULT '1',
  `hk_sessions` varchar(32) NOT NULL DEFAULT '365d',
  `hk_history_mode` int(11) NOT NULL DEFAULT '1',
  `hk_history_global` int(11) NOT NULL DEFAULT '0',
  `hk_history` varchar(32) NOT NULL DEFAULT '90d',
  `hk_trends_mode` int(11) NOT NULL DEFAULT '1',
  `hk_trends_global` int(11) NOT NULL DEFAULT '0',
  `hk_trends` varchar(32) NOT NULL DEFAULT '365d',
  `default_inventory_mode` int(11) NOT NULL DEFAULT '-1',
  `custom_color` int(11) NOT NULL DEFAULT '0',
  `http_auth_enabled` int(11) NOT NULL DEFAULT '0',
  `http_login_form` int(11) NOT NULL DEFAULT '0',
  `http_strip_domains` varchar(2048) NOT NULL DEFAULT '',
  `http_case_sensitive` int(11) NOT NULL DEFAULT '1',
  `ldap_configured` int(11) NOT NULL DEFAULT '0',
  `ldap_case_sensitive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`configid`),
  KEY `config_1` (`alert_usrgrpid`),
  KEY `config_2` (`discovery_groupid`),
  CONSTRAINT `c_config_2` FOREIGN KEY (`discovery_groupid`) REFERENCES `hstgrp` (`groupid`),
  CONSTRAINT `c_config_1` FOREIGN KEY (`alert_usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'10m','1-5,09:00-18:00',7,'blue-theme',0,'',389,'','','','',1,1,5,50,1000,'97AAB3','7499FF','FFC859','FFA059','E97659','E45959','Not classified','Information','Warning','Average','High','Disaster','5m','2m','CC0000','CC0000','009900','009900',1,1,1,1,1,10,1,'365d','1d','1d','1d',1,'365d',1,'365d',1,'365d',1,0,'90d',1,0,'365d',-1,0,0,0,'',1,0,1);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition`
--

DROP TABLE IF EXISTS `corr_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_1` (`correlationid`),
  CONSTRAINT `c_corr_condition_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition`
--

LOCK TABLES `corr_condition` WRITE;
/*!40000 ALTER TABLE `corr_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_group`
--

DROP TABLE IF EXISTS `corr_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_group` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_group_1` (`groupid`),
  CONSTRAINT `c_corr_condition_group_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`),
  CONSTRAINT `c_corr_condition_group_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_group`
--

LOCK TABLES `corr_condition_group` WRITE;
/*!40000 ALTER TABLE `corr_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tag`
--

DROP TABLE IF EXISTS `corr_condition_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tag` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tag_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tag`
--

LOCK TABLES `corr_condition_tag` WRITE;
/*!40000 ALTER TABLE `corr_condition_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagpair`
--

DROP TABLE IF EXISTS `corr_condition_tagpair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagpair` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `oldtag` varchar(255) NOT NULL DEFAULT '',
  `newtag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagpair_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagpair`
--

LOCK TABLES `corr_condition_tagpair` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagpair` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagpair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagvalue`
--

DROP TABLE IF EXISTS `corr_condition_tagvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagvalue` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagvalue_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagvalue`
--

LOCK TABLES `corr_condition_tagvalue` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_operation`
--

DROP TABLE IF EXISTS `corr_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_operation` (
  `corr_operationid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_operationid`),
  KEY `corr_operation_1` (`correlationid`),
  CONSTRAINT `c_corr_operation_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_operation`
--

LOCK TABLES `corr_operation` WRITE;
/*!40000 ALTER TABLE `corr_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlation` (
  `correlationid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`correlationid`),
  UNIQUE KEY `correlation_2` (`name`),
  KEY `correlation_1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dashboardid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dashboardid`),
  KEY `c_dashboard_1` (`userid`),
  CONSTRAINT `c_dashboard_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,'Global view',1,0),(2,'Zabbix server health',1,1);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_user`
--

DROP TABLE IF EXISTS `dashboard_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_user` (
  `dashboard_userid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_userid`),
  UNIQUE KEY `dashboard_user_1` (`dashboardid`,`userid`),
  KEY `c_dashboard_user_2` (`userid`),
  CONSTRAINT `c_dashboard_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_user_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_user`
--

LOCK TABLES `dashboard_user` WRITE;
/*!40000 ALTER TABLE `dashboard_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usrgrp`
--

DROP TABLE IF EXISTS `dashboard_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_usrgrp` (
  `dashboard_usrgrpid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_usrgrpid`),
  UNIQUE KEY `dashboard_usrgrp_1` (`dashboardid`,`usrgrpid`),
  KEY `c_dashboard_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_dashboard_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_usrgrp_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usrgrp`
--

LOCK TABLES `dashboard_usrgrp` WRITE;
/*!40000 ALTER TABLE `dashboard_usrgrp` DISABLE KEYS */;
INSERT INTO `dashboard_usrgrp` VALUES (1,2,7,3);
/*!40000 ALTER TABLE `dashboard_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `optional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (4000000,4000003);
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(512) NOT NULL DEFAULT '',
  `snmp_community` varchar(255) NOT NULL DEFAULT '',
  `ports` varchar(255) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `uniq` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`),
  CONSTRAINT `c_dchecks_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
INSERT INTO `dchecks` VALUES (2,2,9,'system.uname','','10050','',0,'','',0,0,0,'');
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`),
  CONSTRAINT `c_dhosts_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `iprange` varchar(2048) NOT NULL DEFAULT '',
  `delay` varchar(255) NOT NULL DEFAULT '1h',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`),
  UNIQUE KEY `drules_2` (`name`),
  KEY `drules_1` (`proxy_hostid`),
  CONSTRAINT `c_drules_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
INSERT INTO `drules` VALUES (2,NULL,'Local network','192.168.0.1-254','1h',0,1);
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL,
  `dhostid` bigint(20) unsigned NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `dns` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`),
  CONSTRAINT `c_dservices_2` FOREIGN KEY (`dcheckid`) REFERENCES `dchecks` (`dcheckid`) ON DELETE CASCADE,
  CONSTRAINT `c_dservices_1` FOREIGN KEY (`dhostid`) REFERENCES `dhosts` (`dhostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `eventid` bigint(20) unsigned DEFAULT NULL,
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`escalationid`),
  UNIQUE KEY `escalations_1` (`triggerid`,`itemid`,`escalationid`),
  KEY `escalations_2` (`eventid`),
  KEY `escalations_3` (`nextcheck`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_recovery`
--

DROP TABLE IF EXISTS `event_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_recovery` (
  `eventid` bigint(20) unsigned NOT NULL,
  `r_eventid` bigint(20) unsigned NOT NULL,
  `c_eventid` bigint(20) unsigned DEFAULT NULL,
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `event_recovery_1` (`r_eventid`),
  KEY `event_recovery_2` (`c_eventid`),
  CONSTRAINT `c_event_recovery_3` FOREIGN KEY (`c_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_recovery`
--

LOCK TABLES `event_recovery` WRITE;
/*!40000 ALTER TABLE `event_recovery` DISABLE KEYS */;
INSERT INTO `event_recovery` VALUES (11,15,NULL,NULL,NULL),(14,17,NULL,NULL,NULL),(16,24,NULL,NULL,NULL),(18,20,NULL,NULL,NULL),(19,27,NULL,NULL,NULL),(21,35,NULL,NULL,NULL),(22,36,NULL,NULL,NULL),(23,37,NULL,NULL,NULL),(25,38,NULL,NULL,NULL),(26,39,NULL,NULL,NULL),(28,41,NULL,NULL,NULL),(29,42,NULL,NULL,NULL),(30,43,NULL,NULL,NULL),(31,44,NULL,NULL,NULL),(32,34,NULL,NULL,NULL),(33,45,NULL,NULL,NULL),(40,46,NULL,NULL,NULL),(51,52,NULL,NULL,NULL);
/*!40000 ALTER TABLE `event_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_suppress`
--

DROP TABLE IF EXISTS `event_suppress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_suppress` (
  `event_suppressid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `suppress_until` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_suppressid`),
  UNIQUE KEY `event_suppress_1` (`eventid`,`maintenanceid`),
  KEY `event_suppress_2` (`suppress_until`),
  KEY `event_suppress_3` (`maintenanceid`),
  CONSTRAINT `c_event_suppress_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_suppress_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_suppress`
--

LOCK TABLES `event_suppress` WRITE;
/*!40000 ALTER TABLE `event_suppress` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_suppress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_tag`
--

DROP TABLE IF EXISTS `event_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_tag` (
  `eventtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventtagid`),
  KEY `event_tag_1` (`eventid`),
  CONSTRAINT `c_event_tag_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_tag`
--

LOCK TABLES `event_tag` WRITE;
/*!40000 ALTER TABLE `event_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `name` varchar(2048) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`source`,`object`,`objectid`,`clock`),
  KEY `events_2` (`source`,`object`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,3,4,23261,1554851621,1,0,874424918,'No \"ipmi poller\" processes started.',0),(2,3,0,13476,1554851621,1,0,874424918,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,ipmi poller,avg,busy].avg(10m)\": item is not supported.\".',0),(3,3,4,23262,1554851622,1,0,875064072,'No \"java poller\" processes started.',0),(4,3,0,13477,1554851622,1,0,875064072,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,java poller,avg,busy].avg(10m)\": item is not supported.\".',0),(5,3,4,25367,1554851627,1,0,877564765,'No \"ipmi manager\" processes started.',0),(6,3,4,23267,1554851627,1,0,877667007,'No \"snmp trapper\" processes started.',0),(7,3,0,13482,1554851627,1,0,877667007,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,snmp trapper,avg,busy].avg(10m)\": item is not supported.\".',0),(8,3,0,13563,1554851627,1,0,877564765,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,ipmi manager,avg,busy].avg(10m)\": item is not supported.\".',0),(9,3,4,23328,1554851628,1,0,878260877,'No \"vmware collector\" processes started.',0),(10,3,0,13436,1554851628,1,0,878260877,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,vmware collector,avg,busy].avg(10m)\": item is not supported.\".',0),(11,3,0,13491,1554851631,1,0,811424317,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:agent.ping.nodata(5m)\": item does not have enough data after server start or item creation.\".',0),(12,3,4,23635,1554851635,1,0,883507770,'No \"vmware collector\" processes started.',0),(13,3,0,13537,1554851635,1,0,883507770,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[vmware,buffer,pused].max(10m)\": item is not supported.\".',0),(14,0,0,13491,1554851901,1,0,38467906,'Zabbix agent on Zabbix server is unreachable for 5 minutes',3),(15,3,0,13491,1554851901,0,0,38467906,'',0),(16,3,0,13502,1554851913,1,0,139896557,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:system.uptime.change(0)\": cannot get values from value cache.\".',0),(17,0,0,13491,1554852007,0,0,210948103,'Zabbix agent on Zabbix server is unreachable for 5 minutes',0),(18,3,0,15908,1554852038,1,0,180656451,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:agent.ping.nodata(5m)\": item does not have enough data after server start or item creation.\".',0),(19,0,0,15908,1554852338,1,0,439781345,'Zabbix agent on API ViaCep is unreachable for 5 minutes',3),(20,3,0,15908,1554852338,0,0,439781345,'',0),(21,3,0,13492,1554852488,1,0,627378269,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:agent.version.diff(0)\": cannot get values from value cache.\".',0),(22,3,0,13499,1554852507,1,0,646840808,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:system.hostname.diff(0)\": cannot get values from value cache.\".',0),(23,3,0,13501,1554852512,1,0,651533150,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:system.uname.diff(0)\": cannot get values from value cache.\".',0),(24,3,0,13502,1554852513,0,0,653536080,'',0),(25,3,0,13503,1554852515,1,0,657943048,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:vfs.file.cksum[/etc/passwd].diff(0)\": cannot get values from value cache.\".',0),(26,3,0,13509,1554852527,1,0,675194917,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:agent.hostname.diff(0)\": cannot get values from value cache.\".',0),(27,0,0,15908,1554853491,0,0,348665190,'Zabbix agent on API ViaCep is unreachable for 5 minutes',0),(28,3,0,15907,1554854210,1,0,493430371,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:agent.hostname.diff(0)\": cannot get values from value cache.\".',0),(29,3,0,15909,1554854212,1,0,495443407,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:agent.version.diff(0)\": cannot get values from value cache.\".',0),(30,3,0,15916,1554854233,1,0,533545387,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:system.hostname.diff(0)\": cannot get values from value cache.\".',0),(31,3,0,15918,1554854238,1,0,539986554,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:system.uname.diff(0)\": cannot get values from value cache.\".',0),(32,3,0,15919,1554854239,1,0,540961486,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:system.uptime.change(0)\": cannot get values from value cache.\".',0),(33,3,0,15920,1554854241,1,0,543747739,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:vfs.file.cksum[/etc/passwd].diff(0)\": cannot get values from value cache.\".',0),(34,3,0,15919,1554854839,0,0,305082351,'',0),(35,3,0,13492,1554856088,0,0,845535843,'',0),(36,3,0,13499,1554856107,0,0,878769928,'',0),(37,3,0,13501,1554856112,0,0,883356493,'',0),(38,3,0,13503,1554856115,0,0,889455348,'',0),(39,3,0,13509,1554856127,0,0,904676222,'',0),(40,3,4,28680,1554857610,1,0,854495521,'Value \"0.000824\" of type \"string\" is not suitable for value type \"Numeric (unsigned)\"',0),(41,3,0,15907,1554857810,0,0,151196893,'',0),(42,3,0,15909,1554857812,0,0,157061057,'',0),(43,3,0,15916,1554857833,0,0,198899292,'',0),(44,3,0,15918,1554857838,0,0,207111157,'',0),(45,3,0,15920,1554857841,0,0,211468876,'',0),(46,3,4,28680,1554857880,0,0,263932940,'',0),(47,3,4,28665,1554858705,1,0,432673506,'Cannot find information for this network interface in /proc/net/dev.',0),(48,3,4,28666,1554858706,1,0,433886391,'Cannot find information for this network interface in /proc/net/dev.',0),(49,3,4,28670,1554858710,1,0,439470140,'Cannot find information for this network interface in /proc/net/dev.',0),(50,3,4,28671,1554858711,1,0,440254304,'Cannot find information for this network interface in /proc/net/dev.',0),(51,0,0,15930,1554858838,1,0,655039780,'HTTP service is down on API ViaCep',5),(52,0,0,15930,1554858898,0,0,742089841,'HTTP service is down on API ViaCep',0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL,
  `regexpid` bigint(20) unsigned NOT NULL,
  `expression` varchar(255) NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`),
  CONSTRAINT `c_expressions_1` FOREIGN KEY (`regexpid`) REFERENCES `regexps` (`regexpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
INSERT INTO `expressions` VALUES (1,1,'^(btrfs|ext2|ext3|ext4|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|refs|ntfs|fat32|zfs)$',3,',',0),(3,3,'^(Physical memory|Virtual memory|Memory buffers|Cached memory|Swap space)$',4,',',1),(5,4,'^(MMCSS|gupdate|SysmonLog|clr_optimization_v2.0.50727_32|clr_optimization_v4.0.30319_32)$',4,',',1),(6,5,'^(automatic|automatic delayed)$',3,',',1),(7,2,'^Software Loopback Interface',4,',',1),(8,2,'^(In)?[Ll]oop[Bb]ack[0-9._]*$',4,',',1),(9,2,'^NULL[0-9.]*$',4,',',1),(10,2,'^[Ll]o[0-9.]*$',4,',',1),(11,2,'^[Ss]ystem$',4,',',1),(12,2,'^Nu[0-9.]*$',4,',',1);
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `name` varchar(12) NOT NULL DEFAULT '',
  `parameter` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`name`,`parameter`),
  CONSTRAINT `c_functions_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_functions_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (10199,10019,10016,'diff','0'),(10204,10055,10041,'last','0'),(10207,10058,10044,'diff','0'),(10208,10057,10043,'diff','0'),(12144,22181,13000,'last','0'),(12549,22232,13025,'nodata','5m'),(12550,10020,10047,'nodata','5m'),(12553,10056,10042,'last','0'),(12580,17350,10012,'last','0'),(12583,10025,10021,'change','0'),(12598,22454,13272,'last','0'),(12641,22189,13015,'max','10m'),(12645,22183,13073,'max','10m'),(12646,22191,13074,'max','10m'),(12648,23620,13075,'max','10m'),(12649,22185,13019,'max','10m'),(12651,22396,13017,'max','10m'),(12653,22219,13023,'min','10m'),(12715,22833,13328,'nodata','5m'),(12717,22835,13330,'last','0'),(12718,22836,13331,'last','0'),(12723,22853,13336,'diff','0'),(12724,22856,13337,'last','0'),(12725,22858,13338,'diff','0'),(12726,22859,13339,'change','0'),(12727,22861,13340,'diff','0'),(12728,22862,13341,'last','0'),(12729,22869,13342,'last','0'),(12730,22872,13343,'last','0'),(12731,22873,13344,'nodata','5m'),(12733,22875,13346,'last','0'),(12734,22876,13347,'last','0'),(12739,22893,13352,'diff','0'),(12740,22896,13353,'last','0'),(12741,22898,13354,'diff','0'),(12742,22899,13355,'change','0'),(12743,22901,13356,'diff','0'),(12744,22902,13357,'last','0'),(12745,22909,13358,'last','0'),(12746,22912,13359,'last','0'),(12747,22913,13360,'nodata','5m'),(12755,22933,13368,'diff','0'),(12757,22938,13370,'diff','0'),(12758,22939,13371,'change','0'),(12759,22941,13372,'diff','0'),(12760,22942,13373,'last','0'),(12761,22949,13374,'last','0'),(12762,22952,13375,'last','0'),(12763,22953,13376,'nodata','5m'),(12771,22973,13384,'diff','0'),(12773,22978,13386,'diff','0'),(12775,22981,13388,'diff','0'),(12776,22982,13389,'last','0'),(12777,22989,13390,'last','0'),(12778,22992,13391,'last','0'),(12779,22993,13392,'nodata','5m'),(12782,22996,13395,'last','0'),(12787,23013,13400,'diff','0'),(12788,23016,13401,'last','0'),(12789,23018,13402,'diff','0'),(12790,23019,13403,'change','0'),(12791,23021,13404,'diff','0'),(12792,23022,13405,'last','0'),(12793,23029,13406,'last','0'),(12794,23032,13407,'last','0'),(12795,23033,13408,'nodata','5m'),(12797,23035,13410,'last','0'),(12798,23036,13411,'last','0'),(12803,23053,13416,'diff','0'),(12805,23058,13418,'diff','0'),(12806,23059,13419,'change','0'),(12807,23061,13420,'diff','0'),(12808,23062,13421,'last','0'),(12809,23069,13422,'last','0'),(12810,23072,13423,'last','0'),(12812,23149,13425,'diff','0'),(12815,23150,13428,'change','0'),(12818,23668,13431,'min','10m'),(12820,23158,13433,'last','0'),(12824,23160,13437,'nodata','5m'),(12826,23165,13439,'last','0'),(12895,23271,13486,'min','10m'),(12896,23273,13487,'max','10m'),(12897,23274,13488,'max','10m'),(12898,23275,13489,'max','10m'),(12899,23276,13490,'max','10m'),(12900,23287,13491,'nodata','5m'),(12902,23289,13493,'last','0'),(12903,23290,13494,'last','0'),(12908,23307,13499,'diff','0'),(12909,23310,13500,'last','0'),(12910,23312,13501,'diff','0'),(12911,23313,13502,'change','0'),(12912,23315,13503,'diff','0'),(12913,23316,13504,'last','0'),(12914,23282,13505,'last','0'),(12926,22231,13026,'diff','0'),(12927,10059,10045,'diff','0'),(12928,23288,13492,'diff','0'),(12929,22834,13329,'diff','0'),(12930,22874,13345,'diff','0'),(12931,22914,13361,'diff','0'),(12932,22954,13377,'diff','0'),(12933,22994,13393,'diff','0'),(12934,23034,13409,'diff','0'),(12935,23161,13438,'diff','0'),(12936,23318,13507,'diff','0'),(12937,23319,13508,'diff','0'),(12938,23327,13509,'diff','0'),(12939,23320,13510,'diff','0'),(12940,23321,13511,'diff','0'),(12941,23322,13512,'diff','0'),(12942,23323,13513,'diff','0'),(12943,23324,13514,'diff','0'),(12944,23325,13515,'diff','0'),(12945,23326,13516,'diff','0'),(12946,23357,13517,'max','10m'),(12947,23342,13518,'max','10m'),(12948,23341,13519,'max','10m'),(12949,23359,13520,'min','10m'),(12965,23634,13536,'max','10m'),(12966,23635,13537,'max','10m'),(12994,23644,13544,'max','#3'),(12995,23645,13545,'max','#3'),(12996,23646,13546,'max','#3'),(12997,23647,13547,'max','#3'),(12998,23648,13548,'max','#3'),(13068,23115,13367,'avg','5m'),(13069,22922,13366,'avg','5m'),(13070,22918,13365,'avg','5m'),(13071,22917,13364,'avg','5m'),(13072,22882,13350,'avg','5m'),(13073,22878,13349,'avg','5m'),(13074,22877,13348,'avg','5m'),(13075,22962,13382,'avg','5m'),(13078,10010,10010,'avg','5m'),(13079,23296,13497,'avg','5m'),(13080,17362,13243,'avg','5m'),(13081,23301,13498,'avg','5m'),(13082,10009,10190,'avg','5m'),(13083,23292,13496,'avg','5m'),(13084,10013,10011,'avg','5m'),(13085,23291,13495,'avg','5m'),(13086,23042,13414,'avg','5m'),(13087,22842,13334,'avg','5m'),(13088,22838,13333,'avg','5m'),(13089,22837,13332,'avg','5m'),(13090,23007,13399,'avg','5m'),(13091,23002,13398,'avg','5m'),(13092,22998,13397,'avg','5m'),(13093,22997,13396,'avg','5m'),(13094,23143,13435,'avg','5m'),(13095,23140,13430,'avg','5m'),(13152,23651,13551,'max','#3'),(13154,23649,13549,'max','#3'),(13156,23650,13550,'max','#3'),(13157,23652,13552,'max','#3'),(13158,23653,13553,'max','#3'),(13159,23654,13285,'max','#3'),(13160,23661,13557,'last',''),(13161,23662,13558,'last',''),(13164,22424,13080,'avg','10m'),(13165,23252,13467,'avg','10m'),(13170,22412,13081,'avg','10m'),(13171,23253,13468,'avg','10m'),(13172,22430,13083,'avg','10m'),(13173,23255,13470,'avg','10m'),(13174,22422,13084,'avg','10m'),(13175,23256,13471,'avg','10m'),(13176,22406,13085,'avg','10m'),(13177,23257,13472,'avg','10m'),(13178,22408,13086,'avg','30m'),(13179,23258,13473,'avg','30m'),(13180,22402,13087,'avg','10m'),(13181,23259,13474,'avg','10m'),(13182,22418,13088,'avg','10m'),(13183,23260,13475,'avg','10m'),(13184,22416,13089,'avg','10m'),(13185,23261,13476,'avg','10m'),(13186,22689,13275,'avg','10m'),(13187,23262,13477,'avg','10m'),(13188,22399,13091,'avg','10m'),(13189,23264,13479,'avg','10m'),(13190,22420,13092,'avg','10m'),(13191,23265,13480,'avg','10m'),(13192,22414,13093,'min','10m'),(13193,23266,13481,'min','10m'),(13194,23171,13441,'avg','10m'),(13195,23267,13482,'avg','10m'),(13196,23663,13559,'avg','10m'),(13197,23664,13560,'avg','10m'),(13198,22426,13094,'avg','10m'),(13199,23268,13483,'avg','10m'),(13200,22404,13095,'avg','10m'),(13201,23269,13484,'avg','10m'),(13202,22400,13096,'avg','10m'),(13203,23270,13485,'avg','10m'),(13204,22401,13097,'avg','10m'),(13205,23328,13436,'avg','10m'),(13206,23347,13521,'avg','10m'),(13207,23360,13534,'avg','10m'),(13208,23352,13522,'avg','10m'),(13209,23351,13535,'avg','10m'),(13210,23350,13523,'avg','10m'),(13211,23353,13524,'avg','30m'),(13212,23354,13525,'avg','10m'),(13213,23356,13526,'avg','10m'),(13214,23355,13527,'avg','10m'),(13215,23349,13528,'avg','10m'),(13216,23348,13529,'avg','10m'),(13217,23343,13530,'avg','10m'),(13218,23344,13531,'avg','10m'),(13219,23345,13532,'avg','10m'),(13220,23346,13533,'avg','10m'),(13221,23666,13561,'min','#3'),(13222,25366,13562,'avg','10m'),(13223,25367,13563,'avg','10m'),(13224,25368,13564,'avg','10m'),(13225,25369,13565,'avg','10m'),(13226,25370,13566,'avg','10m'),(13227,25371,13567,'avg','10m'),(13228,25665,13568,'avg','10m'),(13229,25666,13569,'avg','10m'),(13230,25667,13570,'avg','10m'),(13231,25668,13571,'avg','10m'),(14257,26909,14168,'last','0'),(14258,26908,14168,'last','0'),(14259,26899,14169,'last','0'),(14260,26903,14169,'last','0'),(14261,26902,14170,'last','0'),(14262,26901,14170,'last','0'),(14263,26864,14171,'last','0'),(14264,26882,14171,'last','0'),(14265,26866,14172,'last','0'),(14266,26865,14172,'last','0'),(14267,26861,14173,'last','0'),(14268,26862,14173,'last','0'),(14269,26858,14174,'last','0'),(14270,26856,14174,'last','0'),(14271,26868,14175,'last','0'),(14272,26860,14175,'last','0'),(14273,26877,14176,'last','0'),(14274,26878,14176,'last','0'),(14275,26880,14177,'last','0'),(14276,26879,14177,'last','0'),(14277,26881,14178,'last','0'),(14278,26887,14179,'last','0'),(14279,26895,14179,'last','0'),(14280,26889,14180,'last','0'),(14281,26884,14180,'last','0'),(14282,26906,14181,'last','0'),(14283,26896,14181,'last','0'),(14284,26907,14182,'last','0'),(14285,26908,14182,'last','0'),(14286,26904,14183,'last','0'),(14287,26903,14183,'last','0'),(14288,26900,14184,'last','0'),(14289,26901,14184,'last','0'),(14290,26883,14185,'last','0'),(14291,26882,14185,'last','0'),(14292,26863,14186,'last','0'),(14293,26865,14186,'last','0'),(14294,26867,14187,'last','0'),(14295,26862,14187,'last','0'),(14296,26857,14188,'last','0'),(14297,26856,14188,'last','0'),(14298,26859,14189,'last','0'),(14299,26860,14189,'last','0'),(14300,26869,14190,'last','0'),(14301,26878,14190,'last','0'),(14302,26876,14191,'nodata','5m'),(14303,26875,14192,'str','Server'),(14304,26893,14193,'str','Client'),(14305,26924,14194,'last','0'),(14306,26932,14195,'last','0'),(14307,26932,14196,'last','0'),(14308,26930,14197,'last','0'),(14309,26930,14198,'last','0'),(14310,26931,14199,'last','0'),(14311,26931,14200,'last','0'),(14312,26929,14201,'last','0'),(14313,26929,14202,'last','0'),(14314,26928,14203,'last','0'),(14315,26928,14204,'last','0'),(14316,26925,14205,'last','0'),(14317,26943,14206,'last','0'),(14318,26943,14207,'last','0'),(14319,26939,14208,'last','0'),(14320,26939,14209,'last','0'),(14321,26940,14210,'last','0'),(14322,26940,14211,'last','0'),(14323,26941,14212,'last','0'),(14324,26941,14213,'last','0'),(14325,26942,14214,'last','0'),(14326,26942,14215,'last','0'),(14327,26938,14216,'last','0'),(14328,26938,14217,'last','0'),(14329,26937,14218,'last','0'),(14330,26937,14219,'last','0'),(14331,26933,14220,'last','0'),(14332,26933,14221,'last','0'),(14333,26934,14222,'last','0'),(14334,26935,14223,'last','0'),(14335,26935,14224,'last','0'),(14336,26936,14225,'last','0'),(14337,26936,14226,'last','0'),(14370,27036,14243,'avg','5m'),(14372,27044,14245,'avg','5m'),(14373,27044,14246,'avg','5m'),(14374,27052,14247,'avg','5m'),(14376,27060,14249,'avg','5m'),(14377,27060,14250,'avg','5m'),(14378,27067,14251,'max','#3'),(14379,27066,14252,'min','5m'),(14380,27065,14253,'avg','5m'),(14463,27138,14288,'max','#3'),(14464,27139,14289,'min','5m'),(14465,27140,14290,'avg','5m'),(14468,27149,14293,'max','#3'),(14469,27150,14294,'min','5m'),(14470,27151,14295,'avg','5m'),(14508,27192,14311,'max','#3'),(14509,27193,14312,'min','5m'),(14510,27194,14313,'avg','5m'),(14513,27208,14316,'avg','5m'),(14514,27205,14317,'avg','5m'),(14515,27212,14318,'avg','5m'),(14516,27212,14318,'max','5m'),(14517,27212,14319,'avg','5m'),(14518,27212,14319,'max','5m'),(14519,27212,14320,'avg','5m'),(14520,27212,14320,'min','5m'),(14522,27214,14322,'diff',''),(14523,27214,14322,'strlen',''),(14536,27225,14327,'max','#3'),(14537,27226,14328,'min','5m'),(14538,27227,14329,'avg','5m'),(14541,27240,14332,'avg','5m'),(14542,27239,14333,'avg','5m'),(14545,27237,14336,'diff',''),(14546,27237,14336,'strlen',''),(14547,27236,14337,'diff',''),(14548,27236,14337,'strlen',''),(14552,27247,14339,'avg','5m'),(14553,27247,14339,'max','5m'),(14554,27247,14340,'avg','5m'),(14555,27247,14340,'min','5m'),(14570,27261,14347,'max','#3'),(14571,27262,14348,'min','5m'),(14572,27263,14349,'avg','5m'),(14587,27282,14356,'max','#3'),(14588,27283,14357,'min','5m'),(14589,27284,14358,'avg','5m'),(14592,27294,14361,'avg','5m'),(14593,27293,14362,'avg','5m'),(14594,27296,14363,'diff',''),(14595,27296,14363,'strlen',''),(14596,27295,14364,'diff',''),(14597,27295,14364,'strlen',''),(14598,27297,14365,'diff',''),(14599,27297,14365,'strlen',''),(14600,27299,14366,'avg','5m'),(14601,27301,14367,'avg','5m'),(14602,27298,14368,'avg','5m'),(14603,27300,14369,'avg','5m'),(14606,27314,14372,'avg','5m'),(14607,27314,14372,'max','5m'),(14608,27314,14373,'avg','5m'),(14609,27314,14373,'max','5m'),(14610,27314,14374,'avg','5m'),(14611,27314,14374,'min','5m'),(14612,27315,14375,'avg','5m'),(14613,27315,14375,'max','5m'),(14614,27315,14376,'avg','5m'),(14615,27315,14376,'max','5m'),(14616,27315,14377,'avg','5m'),(14617,27315,14377,'min','5m'),(14620,27318,14380,'avg','5m'),(14621,27318,14380,'max','5m'),(14622,27318,14381,'avg','5m'),(14623,27318,14381,'max','5m'),(14624,27318,14382,'avg','5m'),(14625,27318,14382,'min','5m'),(14626,27320,14383,'diff',''),(14627,27320,14383,'strlen',''),(14641,27333,14389,'max','#3'),(14642,27334,14390,'min','5m'),(14643,27335,14391,'avg','5m'),(14663,27365,14403,'max','#3'),(14664,27366,14404,'min','5m'),(14665,27367,14405,'avg','5m'),(14668,27376,14408,'avg','5m'),(14669,27378,14409,'diff',''),(14670,27378,14409,'strlen',''),(14671,27380,14410,'avg','5m'),(14672,27385,14411,'diff',''),(14673,27385,14411,'strlen',''),(14676,27382,14413,'diff',''),(14677,27382,14413,'strlen',''),(14678,27414,14414,'avg','5m'),(14679,27417,14415,'avg','5m'),(14681,27419,14417,'diff',''),(14682,27419,14417,'strlen',''),(14689,27421,14420,'avg','5m'),(14690,27421,14420,'min','5m'),(14693,27424,14423,'avg','5m'),(14695,27442,14425,'avg','5m'),(14696,27427,14426,'avg','5m'),(14698,27428,14428,'diff',''),(14699,27428,14428,'strlen',''),(14702,27445,14430,'diff',''),(14703,27445,14430,'strlen',''),(14722,27430,14437,'avg','5m'),(14723,27430,14437,'min','5m'),(14726,27447,14439,'avg','5m'),(14727,27447,14439,'min','5m'),(14747,27462,14451,'max','#3'),(14748,27463,14452,'min','5m'),(14749,27464,14453,'avg','5m'),(14752,27478,14456,'avg','5m'),(14753,27477,14457,'avg','5m'),(14756,27485,14460,'avg','5m'),(14757,27485,14460,'max','5m'),(14758,27485,14461,'avg','5m'),(14759,27485,14461,'max','5m'),(14760,27485,14462,'avg','5m'),(14761,27485,14462,'min','5m'),(14762,27483,14463,'diff',''),(14763,27483,14463,'strlen',''),(14776,27496,14468,'max','#3'),(14777,27497,14469,'min','5m'),(14778,27498,14470,'avg','5m'),(14781,27511,14473,'avg','5m'),(14782,27509,14474,'diff',''),(14783,27509,14474,'strlen',''),(14784,27516,14475,'avg','5m'),(14785,27517,14476,'avg','5m'),(14786,27517,14476,'max','5m'),(14787,27517,14477,'avg','5m'),(14788,27517,14477,'max','5m'),(14789,27517,14478,'avg','5m'),(14790,27517,14478,'min','5m'),(14806,27532,14486,'max','#3'),(14807,27533,14487,'min','5m'),(14808,27534,14488,'avg','5m'),(14811,27547,14491,'avg','5m'),(14812,27545,14492,'diff',''),(14813,27545,14492,'strlen',''),(14814,27544,14493,'diff',''),(14815,27544,14493,'strlen',''),(14816,27552,14494,'avg','5m'),(14817,27553,14495,'avg','5m'),(14818,27553,14495,'max','5m'),(14819,27553,14496,'avg','5m'),(14820,27553,14496,'max','5m'),(14821,27553,14497,'avg','5m'),(14822,27553,14497,'min','5m'),(14838,27568,14505,'max','#3'),(14839,27569,14506,'min','5m'),(14840,27570,14507,'avg','5m'),(14843,27586,14510,'avg','5m'),(14844,27584,14511,'avg','5m'),(14845,27584,14511,'max','5m'),(14849,27584,14513,'avg','5m'),(14850,27584,14513,'min','5m'),(14851,27582,14514,'diff',''),(14852,27582,14514,'strlen',''),(14853,27579,14515,'diff',''),(14854,27579,14515,'strlen',''),(14855,27590,14516,'avg','5m'),(14871,27608,14524,'max','#3'),(14872,27609,14525,'min','5m'),(14873,27610,14526,'avg','5m'),(14889,27631,14534,'max','#3'),(14890,27632,14535,'min','5m'),(14891,27633,14536,'avg','5m'),(14907,27654,14544,'max','#3'),(14908,27655,14545,'min','5m'),(14909,27656,14546,'avg','5m'),(14912,27671,14549,'avg','5m'),(14913,27670,14550,'avg','5m'),(14914,27672,14551,'avg','5m'),(14915,27672,14551,'max','5m'),(14916,27672,14552,'avg','5m'),(14917,27672,14552,'max','5m'),(14918,27672,14553,'avg','5m'),(14919,27672,14553,'min','5m'),(14922,27678,14556,'diff',''),(14923,27678,14556,'strlen',''),(14924,27677,14557,'diff',''),(14925,27677,14557,'strlen',''),(14972,27734,14582,'max','#3'),(14973,27735,14583,'min','5m'),(14974,27736,14584,'avg','5m'),(14977,27753,14587,'avg','5m'),(14978,27752,14588,'avg','5m'),(14979,27751,14589,'avg','5m'),(14980,27751,14589,'max','5m'),(14981,27751,14590,'avg','5m'),(14982,27751,14590,'max','5m'),(14983,27751,14591,'avg','5m'),(14984,27751,14591,'min','5m'),(14985,27750,14592,'diff',''),(14986,27750,14592,'strlen',''),(15000,27766,14598,'max','#3'),(15001,27767,14599,'min','5m'),(15002,27768,14600,'avg','5m'),(15005,27777,14603,'diff',''),(15006,27777,14603,'strlen',''),(15013,27784,14606,'avg','5m'),(15014,27784,14606,'min','5m'),(15015,27785,14607,'diff',''),(15016,27785,14607,'strlen',''),(15032,27800,14615,'max','#3'),(15033,27801,14616,'min','5m'),(15034,27802,14617,'avg','5m'),(15038,27813,14621,'diff',''),(15039,27813,14621,'strlen',''),(15040,27820,14622,'avg','5m'),(15041,27819,14623,'avg','5m'),(15042,27821,14624,'avg','5m'),(15043,27821,14624,'max','5m'),(15044,27821,14625,'avg','5m'),(15045,27821,14625,'max','5m'),(15046,27821,14626,'avg','5m'),(15047,27821,14626,'min','5m'),(15094,27882,14652,'max','#3'),(15095,27883,14653,'min','5m'),(15096,27884,14654,'avg','5m'),(15099,27899,14657,'avg','5m'),(15100,27897,14658,'avg','5m'),(15101,27897,14658,'max','5m'),(15102,27897,14659,'avg','5m'),(15103,27897,14659,'max','5m'),(15104,27897,14660,'avg','5m'),(15105,27897,14660,'min','5m'),(15106,27894,14661,'diff',''),(15107,27894,14661,'strlen',''),(15108,27895,14662,'diff',''),(15109,27895,14662,'strlen',''),(15110,27904,14663,'avg','5m'),(15111,27905,14664,'avg','5m'),(15112,27905,14664,'max','5m'),(15113,27905,14665,'avg','5m'),(15114,27905,14665,'max','5m'),(15115,27905,14666,'avg','5m'),(15116,27905,14666,'min','5m'),(15117,27906,14667,'avg','5m'),(15118,27906,14668,'avg','5m'),(15131,27919,14673,'max','#3'),(15132,27920,14674,'min','5m'),(15133,27921,14675,'avg','5m'),(15136,27936,14678,'avg','5m'),(15137,27933,14679,'avg','5m'),(15138,27931,14680,'diff',''),(15139,27931,14680,'strlen',''),(15146,27941,14683,'avg','5m'),(15147,27941,14683,'min','5m'),(15163,27956,14691,'max','#3'),(15164,27957,14692,'min','5m'),(15165,27958,14693,'avg','5m'),(15168,27975,14696,'avg','5m'),(15169,27974,14697,'avg','5m'),(15170,27970,14698,'diff',''),(15171,27970,14698,'strlen',''),(15172,27967,14699,'diff',''),(15173,27967,14699,'strlen',''),(15186,27986,14704,'max','#3'),(15187,27987,14705,'min','5m'),(15188,27988,14706,'avg','5m'),(15191,27999,14709,'diff',''),(15192,27999,14709,'strlen',''),(15193,27998,14710,'diff',''),(15194,27998,14710,'strlen',''),(15195,28003,14711,'avg','5m'),(15196,28004,14712,'avg','5m'),(15209,28015,14717,'max','#3'),(15210,28016,14718,'min','5m'),(15211,28017,14719,'avg','5m'),(15214,28031,14722,'avg','5m'),(15215,28028,14723,'avg','5m'),(15216,28027,14724,'diff',''),(15217,28027,14724,'strlen',''),(15580,28045,14860,'avg','5m'),(15581,28046,14861,'avg','5m'),(15582,28046,14862,'avg','5m'),(15597,28070,14869,'max','#3'),(15598,28071,14870,'min','5m'),(15599,28072,14871,'avg','5m'),(15602,28084,14874,'avg','5m'),(15603,28085,14875,'avg','5m'),(15604,28085,14876,'avg','5m'),(15618,28107,14882,'max','#3'),(15619,28108,14883,'min','5m'),(15620,28109,14884,'avg','5m'),(15678,28130,14906,'max','#3'),(15679,28131,14907,'min','5m'),(15680,28132,14908,'avg','5m'),(15683,28143,14911,'avg','5m'),(15684,28142,14912,'diff',''),(15685,28142,14912,'strlen',''),(15686,28141,14913,'diff',''),(15687,28141,14913,'strlen',''),(15688,28150,14914,'avg','5m'),(15689,28150,14914,'max','5m'),(15690,28150,14915,'avg','5m'),(15691,28150,14915,'max','5m'),(15692,28150,14916,'avg','5m'),(15693,28150,14916,'min','5m'),(15694,28151,14917,'avg','5m'),(15697,28162,14920,'avg','5m'),(15698,28163,14921,'avg','5m'),(15699,28163,14922,'avg','5m'),(15713,28185,14928,'max','#3'),(15714,28186,14929,'min','5m'),(15715,28187,14930,'avg','5m'),(15721,28201,14934,'avg','5m'),(15722,28201,14934,'max','5m'),(15723,28201,14935,'avg','5m'),(15724,28201,14935,'min','5m'),(15726,28204,14937,'diff',''),(15727,28204,14937,'strlen',''),(15729,27030,14939,'last',''),(15730,27607,14940,'last',''),(15731,27032,14941,'last',''),(15732,27191,14942,'last',''),(15733,27332,14943,'last',''),(15734,27461,14944,'last',''),(15735,27531,14945,'last',''),(15736,27567,14946,'last',''),(15737,27630,14947,'last',''),(15738,27653,14948,'last',''),(15739,27733,14949,'last',''),(15740,27799,14950,'last',''),(15741,27955,14951,'last',''),(15742,28069,14952,'last',''),(15743,28129,14953,'last',''),(15744,27038,14954,'avg','5m'),(15745,27054,14955,'avg','5m'),(15746,28052,14956,'avg','5m'),(15747,28091,14957,'avg','5m'),(15748,28169,14958,'avg','5m'),(16352,27143,15161,'max','{$SNMP_TIMEOUT}'),(16353,27618,15162,'max','{$SNMP_TIMEOUT}'),(16354,28025,15163,'max','{$SNMP_TIMEOUT}'),(16375,27154,15170,'max','{$SNMP_TIMEOUT}'),(16376,27202,15171,'max','{$SNMP_TIMEOUT}'),(16377,27235,15172,'max','{$SNMP_TIMEOUT}'),(16378,27271,15173,'max','{$SNMP_TIMEOUT}'),(16379,27292,15174,'max','{$SNMP_TIMEOUT}'),(16380,27343,15175,'max','{$SNMP_TIMEOUT}'),(16381,27375,15176,'max','{$SNMP_TIMEOUT}'),(16382,27472,15177,'max','{$SNMP_TIMEOUT}'),(16383,27506,15178,'max','{$SNMP_TIMEOUT}'),(16384,27542,15179,'max','{$SNMP_TIMEOUT}'),(16385,27578,15180,'max','{$SNMP_TIMEOUT}'),(16386,27641,15181,'max','{$SNMP_TIMEOUT}'),(16387,27664,15182,'max','{$SNMP_TIMEOUT}'),(16388,27744,15183,'max','{$SNMP_TIMEOUT}'),(16389,27776,15184,'max','{$SNMP_TIMEOUT}'),(16390,27810,15185,'max','{$SNMP_TIMEOUT}'),(16391,27892,15186,'max','{$SNMP_TIMEOUT}'),(16392,27929,15187,'max','{$SNMP_TIMEOUT}'),(16393,27966,15188,'max','{$SNMP_TIMEOUT}'),(16394,27996,15189,'max','{$SNMP_TIMEOUT}'),(16395,28080,15190,'max','{$SNMP_TIMEOUT}'),(16396,28117,15191,'max','{$SNMP_TIMEOUT}'),(16397,28140,15192,'max','{$SNMP_TIMEOUT}'),(16398,28195,15193,'max','{$SNMP_TIMEOUT}'),(16445,28210,15208,'diff',''),(16446,28210,15208,'strlen',''),(16447,28208,15209,'diff',''),(16448,28208,15209,'strlen',''),(16457,28218,15214,'avg','5m'),(16458,28218,15214,'min','5m'),(16459,28221,15215,'avg','5m'),(16472,28233,15220,'max','#3'),(16473,28234,15221,'min','5m'),(16474,28235,15222,'avg','5m'),(16476,28243,15224,'max','{$SNMP_TIMEOUT}'),(16477,28246,15225,'avg','5m'),(16484,28247,15228,'avg','5m'),(16818,27213,15330,'count','#1,{$FAN_CRIT_STATUS},eq'),(16819,27479,15331,'count','#1,{$PSU_CRIT_STATUS},eq'),(16820,27479,15332,'count','#1,{$PSU_OK_STATUS},ne'),(16821,27480,15333,'count','#1,{$FAN_CRIT_STATUS},eq'),(16822,27480,15334,'count','#1,{$FAN_OK_STATUS},ne'),(16823,27784,15335,'avg','5m'),(16824,27783,15335,'last','0'),(16825,27784,15335,'max','5m'),(16826,27784,15336,'avg','5m'),(16827,27783,15336,'last','0'),(16828,27784,15336,'max','5m'),(16829,27786,15337,'count','#1,{$PSU_CRIT_STATUS},eq'),(16830,27786,15338,'count','#1,{$PSU_WARN_STATUS},eq'),(16831,27787,15339,'count','#1,{$FAN_CRIT_STATUS},eq'),(16832,27554,15340,'count','#1,{$PSU_CRIT_STATUS},eq'),(16833,27555,15341,'count','#1,{$FAN_CRIT_STATUS},eq'),(16834,27421,15342,'avg','5m'),(16835,27420,15342,'last','0'),(16836,27421,15342,'max','5m'),(16837,27421,15343,'avg','5m'),(16838,27420,15343,'last','0'),(16839,27421,15343,'max','5m'),(16840,27422,15344,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16841,27422,15344,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16842,27422,15345,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16843,27422,15345,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16844,27423,15346,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16845,27423,15346,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16846,27423,15347,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16847,27423,15347,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16848,27430,15348,'avg','5m'),(16849,27429,15348,'last','0'),(16850,27430,15348,'max','5m'),(16851,27447,15349,'avg','5m'),(16852,27446,15349,'last','0'),(16853,27447,15349,'max','5m'),(16854,28218,15350,'avg','5m'),(16855,28217,15350,'last','0'),(16856,28218,15350,'max','5m'),(16857,27430,15351,'avg','5m'),(16858,27429,15351,'last','0'),(16859,27430,15351,'max','5m'),(16860,27447,15352,'avg','5m'),(16861,27446,15352,'last','0'),(16862,27447,15352,'max','5m'),(16863,28218,15353,'avg','5m'),(16864,28217,15353,'last','0'),(16865,28218,15353,'max','5m'),(16866,27431,15354,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16867,27431,15354,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16868,27448,15355,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16869,27448,15355,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16870,28216,15356,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16871,28216,15356,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16872,27431,15357,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16873,27431,15357,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16874,27448,15358,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16875,27448,15358,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16876,28216,15359,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16877,28216,15359,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16878,27432,15360,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16879,27432,15360,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16880,27449,15361,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16881,27449,15361,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16882,28215,15362,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16883,28215,15362,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16884,27432,15363,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16885,27432,15363,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16886,27449,15364,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16887,27449,15364,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16888,28215,15365,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16889,28215,15365,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16890,27518,15366,'count','#1,{$PSU_CRIT_STATUS},eq'),(16891,27519,15367,'count','#1,{$FAN_CRIT_STATUS},eq'),(16892,27584,15368,'avg','5m'),(16893,27585,15368,'last','0'),(16894,27584,15368,'max','5m'),(16895,27593,15369,'count','#1,{$PSU_CRIT_STATUS},eq'),(16896,27595,15370,'count','#1,{$FAN_CRIT_STATUS},eq'),(16897,27673,15371,'count','#1,{$FAN_CRIT_STATUS:\"fanError\"},eq'),(16898,27673,15371,'count','#1,{$FAN_CRIT_STATUS:\"hardwareFaulty\"},eq'),(16899,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"psuError\"},eq'),(16900,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"rpsError\"},eq'),(16901,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"hardwareFaulty\"},eq'),(16902,28154,15373,'count','#1,{$FAN_CRIT_STATUS:\"bad\"},eq'),(16903,28154,15374,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16904,28155,15375,'count','#1,{$PSU_CRIT_STATUS:\"bad\"},eq'),(16905,28155,15376,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16906,27822,15377,'count','#1,{$FAN_CRIT_STATUS},eq'),(16907,27823,15378,'count','#1,{$PSU_CRIT_STATUS},eq'),(16908,27312,15379,'count','#1,{$PSU_CRIT_STATUS},eq'),(16909,27312,15380,'count','#1,{$PSU_OK_STATUS},ne'),(16910,27313,15381,'count','#1,{$FAN_CRIT_STATUS},eq'),(16911,27313,15382,'count','#1,{$FAN_OK_STATUS},ne'),(16912,27316,15383,'count','#1,{$PSU_CRIT_STATUS},eq'),(16913,27316,15384,'count','#1,{$PSU_OK_STATUS},ne'),(16914,27317,15385,'count','#1,{$FAN_CRIT_STATUS},eq'),(16915,27317,15386,'count','#1,{$FAN_OK_STATUS},ne'),(16916,28201,15387,'avg','5m'),(16917,28200,15387,'last','0'),(16918,28201,15387,'max','5m'),(16919,28202,15388,'count','#1,{$FAN_CRIT_STATUS},eq'),(16920,28206,15389,'count','#1,{$PSU_CRIT_STATUS},eq'),(16921,27247,15390,'avg','5m'),(16922,27246,15390,'last','0'),(16923,27247,15390,'max','5m'),(16924,27248,15391,'count','#1,{$PSU_CRIT_STATUS},eq'),(16925,27248,15392,'count','#1,{$PSU_OK_STATUS},ne'),(16926,27250,15393,'count','#1,{$FAN_CRIT_STATUS},eq'),(16927,27250,15394,'count','#1,{$FAN_OK_STATUS},ne'),(16928,27755,15395,'count','#1,{$FAN_CRIT_STATUS},eq'),(16929,27941,15396,'avg','5m'),(16930,27940,15396,'last','0'),(16931,27941,15396,'max','5m'),(16932,27941,15397,'avg','5m'),(16933,27940,15397,'last','0'),(16934,27941,15397,'max','5m'),(16935,27942,15398,'count','#1,{$FAN_CRIT_STATUS:\"failed\"},eq'),(16936,27943,15399,'count','#1,{$PSU_CRIT_STATUS:\"failed\"},eq'),(17237,27077,15490,'last',''),(17238,27077,15490,'diff',''),(17241,27604,15492,'last',''),(17242,27604,15492,'diff',''),(17243,28013,15493,'last',''),(17244,28013,15493,'diff',''),(17249,27087,15496,'last',''),(17250,27087,15496,'diff',''),(17253,27627,15498,'last',''),(17254,27627,15498,'diff',''),(17255,27984,15499,'last',''),(17256,27984,15499,'diff',''),(17261,27127,15502,'last',''),(17262,27127,15502,'diff',''),(17265,28105,15504,'last',''),(17266,28105,15504,'diff',''),(17269,27097,15506,'last',''),(17270,27097,15506,'diff',''),(17273,27107,15508,'last',''),(17274,27107,15508,'diff',''),(17277,27188,15510,'last',''),(17278,27188,15510,'diff',''),(17279,27223,15511,'last',''),(17280,27223,15511,'diff',''),(17281,27259,15512,'last',''),(17282,27259,15512,'diff',''),(17283,27280,15513,'last',''),(17284,27280,15513,'diff',''),(17285,27329,15514,'last',''),(17286,27329,15514,'diff',''),(17287,27458,15515,'last',''),(17288,27458,15515,'diff',''),(17289,27494,15516,'last',''),(17290,27494,15516,'diff',''),(17291,27528,15517,'last',''),(17292,27528,15517,'diff',''),(17293,27564,15518,'last',''),(17294,27564,15518,'diff',''),(17295,27650,15519,'last',''),(17296,27650,15519,'diff',''),(17297,27730,15520,'last',''),(17298,27730,15520,'diff',''),(17299,27764,15521,'last',''),(17300,27764,15521,'diff',''),(17301,27796,15522,'last',''),(17302,27796,15522,'diff',''),(17303,27880,15523,'last',''),(17304,27880,15523,'diff',''),(17305,27917,15524,'last',''),(17306,27917,15524,'diff',''),(17307,27952,15525,'last',''),(17308,27952,15525,'diff',''),(17309,28066,15526,'last',''),(17310,28066,15526,'diff',''),(17311,28126,15527,'last',''),(17312,28126,15527,'diff',''),(17313,28183,15528,'last',''),(17314,28183,15528,'diff',''),(17315,28231,15529,'last',''),(17316,28231,15529,'diff',''),(17357,27074,15550,'avg','15m'),(17358,27071,15550,'last',''),(17359,27075,15550,'avg','15m'),(17360,27076,15551,'avg','5m'),(17361,27073,15551,'avg','5m'),(17367,27599,15553,'avg','15m'),(17368,27603,15553,'last',''),(17369,27602,15553,'avg','15m'),(17370,28008,15554,'avg','15m'),(17371,28012,15554,'last',''),(17372,28011,15554,'avg','15m'),(17373,27598,15555,'avg','5m'),(17374,27601,15555,'avg','5m'),(17375,28007,15556,'avg','5m'),(17376,28010,15556,'avg','5m'),(17387,27084,15559,'avg','15m'),(17388,27081,15559,'last',''),(17389,27085,15559,'avg','15m'),(17390,27086,15560,'avg','5m'),(17391,27083,15560,'avg','5m'),(17397,27622,15562,'avg','15m'),(17398,27626,15562,'last',''),(17399,27625,15562,'avg','15m'),(17400,27979,15563,'avg','15m'),(17401,27983,15563,'last',''),(17402,27982,15563,'avg','15m'),(17403,27621,15564,'avg','5m'),(17404,27624,15564,'avg','5m'),(17405,27978,15565,'avg','5m'),(17406,27981,15565,'avg','5m'),(17417,27124,15568,'avg','15m'),(17418,27121,15568,'last',''),(17419,27125,15568,'avg','15m'),(17420,27126,15569,'avg','5m'),(17421,27123,15569,'avg','5m'),(17427,28100,15571,'avg','15m'),(17428,28104,15571,'last',''),(17429,28103,15571,'avg','15m'),(17430,28099,15572,'avg','5m'),(17431,28102,15572,'avg','5m'),(17437,27094,15574,'avg','15m'),(17438,27091,15574,'last',''),(17439,27095,15574,'avg','15m'),(17440,27096,15575,'avg','5m'),(17441,27093,15575,'avg','5m'),(17447,27104,15577,'avg','15m'),(17448,27101,15577,'last',''),(17449,27105,15577,'avg','15m'),(17450,27106,15578,'avg','5m'),(17451,27103,15578,'avg','5m'),(17457,27183,15580,'avg','15m'),(17458,27187,15580,'last',''),(17459,27186,15580,'avg','15m'),(17460,27218,15581,'avg','15m'),(17461,27222,15581,'last',''),(17462,27221,15581,'avg','15m'),(17463,27254,15582,'avg','15m'),(17464,27258,15582,'last',''),(17465,27257,15582,'avg','15m'),(17466,27275,15583,'avg','15m'),(17467,27279,15583,'last',''),(17468,27278,15583,'avg','15m'),(17469,27324,15584,'avg','15m'),(17470,27328,15584,'last',''),(17471,27327,15584,'avg','15m'),(17472,27453,15585,'avg','15m'),(17473,27457,15585,'last',''),(17474,27456,15585,'avg','15m'),(17475,27489,15586,'avg','15m'),(17476,27493,15586,'last',''),(17477,27492,15586,'avg','15m'),(17478,27523,15587,'avg','15m'),(17479,27527,15587,'last',''),(17480,27526,15587,'avg','15m'),(17481,27559,15588,'avg','15m'),(17482,27563,15588,'last',''),(17483,27562,15588,'avg','15m'),(17484,27645,15589,'avg','15m'),(17485,27649,15589,'last',''),(17486,27648,15589,'avg','15m'),(17487,27725,15590,'avg','15m'),(17488,27729,15590,'last',''),(17489,27728,15590,'avg','15m'),(17490,27759,15591,'avg','15m'),(17491,27763,15591,'last',''),(17492,27762,15591,'avg','15m'),(17493,27791,15592,'avg','15m'),(17494,27795,15592,'last',''),(17495,27794,15592,'avg','15m'),(17496,27875,15593,'avg','15m'),(17497,27879,15593,'last',''),(17498,27878,15593,'avg','15m'),(17499,27912,15594,'avg','15m'),(17500,27916,15594,'last',''),(17501,27915,15594,'avg','15m'),(17502,27947,15595,'avg','15m'),(17503,27951,15595,'last',''),(17504,27950,15595,'avg','15m'),(17505,28061,15596,'avg','15m'),(17506,28065,15596,'last',''),(17507,28064,15596,'avg','15m'),(17508,28121,15597,'avg','15m'),(17509,28125,15597,'last',''),(17510,28124,15597,'avg','15m'),(17511,28178,15598,'avg','15m'),(17512,28182,15598,'last',''),(17513,28181,15598,'avg','15m'),(17514,28226,15599,'avg','15m'),(17515,28230,15599,'last',''),(17516,28229,15599,'avg','15m'),(17517,27182,15600,'avg','5m'),(17518,27185,15600,'avg','5m'),(17519,27217,15601,'avg','5m'),(17520,27220,15601,'avg','5m'),(17521,27253,15602,'avg','5m'),(17522,27256,15602,'avg','5m'),(17523,27274,15603,'avg','5m'),(17524,27277,15603,'avg','5m'),(17525,27323,15604,'avg','5m'),(17526,27326,15604,'avg','5m'),(17527,27452,15605,'avg','5m'),(17528,27455,15605,'avg','5m'),(17529,27488,15606,'avg','5m'),(17530,27491,15606,'avg','5m'),(17531,27522,15607,'avg','5m'),(17532,27525,15607,'avg','5m'),(17533,27558,15608,'avg','5m'),(17534,27561,15608,'avg','5m'),(17535,27644,15609,'avg','5m'),(17536,27647,15609,'avg','5m'),(17537,27724,15610,'avg','5m'),(17538,27727,15610,'avg','5m'),(17539,27758,15611,'avg','5m'),(17540,27761,15611,'avg','5m'),(17541,27790,15612,'avg','5m'),(17542,27793,15612,'avg','5m'),(17543,27874,15613,'avg','5m'),(17544,27877,15613,'avg','5m'),(17545,27911,15614,'avg','5m'),(17546,27914,15614,'avg','5m'),(17547,27946,15615,'avg','5m'),(17548,27949,15615,'avg','5m'),(17549,28060,15616,'avg','5m'),(17550,28063,15616,'avg','5m'),(17551,28120,15617,'avg','5m'),(17552,28123,15617,'avg','5m'),(17553,28177,15618,'avg','5m'),(17554,28180,15618,'avg','5m'),(17555,28225,15619,'avg','5m'),(17556,28228,15619,'avg','5m'),(17657,28251,15640,'max','10m'),(17658,28250,15641,'avg','10m'),(17659,28252,15642,'last',''),(17660,28253,15643,'last',''),(17661,28254,15644,'last',''),(17662,28255,15645,'last',''),(17663,28256,15646,'last',''),(17664,28257,15647,'last',''),(17665,28258,15648,'last',''),(17666,28259,15649,'last',''),(17667,28260,15650,'last',''),(17668,28261,15651,'last',''),(17669,28262,15652,'last',''),(17670,28263,15653,'last',''),(17671,28264,15654,'last',''),(17672,28265,15655,'last',''),(17673,28266,15656,'last',''),(17674,28267,15657,'last',''),(17675,28268,15658,'last',''),(17676,28269,15659,'last',''),(17677,28270,15660,'last',''),(17678,28271,15661,'last',''),(17679,28272,15662,'last',''),(17680,28273,15663,'last',''),(17681,28274,15664,'last',''),(17682,28275,15665,'last',''),(17683,28276,15666,'last',''),(17684,28277,15667,'last',''),(17685,28278,15668,'last',''),(17686,28279,15669,'last',''),(17687,27091,15670,'change',''),(17688,27091,15670,'last',''),(17689,27090,15670,'last',''),(17690,27097,15670,'last',''),(17691,27091,15670,'prev',''),(17692,27101,15671,'change',''),(17693,27101,15671,'last',''),(17694,27100,15671,'last',''),(17695,27107,15671,'last',''),(17696,27101,15671,'prev',''),(17697,27187,15672,'change',''),(17698,27187,15672,'last',''),(17699,27189,15672,'last',''),(17700,27188,15672,'last',''),(17701,27187,15672,'prev',''),(17702,27222,15673,'change',''),(17703,27222,15673,'last',''),(17704,27224,15673,'last',''),(17705,27223,15673,'last',''),(17706,27222,15673,'prev',''),(17707,27258,15674,'change',''),(17708,27258,15674,'last',''),(17709,27260,15674,'last',''),(17710,27259,15674,'last',''),(17711,27258,15674,'prev',''),(17712,27279,15675,'change',''),(17713,27279,15675,'last',''),(17714,27281,15675,'last',''),(17715,27280,15675,'last',''),(17716,27279,15675,'prev',''),(17717,27328,15676,'change',''),(17718,27328,15676,'last',''),(17719,27330,15676,'last',''),(17720,27329,15676,'last',''),(17721,27328,15676,'prev',''),(17722,27457,15677,'change',''),(17723,27457,15677,'last',''),(17724,27459,15677,'last',''),(17725,27458,15677,'last',''),(17726,27457,15677,'prev',''),(17727,27493,15678,'change',''),(17728,27493,15678,'last',''),(17729,27495,15678,'last',''),(17730,27494,15678,'last',''),(17731,27493,15678,'prev',''),(17732,27527,15679,'change',''),(17733,27527,15679,'last',''),(17734,27529,15679,'last',''),(17735,27528,15679,'last',''),(17736,27527,15679,'prev',''),(17737,27563,15680,'change',''),(17738,27563,15680,'last',''),(17739,27565,15680,'last',''),(17740,27564,15680,'last',''),(17741,27563,15680,'prev',''),(17742,27649,15681,'change',''),(17743,27649,15681,'last',''),(17744,27651,15681,'last',''),(17745,27650,15681,'last',''),(17746,27649,15681,'prev',''),(17747,27729,15682,'change',''),(17748,27729,15682,'last',''),(17749,27731,15682,'last',''),(17750,27730,15682,'last',''),(17751,27729,15682,'prev',''),(17752,27763,15683,'change',''),(17753,27763,15683,'last',''),(17754,27765,15683,'last',''),(17755,27764,15683,'last',''),(17756,27763,15683,'prev',''),(17757,27795,15684,'change',''),(17758,27795,15684,'last',''),(17759,27797,15684,'last',''),(17760,27796,15684,'last',''),(17761,27795,15684,'prev',''),(17762,27879,15685,'change',''),(17763,27879,15685,'last',''),(17764,27881,15685,'last',''),(17765,27880,15685,'last',''),(17766,27879,15685,'prev',''),(17767,27916,15686,'change',''),(17768,27916,15686,'last',''),(17769,27918,15686,'last',''),(17770,27917,15686,'last',''),(17771,27916,15686,'prev',''),(17772,27951,15687,'change',''),(17773,27951,15687,'last',''),(17774,27953,15687,'last',''),(17775,27952,15687,'last',''),(17776,27951,15687,'prev',''),(17777,28065,15688,'change',''),(17778,28065,15688,'last',''),(17779,28067,15688,'last',''),(17780,28066,15688,'last',''),(17781,28065,15688,'prev',''),(17782,28125,15689,'change',''),(17783,28125,15689,'last',''),(17784,28127,15689,'last',''),(17785,28126,15689,'last',''),(17786,28125,15689,'prev',''),(17787,28182,15690,'change',''),(17788,28182,15690,'last',''),(17789,28184,15690,'last',''),(17790,28183,15690,'last',''),(17791,28182,15690,'prev',''),(17792,28230,15691,'change',''),(17793,28230,15691,'last',''),(17794,28232,15691,'last',''),(17795,28231,15691,'last',''),(17796,28230,15691,'prev',''),(17797,27071,15692,'change',''),(17798,27071,15692,'last',''),(17799,27070,15692,'last',''),(17800,27077,15692,'last',''),(17801,27071,15692,'prev',''),(17802,27603,15693,'change',''),(17803,27603,15693,'last',''),(17804,27605,15693,'last',''),(17805,27604,15693,'last',''),(17806,27603,15693,'prev',''),(17807,28012,15694,'change',''),(17808,28012,15694,'last',''),(17809,28014,15694,'last',''),(17810,28013,15694,'last',''),(17811,28012,15694,'prev',''),(17812,27081,15695,'change',''),(17813,27081,15695,'last',''),(17814,27080,15695,'last',''),(17815,27087,15695,'last',''),(17816,27081,15695,'prev',''),(17817,27626,15696,'change',''),(17818,27626,15696,'last',''),(17819,27628,15696,'last',''),(17820,27627,15696,'last',''),(17821,27626,15696,'prev',''),(17822,27983,15697,'change',''),(17823,27983,15697,'last',''),(17824,27985,15697,'last',''),(17825,27984,15697,'last',''),(17826,27983,15697,'prev',''),(17827,27121,15698,'change',''),(17828,27121,15698,'last',''),(17829,27120,15698,'last',''),(17830,27127,15698,'last',''),(17831,27121,15698,'prev',''),(17832,28104,15699,'change',''),(17833,28104,15699,'last',''),(17834,28106,15699,'last',''),(17835,28105,15699,'last',''),(17836,28104,15699,'prev',''),(17837,28281,15700,'last',''),(17838,28282,15701,'max','#3'),(17839,28283,15702,'min','5m'),(17840,28284,15703,'avg','5m'),(17841,28291,15704,'last',''),(17842,28292,15705,'max','{$SNMP_TIMEOUT}'),(17843,28295,15706,'avg','5m'),(17844,28298,15706,'avg','5m'),(17845,28296,15707,'avg','15m'),(17846,28300,15707,'last',''),(17847,28299,15707,'avg','15m'),(17848,28300,15708,'change',''),(17849,28300,15708,'last',''),(17850,28302,15708,'last',''),(17851,28301,15708,'last',''),(17852,28300,15708,'prev',''),(17853,28301,15709,'last',''),(17854,28301,15709,'diff',''),(17855,28310,15710,'avg','5m'),(17856,28316,15711,'avg','5m'),(17857,28322,15712,'avg','5m'),(17858,28322,15713,'avg','5m'),(17859,28323,15714,'avg','5m'),(17860,28324,15714,'last','0'),(17861,28323,15714,'max','5m'),(17862,28323,15715,'avg','5m'),(17863,28323,15715,'max','5m'),(17864,28323,15716,'avg','5m'),(17865,28323,15716,'min','5m'),(17866,28326,15717,'count','#1,{$FAN_CRIT_STATUS},eq'),(17867,28328,15718,'diff',''),(17868,28328,15718,'strlen',''),(17869,28329,15719,'count','#1,{$PSU_CRIT_STATUS},eq'),(17870,27238,15720,'count','#1,{$HEALTH_CRIT_STATUS},eq'),(17871,27238,15721,'count','#1,{$HEALTH_WARN_STATUS:\"offline\"},eq'),(17872,27238,15721,'count','#1,{$HEALTH_WARN_STATUS:\"testing\"},eq'),(17873,27814,15722,'count','#1,{$HEALTH_CRIT_STATUS},eq'),(17874,28330,15723,'max','#3'),(17875,28331,15724,'min','5m'),(17876,28332,15725,'avg','5m'),(17877,28339,15726,'last',''),(17878,28340,15727,'max','{$SNMP_TIMEOUT}'),(17879,28341,15728,'count','#1,{$HEALTH_DISASTER_STATUS},eq'),(17880,28341,15729,'count','#1,{$HEALTH_CRIT_STATUS},eq'),(17881,28341,15730,'count','#1,{$HEALTH_WARN_STATUS},eq'),(17882,28344,15731,'diff',''),(17883,28344,15731,'strlen',''),(17884,28345,15732,'diff',''),(17885,28345,15732,'strlen',''),(17886,28354,15733,'avg','5m'),(17887,28355,15733,'last','0'),(17888,28354,15733,'max','5m'),(17889,28354,15734,'avg','5m'),(17890,28355,15734,'last','0'),(17891,28354,15734,'max','5m'),(17892,28354,15735,'avg','5m'),(17893,28354,15735,'min','5m'),(17894,28356,15736,'avg','5m'),(17895,28357,15736,'last','0'),(17896,28356,15736,'max','5m'),(17897,28356,15737,'avg','5m'),(17898,28357,15737,'last','0'),(17899,28356,15737,'max','5m'),(17900,28356,15738,'avg','5m'),(17901,28356,15738,'min','5m'),(17902,28358,15739,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(17903,28358,15739,'count','#1,{$PSU_CRIT_STATUS:\"nonRecoverable\"},eq'),(17904,28358,15740,'count','#1,{$PSU_WARN_STATUS:\"nonCritical\"},eq'),(17905,28359,15741,'count','#1,{$FAN_CRIT_STATUS:\"criticalUpper\"},eq'),(17906,28359,15741,'count','#1,{$FAN_CRIT_STATUS:\"nonRecoverableUpper\"},eq'),(17907,28359,15741,'count','#1,{$FAN_CRIT_STATUS:\"criticalLower\"},eq'),(17908,28359,15741,'count','#1,{$FAN_CRIT_STATUS:\"nonRecoverableLower\"},eq'),(17909,28359,15741,'count','#1,{$FAN_CRIT_STATUS:\"failed\"},eq'),(17910,28359,15742,'count','#1,{$FAN_WARN_STATUS:\"nonCriticalUpper\"},eq'),(17911,28359,15742,'count','#1,{$FAN_WARN_STATUS:\"nonCriticalLower\"},eq'),(17912,28361,15743,'count','#1,{$DISK_FAIL_STATUS:\"critical\"},eq'),(17913,28361,15743,'count','#1,{$DISK_FAIL_STATUS:\"nonRecoverable\"},eq'),(17914,28361,15744,'count','#1,{$DISK_WARN_STATUS:\"nonCritical\"},eq'),(17915,28362,15745,'diff',''),(17916,28362,15745,'strlen',''),(17917,28363,15746,'count','#1,{$DISK_SMART_FAIL_STATUS},eq'),(17918,28373,15747,'count','#1,{$VDISK_CRIT_STATUS:\"failed\"},eq'),(17919,28373,15748,'count','#1,{$VDISK_WARN_STATUS:\"degraded\"},eq'),(17920,28374,15749,'count','#1,{$DISK_ARRAY_FAIL_STATUS:\"nonRecoverable\"},eq'),(17921,28374,15750,'count','#1,{$DISK_ARRAY_CRIT_STATUS:\"critical\"},eq'),(17922,28374,15751,'count','#1,{$DISK_ARRAY_WARN_STATUS:\"nonCritical\"},eq'),(17923,28376,15752,'count','#1,{$DISK_ARRAY_CACHE_BATTERY_WARN_STATUS},eq'),(17924,28376,15753,'count','#1,{$DISK_ARRAY_CACHE_BATTERY_OK_STATUS},ne'),(17925,28376,15754,'count','#1,{$DISK_ARRAY_CACHE_BATTERY_CRIT_STATUS},eq'),(17926,28377,15755,'max','#3'),(17927,28378,15756,'min','5m'),(17928,28379,15757,'avg','5m'),(17929,28386,15758,'last',''),(17930,28387,15759,'max','{$SNMP_TIMEOUT}'),(17931,28389,15760,'count','#1,{$HEALTH_CRIT_STATUS},eq'),(17932,28389,15761,'count','#1,{$HEALTH_WARN_STATUS},eq'),(17933,28391,15762,'diff',''),(17934,28391,15762,'strlen',''),(17935,28404,15763,'avg','5m'),(17936,28404,15763,'max','5m'),(17937,28404,15764,'avg','5m'),(17938,28404,15764,'max','5m'),(17939,28404,15765,'avg','5m'),(17940,28404,15765,'min','5m'),(17941,28406,15766,'avg','5m'),(17942,28406,15766,'max','5m'),(17943,28406,15767,'avg','5m'),(17944,28406,15767,'max','5m'),(17945,28406,15768,'avg','5m'),(17946,28406,15768,'min','5m'),(17947,28407,15769,'avg','5m'),(17948,28407,15769,'max','5m'),(17949,28407,15770,'avg','5m'),(17950,28407,15770,'max','5m'),(17951,28407,15771,'avg','5m'),(17952,28407,15771,'min','5m'),(17953,28408,15772,'avg','5m'),(17954,28408,15772,'max','5m'),(17955,28408,15773,'avg','5m'),(17956,28408,15773,'max','5m'),(17957,28408,15774,'avg','5m'),(17958,28408,15774,'min','5m'),(17959,28409,15775,'avg','5m'),(17960,28409,15775,'max','5m'),(17961,28409,15776,'avg','5m'),(17962,28409,15776,'max','5m'),(17963,28409,15777,'avg','5m'),(17964,28409,15777,'min','5m'),(17965,28410,15778,'avg','5m'),(17966,28410,15778,'max','5m'),(17967,28410,15779,'avg','5m'),(17968,28410,15779,'max','5m'),(17969,28410,15780,'avg','5m'),(17970,28410,15780,'min','5m'),(17971,28411,15781,'count','#1,{$PSU_CRIT_STATUS},eq'),(17972,28411,15782,'count','#1,{$PSU_WARN_STATUS},eq'),(17973,28412,15783,'count','#1,{$FAN_CRIT_STATUS},eq'),(17974,28412,15784,'count','#1,{$FAN_WARN_STATUS},eq'),(17975,28413,15785,'count','#1,{$DISK_ARRAY_CRIT_STATUS},eq'),(17976,28413,15786,'count','#1,{$DISK_ARRAY_WARN_STATUS},eq'),(17977,28415,15787,'count','#1,{$DISK_ARRAY_CACHE_CRIT_STATUS:\"cacheModCriticalFailure\"},eq'),(17978,28415,15788,'count','#1,{$DISK_ARRAY_CACHE_WARN_STATUS:\"invalid\"},eq'),(17979,28415,15788,'count','#1,{$DISK_ARRAY_CACHE_WARN_STATUS:\"cacheModDegradedFailsafeSpeed\"},eq'),(17980,28415,15788,'count','#1,{$DISK_ARRAY_CACHE_WARN_STATUS:\"cacheReadCacheNotMapped\"},eq'),(17981,28415,15788,'count','#1,{$DISK_ARRAY_CACHE_WARN_STATUS:\"cacheModFlashMemNotAttached\"},eq'),(17982,28415,15789,'count','#1,{$DISK_ARRAY_CACHE_OK_STATUS:\"enabled\"},ne'),(17983,28416,15790,'count','#1,{$DISK_ARRAY_CACHE_BATTERY_CRIT_STATUS:\"failed\"},eq'),(17984,28416,15790,'count','#1,{$DISK_ARRAY_CACHE_BATTERY_CRIT_STATUS:\"capacitorFailed\"},eq'),(17985,28416,15791,'count','#1,{$DISK_ARRAY_CACHE_BATTERY_WARN_STATUS:\"degraded\"},eq'),(17986,28416,15791,'count','#1,{$DISK_ARRAY_CACHE_BATTERY_WARN_STATUS:\"notPresent\"},eq'),(17987,28417,15792,'count','#1,{$DISK_FAIL_STATUS},eq'),(17988,28417,15793,'count','#1,{$DISK_WARN_STATUS},eq'),(17989,28418,15794,'count','#1,{$DISK_SMART_FAIL_STATUS:\"replaceDrive\"},eq'),(17990,28418,15794,'count','#1,{$DISK_SMART_FAIL_STATUS:\"replaceDriveSSDWearOut\"},eq'),(17991,28419,15795,'diff',''),(17992,28419,15795,'strlen',''),(17993,28423,15796,'count','#1,{$VDISK_CRIT_STATUS},eq'),(17994,28423,15797,'count','#1,{$VDISK_OK_STATUS},ne'),(17995,28426,15798,'max','#3'),(17996,28427,15799,'min','5m'),(17997,28428,15800,'avg','5m'),(17998,28435,15801,'last',''),(17999,28436,15802,'max','{$SNMP_TIMEOUT}'),(18000,28437,15803,'count','#1,{$HEALTH_DISASTER_STATUS},eq'),(18001,28437,15804,'count','#1,{$HEALTH_CRIT_STATUS},eq'),(18002,28437,15805,'count','#1,{$HEALTH_WARN_STATUS},eq'),(18003,28439,15806,'diff',''),(18004,28439,15806,'strlen',''),(18005,28446,15807,'avg','5m'),(18006,28446,15807,'max','5m'),(18007,28446,15808,'avg','5m'),(18008,28446,15808,'max','5m'),(18009,28446,15809,'avg','5m'),(18010,28446,15809,'min','5m'),(18011,28447,15810,'avg','5m'),(18012,28447,15810,'max','5m'),(18013,28447,15811,'avg','5m'),(18014,28447,15811,'max','5m'),(18015,28447,15812,'avg','5m'),(18016,28447,15812,'min','5m'),(18017,28448,15813,'avg','5m'),(18018,28448,15813,'max','5m'),(18019,28448,15814,'avg','5m'),(18020,28448,15814,'max','5m'),(18021,28448,15815,'avg','5m'),(18022,28448,15815,'min','5m'),(18023,28449,15816,'count','#1,{$PSU_OK_STATUS},ne'),(18024,28450,15817,'count','#1,{$FAN_OK_STATUS},ne'),(18025,28452,15818,'count','#1,{$DISK_OK_STATUS},ne'),(18026,28454,15819,'max','#3'),(18027,28455,15820,'min','5m'),(18028,28456,15821,'avg','5m'),(18029,28463,15822,'last',''),(18030,28464,15823,'max','{$SNMP_TIMEOUT}'),(18031,28465,15824,'count','#1,{$HEALTH_DISASTER_STATUS},eq'),(18032,28465,15825,'count','#1,{$HEALTH_CRIT_STATUS},eq'),(18033,28465,15826,'count','#1,{$HEALTH_WARN_STATUS},eq'),(18034,28467,15827,'diff',''),(18035,28467,15827,'strlen',''),(18036,28474,15828,'avg','5m'),(18037,28474,15828,'max','5m'),(18038,28474,15829,'avg','5m'),(18039,28474,15829,'max','5m'),(18040,28474,15830,'avg','5m'),(18041,28474,15830,'min','5m'),(18042,28475,15831,'avg','5m'),(18043,28475,15831,'max','5m'),(18044,28475,15832,'avg','5m'),(18045,28475,15832,'max','5m'),(18046,28475,15833,'avg','5m'),(18047,28475,15833,'min','5m'),(18048,28476,15834,'avg','5m'),(18049,28476,15834,'max','5m'),(18050,28476,15835,'avg','5m'),(18051,28476,15835,'max','5m'),(18052,28476,15836,'avg','5m'),(18053,28476,15836,'min','5m'),(18054,28477,15837,'count','#1,{$PSU_OK_STATUS},ne'),(18055,28478,15838,'count','#1,{$FAN_OK_STATUS},ne'),(18056,28480,15839,'count','#1,{$DISK_OK_STATUS},ne'),(18057,28482,15840,'max','#3'),(18058,28483,15841,'min','5m'),(18059,28484,15842,'avg','5m'),(18060,28491,15843,'last',''),(18061,28492,15844,'max','{$SNMP_TIMEOUT}'),(18062,28495,15845,'avg','5m'),(18063,28495,15845,'max','5m'),(18064,28495,15846,'avg','5m'),(18065,28495,15846,'max','5m'),(18066,28495,15847,'avg','5m'),(18067,28495,15847,'min','5m'),(18068,28503,15848,'last','0'),(18069,28532,15848,'last','0'),(18070,28506,15849,'last','0'),(18071,28505,15849,'last','0'),(18072,28509,15850,'last','0'),(18073,28508,15850,'last','0'),(18074,28513,15851,'str','off'),(18075,28512,15852,'str','off'),(18076,28537,15853,'max','10m'),(18077,28543,15854,'max','10m'),(18078,28536,15855,'max','10m'),(18079,28545,15856,'max','10m'),(18080,28542,15857,'max','10m'),(18081,28538,15858,'max','10m'),(18082,28535,15859,'min','10m'),(18083,28555,15860,'avg','10m'),(18084,28557,15861,'avg','10m'),(18085,28558,15862,'avg','10m'),(18086,28559,15863,'avg','10m'),(18087,28560,15864,'avg','10m'),(18088,28561,15865,'avg','10m'),(18089,28562,15866,'avg','30m'),(18090,28563,15867,'avg','10m'),(18091,28564,15868,'avg','10m'),(18092,28556,15869,'avg','10m'),(18093,28565,15870,'avg','10m'),(18094,28567,15871,'avg','10m'),(18095,28568,15872,'avg','10m'),(18096,28569,15873,'avg','10m'),(18097,28570,15874,'avg','10m'),(18098,28571,15875,'avg','10m'),(18099,28572,15876,'avg','10m'),(18100,28573,15877,'avg','10m'),(18101,28574,15878,'avg','10m'),(18102,28566,15879,'avg','10m'),(18103,28575,15880,'avg','10m'),(18104,28546,15881,'avg','10m'),(18105,28541,15882,'last',''),(18106,28553,15883,'avg','10m'),(18107,28590,15884,'max','10m'),(18108,28588,15885,'max','10m'),(18109,28587,15886,'max','10m'),(18110,28589,15887,'max','10m'),(18111,28578,15888,'min','10m'),(18112,28591,15889,'avg','10m'),(18113,28592,15890,'avg','10m'),(18114,28606,15891,'avg','10m'),(18115,28605,15892,'avg','10m'),(18116,28604,15893,'avg','10m'),(18117,28603,15894,'avg','30m'),(18118,28602,15895,'avg','10m'),(18119,28601,15896,'avg','10m'),(18120,28600,15897,'avg','10m'),(18121,28599,15898,'avg','10m'),(18122,28598,15899,'avg','10m'),(18123,28597,15900,'avg','10m'),(18124,28596,15901,'avg','10m'),(18125,28595,15902,'avg','10m'),(18126,28594,15903,'avg','10m'),(18127,28593,15904,'avg','10m'),(18128,28607,15905,'avg','10m'),(18129,28579,15906,'avg','10m'),(18130,28610,15907,'diff','0'),(18131,28611,15908,'nodata','5m'),(18132,28612,15909,'diff','0'),(18133,28613,15910,'last','0'),(18134,28614,15911,'last','0'),(18135,28615,15912,'avg','5m'),(18136,28616,15913,'avg','5m'),(18137,28620,15914,'avg','5m'),(18138,28627,15915,'avg','5m'),(18139,28633,15916,'diff','0'),(18140,28636,15917,'last','0'),(18141,28638,15918,'diff','0'),(18142,28639,15919,'change','0'),(18143,28641,15920,'diff','0'),(18144,28642,15921,'last','0'),(18145,28646,15922,'last','0'),(18147,28653,15924,'last','0'),(18148,28654,15925,'last','0'),(18149,28657,15926,'last','0'),(18150,28658,15927,'last','0'),(18151,28673,15928,'last','0'),(18152,28675,15929,'last','0'),(18153,28678,15930,'max','#3'),(18154,22686,13266,'last','0'),(18155,23284,13506,'last','0'),(18156,28648,15923,'last','0');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  UNIQUE KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
INSERT INTO `globalmacro` VALUES (2,'{$SNMP_COMMUNITY}','public');
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalvars`
--

DROP TABLE IF EXISTS `globalvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalvars` (
  `globalvarid` bigint(20) unsigned NOT NULL,
  `snmp_lastsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`globalvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalvars`
--

LOCK TABLES `globalvars` WRITE;
/*!40000 ALTER TABLE `globalvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_discovery`
--

DROP TABLE IF EXISTS `graph_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_discovery` (
  `graphid` bigint(20) unsigned NOT NULL,
  `parent_graphid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`graphid`),
  KEY `graph_discovery_1` (`parent_graphid`),
  CONSTRAINT `c_graph_discovery_2` FOREIGN KEY (`parent_graphid`) REFERENCES `graphs` (`graphid`),
  CONSTRAINT `c_graph_discovery_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_discovery`
--

LOCK TABLES `graph_discovery` WRITE;
/*!40000 ALTER TABLE `graph_discovery` DISABLE KEYS */;
INSERT INTO `graph_discovery` VALUES (814,521),(815,522),(816,522),(817,807),(818,807),(819,807),(820,807),(821,807),(822,808);
/*!40000 ALTER TABLE `graph_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL,
  `theme` varchar(64) NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) NOT NULL DEFAULT '',
  `graphcolor` varchar(6) NOT NULL DEFAULT '',
  `gridcolor` varchar(6) NOT NULL DEFAULT '',
  `maingridcolor` varchar(6) NOT NULL DEFAULT '',
  `gridbordercolor` varchar(6) NOT NULL DEFAULT '',
  `textcolor` varchar(6) NOT NULL DEFAULT '',
  `highlightcolor` varchar(6) NOT NULL DEFAULT '',
  `leftpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `rightpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `nonworktimecolor` varchar(6) NOT NULL DEFAULT '',
  `colorpalette` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`graphthemeid`),
  UNIQUE KEY `graph_theme_1` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'blue-theme','FFFFFF','FFFFFF','CCD5D9','ACBBC2','ACBBC2','1F2C33','E33734','429E47','E33734','EBEBEB','1A7C11,F63100,2774A4,A54F10,FC6EA3,6C59DC,AC8C14,611F27,F230E0,5CCD18,BB2A02,5A2B57,89ABF8,7EC25C,274482,2B5429,8048B4,FD5434,790E1F,87AC4D,E89DF4'),(2,'dark-theme','2B2B2B','2B2B2B','454545','4F4F4F','4F4F4F','F2F2F2','E45959','59DB8F','E45959','333333','199C0D,F63100,2774A4,F7941D,FC6EA3,6C59DC,C7A72D,BA2A5D,F230E0,5CCD18,BB2A02,AC41A5,89ABF8,7EC25C,3165D5,79A277,AA73DE,FD5434,F21C3E,87AC4D,E89DF4'),(3,'hc-light','FFFFFF','FFFFFF','555555','000000','333333','000000','333333','000000','000000','EBEBEB','1A7C11,F63100,2774A4,A54F10,FC6EA3,6C59DC,AC8C14,611F27,F230E0,5CCD18,BB2A02,5A2B57,89ABF8,7EC25C,274482,2B5429,8048B4,FD5434,790E1F,87AC4D,E89DF4'),(4,'hc-dark','000000','000000','666666','888888','4F4F4F','FFFFFF','FFFFFF','FFFFFF','FFFFFF','333333','199C0D,F63100,2774A4,F7941D,FC6EA3,6C59DC,C7A72D,BA2A5D,F230E0,5CCD18,BB2A02,AC41A5,89ABF8,7EC25C,3165D5,79A277,AA73DE,FD5434,F21C3E,87AC4D,E89DF4');
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '900',
  `height` int(11) NOT NULL DEFAULT '200',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '100.0000',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '1',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned DEFAULT NULL,
  `ymax_itemid` bigint(20) unsigned DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_1` (`name`),
  KEY `graphs_2` (`templateid`),
  KEY `graphs_3` (`ymin_itemid`),
  KEY `graphs_4` (`ymax_itemid`),
  CONSTRAINT `c_graphs_3` FOREIGN KEY (`ymax_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_graphs_1` FOREIGN KEY (`templateid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_2` FOREIGN KEY (`ymin_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (387,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(392,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(404,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(406,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(410,'Zabbix cache usage, % used',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(420,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(433,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(436,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(439,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(442,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(456,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(457,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(458,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(459,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(461,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(462,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(463,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(464,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(465,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(467,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(469,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(471,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(472,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(473,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(474,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(475,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(478,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(479,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(480,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(481,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(482,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(483,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(484,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(485,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(487,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(491,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(492,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(493,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(494,'Network traffic on en0',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(495,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(496,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(497,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(498,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(517,'Zabbix internal process busy %',900,200,0.0000,100.0000,406,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(518,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,404,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(519,'Zabbix server performance',900,200,0.0000,100.0000,392,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(520,'Zabbix cache usage, % used',900,200,0.0000,100.0000,410,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(521,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,420,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(522,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,442,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(523,'CPU jumps',900,200,0.0000,100.0000,439,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(524,'CPU load',900,200,0.0000,100.0000,433,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(525,'CPU utilization',900,200,0.0000,100.0000,387,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(526,'Swap usage',600,340,0.0000,100.0000,436,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(527,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(528,'Value cache effectiveness',900,200,0.0000,100.0000,527,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(529,'Zabbix cache usage, % used',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(530,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(531,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(532,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(533,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,10026,0),(534,'Memory usage',900,200,0.0000,100.0000,533,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23317,0),(540,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22943,0),(541,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22903,0),(542,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22983,0),(543,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23063,0),(544,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22863,0),(545,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23023,0),(546,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23159,0),(638,'Class Loader',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(639,'File Descriptors',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(640,'Garbage Collector collections per second',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(641,'Memory Pool CMS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(642,'Memory Pool CMS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(643,'Memory Pool Code Cache',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(644,'Memory Pool Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(645,'Memory Pool PS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(646,'Memory Pool PS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(647,'Memory Pool Tenured Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(648,'Threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(649,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(650,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(651,'Fan speed and ambient temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(652,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(653,'Fan speed and temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(654,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(655,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(657,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(668,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(669,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(671,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(672,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(675,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(676,'CPU utilization',900,200,0.0000,100.0000,675,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(677,'CPU utilization',900,200,0.0000,100.0000,675,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(678,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(679,'Memory utilization',900,200,0.0000,100.0000,678,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(680,'Memory utilization',900,200,0.0000,100.0000,678,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(683,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(684,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(686,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(687,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(688,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,687,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(691,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(692,'CPU utilization',900,200,0.0000,100.0000,691,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(694,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(695,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(697,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(698,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(700,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(701,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(703,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(704,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(708,'{#MODULE_NAME}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(709,'{#MODULE_NAME}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(714,'{#ENT_NAME}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(715,'{#ENT_NAME}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(718,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(719,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(724,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(725,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(727,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(728,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(730,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(731,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(733,'#{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(734,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(736,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(737,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(738,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(739,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,738,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(740,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,738,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(741,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(742,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,741,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(743,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,741,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(744,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(745,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(746,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(747,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(748,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(749,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(750,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(752,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(753,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(754,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(755,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(756,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(758,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(759,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(760,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(762,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(763,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(764,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(766,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(767,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(769,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(770,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(772,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,766,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(773,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(774,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(775,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(776,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(778,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(779,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(780,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(781,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(782,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(783,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(784,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(785,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(786,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(787,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,786,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(788,'Zabbix preprocessing queue',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(789,'Zabbix preprocessing queue',900,200,0.0000,100.0000,788,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(790,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(791,'{#DEVICE_DESCR}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(792,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(793,'http-8080 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(794,'http-8443 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(795,'jk-8009 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(796,'sessions /',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(797,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(798,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(799,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(800,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(801,'Zabbix preprocessing queue',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(802,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(803,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(804,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(805,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(806,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(807,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,420,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(808,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,442,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(809,'CPU jumps',900,200,0.0000,100.0000,439,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(810,'CPU load',900,200,0.0000,100.0000,433,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(811,'CPU utilization',900,200,0.0000,100.0000,387,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(812,'Swap usage',600,340,0.0000,100.0000,436,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(813,'Memory usage',900,200,0.0000,100.0000,533,1,1,0,1,0,0.0000,0.0000,1,2,NULL,28643,0),(814,'Network traffic on enp0s3',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(815,'Disk space usage /',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,4),(816,'Disk space usage /boot',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,4),(817,'Network traffic on br-fd2604f2dd54',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(818,'Network traffic on enp0s3',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(819,'Network traffic on vethb47ea4a',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(820,'Network traffic on vethc82d696',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(821,'Network traffic on docker0',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(822,'Disk space usage /',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,4);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL,
  `graphid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '0',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`),
  CONSTRAINT `c_graphs_items_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_items_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (5598,655,27036,5,0,'1A7C11',0,2,0),(5599,779,27038,5,0,'1A7C11',0,2,0),(5600,657,27052,5,0,'1A7C11',0,2,0),(5601,767,28045,5,0,'1A7C11',0,2,0),(5602,770,28084,5,0,'1A7C11',0,2,0),(5603,776,28162,5,0,'1A7C11',0,2,0),(5604,780,27054,5,0,'1A7C11',0,2,0),(5605,781,28052,5,0,'1A7C11',0,2,0),(5606,782,28091,5,0,'1A7C11',0,2,0),(5607,783,28169,5,0,'1A7C11',0,2,0),(5608,744,27094,5,0,'1A7C11',0,2,0),(5609,744,27095,2,1,'2774A4',0,2,0),(5610,744,27093,0,2,'F63100',1,2,0),(5611,744,27096,0,3,'A54F10',1,2,0),(5612,744,27092,0,4,'FC6EA3',1,2,0),(5613,744,27089,0,5,'6C59DC',1,2,0),(5614,745,27104,5,0,'1A7C11',0,2,0),(5615,745,27105,2,1,'2774A4',0,2,0),(5616,745,27103,0,2,'F63100',1,2,0),(5617,745,27106,0,3,'A54F10',1,2,0),(5618,745,27102,0,4,'FC6EA3',1,2,0),(5619,745,27099,0,5,'6C59DC',1,2,0),(5620,746,27183,5,0,'1A7C11',0,2,0),(5621,746,27186,2,1,'2774A4',0,2,0),(5622,746,27185,0,2,'F63100',1,2,0),(5623,746,27182,0,3,'A54F10',1,2,0),(5624,746,27184,0,4,'FC6EA3',1,2,0),(5625,746,27181,0,5,'6C59DC',1,2,0),(5626,747,27218,5,0,'1A7C11',0,2,0),(5627,747,27221,2,1,'2774A4',0,2,0),(5628,747,27220,0,2,'F63100',1,2,0),(5629,747,27217,0,3,'A54F10',1,2,0),(5630,747,27219,0,4,'FC6EA3',1,2,0),(5631,747,27216,0,5,'6C59DC',1,2,0),(5632,748,27254,5,0,'1A7C11',0,2,0),(5633,748,27257,2,1,'2774A4',0,2,0),(5634,748,27256,0,2,'F63100',1,2,0),(5635,748,27253,0,3,'A54F10',1,2,0),(5636,748,27255,0,4,'FC6EA3',1,2,0),(5637,748,27252,0,5,'6C59DC',1,2,0),(5638,749,27275,5,0,'1A7C11',0,2,0),(5639,749,27278,2,1,'2774A4',0,2,0),(5640,749,27277,0,2,'F63100',1,2,0),(5641,749,27274,0,3,'A54F10',1,2,0),(5642,749,27276,0,4,'FC6EA3',1,2,0),(5643,749,27273,0,5,'6C59DC',1,2,0),(5644,750,27324,5,0,'1A7C11',0,2,0),(5645,750,27327,2,1,'2774A4',0,2,0),(5646,750,27326,0,2,'F63100',1,2,0),(5647,750,27323,0,3,'A54F10',1,2,0),(5648,750,27325,0,4,'FC6EA3',1,2,0),(5649,750,27322,0,5,'6C59DC',1,2,0),(5650,752,27453,5,0,'1A7C11',0,2,0),(5651,752,27456,2,1,'2774A4',0,2,0),(5652,752,27455,0,2,'F63100',1,2,0),(5653,752,27452,0,3,'A54F10',1,2,0),(5654,752,27454,0,4,'FC6EA3',1,2,0),(5655,752,27451,0,5,'6C59DC',1,2,0),(5656,753,27489,5,0,'1A7C11',0,2,0),(5657,753,27492,2,1,'2774A4',0,2,0),(5658,753,27491,0,2,'F63100',1,2,0),(5659,753,27488,0,3,'A54F10',1,2,0),(5660,753,27490,0,4,'FC6EA3',1,2,0),(5661,753,27487,0,5,'6C59DC',1,2,0),(5662,754,27523,5,0,'1A7C11',0,2,0),(5663,754,27526,2,1,'2774A4',0,2,0),(5664,754,27525,0,2,'F63100',1,2,0),(5665,754,27522,0,3,'A54F10',1,2,0),(5666,754,27524,0,4,'FC6EA3',1,2,0),(5667,754,27521,0,5,'6C59DC',1,2,0),(5668,755,27559,5,0,'1A7C11',0,2,0),(5669,755,27562,2,1,'2774A4',0,2,0),(5670,755,27561,0,2,'F63100',1,2,0),(5671,755,27558,0,3,'A54F10',1,2,0),(5672,755,27560,0,4,'FC6EA3',1,2,0),(5673,755,27557,0,5,'6C59DC',1,2,0),(5674,756,27645,5,0,'1A7C11',0,2,0),(5675,756,27648,2,1,'2774A4',0,2,0),(5676,756,27647,0,2,'F63100',1,2,0),(5677,756,27644,0,3,'A54F10',1,2,0),(5678,756,27646,0,4,'FC6EA3',1,2,0),(5679,756,27643,0,5,'6C59DC',1,2,0),(5680,758,27725,5,0,'1A7C11',0,2,0),(5681,758,27728,2,1,'2774A4',0,2,0),(5682,758,27727,0,2,'F63100',1,2,0),(5683,758,27724,0,3,'A54F10',1,2,0),(5684,758,27726,0,4,'FC6EA3',1,2,0),(5685,758,27723,0,5,'6C59DC',1,2,0),(5686,759,27759,5,0,'1A7C11',0,2,0),(5687,759,27762,2,1,'2774A4',0,2,0),(5688,759,27761,0,2,'F63100',1,2,0),(5689,759,27758,0,3,'A54F10',1,2,0),(5690,759,27760,0,4,'FC6EA3',1,2,0),(5691,759,27757,0,5,'6C59DC',1,2,0),(5692,760,27791,5,0,'1A7C11',0,2,0),(5693,760,27794,2,1,'2774A4',0,2,0),(5694,760,27793,0,2,'F63100',1,2,0),(5695,760,27790,0,3,'A54F10',1,2,0),(5696,760,27792,0,4,'FC6EA3',1,2,0),(5697,760,27789,0,5,'6C59DC',1,2,0),(5698,762,27875,5,0,'1A7C11',0,2,0),(5699,762,27878,2,1,'2774A4',0,2,0),(5700,762,27877,0,2,'F63100',1,2,0),(5701,762,27874,0,3,'A54F10',1,2,0),(5702,762,27876,0,4,'FC6EA3',1,2,0),(5703,762,27873,0,5,'6C59DC',1,2,0),(5704,763,27912,5,0,'1A7C11',0,2,0),(5705,763,27915,2,1,'2774A4',0,2,0),(5706,763,27914,0,2,'F63100',1,2,0),(5707,763,27911,0,3,'A54F10',1,2,0),(5708,763,27913,0,4,'FC6EA3',1,2,0),(5709,763,27910,0,5,'6C59DC',1,2,0),(5710,764,27947,5,0,'1A7C11',0,2,0),(5711,764,27950,2,1,'2774A4',0,2,0),(5712,764,27949,0,2,'F63100',1,2,0),(5713,764,27946,0,3,'A54F10',1,2,0),(5714,764,27948,0,4,'FC6EA3',1,2,0),(5715,764,27945,0,5,'6C59DC',1,2,0),(5716,769,28061,5,0,'1A7C11',0,2,0),(5717,769,28064,2,1,'2774A4',0,2,0),(5718,769,28063,0,2,'F63100',1,2,0),(5719,769,28060,0,3,'A54F10',1,2,0),(5720,769,28062,0,4,'FC6EA3',1,2,0),(5721,769,28059,0,5,'6C59DC',1,2,0),(5722,773,28121,5,0,'1A7C11',0,2,0),(5723,773,28124,2,1,'2774A4',0,2,0),(5724,773,28123,0,2,'F63100',1,2,0),(5725,773,28120,0,3,'A54F10',1,2,0),(5726,773,28122,0,4,'FC6EA3',1,2,0),(5727,773,28119,0,5,'6C59DC',1,2,0),(5728,778,28178,5,0,'1A7C11',0,2,0),(5729,778,28181,2,1,'2774A4',0,2,0),(5730,778,28180,0,2,'F63100',1,2,0),(5731,778,28177,0,3,'A54F10',1,2,0),(5732,778,28179,0,4,'FC6EA3',1,2,0),(5733,778,28176,0,5,'6C59DC',1,2,0),(5734,785,28226,5,0,'1A7C11',0,2,0),(5735,785,28229,2,1,'2774A4',0,2,0),(5736,785,28228,0,2,'F63100',1,2,0),(5737,785,28225,0,3,'A54F10',1,2,0),(5738,785,28227,0,4,'FC6EA3',1,2,0),(5739,785,28224,0,5,'6C59DC',1,2,0),(5740,738,27074,5,0,'1A7C11',0,2,0),(5741,738,27075,2,1,'2774A4',0,2,0),(5742,738,27073,0,2,'F63100',1,2,0),(5743,738,27076,0,3,'A54F10',1,2,0),(5744,738,27072,0,4,'FC6EA3',1,2,0),(5745,738,27069,0,5,'6C59DC',1,2,0),(5746,739,27599,5,0,'1A7C11',0,2,0),(5747,739,27602,2,1,'2774A4',0,2,0),(5748,739,27601,0,2,'F63100',1,2,0),(5749,739,27598,0,3,'A54F10',1,2,0),(5750,739,27600,0,4,'FC6EA3',1,2,0),(5751,739,27597,0,5,'6C59DC',1,2,0),(5752,740,28008,5,0,'1A7C11',0,2,0),(5753,740,28011,2,1,'2774A4',0,2,0),(5754,740,28010,0,2,'F63100',1,2,0),(5755,740,28007,0,3,'A54F10',1,2,0),(5756,740,28009,0,4,'FC6EA3',1,2,0),(5757,740,28006,0,5,'6C59DC',1,2,0),(5758,741,27084,5,0,'1A7C11',0,2,0),(5759,741,27085,2,1,'2774A4',0,2,0),(5760,741,27083,0,2,'F63100',1,2,0),(5761,741,27086,0,3,'A54F10',1,2,0),(5762,741,27082,0,4,'FC6EA3',1,2,0),(5763,741,27079,0,5,'6C59DC',1,2,0),(5764,742,27622,5,0,'1A7C11',0,2,0),(5765,742,27625,2,1,'2774A4',0,2,0),(5766,742,27624,0,2,'F63100',1,2,0),(5767,742,27621,0,3,'A54F10',1,2,0),(5768,742,27623,0,4,'FC6EA3',1,2,0),(5769,742,27620,0,5,'6C59DC',1,2,0),(5770,743,27979,5,0,'1A7C11',0,2,0),(5771,743,27982,2,1,'2774A4',0,2,0),(5772,743,27981,0,2,'F63100',1,2,0),(5773,743,27978,0,3,'A54F10',1,2,0),(5774,743,27980,0,4,'FC6EA3',1,2,0),(5775,743,27977,0,5,'6C59DC',1,2,0),(5776,766,27124,5,0,'1A7C11',0,2,0),(5777,766,27125,2,1,'2774A4',0,2,0),(5778,766,27123,0,2,'F63100',1,2,0),(5779,766,27126,0,3,'A54F10',1,2,0),(5780,766,27122,0,4,'FC6EA3',1,2,0),(5781,766,27119,0,5,'6C59DC',1,2,0),(5782,772,28100,5,0,'1A7C11',0,2,0),(5783,772,28103,2,1,'2774A4',0,2,0),(5784,772,28102,0,2,'F63100',1,2,0),(5785,772,28099,0,3,'A54F10',1,2,0),(5786,772,28101,0,4,'FC6EA3',1,2,0),(5787,772,28098,0,5,'6C59DC',1,2,0),(5788,668,27208,5,0,'1A7C11',0,2,0),(5789,669,27205,5,0,'1A7C11',0,2,0),(5790,790,28296,5,0,'1A7C11',0,2,0),(5791,790,28299,2,1,'2774A4',0,2,0),(5792,790,28298,0,2,'F63100',1,2,0),(5793,790,28295,0,3,'A54F10',1,2,0),(5794,790,28297,0,4,'FC6EA3',1,2,0),(5795,790,28294,0,5,'6C59DC',1,2,0),(5796,791,28310,5,0,'1A7C11',0,2,0),(5797,792,28316,5,0,'1A7C11',0,2,0),(5798,671,27240,5,0,'1A7C11',0,2,0),(5799,672,27239,5,0,'1A7C11',0,2,0),(5800,675,27294,5,0,'1A7C11',0,2,0),(5801,676,27299,5,0,'1A7C11',0,2,0),(5802,677,27301,5,0,'1A7C11',0,2,0),(5803,678,27293,5,0,'1A7C11',0,2,0),(5804,679,27298,5,0,'1A7C11',0,2,0),(5805,680,27300,5,0,'1A7C11',0,2,0),(5806,683,27414,5,0,'1A7C11',0,2,0),(5807,684,27424,5,0,'1A7C11',0,2,0),(5808,686,27442,5,0,'1A7C11',0,2,0),(5809,784,28221,5,0,'1A7C11',0,2,0),(5810,687,27417,5,0,'1A7C11',0,2,0),(5811,688,27427,5,0,'1A7C11',0,2,0),(5812,786,28246,5,0,'1A7C11',0,2,0),(5813,787,28247,5,0,'1A7C11',0,2,0),(5814,691,27376,5,0,'1A7C11',0,2,0),(5815,692,27380,5,0,'1A7C11',0,2,0),(5816,694,27478,5,0,'1A7C11',0,2,0),(5817,695,27477,5,0,'1A7C11',0,2,0),(5818,697,27516,5,0,'1A7C11',0,2,0),(5819,698,27511,5,0,'1A7C11',0,2,0),(5820,700,27552,5,0,'1A7C11',0,2,0),(5821,701,27547,5,0,'1A7C11',0,2,0),(5822,703,27590,5,0,'1A7C11',0,2,0),(5823,704,27586,5,0,'1A7C11',0,2,0),(5824,708,27671,5,0,'1A7C11',0,2,0),(5825,709,27670,5,0,'1A7C11',0,2,0),(5826,774,28151,5,0,'1A7C11',0,2,0),(5827,775,28143,5,0,'1A7C11',0,2,0),(5828,714,27753,5,0,'1A7C11',0,2,0),(5829,715,27752,5,0,'1A7C11',0,2,0),(5830,718,27820,5,0,'1A7C11',0,2,0),(5831,719,27819,5,0,'1A7C11',0,2,0),(5832,724,27904,5,0,'1A7C11',0,2,0),(5833,725,27899,5,0,'1A7C11',0,2,0),(5834,727,27936,5,0,'1A7C11',0,2,0),(5835,728,27933,5,0,'1A7C11',0,2,0),(5836,730,27975,5,0,'1A7C11',0,2,0),(5837,731,27974,5,0,'1A7C11',0,2,0),(5838,733,28003,5,0,'1A7C11',0,2,0),(5839,734,28004,5,0,'1A7C11',0,2,0),(5840,736,28031,5,0,'1A7C11',0,2,0),(5841,737,28028,5,0,'1A7C11',0,2,0),(6171,793,28532,0,0,'C80000',0,2,0),(6172,793,28503,0,1,'00C800',0,2,0),(6173,793,28504,0,2,'0000C8',0,2,0),(6174,794,28505,0,0,'C80000',0,2,0),(6175,794,28506,0,1,'00C800',0,2,0),(6176,794,28507,0,2,'0000C8',0,2,0),(6177,795,28508,0,0,'C80000',0,2,0),(6178,795,28509,0,1,'00C800',0,2,0),(6179,795,28510,0,2,'0000C8',0,2,0),(6180,796,28515,0,0,'C80000',0,2,0),(6181,796,28518,0,1,'00C800',0,2,0),(6182,796,28516,0,2,'0000C8',0,2,0),(6183,638,26892,0,0,'C80000',0,2,0),(6184,638,26891,0,1,'00C800',0,2,0),(6185,638,26910,0,2,'0000C8',0,2,0),(6186,639,26879,0,0,'C80000',0,2,0),(6187,639,26880,0,1,'00C800',0,2,0),(6188,640,26906,0,0,'C80000',0,2,0),(6189,640,26895,0,1,'00C800',0,2,0),(6190,640,26889,0,2,'0000C8',0,2,0),(6191,640,26884,0,3,'C8C800',0,2,0),(6192,640,26896,0,4,'00C8C9',0,2,0),(6193,640,26887,0,5,'C800C8',0,2,0),(6194,641,26900,0,0,'C80000',0,2,0),(6195,641,26901,0,1,'00C800',0,2,0),(6196,641,26902,0,2,'0000C8',0,2,0),(6197,642,26883,0,0,'C80000',0,2,0),(6198,642,26882,0,1,'00C800',0,2,0),(6199,642,26864,0,2,'0000C8',0,2,0),(6200,643,26863,0,0,'C80000',0,2,0),(6201,643,26865,0,1,'00C800',0,2,0),(6202,643,26866,0,2,'0000C8',0,2,0),(6203,644,26867,0,0,'C80000',0,2,0),(6204,644,26862,0,1,'00C800',0,2,0),(6205,644,26861,0,2,'0000C8',0,2,0),(6206,645,26857,0,0,'C80000',0,2,0),(6207,645,26856,0,1,'00C800',0,2,0),(6208,645,26858,0,2,'0000C8',0,2,0),(6209,646,26859,0,0,'0000C8',0,2,0),(6210,646,26860,0,1,'C80000',0,2,0),(6211,646,26868,0,2,'00C800',0,2,0),(6212,647,26869,0,0,'C80000',0,2,0),(6213,647,26878,0,1,'00C800',0,2,0),(6214,647,26877,0,2,'0000C8',0,2,0),(6215,648,26872,0,0,'C80000',0,2,0),(6216,648,26870,0,1,'00C800',0,2,0),(6217,648,26873,0,2,'0000C8',0,2,0),(6218,529,23357,0,0,'DD0000',0,2,0),(6219,529,23341,0,1,'00DDDD',0,2,0),(6220,529,23342,0,2,'3333FF',0,2,0),(6221,529,28251,0,3,'00FF00',0,2,0),(6222,530,23345,0,0,'990099',0,2,0),(6223,530,23348,0,1,'990000',0,2,0),(6224,530,23355,0,2,'0000EE',0,2,0),(6225,530,23352,0,3,'FF33FF',0,2,0),(6226,530,23356,0,4,'007700',0,2,0),(6227,530,23354,0,5,'003300',0,2,0),(6228,530,23346,0,6,'33FFFF',0,2,0),(6229,530,23349,0,7,'DD0000',0,2,0),(6230,530,23344,0,8,'000099',0,7,0),(6231,530,28250,0,9,'00FF00',0,2,0),(6232,531,23353,0,0,'FFAA00',0,2,0),(6233,531,23347,0,1,'990099',0,2,0),(6234,531,23350,0,2,'EE0000',0,2,0),(6235,531,23343,0,3,'FF66FF',0,2,0),(6236,531,23351,0,4,'960000',0,2,0),(6237,531,23360,0,5,'007700',0,2,0),(6238,531,25369,0,6,'009999',0,2,0),(6239,531,25368,0,6,'BBBB00',0,2,0),(6240,532,23340,5,0,'00C800',0,2,0),(6241,532,23358,5,1,'C80000',1,2,0),(6242,527,22199,0,0,'C80000',0,2,0),(6243,527,22196,0,1,'00C800',0,2,0),(6244,528,23628,0,0,'C80000',0,2,0),(6245,528,23625,0,1,'00C800',0,2,0),(6246,410,22185,0,0,'009900',0,2,0),(6247,410,22189,0,1,'DD0000',0,2,0),(6248,410,22396,0,2,'00DDDD',0,2,0),(6249,410,22183,0,3,'3333FF',0,2,0),(6250,410,22191,0,4,'999900',0,2,0),(6251,410,23634,0,5,'00FF00',0,2,0),(6252,520,23276,0,0,'009900',0,2,0),(6253,520,23273,0,1,'DD0000',0,2,0),(6254,520,23275,0,2,'00DDDD',0,2,0),(6255,520,23274,0,3,'3333FF',0,2,0),(6256,520,23620,0,4,'999900',0,2,0),(6257,520,23635,0,5,'00FF00',0,2,0),(6258,404,22404,0,0,'990099',0,2,0),(6259,404,22399,0,1,'990000',0,2,0),(6260,404,22416,0,2,'0000EE',0,2,0),(6261,404,22430,0,3,'FF33FF',0,2,0),(6262,404,22418,0,4,'009600',0,2,0),(6263,404,22402,0,5,'003300',0,2,0),(6264,404,22420,0,6,'CCCC00',0,2,0),(6265,404,22400,0,7,'33FFFF',0,2,0),(6266,404,22689,0,8,'DD0000',0,2,0),(6267,404,23171,0,9,'000099',0,2,0),(6268,404,22401,0,10,'00FF00',0,2,0),(6269,518,23269,0,0,'990099',0,2,0),(6270,518,23264,0,1,'990000',0,2,0),(6271,518,23261,0,2,'0000EE',0,2,0),(6272,518,23255,0,3,'FF33FF',0,2,0),(6273,518,23260,0,4,'009600',0,2,0),(6274,518,23259,0,5,'003300',0,2,0),(6275,518,23265,0,6,'CCCC00',0,2,0),(6276,518,23270,0,7,'33FFFF',0,2,0),(6277,518,23262,0,8,'DD0000',0,2,0),(6278,518,23267,0,9,'000099',0,2,0),(6279,518,23328,0,10,'00FF00',0,2,0),(6280,406,22426,0,0,'00EE00',0,2,0),(6281,406,22422,0,1,'0000EE',0,2,0),(6282,406,22408,0,2,'FFAA00',0,2,0),(6283,406,22424,0,3,'00EEEE',0,2,0),(6284,406,22412,0,4,'990099',0,2,0),(6285,406,22406,0,5,'EE0000',0,2,0),(6286,406,22414,0,6,'FF66FF',0,2,0),(6287,406,23663,0,7,'009999',0,2,0),(6288,406,25366,0,8,'BBBB00',0,2,0),(6289,406,25370,0,9,'AA0000',0,2,0),(6290,406,25665,0,10,'990000',0,2,0),(6291,406,25666,0,11,'008800',0,2,0),(6292,517,23268,0,0,'00EE00',0,2,0),(6293,517,23256,0,1,'0000EE',0,2,0),(6294,517,23258,0,2,'FFAA00',0,2,0),(6295,517,23252,0,3,'00EEEE',0,2,0),(6296,517,23253,0,4,'990099',0,2,0),(6297,517,23257,0,5,'EE0000',0,2,0),(6298,517,23266,0,6,'FF66FF',0,2,0),(6299,517,23664,0,7,'009999',0,2,0),(6300,517,25367,0,8,'BBBB00',0,2,0),(6301,517,25371,0,9,'AA0000',0,2,0),(6302,517,25667,0,10,'990000',0,2,0),(6303,517,25668,0,11,'008800',0,2,0),(6304,788,28248,5,0,'1A7C11',0,2,0),(6305,789,28249,5,0,'1A7C11',0,2,0),(6306,392,22187,5,0,'00C800',0,2,0),(6307,392,23251,5,1,'C80000',1,2,0),(6308,519,23277,5,0,'00C800',0,2,0),(6309,519,23272,5,1,'C80000',1,2,0),(6310,649,26920,5,0,'00AA00',0,2,0),(6311,649,26919,5,1,'3333FF',0,2,0),(6312,650,26921,0,0,'C8C800',0,2,0),(6313,650,26922,0,1,'006400',0,2,0),(6314,650,26923,0,2,'C80000',0,2,0),(6315,650,26918,0,3,'0000EE',0,2,0),(6316,650,26917,0,4,'640000',0,2,0),(6317,650,26912,0,5,'00C800',0,2,0),(6318,650,26911,0,6,'C800C8',0,2,0),(6319,472,22945,5,0,'00AA00',0,2,0),(6320,472,22946,5,1,'3333FF',0,2,0),(6321,473,22950,0,0,'C80000',0,2,2),(6322,473,22948,0,1,'00C800',0,2,0),(6323,471,22924,0,0,'009900',0,2,0),(6324,471,22920,0,1,'000099',0,2,0),(6325,469,22922,0,0,'009900',0,2,0),(6326,469,22923,0,1,'000099',0,2,0),(6327,469,22921,0,2,'990000',0,2,0),(6328,498,23109,0,0,'009999',0,2,0),(6329,498,23112,0,1,'990099',0,2,0),(6330,498,23115,0,2,'999900',0,2,0),(6331,498,23113,0,3,'990000',0,2,0),(6332,498,23114,0,4,'000099',0,2,0),(6333,498,23110,0,5,'009900',0,2,0),(6334,540,22942,5,0,'00C800',0,2,0),(6335,492,23073,5,0,'00AA00',0,2,0),(6336,492,23074,5,1,'3333FF',0,2,0),(6337,467,22910,0,0,'C80000',0,2,2),(6338,467,22908,0,1,'00C800',0,2,0),(6339,465,22884,0,0,'009900',0,2,0),(6340,465,22880,0,1,'000099',0,2,0),(6341,463,22882,0,0,'009900',0,2,0),(6342,463,22883,0,1,'000099',0,2,0),(6343,463,22881,0,2,'990000',0,2,0),(6344,462,22886,1,0,'009999',0,2,0),(6345,462,22888,1,1,'990099',0,2,0),(6346,462,22891,1,2,'990000',0,2,0),(6347,462,22892,1,3,'000099',0,2,0),(6348,462,22885,1,4,'009900',0,2,0),(6349,541,22902,5,0,'00C800',0,2,0),(6350,464,22897,0,0,'AA0000',0,2,2),(6351,464,22895,0,1,'00AA00',0,2,0),(6352,478,22985,5,0,'00AA00',0,2,0),(6353,478,22986,5,1,'3333FF',0,2,0),(6354,479,22990,0,0,'C80000',0,2,2),(6355,479,22988,0,1,'00C800',0,2,0),(6356,475,22962,0,0,'009900',0,2,0),(6357,475,22963,0,1,'000099',0,2,0),(6358,475,22961,0,2,'990000',0,2,0),(6359,474,22968,1,0,'990099',0,2,0),(6360,474,22971,1,1,'990000',0,2,0),(6361,474,22972,1,2,'000099',0,2,0),(6362,474,22965,1,3,'009900',0,2,0),(6363,542,22982,5,0,'00C800',0,2,0),(6364,420,22446,5,0,'00AA00',0,2,0),(6365,420,22448,5,1,'3333FF',0,2,0),(6366,521,23280,5,0,'00AA00',0,2,0),(6367,521,23281,5,1,'3333FF',0,2,0),(6368,442,22456,0,0,'C80000',0,2,2),(6369,442,22452,0,1,'00C800',0,2,0),(6370,522,23285,0,0,'C80000',0,2,2),(6371,522,23283,0,1,'00C800',0,2,0),(6372,439,22680,0,0,'009900',0,2,0),(6373,439,22683,0,1,'000099',0,2,0),(6374,523,23298,0,0,'009900',0,2,0),(6375,523,23294,0,1,'000099',0,2,0),(6376,433,10010,0,0,'009900',0,2,0),(6377,433,22674,0,1,'000099',0,2,0),(6378,433,22677,0,2,'990000',0,2,0),(6379,524,23296,0,0,'009900',0,2,0),(6380,524,23297,0,1,'000099',0,2,0),(6381,524,23295,0,2,'990000',0,2,0),(6382,387,28499,0,0,'F230E0',0,2,0),(6383,387,28497,0,1,'5CCD18',0,2,0),(6384,387,22665,1,2,'FF5555',0,2,0),(6385,387,22668,1,3,'55FF55',0,2,0),(6386,387,22671,1,4,'009999',0,2,0),(6387,387,17358,1,5,'990099',0,2,0),(6388,387,17362,1,6,'999900',0,2,0),(6389,387,17360,1,7,'990000',0,2,0),(6390,387,17356,1,8,'000099',0,2,0),(6391,387,17354,1,9,'009900',0,2,0),(6392,525,28500,0,0,'F230E0',0,2,0),(6393,525,28498,0,1,'5CCD18',0,2,0),(6394,525,23304,1,2,'FF5555',0,2,0),(6395,525,23303,1,3,'55FF55',0,2,0),(6396,525,23300,1,4,'009999',0,2,0),(6397,525,23302,1,5,'990099',0,2,0),(6398,525,23301,1,6,'999900',0,2,0),(6399,525,23305,1,7,'990000',0,2,0),(6400,525,23306,1,8,'000099',0,2,0),(6401,525,23299,1,9,'009900',0,2,0),(6402,533,22181,5,0,'00C800',0,2,0),(6403,534,23316,5,0,'00C800',0,2,0),(6404,436,10030,0,0,'AA0000',0,2,2),(6405,436,10014,0,1,'00AA00',0,2,0),(6406,526,23311,0,0,'AA0000',0,2,2),(6407,526,23309,0,1,'00AA00',0,2,0),(6408,491,23070,0,0,'C80000',0,2,2),(6409,491,23068,0,1,'00C800',0,2,0),(6410,487,23042,0,0,'009900',0,2,0),(6411,487,23043,0,1,'000099',0,2,0),(6412,487,23041,0,2,'990000',0,2,0),(6413,543,23062,5,0,'00C800',0,2,0),(6414,494,23077,5,0,'00AA00',0,2,0),(6415,494,23078,5,1,'3333FF',0,2,0),(6416,493,23075,5,0,'00AA00',0,2,0),(6417,493,23076,5,1,'3333FF',0,2,0),(6418,461,22870,0,0,'C80000',0,2,2),(6419,461,22868,0,1,'00C800',0,2,0),(6420,459,22844,0,0,'009900',0,2,0),(6421,459,22840,0,1,'000099',0,2,0),(6422,457,22842,0,0,'009900',0,2,0),(6423,457,22843,0,1,'000099',0,2,0),(6424,457,22841,0,2,'990000',0,2,0),(6425,456,22846,1,0,'009999',0,2,0),(6426,456,22848,1,1,'990099',0,2,0),(6427,456,22851,1,2,'990000',0,2,0),(6428,456,22852,1,3,'000099',0,2,0),(6429,456,22845,1,4,'009900',0,2,0),(6430,544,22862,5,0,'00C800',0,2,0),(6431,458,22857,0,0,'AA0000',0,2,2),(6432,458,22855,0,1,'00AA00',0,2,0),(6433,484,23025,5,0,'00AA00',0,2,0),(6434,484,23026,5,1,'3333FF',0,2,0),(6435,485,23030,0,0,'C80000',0,2,2),(6436,485,23028,0,1,'00C800',0,2,0),(6437,483,23004,0,0,'009900',0,2,0),(6438,483,23000,0,1,'000099',0,2,0),(6439,481,23002,0,0,'009900',0,2,0),(6440,481,23003,0,1,'000099',0,2,0),(6441,481,23001,0,2,'990000',0,2,0),(6442,480,23007,1,0,'999900',0,2,0),(6443,480,23011,1,1,'990000',0,2,0),(6444,480,23012,1,2,'000099',0,2,0),(6445,480,23005,1,3,'009900',0,2,0),(6446,545,23022,5,0,'00C800',0,2,0),(6447,482,23017,0,0,'AA0000',0,2,2),(6448,482,23015,0,1,'00AA00',0,2,0),(6449,497,23169,5,0,'00AA00',0,2,0),(6450,497,23170,5,1,'3333FF',0,2,0),(6451,496,23167,0,0,'C80000',0,2,2),(6452,496,23164,0,1,'00C800',0,2,0),(6453,495,23143,0,0,'009900',0,2,0),(6454,495,23145,0,1,'000099',0,2,0),(6455,495,23144,0,2,'990000',0,2,0),(6456,546,23158,5,0,'00C800',0,2,0),(6457,651,26928,5,0,'EE0000',0,2,0),(6458,651,26927,0,1,'000000',1,2,0),(6459,652,26925,2,0,'880000',0,2,0),(6460,652,26932,0,1,'009900',0,2,0),(6461,652,26930,0,2,'00CCCC',0,2,0),(6462,652,26931,0,3,'000000',0,2,0),(6463,652,26929,0,4,'3333FF',0,2,0),(6464,652,26926,0,5,'777700',0,2,0),(6465,653,26933,2,0,'EE0000',0,2,0),(6466,653,26943,2,1,'EE00EE',0,2,0),(6467,653,26935,0,2,'000000',1,2,0),(6468,653,26936,4,3,'000000',1,2,0),(6469,654,26934,2,0,'880000',0,2,0),(6470,654,26939,0,1,'009900',0,2,0),(6471,654,26942,0,2,'00CCCC',0,2,0),(6472,654,26938,0,3,'000000',0,2,0),(6473,654,26937,0,4,'3333FF',0,2,0),(6474,797,28540,0,0,'C80000',0,2,0),(6475,797,28539,0,1,'00C800',0,2,0),(6476,798,28545,0,0,'009900',0,2,0),(6477,798,28537,0,1,'DD0000',0,2,0),(6478,798,28536,0,2,'00DDDD',0,2,0),(6479,798,28543,0,3,'3333FF',0,2,0),(6480,798,28538,0,4,'999900',0,2,0),(6481,798,28542,0,5,'00FF00',0,2,0),(6482,799,28575,0,0,'990099',0,2,0),(6483,799,28568,0,1,'990000',0,2,0),(6484,799,28565,0,2,'0000EE',0,2,0),(6485,799,28559,0,3,'FF33FF',0,2,0),(6486,799,28564,0,4,'009600',0,2,0),(6487,799,28563,0,5,'003300',0,2,0),(6488,799,28571,0,6,'CCCC00',0,2,0),(6489,799,28546,0,7,'33FFFF',0,2,0),(6490,799,28567,0,8,'DD0000',0,2,0),(6491,799,28573,0,9,'000099',0,2,0),(6492,799,28553,0,10,'00FF00',0,2,0),(6493,800,28566,0,0,'00EE00',0,2,0),(6494,800,28560,0,1,'0000EE',0,2,0),(6495,800,28562,0,2,'FFAA00',0,2,0),(6496,800,28555,0,3,'00EEEE',0,2,0),(6497,800,28558,0,4,'990099',0,2,0),(6498,800,28561,0,5,'EE0000',0,2,0),(6499,800,28572,0,6,'FF66FF',0,2,0),(6500,800,28574,0,7,'009999',0,2,0),(6501,800,28556,0,8,'BBBB00',0,2,0),(6502,800,28557,0,9,'AA0000',0,2,0),(6503,800,28569,0,10,'990000',0,2,0),(6504,800,28570,0,11,'008800',0,2,0),(6505,801,28554,5,0,'1A7C11',0,2,0),(6506,802,28544,5,0,'00C800',0,2,0),(6507,802,28534,5,1,'C80000',0,2,0),(6508,803,28590,0,0,'DD0000',0,2,0),(6509,803,28587,0,1,'00DDDD',0,2,0),(6510,803,28588,0,2,'3333FF',0,2,0),(6511,803,28589,0,3,'00FF00',0,2,0),(6512,804,28593,0,0,'990099',0,2,0),(6513,804,28597,0,1,'990000',0,2,0),(6514,804,28599,0,2,'0000EE',0,2,0),(6515,804,28606,0,3,'FF33FF',0,2,0),(6516,804,28601,0,4,'00EE00',0,2,0),(6517,804,28602,0,5,'003300',0,2,0),(6518,804,28607,0,6,'33FFFF',0,2,0),(6519,804,28598,0,7,'DD0000',0,2,0),(6520,804,28595,0,8,'000099',0,2,0),(6521,804,28579,0,9,'00FF00',0,2,0),(6522,805,28603,0,0,'FFAA00',0,2,0),(6523,805,28591,0,1,'990099',0,2,0),(6524,805,28604,0,2,'EE0000',0,2,0),(6525,805,28596,0,3,'FF66FF',0,2,0),(6526,805,28605,0,4,'960000',0,2,0),(6527,805,28592,0,5,'009600',0,2,0),(6528,805,28594,0,6,'009999',0,2,0),(6529,805,28600,0,7,'BBBB00',0,2,0),(6530,806,28586,0,0,'00C800',0,2,0),(6531,806,28577,0,1,'C80000',0,2,0),(6532,807,28644,5,0,'00AA00',0,2,0),(6533,807,28645,5,1,'3333FF',0,2,0),(6534,808,28649,0,0,'C80000',0,2,2),(6535,808,28647,0,1,'00C800',0,2,0),(6536,809,28622,0,0,'009900',0,2,0),(6537,809,28618,0,1,'000099',0,2,0),(6538,810,28620,0,0,'009900',0,2,0),(6539,810,28621,0,1,'000099',0,2,0),(6540,810,28619,0,2,'990000',0,2,0),(6541,811,28624,0,0,'F230E0',0,2,0),(6542,811,28623,0,1,'5CCD18',0,2,0),(6543,811,28630,1,2,'FF5555',0,2,0),(6544,811,28629,1,3,'55FF55',0,2,0),(6545,811,28626,1,4,'009999',0,2,0),(6546,811,28628,1,5,'990099',0,2,0),(6547,811,28627,1,6,'999900',0,2,0),(6548,811,28631,1,7,'990000',0,2,0),(6549,811,28632,1,8,'000099',0,2,0),(6550,811,28625,1,9,'009900',0,2,0),(6551,812,28637,0,0,'AA0000',0,2,2),(6552,812,28635,0,1,'00AA00',0,2,0),(6553,813,28642,5,0,'00C800',0,2,0),(6554,814,28651,5,0,'00AA00',0,2,0),(6555,814,28652,5,1,'3333FF',0,2,0),(6556,815,28659,0,0,'C80000',0,2,2),(6557,815,28655,0,1,'00C800',0,2,0),(6558,816,28660,0,0,'C80000',0,2,2),(6559,816,28656,0,1,'00C800',0,2,0),(6560,817,28663,5,0,'00AA00',0,2,0),(6561,817,28668,5,1,'3333FF',0,2,0),(6562,818,28664,5,0,'00AA00',0,2,0),(6563,818,28669,5,1,'3333FF',0,2,0),(6564,819,28665,5,0,'00AA00',0,2,0),(6565,819,28670,5,1,'3333FF',0,2,0),(6566,820,28666,5,0,'00AA00',0,2,0),(6567,820,28671,5,1,'3333FF',0,2,0),(6568,821,28667,5,0,'00AA00',0,2,0),(6569,821,28672,5,1,'3333FF',0,2,0),(6570,822,28676,0,0,'C80000',0,2,2),(6571,822,28674,0,1,'00C800',0,2,0);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discovery`
--

DROP TABLE IF EXISTS `group_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discovery` (
  `groupid` bigint(20) unsigned NOT NULL,
  `parent_group_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `c_group_discovery_2` (`parent_group_prototypeid`),
  CONSTRAINT `c_group_discovery_2` FOREIGN KEY (`parent_group_prototypeid`) REFERENCES `group_prototype` (`group_prototypeid`),
  CONSTRAINT `c_group_discovery_1` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discovery`
--

LOCK TABLES `group_discovery` WRITE;
/*!40000 ALTER TABLE `group_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prototype`
--

DROP TABLE IF EXISTS `group_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prototype` (
  `group_prototypeid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_prototypeid`),
  KEY `group_prototype_1` (`hostid`),
  KEY `c_group_prototype_2` (`groupid`),
  KEY `c_group_prototype_3` (`templateid`),
  CONSTRAINT `c_group_prototype_3` FOREIGN KEY (`templateid`) REFERENCES `group_prototype` (`group_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prototype`
--

LOCK TABLES `group_prototype` WRITE;
/*!40000 ALTER TABLE `group_prototype` DISABLE KEYS */;
INSERT INTO `group_prototype` VALUES (30,10176,'{#CLUSTER.NAME}',NULL,NULL),(31,10176,'{#DATACENTER.NAME}',NULL,NULL),(32,10176,'',7,NULL),(33,10177,'{#CLUSTER.NAME} (vm)',NULL,NULL),(34,10177,'{#DATACENTER.NAME} (vm)',NULL,NULL),(35,10177,'{#HV.NAME}',NULL,NULL),(36,10177,'',6,NULL);
/*!40000 ALTER TABLE `group_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (23664,1554851604,0.0000,863604962),(23252,1554851612,0.0000,868821813),(23253,1554851613,0.0000,869756873),(23255,1554851615,0.0000,870748108),(23256,1554851616,1.2685,871818025),(23257,1554851617,1.0549,872322023),(23258,1554851618,0.0000,873108683),(23259,1554851619,1.1053,873625086),(23620,1554851620,0.2139,873865138),(23260,1554851620,0.7166,873934002),(23264,1554851624,1.1051,875694854),(23265,1554851625,0.6474,876386046),(23266,1554851626,0.1596,877102169),(25667,1554851627,0.5542,877620494),(25668,1554851628,0.1743,878199011),(23268,1554851628,0.8006,878229565),(23269,1554851629,0.0000,879196503),(23270,1554851630,0.8846,879353586),(25371,1554851631,0.7853,880186859),(23273,1554851633,3.3508,882522858),(23274,1554851634,0.0000,883163734),(23275,1554851635,0.2205,883563093),(23276,1554851636,0.0811,884712665),(23664,1554851664,0.2578,902758787),(23252,1554851672,0.0000,908994056),(23253,1554851673,0.1376,909595606),(23255,1554851675,0.4289,910067869),(23256,1554851676,0.0000,910860275),(23257,1554851677,0.0466,913948107),(23258,1554851678,0.0000,914769559),(23259,1554851679,0.0169,916037043),(23620,1554851680,0.2542,917022125),(23260,1554851680,0.0000,917083379),(23264,1554851684,0.0000,919290326),(23265,1554851685,0.0000,929644695),(23625,1554851685,0.3830,929702023),(23266,1554851686,0.0000,930477268),(25667,1554851687,0.0000,931431414),(23268,1554851688,0.0000,932635830),(25668,1554851688,0.0794,932698487),(23628,1554851688,0.1499,932744409),(23269,1554851689,0.0000,933091046),(23270,1554851690,0.0677,933360035),(25371,1554851691,0.0000,933993275),(23273,1554851693,3.3719,934718671),(10073,1554851693,0.4163,934781610),(10074,1554851694,0.0000,935441135),(23274,1554851694,0.0000,935510764),(10075,1554851695,0.0000,936159066),(23275,1554851695,0.2205,936219207),(23276,1554851696,0.0937,937340833),(10076,1554851696,0.0500,937416347),(23277,1554851697,0.5329,938306448),(10077,1554851697,0.0000,938362609),(10078,1554851698,0.0000,939255431),(23664,1554851724,0.0000,952957451),(23252,1554851732,0.0000,984294282),(23253,1554851733,0.0339,985375251),(23255,1554851735,0.0000,992340416),(23256,1554851736,0.0169,993003706),(23257,1554851737,0.1691,993755769),(23258,1554851738,0.0000,994320375),(23259,1554851739,0.0000,994652637),(23260,1554851740,0.0000,995694355),(23620,1554851740,0.2685,995765456),(23264,1554851744,0.0000,997812525),(23625,1554851746,0.9654,6405365),(23265,1554851746,0.0000,6463206),(23266,1554851746,0.0000,6494021),(25667,1554851747,0.0000,6630232),(25668,1554851748,0.0000,6816189),(23628,1554851748,0.0000,6880585),(23268,1554851748,0.0000,6911426),(23269,1554851749,0.1019,7307275),(23270,1554851750,0.0000,8436807),(25371,1554851751,0.0000,9499463),(10073,1554851753,0.5417,10588313),(23273,1554851753,3.3719,10648468),(23274,1554851754,0.0000,11667530),(10074,1554851754,0.0000,11728145),(23275,1554851755,0.2205,22427001),(10075,1554851755,0.0000,22498005),(23276,1554851756,0.1020,22936008),(10076,1554851756,0.0508,22997300),(23277,1554851757,0.5923,26638678),(10077,1554851757,0.0000,26690386),(10078,1554851758,0.0000,27496938),(23664,1554851784,0.0000,50439177),(23252,1554851792,0.0000,55044134),(23253,1554851793,0.0169,55551362),(23255,1554851795,0.0000,56975578),(23256,1554851796,0.0339,57731334),(23257,1554851797,0.0592,58908528),(23258,1554851798,0.0000,60024640),(23259,1554851799,0.0000,60201292),(23620,1554851800,0.2771,60802687),(23260,1554851800,0.0000,60870433),(23264,1554851804,0.0000,64108481),(23625,1554851805,1.3715,65152657),(23265,1554851805,0.0000,65217487),(23266,1554851806,0.0000,66053012),(25667,1554851807,0.0000,67090683),(23268,1554851808,0.0000,68259648),(23628,1554851808,0.0000,68320090),(25668,1554851808,0.0000,68351057),(23269,1554851809,0.0000,68938892),(23270,1554851810,0.0339,69241727),(25371,1554851811,0.0000,69494967),(23273,1554851813,3.3719,71465312),(10073,1554851813,0.5328,71528642),(23274,1554851814,0.0000,72630325),(10074,1554851814,0.0000,72694060),(10075,1554851815,0.0000,73682198),(23275,1554851815,0.2205,73741954),(23276,1554851816,0.1020,74359859),(10076,1554851816,0.0500,74419936),(10077,1554851817,0.0000,75012947),(23277,1554851817,0.5829,75069689),(10078,1554851818,0.0000,76107343),(23664,1554851844,0.0169,90372483),(23252,1554851852,0.0000,95433195),(23253,1554851853,0.0169,95627431),(23255,1554851855,0.0000,97518084),(23256,1554851856,0.0169,98232958),(23257,1554851857,0.0804,98754493),(23258,1554851858,0.0000,99178747),(23259,1554851859,0.0339,99955251),(23260,1554851860,0.0000,100627238),(23620,1554851860,0.2914,100687951),(23264,1554851864,0.0000,110367020),(23265,1554851865,0.0000,111435515),(23625,1554851865,1.7320,111503568),(23266,1554851866,0.0000,112047292),(25667,1554851867,0.0000,112995636),(23628,1554851868,0.0000,113634350),(23268,1554851868,0.0000,113713375),(25668,1554851868,0.0000,113747785),(23269,1554851869,0.0000,114096845),(23270,1554851870,0.0169,115141396),(25371,1554851871,0.0000,115731562),(10073,1554851873,0.5329,117052271),(23273,1554851873,3.3719,117118310),(23274,1554851874,0.0000,117695072),(10074,1554851874,0.0000,117775812),(23275,1554851875,0.2205,118661365),(10075,1554851875,0.0000,118723996),(10076,1554851876,0.0666,119339594),(23276,1554851876,0.1041,119444825),(10077,1554851877,0.0000,119981210),(23277,1554851877,0.5996,120046121),(10078,1554851878,0.0500,120874427),(23302,1554851902,0.0000,144788854),(23664,1554851904,0.0000,134480985),(23252,1554851912,0.0000,138706416),(23253,1554851913,0.0169,139150570),(23255,1554851915,0.0000,140456365),(23256,1554851916,0.0000,141218596),(23257,1554851917,0.0467,141646218),(23258,1554851918,0.0000,142465470),(23259,1554851919,0.0000,143302265),(23620,1554851920,0.3032,143460219),(23260,1554851920,0.0000,143525394),(23264,1554851924,0.0000,146013009),(23265,1554851925,0.0000,146447389),(23625,1554851925,2.1154,146508598),(23266,1554851926,0.0000,147455239),(25667,1554851927,0.0000,148434604),(23268,1554851928,0.0000,148717201),(25668,1554851928,0.0000,148767686),(23628,1554851928,0.0333,148794422),(23269,1554851929,0.0000,149718664),(23270,1554851930,0.0000,150062065),(25371,1554851931,0.0000,150473477),(23273,1554851933,3.3718,152138100),(10073,1554851933,0.5497,152199940),(10074,1554851934,0.0000,153237791),(23274,1554851934,0.0000,153326049),(10075,1554851935,0.0000,153821197),(23275,1554851935,0.2205,153880900),(10076,1554851936,0.0666,154609910),(23276,1554851936,0.1083,154670976),(23277,1554851937,0.6163,155688572),(10077,1554851937,0.0000,155747229),(10078,1554851938,0.0167,156192421),(23302,1554851962,0.0000,179918361),(23303,1554851963,0.0335,181105938),(23664,1554851964,0.0000,180946358),(23304,1554851964,0.0000,181948755),(23305,1554851965,0.2847,182623713),(23306,1554851966,2.6126,183279552),(23310,1554851970,99.9686,186879393),(23252,1554851972,0.0000,187117903),(23253,1554851973,0.0339,187427471),(23255,1554851975,0.0000,189662422),(23256,1554851976,0.0508,190302357),(23257,1554851977,0.0635,190553659),(23258,1554851978,0.0000,190987551),(23259,1554851979,0.0000,191915802),(23620,1554851980,0.3217,192795676),(23260,1554851980,0.0000,192856100),(23264,1554851984,0.0169,194643587),(23625,1554851985,2.4979,196656456),(23265,1554851985,0.0000,196704367),(23266,1554851986,0.0000,197339479),(25667,1554851987,0.0000,197784023),(23628,1554851988,0.0333,198731773),(25668,1554851988,0.0000,198793129),(23268,1554851988,0.0000,198825193),(23269,1554851989,0.0034,199064571),(23270,1554851990,0.0000,199919120),(25371,1554851991,0.0000,201118862),(10073,1554851993,0.6328,202384061),(23273,1554851993,3.3718,202444253),(23274,1554851994,0.0007,202572457),(10074,1554851994,0.0000,202632736),(10075,1554851995,0.0000,203165867),(23275,1554851995,0.2205,203222005),(23276,1554851996,0.1272,204083523),(10076,1554851996,0.1166,204184826),(23277,1554851997,0.7494,204873300),(10077,1554851997,0.0000,204932668),(10078,1554851998,0.0000,206079316),(28498,1554851998,0.0000,206798698),(28500,1554852000,0.0000,206932054),(23295,1554852015,0.0700,215081682),(23296,1554852016,0.0800,216409922),(23297,1554852017,0.0900,216946181),(23299,1554852019,94.3877,218714094),(23300,1554852020,0.0000,220079880),(23301,1554852021,1.0050,221017586),(23302,1554852022,0.0000,221563460),(23303,1554852023,0.0503,221999607),(23664,1554852024,0.0000,222963191),(23304,1554852024,0.0000,223704435),(23305,1554852025,0.4858,224251933),(23306,1554852026,3.9698,225376816),(23310,1554852030,99.9686,227244793),(23252,1554852032,0.0000,227915133),(23253,1554852033,0.0169,228770221),(23255,1554852035,0.0000,230697644),(23256,1554852036,0.0339,231987960),(23257,1554852037,0.1606,232509291),(23258,1554852038,0.0000,233471498),(23259,1554852039,0.0169,234072640),(23620,1554852040,0.3417,234404609),(23260,1554852040,0.0000,234464751),(23264,1554852044,0.0068,237311525),(23265,1554852045,0.0000,238018055),(23625,1554852045,2.9480,238074495),(23266,1554852046,0.0000,238345645),(25667,1554852047,0.0000,239269256),(25668,1554852048,0.0000,240484952),(23268,1554852048,0.0000,240571493),(23628,1554852048,0.0666,240617183),(23269,1554852049,0.0034,242261834),(23270,1554852050,0.0000,242902607),(25371,1554852051,0.0000,244199653),(23273,1554852053,3.6324,245825786),(10073,1554852053,0.7661,245893578),(23274,1554852054,0.0000,247552616),(10074,1554852054,0.0000,247606740),(23275,1554852055,0.2205,248682165),(10075,1554852055,0.0000,248721183),(23276,1554852056,0.1503,249380247),(10076,1554852056,0.1665,249452206),(23277,1554852057,0.9326,249735015),(10077,1554852057,0.0000,249797083),(28498,1554852058,0.0000,250308422),(10078,1554852058,0.0000,250378366),(28500,1554852060,0.0000,251512122),(23295,1554852075,0.0700,261039702),(23296,1554852076,0.0300,261650110),(23297,1554852077,0.0700,262451402),(23299,1554852079,98.2071,264671077),(23300,1554852080,0.0000,266032595),(23301,1554852081,0.7040,267365720),(23302,1554852082,0.0000,268733401),(23303,1554852083,0.0168,269576362),(23304,1554852084,0.0000,270272785),(23664,1554852084,0.0000,270347460),(23305,1554852085,0.1341,270966070),(23306,1554852086,0.9217,272101894),(23310,1554852090,99.9686,275593673),(23252,1554852092,0.0000,276089290),(23253,1554852093,0.0339,276781222),(23255,1554852095,0.0000,281424329),(23256,1554852096,0.0000,282655047),(23257,1554852097,0.1142,283403142),(23258,1554852098,0.0000,284079669),(23259,1554852099,0.0169,285311312),(23620,1554852100,0.3598,286008914),(23260,1554852100,0.0000,286070067),(23264,1554852104,1.0297,287803841),(23625,1554852105,3.4804,288870413),(23265,1554852105,0.0000,288930953),(23266,1554852106,0.0000,289179891),(25667,1554852107,0.0000,289801546),(23628,1554852108,0.0000,290040894),(23268,1554852108,0.0000,290108557),(25668,1554852108,0.0000,290140934),(23269,1554852109,0.0000,290540804),(23270,1554852110,0.0000,291420293),(25371,1554852111,0.0000,291565576),(23273,1554852113,3.6605,292229915),(10073,1554852113,0.7661,292290810),(10074,1554852114,0.0000,293089575),(23274,1554852114,0.0000,293139450),(10075,1554852115,0.0000,293907802),(23275,1554852115,0.2205,293962599),(10076,1554852116,0.1998,294957719),(23276,1554852116,0.1545,295011406),(23277,1554852117,0.9659,295251699),(10077,1554852117,0.0000,295317569),(10078,1554852118,0.0000,296154398),(28498,1554852118,0.0000,296623863),(28500,1554852120,0.0000,298153051),(23295,1554852135,0.0600,316875676),(23296,1554852136,0.0100,317912220),(23297,1554852137,0.0600,318373559),(23299,1554852139,98.5080,319489644),(23300,1554852140,0.0000,320917141),(23301,1554852141,0.4525,322017580),(23302,1554852142,0.0000,323766828),(23303,1554852143,0.0168,323454497),(23664,1554852144,0.0000,323913691),(23304,1554852144,0.0000,324457620),(23305,1554852145,0.1509,324808693),(23306,1554852146,0.9219,325111054),(23310,1554852150,99.9686,329328772),(23252,1554852152,0.0000,329944128),(23253,1554852153,0.0169,331046165),(23255,1554852155,0.0000,332720392),(23256,1554852156,0.0339,334114566),(23257,1554852157,0.1825,334749357),(23258,1554852158,0.0000,335841817),(23259,1554852159,0.0169,337071173),(23620,1554852160,0.3678,338220323),(23260,1554852160,0.0000,338303014),(23264,1554852164,0.0068,364050295),(23625,1554852165,3.9283,365248452),(23265,1554852165,0.0000,365333582),(23266,1554852166,0.0000,366416932),(25667,1554852167,0.0000,367447780),(25668,1554852168,0.0000,368593000),(23268,1554852168,0.0000,368658295),(23628,1554852168,0.0000,368688366),(23269,1554852169,0.0000,369261364),(23270,1554852170,5.1000,369587911),(25371,1554852171,0.0000,370295885),(10073,1554852173,0.7656,372232028),(23273,1554852173,3.6621,372293239),(23274,1554852174,0.0000,373317871),(10074,1554852174,0.0000,373382513),(10075,1554852175,0.0000,374327752),(23275,1554852175,0.2205,374394341),(23276,1554852176,0.1545,375275728),(10076,1554852176,0.1997,375345289),(23277,1554852177,0.9654,375986525),(10077,1554852177,0.0000,376052890),(10078,1554852178,0.0166,376678441),(28498,1554852178,0.0000,378001777),(28500,1554852180,0.0000,378566570),(23295,1554852195,0.0600,390445832),(23296,1554852196,0.0000,391039301),(23297,1554852197,0.0500,392184313),(23299,1554852199,97.6366,394611123),(23300,1554852200,0.0000,395873969),(23301,1554852201,0.9556,396879823),(23302,1554852202,0.0000,398090763),(23303,1554852203,0.0168,399213042),(23664,1554852204,0.0000,399670733),(23304,1554852204,0.0000,399974022),(23305,1554852205,0.1844,400351084),(23306,1554852206,1.1735,401867297),(23310,1554852210,99.9686,404623534),(23252,1554852212,0.0000,405795548),(23253,1554852213,0.0339,406018135),(23255,1554852215,0.0169,407158092),(23256,1554852216,0.0169,407772831),(23257,1554852217,0.2071,408680157),(23258,1554852218,0.0000,409762819),(23259,1554852219,0.0169,410198774),(23620,1554852220,0.3881,410431824),(23260,1554852220,0.0000,410500395),(23264,1554852224,0.0102,413258265),(23265,1554852225,0.0000,413512805),(23625,1554852225,4.3798,413592915),(23266,1554852226,0.0000,414021139),(25667,1554852227,0.0000,414733519),(23268,1554852228,0.0000,415384958),(23628,1554852228,0.0000,415447395),(25668,1554852228,0.0000,415477420),(23269,1554852229,0.0000,416521824),(23270,1554852230,5.0982,417743236),(25371,1554852231,0.0000,418808553),(23273,1554852233,3.6621,420027081),(10073,1554852233,0.7661,420090136),(23274,1554852234,0.0000,420460684),(10074,1554852234,0.0000,420521404),(23275,1554852235,0.2205,421277891),(10075,1554852235,0.0000,421336310),(23276,1554852236,0.1545,422184212),(10076,1554852236,0.1998,422245527),(10077,1554852237,0.0000,423012011),(23277,1554852237,0.9659,423070256),(10078,1554852238,0.0167,423712410),(28498,1554852238,0.0000,424247647),(28500,1554852240,0.0000,426305445),(23295,1554852255,0.0500,437236997),(23296,1554852256,0.0000,438373341),(23297,1554852257,0.0400,439524968),(23299,1554852259,98.3579,441449328),(23300,1554852260,0.0000,441720318),(23301,1554852261,0.6702,442488508),(23302,1554852262,0.0000,443407969),(23303,1554852263,0.0335,444375066),(23304,1554852264,0.0000,445018043),(23664,1554852264,0.0000,445097092),(23305,1554852265,0.1340,446406883),(23306,1554852266,0.8210,446745997),(23310,1554852270,99.9686,450376903),(23252,1554852272,0.0000,451349378),(23253,1554852273,0.0339,452358067),(23255,1554852275,0.0000,454178860),(23256,1554852276,0.0508,454985568),(23257,1554852277,0.0804,455158863),(23258,1554852278,0.0000,455967175),(23259,1554852279,0.0169,457055446),(23260,1554852280,0.0000,458057853),(23620,1554852280,0.3911,458125103),(23264,1554852284,0.0068,460665515),(23625,1554852285,4.6630,460987274),(23265,1554852285,0.0000,461051046),(23266,1554852286,0.0000,461540982),(25667,1554852287,0.0000,462505322),(23628,1554852288,0.0000,463449878),(25668,1554852288,0.0000,463515001),(23268,1554852288,0.0000,463543531),(23269,1554852289,0.0000,464317408),(23270,1554852290,5.0991,465092863),(25371,1554852291,0.0000,465883483),(23273,1554852293,3.6621,467416621),(10073,1554852293,0.7661,467474718),(10074,1554852294,0.0000,468196690),(23274,1554852294,0.0000,468258273),(10075,1554852295,0.0000,468850765),(23275,1554852295,0.2205,468911027),(10076,1554852296,0.1998,469124071),(23276,1554852296,0.1545,469186962),(10077,1554852297,0.0000,469702697),(23277,1554852297,0.9659,469763064),(10078,1554852298,0.0000,470018482),(28498,1554852298,0.0000,470647587),(28500,1554852300,0.0000,472868323),(23295,1554852315,0.0500,482518230),(23296,1554852316,0.0000,483072921),(23297,1554852317,0.0400,483952410),(23299,1554852319,98.0231,485796998),(23300,1554852320,0.0000,487212704),(23301,1554852321,0.8876,487800554),(23302,1554852322,0.0000,488675461),(23303,1554852323,0.0168,489548110),(23664,1554852324,0.0000,489973103),(23304,1554852324,0.0000,490591318),(23305,1554852325,0.1508,491477057),(23306,1554852326,0.7705,492557274),(23310,1554852330,99.9686,495592676),(23252,1554852332,0.0000,496038007),(23253,1554852333,0.0339,496446825),(23255,1554852335,0.0000,498087694),(23256,1554852336,0.0339,498553743),(23257,1554852337,0.2122,499358522),(23258,1554852338,0.0000,500216228),(23259,1554852339,0.0339,500889490),(23260,1554852340,0.0000,501279486),(23620,1554852340,0.3986,501352904),(23264,1554852344,0.0102,503584148),(23625,1554852345,4.6800,504070527),(23265,1554852345,0.0000,504130093),(23266,1554852346,0.0000,504623954),(25667,1554852347,0.0000,505353605),(25668,1554852348,0.0000,506164489),(23628,1554852348,0.0000,506223377),(23268,1554852348,0.0000,506252380),(23269,1554852349,0.0034,507265703),(23270,1554852350,5.1152,507611259),(25371,1554852351,0.0000,507825250),(23273,1554852353,3.6599,508526948),(10073,1554852353,0.7661,508597670),(10074,1554852354,0.0000,509610029),(23274,1554852354,0.0000,509664031),(23275,1554852355,0.2205,510391640),(10075,1554852355,0.0000,510449277),(10076,1554852356,0.1999,511222329),(23276,1554852356,0.1545,511294386),(10077,1554852357,0.0000,511821042),(23277,1554852357,0.9660,511873107),(10078,1554852358,0.0000,512734975),(28498,1554852358,0.0000,513438719),(28500,1554852360,0.0000,514970750),(23295,1554852375,0.0500,524128588),(23296,1554852376,0.0000,524943749),(23297,1554852377,0.0300,526256197),(23299,1554852379,98.2574,528645095),(23300,1554852380,0.0000,529750645),(23301,1554852381,0.7877,530403880),(23302,1554852382,0.0000,531945097),(23303,1554852383,0.0168,532865115),(23664,1554852384,0.0000,534156192),(23304,1554852384,0.0000,534481257),(23305,1554852385,0.1508,534798506),(23306,1554852386,0.9717,535767298),(23310,1554852390,99.9686,539591096),(23252,1554852392,0.0000,540591497),(23253,1554852393,0.0169,541067324),(23255,1554852395,0.0000,542636098),(23256,1554852396,0.0339,543250879),(23257,1554852397,0.1902,544631080),(23258,1554852398,0.0000,545297118),(23259,1554852399,0.0169,545448091),(23620,1554852400,0.4050,546253635),(23260,1554852400,0.0000,546318420),(23264,1554852404,0.0068,548302187),(23625,1554852405,4.3468,548449488),(23265,1554852405,0.0000,548515220),(23266,1554852406,0.0000,549566709),(25667,1554852407,0.0000,549831979),(23268,1554852408,0.0000,550419187),(23628,1554852408,0.0000,550479579),(25668,1554852408,0.0000,550510878),(23269,1554852409,0.0000,550860445),(23270,1554852410,5.1143,551184162),(25371,1554852411,0.0000,551984670),(23273,1554852413,3.6599,553215174),(10073,1554852413,0.7661,553275965),(23274,1554852414,0.0000,554309546),(10074,1554852414,0.0000,554370068),(23275,1554852415,0.2205,555506295),(10075,1554852415,0.0000,555563448),(23276,1554852416,0.1545,555916773),(10076,1554852416,0.1999,555975719),(10077,1554852417,0.0000,556975107),(23277,1554852417,0.9659,557044786),(10078,1554852418,0.0000,557592510),(28498,1554852418,0.0000,558059316),(28500,1554852420,0.0000,559254087),(23295,1554852435,0.0500,579319882),(23296,1554852436,0.0000,580186387),(23297,1554852437,0.0200,581287109),(23299,1554852439,98.1401,582672097),(23300,1554852440,0.0000,583171808),(23301,1554852441,0.8044,584370266),(23302,1554852442,0.0000,585348029),(23303,1554852443,0.0168,585953017),(23304,1554852444,0.0000,586472608),(23664,1554852444,0.0000,586547546),(23305,1554852445,0.1006,593649723),(23306,1554852446,0.7878,594239636),(23310,1554852450,99.9686,597755974),(23252,1554852452,0.0000,597932942),(23253,1554852453,0.0339,598079874),(23255,1554852455,0.0000,602747001),(23256,1554852456,0.0169,603218381),(23257,1554852457,0.1649,603384115),(23258,1554852458,0.0000,604547559),(23259,1554852459,0.0000,605441899),(23620,1554852460,0.4050,606004738),(23260,1554852460,0.0000,606066834),(23264,1554852464,0.0068,608231408),(23625,1554852465,4.3456,609087793),(23265,1554852465,0.0000,609164027),(23266,1554852466,0.0000,610046688),(25667,1554852467,0.0000,610201107),(25668,1554852468,0.0000,610440650),(23268,1554852468,0.0000,610508414),(23628,1554852468,0.0000,610538139),(23269,1554852469,0.0034,610983528),(23270,1554852470,5.1143,611539269),(25371,1554852471,0.0000,612403525),(10073,1554852473,0.7659,613382489),(23273,1554852473,3.6626,613445049),(23274,1554852474,0.0000,613886983),(10074,1554852474,0.0000,613950941),(10075,1554852475,0.0000,614325222),(23275,1554852475,0.2205,614391375),(10076,1554852476,0.2165,615494748),(23276,1554852476,0.1545,615564106),(23277,1554852477,0.9824,616540702),(10077,1554852477,0.0000,616601282),(10078,1554852478,0.0500,617355739),(28498,1554852478,0.0000,618190286),(28500,1554852480,0.0000,619690929),(23295,1554852495,0.0500,633644387),(23296,1554852496,0.0000,634620376),(23297,1554852497,0.0200,635195172),(23299,1554852499,98.0221,637256636),(23300,1554852500,0.0000,637943378),(23301,1554852501,0.9219,639557016),(23302,1554852502,0.0000,640743034),(23303,1554852503,0.0335,641295894),(23664,1554852504,0.0000,642380450),(23304,1554852504,0.0000,642906658),(23305,1554852505,0.1676,644091621),(23306,1554852506,0.9888,645335966),(23310,1554852510,99.9686,649121913),(23252,1554852512,0.0000,652202057),(23253,1554852513,0.0339,652356793),(28653,1554852513,98.8285,654954713),(28654,1554852514,99.9367,656554970),(23255,1554852515,0.0000,658015281),(23256,1554852516,0.0339,658272025),(23257,1554852517,0.1480,665945414),(28657,1554852517,76.0939,668065488),(23258,1554852518,0.0000,667071245),(28658,1554852518,84.0418,669251718),(23259,1554852519,0.0169,667783644),(23260,1554852520,0.0000,668467836),(23620,1554852520,0.4244,668524935),(23264,1554852524,0.0508,672455268),(23265,1554852525,0.0000,673259479),(23625,1554852525,4.4119,673319930),(23266,1554852526,0.0000,674150345),(25667,1554852527,0.0000,674790814),(23268,1554852528,0.0000,675835417),(25668,1554852528,0.0000,675892756),(23628,1554852528,0.1831,675920406),(23269,1554852529,0.0034,676204787),(23270,1554852530,5.0982,677083994),(25371,1554852531,0.0000,677415374),(10073,1554852533,0.8324,678540281),(23273,1554852533,3.8050,678616317),(23274,1554852534,0.0000,679029185),(10074,1554852534,0.0666,679087036),(23275,1554852535,0.2205,680243631),(10075,1554852535,0.0000,680301612),(10076,1554852536,0.3663,681090888),(23276,1554852536,0.1818,681150191),(23277,1554852537,1.2653,681575340),(10077,1554852537,0.0000,681634139),(28498,1554852538,0.0000,682176802),(10078,1554852538,0.0166,682247385),(28500,1554852540,0.0000,683401147),(23295,1554852555,0.0500,693627839),(23296,1554852556,0.0000,694971289),(23297,1554852557,0.0100,695609458),(23299,1554852559,98.2736,697567132),(23300,1554852560,0.0000,698756392),(23301,1554852561,0.5363,699470322),(23302,1554852562,0.0000,700737731),(23303,1554852563,0.0335,701644485),(23664,1554852564,0.0000,702417244),(23304,1554852564,0.0000,702748038),(23305,1554852565,0.1844,703092979),(23306,1554852566,0.7879,703931490),(23310,1554852570,99.9686,708166117),(23252,1554852572,0.0000,709817885),(23253,1554852573,0.0339,711710071),(28653,1554852573,98.8285,713380692),(28654,1554852574,99.9367,719791670),(23255,1554852575,0.0000,713487421),(23256,1554852576,0.0000,714907283),(23257,1554852577,0.0973,715927911),(28657,1554852577,76.0939,718165135),(23258,1554852578,0.0000,718265802),(28658,1554852578,84.0418,720530573),(23259,1554852579,0.0339,718760808),(23620,1554852580,0.4175,719051448),(23260,1554852580,0.0000,719111507),(23264,1554852584,0.0135,725173683),(23625,1554852585,4.2796,726143841),(23265,1554852585,0.0000,726205088),(23266,1554852586,0.0000,727134468),(25667,1554852587,0.0000,727881051),(23628,1554852588,0.0000,728501748),(25668,1554852588,0.0000,728570469),(23268,1554852588,0.0000,728601752),(23269,1554852589,0.0000,728812005),(23270,1554852590,5.0974,729696071),(25371,1554852591,0.0000,730912711),(23273,1554852593,3.8050,732651473),(10073,1554852593,0.8326,732714564),(10074,1554852594,0.0000,733781112),(23274,1554852594,0.0000,733842093),(10075,1554852595,0.0000,733958807),(23275,1554852595,0.2205,734025169),(10076,1554852596,0.2997,735154524),(23276,1554852596,0.1860,735217973),(23277,1554852597,1.1323,735896161),(10077,1554852597,0.0000,735955113),(10078,1554852598,0.0000,736244768),(28498,1554852598,0.0000,737571492),(28500,1554852600,0.0000,738097146),(23295,1554852615,0.0500,748213714),(23296,1554852616,0.0000,749465252),(23297,1554852617,0.0100,750621155),(23299,1554852619,98.5085,753212000),(23300,1554852620,0.0000,754104602),(23301,1554852621,0.5195,755219447),(23302,1554852622,0.0000,756578382),(23303,1554852623,0.0168,756791517),(23664,1554852624,0.0000,757223893),(23304,1554852624,0.0000,757629459),(23305,1554852625,0.1509,757941435),(23306,1554852626,0.9554,759084925),(23310,1554852630,99.9686,761196509),(23252,1554852632,0.0000,763021760),(23253,1554852633,0.0169,763741585),(28653,1554852633,98.8285,766102512),(28654,1554852634,99.9367,766901333),(23255,1554852635,0.0000,767427410),(23256,1554852636,0.0169,768107222),(23257,1554852637,0.0888,768551742),(28657,1554852637,76.0939,770926231),(23258,1554852638,0.0000,771828652),(28658,1554852638,84.0418,772095842),(23259,1554852639,0.0169,772211567),(23260,1554852640,0.0000,773055931),(23620,1554852640,0.4206,773117744),(23264,1554852644,0.0169,775663904),(23625,1554852645,4.6295,776042706),(23265,1554852645,0.0000,776106644),(23266,1554852646,0.0000,776714709),(25667,1554852647,0.0000,776991687),(23268,1554852648,0.0000,777221728),(23628,1554852648,0.0000,777284019),(25668,1554852648,0.0000,777314983),(23269,1554852649,0.0000,778162904),(23270,1554852650,5.0822,778869525),(25371,1554852651,0.0000,779808242),(23273,1554852653,3.8050,781331126),(10073,1554852653,0.8327,781394390),(23274,1554852654,0.0000,781912351),(10074,1554852654,0.0000,781974326),(10075,1554852655,0.0000,782413316),(23275,1554852655,0.2205,782475759),(10076,1554852656,0.2998,782587697),(23276,1554852656,0.1860,782652454),(23277,1554852657,1.1324,783052022),(10077,1554852657,0.0000,783117196),(10078,1554852658,0.0000,784216140),(28498,1554852658,0.0000,784945853),(28500,1554852660,0.0000,785623340),(23295,1554852675,0.0500,796185624),(23296,1554852676,0.0000,796866886),(23297,1554852677,0.0100,797884479),(23299,1554852679,98.1395,799233844),(23300,1554852680,0.0000,800428572),(23301,1554852681,0.7879,800996724),(23302,1554852682,0.0000,801643479),(23303,1554852683,0.0000,802721382),(23304,1554852684,0.0000,803214841),(23664,1554852684,0.0000,803292883),(23305,1554852685,0.1340,804973643),(23306,1554852686,0.8043,805688563),(23310,1554852690,99.9686,809281037),(23252,1554852692,0.0000,810337237),(23253,1554852693,0.0169,812160740),(28653,1554852693,98.8285,814398631),(28654,1554852694,99.9367,815257502),(23255,1554852695,0.0000,816317806),(23256,1554852696,0.0339,818889439),(23257,1554852697,0.2164,819436648),(28657,1554852697,76.0939,821637391),(23258,1554852698,0.0000,821445691),(28658,1554852698,84.0418,823541754),(23259,1554852699,0.0000,822151951),(23620,1554852700,0.4229,822803487),(23260,1554852700,0.0000,822868739),(23264,1554852704,0.0102,827035478),(23625,1554852705,4.4794,828057678),(23265,1554852705,0.0000,828124963),(23266,1554852706,0.0000,828776841),(25667,1554852707,0.0000,829336745),(23628,1554852708,0.0000,830066770),(25668,1554852708,0.0000,830135071),(23268,1554852708,0.0000,830166921),(23269,1554852709,0.0000,830682795),(23270,1554852710,0.0000,831737840),(25371,1554852711,0.0000,832321102),(10073,1554852713,0.8326,833554485),(23273,1554852713,3.8050,833614092),(23274,1554852714,0.0000,834611471),(10074,1554852714,0.0000,834671473),(23275,1554852715,0.2205,835296326),(10075,1554852715,0.0000,835357858),(10076,1554852716,0.2997,836113009),(23276,1554852716,0.1860,836194283),(10077,1554852717,0.0000,836674907),(23277,1554852717,1.1323,836737054),(10078,1554852718,0.0000,837689560),(28498,1554852718,0.0000,838541236),(28500,1554852720,0.0000,839008012),(23295,1554852735,0.0500,848687428),(23296,1554852736,0.0000,849180108),(23297,1554852737,0.0100,850850833),(23299,1554852739,98.0395,853130186),(23300,1554852740,0.0000,854105581),(23301,1554852741,1.0052,855320616),(23302,1554852742,0.0000,856200074),(23303,1554852743,0.0335,856664364),(23664,1554852744,0.0000,857929049),(23304,1554852744,0.0000,858306583),(23305,1554852745,0.1676,859173155),(23306,1554852746,0.9217,860067115),(23310,1554852750,99.9686,864046032),(23252,1554852752,0.0000,865088276),(23253,1554852753,0.0339,867557471),(28653,1554852753,98.8285,867933766),(28654,1554852754,99.9367,875470138),(23255,1554852755,0.0000,869484240),(23256,1554852756,0.0169,870177961),(23257,1554852757,0.1522,873328153),(28657,1554852757,76.0939,875579010),(23258,1554852758,0.0000,875818929),(28658,1554852758,84.0418,876009589),(23259,1554852759,0.0339,876730644),(23260,1554852760,0.0000,877500897),(23620,1554852760,0.4233,877563332),(23264,1554852764,0.0203,881540013),(23265,1554852765,0.0000,882752924),(23625,1554852765,4.4959,882809558),(23266,1554852766,0.0000,883756695),(25667,1554852767,0.0000,884944471),(23628,1554852768,0.0000,885118416),(25668,1554852768,0.0000,885187426),(23268,1554852768,0.0000,885218654),(23269,1554852769,0.0000,886380574),(23270,1554852770,5.0813,886638114),(25371,1554852771,0.0000,887227858),(10073,1554852773,0.8326,888660125),(23273,1554852773,3.8050,888715378),(10074,1554852774,0.0000,889211962),(23274,1554852774,0.0000,889281047),(23275,1554852775,0.2232,889818970),(10075,1554852775,0.0000,889884079),(23276,1554852776,0.1860,890928506),(10076,1554852776,0.2997,890988606),(10077,1554852777,0.0000,891297792),(23277,1554852777,1.1323,891356925),(10078,1554852778,0.0167,892160075),(28498,1554852778,0.0000,892746736),(28500,1554852780,0.0000,894104384),(23295,1554852795,0.0500,901937070),(23296,1554852796,0.0700,903005009),(23297,1554852797,0.0300,903539963),(23299,1554852799,98.4241,905393491),(23300,1554852800,0.0000,906368004),(23301,1554852801,0.6537,907015601),(23302,1554852802,0.0000,908105860),(23303,1554852803,0.0168,909113451),(23304,1554852804,0.0000,909648842),(23664,1554852804,0.0000,909725214),(23305,1554852805,0.1509,910857570),(23306,1554852806,0.7878,911557754),(23310,1554852810,99.9686,913374763),(23252,1554852812,0.0000,914569526),(23253,1554852813,0.0339,915223947),(28653,1554852813,98.8285,917456693),(28654,1554852814,99.9367,922700239),(23255,1554852815,0.0000,918589451),(23256,1554852816,0.0508,922800598),(23257,1554852817,0.1944,923894348),(28657,1554852817,76.0939,926622103),(23258,1554852818,0.0000,926828109),(28658,1554852818,84.0418,927201271),(23259,1554852819,0.0169,927242567),(23260,1554852820,0.0000,928299027),(23620,1554852820,0.4231,928376405),(23264,1554852824,0.0203,930669054),(23625,1554852825,4.5130,931793937),(23265,1554852825,0.0000,931858968),(23266,1554852826,0.0000,932057128),(25667,1554852827,0.0000,933026287),(23268,1554852828,0.0000,933715183),(25668,1554852828,0.0000,933773449),(23628,1554852828,0.0000,933796736),(23269,1554852829,0.0000,934965324),(23270,1554852830,5.0991,935265767),(25371,1554852831,0.0000,936234237),(10073,1554852833,0.8326,938128623),(23273,1554852833,3.8050,938188616),(10074,1554852834,0.0000,938549368),(23274,1554852834,0.0000,938611880),(10075,1554852835,0.0000,939313637),(23275,1554852835,0.2205,939356902),(23276,1554852836,0.1860,940365623),(10076,1554852836,0.2998,940424610),(23277,1554852837,1.1324,941173593),(10077,1554852837,0.0000,941231350),(10078,1554852838,0.0167,942336912),(28498,1554852838,0.0000,943095905),(28500,1554852840,0.0000,944945809),(23295,1554852855,0.0700,955749647),(23296,1554852856,0.2900,956875546),(23297,1554852857,0.1000,957705334),(23299,1554852859,98.0570,959739301),(23300,1554852860,0.0000,961225281),(23301,1554852861,0.7875,962575513),(23302,1554852862,0.0000,963518793),(23303,1554852863,0.0168,964455967),(23664,1554852864,0.0000,964888746),(23304,1554852864,0.0000,965391591),(23305,1554852865,0.1676,966637374),(23306,1554852866,0.9045,967755991),(23310,1554852870,99.9686,970888575),(23252,1554852872,0.0000,971978292),(23253,1554852873,0.0169,972661233),(28653,1554852873,98.8285,974608641),(28654,1554852874,99.9367,980009423),(23255,1554852875,0.0000,978252384),(23256,1554852876,0.0169,979549147),(23257,1554852877,0.1401,983432433),(28657,1554852877,76.0939,983883702),(23258,1554852878,0.0000,984421051),(28658,1554852878,84.0418,986484321),(23259,1554852879,0.0169,985484334),(23260,1554852880,0.0000,985901248),(23620,1554852880,0.4250,985956667),(23264,1554852884,0.0135,988313291),(23265,1554852885,0.0000,989263909),(23625,1554852885,4.5290,989325393),(23266,1554852886,0.0000,990271706),(25667,1554852887,0.0000,990534921),(23268,1554852888,0.0000,991563015),(25668,1554852888,0.0000,991625160),(23628,1554852888,0.0000,991654099),(23269,1554852889,0.0000,992784704),(23270,1554852890,5.0991,993780346),(25371,1554852891,0.0000,994119550),(10073,1554852893,0.8325,995228645),(23273,1554852893,3.8050,995289535),(23274,1554852894,0.0000,995778645),(10074,1554852894,0.0000,995845868),(23275,1554852895,0.2205,996028483),(10075,1554852895,0.0000,996091580),(10076,1554852896,0.2997,996275421),(23276,1554852896,0.1860,996342188),(23277,1554852897,1.1323,996599551),(10077,1554852897,0.0000,996661507),(10078,1554852898,0.0000,997506430),(28498,1554852898,0.0000,998042558),(28500,1554852900,0.0000,999080572),(23295,1554852915,0.0800,15117656),(23296,1554852916,0.2500,15555748),(23297,1554852917,0.1200,16555860),(23299,1554852919,98.3747,18195098),(23300,1554852920,0.0000,19334402),(23301,1554852921,0.6536,20515541),(23302,1554852922,0.0000,21598612),(23303,1554852923,0.0168,22566606),(23664,1554852924,0.0000,23171993),(23304,1554852924,0.0000,23782994),(23305,1554852925,0.1676,24837952),(23306,1554852926,0.9216,25979321),(23310,1554852930,99.9686,29154062),(23252,1554852932,0.0000,30556351),(23253,1554852933,0.0339,31712513),(28653,1554852933,98.8285,34006157),(28654,1554852934,99.9367,35069702),(23255,1554852935,0.0000,33607127),(23256,1554852936,0.0508,36568398),(23257,1554852937,0.1226,37224981),(28657,1554852937,76.0939,39421510),(23258,1554852938,0.0000,38147836),(28658,1554852938,84.0418,41684268),(23259,1554852939,0.0339,40318721),(23620,1554852940,0.4326,40749574),(23260,1554852940,0.0000,40811107),(23264,1554852944,0.0135,44204409),(23625,1554852945,4.8598,45376008),(23265,1554852945,0.0000,45439428),(23266,1554852946,0.0000,46015825),(25667,1554852947,0.0000,46192319),(25668,1554852948,0.0000,47303982),(23268,1554852948,0.0000,47385394),(23628,1554852948,0.0000,47436957),(23269,1554852949,0.0000,48510151),(23270,1554852950,5.0974,49257733),(25371,1554852951,0.0000,49496493),(23273,1554852953,3.8050,51048827),(10073,1554852953,0.8467,51108552),(10074,1554852954,0.0000,51356323),(23274,1554852954,0.0000,51415039),(10075,1554852955,0.0000,52334224),(23275,1554852955,0.2205,52391393),(10076,1554852956,0.3048,53243175),(23276,1554852956,0.1860,53304331),(23277,1554852957,1.1514,53423269),(10077,1554852957,0.0000,53474558),(10078,1554852958,0.0000,53798923),(28498,1554852958,0.0000,54441826),(28500,1554852960,0.0000,56078358),(23295,1554852975,0.0800,63487491),(23296,1554852976,0.2300,64336568),(23297,1554852977,0.1300,65751481),(23299,1554852979,98.5923,67247209),(23300,1554852980,0.0000,67526745),(23301,1554852981,0.2848,69009231),(23302,1554852982,0.0000,70105112),(23303,1554852983,0.0335,70643283),(23664,1554852984,0.0000,70503114),(23304,1554852984,0.0000,71078817),(23305,1554852985,0.1508,71693204),(23306,1554852986,0.8042,72965036),(23310,1554852990,99.9686,75638513),(23252,1554852992,0.0000,77022690),(23253,1554852993,0.0339,77836700),(28653,1554852993,98.8285,79989013),(28654,1554852994,99.9367,84123060),(23255,1554852995,0.0000,79867594),(23256,1554852996,0.0169,84220156),(23257,1554852997,0.0508,85964347),(28657,1554852997,76.0939,88037591),(23258,1554852998,0.0000,88487972),(28658,1554852998,84.0418,88866201),(23259,1554852999,0.0339,88834859),(23620,1554853000,0.4339,89582750),(23260,1554853000,0.0000,89662035),(23264,1554853004,0.0169,92156140),(23625,1554853005,4.9960,93287029),(23265,1554853005,0.0000,93352896),(23266,1554853006,0.0000,93652899),(25667,1554853007,0.0000,94546732),(23628,1554853008,0.0000,94974024),(23268,1554853008,0.0000,95034641),(25668,1554853008,0.0000,95065699),(23269,1554853009,0.0034,102788155),(23270,1554853010,5.1143,103283646),(25371,1554853011,0.0000,103777785),(23273,1554853013,3.8050,104947683),(10073,1554853013,0.8326,105013834),(23274,1554853014,0.0000,105649723),(10074,1554853014,0.0000,105710149),(10075,1554853015,0.0000,106391129),(23275,1554853015,0.2232,106453305),(23276,1554853016,0.1860,107516725),(10076,1554853016,0.2997,107569893),(23277,1554853017,1.1323,108276109),(10077,1554853017,0.0000,108338629),(10078,1554853018,0.0000,108902965),(28498,1554853018,0.0000,109684100),(28500,1554853020,0.0000,115376693),(23295,1554853035,0.0900,127725133),(23296,1554853036,0.2700,128034935),(23297,1554853037,0.1500,129675422),(23299,1554853039,98.4755,131433932),(23300,1554853040,0.0000,132696713),(23301,1554853041,0.6535,133103894),(23302,1554853042,0.0000,135080934),(23303,1554853043,0.0168,135951704),(23664,1554853044,0.0000,136414941),(23304,1554853044,0.0000,137019984),(23305,1554853045,0.1676,138010614),(23306,1554853046,0.9216,138506038),(23310,1554853050,99.9686,142165581),(23252,1554853052,0.0000,143355398),(23253,1554853053,0.0339,146355693),(28653,1554853053,98.8285,150598662),(28654,1554853054,99.9367,149782270),(23255,1554853055,0.0000,149875304),(23256,1554853056,0.0339,151556138),(23257,1554853057,0.1733,151912129),(28657,1554853057,76.0939,154056930),(23258,1554853058,0.0000,155220421),(28658,1554853058,84.0418,157135004),(23259,1554853059,0.0169,155450844),(23260,1554853060,0.0000,156587364),(23620,1554853060,0.4360,156653334),(23264,1554853064,0.0068,165321932),(23625,1554853065,5.0106,165942901),(23265,1554853065,0.0000,166005416),(23266,1554853066,0.0000,167011796),(25667,1554853067,0.0000,167818138),(23268,1554853068,0.0000,168856469),(23628,1554853068,0.0000,168918825),(25668,1554853068,0.0000,168949247),(23269,1554853069,0.0000,169910302),(23270,1554853070,5.1321,170462681),(25371,1554853071,0.0000,170613530),(23273,1554853073,3.8050,171436865),(10073,1554853073,0.8324,171497202),(23274,1554853074,0.0000,172009023),(10074,1554853074,0.0000,172069131),(10075,1554853075,0.0000,177184090),(23275,1554853075,0.2205,177227897),(23276,1554853076,0.1860,177668785),(10076,1554853076,0.3163,177728228),(23277,1554853077,1.1487,178625659),(10077,1554853077,0.0000,178686224),(10078,1554853078,0.0499,179736765),(28498,1554853078,0.0000,180480658),(28500,1554853080,0.0000,182661660),(23295,1554853095,0.1100,193741643),(23296,1554853096,0.3100,194821690),(23297,1554853097,0.1900,195942071),(23299,1554853099,98.1236,198459523),(23300,1554853100,0.0000,199530460),(23301,1554853101,0.6702,200639544),(23302,1554853102,0.0000,201955241),(23303,1554853103,0.0168,203233849),(23664,1554853104,0.0000,204344861),(23304,1554853104,0.0000,204973223),(23305,1554853105,0.1843,205785509),(23306,1554853106,0.7708,206792214),(23310,1554853110,99.9686,210039725),(23252,1554853112,0.0000,212110546),(23253,1554853113,0.0169,212837245),(28653,1554853113,98.8285,215274435),(28654,1554853114,99.9367,219598996),(23255,1554853115,0.0000,216677776),(23256,1554853116,0.0169,217240964),(23257,1554853117,0.1486,218654244),(28657,1554853117,76.0939,220882552),(23258,1554853118,0.0000,221831629),(28658,1554853118,84.0418,224678881),(23259,1554853119,0.0169,222315340),(23260,1554853120,0.0000,223364414),(23620,1554853120,0.4414,223431416),(23264,1554853124,0.0102,225060078),(23625,1554853125,5.0949,226143292),(23265,1554853125,0.0000,226228585),(23266,1554853126,0.0000,227254373),(25667,1554853127,0.0000,227434796),(23628,1554853128,0.0000,227766643),(23268,1554853128,0.0000,227814062),(25668,1554853128,0.0000,227844348),(23269,1554853129,0.0000,228854518),(23270,1554853130,5.0991,229824777),(25371,1554853131,0.0000,230766703),(23273,1554853133,3.8050,232595149),(10073,1554853133,0.8325,232658709),(10074,1554853134,0.0000,233708795),(23274,1554853134,0.0000,233768775),(10075,1554853135,0.0000,233971904),(23275,1554853135,0.2205,234037184),(23276,1554853136,0.1881,235207021),(10076,1554853136,0.3330,235269750),(23277,1554853137,1.1656,235987595),(10077,1554853137,0.0000,236049397),(10078,1554853138,0.0167,236421594),(28498,1554853138,0.0000,237359943),(28500,1554853140,0.0000,238250470),(23295,1554853155,0.1200,255930009),(23296,1554853156,0.3300,256365401),(23297,1554853157,0.2100,257390857),(23299,1554853159,97.2697,259727177),(23300,1554853160,0.0000,260623403),(23301,1554853161,1.3568,261822783),(23302,1554853162,0.0000,262903991),(23303,1554853163,0.0168,263889364),(23664,1554853164,0.0000,264338906),(23304,1554853164,0.0000,264681265),(23305,1554853165,0.1843,265599483),(23306,1554853166,1.4240,266616527),(23310,1554853170,99.9686,270487133),(23252,1554853172,0.0000,271117757),(23253,1554853173,0.0169,271900602),(28653,1554853173,98.8285,274132325),(28654,1554853174,99.9367,279461072),(23255,1554853175,0.0000,274238781),(23256,1554853176,0.0000,276625361),(23257,1554853177,0.2450,279644738),(28657,1554853177,76.0939,279997289),(23258,1554853178,0.0000,279804287),(28658,1554853178,84.0418,282113196),(23259,1554853179,0.0339,280900108),(23620,1554853180,0.4408,281774245),(23260,1554853180,0.0000,281838530),(23264,1554853184,0.0102,286633215),(23265,1554853185,0.0000,287089594),(23625,1554853185,5.0449,287156601),(23266,1554853186,0.0000,287722201),(25667,1554853187,0.0000,288782792),(23268,1554853188,0.0000,289591597),(25668,1554853188,0.0000,289656740),(23628,1554853188,0.0000,289684638),(23269,1554853189,0.0000,290013706),(23270,1554853190,5.1152,291093814),(25371,1554853191,0.0000,292189120),(10073,1554853193,0.8325,294217453),(23273,1554853193,3.8050,294277996),(10074,1554853194,0.0000,294706162),(23274,1554853194,0.0000,294770284),(10075,1554853195,0.0000,295728328),(23275,1554853195,0.2205,295790700),(23276,1554853196,0.1881,296070829),(10076,1554853196,0.2997,296138583),(10077,1554853197,0.0000,296911328),(23277,1554853197,1.1322,296972211),(10078,1554853198,0.0000,297182510),(28498,1554853198,0.0000,297854782),(28500,1554853200,0.0000,299642411),(23295,1554853215,0.1300,309682598),(23296,1554853216,0.2700,310730196),(23297,1554853217,0.2100,312240975),(23299,1554853219,98.2236,314165180),(23300,1554853220,0.0000,315378822),(23301,1554853221,0.5531,315781648),(23302,1554853222,0.0000,316842754),(23303,1554853223,0.0168,317055962),(23664,1554853224,0.0000,317742726),(23304,1554853224,0.0000,318352385),(23305,1554853225,0.1508,319590645),(23306,1554853226,0.9383,320588763),(23310,1554853230,99.9686,324880045),(23252,1554853232,0.0000,325864867),(23253,1554853233,0.0339,327023621),(28653,1554853233,98.8285,329337313),(28654,1554853234,99.9367,333759840),(23255,1554853235,0.0000,330783087),(23256,1554853236,0.0339,333517472),(23257,1554853237,0.1062,337720695),(28657,1554853237,76.0939,339998062),(23258,1554853238,0.0000,338575106),(28658,1554853238,84.0418,340714826),(23259,1554853239,0.0000,338755781),(23260,1554853240,0.0000,339684483),(23620,1554853240,0.4421,339746104),(23264,1554853244,0.0203,344309396),(23265,1554853245,0.0000,344711525),(23625,1554853245,4.9952,344771441),(23266,1554853246,0.0000,345743384),(25667,1554853247,0.0000,346466998),(25668,1554853248,0.0000,346934241),(23628,1554853248,0.0000,346996084),(23268,1554853248,0.0000,347024394),(23269,1554853249,0.0000,347331441),(23270,1554853250,5.0991,347784490),(25371,1554853251,0.0000,348564273),(10073,1554853253,0.8326,349233640),(23273,1554853253,3.8050,349300153),(10074,1554853254,0.0000,350258338),(23274,1554853254,0.0000,350317846),(10075,1554853255,0.0000,351421789),(23275,1554853255,0.2205,351486291),(10076,1554853256,0.2997,351848377),(23276,1554853256,0.1881,351941801),(10077,1554853257,0.0000,352844627),(23277,1554853257,1.1323,352907811),(10078,1554853258,0.0000,353618551),(28498,1554853258,0.0000,354475042),(28500,1554853260,0.0000,355989921),(23295,1554853275,0.1700,364833504),(23296,1554853276,0.5600,365780911),(23297,1554853277,0.3100,366278551),(23299,1554853279,98.5583,368535929),(23300,1554853280,0.0000,369599617),(23301,1554853281,0.3352,370450960),(23302,1554853282,0.0000,370776098),(23303,1554853283,0.0335,371645038),(23664,1554853284,0.0000,372111832),(23304,1554853284,0.0000,372710952),(23305,1554853285,0.1509,373968540),(23306,1554853286,0.9388,374123296),(23310,1554853290,99.9686,377892828),(23252,1554853292,0.0000,379217474),(23253,1554853293,0.0339,380451170),(28653,1554853293,98.8285,382698476),(28654,1554853294,99.9367,387257278),(23255,1554853295,0.0000,383232217),(23256,1554853296,0.0169,386709763),(23257,1554853297,0.0931,387393126),(28657,1554853297,76.0939,389898386),(23258,1554853298,0.0000,390328593),(28658,1554853298,84.0418,390607432),(23259,1554853299,0.0169,391088324),(23620,1554853300,0.4339,391623612),(23260,1554853300,0.0000,391689297),(23264,1554853304,0.0068,394412751),(23265,1554853305,0.0000,395456044),(23625,1554853305,5.0124,395519564),(23266,1554853306,0.0000,395773788),(25667,1554853307,0.0000,396761849),(23628,1554853308,0.0000,397439413),(25668,1554853308,0.0000,397507596),(23268,1554853308,0.0000,397536580),(23269,1554853309,0.0034,398525891),(23270,1554853310,0.0000,398904020),(25371,1554853311,0.0000,399582205),(10073,1554853313,0.8326,401276386),(23273,1554853313,3.8050,401348353),(10074,1554853314,0.0000,401906862),(23274,1554853314,0.0000,401970096),(23275,1554853315,0.2205,402581619),(10075,1554853315,0.0000,402645549),(10076,1554853316,0.2997,403006903),(23276,1554853316,0.1881,403072885),(23277,1554853317,1.1324,403553621),(10077,1554853317,0.0000,403608918),(10078,1554853318,0.0000,403751824),(28498,1554853318,0.0000,404468442),(28500,1554853320,0.0000,406224864),(23295,1554853335,0.1800,415620659),(23296,1554853336,0.4500,416341168),(23297,1554853337,0.3200,416930832),(23299,1554853339,98.5082,418656295),(23300,1554853340,0.0000,419035958),(23301,1554853341,0.3519,419678185),(23302,1554853342,0.0000,421497566),(23303,1554853343,0.0168,422601288),(23664,1554853344,0.0000,422485820),(23304,1554853344,0.0000,423201621),(23305,1554853345,0.1843,424232629),(23306,1554853346,0.9551,425048954),(23310,1554853350,99.9686,430063225),(23252,1554853352,0.0000,430936239),(23253,1554853353,0.0169,432275473),(28653,1554853353,98.8285,434536848),(28654,1554853354,99.9367,435305782),(23255,1554853355,0.0000,443238714),(23256,1554853356,0.0339,444623206),(23257,1554853357,0.1311,445367259),(28657,1554853357,76.0939,483614032),(23258,1554853358,0.0000,445790778),(28658,1554853358,84.0418,447904668),(23259,1554853359,0.0169,448319991),(23260,1554853360,0.0000,449320009),(23620,1554853360,0.4170,449380328),(23264,1554853364,0.0271,457238892),(23265,1554853365,0.0000,457788810),(23625,1554853365,5.0281,457850468),(23266,1554853366,0.0000,458309474),(25667,1554853367,0.0000,458512922),(25668,1554853368,0.0000,459134092),(23628,1554853368,0.0000,459191236),(23268,1554853368,0.0000,459219843),(23269,1554853369,0.0000,460683650),(23270,1554853370,5.0948,461590428),(25371,1554853371,0.0338,462739129),(10073,1554853373,0.8324,464958078),(23273,1554853373,3.8050,465015632),(23274,1554853374,0.0007,465648502),(10074,1554853374,0.0000,465705577),(23275,1554853375,0.2205,466120288),(10075,1554853375,0.0000,466181653),(23276,1554853376,0.1881,467030165),(10076,1554853376,0.2997,467088989),(10077,1554853377,0.0000,467845125),(23277,1554853377,1.1321,467903656),(10078,1554853378,0.0166,468342086),(28498,1554853378,0.0000,469046324),(28500,1554853380,0.0000,474766172),(23295,1554853395,0.2000,487047733),(23296,1554853396,0.3400,488723918),(23297,1554853397,0.3400,489676311),(23299,1554853399,94.7245,495854269),(23300,1554853400,0.0000,497155552),(23301,1554853401,0.7201,497609703),(23302,1554853402,0.0000,498054423),(23303,1554853403,0.0335,498681819),(23664,1554853404,0.0000,499361535),(23304,1554853404,0.0000,499752568),(23305,1554853405,0.5527,506531404),(23306,1554853406,4.5059,508309498),(23310,1554853410,99.9686,513037656),(23252,1554853412,0.0000,522152343),(23253,1554853413,0.0169,530421417),(28653,1554853413,98.8285,538860041),(28654,1554853414,99.9367,534146775),(23255,1554853415,0.0000,532560071),(23256,1554853416,0.0338,533620156),(23257,1554853417,0.1606,536982399),(28657,1554853417,76.0939,539023642),(23258,1554853418,0.1354,537462741),(28658,1554853418,84.0418,540878522),(23259,1554853419,0.0000,537895360),(23620,1554853420,0.4202,541882464),(23260,1554853420,0.0000,541931921),(23264,1554853424,0.0169,545092884),(23625,1554853425,5.0426,546012958),(23265,1554853425,0.0000,546079973),(23266,1554853426,0.0000,547093516),(25667,1554853427,0.0169,551976097),(23628,1554853428,0.0000,555448131),(25668,1554853428,0.0000,555513093),(23268,1554853428,0.0000,555544067),(23269,1554853429,0.0034,562967222),(23270,1554853430,5.1126,568837443),(25371,1554853431,0.0338,573761072),(23273,1554853433,3.8050,575549029),(10073,1554853433,0.8318,575612757),(23274,1554853434,0.0000,578506624),(10074,1554853434,0.0000,578565524),(10075,1554853435,0.0000,583181972),(23275,1554853435,0.2205,583217860),(23276,1554853436,0.1881,583941701),(10076,1554853436,0.2994,584021639),(10077,1554853437,0.0000,584428477),(23277,1554853437,1.1311,584493101),(10078,1554853438,0.0166,585322810),(28498,1554853438,0.0000,585818642),(28500,1554853440,0.0000,586294897),(28621,1554853441,0.0100,290815907),(28624,1554853444,0.0000,293835538),(28627,1554853447,0.0335,297234160),(28630,1554853450,0.0000,299575854),(23295,1554853455,0.2500,598134595),(23296,1554853456,0.7600,599108450),(23297,1554853457,0.4700,599960515),(23299,1554853459,78.7173,601630319),(23300,1554853460,0.0000,602799933),(23301,1554853461,0.7371,603855944),(23302,1554853462,0.0000,605228967),(23303,1554853463,0.1507,606405595),(23664,1554853464,0.0000,606696742),(23304,1554853464,0.0000,607125273),(23305,1554853465,2.0436,608064396),(23306,1554853466,17.7722,608448470),(23310,1554853470,99.9686,613111935),(23252,1554853472,0.0000,614040447),(23253,1554853473,0.0339,615366943),(28653,1554853473,98.8285,617635864),(28654,1554853474,99.9367,621944545),(23255,1554853475,0.0000,617495127),(23256,1554853476,0.0338,622598025),(23257,1554853477,0.3220,623661450),(28657,1554853477,76.0919,625665350),(23258,1554853478,0.0000,624965787),(28658,1554853478,84.0418,627010172),(23259,1554853479,0.0000,625356973),(23260,1554853480,0.0000,626036866),(23620,1554853480,0.4215,626097782),(23264,1554853484,0.0102,630322605),(23265,1554853485,0.0000,631281112),(23625,1554853485,5.0428,631350146),(23266,1554853486,0.0000,632312877),(25667,1554853487,0.0000,632999206),(25668,1554853488,0.0000,633447322),(23628,1554853488,0.0166,633507880),(23268,1554853488,0.0000,633537304),(23269,1554853489,0.0000,634276206),(23270,1554853490,0.1353,634961515),(25371,1554853491,0.0000,635718534),(23273,1554853493,3.8035,636859780),(10073,1554853493,0.8991,636919135),(10074,1554853494,0.0000,637296488),(23274,1554853494,0.0000,637355073),(10075,1554853495,0.0000,638398679),(23275,1554853495,0.2205,638467733),(23276,1554853496,0.2148,639469137),(10076,1554853496,0.3663,639523043),(10077,1554853497,0.0000,640455076),(23277,1554853497,1.2655,640515661),(10078,1554853498,0.0000,641616326),(28498,1554853498,0.0000,642777677),(28619,1554853499,0.0000,644636262),(28620,1554853500,0.0500,645125269),(28500,1554853500,0.0000,645518355),(28621,1554853501,0.0200,646887692),(28623,1554853503,0.0000,647811537),(28624,1554853504,0.0000,648651372),(28625,1554853505,96.3100,649718509),(28626,1554853506,0.0000,650652806),(28627,1554853507,1.4425,652073337),(28628,1554853508,0.0000,653793899),(28629,1554853509,0.0503,654802099),(28630,1554853510,0.0000,655332165),(28631,1554853511,0.3856,666564745),(28632,1554853512,1.7776,670514617),(23295,1554853515,0.2300,671905041),(23296,1554853516,0.2800,672039345),(28636,1554853516,99.8713,673437861),(23297,1554853517,0.3800,673476141),(23299,1554853519,98.2562,675317826),(23300,1554853520,0.0000,677287140),(23301,1554853521,0.6033,677225298),(23302,1554853522,0.0000,678793923),(23303,1554853523,0.0335,679441700),(23664,1554853524,0.0000,679776981),(23304,1554853524,0.0000,680120321),(23305,1554853525,0.1843,680759911),(23306,1554853526,0.9553,681724981),(23310,1554853530,99.9686,684214017),(23252,1554853532,0.0000,686023289),(23253,1554853533,0.0169,686369238),(28653,1554853533,98.8285,688555810),(28654,1554853534,99.9367,693496588),(23255,1554853535,0.0000,690622085),(23256,1554853536,0.0508,691691361),(23257,1554853537,0.1311,692179984),(28657,1554853537,76.0919,694314043),(23258,1554853538,0.0000,695547567),(28658,1554853538,84.0418,698154938),(23259,1554853539,0.0169,696389850),(23260,1554853540,0.0000,696826319),(23620,1554853540,0.4282,696885291),(23264,1554853544,0.0406,699225030),(23265,1554853545,0.0000,700072791),(23625,1554853545,4.9610,700129851),(23266,1554853546,0.0000,700703255),(25667,1554853547,0.0000,701406042),(23628,1554853548,0.0666,701772274),(25668,1554853548,0.0000,701830363),(23268,1554853548,0.0000,701860845),(23269,1554853549,0.0000,702338038),(23270,1554853550,0.0000,702551919),(25371,1554853551,0.0000,704590773),(10073,1554853553,1.0654,706149300),(23273,1554853553,3.8035,706203881),(10074,1554853554,0.0000,706399170),(23274,1554853554,0.0000,706454322),(10075,1554853555,0.0000,707125409),(23275,1554853555,0.2205,707451378),(23276,1554853556,0.2424,707923475),(10076,1554853556,0.4162,707980023),(10077,1554853557,0.0000,708732155),(23277,1554853557,1.4983,708784274),(10078,1554853558,0.0000,709029040),(28498,1554853558,0.0000,710001073),(28619,1554853559,0.0000,712353084),(28500,1554853560,0.0000,711710844),(28620,1554853560,0.0200,713475079),(28621,1554853561,0.0200,713958303),(28623,1554853563,0.0000,715044940),(28624,1554853564,0.0000,716248266),(28625,1554853565,99.9665,717773576),(28626,1554853566,0.0000,717558988),(28627,1554853567,0.0000,718762785),(28628,1554853568,0.0000,720833544),(28629,1554853569,0.0167,721964161),(28630,1554853570,0.0000,723131507),(28631,1554853571,0.0335,735585058),(28632,1554853572,0.0000,728184984),(23295,1554853575,0.2200,733249727),(23296,1554853576,0.1000,735593297),(28636,1554853576,99.8713,737408078),(23297,1554853577,0.3100,736490512),(23299,1554853579,98.6095,738424375),(23300,1554853580,0.0000,740155496),(23301,1554853581,0.4021,740495097),(23302,1554853582,0.0000,740922878),(23303,1554853583,0.0335,742083360),(23304,1554853584,0.0000,742625727),(23664,1554853584,0.0000,742701229),(23305,1554853585,0.2011,743723020),(23306,1554853586,0.7708,744576997),(23310,1554853590,99.9686,748003681),(23252,1554853592,0.0000,748409548),(23253,1554853593,0.0169,749412773),(28653,1554853593,98.8285,751612969),(28654,1554853594,99.9367,753133373),(23255,1554853595,0.0000,753285971),(23256,1554853596,0.0677,754680781),(23257,1554853597,0.0889,755442001),(28657,1554853597,76.0919,757674481),(23258,1554853598,0.0000,758664476),(28658,1554853598,84.0418,761192179),(23259,1554853599,0.0000,759401713),(23260,1554853600,0.0000,760470473),(23620,1554853600,0.4313,760525362),(23264,1554853604,0.0372,764556604),(23625,1554853605,4.8614,765575524),(23265,1554853605,0.0000,765634120),(23266,1554853606,0.0000,766219953),(25667,1554853607,0.0000,767063105),(25668,1554853608,0.0000,767243545),(23628,1554853608,0.0166,767299734),(23268,1554853608,0.0000,767330518),(23269,1554853609,0.0000,767729255),(23270,1554853610,0.0000,768417858),(25371,1554853611,0.0000,768548486),(10073,1554853613,1.0655,769242816),(23273,1554853613,3.8035,769302557),(10074,1554853614,0.0000,769737562),(23274,1554853614,0.0000,769793973),(10075,1554853615,0.0000,769935840),(23275,1554853615,0.2205,769994578),(10076,1554853616,0.4495,770609099),(23276,1554853616,0.2466,770668453),(10077,1554853617,0.0000,771874670),(23277,1554853617,1.5151,771937305),(10078,1554853618,0.0000,772091920),(28498,1554853618,0.0000,772892483),(28619,1554853619,0.0000,775462178),(28500,1554853620,0.0000,775851364),(28620,1554853620,0.0000,776391441),(28621,1554853621,0.0100,778636953),(28623,1554853623,0.0000,779553972),(28624,1554853624,0.0000,780433282),(28625,1554853625,99.8493,781697657),(28626,1554853626,0.0000,782007592),(28627,1554853627,0.0167,782782226),(28628,1554853628,0.0000,784553643),(28629,1554853629,0.0167,786000957),(28630,1554853630,0.0000,786192198),(28631,1554853631,0.0168,797775542),(28632,1554853632,0.0670,788553912),(23295,1554853635,0.2100,798238271),(23296,1554853636,0.0400,799737315),(28636,1554853636,99.8713,801398522),(23297,1554853637,0.2600,800959517),(23299,1554853639,98.2245,802296844),(23300,1554853640,0.0000,804023257),(23301,1554853641,0.5696,803500729),(23302,1554853642,0.0000,805680311),(23303,1554853643,0.0503,807015823),(23664,1554853644,0.0000,806707332),(23304,1554853644,0.0000,807003194),(23305,1554853645,0.2345,808051747),(23306,1554853646,0.9045,808453603),(23310,1554853650,99.9686,811487128),(23252,1554853652,0.0000,812889593),(23253,1554853653,0.0339,813507063),(28653,1554853653,98.8285,815543974),(28654,1554853654,99.9367,816736348),(23255,1554853655,0.0000,817463238),(23256,1554853656,0.0339,818896238),(23257,1554853657,0.1444,819149751),(28657,1554853657,76.0919,821285122),(23258,1554853658,0.0000,822036479),(28658,1554853658,84.0418,824939660),(23259,1554853659,0.0169,823030274),(23620,1554853660,0.4338,823487344),(23260,1554853660,0.0000,823548030),(23264,1554853664,0.0440,827149196),(23625,1554853665,4.9449,827376640),(23265,1554853665,0.0000,827445340),(23266,1554853666,0.0000,828059943),(25667,1554853667,0.0169,829258634),(23628,1554853668,0.0000,829615232),(23268,1554853668,0.0000,829682560),(25668,1554853668,0.0000,829717146),(23269,1554853669,0.0034,830044789),(23270,1554853670,0.0000,831199435),(25371,1554853671,0.0000,831771344),(10073,1554853673,1.0655,833271794),(23273,1554853673,3.8035,833335315),(10074,1554853674,0.0000,833588332),(23274,1554853674,0.0000,833648531),(23275,1554853675,0.2205,834818125),(10075,1554853675,0.0000,834874552),(23276,1554853676,0.2466,835992947),(10076,1554853676,0.4662,836047729),(10077,1554853677,0.0000,836385930),(23277,1554853677,1.5317,836445518),(10078,1554853678,0.0499,837840812),(28498,1554853678,0.0000,838525059),(28619,1554853679,0.0000,841444697),(28500,1554853680,0.0000,840949567),(28620,1554853680,0.0000,842835450),(28621,1554853681,0.0100,843738735),(28623,1554853683,0.0000,844904884),(28624,1554853684,0.0000,845435244),(28625,1554853685,99.9497,846415794),(28626,1554853686,0.0000,846557971),(28627,1554853687,0.0000,848375846),(28628,1554853688,0.0000,849895800),(28629,1554853689,0.0168,850028319),(28630,1554853690,0.0000,851155745),(28631,1554853691,0.0168,862996207),(28632,1554853692,0.0168,855960241),(23295,1554853695,0.2000,858642584),(28636,1554853696,99.8713,861662834),(23296,1554853696,0.0100,861965858),(23297,1554853697,0.2100,862726129),(23299,1554853699,96.2131,864777826),(23300,1554853700,0.0000,865796908),(23301,1554853701,0.7039,867121677),(23302,1554853702,0.0000,869896569),(23303,1554853703,0.0503,870300503),(23304,1554853704,0.0000,871014088),(23664,1554853704,0.0000,871087277),(23305,1554853705,0.3185,871807795),(23306,1554853706,2.6819,872412139),(23310,1554853710,99.9686,874962997),(23252,1554853712,0.0000,877006980),(23253,1554853713,0.0339,877441788),(28653,1554853713,98.8285,880060312),(28654,1554853714,99.9367,884934880),(23255,1554853715,0.0000,879888032),(23256,1554853716,0.0508,881325322),(23257,1554853717,0.1438,882320592),(28657,1554853717,76.0919,884514380),(23258,1554853718,0.0000,885143413),(28658,1554853718,84.0418,887932691),(23259,1554853719,0.0339,885799394),(23620,1554853720,0.4351,886608005),(23260,1554853720,0.0000,886666837),(23264,1554853724,0.0406,890869247),(23265,1554853725,0.0000,891842966),(23625,1554853725,5.0612,891902584),(23266,1554853726,0.0000,892036941),(25667,1554853727,0.0000,892662179),(23268,1554853728,0.0000,893715485),(25668,1554853728,0.0000,893776185),(23628,1554853728,0.0000,893804457),(23269,1554853729,0.0000,894375894),(23270,1554853730,0.0000,895401370),(25371,1554853731,0.0000,896230935),(23273,1554853733,3.8035,898133487),(10073,1554853733,1.0655,898197778),(10074,1554853734,0.0000,898656133),(23274,1554853734,0.0000,898714129),(10075,1554853735,0.0000,899551668),(23275,1554853735,0.2205,899610806),(23276,1554853736,0.2466,900560291),(10076,1554853736,0.4828,900615930),(23277,1554853737,1.5483,901168756),(10077,1554853737,0.0000,901224559),(10078,1554853738,0.0166,902026114),(28498,1554853738,0.0000,903141643),(28619,1554853739,0.0000,904822331),(28500,1554853740,0.0000,904513243),(28620,1554853740,0.0000,906439292),(28621,1554853741,0.0000,907614276),(28623,1554853743,0.0000,909913112),(28624,1554853744,0.0000,910803200),(28625,1554853745,99.8995,911587104),(28626,1554853746,0.0000,912376755),(28627,1554853747,0.0000,913924916),(28628,1554853748,0.0000,914266707),(28629,1554853749,0.0335,915819950),(28630,1554853750,0.0000,916241022),(28631,1554853751,0.0335,928167463),(28632,1554853752,0.0502,920580770),(23295,1554853755,0.1800,923258380),(23296,1554853756,0.0100,924880520),(28636,1554853756,99.8713,926517554),(23297,1554853757,0.1700,926706714),(23299,1554853759,98.5755,929388879),(23300,1554853760,0.0000,931202881),(23301,1554853761,0.3016,932593340),(23302,1554853762,0.0000,933188857),(23303,1554853763,0.0503,934723592),(23664,1554853764,0.0000,934830277),(23304,1554853764,0.0000,935166439),(23305,1554853765,0.1676,936336148),(23306,1554853766,0.9214,936721143),(23310,1554853770,99.9686,940412106),(23252,1554853772,0.0000,942033421),(23253,1554853773,0.0169,943395616),(28653,1554853773,98.8285,945537174),(28654,1554853774,99.9367,946809138),(23255,1554853775,0.0000,945784516),(23256,1554853776,0.0677,946756353),(23257,1554853777,0.0677,949486276),(28657,1554853777,76.0919,951675498),(23258,1554853778,0.0000,950414710),(28658,1554853778,84.0418,952420774),(23259,1554853779,0.0339,950634339),(23260,1554853780,0.0000,951308662),(23620,1554853780,0.4378,951366737),(23264,1554853784,0.0406,956469528),(23265,1554853785,0.0000,956898541),(23625,1554853785,5.0612,956954801),(23266,1554853786,0.0000,957865627),(25667,1554853787,0.0169,958442807),(23628,1554853788,0.0000,958877017),(25668,1554853788,0.0000,958936585),(23268,1554853788,0.0000,958965565),(23269,1554853789,0.0000,959796410),(23270,1554853790,0.0000,960570383),(25371,1554853791,0.0000,960871872),(23273,1554853793,3.8035,962170727),(10073,1554853793,1.0655,962228355),(10074,1554853794,0.0000,962922947),(23274,1554853794,0.0000,962990085),(10075,1554853795,0.0000,964044708),(23275,1554853795,0.2205,964311695),(23276,1554853796,0.2466,965139628),(10076,1554853796,0.4495,965194060),(10077,1554853797,0.0000,965446934),(23277,1554853797,1.5150,965501856),(10078,1554853798,0.0000,968000245),(28498,1554853798,0.0000,968759159),(28619,1554853799,0.0000,971552047),(28500,1554853800,0.0000,972768950),(28620,1554853800,0.0000,973514103),(28621,1554853801,0.0000,974412803),(28623,1554853803,0.0000,975877080),(28624,1554853804,0.0000,997738776),(28625,1554853805,99.7321,978918048),(28626,1554853806,0.0000,980078157),(28627,1554853807,0.2009,982069502),(28628,1554853808,0.0000,982699044),(28629,1554853809,0.0000,984518244),(28630,1554853810,0.0000,985404357),(28631,1554853811,0.0335,998261020),(28632,1554853812,0.0335,4174412),(23295,1554853815,0.1800,2188954),(23296,1554853816,0.0700,2150065),(28636,1554853816,99.8713,2845069),(23297,1554853817,0.1700,3401755),(23299,1554853819,98.5090,5857608),(23300,1554853820,0.0000,6867234),(23301,1554853821,0.3518,7542427),(23302,1554853822,0.0000,9514348),(23303,1554853823,0.0335,10141395),(23664,1554853824,0.0000,10546618),(23304,1554853824,0.0000,11750882),(23305,1554853825,0.2010,13633921),(23306,1554853826,0.9379,14858866),(23310,1554853830,99.9686,18988492),(23252,1554853832,0.0000,20584413),(23253,1554853833,0.0339,21590712),(28653,1554853833,98.8285,23739251),(28654,1554853834,99.9367,29150996),(23255,1554853835,0.0000,30829266),(23256,1554853836,0.0169,31503052),(23257,1554853837,0.0889,32155450),(28657,1554853837,76.0919,34395255),(23258,1554853838,0.0000,35043889),(28658,1554853838,84.0418,37250202),(23259,1554853839,0.0339,35915462),(23620,1554853840,0.4425,36583914),(23260,1554853840,0.0000,36644681),(23264,1554853844,0.0237,39599898),(23265,1554853845,0.0000,45638638),(23625,1554853845,5.3987,45683301),(23266,1554853846,0.0000,46075085),(25667,1554853847,0.0000,46771084),(25668,1554853848,0.0000,46981569),(23628,1554853848,0.0000,47037043),(23268,1554853848,0.0000,47068045),(23269,1554853849,0.0000,47742060),(23270,1554853850,0.0000,48086898),(25371,1554853851,0.0000,49092593),(10073,1554853853,1.0831,50437030),(23273,1554853853,3.8035,50490496),(23274,1554853854,0.0000,51340369),(10074,1554853854,0.0000,51396828),(10075,1554853855,0.0000,54259207),(23275,1554853855,0.2205,54538786),(10076,1554853856,0.4569,55150538),(23276,1554853856,0.2466,55209021),(10077,1554853857,0.0000,56210699),(23277,1554853857,1.5400,56264476),(10078,1554853858,0.0000,57737391),(28498,1554853858,0.0000,58292551),(28619,1554853859,0.0000,60665921),(28620,1554853860,0.0000,61108882),(28500,1554853860,0.0000,61511266),(28621,1554853861,0.0000,63414419),(28623,1554853863,0.0000,64704090),(28624,1554853864,0.0000,65416346),(28625,1554853865,99.8660,70262008),(28626,1554853866,0.0000,71823725),(28627,1554853867,0.0167,72535957),(28628,1554853868,0.0000,72725140),(28629,1554853869,0.0000,74228376),(28630,1554853870,0.0000,75645753),(28631,1554853871,0.0335,86008148),(28632,1554853872,0.0670,78774143),(23295,1554853875,0.1700,82275611),(23296,1554853876,0.0200,83718245),(28636,1554853876,99.8713,85295450),(23297,1554853877,0.1400,85458557),(23299,1554853879,97.9889,88067773),(23300,1554853880,0.0000,89672993),(23301,1554853881,0.3854,89675103),(23302,1554853882,0.0000,91509090),(23303,1554853883,0.0503,92262439),(23664,1554853884,0.0000,92869327),(23304,1554853884,0.0000,93517825),(23305,1554853885,0.3351,93877135),(23306,1554853886,2.1451,95365919),(23310,1554853890,99.9686,98947798),(23252,1554853892,0.0000,100230849),(23253,1554853893,0.0339,101059763),(28653,1554853893,98.8285,104454264),(28654,1554853894,99.9367,105869751),(23255,1554853895,0.0000,103519110),(23256,1554853896,0.0000,106709950),(23257,1554853897,0.0761,107096486),(28657,1554853897,76.0919,109300309),(23258,1554853898,0.0000,108137781),(28658,1554853898,84.0418,110190730),(23259,1554853899,0.0169,108792081),(23620,1554853900,0.4441,109981929),(23260,1554853900,0.0000,110050740),(23264,1554853904,0.0372,114197768),(23265,1554853905,0.0000,114810735),(23625,1554853905,5.5935,114866374),(23266,1554853906,0.0000,115733643),(25667,1554853907,0.0169,116837456),(23628,1554853908,0.0000,117921995),(25668,1554853908,0.0000,117991761),(23268,1554853908,0.0000,118022927),(23269,1554853909,0.0000,118988450),(23270,1554853910,0.0000,120051321),(25371,1554853911,0.0000,120905800),(23273,1554853913,3.8035,122620442),(10073,1554853913,1.0654,122683621),(10074,1554853914,0.0000,123672079),(23274,1554853914,0.0000,123733017),(23275,1554853915,0.2205,124761834),(10075,1554853915,0.0000,125068190),(23276,1554853916,0.2466,125293855),(10076,1554853916,0.4495,125351510),(23277,1554853917,1.5149,126070788),(10077,1554853917,0.0000,126136996),(10078,1554853918,0.0000,127358361),(28498,1554853918,0.0000,127795850),(28619,1554853919,0.0000,129720779),(28500,1554853920,0.0000,130092349),(28620,1554853920,0.0000,130734310),(28621,1554853921,0.0000,132605450),(28623,1554853923,0.0000,134744920),(28624,1554853924,0.0000,135706934),(28625,1554853925,100.0000,136644442),(28626,1554853926,0.0000,137469149),(28627,1554853927,0.0000,138013538),(28628,1554853928,0.0000,139166544),(28629,1554853929,0.0000,140185008),(28630,1554853930,0.0000,140721424),(28631,1554853931,0.0168,152404461),(28632,1554853932,0.0000,146601582),(23295,1554853935,0.1600,146962429),(23296,1554853936,0.0100,151592302),(28636,1554853936,99.8713,162850051),(23297,1554853937,0.1100,158827937),(23299,1554853939,93.9668,160363970),(23300,1554853940,0.0000,161485866),(23301,1554853941,0.5531,162646399),(23302,1554853942,0.0000,163687913),(23303,1554853943,0.0670,166880074),(23664,1554853944,0.0000,167625571),(23304,1554853944,0.0000,168264893),(23305,1554853945,0.5196,176294168),(23306,1554853946,4.3580,177400438),(23310,1554853950,99.9686,180815913),(23252,1554853952,0.0000,182388417),(23253,1554853953,0.0339,183155744),(28653,1554853953,98.8285,185216096),(28654,1554853954,99.9367,190688748),(23255,1554853955,0.0000,187625628),(23256,1554853956,0.0339,190592859),(23257,1554853957,0.1825,191878591),(28657,1554853957,76.0919,194165239),(23258,1554853958,0.0000,194343169),(28658,1554853958,84.0418,194755205),(23259,1554853959,0.0169,194904170),(23260,1554853960,0.0000,195471573),(23620,1554853960,0.4400,195533418),(23264,1554853964,0.0344,198446541),(23265,1554853965,0.0000,199328431),(23625,1554853965,5.5921,199384007),(23266,1554853966,0.0000,199755404),(25667,1554853967,0.0000,200590022),(25668,1554853968,0.0000,201149066),(23268,1554853968,0.0000,201216692),(23628,1554853968,0.0000,201246006),(23269,1554853969,0.0000,201500801),(23270,1554853970,0.0000,202373650),(25371,1554853971,0.0169,202779001),(10073,1554853973,1.0652,203576881),(23273,1554853973,3.8035,203643305),(23274,1554853974,0.0000,203773238),(10074,1554853974,0.0000,203831044),(10075,1554853975,0.0000,204355700),(23275,1554853975,0.2205,204652991),(10076,1554853976,0.4494,205594219),(23276,1554853976,0.2466,205655621),(23277,1554853977,1.5146,206694506),(10077,1554853977,0.0000,206750255),(10078,1554853978,0.0166,207715731),(28498,1554853978,0.0000,208622679),(28619,1554853979,0.0000,210196328),(28500,1554853980,0.0000,209630026),(28620,1554853980,0.0000,211557899),(28621,1554853981,0.0000,212180580),(28623,1554853983,0.0000,213683542),(28624,1554853984,0.0000,214501269),(28625,1554853985,99.8660,215074243),(28626,1554853986,0.0000,215902452),(28627,1554853987,0.0000,217319811),(28628,1554853988,0.0000,218743417),(28629,1554853989,0.0168,220035647),(28630,1554853990,0.0000,221378311),(28631,1554853991,0.0503,232462818),(28632,1554853992,0.0503,225601174),(23295,1554853995,0.1500,229969086),(28636,1554853996,99.8713,233621966),(23296,1554853996,0.0000,234433637),(23297,1554853997,0.0900,235356626),(23299,1554853999,96.1616,237213092),(23300,1554854000,0.0000,238535500),(23301,1554854001,1.0390,239200498),(23302,1554854002,0.0000,239786720),(23303,1554854003,0.0503,241324788),(23304,1554854004,0.0000,241712358),(23664,1554854004,0.0000,241786353),(23305,1554854005,0.3855,242382339),(23306,1554854006,2.0278,243411053),(23310,1554854010,99.9686,246695850),(23252,1554854012,0.0000,247985980),(23253,1554854013,0.0169,248958158),(28653,1554854013,98.8285,251188381),(28654,1554854014,99.9367,254698185),(23255,1554854015,0.0000,253111571),(23256,1554854016,0.0847,254059752),(23257,1554854017,0.1311,255734897),(28657,1554854017,76.0919,257947705),(23258,1554854018,0.0000,260581324),(28658,1554854018,84.0418,266679530),(23259,1554854019,0.0000,260903011),(23620,1554854020,0.4441,261406080),(23260,1554854020,0.0000,261472073),(23264,1554854024,0.0406,275051988),(23625,1554854025,5.5929,275765388),(23265,1554854025,0.0000,275825524),(23266,1554854026,0.0000,276414926),(25667,1554854027,0.0169,277226893),(23268,1554854028,0.0000,277643716),(23628,1554854028,0.0000,277701659),(25668,1554854028,0.0000,277734031),(23269,1554854029,0.0000,278034227),(23270,1554854030,0.0000,278971542),(25371,1554854031,0.0000,279282355),(23273,1554854033,3.8035,280862920),(10073,1554854033,1.0653,280924736),(23274,1554854034,0.0000,281334302),(10074,1554854034,0.0000,281392196),(23275,1554854035,0.2205,282503844),(10075,1554854035,0.0000,282543878),(10076,1554854036,0.4494,283254690),(23276,1554854036,0.2466,283317528),(23277,1554854037,1.5147,283863680),(10077,1554854037,0.0000,283932318),(28498,1554854038,0.0000,285455196),(10078,1554854038,0.0166,285647319),(28619,1554854039,0.0000,287929896),(28620,1554854040,0.0000,288968951),(28500,1554854040,0.0000,289466814),(28621,1554854041,0.0000,290898841),(28623,1554854043,0.0000,293196842),(28624,1554854044,0.0000,294613186),(28625,1554854045,99.9330,295051477),(28626,1554854046,0.0000,295943288),(28627,1554854047,0.0000,296618216),(28628,1554854048,0.0000,297504388),(28629,1554854049,0.0000,298692914),(28630,1554854050,0.0000,299568170),(28631,1554854051,0.0335,311192908),(28632,1554854052,0.0335,301501219),(23295,1554854055,0.1500,310326904),(23296,1554854056,0.1700,311969202),(28636,1554854056,99.8713,313613724),(23297,1554854057,0.1200,314475249),(23299,1554854059,92.2381,316270065),(23300,1554854060,0.0000,317542164),(23301,1554854061,0.7210,318575669),(23302,1554854062,0.0000,320434506),(23303,1554854063,0.0671,321439975),(23664,1554854064,0.0000,321583598),(23304,1554854064,0.0000,322251425),(23305,1554854065,0.7376,322680311),(23306,1554854066,6.1861,324153417),(23310,1554854070,99.9686,328404819),(23252,1554854072,0.0000,329594582),(23253,1554854073,0.0339,331059904),(28653,1554854073,98.8285,333133294),(28654,1554854074,99.9367,337035436),(23255,1554854075,0.0000,332560739),(23256,1554854076,0.0508,334364557),(23257,1554854077,0.0973,337398112),(28657,1554854077,76.0919,339520462),(23258,1554854078,0.0000,339680698),(28658,1554854078,84.0418,340055951),(23259,1554854079,0.0000,340282097),(23260,1554854080,0.0000,340619292),(23620,1554854080,0.4557,340682607),(23264,1554854084,0.0305,343039741),(23625,1554854085,5.5937,343614486),(23265,1554854085,0.0000,343682738),(23266,1554854086,0.0000,344185227),(25667,1554854087,0.0169,345116454),(23268,1554854088,0.0000,346127284),(25668,1554854088,0.0000,346194146),(23628,1554854088,0.0000,346223557),(23269,1554854089,0.0000,346799826),(23270,1554854090,0.0000,347698287),(25371,1554854091,0.0000,348233624),(10073,1554854093,1.0654,350024436),(23273,1554854093,3.8035,350091395),(23274,1554854094,0.0000,350520735),(10074,1554854094,0.0000,350582824),(10075,1554854095,0.0000,351389131),(23275,1554854095,0.2205,351452979),(23276,1554854096,0.2466,352425398),(10076,1554854096,0.4495,352491952),(23277,1554854097,1.5148,357433152),(10077,1554854097,0.0000,357480436),(10078,1554854098,0.0000,357687399),(28498,1554854098,0.0000,358877274),(28619,1554854099,0.0000,360259607),(28500,1554854100,0.0000,360617267),(28620,1554854100,0.0000,361328413),(28621,1554854101,0.0000,363535867),(28623,1554854103,0.0000,365569870),(28624,1554854104,0.0000,366226338),(28625,1554854105,99.9162,367632698),(28626,1554854106,0.0000,367852324),(28627,1554854107,0.0000,369353091),(28628,1554854108,0.0000,370354693),(28629,1554854109,0.0000,370944623),(28630,1554854110,0.0000,371590647),(28631,1554854111,0.0335,382387797),(28632,1554854112,0.0502,374446958),(23295,1554854115,0.1400,384164286),(23296,1554854116,0.0600,385669862),(28636,1554854116,99.8713,386868667),(23297,1554854117,0.1000,386608059),(23299,1554854119,97.3865,388209024),(23300,1554854120,0.0000,389714074),(23301,1554854121,0.5863,389846495),(23302,1554854122,0.0000,392072904),(23303,1554854123,0.0670,392098276),(23664,1554854124,0.0000,392681518),(23304,1554854124,0.0000,393544531),(23305,1554854125,0.3184,394462322),(23306,1554854126,2.6973,395567727),(23310,1554854130,99.9686,398169991),(23252,1554854132,0.0000,399877476),(23253,1554854133,0.0339,400104888),(28653,1554854133,98.8285,402483606),(28654,1554854134,99.9367,406280896),(23255,1554854135,0.0000,402687815),(23256,1554854136,0.0344,402924617),(23257,1554854137,0.1655,406041597),(28657,1554854137,76.0919,408259879),(23258,1554854138,0.0000,407627906),(28658,1554854138,84.0418,409640547),(23259,1554854139,0.0000,408434204),(23620,1554854140,0.4704,409018158),(23260,1554854140,0.0000,409089483),(23264,1554854144,0.0406,413696838),(23265,1554854145,0.0000,418631291),(23625,1554854145,5.5431,418688428),(23266,1554854146,0.0000,418876690),(25667,1554854147,0.0000,419636072),(23268,1554854148,0.0000,420742463),(25668,1554854148,0.0000,420806326),(23628,1554854148,0.0000,420835254),(23269,1554854149,0.0000,421048733),(23270,1554854150,0.0000,422288812),(25371,1554854151,0.0000,422685769),(10073,1554854153,1.0654,423804207),(23273,1554854153,3.8035,423867527),(23274,1554854154,0.0000,424653914),(10074,1554854154,0.0000,424712540),(23275,1554854155,0.2205,425267555),(10075,1554854155,0.0000,425328386),(10076,1554854156,0.4494,425947180),(23276,1554854156,0.2466,426236142),(10077,1554854157,0.0000,426537376),(23277,1554854157,1.5149,426598331),(10078,1554854158,0.0000,427384043),(28498,1554854158,0.0000,428296553),(28619,1554854159,0.0000,429790173),(28620,1554854160,0.0000,430896402),(28500,1554854160,0.0000,431217492),(28621,1554854161,0.0000,432807901),(28623,1554854163,0.0000,434152275),(28624,1554854164,0.0000,435765174),(28625,1554854165,99.9330,436876415),(28626,1554854166,0.0000,437681829),(28627,1554854167,0.0000,438748040),(28628,1554854168,0.0000,439942167),(28629,1554854169,0.0168,441199570),(28630,1554854170,0.0000,442092986),(28631,1554854171,0.0335,452516509),(28632,1554854172,0.0167,457024889),(23295,1554854175,0.1300,458732311),(23296,1554854176,0.0200,459433139),(28636,1554854176,99.8713,460055563),(23297,1554854177,0.0800,460887086),(23299,1554854179,93.5333,463004072),(23300,1554854180,0.0000,464473255),(23301,1554854181,1.1057,464698396),(23302,1554854182,0.0000,465267776),(23303,1554854183,0.0503,466694757),(23664,1554854184,0.0000,467086598),(23304,1554854184,0.0000,467584276),(23305,1554854185,0.5696,468033326),(23306,1554854186,3.7198,468614725),(23310,1554854190,99.9686,471804713),(23252,1554854192,0.0000,474018227),(23253,1554854193,0.0339,474556533),(28653,1554854193,98.8285,476806698),(28654,1554854194,99.9367,480418052),(23255,1554854195,0.0000,476263348),(23256,1554854196,0.0169,478717775),(23257,1554854197,0.1995,479715769),(28657,1554854197,76.0919,481897513),(23258,1554854198,0.0000,481045546),(28658,1554854198,84.0418,483054400),(23259,1554854199,0.0339,481554253),(23620,1554854200,0.4690,482768187),(23260,1554854200,0.0000,482832192),(23264,1554854204,0.0305,487368055),(23625,1554854205,5.4604,487533641),(23265,1554854205,0.0000,487593624),(23266,1554854206,0.0000,488217777),(25667,1554854207,0.0000,488933875),(25668,1554854208,0.0000,489527005),(23628,1554854208,0.0000,489847060),(23268,1554854208,0.0000,489886106),(23269,1554854209,0.0000,491144495),(23270,1554854210,0.0000,492067050),(25371,1554854211,0.0000,493082459),(10073,1554854213,1.0654,494885674),(23273,1554854213,3.8075,494946275),(10074,1554854214,0.0333,495879428),(23274,1554854214,0.0000,496163441),(10075,1554854215,0.0000,496894383),(23275,1554854215,0.2205,496959426),(23276,1554854216,0.2508,498299072),(10076,1554854216,0.4828,498361794),(23277,1554854217,1.5814,498808747),(10077,1554854217,0.0000,498867153),(28498,1554854218,0.0000,502404462),(10078,1554854218,0.0000,502620974),(28619,1554854219,0.0000,505460503),(28500,1554854220,0.0000,504386822),(28620,1554854220,0.0000,506018517),(28621,1554854221,0.0000,507030654),(28623,1554854223,0.0000,508962424),(28624,1554854224,0.0000,509461790),(28625,1554854225,99.8660,511633877),(28626,1554854226,0.0000,512549810),(28627,1554854227,0.0000,513730026),(28628,1554854228,0.0000,515629412),(28629,1554854229,0.0502,516448566),(28630,1554854230,0.0000,517597241),(28631,1554854231,0.0335,528632082),(28632,1554854232,0.0502,532100204),(23295,1554854235,0.1300,534539142),(23296,1554854236,0.0100,536127192),(28636,1554854236,99.8713,536768762),(23297,1554854237,0.0700,538205046),(23299,1554854239,98.2400,540380699),(23300,1554854240,0.0000,541955305),(23301,1554854241,0.5028,543129792),(23302,1554854242,0.0000,543344046),(23303,1554854243,0.0503,545241248),(23664,1554854244,0.0000,545423228),(23304,1554854244,0.0000,546080886),(23305,1554854245,0.2346,547510846),(23306,1554854246,0.9888,548412137),(23310,1554854250,99.9686,551964184),(23252,1554854252,0.0000,553139944),(23253,1554854253,0.0169,553903654),(28653,1554854253,98.8285,556124596),(28654,1554854254,99.9367,556794181),(23255,1554854255,0.0000,555560351),(23256,1554854256,0.0339,558379260),(23257,1554854257,0.0973,560449705),(28657,1554854257,76.0919,562551786),(23258,1554854258,0.0000,563699989),(28658,1554854258,84.0418,565620726),(23259,1554854259,0.0000,564882499),(23260,1554854260,0.0000,565461230),(23620,1554854260,0.4859,567531829),(23264,1554854264,0.0643,570872527),(23625,1554854265,5.4590,572213822),(23265,1554854265,0.0000,572278193),(23266,1554854266,0.0000,573492268),(25667,1554854267,0.0508,574669348),(23628,1554854268,0.1331,575950020),(23268,1554854268,0.0000,576009991),(25668,1554854268,0.0000,576042352),(23269,1554854269,0.0000,576826218),(23270,1554854270,0.0000,577499103),(25371,1554854271,0.0000,578407970),(10073,1554854273,1.0651,581101197),(23273,1554854273,3.9638,581163306),(28673,1554854273,74.2078,584103996),(10074,1554854274,0.0333,582590886),(23274,1554854274,0.0000,582647752),(23275,1554854275,0.2205,583409272),(10075,1554854275,0.0000,583869183),(28675,1554854275,34.1074,591218323),(23276,1554854276,0.2718,586378074),(10076,1554854276,0.5991,586435397),(10077,1554854277,0.0000,589030148),(23277,1554854277,1.7474,589088836),(28498,1554854278,0.0000,589771893),(10078,1554854278,0.0499,589838472),(28619,1554854279,0.0000,592671128),(28500,1554854280,0.0000,592958219),(28620,1554854280,0.0000,594064084),(28621,1554854281,0.0000,595633675),(28623,1554854283,0.0000,597436341),(28624,1554854284,0.0000,598763835),(28625,1554854285,99.8661,599996942),(28626,1554854286,0.0000,600538428),(28627,1554854287,0.0167,601799318),(28628,1554854288,0.0000,603770704),(28629,1554854289,0.0335,603678036),(28630,1554854290,0.0000,604848990),(28631,1554854291,0.0502,616568990),(28632,1554854292,0.0335,620453082),(23295,1554854295,0.1400,626623712),(23296,1554854296,0.2800,627951538),(28636,1554854296,99.8713,628552157),(23297,1554854297,0.1200,628326524),(23299,1554854299,96.7818,630621639),(23300,1554854300,0.0000,631531894),(23301,1554854301,0.6369,631642499),(23302,1554854302,0.0000,633817573),(23303,1554854303,0.0503,634569280),(23664,1554854304,0.0000,638033923),(23304,1554854304,0.0000,638813140),(23305,1554854305,0.3688,639373582),(23306,1554854306,2.8160,640185427),(23310,1554854310,99.9686,643143633),(23252,1554854312,0.0000,644598003),(23253,1554854313,0.0339,645530559),(28653,1554854313,98.8285,647787643),(28654,1554854314,99.9367,647983133),(23255,1554854315,0.0000,648003578),(23256,1554854316,0.0677,651382131),(23257,1554854317,0.1542,652413663),(28657,1554854317,76.0919,654523557),(23258,1554854318,0.0000,653530990),(28658,1554854318,84.0418,655628349),(23259,1554854319,0.0000,654200445),(23620,1554854320,0.4861,654790993),(23260,1554854320,0.0000,654848580),(23264,1554854324,0.0542,659795072),(23265,1554854325,0.0000,660873093),(23625,1554854325,5.5251,661210256),(23266,1554854326,0.0000,661960699),(25667,1554854327,0.0000,662885035),(25668,1554854328,0.0000,664138073),(23268,1554854328,0.0000,664199505),(23628,1554854328,0.0333,664536869),(23269,1554854329,0.0000,665907657),(23270,1554854330,0.0000,666571385),(25371,1554854331,0.0000,668056923),(10073,1554854333,1.0984,670344473),(23273,1554854333,3.9638,670407334),(28673,1554854333,74.2078,673477481),(10074,1554854334,0.0000,671402555),(23274,1554854334,0.0000,671461590),(10075,1554854335,0.0000,672079969),(23275,1554854335,0.2205,672141375),(28675,1554854335,34.1074,679744018),(10076,1554854336,0.6990,673041940),(23276,1554854336,0.3119,673108582),(23277,1554854337,1.7808,675995762),(10077,1554854337,0.0000,676299184),(10078,1554854338,0.0166,677405104),(28498,1554854338,0.0000,678480521),(28619,1554854339,0.0000,680836630),(28500,1554854340,0.0000,680902952),(28620,1554854340,0.0000,681999920),(28621,1554854341,0.0000,683158688),(28623,1554854343,0.0000,685420442),(28624,1554854344,0.0000,685869425),(28625,1554854345,99.8492,686689334),(28626,1554854346,0.0000,687466728),(28627,1554854347,0.0000,688117563),(28628,1554854348,0.0000,690184681),(28629,1554854349,0.0168,690630810),(28630,1554854350,0.0000,691774103),(28631,1554854351,0.0503,702420840),(28632,1554854352,0.0670,696072560),(23295,1554854355,0.1300,701733764),(23296,1554854356,0.1000,703274663),(28636,1554854356,99.8713,704379556),(23297,1554854357,0.1000,704371371),(23299,1554854359,96.3801,706502802),(23300,1554854360,0.0000,707949638),(23301,1554854361,0.5196,708738958),(23302,1554854362,0.0000,710076260),(23303,1554854363,0.0670,711070943),(23664,1554854364,0.0000,711404921),(23304,1554854364,0.0000,711920971),(23305,1554854365,0.3855,712561183),(23306,1554854366,1.8267,714174760),(23310,1554854370,99.9686,717091692),(23252,1554854372,0.0000,718948948),(23253,1554854373,0.0339,719500692),(28653,1554854373,98.8285,721810208),(28654,1554854374,99.9367,722825475),(23255,1554854375,0.0000,721415990),(23256,1554854376,0.0677,724601683),(23257,1554854377,0.0973,725158870),(28657,1554854377,76.0919,727170716),(23258,1554854378,0.0000,726125060),(28658,1554854378,84.0418,728409017),(23259,1554854379,0.0169,727131414),(23260,1554854380,0.0000,727971925),(23620,1554854380,0.4867,728035251),(23264,1554854384,0.0643,731743018),(23265,1554854385,0.0000,732885700),(23625,1554854385,5.4768,732967764),(23266,1554854386,0.0000,733249149),(25667,1554854387,0.0000,735315783),(23628,1554854388,0.0000,735491021),(25668,1554854388,0.0000,735829351),(23268,1554854388,0.0000,735874329),(23269,1554854389,0.0034,736494514),(23270,1554854390,0.0000,737620056),(25371,1554854391,0.0000,738435934),(10073,1554854393,1.0987,740305820),(23273,1554854393,3.9758,740367317),(28673,1554854393,74.2078,743401691),(10074,1554854394,0.0000,741002327),(23274,1554854394,0.0000,741063898),(10075,1554854395,0.0000,742197962),(23275,1554854395,0.2205,742852470),(28675,1554854395,34.1074,750025668),(23276,1554854396,0.3119,743175530),(10076,1554854396,0.6492,744118693),(23277,1554854397,1.7480,745388936),(10077,1554854397,0.0000,745453072),(10078,1554854398,0.0000,747258971),(28498,1554854398,0.0000,748698576),(28619,1554854399,0.0000,750242332),(28500,1554854400,0.0000,750643363),(28620,1554854400,0.0000,751765586),(28621,1554854401,0.0000,753475731),(28623,1554854403,0.0000,754965179),(28624,1554854404,0.0000,756261001),(28625,1554854405,99.9329,757155404),(28626,1554854406,0.0000,757914743),(28627,1554854407,0.0000,759099473),(28628,1554854408,0.0000,760830360),(28629,1554854409,0.0335,761829579),(28630,1554854410,0.0000,762511117),(28631,1554854411,0.0503,774444291),(28632,1554854412,0.0000,766394190),(23295,1554854415,0.1300,771285197),(28636,1554854416,99.8713,774913490),(23296,1554854416,0.0400,775688774),(23297,1554854417,0.0800,776286662),(23299,1554854419,97.9722,777736092),(23300,1554854420,0.0000,781323255),(23301,1554854421,0.8715,781362912),(23302,1554854422,0.0000,783202459),(23303,1554854423,0.0503,783838484),(23664,1554854424,0.0000,784110794),(23304,1554854424,0.0000,784843120),(23305,1554854425,0.2681,785910346),(23306,1554854426,1.0055,786913530),(23310,1554854430,99.9686,790911691),(23252,1554854432,0.0000,792573799),(23253,1554854433,0.0339,793217276),(28653,1554854433,98.8285,795537923),(28654,1554854434,99.9367,796647521),(23255,1554854435,0.0000,795675296),(23256,1554854436,0.0508,796519456),(23257,1554854437,0.2492,799753859),(28657,1554854437,76.0919,802027092),(23258,1554854438,0.0000,800555705),(28658,1554854438,84.0418,802807412),(23259,1554854439,0.0000,801466075),(23620,1554854440,0.4901,801612589),(23260,1554854440,0.0000,801679576),(23264,1554854444,0.0440,806661198),(23265,1554854445,0.0000,807517602),(23625,1554854445,5.3101,807583570),(23266,1554854446,0.0000,809197762),(25667,1554854447,0.0000,809928891),(23268,1554854448,0.0000,811170336),(23628,1554854448,0.0166,811231182),(25668,1554854448,0.0000,811267199),(23269,1554854449,0.0034,811727441),(23270,1554854450,0.0000,812617000),(25371,1554854451,0.0000,813993364),(10073,1554854453,1.0986,816298704),(23273,1554854453,3.9758,816357001),(28673,1554854453,74.2076,819446293),(10074,1554854454,0.0000,816475371),(23274,1554854454,0.0000,816894559),(23275,1554854455,0.2205,817891084),(10075,1554854455,0.0000,818389439),(28675,1554854455,34.1073,825857117),(23276,1554854456,0.3140,818952967),(10076,1554854456,0.6658,819023865),(23277,1554854457,1.7644,821498325),(10077,1554854457,0.0000,821563269),(10078,1554854458,0.0000,823876153),(28498,1554854458,0.0000,825369502),(28619,1554854459,0.0000,827521470),(28500,1554854460,0.0000,827811617),(28620,1554854460,0.0000,828906435),(28621,1554854461,0.0000,829466128),(28623,1554854463,0.0000,830804813),(28624,1554854464,0.0000,831631570),(28625,1554854465,99.5473,832642014),(28626,1554854466,0.0000,833926903),(28627,1554854467,0.1509,834641022),(28628,1554854468,0.0168,835350750),(28629,1554854469,0.0168,836901988),(28630,1554854470,0.0000,837922866),(28631,1554854471,0.1677,848992879),(28632,1554854472,0.1006,842075683),(23295,1554854475,0.1200,844472809),(23296,1554854476,0.0100,846472525),(28636,1554854476,99.8713,848192348),(23297,1554854477,0.0700,847565993),(23299,1554854479,97.4174,849150483),(23300,1554854480,0.0000,851123429),(23301,1554854481,1.2575,852074092),(23302,1554854482,0.0000,853116489),(23303,1554854483,0.0671,854307480),(23664,1554854484,0.0000,854944608),(23304,1554854484,0.0000,855601593),(23305,1554854485,0.2516,856368542),(23306,1554854486,0.8385,857647599),(23310,1554854490,99.9686,859845914),(23252,1554854492,0.0000,861183800),(23253,1554854493,0.0339,862143263),(28653,1554854493,98.8285,864379620),(28654,1554854494,99.9367,869341383),(23255,1554854495,0.0000,864943417),(23256,1554854496,0.0169,866404612),(23257,1554854497,0.2324,866928788),(28657,1554854497,76.0919,869102008),(23258,1554854498,0.0000,869501218),(28658,1554854498,84.0418,871682626),(23259,1554854499,0.0169,870903172),(23260,1554854500,0.0000,871776106),(23620,1554854500,0.4846,871835750),(23264,1554854504,0.0508,877183749),(23625,1554854505,5.1440,877744527),(23265,1554854505,0.0000,877800242),(23266,1554854506,0.0000,878857570),(25667,1554854507,0.0000,880284053),(23268,1554854508,0.0000,881169736),(25668,1554854508,0.0000,881237400),(23628,1554854508,0.0000,881551779),(23269,1554854509,0.0000,882649092),(23270,1554854510,0.0000,883662104),(25371,1554854511,0.0000,885121483),(23273,1554854513,3.9758,887319695),(10073,1554854513,1.0987,887649918),(28673,1554854513,74.2076,890768934),(10074,1554854514,0.0000,888069122),(23274,1554854514,0.0000,888133609),(10075,1554854515,0.0000,888992186),(23275,1554854515,0.2205,889284611),(28675,1554854515,34.1073,896986723),(10076,1554854516,0.6659,892144638),(23276,1554854516,0.3140,892205399),(10077,1554854517,0.0000,892752548),(23277,1554854517,1.7646,892810011),(10078,1554854518,0.0000,895746151),(28498,1554854518,0.0000,896606297),(28619,1554854519,0.0000,898333584),(28500,1554854520,0.0000,898021628),(28620,1554854520,0.0000,898764378),(28621,1554854521,0.0000,899639770),(28623,1554854523,0.0000,901394318),(28624,1554854524,0.0000,902565057),(28625,1554854525,99.9497,903557400),(28626,1554854526,0.0000,904407993),(28627,1554854527,0.0000,905100275),(28628,1554854528,0.0000,905799014),(28629,1554854529,0.0168,906590406),(28630,1554854530,0.0000,907470795),(28631,1554854531,0.0335,917863618),(28632,1554854532,0.0000,911187108),(23295,1554854535,0.1300,918098668),(23296,1554854536,0.1000,919764340),(28636,1554854536,99.8713,920696650),(23297,1554854537,0.0800,921173539),(23299,1554854539,97.0164,923334587),(23300,1554854540,0.0000,924789506),(23301,1554854541,0.6369,925218997),(23302,1554854542,0.0000,926216496),(23303,1554854543,0.0503,927825769),(23664,1554854544,0.0000,927972511),(23304,1554854544,0.0000,928442166),(23305,1554854545,0.3351,928777419),(23306,1554854546,2.1284,929658212),(23310,1554854550,99.9686,931589657),(23252,1554854552,0.0000,933180139),(23253,1554854553,0.0169,934242117),(28653,1554854553,98.8285,936443013),(28654,1554854554,99.9367,941775347),(23255,1554854555,0.0000,936585079),(23256,1554854556,0.0169,939496195),(23257,1554854557,0.1020,940908092),(28657,1554854557,76.0919,942800323),(23258,1554854558,0.0000,942068409),(28658,1554854558,84.0418,943553904),(23259,1554854559,0.0339,943010024),(23260,1554854560,0.0000,944669768),(23620,1554854560,0.4688,944728443),(23264,1554854564,0.0474,948379533),(23265,1554854565,0.0000,948643228),(23625,1554854565,5.1606,948702919),(23266,1554854566,0.0000,949567188),(25667,1554854567,0.0000,950409527),(25668,1554854568,0.0000,951700609),(23268,1554854568,0.0000,951758260),(23628,1554854568,0.0000,951786015),(23269,1554854569,0.0000,952304786),(23270,1554854570,0.0000,953198364),(25371,1554854571,0.0000,953953808),(23273,1554854573,3.9758,956132141),(10073,1554854573,1.0987,956187910),(28673,1554854573,74.2076,959495796),(23274,1554854574,0.0000,957172973),(10074,1554854574,0.0000,957549299),(23275,1554854575,0.2205,958604981),(10075,1554854575,0.0000,960350638),(28675,1554854575,34.1073,966185142),(10076,1554854576,0.6659,960973854),(23276,1554854576,0.3140,961245541),(23277,1554854577,1.7646,962559721),(10077,1554854577,0.0000,962615321),(28498,1554854578,0.0000,965612126),(10078,1554854578,0.0166,965870313),(28619,1554854579,0.0000,968611136),(28500,1554854580,0.0000,968233421),(28620,1554854580,0.0000,969008252),(28621,1554854581,0.0000,970933802),(28623,1554854583,0.0000,971615763),(28624,1554854584,0.0000,972391178),(28625,1554854585,99.8158,972792486),(28626,1554854586,0.0000,974496551),(28627,1554854587,0.0000,975531925),(28628,1554854588,0.0000,975909003),(28629,1554854589,0.0335,977245908),(28630,1554854590,0.0000,978175105),(28631,1554854591,0.0670,988626882),(28632,1554854592,0.0670,981765668),(23295,1554854595,0.1200,987359545),(28636,1554854596,99.8713,989847510),(23296,1554854596,0.0400,990583928),(23297,1554854597,0.0700,991994158),(23299,1554854599,97.2525,994141305),(23300,1554854600,0.0000,994882550),(23301,1554854601,0.5866,995362099),(23302,1554854602,0.0000,996744188),(23303,1554854603,0.0335,1850215),(23664,1554854604,0.0000,2094216),(23304,1554854604,0.0000,2584598),(23305,1554854605,0.3185,3678097),(23306,1554854606,2.3295,4869996),(23310,1554854610,99.9686,7985028),(23252,1554854612,0.0000,383508),(23253,1554854613,0.0169,1973509),(28653,1554854613,98.8285,4052545),(28654,1554854614,99.9367,9638754),(23255,1554854615,0.0000,671554),(23256,1554854616,0.0000,3801028),(23257,1554854617,0.1691,4073992),(28657,1554854617,76.0919,6178504),(23258,1554854618,0.0000,6964368),(28658,1554854618,84.0418,9074114),(23259,1554854619,0.0169,7785204),(23620,1554854620,0.4718,8074807),(23260,1554854620,0.0000,8133358),(23264,1554854624,0.0406,14590569),(23625,1554854625,5.4345,15518227),(23265,1554854625,0.0000,15576923),(23266,1554854626,0.0000,16100108),(25667,1554854627,0.0000,16764721),(23628,1554854628,0.0000,17820124),(23268,1554854628,0.0000,17887680),(25668,1554854628,0.0000,18191125),(23269,1554854629,0.0000,18741082),(23270,1554854630,0.0000,21677598),(25371,1554854631,0.0000,23940596),(10073,1554854633,1.1173,26633991),(23273,1554854633,3.9758,26698673),(28673,1554854633,74.2076,29906124),(10074,1554854634,0.0000,27993976),(23274,1554854634,0.0000,28052087),(10075,1554854635,0.0000,28375773),(23275,1554854635,0.2205,29348878),(28675,1554854635,34.1073,37402661),(23276,1554854636,0.3140,29588131),(10076,1554854636,0.6772,29645176),(23277,1554854637,1.7945,31931248),(10077,1554854637,0.0000,31987735),(10078,1554854638,0.0169,32979884),(28498,1554854638,0.0000,34481104),(28619,1554854639,0.0000,37573093),(28500,1554854640,0.0000,37909867),(28620,1554854640,0.0000,39029619),(28621,1554854641,0.0000,40065689),(28623,1554854643,0.0000,41837432),(28624,1554854644,0.0000,43050393),(28625,1554854645,99.9162,43513033),(28626,1554854646,0.0000,44230002),(28627,1554854647,0.0168,45174474),(28628,1554854648,0.0000,46287476),(28629,1554854649,0.0000,47425833),(28630,1554854650,0.0000,48253239),(28631,1554854651,0.0335,59494106),(28632,1554854652,0.0335,49756535),(23295,1554854655,0.1200,59209353),(23296,1554854656,0.0100,59837470),(28636,1554854656,99.8713,61538500),(23297,1554854657,0.0600,61317978),(23299,1554854659,94.9866,63022258),(23300,1554854660,0.0000,64794637),(23301,1554854661,1.1903,64691973),(23302,1554854662,0.0000,66548440),(23303,1554854663,0.0670,67232585),(23664,1554854664,0.0000,67221940),(23304,1554854664,0.0000,67727632),(23305,1554854665,0.4359,68293072),(23306,1554854666,2.6823,69577049),(23310,1554854670,99.9686,72232260),(23252,1554854672,0.0000,73826684),(23253,1554854673,0.0169,74493750),(28653,1554854673,98.8285,76821561),(28654,1554854674,99.9367,84048517),(23255,1554854675,0.0000,78775384),(23256,1554854676,0.0169,79827280),(23257,1554854677,0.2703,83423729),(28657,1554854677,76.0919,83832205),(23258,1554854678,0.0000,84104616),(28658,1554854678,84.0418,86354518),(23259,1554854679,0.0169,85207355),(23260,1554854680,0.0000,85901076),(23620,1554854680,0.4724,85957524),(23264,1554854684,0.0542,91033726),(23265,1554854685,0.0000,92062409),(23625,1554854685,5.6761,92127931),(23266,1554854686,0.0000,92850745),(25667,1554854687,0.0000,94096991),(25668,1554854688,0.0000,94877096),(23628,1554854688,0.0000,94942885),(23268,1554854688,0.0000,94972765),(23269,1554854689,0.0000,95896208),(23270,1554854690,0.0000,96952096),(25371,1554854691,0.0000,97926581),(10073,1554854693,1.0986,100336798),(23273,1554854693,3.9758,100626044),(28673,1554854693,74.2076,103800678),(10074,1554854694,0.0000,101311390),(23274,1554854694,0.0000,101628282),(10075,1554854695,0.0000,102703564),(23275,1554854695,0.2205,102793593),(28675,1554854695,34.1073,111508582),(23276,1554854696,0.3140,105467699),(10076,1554854696,0.6658,105524394),(23277,1554854697,1.7645,106320213),(10077,1554854697,0.0000,106403220),(28498,1554854698,0.0000,109813699),(10078,1554854698,0.0000,109871439),(28619,1554854699,0.0000,112850853),(28500,1554854700,0.0000,113113570),(28620,1554854700,0.0000,114244693),(28621,1554854701,0.0000,115625216),(28623,1554854703,0.0000,117263733),(28624,1554854704,0.0000,118316947),(28625,1554854705,99.8660,119026778),(28626,1554854706,0.0000,119736518),(28627,1554854707,0.0000,120995025),(28628,1554854708,0.0000,121822059),(28629,1554854709,0.0335,122905453),(28630,1554854710,0.0000,123826725),(28631,1554854711,0.0670,135424966),(28632,1554854712,0.0503,128409791),(23295,1554854715,0.1100,132762605),(23296,1554854716,0.0500,134562758),(28636,1554854716,99.8713,134980349),(23297,1554854717,0.0600,135862229),(23299,1554854719,96.5795,137174404),(23300,1554854720,0.0000,138746644),(23301,1554854721,1.2909,140019368),(23302,1554854722,0.0000,141220829),(23303,1554854723,0.0503,142245331),(23664,1554854724,0.0000,142790474),(23304,1554854724,0.0000,143422411),(23305,1554854725,0.3186,144630208),(23306,1554854726,1.7100,145462211),(23310,1554854730,99.9686,148570880),(23252,1554854732,0.0000,149691848),(23253,1554854733,0.0339,150700519),(28653,1554854733,98.8285,153008766),(28654,1554854734,99.9367,154919854),(23255,1554854735,0.0000,152776941),(23256,1554854736,0.0000,156146423),(23257,1554854737,0.1564,157011911),(28657,1554854737,76.0919,159246150),(23258,1554854738,0.0000,157252376),(28658,1554854738,84.0418,159529241),(23259,1554854739,0.0169,158533232),(23620,1554854740,0.4733,159583856),(23260,1554854740,0.0000,159646748),(23264,1554854744,0.0406,165244919),(23265,1554854745,0.0000,166248467),(23625,1554854745,5.6597,166317580),(23266,1554854746,0.0000,167656725),(25667,1554854747,0.0000,168552371),(23268,1554854748,0.0000,179224782),(23628,1554854748,0.0000,179272464),(25668,1554854748,0.0000,179538232),(23269,1554854749,0.0000,180243507),(23270,1554854750,0.0000,180734318),(25371,1554854751,0.0000,182745676),(23273,1554854753,3.9758,184812994),(10073,1554854753,1.0984,185121570),(28673,1554854753,74.2076,188249139),(23274,1554854754,0.0000,185939045),(10074,1554854754,0.0000,186015231),(23275,1554854755,0.2205,186685194),(10075,1554854755,0.0000,187149903),(28675,1554854755,34.1073,194684959),(23276,1554854756,0.3140,189514089),(10076,1554854756,0.6657,189638571),(23277,1554854757,1.7642,190662147),(10077,1554854757,0.0000,190722631),(10078,1554854758,0.0000,190962350),(28498,1554854758,0.0000,193126736),(28619,1554854759,0.0000,195164540),(28500,1554854760,0.0000,194940944),(28620,1554854760,0.0000,196325553),(28621,1554854761,0.0000,197864562),(28623,1554854763,0.0000,198545888),(28624,1554854764,0.0000,200048776),(28625,1554854765,99.8827,200789565),(28626,1554854766,0.0000,201898719),(28627,1554854767,0.0168,202945485),(28628,1554854768,0.0000,205137065),(28629,1554854769,0.0335,205829712),(28630,1554854770,0.0000,206795145),(28631,1554854771,0.0335,220594338),(28632,1554854772,0.0168,220634167),(23295,1554854775,0.1100,223085215),(23296,1554854776,0.0200,223333576),(28636,1554854776,99.8713,224334029),(23297,1554854777,0.0500,224678452),(23299,1554854779,96.2795,226563011),(23300,1554854780,0.0000,228119236),(23301,1554854781,0.7209,228447819),(23302,1554854782,0.0000,229481977),(23303,1554854783,0.0838,230969028),(23664,1554854784,0.0000,231601489),(23304,1554854784,0.0000,232194724),(23305,1554854785,0.4693,232734511),(23306,1554854786,3.4194,233943314),(23310,1554854790,99.9686,237978368),(23252,1554854792,0.0000,239539374),(23253,1554854793,0.0339,240444860),(28653,1554854793,98.8285,242659670),(28654,1554854794,99.9367,246601004),(23255,1554854795,0.0000,243727374),(23256,1554854796,0.0508,244080112),(23257,1554854797,0.1486,247849451),(28657,1554854797,76.0919,248237009),(23258,1554854798,0.0000,250028465),(28658,1554854798,84.0418,250427778),(23259,1554854799,0.0169,250510253),(23620,1554854800,0.4771,251379390),(23260,1554854800,0.0000,251442551),(23264,1554854804,0.0542,254293730),(23625,1554854805,5.6581,256769810),(23265,1554854805,0.0000,256836875),(23266,1554854806,0.0000,257147795),(25667,1554854807,0.0000,258547255),(23628,1554854808,0.0000,260122620),(23268,1554854808,0.0000,260185208),(25668,1554854808,0.0000,260219328),(23269,1554854809,0.0000,261079877),(23270,1554854810,0.0000,261654295),(25371,1554854811,0.0000,262734233),(10073,1554854813,1.0985,265321330),(23273,1554854813,3.9758,265381501),(28673,1554854813,74.2076,268702483),(10074,1554854814,0.0000,266027539),(23274,1554854814,0.0000,266082923),(10075,1554854815,0.0000,266743933),(23275,1554854815,0.2205,267062048),(28675,1554854815,34.1073,274421793),(23276,1554854816,0.3140,268212064),(10076,1554854816,0.6658,269660567),(23277,1554854817,1.7643,271129261),(10077,1554854817,0.0000,272203250),(28498,1554854818,0.0000,275153768),(10078,1554854818,0.0000,275473231),(28619,1554854819,0.0000,278128583),(28500,1554854820,0.0000,279183106),(28620,1554854820,0.0000,279458908),(28621,1554854821,0.0000,280745653),(28623,1554854823,0.0000,282372735),(28624,1554854824,0.0000,282843095),(28625,1554854825,99.8827,283754177),(28626,1554854826,0.0000,284778959),(28627,1554854827,0.0000,286135730),(28628,1554854828,0.0000,286850564),(28629,1554854829,0.0168,287765438),(28630,1554854830,0.0000,288555123),(28631,1554854831,0.0503,300153949),(28632,1554854832,0.0503,293079026),(23295,1554854835,0.1000,298795858),(23296,1554854836,0.0100,300865350),(28636,1554854836,99.8713,301838479),(23297,1554854837,0.0400,302415322),(23299,1554854839,96.2777,303994645),(23300,1554854840,0.0000,305265335),(23301,1554854841,0.9893,305801218),(23302,1554854842,0.0000,306889159),(23303,1554854843,0.0838,307498730),(23664,1554854844,0.0000,308299400),(23304,1554854844,0.0000,308655008),(23305,1554854845,0.2515,310016575),(23306,1554854846,1.4588,310951390),(23310,1554854850,99.9686,314781465),(23252,1554854852,0.0000,315604790),(23253,1554854853,0.0169,316173894),(28653,1554854853,98.8285,318493008),(28654,1554854854,99.9367,322191151),(23255,1554854855,0.0000,318647591),(23256,1554854856,0.0169,321236659),(23257,1554854857,0.2366,323406217),(28657,1554854857,76.0919,323664608),(23258,1554854858,0.0000,324058925),(28658,1554854858,84.0418,326082613),(23259,1554854859,0.0169,324582924),(23620,1554854860,0.4747,325281051),(23260,1554854860,0.0000,325346357),(23264,1554854864,0.0609,330218570),(23625,1554854865,5.6929,331270935),(23265,1554854865,0.0000,331337376),(23266,1554854866,0.0000,332324769),(25667,1554854867,0.0000,333297491),(25668,1554854868,0.0000,334062523),(23268,1554854868,0.0000,334127599),(23628,1554854868,0.0000,334436952),(23269,1554854869,0.0000,336130589),(23270,1554854870,0.0000,337151147),(25371,1554854871,0.0000,338089705),(10073,1554854873,1.0986,340900744),(23273,1554854873,3.9740,340961251),(28673,1554854873,74.2076,343856570),(10074,1554854874,0.0000,341440368),(23274,1554854874,0.0000,341499233),(23275,1554854875,0.2205,343125694),(10075,1554854875,0.0000,343727561),(28675,1554854875,34.1073,351029215),(23276,1554854876,0.3140,344660430),(10076,1554854876,0.7158,344728734),(10077,1554854877,0.0000,344880531),(23277,1554854877,1.8144,344942012),(10078,1554854878,0.0499,348735509),(28498,1554854878,0.0000,349618168),(28619,1554854879,0.0000,351266469),(28500,1554854880,0.0000,351149095),(28620,1554854880,0.0000,352421736),(28621,1554854881,0.0000,353554482),(28623,1554854883,0.0000,354608156),(28624,1554854884,0.0000,355039953),(28625,1554854885,99.9162,355417999),(28626,1554854886,0.0000,356731976),(28627,1554854887,0.0000,357857037),(28628,1554854888,0.0000,359120806),(28629,1554854889,0.0335,359387776),(28630,1554854890,0.0000,360576400),(28631,1554854891,0.0335,371548933),(28632,1554854892,0.0168,375355257),(23295,1554854895,0.1000,375813530),(23296,1554854896,0.0700,376469650),(28636,1554854896,99.8713,377939898),(23297,1554854897,0.0500,378218867),(23299,1554854899,98.1388,379709642),(23300,1554854900,0.0000,381008440),(23301,1554854901,0.6706,381458528),(23302,1554854902,0.0000,383573239),(23303,1554854903,0.0503,384162886),(23664,1554854904,0.0000,384559187),(23304,1554854904,0.0000,385127389),(23305,1554854905,0.2180,385786296),(23306,1554854906,0.7714,386846651),(23310,1554854910,99.9686,389930722),(23252,1554854912,0.0000,390541772),(23253,1554854913,0.0169,392217221),(28653,1554854913,98.8285,394773237),(28654,1554854914,99.9367,396017493),(23255,1554854915,0.0000,395838385),(23256,1554854916,0.0339,396479051),(23257,1554854917,0.1227,397418447),(28657,1554854917,76.0919,399640493),(23258,1554854918,0.0000,400122756),(28658,1554854918,84.0418,402162663),(23259,1554854919,0.0000,401102556),(23620,1554854920,0.4754,401816790),(23260,1554854920,0.0000,401885441),(23264,1554854924,0.0440,406759920),(23265,1554854925,0.0000,407328867),(23625,1554854925,5.7261,407391086),(23266,1554854926,0.0000,407872603),(25667,1554854927,0.0169,410078296),(25668,1554854928,0.0000,410928765),(23268,1554854928,0.0000,410974736),(23628,1554854928,0.0000,411004688),(23269,1554854929,0.0000,412113136),(23270,1554854930,0.0000,412753310),(25371,1554854931,0.0000,413500089),(23273,1554854933,3.9740,415998368),(10073,1554854933,1.0986,416066424),(28673,1554854933,74.2076,419745318),(10074,1554854934,0.0000,416700565),(23274,1554854934,0.0000,416777966),(10075,1554854935,0.0000,417322942),(23275,1554854935,0.2205,417390957),(28675,1554854935,34.1073,426133259),(23276,1554854936,0.3140,418657707),(10076,1554854936,0.6991,418723410),(23277,1554854937,1.7977,422092622),(10077,1554854937,0.0000,422158673),(28498,1554854938,0.0000,423453801),(10078,1554854938,0.0166,423898944),(28619,1554854939,0.0000,426819196),(28500,1554854940,0.0000,427199008),(28620,1554854940,0.0000,428360040),(28621,1554854941,0.0000,429661098),(28623,1554854943,0.0000,431200538),(28624,1554854944,0.0000,431592861),(28625,1554854945,99.6145,431950298),(28626,1554854946,0.0000,433482165),(28627,1554854947,0.0000,434199457),(28628,1554854948,0.0000,434929379),(28629,1554854949,0.0335,435806685),(28630,1554854950,0.0000,436939528),(28631,1554854951,0.1676,448137773),(28632,1554854952,0.1843,441615245),(23295,1554854955,0.1000,445115736),(23296,1554854956,0.0300,446125935),(28636,1554854956,99.8713,447794912),(23297,1554854957,0.0400,447976905),(23299,1554854959,98.1388,449746582),(23300,1554854960,0.0000,451638491),(23301,1554854961,1.0392,453007916),(23302,1554854962,0.0000,454899269),(23303,1554854963,0.0503,454981897),(23664,1554854964,0.0000,455962386),(23304,1554854964,0.0000,456572597),(23305,1554854965,0.2347,457561841),(23306,1554854966,0.9889,458477948),(23310,1554854970,99.9686,461500221),(23252,1554854972,0.0000,462864883),(23253,1554854973,0.0339,463370277),(28653,1554854973,98.8285,465760982),(28654,1554854974,99.9367,466651607),(23255,1554854975,0.0000,467360702),(23256,1554854976,0.0677,467730933),(23257,1554854977,0.1486,469119981),(28657,1554854977,76.0919,471433758),(23258,1554854978,0.0000,472814221),(28658,1554854978,84.0418,473208494),(23259,1554854979,0.0339,473143987),(23260,1554854980,0.0000,473334168),(23620,1554854980,0.4754,473401691),(23264,1554854984,0.0609,477659104),(23625,1554854985,5.5268,478433763),(23265,1554854985,0.0000,478774342),(23266,1554854986,0.0000,479780930),(25667,1554854987,0.0000,480627450),(23268,1554854988,0.0000,481342496),(25668,1554854988,0.0000,481403156),(23628,1554854988,0.0000,481427224),(23269,1554854989,0.0000,482189066),(23270,1554854990,0.0000,483056838),(25371,1554854991,0.0169,484863751),(23273,1554854993,3.9740,485819219),(10073,1554854993,1.0987,485885047),(28673,1554854993,74.2076,489202004),(23274,1554854994,0.0000,486624087),(10074,1554854994,0.0000,486684189),(23275,1554854995,0.2205,488040217),(10075,1554854995,0.0000,488104641),(28675,1554854995,34.1073,496081410),(10076,1554854996,0.6659,490873402),(23276,1554854996,0.3140,490937614),(23277,1554854997,1.7646,491724064),(10077,1554854997,0.0000,491792063),(10078,1554854998,0.0000,493018014),(28498,1554854998,0.0000,495388423),(28619,1554854999,0.0000,497188492),(28500,1554855000,0.0000,496945245),(28620,1554855000,0.0000,497991466),(28621,1554855001,0.0000,499687983),(28623,1554855003,0.0000,501950188),(28624,1554855004,0.0000,502607074),(28625,1554855005,99.8827,503026537),(28626,1554855006,0.0000,504243840),(28627,1554855007,0.0503,504994187),(28628,1554855008,0.0000,505714501),(28629,1554855009,0.0168,506028258),(28630,1554855010,0.0000,506785879),(28631,1554855011,0.0503,517272615),(28632,1554855012,0.0168,510779057),(23295,1554855015,0.0900,514257234),(28636,1554855016,99.8713,516612536),(23296,1554855016,0.0100,516808313),(23297,1554855017,0.0400,517707312),(23299,1554855019,98.1053,519087800),(23300,1554855020,0.0000,521058755),(23301,1554855021,0.4192,521576418),(23302,1554855022,0.0000,523331748),(23303,1554855023,0.0503,523810016),(23664,1554855024,0.0000,524447741),(23304,1554855024,0.0000,525039153),(23305,1554855025,0.2011,525646488),(23306,1554855026,0.8047,526906339),(23310,1554855030,99.9686,529741310),(23252,1554855032,0.0000,531474808),(23253,1554855033,0.0169,532789615),(28653,1554855033,98.8285,535159249),(28654,1554855034,99.9367,539366518),(23255,1554855035,0.0000,534800398),(23256,1554855036,0.0339,537351077),(23257,1554855037,0.1227,538291898),(28657,1554855037,76.0880,540856434),(23258,1554855038,0.0000,539344033),(28658,1554855038,84.0418,541662676),(23259,1554855039,0.0000,540700816),(23260,1554855040,0.0000,541485323),(23620,1554855040,0.4712,541562210),(23264,1554855044,0.0508,544038578),(23265,1554855045,0.0000,546190415),(23625,1554855045,5.5271,546534557),(23266,1554855046,0.0000,546799384),(25667,1554855047,0.0000,547649542),(23628,1554855048,0.0000,549122234),(25668,1554855048,0.0000,549189054),(23268,1554855048,0.0000,549223076),(23269,1554855049,0.0000,549729025),(23270,1554855050,0.0000,550341396),(25371,1554855051,0.0000,551641110),(10073,1554855053,1.0988,553828591),(23273,1554855053,3.9740,553886135),(28673,1554855053,74.2076,556896427),(10074,1554855054,0.0000,554137000),(23274,1554855054,0.0000,554201189),(10075,1554855055,0.0000,555072033),(23275,1554855055,0.2205,555564339),(28675,1554855055,34.1073,563095637),(10076,1554855056,0.6659,558632185),(23276,1554855056,0.3140,558711084),(23277,1554855057,1.7646,563234282),(10077,1554855057,0.0000,563286595),(10078,1554855058,0.0000,565184712),(28498,1554855058,0.0000,566456797),(28619,1554855059,0.0000,567589278),(28500,1554855060,0.0000,567968764),(28620,1554855060,0.0000,568438453),(28621,1554855061,0.0000,570443917),(28623,1554855063,0.0000,572120503),(28624,1554855064,0.0000,573218022),(28625,1554855065,99.8157,573934741),(28626,1554855066,0.0000,574657929),(28627,1554855067,0.0168,575971477),(28628,1554855068,0.0000,576700293),(28629,1554855069,0.0335,577615601),(28630,1554855070,0.0000,578086875),(28631,1554855071,0.0503,589607591),(28632,1554855072,0.0838,580616257),(23295,1554855075,0.0800,589738965),(23296,1554855076,0.0000,591378731),(28636,1554855076,99.8713,591941312),(23297,1554855077,0.0300,592210351),(23299,1554855079,90.3453,593933001),(23300,1554855080,0.0000,595866602),(23301,1554855081,0.6368,596995907),(23302,1554855082,0.0000,598614968),(23303,1554855083,0.1173,599411701),(23664,1554855084,0.0000,601019970),(23304,1554855084,0.0000,601815037),(23305,1554855085,0.8718,602945314),(23306,1554855086,9.2372,603625809),(23310,1554855090,99.9686,606961939),(23252,1554855092,0.0000,608126726),(23253,1554855093,0.0169,608744218),(28653,1554855093,98.8285,611101383),(28654,1554855094,99.9367,613017280),(23255,1554855095,0.0000,610827352),(23256,1554855096,0.0169,613694049),(23257,1554855097,0.1437,614647445),(28657,1554855097,76.0880,616602452),(23258,1554855098,0.0000,615364997),(28658,1554855098,84.0418,617429201),(23259,1554855099,0.0169,616041051),(23620,1554855100,0.4691,616551137),(23260,1554855100,0.0000,616619130),(23264,1554855104,0.0609,621333844),(23265,1554855105,0.0000,622515301),(23625,1554855105,5.5263,622807427),(23266,1554855106,0.0000,623767653),(25667,1554855107,0.0000,625062047),(25668,1554855108,0.0000,625771460),(23268,1554855108,0.0000,625837641),(23628,1554855108,0.0000,626063499),(23269,1554855109,0.0000,627036797),(23270,1554855110,0.0000,627422403),(25371,1554855111,0.0000,628361172),(10073,1554855113,1.0986,630854767),(23273,1554855113,3.9740,631316083),(28673,1554855113,74.2076,634206111),(23274,1554855114,0.0000,632331826),(10074,1554855114,0.0000,632394093),(10075,1554855115,0.0000,632964925),(23275,1554855115,0.2205,633019804),(28675,1554855115,34.1073,640769266),(10076,1554855116,0.6658,633388478),(23276,1554855116,0.3140,633456114),(10077,1554855117,0.0000,636668430),(23277,1554855117,1.7645,636989038),(10078,1554855118,0.0000,637252212),(28498,1554855118,0.0000,638271833),(28619,1554855119,0.0000,641408168),(28500,1554855120,0.0000,641530611),(28620,1554855120,0.0000,642564246),(28621,1554855121,0.0000,644013309),(28623,1554855123,0.0000,646466707),(28624,1554855124,0.0000,647039304),(28625,1554855125,99.9162,647697725),(28626,1554855126,0.0000,648720280),(28627,1554855127,0.0000,649352362),(28628,1554855128,0.0000,649724898),(28629,1554855129,0.0168,650571167),(28630,1554855130,0.0000,651370126),(28631,1554855131,0.0503,662560807),(28632,1554855132,0.0168,652918615),(23295,1554855135,0.0800,661244689),(23296,1554855136,0.0600,662409752),(28636,1554855136,99.8713,664319860),(23297,1554855137,0.0400,663815768),(23299,1554855139,95.9759,666434194),(23300,1554855140,0.0000,667592478),(23301,1554855141,0.7381,668218294),(23302,1554855142,0.0000,669234463),(23303,1554855143,0.0503,670095260),(23664,1554855144,0.0000,670564780),(23304,1554855144,0.0000,671284097),(23305,1554855145,0.3186,672166497),(23306,1554855146,1.7941,672718335),(23310,1554855150,99.9686,675400083),(23252,1554855152,0.0000,676074758),(23253,1554855153,0.0339,677284834),(28653,1554855153,98.8285,679753713),(28654,1554855154,99.9367,684230106),(23255,1554855155,0.0000,679098150),(23256,1554855156,0.0508,680754697),(23257,1554855157,0.1269,683439087),(28657,1554855157,76.0880,685609613),(23258,1554855158,0.0000,684203280),(28658,1554855158,84.0418,686398451),(23259,1554855159,0.0000,684999220),(23260,1554855160,0.0000,685636957),(23620,1554855160,0.4691,685694583),(23264,1554855164,0.0542,690497722),(23625,1554855165,5.5270,691431681),(23265,1554855165,0.0000,691802763),(23266,1554855166,0.0000,692565343),(25667,1554855167,0.0000,693445002),(25668,1554855168,0.0000,693974059),(23268,1554855168,0.0000,694031602),(23628,1554855168,0.0000,694062234),(23269,1554855169,0.0000,695123989),(23270,1554855170,0.0000,696536571),(25371,1554855171,0.0169,697674010),(23273,1554855173,3.9740,699635214),(10073,1554855173,1.0987,699690477),(28673,1554855173,74.2076,702682236),(23274,1554855174,0.0000,700398721),(10074,1554855174,0.0000,700693819),(23275,1554855175,0.2205,701235570),(10075,1554855175,0.0000,701292111),(28675,1554855175,34.1073,709031363),(23276,1554855176,0.3140,702467254),(10076,1554855176,0.6659,704424657),(23277,1554855177,1.7647,704570797),(10077,1554855177,0.0000,704883327),(10078,1554855178,0.0166,707622337),(28498,1554855178,0.0000,708978258),(28619,1554855179,0.0000,711187283),(28500,1554855180,0.0000,710707729),(28620,1554855180,0.0000,711932507),(28621,1554855181,0.0000,713153178),(28623,1554855183,0.0000,714158206),(28624,1554855184,0.0000,714670141),(28625,1554855185,99.8660,715868255),(28626,1554855186,0.0000,716664694),(28627,1554855187,0.0000,717484301),(28628,1554855188,0.0000,718181383),(28629,1554855189,0.0168,719338858),(28630,1554855190,0.0000,720397795),(28631,1554855191,0.0335,731858822),(28632,1554855192,0.0838,722951013),(23295,1554855195,0.0800,730009409),(23296,1554855196,0.0200,733109696),(28636,1554855196,99.8713,733790861),(23297,1554855197,0.0300,733478884),(23299,1554855199,98.3233,735302960),(23300,1554855200,0.0000,736356774),(23301,1554855201,0.5198,736465074),(23302,1554855202,0.0000,737859695),(23303,1554855203,0.0335,738616360),(23664,1554855204,0.0000,739254904),(23304,1554855204,0.0000,739763274),(23305,1554855205,0.2348,740648113),(23306,1554855206,0.8052,741510887),(23310,1554855210,99.9686,744765994),(23252,1554855212,0.0000,746065274),(23253,1554855213,0.0169,746528053),(28653,1554855213,98.8285,748750638),(28654,1554855214,99.9367,751631098),(23255,1554855215,0.0000,750239273),(23256,1554855216,0.0339,752521920),(23257,1554855217,0.0973,754287513),(28657,1554855217,76.0880,755832221),(23258,1554855218,0.0000,756312769),(28658,1554855218,84.0418,756701766),(23259,1554855219,0.0000,757194896),(23620,1554855220,0.4701,757490674),(23260,1554855220,0.0000,757554601),(23264,1554855224,0.0508,760879688),(23265,1554855225,0.0000,761797617),(23625,1554855225,5.3604,761853412),(23266,1554855226,0.0000,762704820),(25667,1554855227,0.0169,763196558),(23628,1554855228,0.0000,764264349),(23268,1554855228,0.0000,764628650),(25668,1554855228,0.0000,764672983),(23269,1554855229,0.0000,765927365),(23270,1554855230,0.0000,766925879),(25371,1554855231,0.0169,767760499),(10073,1554855233,1.0987,769598331),(23273,1554855233,3.9740,769654466),(28673,1554855233,74.2076,773028756),(23274,1554855234,0.0000,770845143),(10074,1554855234,0.0000,770900321),(10075,1554855235,0.0000,771674101),(23275,1554855235,0.2205,772567435),(28675,1554855235,34.1073,779630407),(10076,1554855236,0.6659,773859414),(23276,1554855236,0.3140,773918756),(10077,1554855237,0.0000,775345445),(23277,1554855237,1.7646,775399691),(28498,1554855238,0.0000,778274853),(10078,1554855238,0.0166,778404507),(28619,1554855239,0.0000,781053281),(28500,1554855240,0.0000,781555601),(28620,1554855240,0.0000,782043299),(28621,1554855241,0.0000,783248944),(28623,1554855243,0.0000,785245812),(28624,1554855244,0.0000,785560926),(28625,1554855245,99.8827,786531332),(28626,1554855246,0.0000,787526610),(28627,1554855247,0.0335,788739521),(28628,1554855248,0.0000,789137468),(28629,1554855249,0.0167,790126036),(28630,1554855250,0.0000,790740286),(28631,1554855251,0.0502,801223199),(28632,1554855252,0.0167,792491542),(23295,1554855255,0.0700,799165920),(28636,1554855256,99.8713,803408324),(23296,1554855256,0.0100,804061161),(23297,1554855257,0.0300,805231017),(23299,1554855259,98.3898,807010414),(23300,1554855260,0.0000,808638560),(23301,1554855261,0.5366,808471928),(23302,1554855262,0.0000,810137955),(23303,1554855263,0.0671,810109610),(23664,1554855264,0.0000,810941036),(23304,1554855264,0.0000,811619758),(23305,1554855265,0.2012,811743578),(23306,1554855266,0.9554,812965313),(23310,1554855270,99.9686,817016344),(23252,1554855272,0.0000,817302143),(23253,1554855273,0.0339,818641172),(28653,1554855273,98.8285,820690227),(28654,1554855274,99.9367,822375270),(23255,1554855275,0.0000,820593785),(23256,1554855276,0.0508,823774559),(23257,1554855277,0.1402,824151034),(28657,1554855277,76.0880,826419707),(23258,1554855278,0.0000,825467764),(28658,1554855278,84.0418,827541008),(23259,1554855279,0.0169,826434897),(23260,1554855280,0.0000,826772006),(23620,1554855280,0.4785,826827754),(23264,1554855284,0.0508,832304115),(23265,1554855285,0.0000,832713112),(23625,1554855285,5.1606,832771241),(23266,1554855286,0.0000,834101879),(25667,1554855287,0.0000,835233370),(25668,1554855288,0.0000,835452025),(23268,1554855288,0.0000,835765961),(23628,1554855288,0.0000,835809156),(23269,1554855289,0.0000,836223933),(23270,1554855290,0.0000,837097850),(25371,1554855291,0.0000,838812987),(23273,1554855293,3.9740,840136004),(10073,1554855293,1.0987,840207075),(28673,1554855293,74.2076,843247784),(23274,1554855294,0.0000,841486835),(10074,1554855294,0.0000,841547550),(23275,1554855295,0.2205,842238680),(10075,1554855295,0.0000,842295450),(28675,1554855295,34.1073,850436042),(10076,1554855296,0.6659,843291288),(23276,1554855296,0.3140,845261324),(10077,1554855297,0.0000,845813480),(23277,1554855297,1.7646,845868034),(10078,1554855298,0.0000,846808626),(28498,1554855298,0.0000,847608438),(28619,1554855299,0.0000,851277058),(28500,1554855300,0.0000,851663098),(28620,1554855300,0.0000,852458257),(28621,1554855301,0.0000,853516893),(28623,1554855303,0.0000,854519307),(28624,1554855304,0.0000,855419878),(28625,1554855305,99.8158,855883811),(28626,1554855306,0.0000,856558496),(28627,1554855307,0.0168,857465561),(28628,1554855308,0.0000,858551286),(28629,1554855309,0.0503,859328133),(28630,1554855310,0.0000,859869330),(28631,1554855311,0.0335,870864242),(28632,1554855312,0.0670,864507312),(23295,1554855315,0.0700,869552471),(23296,1554855316,0.0000,872059720),(28636,1554855316,99.8713,873694889),(23297,1554855317,0.0200,874091852),(23299,1554855319,98.1056,875389585),(23300,1554855320,0.0000,876786648),(23301,1554855321,0.5533,877766459),(23302,1554855322,0.0000,879542962),(23303,1554855323,0.0671,879720713),(23664,1554855324,0.0000,880346972),(23304,1554855324,0.0000,881076218),(23305,1554855325,0.2348,881334333),(23306,1554855326,1.8444,882745419),(23310,1554855330,99.9686,885627663),(23252,1554855332,0.0000,887371208),(23253,1554855333,0.0339,888068356),(28653,1554855333,98.8285,890403988),(28654,1554855334,99.9367,891109135),(23255,1554855335,0.0000,891675414),(23256,1554855336,0.0508,892858115),(23257,1554855337,0.1691,896538551),(28657,1554855337,76.0880,901674410),(23258,1554855338,0.0000,896938880),(28658,1554855338,84.0418,899273217),(23259,1554855339,0.0169,897360165),(23620,1554855340,0.4951,897683733),(23260,1554855340,0.0000,897746900),(23264,1554855344,0.0576,901735241),(23625,1554855345,5.1606,902905028),(23265,1554855345,0.0000,903371350),(23266,1554855346,0.0000,904502256),(25667,1554855347,0.0000,905899785),(23268,1554855348,0.0000,907060807),(25668,1554855348,0.0000,907128731),(23628,1554855348,0.0000,907158777),(23269,1554855349,0.0000,907814273),(23270,1554855350,0.0000,908567313),(25371,1554855351,0.0169,910062360),(10073,1554855353,1.0987,911456866),(23273,1554855353,3.9740,911731973),(28673,1554855353,74.2076,914796923),(23274,1554855354,0.0000,912313853),(10074,1554855354,0.0000,912370113),(23275,1554855355,0.2205,913548803),(10075,1554855355,0.0000,914090015),(28675,1554855355,34.1073,921460546),(23276,1554855356,0.3140,914600416),(10076,1554855356,0.6659,916525935),(23277,1554855357,1.7646,917082742),(10077,1554855357,0.0000,917149216),(28498,1554855358,0.0000,919273875),(10078,1554855358,0.0000,919938046),(28619,1554855359,0.0000,922015478),(28500,1554855360,0.0000,922864922),(28620,1554855360,0.0000,923882384),(28621,1554855361,0.0000,924635687),(28623,1554855363,0.0000,926431303),(28624,1554855364,0.0000,927245799),(28625,1554855365,99.9330,928226373),(28626,1554855366,0.0000,928714307),(28627,1554855367,0.0000,930055564),(28628,1554855368,0.0000,930928666),(28629,1554855369,0.0168,931676311),(28630,1554855370,0.0000,933675935),(28631,1554855371,0.0335,943608914),(28632,1554855372,0.0335,936514882),(23295,1554855375,0.0600,941620932),(23296,1554855376,0.0000,945086663),(28636,1554855376,99.8713,945696310),(23297,1554855377,0.0200,945206548),(23299,1554855379,94.9531,946636946),(23300,1554855380,0.0000,948589511),(23301,1554855381,0.5700,949746419),(23302,1554855382,0.0000,952345354),(23303,1554855383,0.0838,952168110),(23664,1554855384,0.0000,952201214),(23304,1554855384,0.0000,952851448),(23305,1554855385,0.5030,957176951),(23306,1554855386,3.8571,957904503),(23310,1554855390,99.9686,960175545),(23252,1554855392,0.0000,960794688),(23253,1554855393,0.0169,961838298),(28653,1554855393,98.8285,964073369),(28654,1554855394,99.9367,972977927),(23255,1554855395,0.0000,968471638),(23256,1554855396,0.0846,969622353),(23257,1554855397,0.1015,971346978),(28657,1554855397,76.0880,973506001),(23258,1554855398,0.0000,973799629),(28658,1554855398,84.0418,975746410),(23259,1554855399,0.0169,974502144),(23260,1554855400,0.0000,975483143),(23620,1554855400,0.4949,975539120),(23264,1554855404,0.0643,979774732),(23265,1554855405,0.0000,980330811),(23625,1554855405,5.1600,980605182),(23266,1554855406,0.0000,981034545),(25667,1554855407,0.0000,981942242),(23628,1554855408,0.0000,982529646),(23268,1554855408,0.0000,982884135),(25668,1554855408,0.0000,982927452),(23269,1554855409,0.0000,984117509),(23270,1554855410,0.0000,985580941),(25371,1554855411,0.0000,986211040),(23273,1554855413,3.9740,988488864),(10073,1554855413,1.0986,988849168),(28673,1554855413,74.2076,992151248),(23274,1554855414,0.0000,994474012),(10074,1554855414,0.0000,994746774),(10075,1554855415,0.0000,995516981),(23275,1554855415,0.2205,995576283),(23276,1554855416,0.3140,1886223),(10076,1554855416,0.6601,1951035),(28675,1554855416,34.1073,6310393),(10077,1554855417,0.0000,581850),(23277,1554855417,1.8109,2610888),(10078,1554855418,0.0000,6175073),(28498,1554855418,0.0000,7759851),(28619,1554855419,0.0000,10406362),(28500,1554855420,0.0000,10480513),(28620,1554855420,0.0000,11322180),(28621,1554855421,0.0000,13353427),(28623,1554855423,0.0000,15108919),(28624,1554855424,0.0000,2032711),(28625,1554855425,99.8492,2889289),(28626,1554855426,0.0000,3914559),(28627,1554855427,0.0168,5652799),(28628,1554855428,0.0000,7732577),(28629,1554855429,0.0168,8653010),(28630,1554855430,0.0000,10576368),(28631,1554855431,0.0503,21800468),(28632,1554855432,0.0838,26205737),(23295,1554855435,0.0700,28977847),(23296,1554855436,0.0700,28440098),(28636,1554855436,99.8713,30092904),(23297,1554855437,0.0400,30343862),(23299,1554855439,96.5650,32686169),(23300,1554855440,0.0000,34184062),(23301,1554855441,0.3855,34224867),(23302,1554855442,0.0000,35774973),(23303,1554855443,0.0670,36073312),(23664,1554855444,0.0000,36995237),(23304,1554855444,0.0000,37581442),(23305,1554855445,0.3184,38439547),(23306,1554855446,1.5751,39419824),(23310,1554855450,99.9686,42094776),(23252,1554855452,0.0000,43394375),(23253,1554855453,0.0339,44851400),(28653,1554855453,98.8285,46827541),(28654,1554855454,99.9367,50978727),(23255,1554855455,0.0000,47082362),(23256,1554855456,0.0339,49528459),(23257,1554855457,0.0973,51304548),(28657,1554855457,76.0880,53492518),(23258,1554855458,0.0000,52591988),(28658,1554855458,84.0418,54752376),(23259,1554855459,0.0169,55603036),(23620,1554855460,0.4976,56654610),(23260,1554855460,0.0000,56721823),(23264,1554855464,0.0643,61694176),(23625,1554855465,5.6024,62719159),(23265,1554855465,0.0000,62779309),(23266,1554855466,0.0000,64018279),(25667,1554855467,0.0169,64564223),(25668,1554855468,0.0000,65941226),(23628,1554855468,0.0000,66010173),(23268,1554855468,0.0000,66037758),(23269,1554855469,0.0000,67426649),(23270,1554855470,0.0000,68492959),(25371,1554855471,0.0172,69334839),(10073,1554855473,1.1171,72538966),(23273,1554855473,3.9740,72916003),(28673,1554855473,74.2076,75772361),(23274,1554855474,0.0000,73725085),(10074,1554855474,0.0000,74038745),(10075,1554855475,0.0000,74784831),(23275,1554855475,0.2205,74848625),(28675,1554855475,34.1073,82946781),(10076,1554855476,0.7324,78334669),(23276,1554855476,0.3140,78401847),(23277,1554855477,1.7977,79060756),(10077,1554855477,0.0000,81969608),(28498,1554855478,0.0000,83535119),(10078,1554855478,0.0499,83944081),(28619,1554855479,0.0000,86192194),(28500,1554855480,0.0000,86038280),(28620,1554855480,0.0000,87105036),(28621,1554855481,0.0000,87759684),(28623,1554855483,0.0000,89645748),(28624,1554855484,0.0000,90838580),(28625,1554855485,99.8660,91652925),(28626,1554855486,0.0000,92789100),(28627,1554855487,0.0503,93713817),(28628,1554855488,0.0000,94423614),(28629,1554855489,0.0000,95093084),(28630,1554855490,0.0000,96041815),(28631,1554855491,0.0503,107577540),(28632,1554855492,0.0168,100552754),(23295,1554855495,0.0700,103573416),(28636,1554855496,99.8713,106253245),(23296,1554855496,0.1000,106407494),(23297,1554855497,0.0500,107227243),(23299,1554855499,97.1170,109947975),(23300,1554855500,0.0000,111747826),(23301,1554855501,1.4918,112583999),(23302,1554855502,0.0000,114186501),(23303,1554855503,0.0671,115138966),(23664,1554855504,0.0000,115540510),(23304,1554855504,0.0000,116177915),(23305,1554855505,0.2347,117211025),(23306,1554855506,1.0899,118110291),(23310,1554855510,99.9686,121011880),(23252,1554855512,0.0000,122489242),(23253,1554855513,0.0169,122856246),(28653,1554855513,98.8285,125622307),(28654,1554855514,99.9367,126647311),(23255,1554855515,0.0000,126802495),(23256,1554855516,0.0508,127960726),(23257,1554855517,0.4108,128404271),(28657,1554855517,76.0880,130708844),(23258,1554855518,0.0000,131903434),(28658,1554855518,84.0418,132149676),(23259,1554855519,0.0169,132647833),(23620,1554855520,0.5018,133136847),(23260,1554855520,0.0000,133204944),(23264,1554855524,0.0474,135227440),(23625,1554855525,5.7429,137200191),(23265,1554855525,0.0000,137339312),(23266,1554855526,0.0000,137530388),(25667,1554855527,0.0000,138626833),(23268,1554855528,0.0000,139487645),(25668,1554855528,0.0000,139916138),(23628,1554855528,0.0000,139960093),(23269,1554855529,0.0000,141260901),(23270,1554855530,0.0000,141792623),(25371,1554855531,0.0507,143098559),(23273,1554855533,3.9740,145528102),(10073,1554855533,1.0987,145592749),(28673,1554855533,74.2076,148430070),(23274,1554855534,0.0000,146225977),(10074,1554855534,0.0000,146289769),(23275,1554855535,0.2205,146991945),(10075,1554855535,0.0000,147290967),(28675,1554855535,34.1073,155165375),(23276,1554855536,0.3140,149080012),(10076,1554855536,0.6992,149143427),(23277,1554855537,1.7979,150326466),(10077,1554855537,0.0000,150383618),(10078,1554855538,0.0166,153918606),(28498,1554855538,0.0000,154267238),(28619,1554855539,0.0000,156170058),(28500,1554855540,0.0000,155702415),(28620,1554855540,0.0000,157657740),(28621,1554855541,0.0000,157959457),(28623,1554855543,0.0000,158893377),(28624,1554855544,0.0000,159659427),(28625,1554855545,99.9161,160335670),(28626,1554855546,0.0000,160883134),(28627,1554855547,0.0000,162628162),(28628,1554855548,0.0000,162877594),(28629,1554855549,0.0000,163461547),(28630,1554855550,0.0000,164195358),(28631,1554855551,0.0336,174909287),(28632,1554855552,0.0503,165834339),(23295,1554855555,0.0600,174188930),(23296,1554855556,0.0400,176109683),(28636,1554855556,99.8713,177021078),(23297,1554855557,0.0400,176638040),(23299,1554855559,98.0382,177822431),(23300,1554855560,0.0000,179029985),(23301,1554855561,0.6539,179796660),(23302,1554855562,0.0000,180941624),(23303,1554855563,0.0335,181269443),(23664,1554855564,0.0000,181840684),(23304,1554855564,0.0000,182524396),(23305,1554855565,0.2346,183343160),(23306,1554855566,1.0727,184051437),(23310,1554855570,99.9686,185866692),(23252,1554855572,0.0000,187532092),(23253,1554855573,0.0339,188316383),(28653,1554855573,98.8285,190572073),(28654,1554855574,99.9367,194802552),(23255,1554855575,0.0000,189822693),(23256,1554855576,0.0339,193856819),(23257,1554855577,0.1100,194574824),(28657,1554855577,76.0880,196906777),(23258,1554855578,0.0000,195531368),(28658,1554855578,84.0418,197788577),(23259,1554855579,0.0169,196058658),(23260,1554855580,0.0000,196431258),(23620,1554855580,0.4987,196497754),(23264,1554855584,0.0689,200925097),(23625,1554855585,5.6772,201764603),(23265,1554855585,0.0000,202229547),(23266,1554855586,0.0000,202708997),(25667,1554855587,0.0000,203838260),(23628,1554855588,0.0000,204045955),(25668,1554855588,0.0000,204116977),(23268,1554855588,0.0000,204516151),(23269,1554855589,0.0000,205590478),(23270,1554855590,0.0000,206091803),(25371,1554855591,0.0677,207351668),(10073,1554855593,1.0988,208920852),(23273,1554855593,3.9740,209334567),(28673,1554855593,74.2076,212212079),(10074,1554855594,0.0000,210300786),(23274,1554855594,0.0000,210434057),(10075,1554855595,0.0000,211070775),(23275,1554855595,0.2205,211928314),(28675,1554855595,34.1073,219726209),(23276,1554855596,0.3140,212847534),(10076,1554855596,0.6660,212912565),(23277,1554855597,1.7648,213824059),(10077,1554855597,0.0000,214129600),(10078,1554855598,0.0000,214499028),(28498,1554855598,0.0000,217646785),(28619,1554855599,0.0000,219388648),(28500,1554855600,0.0000,219869594),(28620,1554855600,0.0000,220202115),(28621,1554855601,0.0000,220928165),(28623,1554855603,0.0000,222478587),(28624,1554855604,0.0000,223099845),(28625,1554855605,99.8658,224843329),(28626,1554855606,0.0000,225209856),(28627,1554855607,0.0335,226265073),(28628,1554855608,0.0000,227226145),(28629,1554855609,0.0168,227684560),(28630,1554855610,0.0000,228361197),(28631,1554855611,0.0503,239803212),(28632,1554855612,0.0503,242862792),(23295,1554855615,0.0500,243343558),(23296,1554855616,0.0100,243420000),(28636,1554855616,99.8713,244959275),(23297,1554855617,0.0400,244529144),(23299,1554855619,98.1730,245526841),(23300,1554855620,0.0000,247301567),(23301,1554855621,0.5028,247339824),(23302,1554855622,0.0000,249072907),(23303,1554855623,0.0335,249097385),(23664,1554855624,0.0000,249764915),(23304,1554855624,0.0000,250367600),(23305,1554855625,0.2179,251156898),(23306,1554855626,1.0560,252195978),(23310,1554855630,99.9686,255363050),(23252,1554855632,0.0000,256418096),(23253,1554855633,0.0339,256718227),(28653,1554855633,98.8285,258908386),(28654,1554855634,99.9367,259260033),(23255,1554855635,0.0000,259935716),(23256,1554855636,0.0339,260666878),(23257,1554855637,0.1402,262707423),(28657,1554855637,76.0880,264855171),(23258,1554855638,0.0000,265716684),(28658,1554855638,84.0418,267701293),(23259,1554855639,0.0169,266479171),(23260,1554855640,0.0000,266836446),(23620,1554855640,0.4939,266894096),(23264,1554855644,0.0440,271587032),(23265,1554855645,0.0000,272633934),(23625,1554855645,5.6600,272904015),(23266,1554855646,0.0000,273722190),(25667,1554855647,0.0000,274360907),(25668,1554855648,0.0000,275264915),(23268,1554855648,0.0000,275667222),(23628,1554855648,0.0000,275709851),(23269,1554855649,0.0000,276624974),(23270,1554855650,0.0000,277695224),(25371,1554855651,0.0169,279129041),(10073,1554855653,1.0987,281397267),(23273,1554855653,3.9740,281455503),(28673,1554855653,74.2076,284273005),(10074,1554855654,0.0000,282562765),(23274,1554855654,0.0000,282619326),(23275,1554855655,0.2205,282911498),(10075,1554855655,0.0000,282967004),(28675,1554855655,34.1073,290847069),(10076,1554855656,0.6659,284562972),(23276,1554855656,0.3140,284623382),(23277,1554855657,1.7645,286212682),(10077,1554855657,0.0000,286269706),(28498,1554855658,0.0000,287448614),(10078,1554855658,0.0000,288492174),(28619,1554855659,0.0000,291059248),(28500,1554855660,0.0000,298306577),(28620,1554855660,0.0500,309173249),(28621,1554855661,0.0100,300495743),(28623,1554855663,0.0000,301861515),(28624,1554855664,0.0000,302457958),(28625,1554855665,99.7989,303638967),(28626,1554855666,0.0000,304684832),(28627,1554855667,0.0670,305544609),(28628,1554855668,0.0000,306449309),(28629,1554855669,0.0168,307681757),(28630,1554855670,0.0000,331859230),(28631,1554855671,0.0335,322475371),(28632,1554855672,0.0670,316157228),(23295,1554855675,0.0500,319646501),(23296,1554855676,0.0000,323913476),(28636,1554855676,99.8713,324152050),(23297,1554855677,0.0300,324531757),(23299,1554855679,98.3406,327041794),(23300,1554855680,0.0000,335083400),(23301,1554855681,0.5029,335251600),(23302,1554855682,0.0000,335948831),(23303,1554855683,0.0670,337700504),(23664,1554855684,0.0000,338754842),(23304,1554855684,0.0000,339287978),(23305,1554855685,0.2179,340474446),(23306,1554855686,0.8884,341445268),(23310,1554855690,99.9686,347687160),(23252,1554855692,0.0000,348241726),(23253,1554855693,0.0339,349096038),(28653,1554855693,98.8285,351291785),(28654,1554855694,99.9367,353146175),(23255,1554855695,0.0000,352335470),(23256,1554855696,0.0000,355296054),(23257,1554855697,0.1071,356259010),(28657,1554855697,76.0880,358423807),(23258,1554855698,0.0000,356819447),(28658,1554855698,84.0418,358841174),(23259,1554855699,0.0169,357417264),(23620,1554855700,0.4867,359547184),(23260,1554855700,0.0000,359595683),(23264,1554855704,0.0575,362972921),(23625,1554855705,5.6581,364080843),(23265,1554855705,0.0000,364156757),(23266,1554855706,0.0000,365022615),(25667,1554855707,0.0000,365739394),(23268,1554855708,0.0000,366662019),(23628,1554855708,0.0000,366947736),(25668,1554855708,0.0000,366989758),(23269,1554855709,0.0000,367655006),(23270,1554855710,0.0000,369050303),(25371,1554855711,0.0000,371666205),(10073,1554855713,1.0983,374171809),(23273,1554855713,3.9740,374231355),(28673,1554855713,74.2076,376954736),(10074,1554855714,0.0000,375107361),(23274,1554855714,0.0000,375164839),(28675,1554855715,34.1073,379509352),(10075,1554855715,0.0000,379584495),(23275,1554855715,0.2205,379617558),(10076,1554855716,0.6656,380909283),(23276,1554855716,0.3140,380963824),(23277,1554855717,1.7639,381461345),(10077,1554855717,0.0000,381874671),(10078,1554855718,0.0000,383609087),(28498,1554855718,0.0000,385003849),(28619,1554855719,0.0000,387561623),(28500,1554855720,0.0000,387917443),(28620,1554855720,0.0200,388563968),(28621,1554855721,0.0100,389020968),(28623,1554855723,0.0000,390245522),(28624,1554855724,0.0000,390619581),(28625,1554855725,99.9162,391887782),(28626,1554855726,0.0000,392509685),(28627,1554855727,0.0335,393448457),(28628,1554855728,0.0000,393878392),(28629,1554855729,0.0000,394880299),(28630,1554855730,0.0000,395184991),(28631,1554855731,0.0503,406839698),(28632,1554855732,0.0335,399940423),(23295,1554855735,0.0500,406151334),(23296,1554855736,0.0000,408705051),(28636,1554855736,99.8713,409014471),(23297,1554855737,0.0200,409301033),(23299,1554855739,98.5415,411029253),(23300,1554855740,0.0000,411173319),(23301,1554855741,0.3017,412209001),(23302,1554855742,0.0000,413902430),(23303,1554855743,0.0503,414714285),(23664,1554855744,0.0000,415315534),(23304,1554855744,0.0000,415951739),(23305,1554855745,0.2012,416455404),(23306,1554855746,0.9220,417818104),(23310,1554855750,99.9686,420379755),(23252,1554855752,0.0000,421772625),(23253,1554855753,0.0339,423002039),(28653,1554855753,98.8285,425306739),(28654,1554855754,99.9367,429324700),(23255,1554855755,0.0000,425828283),(23256,1554855756,0.0339,426686168),(23257,1554855757,0.1184,429521543),(28657,1554855757,76.0880,431705320),(23258,1554855758,0.0000,430704495),(28658,1554855758,84.0418,432954248),(23259,1554855759,0.0000,431394606),(23260,1554855760,0.0000,431630397),(23620,1554855760,0.4701,431685693),(23264,1554855764,0.0305,436140457),(23625,1554855765,5.5433,437028896),(23265,1554855765,0.0000,437089306),(23266,1554855766,0.0000,437667152),(25667,1554855767,0.0000,438896131),(23628,1554855768,0.0000,439300843),(25668,1554855768,0.0000,439363471),(23268,1554855768,0.0000,439393574),(23269,1554855769,0.0000,440479817),(23270,1554855770,0.0000,441278500),(25371,1554855771,0.0000,442113771),(10073,1554855773,1.0987,444173212),(23273,1554855773,3.9740,444233399),(28673,1554855773,74.2076,447113055),(23274,1554855774,0.0000,444790810),(10074,1554855774,0.0000,444851816),(10075,1554855775,0.0000,445641341),(23275,1554855775,0.2205,446400246),(28675,1554855775,34.1073,453735606),(10076,1554855776,0.6659,447232505),(23276,1554855776,0.3140,447296616),(23277,1554855777,1.7647,449320072),(10077,1554855777,0.0000,449378509),(10078,1554855778,0.0166,452791706),(28498,1554855778,0.0000,453022981),(28619,1554855779,0.0000,455651265),(28500,1554855780,0.0000,454496765),(28620,1554855780,0.0000,456088456),(28621,1554855781,0.0000,457570781),(28623,1554855783,0.0000,459103358),(28624,1554855784,0.0000,459783016),(28625,1554855785,99.8660,461376513),(28626,1554855786,0.0000,461753493),(28627,1554855787,0.0000,463222130),(28628,1554855788,0.0000,464409607),(28629,1554855789,0.0335,465011216),(28630,1554855790,0.0000,466249963),(28631,1554855791,0.0502,477070915),(28632,1554855792,0.0335,470067425),(23295,1554855795,0.0500,474569093),(23296,1554855796,0.0000,476475520),(28636,1554855796,99.8713,477357594),(23297,1554855797,0.0200,477903937),(23299,1554855799,98.2565,479551321),(23300,1554855800,0.0000,481328761),(23301,1554855801,0.5363,481302825),(23302,1554855802,0.0000,483190202),(23303,1554855803,0.0335,484089723),(23664,1554855804,0.0000,484396091),(23304,1554855804,0.0000,485020564),(23305,1554855805,0.2515,485299270),(23306,1554855806,1.0560,486103533),(23310,1554855810,99.9686,488105804),(23252,1554855812,0.0000,489360029),(23253,1554855813,0.0339,489965987),(28653,1554855813,98.8285,492164524),(28654,1554855814,99.9367,494988016),(23255,1554855815,0.0000,493246692),(23256,1554855816,0.0000,495872553),(23257,1554855817,0.1775,496717003),(28657,1554855817,76.0880,498661695),(23258,1554855818,0.0000,497398510),(28658,1554855818,84.0418,499427989),(23259,1554855819,0.0169,498288155),(23620,1554855820,0.4747,498723659),(23260,1554855820,0.0000,498787511),(23264,1554855824,0.0576,504206379),(23625,1554855825,5.5271,505187209),(23265,1554855825,0.0000,505253166),(23266,1554855826,0.0000,506412509),(25667,1554855827,0.0000,507154965),(25668,1554855828,0.0000,507483739),(23268,1554855828,0.0000,507548230),(23628,1554855828,0.0000,507847105),(23269,1554855829,0.0000,508093600),(23270,1554855830,0.0000,509591821),(25371,1554855831,0.0000,510793815),(10073,1554855833,1.0987,512539178),(23273,1554855833,3.9740,512601838),(28673,1554855833,74.2076,515938750),(10074,1554855834,0.0000,513675644),(23274,1554855834,0.0000,513735171),(23275,1554855835,0.2205,514003936),(10075,1554855835,0.0000,514934627),(28675,1554855835,34.1073,522024992),(10076,1554855836,0.6659,515246050),(23276,1554855836,0.3140,517133845),(23277,1554855837,1.7646,518013606),(10077,1554855837,0.0000,518391414),(10078,1554855838,0.0166,519432055),(28498,1554855838,0.0000,521052611),(28619,1554855839,0.0000,523812130),(28500,1554855840,0.0000,524478664),(28620,1554855840,0.0000,525209600),(28621,1554855841,0.0000,525883985),(28623,1554855843,0.0000,526971382),(28624,1554855844,0.0000,527621459),(28625,1554855845,99.8995,529269333),(28626,1554855846,0.0000,530565841),(28627,1554855847,0.0167,531554560),(28628,1554855848,0.0000,532733016),(28629,1554855849,0.0335,533974858),(28630,1554855850,0.0000,534876334),(28631,1554855851,0.0168,545723091),(28632,1554855852,0.0168,538621201),(23295,1554855855,0.0500,545036253),(23296,1554855856,0.0000,546137625),(28636,1554855856,99.8713,547893686),(23297,1554855857,0.0100,547883406),(23299,1554855859,97.4690,550056347),(23300,1554855860,0.0000,551718533),(23301,1554855861,1.2072,551867357),(23302,1554855862,0.0000,553562829),(23303,1554855863,0.0503,554009255),(23664,1554855864,0.0000,554599650),(23304,1554855864,0.0000,555198200),(23305,1554855865,0.2011,556190129),(23306,1554855866,0.9053,557252873),(23310,1554855870,99.9686,559125866),(23252,1554855872,0.0000,560492724),(23253,1554855873,0.0169,561858124),(28653,1554855873,98.8285,563428673),(28654,1554855874,99.9367,565020753),(23255,1554855875,0.0000,563543206),(23256,1554855876,0.0169,564051511),(23257,1554855877,0.0804,566354609),(28657,1554855877,76.0880,568572785),(23258,1554855878,0.0000,567918245),(28658,1554855878,84.0418,569944061),(23259,1554855879,0.0000,568804436),(23260,1554855880,0.0000,569810116),(23620,1554855880,0.4745,569868847),(23264,1554855884,0.0474,573804020),(23265,1554855885,0.0000,574193380),(23625,1554855885,5.5269,574536362),(23266,1554855886,0.0000,575406811),(25667,1554855887,0.0000,576518424),(25668,1554855888,0.0000,577412568),(23628,1554855888,0.0000,577475599),(23268,1554855888,0.0000,577505410),(23269,1554855889,0.0000,578435361),(23270,1554855890,0.0000,579239294),(25371,1554855891,0.0000,580527532),(23273,1554855893,3.9740,582533742),(10073,1554855893,1.0987,582593294),(28673,1554855893,74.2076,585690900),(10074,1554855894,0.0000,583244002),(23274,1554855894,0.0000,583608881),(10075,1554855895,0.0000,584061881),(23275,1554855895,0.2205,584367969),(28675,1554855895,34.1073,592033783),(23276,1554855896,0.3140,587094018),(10076,1554855896,0.6659,587154443),(23277,1554855897,1.7646,588233505),(10077,1554855897,0.0000,588294484),(28498,1554855898,0.0000,589278949),(10078,1554855898,0.0000,589596503),(28619,1554855899,0.0000,592923402),(28500,1554855900,0.0000,593136117),(28620,1554855900,0.0000,593790151),(28621,1554855901,0.0000,594940106),(28623,1554855903,0.0000,597111124),(28624,1554855904,0.0000,597507521),(28625,1554855905,99.8828,597997366),(28626,1554855906,0.0000,599435504),(28627,1554855907,0.0000,600254220),(28628,1554855908,0.0000,600943487),(28629,1554855909,0.0167,601613335),(28630,1554855910,0.0000,602456351),(28631,1554855911,0.0335,613479835),(28632,1554855912,0.0670,604356557),(23295,1554855915,0.0500,613946438),(23296,1554855916,0.0000,615837423),(28636,1554855916,99.8713,616536474),(23297,1554855917,0.0100,616296932),(23299,1554855919,98.4582,618315107),(23300,1554855920,0.0000,619685428),(23301,1554855921,0.4190,620070288),(23302,1554855922,0.0000,621369127),(23303,1554855923,0.0335,622841481),(23664,1554855924,0.0000,623586709),(23304,1554855924,0.0000,624242948),(23305,1554855925,0.2179,625218814),(23306,1554855926,0.9050,626420464),(23310,1554855930,99.9686,629188387),(23252,1554855932,0.0000,630214723),(23253,1554855933,0.0169,631167526),(28653,1554855933,98.8285,633513161),(28654,1554855934,99.9367,638663031),(23255,1554855935,0.0000,633978924),(23256,1554855936,0.0000,637426764),(23257,1554855937,0.1232,638314398),(28657,1554855937,76.0880,640568531),(23258,1554855938,0.0000,639150862),(28658,1554855938,84.0418,641469028),(23259,1554855939,0.0169,640083490),(23620,1554855940,0.4693,640938776),(23260,1554855940,0.0000,641002527),(23264,1554855944,0.0609,646555845),(23265,1554855945,0.0000,647721093),(23625,1554855945,5.5266,648025317),(23266,1554855946,0.0000,649056822),(25667,1554855947,0.0000,649581234),(23628,1554855948,0.0000,650866319),(23268,1554855948,0.0000,651197508),(25668,1554855948,0.0056,651241850),(23269,1554855949,0.0000,651993863),(23270,1554855950,0.0000,652621549),(25371,1554855951,0.0000,653568431),(10073,1554855953,1.0986,656600103),(23273,1554855953,3.9740,656662282),(28673,1554855953,74.2076,659591281),(23274,1554855954,0.0000,657693674),(10074,1554855954,0.0000,657753156),(23275,1554855955,0.2205,658187352),(10075,1554855955,0.0000,659631450),(28675,1554855955,34.1073,666319725),(23276,1554855956,0.3140,660293476),(10076,1554855956,0.6659,660363598),(23277,1554855957,1.7645,662659332),(10077,1554855957,0.0000,662720358),(10078,1554855958,0.0000,664552507),(28498,1554855958,0.0000,665529695),(28619,1554855959,0.0000,667966464),(28500,1554855960,0.0000,668168518),(28620,1554855960,0.0000,668845356),(28621,1554855961,0.0000,670733663),(28623,1554855963,0.0000,672007918),(28624,1554855964,0.0000,672753193),(28625,1554855965,99.9162,673769268),(28626,1554855966,0.0000,674413032),(28627,1554855967,0.0000,674971870),(28628,1554855968,0.0000,676728427),(28629,1554855969,0.0168,677610781),(28630,1554855970,0.0000,677996346),(28631,1554855971,0.0503,689699784),(28632,1554855972,0.0168,693125960),(23295,1554855975,0.0500,694249593),(23296,1554855976,0.0000,696507058),(28636,1554855976,99.8713,697038704),(23297,1554855977,0.0100,697019881),(23299,1554855979,96.5644,698370662),(23300,1554855980,0.0000,699659102),(23301,1554855981,0.5028,699858965),(23302,1554855982,0.0000,701801818),(23303,1554855983,0.0670,702019052),(23664,1554855984,0.0000,703358423),(23304,1554855984,0.0000,703940787),(23305,1554855985,0.4022,704867984),(23306,1554855986,2.8150,705909861),(23310,1554855990,99.9686,709089285),(23252,1554855992,0.0000,710299149),(23253,1554855993,0.0169,711678616),(28653,1554855993,98.8285,713985484),(28654,1554855994,99.9367,718879803),(23255,1554855995,0.0000,718076911),(23256,1554855996,0.0000,721051865),(23257,1554855997,0.1184,722359720),(28657,1554855997,76.0880,748274948),(23258,1554855998,0.0000,723673694),(28658,1554855998,84.0418,725660218),(23259,1554855999,0.0169,724324204),(23260,1554856000,0.0000,725616992),(23620,1554856000,0.4689,725683933),(23264,1554856004,0.0508,729408695),(23265,1554856005,0.0000,730298271),(23625,1554856005,5.5258,730363404),(23266,1554856006,0.0000,730984074),(25667,1554856007,0.0169,732191040),(25668,1554856008,0.0000,733324956),(23268,1554856008,0.0000,733395481),(23628,1554856008,0.0000,733427441),(23269,1554856009,0.0000,735055309),(23270,1554856010,0.0000,735962577),(25371,1554856011,0.0000,737700805),(10073,1554856013,1.0985,739784660),(23273,1554856013,3.9740,739846156),(28673,1554856013,74.2076,743349308),(23274,1554856014,0.0000,740223077),(10074,1554856014,0.0000,740652718),(10075,1554856015,0.0000,741338988),(23275,1554856015,0.2217,744206735),(28675,1554856015,34.1073,749441263),(10076,1554856016,0.6657,745152978),(23276,1554856016,0.3140,745216634),(23277,1554856017,1.7642,745879278),(10077,1554856017,0.0000,748754311),(10078,1554856018,0.0000,750612947),(28498,1554856018,0.0000,752370685),(28619,1554856019,0.0000,753501914),(28500,1554856020,0.0000,753992149),(28620,1554856020,0.0000,755062501),(28621,1554856021,0.0000,755591225),(28623,1554856023,0.0000,757836907),(28624,1554856024,0.0000,758403186),(28625,1554856025,99.8994,759484174),(28626,1554856026,0.0000,759947557),(28627,1554856027,0.0000,761219511),(28628,1554856028,0.0000,762863041),(28629,1554856029,0.0168,763578393),(28630,1554856030,0.0000,764372619),(28631,1554856031,0.0503,775721985),(28632,1554856032,0.0670,769158600),(23295,1554856035,0.0500,773788776),(23296,1554856036,0.0000,777990413),(28636,1554856036,99.8713,778345543),(23297,1554856037,0.0100,778852645),(23299,1554856039,93.3970,780808300),(23300,1554856040,0.0000,781764127),(23301,1554856041,0.6870,782423855),(23302,1554856042,0.0000,783533940),(23303,1554856043,0.1006,783914909),(23664,1554856044,0.0000,784305525),(23304,1554856044,0.0000,784903294),(23305,1554856045,0.6368,785533733),(23306,1554856046,4.6757,786496189),(23310,1554856050,99.9686,790021235),(23252,1554856052,0.0000,791353158),(23253,1554856053,0.0169,791862715),(28653,1554856053,98.8285,794183469),(28654,1554856054,99.9367,798871591),(23255,1554856055,0.0000,793740070),(23256,1554856056,0.0339,797806821),(23257,1554856057,0.1100,798423871),(28657,1554856057,76.0880,800665286),(23258,1554856058,0.0000,799804464),(28658,1554856058,84.0418,801804861),(23259,1554856059,0.0169,800296501),(23620,1554856060,0.4688,800909617),(23260,1554856060,0.0000,800973635),(23264,1554856064,0.0576,807267052),(23265,1554856065,0.0000,808562629),(23625,1554856065,5.3763,808622861),(23266,1554856066,0.0000,809413068),(25667,1554856067,0.0000,810639620),(23268,1554856068,0.0000,811022812),(25668,1554856068,0.0000,811096849),(23628,1554856068,0.0000,811924208),(23269,1554856069,0.0000,812856127),(23270,1554856070,0.0000,813285446),(25371,1554856071,0.0172,814619099),(23273,1554856073,3.9740,816681844),(10073,1554856073,1.0986,817011342),(28673,1554856073,74.2076,820484614),(10074,1554856074,0.0000,817939538),(23274,1554856074,0.0000,818001797),(23275,1554856075,0.2205,821855837),(10075,1554856075,0.0000,828231014),(28675,1554856075,34.1073,829621938),(10076,1554856076,0.7157,829294668),(23276,1554856076,0.3140,829358784),(10077,1554856077,0.0000,830275209),(23277,1554856077,1.8141,830336985),(28498,1554856078,0.0000,832075199),(10078,1554856078,0.0499,833861219),(28619,1554856079,0.0000,836578885),(28500,1554856080,0.0000,837329001),(28620,1554856080,0.0000,837627444),(28621,1554856081,0.0000,839865744),(28623,1554856083,0.0000,842591341),(28624,1554856084,0.0000,843105245),(28625,1554856085,99.8493,844000058),(28626,1554856086,0.0000,845041783),(28627,1554856087,0.0000,846402825),(28628,1554856088,0.0000,847265166),(28629,1554856089,0.0167,848615042),(28630,1554856090,0.0000,849923007),(28631,1554856091,0.0837,861266910),(28632,1554856092,0.0335,864910978),(23295,1554856095,0.0500,867229426),(23296,1554856096,0.0500,868461587),(28636,1554856096,99.8713,869489225),(23297,1554856097,0.0300,869173558),(23299,1554856099,96.4795,871019481),(23300,1554856100,0.0000,872422373),(23301,1554856101,0.6370,873450544),(23302,1554856102,0.0000,875088181),(23303,1554856103,0.0503,875415840),(23664,1554856104,0.0000,876139719),(23304,1554856104,0.0000,876734440),(23305,1554856105,0.4359,877695409),(23306,1554856106,2.5310,877982576),(23310,1554856110,99.9686,881928813),(23252,1554856112,0.0000,883430308),(23253,1554856113,0.0169,885000260),(28653,1554856113,98.8285,887839856),(28654,1554856114,99.9367,891813718),(23255,1554856115,0.0000,886928363),(23256,1554856116,0.0169,889495397),(23257,1554856117,0.1944,891255303),(28657,1554856117,76.0880,893419529),(23258,1554856118,0.0000,893605162),(28658,1554856118,84.0418,895831870),(23259,1554856119,0.0508,894577251),(23620,1554856120,0.4741,895650287),(23260,1554856120,0.0000,895708797),(23264,1554856124,0.0677,900821443),(23265,1554856125,0.0000,901278401),(23625,1554856125,5.3750,901654814),(23266,1554856126,0.0000,902494069),(25667,1554856127,0.0000,903646306),(25668,1554856128,0.0000,904386815),(23628,1554856128,0.0000,904432390),(23268,1554856128,0.0000,904462103),(23269,1554856129,0.0000,905715460),(23270,1554856130,0.0000,907078269),(25371,1554856131,0.0000,907378239),(23273,1554856133,3.9640,909331706),(10073,1554856133,1.0983,909394960),(28673,1554856133,74.2076,912785709),(23274,1554856134,0.0000,909919784),(10074,1554856134,0.0666,909989984),(10075,1554856135,0.0000,911434864),(23275,1554856135,0.2205,911718614),(28675,1554856135,34.1073,919423931),(10076,1554856136,0.7822,915209606),(23276,1554856136,0.3140,915271757),(10077,1554856137,0.0000,915408502),(23277,1554856137,1.9472,915468476),(10078,1554856138,0.0166,916181821),(28498,1554856138,0.0000,917433363),(28619,1554856139,0.0000,919877073),(28500,1554856140,0.0000,920232535),(28620,1554856140,0.0000,921582180),(28621,1554856141,0.0000,923175718),(28623,1554856143,0.0000,925029523),(28624,1554856144,0.0000,925588027),(28625,1554856145,99.8659,926126564),(28626,1554856146,0.0000,942258156),(28627,1554856147,0.0000,929200822),(28628,1554856148,0.0000,940624767),(28629,1554856149,0.0000,931374042),(28630,1554856150,0.0000,931955445),(28631,1554856151,0.0503,932424855),(28632,1554856152,0.0670,936932844),(23295,1554856155,0.0600,949488197),(23296,1554856156,0.1600,949764934),(28636,1554856156,99.8713,951429868),(23297,1554856157,0.0700,950854565),(23299,1554856159,93.0104,952043306),(23300,1554856160,0.0000,953939685),(23301,1554856161,2.3135,954448576),(23302,1554856162,0.0000,956092619),(23303,1554856163,0.0838,956769257),(23664,1554856164,0.0000,957899596),(23304,1554856164,0.0000,958482563),(23305,1554856165,0.6705,959564685),(23306,1554856166,4.8298,960583571),(23310,1554856170,99.9686,964315360),(23252,1554856172,0.0000,965434769),(23253,1554856173,0.0169,966560102),(28653,1554856173,98.8285,968838309),(28654,1554856174,99.9367,969355677),(23255,1554856175,0.0000,969746938),(23256,1554856176,0.0339,971323237),(23257,1554856177,0.5478,972301268),(28657,1554856177,76.0880,974495899),(23258,1554856178,0.0000,975544659),(28658,1554856178,84.0418,975919835),(23259,1554856179,0.0169,976005503),(23260,1554856180,0.0000,979741338),(23620,1554856180,0.4747,979795369),(23264,1554856184,0.0542,982361569),(23625,1554856185,5.1928,985030189),(23265,1554856185,0.0000,985406138),(23266,1554856186,0.0000,986006811),(25667,1554856187,0.0000,986474629),(23268,1554856188,0.0000,987469192),(23628,1554856188,0.0000,987531087),(25668,1554856188,0.0000,987563887),(23269,1554856189,0.0000,988916794),(23270,1554856190,0.0000,993470577),(25371,1554856191,0.0169,3753091),(10073,1554856193,1.1168,9405324),(23273,1554856193,3.9640,9458046),(28673,1554856193,74.2076,18190969),(10074,1554856194,0.0000,10505961),(23274,1554856194,0.0003,14043646),(28675,1554856195,34.1073,18139173),(23275,1554856195,0.2205,18218671),(10075,1554856195,0.0000,18250225),(10076,1554856196,0.6768,20259676),(23276,1554856196,0.3140,23886086),(10077,1554856197,0.0000,24355007),(23277,1554856197,1.7933,24408722),(28498,1554856198,0.0000,27666239),(10078,1554856198,0.0000,27976533),(28619,1554856199,0.0000,30747265),(28620,1554856200,0.0000,31532793),(28500,1554856200,0.0000,32033867),(28621,1554856201,0.0000,33597963),(28623,1554856203,0.0000,36571791),(28624,1554856204,0.0000,38073515),(28625,1554856205,99.9162,38658933),(28626,1554856206,0.0000,40613440),(28627,1554856207,0.0000,2466020),(28628,1554856208,0.0000,2616942),(28629,1554856209,0.0335,4435773),(28630,1554856210,0.0000,5604675),(28631,1554856211,0.0335,16979236),(28632,1554856212,0.0335,16812823),(23295,1554856215,0.0800,19359071),(23296,1554856216,0.3300,21042349),(28636,1554856216,99.8713,22096058),(23297,1554856217,0.1300,22353631),(23299,1554856219,92.6584,24375536),(23300,1554856220,0.0000,26004050),(23301,1554856221,1.3244,27491590),(23302,1554856222,0.0000,29072824),(23303,1554856223,0.0671,30402439),(23664,1554856224,0.0000,31480827),(23304,1554856224,0.0000,32041328),(23305,1554856225,0.6203,32392422),(23306,1554856226,4.7124,33540566),(23310,1554856230,99.9686,36371514),(23252,1554856232,0.0000,37478817),(23253,1554856233,0.0344,38535962),(28653,1554856233,98.8285,40923052),(28654,1554856234,99.9367,41793954),(23255,1554856235,0.0000,42971211),(23256,1554856236,0.0169,44414989),(23257,1554856237,0.1691,47428210),(28657,1554856237,76.0880,49507244),(23258,1554856238,0.0000,48505553),(28658,1554856238,84.0418,50693620),(23259,1554856239,0.0339,51486558),(23620,1554856240,0.4766,52022628),(23260,1554856240,0.0000,52083465),(23264,1554856244,0.0542,56102084),(23625,1554856245,5.6541,57559712),(23265,1554856245,0.0000,57621735),(23266,1554856246,0.0000,58497432),(25667,1554856247,0.0000,59059553),(25668,1554856248,0.0000,60035182),(23628,1554856248,0.0000,60304281),(23268,1554856248,0.0000,60346525),(23269,1554856249,0.0000,61695817),(23270,1554856250,0.0000,61998666),(25371,1554856251,0.0000,63595068),(23273,1554856253,3.9640,66151458),(10073,1554856253,1.0990,66209230),(28673,1554856253,74.2076,68648849),(23274,1554856254,0.0000,66757335),(10074,1554856254,0.0000,67142656),(10075,1554856255,0.0000,67923184),(23275,1554856255,0.2205,68040803),(28675,1554856255,34.1073,76373763),(23276,1554856256,0.3140,69516069),(10076,1554856256,0.6661,71485409),(23277,1554856257,1.7652,73569586),(10077,1554856257,0.0000,73631232),(10078,1554856258,0.0000,74389381),(28498,1554856258,0.0000,76143331),(28619,1554856259,0.0000,78666870),(28500,1554856260,0.0000,78899750),(28620,1554856260,0.0000,80253416),(28621,1554856261,0.0000,80954444),(28623,1554856263,0.0000,82868908),(28624,1554856264,0.0000,83113311),(28625,1554856265,99.8660,84271729),(28626,1554856266,0.0000,85372583),(28627,1554856267,0.0168,86467500),(28628,1554856268,0.0000,87091494),(28629,1554856269,0.0168,87733991),(28630,1554856270,0.0000,89397952),(28631,1554856271,0.0503,100455693),(28632,1554856272,0.0503,103701162),(23295,1554856275,0.0700,104268172),(23296,1554856276,0.1200,105538451),(28636,1554856276,99.8713,105997514),(23297,1554856277,0.1100,105917246),(23299,1554856279,97.3009,108066471),(23300,1554856280,0.0000,109536952),(23301,1554856281,0.9722,109907580),(23302,1554856282,0.0000,111826057),(23303,1554856283,0.0503,111966943),(23664,1554856284,0.0000,113036179),(23304,1554856284,0.0000,113443184),(23305,1554856285,0.2179,114295517),(23306,1554856286,0.8716,114685018),(23310,1554856290,99.9686,117124152),(23252,1554856292,0.0000,119145148),(23253,1554856293,0.0169,120359722),(28653,1554856293,98.8285,122807868),(28654,1554856294,99.9367,126832674),(23255,1554856295,0.0000,121810333),(23256,1554856296,0.0339,122781828),(23257,1554856297,0.2366,126325900),(28657,1554856297,76.0880,128266743),(23258,1554856298,0.0000,127430048),(28658,1554856298,84.0418,129511350),(23259,1554856299,0.0000,128009295),(23620,1554856300,0.4815,129109157),(23260,1554856300,0.0000,129171740),(23264,1554856304,0.0508,134808152),(23265,1554856305,0.0000,135975347),(23625,1554856305,5.6759,136295826),(23266,1554856306,0.0000,136741857),(25667,1554856307,0.0169,137915352),(25668,1554856308,0.0000,138945435),(23628,1554856308,0.0000,139009430),(23268,1554856308,0.0000,139039619),(23269,1554856309,0.0000,139972629),(23270,1554856310,0.0000,141116159),(25371,1554856311,0.0000,142433899),(10073,1554856313,1.0986,144459752),(23273,1554856313,3.9640,144517377),(28673,1554856313,74.2076,147386483),(23274,1554856314,0.0000,145593323),(10074,1554856314,0.0000,145655098),(23275,1554856315,0.2205,146193499),(10075,1554856315,0.0000,146690930),(28675,1554856315,34.1073,154252108),(10076,1554856316,0.6658,149656611),(23276,1554856316,0.3140,149714564),(23277,1554856317,1.7644,150441254),(10077,1554856317,0.0000,150829794),(10078,1554856318,0.0000,151859945),(28498,1554856318,0.0000,152493511),(28619,1554856319,0.0000,155785916),(28500,1554856320,0.0000,156635594),(28620,1554856320,0.0000,156969353),(28621,1554856321,0.0000,158546893),(28623,1554856323,0.0000,161095775),(28624,1554856324,0.0000,161800757),(28625,1554856325,99.8995,162228262),(28626,1554856326,0.0000,163592766),(28627,1554856327,0.0000,164469711),(28628,1554856328,0.0000,164884865),(28629,1554856329,0.0335,166215145),(28630,1554856330,0.0000,167201428),(28631,1554856331,0.0167,178619442),(28632,1554856332,0.0335,171219712),(23295,1554856335,0.0700,177615813),(23296,1554856336,0.0400,178848465),(28636,1554856336,99.8713,180521649),(23297,1554856337,0.0900,180393048),(23299,1554856339,98.2900,181357450),(23300,1554856340,0.0000,183132624),(23301,1554856341,0.5701,183641264),(23302,1554856342,0.0000,185244688),(23303,1554856343,0.0503,185513836),(23664,1554856344,0.0000,186399436),(23304,1554856344,0.0000,187018052),(23305,1554856345,0.2347,188243173),(23306,1554856346,0.8884,188889956),(23310,1554856350,99.9686,192360411),(23252,1554856352,0.0000,194129283),(23253,1554856353,0.0169,194426921),(28653,1554856353,98.8285,196823317),(28654,1554856354,99.9367,198217243),(23255,1554856355,0.0000,198402886),(23256,1554856356,0.0339,199597378),(23257,1554856357,0.1783,200452451),(28657,1554856357,76.0880,202547688),(23258,1554856358,0.0000,201145741),(28658,1554856358,84.0418,203470936),(23259,1554856359,0.0169,201494136),(23260,1554856360,0.0000,202081129),(23620,1554856360,0.4810,202146158),(23264,1554856364,0.0474,206848614),(23625,1554856365,5.6765,208718554),(23265,1554856365,0.0000,208787202),(23266,1554856366,0.0000,209861092),(25667,1554856367,0.0169,210535185),(23268,1554856368,0.0000,211553131),(23628,1554856368,0.0000,211615190),(25668,1554856368,0.0000,211932207),(23269,1554856369,0.0000,212645919),(23270,1554856370,0.0000,213791017),(25371,1554856371,0.0169,216105276),(10073,1554856373,1.0987,218009809),(23273,1554856373,3.9640,218317310),(28673,1554856373,74.2076,221393468),(23274,1554856374,0.0000,219247871),(10074,1554856374,0.0000,219307688),(23275,1554856375,0.2205,219713136),(10075,1554856375,0.0000,219776343),(28675,1554856375,34.1073,227594050),(23276,1554856376,0.3140,223180674),(10076,1554856376,0.6659,223236296),(23277,1554856377,1.7645,224210758),(10077,1554856377,0.0000,224343955),(28498,1554856378,0.0000,226997737),(10078,1554856378,0.0166,227282689),(28619,1554856379,0.0000,229699992),(28500,1554856380,0.0000,229461258),(28620,1554856380,0.0000,231152843),(28621,1554856381,0.0000,232090274),(28623,1554856383,0.0000,233752486),(28624,1554856384,0.0000,234429528),(28625,1554856385,99.8660,235036083),(28626,1554856386,0.0000,236075039),(28627,1554856387,0.0000,237386363),(28628,1554856388,0.0000,237904859),(28629,1554856389,0.0168,238416004),(28630,1554856390,0.0000,238937734),(28631,1554856391,0.0503,250700760),(28632,1554856392,0.0670,253470561),(23295,1554856395,0.0600,255640390),(23296,1554856396,0.0200,257001558),(28636,1554856396,99.8713,258105073),(23297,1554856397,0.0700,256899532),(23299,1554856399,98.1565,259173889),(23300,1554856400,0.0000,260823047),(23301,1554856401,0.6367,260834693),(23302,1554856402,0.0000,261459648),(23303,1554856403,0.0503,262734667),(23664,1554856404,0.0000,263117889),(23304,1554856404,0.0000,263691019),(23305,1554856405,0.2179,264338838),(23306,1554856406,0.9385,265614789),(23310,1554856410,99.9686,268231895),(23252,1554856412,0.0000,269702557),(23253,1554856413,0.0339,270590951),(28653,1554856413,98.8285,272768385),(28654,1554856414,99.9367,276895461),(23255,1554856415,0.0000,272738008),(23256,1554856416,0.0339,273676620),(23257,1554856417,0.1311,276225071),(28657,1554856417,76.0880,278378495),(23258,1554856418,0.0000,278451444),(28658,1554856418,84.0418,280649203),(23259,1554856419,0.0000,279653691),(23620,1554856420,0.4764,280166790),(23260,1554856420,0.0000,280225624),(23264,1554856424,0.0542,284377621),(23265,1554856425,0.0000,285592548),(23625,1554856425,5.6594,285880352),(23266,1554856426,0.0000,286998147),(25667,1554856427,0.0169,288031782),(23628,1554856428,0.0000,288725167),(25668,1554856428,0.0000,288787513),(23268,1554856428,0.0000,288818278),(23269,1554856429,0.0000,289564524),(23270,1554856430,0.0000,290827520),(25371,1554856431,0.0000,291859135),(23273,1554856433,3.9640,293820082),(10073,1554856433,1.0986,293881828),(28673,1554856433,74.2076,297036748),(23274,1554856434,0.0000,294486287),(10074,1554856434,0.0000,294838207),(10075,1554856435,0.0000,296538700),(23275,1554856435,0.2205,296588303),(28675,1554856435,34.1073,304048600),(23276,1554856436,0.3140,296778893),(10076,1554856436,0.6659,296842518),(23277,1554856437,1.7645,298469939),(10077,1554856437,0.0000,298810546),(10078,1554856438,0.0166,300507401),(28498,1554856438,0.0000,301305337),(28619,1554856439,0.0000,304272077),(28500,1554856440,0.0000,303707049),(28620,1554856440,0.0000,305509835),(28621,1554856441,0.0000,306376911),(28623,1554856443,0.0000,307275099),(28624,1554856444,0.0000,308182743),(28625,1554856445,99.9330,309242510),(28626,1554856446,0.0000,309733513),(28627,1554856447,0.0000,311041439),(28628,1554856448,0.0000,311636857),(28629,1554856449,0.0168,312565443),(28630,1554856450,0.0000,313068005),(28631,1554856451,0.0503,324373229),(28632,1554856452,0.0168,317633013),(23295,1554856455,0.0600,324163631),(23296,1554856456,0.0100,325241200),(28636,1554856456,99.8713,326889770),(23297,1554856457,0.0600,327083416),(23299,1554856459,97.7383,328526511),(23300,1554856460,0.0000,329706744),(23301,1554856461,0.5194,330258470),(23302,1554856462,0.0000,332175350),(23303,1554856463,0.0503,332079997),(23304,1554856464,0.0000,332640976),(23664,1554856464,0.0000,332715290),(23305,1554856465,0.2681,333706448),(23306,1554856466,1.8435,336020666),(23310,1554856470,99.9686,337322019),(23252,1554856472,0.0000,338699580),(23253,1554856473,0.0339,340502875),(28653,1554856473,98.8285,342569557),(28654,1554856474,99.9367,343688731),(23255,1554856475,0.0000,343154510),(23256,1554856476,0.0000,346297666),(23257,1554856477,0.1226,346863796),(28657,1554856477,76.0880,349022764),(23258,1554856478,0.0000,348244072),(28658,1554856478,84.0418,350501369),(23259,1554856479,0.0000,349345314),(23620,1554856480,0.4802,350536634),(23260,1554856480,0.0000,350606921),(23264,1554856484,0.0508,355426721),(23625,1554856485,5.6600,356487064),(23265,1554856485,0.0000,356547760),(23266,1554856486,0.0000,357554071),(25667,1554856487,0.0000,357963104),(25668,1554856488,0.0000,358785581),(23268,1554856488,0.0000,358847073),(23628,1554856488,0.0000,358875635),(23269,1554856489,0.0034,359984508),(23270,1554856490,0.0000,360435016),(25371,1554856491,0.0169,361133903),(23273,1554856493,3.9640,364691597),(10073,1554856493,1.0987,364992671),(28673,1554856493,74.2076,368229552),(10074,1554856494,0.0000,365131531),(23274,1554856494,0.0000,365533369),(23275,1554856495,0.2205,366203135),(10075,1554856495,0.0000,366264137),(28675,1554856495,34.1073,373871039),(10076,1554856496,0.6659,367100062),(23276,1554856496,0.3140,367160741),(10077,1554856497,0.0000,369888837),(23277,1554856497,1.7646,369950311),(28498,1554856498,0.0000,371882238),(10078,1554856498,0.0000,371951937),(28619,1554856499,0.0000,375761981),(28500,1554856500,0.0000,375685840),(28620,1554856500,0.0000,376538890),(28621,1554856501,0.0000,377111659),(28623,1554856503,0.0000,379036093),(28624,1554856504,0.0000,381157306),(28625,1554856505,99.8492,381244683),(28626,1554856506,0.0000,381583780),(28627,1554856507,0.0000,382583695),(28628,1554856508,0.0000,383570042),(28629,1554856509,0.0168,384713018),(28630,1554856510,0.0000,385390994),(28631,1554856511,0.0503,396140142),(28632,1554856512,0.0670,387269338),(23295,1554856515,0.0600,394653592),(23296,1554856516,0.1500,398615347),(28636,1554856516,99.8713,399530625),(23297,1554856517,0.0800,403800860),(23299,1554856519,93.3613,404607788),(23300,1554856520,0.0000,405171734),(23301,1554856521,0.7375,406204465),(23302,1554856522,0.0000,407414053),(23303,1554856523,0.0671,407908739),(23664,1554856524,0.0000,408581870),(23304,1554856524,0.0000,409225241),(23305,1554856525,0.5196,410121171),(23306,1554856526,4.9950,410848027),(23310,1554856530,99.9686,413389950),(23252,1554856532,0.0000,416688172),(23253,1554856533,0.0339,417154066),(28653,1554856533,98.8285,419374742),(28654,1554856534,99.9367,423627971),(23255,1554856535,0.0000,419709592),(23256,1554856536,0.0169,422146690),(23257,1554856537,0.1564,424499132),(28657,1554856537,76.0880,426800613),(23258,1554856538,0.0000,425950620),(28658,1554856538,84.0418,428353754),(23259,1554856539,0.0000,427106079),(23260,1554856540,0.0000,427591328),(23620,1554856540,0.4972,427651121),(23264,1554856544,0.0609,432855767),(23265,1554856545,0.0000,433194229),(23625,1554856545,5.5262,433538249),(23266,1554856546,0.0000,434783998),(25667,1554856547,0.0000,435472242),(23628,1554856548,0.0000,436299731),(23268,1554856548,0.0000,436361682),(25668,1554856548,0.0000,436394518),(23269,1554856549,0.0000,437201586),(23270,1554856550,0.0000,438062732),(25371,1554856551,0.0000,439614188),(10073,1554856553,1.0986,441172468),(23273,1554856553,3.9640,441234037),(28673,1554856553,74.2076,444568622),(10074,1554856554,0.0000,442483380),(23274,1554856554,0.0000,442793502),(10075,1554856555,0.0000,443368846),(23275,1554856555,0.2205,443430943),(28675,1554856555,34.1073,451388170),(23276,1554856556,0.3140,445116636),(10076,1554856556,0.6658,446408163),(23277,1554856557,1.7644,447282735),(10077,1554856557,0.0000,447384137),(10078,1554856558,0.0000,450369864),(28498,1554856558,0.0000,451982041),(28619,1554856559,0.0000,453573995),(28500,1554856560,0.0000,453652982),(28620,1554856560,0.0000,454813915),(28621,1554856561,0.0000,456229709),(28623,1554856563,0.0000,457943506),(28624,1554856564,0.0000,458617806),(28625,1554856565,99.8995,459071672),(28626,1554856566,0.0000,460069603),(28627,1554856567,0.0000,461365927),(28628,1554856568,0.0000,462260829),(28629,1554856569,0.0167,463106439),(28630,1554856570,0.0000,464035616),(28631,1554856571,0.0670,474717332),(28632,1554856572,0.0335,467570421),(23295,1554856575,0.0700,472184012),(23296,1554856576,0.1200,476420746),(28636,1554856576,99.8713,477480541),(23297,1554856577,0.0900,477184592),(23299,1554856579,97.4862,478362535),(23300,1554856580,0.0000,479939054),(23301,1554856581,0.4023,480267047),(23302,1554856582,0.0000,482047925),(23303,1554856583,0.0503,482207043),(23664,1554856584,0.0000,482211823),(23304,1554856584,0.0000,482749664),(23305,1554856585,0.2849,484021225),(23306,1554856586,1.6424,484564938),(23310,1554856590,99.9686,488836049),(23252,1554856592,0.0000,490183641),(23253,1554856593,0.0339,491088647),(28653,1554856593,98.8285,493178200),(28654,1554856594,99.9367,494806045),(23255,1554856595,0.0000,493497480),(23256,1554856596,0.0000,496548834),(23257,1554856597,0.0931,497483510),(28657,1554856597,76.0880,499634240),(23258,1554856598,0.0000,498295374),(28658,1554856598,84.0418,500298602),(23259,1554856599,0.0000,499327704),(23620,1554856600,0.4968,499515741),(23260,1554856600,0.0000,499574209),(23264,1554856604,0.0440,503883534),(23625,1554856605,5.5267,505087584),(23265,1554856605,0.0000,505146866),(23266,1554856606,0.0000,506557740),(25667,1554856607,0.0000,507873384),(23268,1554856608,0.0000,508456748),(25668,1554856608,0.0000,508518353),(23628,1554856608,0.0000,508799946),(23269,1554856609,0.0000,509354045),(23270,1554856610,0.0000,510534976),(25371,1554856611,0.0000,511636659),(10073,1554856613,1.0987,513425712),(23273,1554856613,3.9640,513482111),(28673,1554856613,74.2076,516521589),(23274,1554856614,0.0000,514144105),(10074,1554856614,0.0000,514198636),(23275,1554856615,0.2205,515053750),(10075,1554856615,0.0000,515111463),(28675,1554856615,34.1073,522545301),(23276,1554856616,0.3140,515882017),(10076,1554856616,0.6659,515935220),(10077,1554856617,0.0000,518875195),(23277,1554856617,1.7646,518926461),(10078,1554856618,0.0000,520468998),(28498,1554856618,0.0000,523182890),(28619,1554856619,0.0000,525127294),(28500,1554856620,0.0000,525449908),(28620,1554856620,0.0000,526229487),(28621,1554856621,0.0000,527553039),(28623,1554856623,0.0000,529490704),(28624,1554856624,0.0000,530815068),(28625,1554856625,99.8493,531119808),(28626,1554856626,0.0000,531876210),(28627,1554856627,0.0167,533339364),(28628,1554856628,0.0000,534969378),(28629,1554856629,0.0167,535208732),(28630,1554856630,0.0000,536245452),(28631,1554856631,0.0502,548027388),(28632,1554856632,0.0670,551424951),(23295,1554856635,0.0600,553221222),(23296,1554856636,0.0500,554454424),(28636,1554856636,99.8713,555649772),(23297,1554856637,0.0800,555900303),(23299,1554856639,96.9646,558475626),(23300,1554856640,0.0000,559240325),(23301,1554856641,0.7209,560728586),(23302,1554856642,0.0000,562616444),(23303,1554856643,0.0671,562861411),(23664,1554856644,0.0000,563004015),(23304,1554856644,0.0000,563556741),(23305,1554856645,0.3186,564644023),(23306,1554856646,2.0959,566229105),(23310,1554856650,99.9686,570120802),(23252,1554856652,0.0000,570946469),(23253,1554856653,0.0169,572092395),(28653,1554856653,98.8285,574533217),(28654,1554856654,99.9367,574808813),(23255,1554856655,0.0000,575503736),(23256,1554856656,0.0000,576876474),(23257,1554856657,0.2037,577946938),(28657,1554856657,76.0880,580223323),(23258,1554856658,0.0000,579236474),(28658,1554856658,84.0418,581519462),(23259,1554856659,0.0000,581506074),(23620,1554856660,0.5002,581839550),(23260,1554856660,0.0000,581910214),(23264,1554856664,0.0575,585597912),(23265,1554856665,0.0000,586690301),(23625,1554856665,5.5591,586752535),(23266,1554856666,0.0000,587535876),(25667,1554856667,0.0000,588738209),(23628,1554856668,0.0000,590031893),(23268,1554856668,0.0000,590096527),(25668,1554856668,0.0000,590421225),(23269,1554856669,0.0000,591745384),(23270,1554856670,0.0000,592032485),(25371,1554856671,0.0169,593002324),(10073,1554856673,1.0985,594143123),(23273,1554856673,3.9640,594684439),(28673,1554856673,74.2076,597673834),(10074,1554856674,0.0000,595368732),(23274,1554856674,0.0000,595659967),(10075,1554856675,0.0000,595981435),(23275,1554856675,0.2205,596498106),(28675,1554856675,34.1073,604360222),(10076,1554856676,0.7157,599583382),(23276,1554856676,0.3140,599645862),(23277,1554856677,1.8142,600407010),(10077,1554856677,0.0000,600745327),(28498,1554856678,0.0000,602277528),(10078,1554856678,0.0499,602352442),(28619,1554856679,0.0000,605528899),(28500,1554856680,0.0000,605624745),(28620,1554856680,0.0000,606242672),(28621,1554856681,0.0000,608152478),(28623,1554856683,0.0000,609398326),(28624,1554856684,0.0000,609726202),(28625,1554856685,99.9162,611362679),(28626,1554856686,0.0000,611767830),(28627,1554856687,0.0000,613335848),(28628,1554856688,0.0000,614234278),(28629,1554856689,0.0168,615421243),(28630,1554856690,0.0000,615549520),(28631,1554856691,0.0503,626855241),(28632,1554856692,0.0000,629809356),(23295,1554856695,0.0500,631437915),(23296,1554856696,0.0200,632751154),(28636,1554856696,99.8713,633431557),(23297,1554856697,0.0600,632960464),(23299,1554856699,98.6092,635070464),(23300,1554856700,0.0000,636750870),(23301,1554856701,0.3352,636562400),(23302,1554856702,0.0000,638471183),(23303,1554856703,0.0503,639015820),(23664,1554856704,0.0000,640022555),(23304,1554856704,0.0000,640491578),(23305,1554856705,0.2012,640825637),(23306,1554856706,1.2737,641811376),(23310,1554856710,99.9686,644086237),(23252,1554856712,0.0000,644742471),(23253,1554856713,0.0339,646681376),(28653,1554856713,98.8285,648717871),(28654,1554856714,99.9367,650422413),(23255,1554856715,0.0000,651591449),(23256,1554856716,0.0169,652437859),(23257,1554856717,0.0973,653356113),(28657,1554856717,76.0880,655926703),(23258,1554856718,0.0000,655014648),(28658,1554856718,84.0418,657008367),(23259,1554856719,0.0000,655775927),(23620,1554856720,0.5002,656526199),(23260,1554856720,0.0000,656577554),(23264,1554856724,0.0508,661577576),(23625,1554856725,5.5930,662069755),(23265,1554856725,0.0000,662136864),(23266,1554856726,0.0000,663130739),(25667,1554856727,0.0000,663734727),(23628,1554856728,0.0000,664841725),(25668,1554856728,0.0000,664911206),(23268,1554856728,0.0000,664942075),(23269,1554856729,0.0034,670796593),(23270,1554856730,0.0000,671735735),(25371,1554856731,0.0000,673154668),(23273,1554856733,3.9640,674761242),(10073,1554856733,1.1152,675179532),(28673,1554856733,74.2076,678252538),(23274,1554856734,0.0000,675823070),(10074,1554856734,0.0000,675886315),(23275,1554856735,0.2205,676756345),(10075,1554856735,0.0000,679411128),(28675,1554856735,34.1073,684598811),(23276,1554856736,0.3140,679772697),(10076,1554856736,0.6991,680097510),(10077,1554856737,0.0000,680642860),(23277,1554856737,1.8142,683607477),(10078,1554856738,0.0166,684975130),(28498,1554856738,0.0000,686119786),(28619,1554856739,0.0000,688500338),(28500,1554856740,0.0000,688833663),(28620,1554856740,0.0000,689750906),(28621,1554856741,0.0000,690748560),(28623,1554856743,0.0000,692276644),(28624,1554856744,0.0000,693594116),(28625,1554856745,99.6314,694221837),(28626,1554856746,0.0000,694884746),(28627,1554856747,0.0000,695702624),(28628,1554856748,0.0000,696763635),(28629,1554856749,0.0335,697659798),(28630,1554856750,0.0000,698887376),(28631,1554856751,0.1676,710572281),(28632,1554856752,0.1676,703776787),(23295,1554856755,0.0500,706260931),(23296,1554856756,0.0100,707927522),(28636,1554856756,99.8713,708871262),(23297,1554856757,0.0500,709360240),(23299,1554856759,94.8851,712024016),(23300,1554856760,0.0000,713320755),(23301,1554856761,0.8217,713367910),(23302,1554856762,0.0000,715287043),(23303,1554856763,0.0838,715720386),(23304,1554856764,0.0000,716456826),(23664,1554856764,0.0000,716536582),(23305,1554856765,0.5365,717600957),(23306,1554856766,3.1690,718196854),(23310,1554856770,99.9686,721183213),(23252,1554856772,0.0000,723088962),(23253,1554856773,0.0339,723719435),(28653,1554856773,98.8285,725791352),(28654,1554856774,99.9367,726704454),(23255,1554856775,0.0000,725561615),(23256,1554856776,0.0169,729522989),(23257,1554856777,0.1354,729832258),(28657,1554856777,76.0874,731998500),(23258,1554856778,0.0000,731121123),(28658,1554856778,84.0418,733117680),(23259,1554856779,0.0339,731836099),(23260,1554856780,0.0000,732537106),(23620,1554856780,0.4985,732598198),(23264,1554856784,0.0440,737270542),(23265,1554856785,0.0000,737842714),(23625,1554856785,5.5263,738247131),(23266,1554856786,0.0000,738914596),(25667,1554856787,0.0000,739860754),(23628,1554856788,0.0000,740673083),(23268,1554856788,0.0000,740738993),(25668,1554856788,0.0000,740773629),(23269,1554856789,0.0034,741244595),(23270,1554856790,0.0000,742350357),(25371,1554856791,0.0172,743396382),(23273,1554856793,3.9640,745301531),(10073,1554856793,1.0821,745362773),(28673,1554856793,74.2076,748611645),(10074,1554856794,0.0000,746157963),(23274,1554856794,0.0003,746636087),(10075,1554856795,0.0000,748116551),(23275,1554856795,0.2205,748177143),(28675,1554856795,34.1073,755508503),(23276,1554856796,0.3140,748463676),(10076,1554856796,0.6659,748527140),(23277,1554856797,1.7481,750456646),(10077,1554856797,0.0000,750744227),(28498,1554856798,0.0000,753267649),(10078,1554856798,0.0000,753571850),(28619,1554856799,0.0000,755674594),(28500,1554856800,0.0000,755939549),(28620,1554856800,0.0000,756457450),(28621,1554856801,0.0000,758243141),(28623,1554856803,0.0000,759499486),(28624,1554856804,0.0000,760623236),(28625,1554856805,99.8493,761630616),(28626,1554856806,0.0000,762466557),(28627,1554856807,0.0335,763722700),(28628,1554856808,0.0000,764140632),(28629,1554856809,0.0167,765824920),(28630,1554856810,0.0000,767267142),(28631,1554856811,0.0670,778447858),(28632,1554856812,0.0335,771830772),(23295,1554856815,0.0500,776615954),(23296,1554856816,0.0000,779154852),(28636,1554856816,99.8713,780776688),(23297,1554856817,0.0400,780929904),(23299,1554856819,97.8199,782717381),(23300,1554856820,0.0000,784135547),(23301,1554856821,1.0727,784472563),(23302,1554856822,0.0000,785951117),(23303,1554856823,0.0503,787583874),(23304,1554856824,0.0000,788349345),(23664,1554856824,0.0000,788423612),(23305,1554856825,0.2179,789735581),(23306,1554856826,0.9219,790279142),(23310,1554856830,99.9686,793804180),(23252,1554856832,0.0000,796019145),(23253,1554856833,0.0169,796870409),(28653,1554856833,98.8285,799087017),(28654,1554856834,99.9367,800026687),(23255,1554856835,0.0000,798430554),(23256,1554856836,0.0508,800385143),(23257,1554856837,0.1147,803361496),(28657,1554856837,76.0880,805367137),(23258,1554856838,0.0000,803976942),(28658,1554856838,84.0418,806177307),(23259,1554856839,0.0339,804331078),(23620,1554856840,0.4987,804742751),(23260,1554856840,0.0000,804804407),(23264,1554856844,0.0474,809131119),(23265,1554856845,0.0000,810011904),(23625,1554856845,5.2770,810071323),(23266,1554856846,0.0000,810603130),(25667,1554856847,0.0169,811745336),(23268,1554856848,0.0000,812983487),(25668,1554856848,0.0000,813044599),(23628,1554856848,0.0000,813073993),(23269,1554856849,0.0000,814321376),(23270,1554856850,0.0000,814930144),(25371,1554856851,0.0000,815907179),(10073,1554856853,1.0987,817181726),(23273,1554856853,3.9640,817657630),(28673,1554856853,74.2076,820570879),(10074,1554856854,0.0000,818414304),(23274,1554856854,0.0000,818474953),(23275,1554856855,0.2205,818884423),(10075,1554856855,0.0000,819435804),(28675,1554856855,34.1073,826605411),(23276,1554856856,0.3140,820561515),(10076,1554856856,0.6659,821641955),(23277,1554856857,1.7645,822966453),(10077,1554856857,0.0000,823027145),(10078,1554856858,0.0000,823435504),(28498,1554856858,0.0000,826609245),(28619,1554856859,0.0000,828624904),(28500,1554856860,0.0000,828247108),(28620,1554856860,0.0000,829580681),(28621,1554856861,0.0000,830532337),(28623,1554856863,0.0000,831755655),(28624,1554856864,0.0000,832345337),(28625,1554856865,99.8995,832941913),(28626,1554856866,0.0000,834064832),(28627,1554856867,0.0000,834576461),(28628,1554856868,0.0000,835521132),(28629,1554856869,0.0168,836390614),(28630,1554856870,0.0000,836833490),(28631,1554856871,0.0335,848367397),(28632,1554856872,0.0503,851720216),(23295,1554856875,0.0500,854012822),(23296,1554856876,0.0000,854870029),(28636,1554856876,99.8713,855934194),(23297,1554856877,0.0400,855968253),(23299,1554856879,98.3585,856853986),(23300,1554856880,0.0000,858586633),(23301,1554856881,0.4357,858945410),(23302,1554856882,0.0000,860228675),(23303,1554856883,0.0503,860840081),(23664,1554856884,0.0000,861945929),(23304,1554856884,0.0000,862274265),(23305,1554856885,0.1843,862511265),(23306,1554856886,0.9217,863596198),(23310,1554856890,99.9686,866789367),(23252,1554856892,0.0000,868271115),(23253,1554856893,0.0339,868743856),(28653,1554856893,98.8285,871861404),(28654,1554856894,99.9367,876142656),(23255,1554856895,0.0000,871724865),(23256,1554856896,0.0678,874810412),(23257,1554856897,0.1269,875281412),(28657,1554856897,76.0880,879213962),(23258,1554856898,0.0000,876853401),(28658,1554856898,84.0418,878614198),(23259,1554856899,0.0000,877729723),(23620,1554856900,0.4914,878888265),(23260,1554856900,0.0000,878923743),(23264,1554856904,0.0643,882981374),(23625,1554856905,5.1603,884011076),(23265,1554856905,0.0000,884065553),(23266,1554856906,0.0000,885146307),(25667,1554856907,0.0000,886198382),(25668,1554856908,0.0000,887226101),(23268,1554856908,0.0000,887588539),(23628,1554856908,0.0000,887635222),(23269,1554856909,0.0000,888262410),(23270,1554856910,0.0000,889291852),(25371,1554856911,0.0000,890526386),(10073,1554856913,1.0986,892221000),(23273,1554856913,3.9640,892287266),(28673,1554856913,74.2076,896054707),(10074,1554856914,0.0000,893240683),(23274,1554856914,0.0000,893304572),(10075,1554856915,0.0000,894494477),(23275,1554856915,0.2205,894542849),(28675,1554856915,34.1073,900802665),(23276,1554856916,0.3140,895504486),(10076,1554856916,0.6658,896484837),(23277,1554856917,1.7645,897292002),(10077,1554856917,0.0000,897726696),(28498,1554856918,0.0000,898737934),(10078,1554856918,0.0000,898801361),(28619,1554856919,0.0000,902797540),(28500,1554856920,0.0000,913970914),(28620,1554856920,0.0000,914547943),(28621,1554856921,0.0000,915258427),(28623,1554856923,0.0000,916964874),(28624,1554856924,0.0000,917687599),(28625,1554856925,99.8995,918271776),(28626,1554856926,0.0000,918585805),(28627,1554856927,0.0168,919168707),(28628,1554856928,0.0000,919828300),(28629,1554856929,0.0000,920881632),(28630,1554856930,0.0000,921570161),(28631,1554856931,0.0670,933491968),(28632,1554856932,0.0168,926941956),(23295,1554856935,0.0500,932447553),(23296,1554856936,0.0000,936557931),(28636,1554856936,99.8713,947519424),(23297,1554856937,0.0300,937455835),(23299,1554856939,95.7112,938145881),(23300,1554856940,0.0000,940089084),(23301,1554856941,0.7203,940804011),(23302,1554856942,0.0000,942590930),(23303,1554856943,0.0837,943276063),(23304,1554856944,0.0000,943888542),(23664,1554856944,0.0000,943966655),(23305,1554856945,0.4187,945646188),(23306,1554856946,3.0653,946824053),(23310,1554856950,99.9686,949791296),(23252,1554856952,0.0000,951139739),(23253,1554856953,0.0169,952508179),(28653,1554856953,98.8285,954825956),(28654,1554856954,99.9367,959024903),(23255,1554856955,0.0000,956033777),(23256,1554856956,0.0169,958694484),(23257,1554856957,0.1226,958921018),(28657,1554856957,76.0880,961227222),(23258,1554856958,0.0000,961704293),(28658,1554856958,84.0418,961847214),(23259,1554856959,0.0339,962267063),(23260,1554856960,0.0000,963051987),(23620,1554856960,0.4747,963108623),(23264,1554856964,0.0508,967076519),(23265,1554856965,0.0000,967668629),(23625,1554856965,5.1595,967727103),(23266,1554856966,0.0000,968934789),(25667,1554856967,0.0000,969730062),(23268,1554856968,0.0000,970759616),(23628,1554856968,0.0000,970823991),(25668,1554856968,0.0056,970858736),(23269,1554856969,0.0034,971510329),(23270,1554856970,0.0000,972794720),(25371,1554856971,0.0000,974017912),(23273,1554856973,3.9640,986707892),(10073,1554856973,1.0983,986771575),(28673,1554856973,74.2076,990124625),(10074,1554856974,0.0000,997121487),(23274,1554856974,0.0000,997190922),(10075,1554856975,0.0000,997858902),(23275,1554856975,0.2205,997917813),(10076,1554856976,0.6598,5067581),(23276,1554856976,0.3140,5099093),(28675,1554856976,34.1073,9395713),(10077,1554856977,0.0000,12865496),(23277,1554856977,1.7931,13107993),(28498,1554856978,0.0000,15116793),(10078,1554856978,0.0169,16080209),(28619,1554856979,0.0000,2174898),(28500,1554856980,0.0000,6394820),(28620,1554856980,0.0000,9959755),(28621,1554856981,0.0000,9078877),(28623,1554856983,0.0000,13001399),(28624,1554856984,0.0000,13351990),(28625,1554856985,99.8660,16063734),(28626,1554856986,0.0000,16832296),(28627,1554856987,0.0000,18931699),(28628,1554856988,0.0000,20480132),(28629,1554856989,0.0335,21904977),(28630,1554856990,0.0000,23057872),(28631,1554856991,0.0335,34761858),(28632,1554856992,0.0670,37718408),(23295,1554856995,0.0500,39664279),(23296,1554856996,0.0000,41060729),(28636,1554856996,99.8713,41696642),(23297,1554856997,0.0200,41119528),(23299,1554856999,95.1575,43731772),(23300,1554857000,0.0000,45208383),(23301,1554857001,0.6032,45935599),(23302,1554857002,0.0000,46178485),(23303,1554857003,0.0838,47684359),(23664,1554857004,0.0000,48272827),(23304,1554857004,0.0000,48680419),(23305,1554857005,0.4526,49402948),(23306,1554857006,3.7037,50770274),(23310,1554857010,99.9686,54020632),(23252,1554857012,0.0000,54776203),(23253,1554857013,0.0169,56841358),(28653,1554857013,98.8285,58934531),(28654,1554857014,99.9367,60400822),(23255,1554857015,0.0000,60560384),(23256,1554857016,0.0339,61215052),(23257,1554857017,0.1269,62079262),(28657,1554857017,76.0880,64320205),(23258,1554857018,0.0172,64493384),(28658,1554857018,84.0418,66832061),(23259,1554857019,0.0846,65007320),(23260,1554857020,0.0000,65941055),(23620,1554857020,0.4777,66003278),(23264,1554857024,0.0541,70131707),(23625,1554857025,5.5665,71580970),(23265,1554857025,0.0000,71646225),(23266,1554857026,0.0000,72513601),(25667,1554857027,0.0000,73162012),(25668,1554857028,0.0000,73905866),(23628,1554857028,0.0000,73968062),(23268,1554857028,0.0000,74266664),(23269,1554857029,0.0000,75208266),(23270,1554857030,0.0000,76253415),(25371,1554857031,0.0000,77347082),(23273,1554857033,3.9640,78838450),(10073,1554857033,1.1338,79263755),(28673,1554857033,74.2076,82470697),(23274,1554857034,0.0000,79840826),(10074,1554857034,0.0000,79900807),(10075,1554857035,0.0000,81015644),(23275,1554857035,0.2205,81554476),(28675,1554857035,34.1073,89358980),(23276,1554857036,0.3140,82940269),(10076,1554857036,0.6824,83002556),(10077,1554857037,0.0000,84647333),(23277,1554857037,1.7646,84706612),(10078,1554857038,0.0166,85748817),(28498,1554857038,0.0000,87989049),(28619,1554857039,0.0000,90010200),(28500,1554857040,0.0000,90514451),(28620,1554857040,0.0000,91118068),(28621,1554857041,0.0000,91965484),(28623,1554857043,0.0000,93817389),(28624,1554857044,0.0000,94986168),(28625,1554857045,99.8491,96362277),(28626,1554857046,0.0000,96906867),(28627,1554857047,0.0503,97875975),(28628,1554857048,0.0000,98768930),(28629,1554857049,0.0168,100032186),(28630,1554857050,0.0000,101039098),(28631,1554857051,0.0503,109575643),(28632,1554857052,0.0670,105482890),(23295,1554857055,0.0500,109375476),(23296,1554857056,0.0000,111359963),(28636,1554857056,99.8713,112395993),(23297,1554857057,0.0200,111832800),(23299,1554857059,98.4247,113794233),(23300,1554857060,0.0000,115046817),(23301,1554857061,0.3519,114868815),(23302,1554857062,0.0000,117243018),(23303,1554857063,0.0503,117943996),(23664,1554857064,0.0000,118426554),(23304,1554857064,0.0000,119088170),(23305,1554857065,0.2346,119493565),(23306,1554857066,0.9219,120848524),(23310,1554857070,99.9686,123346296),(23252,1554857072,0.0000,125108206),(23253,1554857073,0.0339,125936357),(28653,1554857073,98.8285,128146354),(28654,1554857074,99.9367,134682179),(23255,1554857075,0.0000,127896966),(23256,1554857076,0.0169,129025581),(23257,1554857077,0.0888,133047868),(28657,1554857077,76.0880,135161745),(23258,1554857078,0.0000,134063145),(28658,1554857078,84.0418,136435498),(23259,1554857079,0.0169,135069068),(23620,1554857080,0.4815,135705508),(23260,1554857080,0.0000,135773881),(23264,1554857084,0.0413,140934700),(23625,1554857085,5.6767,141717898),(23265,1554857085,0.0000,142129906),(23266,1554857086,0.0000,142461846),(25667,1554857087,0.0000,143179460),(23268,1554857088,0.0000,144005742),(23628,1554857088,0.0000,144070355),(25668,1554857088,0.0000,144106401),(23269,1554857089,0.0000,144806079),(23270,1554857090,0.0000,145940352),(25371,1554857091,0.0000,147089670),(23273,1554857093,3.9640,148539258),(10073,1554857093,1.0821,148831433),(28673,1554857093,74.2073,152141903),(23274,1554857094,0.0000,149795943),(10074,1554857094,0.0000,150131122),(23275,1554857095,0.2205,151182249),(10075,1554857095,0.0000,151246859),(28675,1554857095,34.1072,159365428),(10076,1554857096,0.6659,152210105),(23276,1554857096,0.3140,152274721),(10077,1554857097,0.0000,153292592),(23277,1554857097,1.7646,153355398),(10078,1554857098,0.0000,154616369),(28498,1554857098,0.0000,155277788),(28619,1554857099,0.0000,159734762),(28500,1554857100,0.0000,159688756),(28620,1554857100,0.0000,160385157),(28621,1554857101,0.0000,161983967),(28623,1554857103,0.0000,163909215),(28624,1554857104,0.0000,164994222),(28625,1554857105,99.6650,166166630),(28626,1554857106,0.0000,166903379),(28627,1554857107,0.0670,168516936),(28628,1554857108,0.0000,168556575),(28629,1554857109,0.0503,169809305),(28630,1554857110,0.0000,170550438),(28631,1554857111,0.1173,181754155),(28632,1554857112,0.0670,172553589),(23295,1554857115,0.0500,182929678),(23296,1554857116,0.0000,183754290),(28636,1554857116,99.8713,184775448),(23297,1554857117,0.0100,184576954),(23299,1554857119,98.4409,186766190),(23300,1554857120,0.0000,188180853),(23301,1554857121,0.3689,188389870),(23302,1554857122,0.0000,190020673),(23303,1554857123,0.0503,190717949),(23664,1554857124,0.0000,191178645),(23304,1554857124,0.0000,191600728),(23305,1554857125,0.2012,192802856),(23306,1554857126,0.9388,193356345),(23310,1554857130,99.9686,195308502),(23252,1554857132,0.0000,196718865),(23253,1554857133,0.0339,197641056),(28653,1554857133,98.8285,199922149),(28654,1554857134,99.9367,201347640),(23255,1554857135,0.0000,199659862),(23256,1554857136,0.0169,202726689),(23257,1554857137,0.1269,203147496),(28657,1554857137,76.0880,205375272),(23258,1554857138,0.0000,204624717),(28658,1554857138,84.0418,206661136),(23259,1554857139,0.0169,205233973),(23620,1554857140,0.4798,206224973),(23260,1554857140,0.0000,206287006),(23264,1554857144,0.0508,212815473),(23625,1554857145,5.6766,213141274),(23265,1554857145,0.0000,213500997),(23266,1554857146,0.0000,213714661),(25667,1554857147,0.0000,214342646),(23628,1554857148,0.0000,215448140),(25668,1554857148,0.0057,215516336),(23268,1554857148,0.0000,215770184),(23269,1554857149,0.0000,216135721),(23270,1554857150,0.0000,217173821),(25371,1554857151,0.0000,218391359),(10073,1554857153,1.0987,219499953),(23273,1554857153,3.9640,219996960),(28673,1554857153,74.2073,222931111),(23274,1554857154,0.0000,220193908),(10074,1554857154,0.0000,220255396),(10075,1554857155,0.0000,221955888),(23275,1554857155,0.2205,222256223),(28675,1554857155,34.1072,230059566),(23276,1554857156,0.3140,223903130),(10076,1554857156,0.6659,224240050),(10077,1554857157,0.0000,224873507),(23277,1554857157,1.7646,224935761),(10078,1554857158,0.0000,228528617),(28498,1554857158,0.0000,229006601),(28619,1554857159,0.0000,231393595),(28500,1554857160,0.0000,231608930),(28620,1554857160,0.0000,232477507),(28621,1554857161,0.0000,232979402),(28623,1554857163,0.0000,235341934),(28624,1554857164,0.0000,235807386),(28625,1554857165,99.8660,236995767),(28626,1554857166,0.0000,237988993),(28627,1554857167,0.0168,239354907),(28628,1554857168,0.0000,239669051),(28629,1554857169,0.0335,239973113),(28630,1554857170,0.0000,241682445),(28631,1554857171,0.0503,253408874),(28632,1554857172,0.0335,245993200),(23295,1554857175,0.0500,249070666),(23296,1554857176,0.0000,251212463),(28636,1554857176,99.8713,251956945),(23297,1554857177,0.0100,252380162),(23299,1554857179,98.3576,254535971),(23300,1554857180,0.0000,256530504),(23301,1554857181,0.4691,257797023),(23302,1554857182,0.0000,258788321),(23303,1554857183,0.0670,259567243),(23664,1554857184,0.0000,259698942),(23304,1554857184,0.0000,260239076),(23305,1554857185,0.2178,261329934),(23306,1554857186,0.9214,262511214),(23310,1554857190,99.9686,265154981),(23252,1554857192,0.0000,266518369),(23253,1554857193,0.0339,267906954),(28653,1554857193,98.8285,269942669),(28654,1554857194,99.9367,270518600),(23255,1554857195,0.0000,271538844),(23256,1554857196,0.0339,272057465),(23257,1554857197,0.1311,273262778),(28657,1554857197,76.0880,275593441),(23258,1554857198,0.0000,274550506),(28658,1554857198,84.0418,276823029),(23259,1554857199,0.0000,276806763),(23260,1554857200,0.0000,277613865),(23620,1554857200,0.4754,277671010),(23264,1554857204,0.0474,280193278),(23265,1554857205,0.0000,282244208),(23625,1554857205,5.6768,282316140),(23266,1554857206,0.0000,283718834),(25667,1554857207,0.0000,285034324),(23268,1554857208,0.0000,285694870),(23628,1554857208,0.0000,285762782),(25668,1554857208,0.0000,285796019),(23269,1554857209,0.0000,287340432),(23270,1554857210,0.0000,288582270),(25371,1554857211,0.0169,289621448),(23273,1554857213,3.9640,292995521),(10073,1554857213,1.0987,293058240),(28673,1554857213,74.2073,295970595),(10074,1554857214,0.0000,295783193),(23274,1554857214,0.0000,295841325),(23275,1554857215,0.2205,296788903),(10075,1554857215,0.0000,297123833),(28675,1554857215,34.1072,304455925),(10076,1554857216,0.6658,298273895),(23276,1554857216,0.3140,298332801),(10077,1554857217,0.0000,299490998),(23277,1554857217,1.7811,301490014),(10078,1554857218,0.0000,304006220),(28498,1554857218,0.0000,304907270),(28619,1554857219,0.0000,306240386),(28500,1554857220,0.0000,306340920),(28620,1554857220,0.0000,307537222),(28621,1554857221,0.0000,308656903),(28623,1554857223,0.0000,320471888),(28624,1554857224,0.0000,319066873),(28625,1554857225,99.7486,319792250),(28626,1554857226,0.0000,320507074),(28627,1554857227,0.0168,321735823),(28628,1554857228,0.0000,322634585),(28629,1554857229,0.0335,323746683),(28630,1554857230,0.0000,324758666),(28631,1554857231,0.0838,337006796),(28632,1554857232,0.1340,329151377),(23295,1554857235,0.0500,335032986),(23296,1554857236,0.0000,336188054),(28636,1554857236,99.8713,337949105),(23297,1554857237,0.0100,339207029),(23299,1554857239,97.2683,341355973),(23300,1554857240,0.0000,342422925),(23301,1554857241,0.7543,342715615),(23302,1554857242,0.0000,344328919),(23303,1554857243,0.0670,345226509),(23664,1554857244,0.0000,345472631),(23304,1554857244,0.0000,346075183),(23305,1554857245,0.2515,346870740),(23306,1554857246,1.4753,348160144),(23310,1554857250,99.9686,351356764),(23252,1554857252,0.0000,353072595),(23253,1554857253,0.0339,353891527),(28653,1554857253,98.8285,356213702),(28654,1554857254,99.9367,360919934),(23255,1554857255,0.0000,356151664),(23256,1554857256,0.0508,359537575),(23257,1554857257,0.1462,362244541),(28657,1554857257,76.0880,364453150),(23258,1554857258,0.0000,363680266),(28658,1554857258,84.0418,365651805),(23259,1554857259,0.0000,364331436),(23260,1554857260,0.0000,365138828),(23620,1554857260,0.4733,365192851),(23264,1554857264,0.0643,370549930),(23625,1554857265,5.6915,371560388),(23265,1554857265,0.0000,371863068),(23266,1554857266,0.0000,374007895),(25667,1554857267,0.0000,374412512),(25668,1554857268,0.0000,374915224),(23628,1554857268,0.0000,375213592),(23268,1554857268,0.0000,375252377),(23269,1554857269,0.0000,376262168),(23270,1554857270,0.0000,376997460),(25371,1554857271,0.0000,378723601),(10073,1554857273,1.0984,380363067),(23273,1554857273,3.9699,380422842),(28673,1554857273,74.2073,383609681),(10074,1554857274,0.0000,381369772),(23274,1554857274,0.0000,381427158),(23275,1554857275,0.2205,382397400),(10075,1554857275,0.0000,382457797),(28675,1554857275,34.1072,390554598),(23276,1554857276,0.3160,384559296),(10076,1554857276,0.7323,384623569),(23277,1554857277,1.8141,385762654),(10077,1554857277,0.0000,386100476),(10078,1554857278,0.0499,387740047),(28498,1554857278,0.0000,388531123),(28619,1554857279,0.0000,391516128),(28500,1554857280,0.0000,390917632),(28620,1554857280,0.0000,392567887),(28621,1554857281,0.0000,393106787),(28623,1554857283,0.0000,415174002),(28624,1554857284,0.0000,402799819),(28625,1554857285,99.8660,403340757),(28626,1554857286,0.0000,404582400),(28627,1554857287,0.0000,405144691),(28628,1554857288,0.0000,406979694),(28629,1554857289,0.0168,408105399),(28630,1554857290,0.0000,408619538),(28631,1554857291,0.0670,420273471),(28632,1554857292,0.0335,412958085),(23295,1554857295,0.0500,426821005),(23296,1554857296,0.0800,428933272),(28636,1554857296,99.8713,429894346),(23297,1554857297,0.0400,430370116),(23299,1554857299,93.5792,432448683),(23300,1554857300,0.0000,433708009),(23301,1554857301,0.7710,433718575),(23302,1554857302,0.0000,435920073),(23303,1554857303,0.0670,436410854),(23664,1554857304,0.0169,436921061),(23304,1554857304,0.0000,437578183),(23305,1554857305,0.6202,438500135),(23306,1554857306,5.3805,438963794),(23310,1554857310,99.9686,443735504),(23252,1554857312,0.0000,445102351),(23253,1554857313,0.0169,446932304),(28653,1554857313,98.8285,449393275),(28654,1554857314,99.9367,450637873),(23255,1554857315,0.0000,452641675),(23256,1554857316,0.0508,453547491),(23257,1554857317,0.1732,455023654),(28657,1554857317,76.0880,457241095),(23258,1554857318,0.0000,458116174),(28658,1554857318,84.0418,460125868),(23259,1554857319,0.0169,458850272),(23260,1554857320,0.0000,459694138),(23620,1554857320,0.4771,459758703),(23264,1554857324,0.0508,464576150),(23625,1554857325,5.6079,465502296),(23265,1554857325,0.0000,465573767),(23266,1554857326,0.0000,466459020),(25667,1554857327,0.0000,467906158),(23628,1554857328,0.0000,469220667),(23268,1554857328,0.0000,469277575),(25668,1554857328,0.0056,469311044),(23269,1554857329,0.0034,470062518),(23270,1554857330,0.0000,471542079),(25371,1554857331,0.0169,472987063),(23273,1554857333,3.9699,475192627),(10073,1554857333,1.0983,475546248),(28673,1554857333,74.2073,478554575),(10074,1554857334,0.0000,476219047),(23274,1554857334,0.0000,476280678),(23275,1554857335,0.2205,476592914),(10075,1554857335,0.0000,477086769),(28675,1554857335,34.1072,484738731),(23276,1554857336,0.3160,479532249),(10076,1554857336,0.7322,479589438),(10077,1554857337,0.0000,480351008),(23277,1554857337,1.8304,480645693),(28498,1554857338,0.0000,481311714),(10078,1554857338,0.0166,481761980),(28619,1554857339,0.0000,487196809),(28500,1554857340,0.0000,485895102),(28620,1554857340,0.0000,486994375),(28621,1554857341,0.0000,488562889),(28623,1554857343,0.0000,490067901),(28624,1554857344,0.0000,490860302),(28625,1554857345,99.8325,492124332),(28626,1554857346,0.0000,492764656),(28627,1554857347,0.0000,493455672),(28628,1554857348,0.0000,495212701),(28629,1554857349,0.0168,495632767),(28630,1554857350,0.0000,496122185),(28631,1554857351,0.0670,507152078),(28632,1554857352,0.1005,510711127),(23295,1554857355,0.0500,510616602),(23296,1554857356,0.0300,512497947),(28636,1554857356,99.8713,513069416),(23297,1554857357,0.0400,513241794),(23299,1554857359,96.4801,515706742),(23300,1554857360,0.0000,517403702),(23301,1554857361,0.6034,517946841),(23302,1554857362,0.0000,519220490),(23303,1554857363,0.0838,519795213),(23664,1554857364,0.0000,520359702),(23304,1554857364,0.0000,520715685),(23305,1554857365,0.3186,521455170),(23306,1554857366,2.2636,523001608),(23310,1554857370,99.9686,525963845),(23252,1554857372,0.0000,527431493),(23253,1554857373,0.0339,528506250),(28653,1554857373,98.8285,530501633),(28654,1554857374,99.9367,534905530),(23255,1554857375,0.0000,532666878),(23256,1554857376,0.0172,533583547),(23257,1554857377,0.1860,537440958),(28657,1554857377,76.0880,537807832),(23258,1554857378,0.0000,538395629),(28658,1554857378,84.0418,540607950),(23259,1554857379,0.0000,539215172),(23620,1554857380,0.4791,540288635),(23260,1554857380,0.0000,540362989),(23264,1554857384,0.0508,544844221),(23265,1554857385,0.0000,546032899),(23625,1554857385,5.5259,546097109),(23266,1554857386,0.0000,546777369),(25667,1554857387,0.0169,547757618),(23268,1554857388,0.0000,548286799),(25668,1554857388,0.0000,548353686),(23628,1554857388,0.0000,548670850),(23269,1554857389,0.0034,549308763),(23270,1554857390,0.0000,549919197),(25371,1554857391,0.0000,550919481),(10073,1554857393,1.0986,552950835),(23273,1554857393,3.9699,553018566),(28673,1554857393,74.2073,556387253),(10074,1554857394,0.0000,554190487),(23274,1554857394,0.0000,554251750),(23275,1554857395,0.2205,559042948),(10075,1554857395,0.0000,559990223),(28675,1554857395,34.1072,571030128),(10076,1554857396,0.6990,561237406),(23276,1554857396,0.3160,561300159),(10077,1554857397,0.0000,562727103),(23277,1554857397,1.7975,562787468),(10078,1554857398,0.0000,564257050),(28498,1554857398,0.0000,565919519),(28619,1554857399,0.0000,568850293),(28500,1554857400,0.0000,568263894),(28620,1554857400,0.0000,569896480),(28621,1554857401,0.0000,570765920),(28623,1554857403,0.0000,572345465),(28624,1554857404,0.0000,573402001),(28625,1554857405,99.8492,575343359),(28626,1554857406,0.0000,576715528),(28627,1554857407,0.0168,577443692),(28628,1554857408,0.0000,578412536),(28629,1554857409,0.0168,579569777),(28630,1554857410,0.0000,580610049),(28631,1554857411,0.0670,592497064),(28632,1554857412,0.0335,595805878),(23295,1554857415,0.0500,597171045),(23296,1554857416,0.0100,598984185),(28636,1554857416,99.8713,599611127),(23297,1554857417,0.0300,600666856),(23299,1554857419,96.1106,602031116),(23300,1554857420,0.0000,602974787),(23301,1554857421,0.6203,603528506),(23302,1554857422,0.0000,605138993),(23303,1554857423,0.0671,605127321),(23664,1554857424,0.0000,605866474),(23304,1554857424,0.0000,606427865),(23305,1554857425,0.3855,608153722),(23306,1554857426,2.7992,609461149),(23310,1554857430,99.9686,612373254),(23252,1554857432,0.0000,613774221),(23253,1554857433,0.0169,614753930),(28653,1554857433,98.8285,617040016),(28654,1554857434,99.9367,621103416),(23255,1554857435,0.0000,616740339),(23256,1554857436,0.0339,621990910),(23257,1554857437,0.1825,623944603),(28657,1554857437,76.0880,624385474),(23258,1554857438,0.0000,624931513),(28658,1554857438,84.0418,627175910),(23259,1554857439,0.0000,625786566),(23260,1554857440,0.0000,626232875),(23620,1554857440,0.4750,626292346),(23264,1554857444,0.0542,630665644),(23265,1554857445,0.0000,631186382),(23625,1554857445,5.5255,631241068),(23266,1554857446,0.0000,631607601),(25667,1554857447,0.0000,632514036),(23268,1554857448,0.0000,633509145),(23628,1554857448,0.0000,633809758),(25668,1554857448,0.0000,633853136),(23269,1554857449,0.0000,634400644),(23270,1554857450,0.0000,634517191),(25371,1554857451,0.0172,636581426),(10073,1554857453,1.0984,638310442),(23273,1554857453,3.9699,638364879),(28673,1554857453,74.2073,641773535),(10074,1554857454,0.0000,639824066),(23274,1554857454,0.0000,639881479),(10075,1554857455,0.0000,640461405),(23275,1554857455,0.2205,640517945),(28675,1554857455,34.1072,648380160),(10076,1554857456,0.6991,642466637),(23276,1554857456,0.3160,642522922),(23277,1554857457,1.7976,644019771),(10077,1554857457,0.0000,644075462),(28498,1554857458,0.0000,646725661),(10078,1554857458,0.0000,646776060),(28619,1554857459,0.0000,652819755),(28500,1554857460,0.0000,649418733),(28620,1554857460,0.0000,651326151),(28621,1554857461,0.0000,651905441),(28623,1554857463,0.0000,654648236),(28624,1554857464,0.0000,655349572),(28625,1554857465,99.8493,656333821),(28626,1554857466,0.0000,657135548),(28627,1554857467,0.0000,657967115),(28628,1554857468,0.0000,659677778),(28629,1554857469,0.0335,660264947),(28630,1554857470,0.0000,661524448),(28631,1554857471,0.0837,672548236),(28632,1554857472,0.0502,676369852),(23295,1554857475,0.0500,677717038),(23296,1554857476,0.0000,678816855),(28636,1554857476,99.8713,679842138),(23297,1554857477,0.0200,679514455),(23299,1554857479,98.5592,681070392),(23300,1554857480,0.0000,682551965),(23301,1554857481,0.3183,682595609),(23302,1554857482,0.0000,684345027),(23303,1554857483,0.0502,685157231),(23664,1554857484,0.0000,685490960),(23304,1554857484,0.0000,685838917),(23305,1554857485,0.2178,686015504),(23306,1554857486,0.8707,687085709),(23310,1554857490,99.9686,690153841),(23252,1554857492,0.0000,691589079),(23253,1554857493,0.0339,693189946),(28653,1554857493,98.8285,695367872),(28654,1554857494,99.9367,696911911),(23255,1554857495,0.0000,695500744),(23256,1554857496,0.0000,698510103),(23257,1554857497,0.0931,699109259),(28657,1554857497,76.0880,701315634),(23258,1554857498,0.0000,702144993),(28658,1554857498,84.0418,704054967),(23259,1554857499,0.0339,702437491),(23620,1554857500,0.4726,703240929),(23260,1554857500,0.0000,703297264),(23264,1554857504,0.0406,707696386),(23625,1554857505,5.5262,708579558),(23265,1554857505,0.0000,708878410),(23266,1554857506,0.0000,710189736),(25667,1554857507,0.0000,711469671),(23628,1554857508,0.0000,712034385),(25668,1554857508,0.0000,712096497),(23268,1554857508,0.0000,712395704),(23269,1554857509,0.0000,712767728),(23270,1554857510,0.0000,713251319),(25371,1554857511,0.0000,714085258),(23273,1554857513,3.9699,716151904),(10073,1554857513,1.0986,716209002),(28673,1554857513,74.2073,719183231),(10074,1554857514,0.0000,716997175),(23274,1554857514,0.0000,717268989),(10075,1554857515,0.0000,718093888),(23275,1554857515,0.2205,718522795),(28675,1554857515,34.1072,725780025),(23276,1554857516,0.3160,719056351),(10076,1554857516,0.6991,721002953),(23277,1554857517,1.7977,721640443),(10077,1554857517,0.0000,721697478),(10078,1554857518,0.0000,722053891),(28498,1554857518,0.0000,723669586),(28619,1554857519,0.0000,728360796),(28500,1554857520,0.0000,726226563),(28620,1554857520,0.0000,727447471),(28621,1554857521,0.0000,728568364),(28623,1554857523,0.0000,731402906),(28624,1554857524,0.0000,731916714),(28625,1554857525,99.8828,732849176),(28626,1554857526,0.0000,733672179),(28627,1554857527,0.0000,734888861),(28628,1554857528,0.0000,735619648),(28629,1554857529,0.0335,736604396),(28630,1554857530,0.0000,737672861),(28631,1554857531,0.0502,748816785),(28632,1554857532,0.0167,751911878),(23295,1554857535,0.0500,753402667),(23296,1554857536,0.0000,754275271),(28636,1554857536,99.8713,755242540),(23297,1554857537,0.0200,755077516),(23299,1554857539,98.4087,757087907),(23300,1554857540,0.0000,758370187),(23301,1554857541,0.4355,758954638),(23302,1554857542,0.0000,760381442),(23303,1554857543,0.0335,761535846),(23664,1554857544,0.0000,761775243),(23304,1554857544,0.0000,762129648),(23305,1554857545,0.2010,762851338),(23306,1554857546,0.9216,764194917),(23310,1554857550,99.9686,769504086),(23252,1554857552,0.0000,770303773),(23253,1554857553,0.0169,771739419),(28653,1554857553,98.8285,773904620),(28654,1554857554,99.9367,775394919),(23255,1554857555,0.0000,773918445),(23256,1554857556,0.0508,776418586),(23257,1554857557,0.1100,778130949),(28657,1554857557,76.0880,780623958),(23258,1554857558,0.0000,779311141),(28658,1554857558,84.0418,781538271),(23259,1554857559,0.0345,781779906),(23260,1554857560,0.0000,782865003),(23620,1554857560,0.4726,782923431),(23264,1554857564,0.0643,787092596),(23265,1554857565,0.0000,788171282),(23625,1554857565,5.5260,788541413),(23266,1554857566,0.0000,789127542),(25667,1554857567,0.0000,790303331),(25668,1554857568,0.0000,791580825),(23268,1554857568,0.0000,791639023),(23628,1554857568,0.0000,791668778),(23269,1554857569,0.0000,792643616),(23270,1554857570,0.0000,793100047),(25371,1554857571,0.0169,793750174),(10073,1554857573,1.0985,796450469),(23273,1554857573,3.9699,796506482),(28673,1554857573,74.2073,799668104),(10074,1554857574,0.0000,797751788),(23274,1554857574,0.0000,798065425),(23275,1554857575,0.2205,799151760),(10075,1554857575,0.0000,800064253),(28675,1554857575,34.1072,809725156),(23276,1554857576,0.3160,800863657),(10076,1554857576,0.6991,800926478),(10077,1554857577,0.0000,802627358),(23277,1554857577,1.7976,802729914),(28498,1554857578,0.0000,803511583),(10078,1554857578,0.0166,804829196),(28619,1554857579,0.0000,808348534),(28500,1554857580,0.0000,809067029),(28620,1554857580,0.0000,809405623),(28621,1554857581,0.0000,811456821),(28623,1554857583,0.0000,814008789),(28624,1554857584,0.0000,814700095),(28625,1554857585,99.8660,815667625),(28626,1554857586,0.0000,816821949),(28627,1554857587,0.0000,817677965),(28628,1554857588,0.0000,818252224),(28629,1554857589,0.0168,819259775),(28630,1554857590,0.0000,823931751),(28631,1554857591,0.0503,835379562),(28632,1554857592,0.0670,827974632),(23295,1554857595,0.0700,831733426),(23296,1554857596,0.2400,833094379),(28636,1554857596,99.8713,834841950),(23297,1554857597,0.0900,836129222),(23299,1554857599,93.8830,837781499),(23300,1554857600,0.0000,838086655),(23301,1554857601,0.4190,839438846),(23302,1554857602,0.0000,841082163),(23303,1554857603,0.1173,842054660),(23664,1554857604,0.0000,841993106),(23304,1554857604,0.0000,842526806),(23305,1554857605,0.5362,843975100),(23306,1554857606,5.1926,847857429),(23310,1554857610,99.9686,852447402),(23252,1554857612,0.0000,857957761),(23253,1554857613,0.0339,858464046),(28653,1554857613,98.8285,860597802),(28654,1554857614,99.9367,861533272),(23255,1554857615,0.0000,861850074),(23256,1554857616,0.0000,864815078),(23257,1554857617,0.1352,867658025),(28657,1554857617,76.0811,869883254),(23258,1554857618,0.0000,870449378),(28658,1554857618,84.0418,872395314),(23259,1554857619,0.0169,871364175),(23260,1554857620,0.0000,871859934),(23620,1554857620,0.4722,871929050),(23264,1554857624,0.0575,875088617),(23625,1554857625,5.3422,875945454),(23265,1554857625,0.0000,876003251),(23266,1554857626,0.0000,876398314),(25667,1554857627,0.0169,876542327),(23268,1554857628,0.0000,877085188),(23628,1554857628,0.0000,877142105),(25668,1554857628,0.0000,877174986),(23269,1554857629,0.0000,878228934),(23270,1554857630,0.0000,879210179),(25371,1554857631,0.0000,880382879),(10073,1554857633,1.0984,882095221),(23273,1554857633,3.9753,882422464),(28673,1554857633,74.2073,885471554),(10074,1554857634,0.0000,883132650),(23274,1554857634,0.0000,883191299),(10075,1554857635,0.0000,884066166),(23275,1554857635,0.2205,884122202),(28675,1554857635,34.1072,892103693),(23276,1554857636,0.3160,886148145),(10076,1554857636,0.7156,886204017),(10077,1554857637,0.0000,888483041),(23277,1554857637,1.8141,888537105),(10078,1554857638,0.0166,888656378),(28498,1554857638,0.0000,891174774),(28619,1554857639,0.0000,893484798),(28500,1554857640,0.0000,894495054),(28620,1554857640,0.0000,895608555),(28621,1554857641,0.0000,896940902),(28623,1554857643,0.0000,898880493),(28624,1554857644,0.0000,899626923),(28625,1554857645,99.8995,901080328),(28626,1554857646,0.0000,902428769),(28627,1554857647,0.0168,903418079),(28628,1554857648,0.0000,904123948),(28629,1554857649,0.0000,905395576),(28630,1554857650,0.0000,906042173),(28631,1554857651,0.0503,917706367),(28632,1554857652,0.0335,909675377),(23295,1554857655,0.0600,916319268),(23296,1554857656,0.0900,918973412),(28636,1554857656,99.8713,919255826),(23297,1554857657,0.0700,921500116),(23299,1554857659,92.4263,923517111),(23300,1554857660,0.0000,924472214),(23301,1554857661,0.5696,925069316),(23302,1554857662,0.0000,926980503),(23303,1554857663,0.0838,927103726),(23664,1554857664,0.0169,927243638),(23304,1554857664,0.0000,927804837),(23305,1554857665,0.6872,928850709),(23306,1554857666,6.6220,929282112),(23310,1554857670,99.9686,933256174),(23252,1554857672,0.0000,934707224),(23253,1554857673,0.0339,935055082),(28653,1554857673,98.8285,937380742),(28654,1554857674,99.9367,938335836),(23255,1554857675,0.0000,937083374),(23256,1554857676,0.0169,939571444),(23257,1554857677,0.1564,940394526),(28657,1554857677,76.0811,942467861),(23258,1554857678,0.0000,943325591),(28658,1554857678,84.0418,945298092),(23259,1554857679,0.0000,945860905),(23620,1554857680,0.4804,946717609),(23260,1554857680,0.0000,946784919),(23264,1554857684,0.0508,950960752),(23265,1554857685,0.0000,951893211),(23625,1554857685,5.1601,951956861),(23266,1554857686,0.0000,952772712),(25667,1554857687,0.0000,953200547),(25668,1554857688,0.0000,954250137),(23268,1554857688,0.0000,954311344),(23628,1554857688,0.0000,954338387),(23269,1554857689,0.0000,955616116),(23270,1554857690,0.0000,956384929),(25371,1554857691,0.0000,957202442),(10073,1554857693,1.0986,958713226),(23273,1554857693,3.9753,958776467),(28673,1554857693,74.2073,961945819),(10074,1554857694,0.0000,959827044),(23274,1554857694,0.0000,959884451),(10075,1554857695,0.0000,960533816),(23275,1554857695,0.2205,960984797),(28675,1554857695,34.1072,969047360),(23276,1554857696,0.3160,963563035),(10076,1554857696,0.7324,963623862),(23277,1554857697,1.8310,964195689),(10077,1554857697,0.0000,964256076),(10078,1554857698,0.0000,968107004),(28498,1554857698,0.0000,968790427),(28619,1554857699,0.0000,971857558),(28500,1554857700,0.0000,971143264),(28620,1554857700,0.0000,973471230),(28621,1554857701,0.0000,973474759),(28623,1554857703,0.0000,976085004),(28624,1554857704,0.0000,976735392),(28625,1554857705,99.8492,977761894),(28626,1554857706,0.0000,978600200),(28627,1554857707,0.0000,979940143),(28628,1554857708,0.0000,981584211),(28629,1554857709,0.0335,983018898),(28630,1554857710,0.0000,983669599),(28631,1554857711,0.0503,998995063),(28632,1554857712,0.0838,988248062),(23295,1554857715,0.0600,3996530),(23296,1554857716,0.0400,4889981),(28636,1554857716,99.8713,5896855),(23297,1554857717,0.0600,5749358),(23299,1554857719,95.2221,1951879),(23300,1554857720,0.0000,1406491),(23301,1554857721,1.0565,3767765),(23302,1554857722,0.0000,4796642),(23303,1554857723,0.0503,7534027),(23304,1554857724,0.0000,8647409),(23664,1554857724,0.0169,8726116),(23305,1554857725,0.3688,10294007),(23306,1554857726,2.7494,11472805),(23310,1554857730,99.9686,14798005),(23252,1554857732,0.0000,15835478),(23253,1554857733,0.0339,16284806),(28653,1554857733,98.8285,18529767),(28654,1554857734,99.9367,23536614),(23255,1554857735,0.0000,19063357),(23256,1554857736,0.0000,22134253),(23257,1554857737,0.1825,22286610),(28657,1554857737,76.0739,24424367),(23258,1554857738,0.0000,30564339),(28658,1554857738,84.0418,39383514),(23259,1554857739,0.0169,31699606),(23620,1554857740,0.5004,32143924),(23260,1554857740,0.0000,32205559),(23264,1554857744,0.0575,36473120),(23625,1554857745,5.4667,36759189),(23265,1554857745,0.0000,37061604),(23266,1554857746,0.0000,37467314),(25667,1554857747,0.0000,38876762),(23628,1554857748,0.0000,39427137),(25668,1554857748,0.0000,39496467),(23268,1554857748,0.0000,39910951),(23269,1554857749,0.0000,41224925),(23270,1554857750,0.0000,42288750),(25371,1554857751,0.0000,43004167),(23273,1554857753,3.9754,51574853),(10073,1554857753,1.1169,51807898),(28673,1554857753,74.2073,55027745),(10074,1554857754,0.0000,52639313),(23274,1554857754,0.0000,52699000),(23275,1554857755,0.2205,53731929),(10075,1554857755,0.0000,53941064),(28675,1554857755,34.1072,61680597),(10076,1554857756,0.7277,55173114),(23276,1554857756,0.3008,55241735),(10077,1554857757,0.0000,57477275),(23277,1554857757,1.8445,57537437),(10078,1554857758,0.0000,59435066),(28498,1554857758,0.0000,60885749),(28619,1554857759,0.0000,64209411),(28500,1554857760,0.0000,63125373),(28620,1554857760,0.0000,64755463),(28621,1554857761,0.0000,66463413),(28623,1554857763,0.0000,67647021),(28624,1554857764,0.0000,68728424),(28625,1554857765,99.8827,69627732),(28626,1554857766,0.0000,70568198),(28627,1554857767,0.0000,71557470),(28628,1554857768,0.0000,72084165),(28629,1554857769,0.0168,72609522),(28630,1554857770,0.0000,73057150),(28631,1554857771,0.0503,84433749),(28632,1554857772,0.0503,88000730),(23295,1554857775,0.0500,92060593),(23296,1554857776,0.0100,92956394),(28636,1554857776,99.8713,93614111),(23297,1554857777,0.0500,93138122),(23299,1554857779,93.3590,95700164),(23300,1554857780,0.0000,97528121),(23301,1554857781,0.8219,97894277),(23302,1554857782,0.0000,106978751),(23303,1554857783,0.1006,107626511),(23664,1554857784,0.0000,108438995),(23304,1554857784,0.0000,109109757),(23305,1554857785,0.5703,109402411),(23306,1554857786,5.3329,110281990),(23310,1554857790,99.9686,112783928),(23252,1554857792,0.0000,114205406),(23253,1554857793,0.0169,114850545),(28653,1554857793,98.8285,117049414),(28654,1554857794,99.9367,122379701),(23255,1554857795,0.0000,118876794),(23256,1554857796,0.0000,123817069),(23257,1554857797,0.2155,124631422),(28657,1554857797,76.0738,126947540),(23258,1554857798,0.0000,125387604),(28658,1554857798,84.0418,127603639),(23259,1554857799,0.0169,127485126),(23620,1554857800,0.5033,128148352),(23260,1554857800,0.0000,128207216),(23264,1554857804,0.0609,131432702),(23265,1554857805,0.0000,132327000),(23625,1554857805,5.6743,132700529),(23266,1554857806,0.0000,143351403),(25667,1554857807,0.0000,144413683),(25668,1554857808,0.0000,145976993),(23268,1554857808,0.0000,146039121),(23628,1554857808,0.0000,146066895),(23269,1554857809,0.0034,147231879),(23270,1554857810,0.0000,149039466),(25371,1554857811,0.0000,151593122),(23273,1554857813,3.9716,158061120),(10073,1554857813,1.0981,158123267),(28673,1554857813,74.2073,161674562),(10074,1554857814,0.0333,159488856),(23274,1554857814,0.0003,161667139),(10075,1554857815,0.0000,161874018),(23275,1554857815,0.2205,161937202),(28675,1554857815,34.1072,169779372),(23276,1554857816,0.3042,165377595),(10076,1554857816,0.7320,165440265),(10077,1554857817,0.0000,168989084),(23277,1554857817,1.8798,169701767),(10078,1554857818,0.0000,170787228),(28498,1554857818,0.0000,172326424),(28619,1554857819,0.0000,176028083),(28500,1554857820,0.0000,174330918),(28620,1554857820,0.0000,174968013),(28621,1554857821,0.0000,175639551),(28623,1554857823,0.0000,178100869),(28624,1554857824,0.0000,178846495),(28625,1554857825,99.8492,179190625),(28626,1554857826,0.0000,180091744),(28627,1554857827,0.0000,181939173),(28628,1554857828,0.0000,182616710),(28629,1554857829,0.0335,183131318),(28630,1554857830,0.0000,183879814),(28631,1554857831,0.0670,200405667),(28632,1554857832,0.0503,200225744),(23295,1554857835,0.0500,202591919),(23296,1554857836,0.0500,202947353),(28636,1554857836,99.8713,204757926),(23297,1554857837,0.0500,205705372),(23299,1554857839,95.6908,208190919),(23300,1554857840,0.0000,209590571),(23301,1554857841,1.4422,210351870),(23302,1554857842,0.0000,211406799),(23303,1554857843,0.0838,212254267),(23664,1554857844,0.0000,213364134),(23304,1554857844,0.0000,213744514),(23305,1554857845,0.3857,214763350),(23306,1554857846,1.7105,215723497),(23310,1554857850,99.9686,218403589),(23252,1554857852,0.0000,220068293),(23253,1554857853,0.0339,220650764),(28653,1554857853,98.8285,222885634),(28654,1554857854,99.9367,228245395),(23255,1554857855,0.0000,225590808),(23256,1554857856,0.0000,229161714),(23257,1554857857,0.2884,229804207),(28657,1554857857,76.0738,231897129),(23258,1554857858,0.0000,230663322),(28658,1554857858,84.0418,233540936),(23259,1554857859,0.0339,231969382),(23260,1554857860,0.0000,234303242),(23620,1554857860,0.5103,234363559),(23264,1554857864,0.0846,238429614),(23265,1554857865,0.0000,239419435),(23625,1554857865,5.9062,239484721),(23266,1554857866,0.0000,240626472),(25667,1554857867,0.0000,241132585),(23628,1554857868,0.0000,242170429),(23268,1554857868,0.0000,242552450),(25668,1554857868,0.0000,242604157),(23269,1554857869,0.0000,243157179),(23270,1554857870,0.0000,243746136),(25371,1554857871,0.0338,244309476),(10073,1554857873,1.0984,247509149),(23273,1554857873,3.9666,247572846),(28673,1554857873,74.2073,250655349),(10074,1554857874,0.0333,248392245),(23274,1554857874,0.0000,248750133),(10075,1554857875,0.0000,249603199),(23275,1554857875,0.2205,249664322),(28675,1554857875,34.1072,257438780),(10076,1554857876,0.8322,250408281),(23276,1554857876,0.3143,252548033),(10077,1554857877,0.0000,256498627),(23277,1554857877,1.9638,256559902),(10078,1554857878,0.0499,257661557),(28498,1554857878,0.0000,258971871),(28619,1554857879,0.0000,264057926),(28500,1554857880,0.0000,260628440),(28620,1554857880,0.0000,263209917),(28680,1554857880,0.0013,263932940),(28621,1554857881,0.0000,263653596),(28623,1554857883,0.0000,267038445),(28624,1554857884,0.0000,267935879),(28625,1554857885,99.8827,268839593),(28626,1554857886,0.0000,269748410),(28627,1554857887,0.0000,271424882),(28628,1554857888,0.0000,272185160),(28629,1554857889,0.0000,273090943),(28630,1554857890,0.0000,273970310),(28631,1554857891,0.0671,285896176),(28632,1554857892,0.0335,278456465),(23295,1554857895,0.0500,279579482),(23296,1554857896,0.0200,281315790),(28636,1554857896,99.8713,282872639),(23297,1554857897,0.0400,282827713),(23299,1554857899,97.9715,284302436),(23300,1554857900,0.0000,285816660),(23301,1554857901,0.7041,286368463),(23302,1554857902,0.0000,287287107),(23303,1554857903,0.0671,288513722),(23304,1554857904,0.0000,289979533),(23664,1554857904,0.0000,290059483),(23305,1554857905,0.2012,291526198),(23306,1554857906,0.9723,292874724),(23310,1554857910,99.9686,296928358),(28680,1554857910,0.0008,298589772),(23252,1554857912,0.0000,298124059),(23253,1554857913,0.0339,299651178),(28653,1554857913,98.8285,301282335),(28654,1554857914,99.9367,302867231),(23255,1554857915,0.0000,303575845),(23256,1554857916,0.0169,305118774),(23257,1554857917,0.1142,307789878),(28657,1554857917,76.0739,308148083),(23258,1554857918,0.0000,308504348),(28658,1554857918,84.0418,310629767),(23259,1554857919,0.0000,309407479),(23260,1554857920,0.0000,310503788),(23620,1554857920,0.5080,310570558),(23264,1554857924,0.0575,314359410),(23625,1554857925,5.7427,315743040),(23265,1554857925,0.0000,315810859),(23266,1554857926,0.0000,316607721),(25667,1554857927,0.0000,317368910),(25668,1554857928,0.0000,318216966),(23268,1554857928,0.0000,318309877),(23628,1554857928,0.0000,318635671),(23269,1554857929,0.0000,319501406),(23270,1554857930,0.0000,320522315),(25371,1554857931,0.0000,322113525),(10073,1554857933,1.1319,323897745),(23273,1554857933,3.9653,323962324),(28673,1554857933,74.2073,327438003),(23274,1554857934,0.0000,324645320),(10074,1554857934,0.0000,324715347),(23275,1554857935,0.2205,325891410),(10075,1554857935,0.0000,325955230),(28675,1554857935,34.1072,334151284),(10076,1554857936,0.7490,327278476),(23276,1554857936,0.3181,327345330),(23277,1554857937,1.8644,329126738),(10077,1554857937,0.0000,329192829),(28498,1554857938,0.0000,331607710),(10078,1554857938,0.0166,332371749),(28619,1554857939,0.0000,334754647),(28500,1554857940,0.0000,336037926),(28620,1554857940,0.0000,336678324),(28680,1554857940,0.0011,338118920),(28621,1554857941,0.0000,338855389),(28623,1554857943,0.0000,340881279),(28624,1554857944,0.0000,341642546),(28625,1554857945,99.8324,342393858),(28626,1554857946,0.0000,342996992),(28627,1554857947,0.0000,344946764),(28628,1554857948,0.0000,345413388),(28629,1554857949,0.0335,346685371),(28630,1554857950,0.0000,347399627),(28631,1554857951,0.0503,358322346),(28632,1554857952,0.1005,348818690),(23295,1554857955,0.0500,357582953),(23296,1554857956,0.0400,361193460),(28636,1554857956,99.8713,362063479),(23297,1554857957,0.0500,362410422),(23299,1554857959,97.1328,364115337),(23300,1554857960,0.0000,366092544),(23301,1554857961,1.8773,366394092),(23302,1554857962,0.0000,368590056),(23303,1554857963,0.0671,369156597),(23304,1554857964,0.0000,369927381),(23664,1554857964,0.0000,370001360),(23305,1554857965,0.2347,370724680),(23306,1554857966,0.9388,371825748),(23310,1554857970,99.9686,374490181),(28680,1554857970,0.0010,376616698),(23252,1554857972,0.0000,376512766),(23253,1554857973,0.0339,377751675),(28653,1554857973,98.8285,380120816),(28654,1554857974,99.9367,381513163),(23255,1554857975,0.0000,382176840),(23256,1554857976,0.0339,382724356),(23257,1554857977,0.4192,383630602),(28657,1554857977,76.0739,385612535),(23258,1554857978,0.0000,385191573),(28658,1554857978,84.0418,387565893),(23259,1554857979,0.0169,385813609),(23260,1554857980,0.0000,387070180),(23620,1554857980,0.5029,387118911),(23264,1554857984,0.0609,392532251),(23265,1554857985,0.0000,393583998),(23625,1554857985,5.6759,393881585),(23266,1554857986,0.0000,394333968),(25667,1554857987,0.0000,394829146),(23628,1554857988,0.0000,395493002),(23268,1554857988,0.0000,395558363),(25668,1554857988,0.0000,395889521),(23269,1554857989,0.0000,396934244),(23270,1554857990,0.0000,398074749),(25371,1554857991,0.0000,399395047),(10073,1554857993,1.1319,401905808),(23273,1554857993,3.9653,401970907),(28673,1554857993,74.2073,405535002),(10074,1554857994,0.0000,403097710),(23274,1554857994,0.0000,403161139),(10075,1554857995,0.0000,403966535),(23275,1554857995,0.2205,404241941),(28675,1554857995,34.1072,411892964),(23276,1554857996,0.3181,412034736),(10076,1554857996,0.6990,412082229),(23277,1554857997,1.8308,413038646),(10077,1554857997,0.0000,413102085),(10078,1554857998,0.0000,413899724),(28498,1554857998,0.0000,416122978),(28619,1554857999,0.0000,417327020),(28500,1554858000,0.0000,417707455),(28620,1554858000,0.0000,419822643),(28680,1554858000,0.0018,420628996),(28621,1554858001,0.0000,420478753),(28623,1554858003,0.0000,422584618),(28624,1554858004,0.0000,423534734),(28625,1554858005,99.8827,424371695),(28626,1554858006,0.0000,425337998),(28627,1554858007,0.0000,426128287),(28628,1554858008,0.0000,427652759),(28629,1554858009,0.0000,428241225),(28630,1554858010,0.0000,429155018),(28631,1554858011,0.0838,442528458),(28632,1554858012,0.0168,434594034),(23295,1554858015,0.0500,436199622),(23296,1554858016,0.0100,437578427),(28636,1554858016,99.8713,438554529),(23297,1554858017,0.0400,438957262),(23299,1554858019,95.4393,440593603),(23300,1554858020,0.0000,442374348),(23301,1554858021,0.6036,443242437),(23302,1554858022,0.0000,445058314),(23303,1554858023,0.0503,446140617),(23664,1554858024,0.0000,447272452),(23304,1554858024,0.0000,447665447),(23305,1554858025,0.4193,448548629),(23306,1554858026,3.1025,448962886),(23310,1554858030,99.9686,454254335),(28680,1554858030,0.0009,456638712),(23252,1554858032,0.0000,455117294),(23253,1554858033,0.0339,456502023),(28653,1554858033,98.8285,458741606),(28654,1554858034,99.9367,459963742),(23255,1554858035,0.0000,460712177),(23256,1554858036,0.0169,461685040),(23257,1554858037,0.3124,465110899),(28657,1554858037,76.0739,465303354),(23258,1554858038,0.0000,466489069),(28658,1554858038,84.0418,468561443),(23259,1554858039,0.0169,466983019),(23620,1554858040,0.5035,468034887),(23260,1554858040,0.0000,468097723),(23264,1554858044,0.0542,476604762),(23625,1554858045,5.4424,477711828),(23265,1554858045,0.0000,477779183),(23266,1554858046,0.0000,479303105),(25667,1554858047,0.0000,480107825),(25668,1554858048,0.0000,481169051),(23268,1554858048,0.0000,481545472),(23628,1554858048,0.0000,481586602),(23269,1554858049,0.0000,482651350),(23270,1554858050,0.0000,483692040),(25371,1554858051,0.0000,484706134),(23273,1554858053,3.9653,487852623),(10073,1554858053,1.1317,487920009),(28673,1554858053,74.2073,491097594),(10074,1554858054,0.0000,488875559),(23274,1554858054,0.0000,488944026),(10075,1554858055,0.0000,489827457),(23275,1554858055,0.2205,490086787),(28675,1554858055,34.1072,499079448),(10076,1554858056,0.6991,492580435),(23276,1554858056,0.3181,492644859),(10077,1554858057,0.0000,493234214),(23277,1554858057,1.8309,493319525),(10078,1554858058,0.0000,495971938),(28498,1554858058,0.0000,496987720),(28619,1554858059,0.0000,500035497),(28500,1554858060,0.0000,499274218),(28620,1554858060,0.0000,502141664),(28680,1554858060,0.0015,502784780),(28621,1554858061,0.0000,502741874),(28623,1554858063,0.0000,505026517),(28624,1554858064,0.0000,505800970),(28625,1554858065,99.8156,507062573),(28626,1554858066,0.0000,508070808),(28627,1554858067,0.0168,509162997),(28628,1554858068,0.0000,509860575),(28629,1554858069,0.0168,510748907),(28630,1554858070,0.0000,511221312),(28631,1554858071,0.0503,523269433),(28632,1554858072,0.1006,516122043),(23295,1554858075,0.0500,521561615),(23296,1554858076,0.0500,525428287),(28636,1554858076,99.8713,525770347),(23297,1554858077,0.0500,526178431),(23299,1554858079,85.6472,528130701),(23300,1554858080,0.0000,529232528),(23301,1554858081,12.0557,529316402),(23302,1554858082,0.0000,530979773),(23303,1554858083,0.0838,532638249),(23664,1554858084,0.0000,533366495),(23304,1554858084,0.0000,533768386),(23305,1554858085,0.4023,534746864),(23306,1554858086,1.8609,535176024),(23310,1554858090,99.9686,539619045),(28680,1554858090,0.0008,541581357),(23252,1554858092,0.0000,541663598),(23253,1554858093,0.0169,542499484),(28653,1554858093,98.8285,544834387),(28654,1554858094,99.9367,549421379),(23255,1554858095,0.0000,546760376),(23256,1554858096,0.0169,548365028),(23257,1554858097,2.6024,550774029),(28657,1554858097,76.0739,553169958),(23258,1554858098,0.0000,551489305),(28658,1554858098,84.0418,553604251),(23259,1554858099,0.0169,552310270),(23260,1554858100,0.0000,553426013),(23620,1554858100,0.5019,553490886),(23264,1554858104,0.0711,558896442),(23265,1554858105,0.0000,559592291),(23625,1554858105,5.7089,559651438),(23266,1554858106,0.0000,560234200),(25667,1554858107,0.0000,561196812),(23268,1554858108,0.0000,562305316),(23628,1554858108,0.0000,562366998),(25668,1554858108,0.0000,562402695),(23269,1554858109,0.0034,563310173),(23270,1554858110,0.0000,564178612),(25371,1554858111,0.0172,565162281),(23273,1554858113,3.9653,566413313),(10073,1554858113,1.1318,566750788),(28673,1554858113,74.2073,569858430),(10074,1554858114,0.0000,567265992),(23274,1554858114,0.0000,567330256),(23275,1554858115,0.2205,568425668),(10075,1554858115,0.0000,569262097),(28675,1554858115,34.1072,576845973),(10076,1554858116,0.6991,569981442),(23276,1554858116,0.3181,570046377),(10077,1554858117,0.0000,571598265),(23277,1554858117,1.8309,571662548),(10078,1554858118,0.0000,573698623),(28498,1554858118,0.0000,575162168),(28619,1554858119,0.0000,577503312),(28500,1554858120,0.0000,578333691),(28620,1554858120,0.0000,579138590),(28680,1554858120,0.0014,579787349),(28621,1554858121,0.0000,581102065),(28623,1554858123,0.0000,582132988),(28624,1554858124,0.0000,583209179),(28625,1554858125,99.8492,584674348),(28626,1554858126,0.0000,585270101),(28627,1554858127,0.0000,585605535),(28628,1554858128,0.0000,587217289),(28629,1554858129,0.0503,588042182),(28630,1554858130,0.0000,589183260),(28631,1554858131,0.0670,600374943),(28632,1554858132,0.0335,603363589),(23295,1554858135,0.0500,602598676),(23296,1554858136,0.0200,604370068),(28636,1554858136,99.8713,605495556),(23297,1554858137,0.0400,605913929),(23299,1554858139,97.1999,607644518),(23300,1554858140,0.0000,609645187),(23301,1554858141,0.7716,610013968),(23302,1554858142,0.0000,611660551),(23303,1554858143,0.0671,612294019),(23304,1554858144,0.0000,613381290),(23664,1554858144,0.0000,613456565),(23305,1554858145,0.2684,614930449),(23306,1554858146,1.6605,615188374),(23310,1554858150,99.9686,620313662),(28680,1554858150,0.0008,622258042),(23252,1554858152,0.0000,622933923),(23253,1554858153,0.0339,623429937),(28653,1554858153,98.8285,625561447),(28654,1554858154,99.9367,633700159),(23255,1554858155,0.0000,628526460),(23256,1554858156,0.0000,632282547),(23257,1554858157,0.2249,632874843),(28657,1554858157,76.0739,635175907),(23258,1554858158,0.0000,636279960),(28658,1554858158,84.0418,636451688),(23259,1554858159,0.0000,637064384),(23620,1554858160,0.4844,638227203),(23260,1554858160,0.0000,638291995),(23264,1554858164,0.0778,649926300),(23625,1554858165,5.5250,650451703),(23265,1554858165,0.0000,650975296),(23266,1554858166,0.0000,653813943),(25667,1554858167,0.0000,656967881),(23628,1554858168,0.0000,657213356),(23268,1554858168,0.0000,657282048),(25668,1554858168,0.0000,659069382),(23269,1554858169,0.0000,662018231),(23270,1554858170,0.0000,662507655),(25371,1554858171,0.0169,665354480),(10073,1554858173,1.1314,669053986),(23273,1554858173,3.9653,669135839),(28673,1554858173,74.2073,672386925),(23274,1554858174,0.0000,669983161),(10074,1554858174,0.0000,670048372),(23275,1554858175,0.2205,671052531),(10075,1554858175,0.0000,671483934),(28675,1554858175,34.1072,679380801),(10076,1554858176,0.6988,677296872),(23276,1554858176,0.3181,677598525),(10077,1554858177,0.0000,678653057),(23277,1554858177,1.8301,678717495),(28498,1554858178,0.0000,679998579),(10078,1554858178,0.0166,681928277),(28619,1554858179,0.0000,687974711),(28500,1554858180,0.0000,688888940),(28620,1554858180,0.0000,689433327),(28680,1554858180,0.0011,690838698),(28621,1554858181,0.0000,691182249),(28623,1554858183,0.0000,692016261),(28624,1554858184,0.0000,692977831),(28625,1554858185,99.8659,694060421),(28626,1554858186,0.0000,700215194),(28627,1554858187,0.0000,698127233),(28628,1554858188,0.0000,698788647),(28629,1554858189,0.0335,699409216),(28630,1554858190,0.0000,701481852),(28631,1554858191,0.0335,718638849),(28632,1554858192,0.0670,705893422),(23295,1554858195,0.0500,709981759),(23296,1554858196,0.0100,713413898),(28636,1554858196,99.8713,717958985),(23297,1554858197,0.0300,714175450),(23299,1554858199,97.2506,715019125),(23300,1554858200,0.0000,716623750),(23301,1554858201,0.6871,717127160),(23302,1554858202,0.0000,718472465),(23303,1554858203,0.0503,719605600),(23664,1554858204,0.0000,720686227),(23304,1554858204,0.0000,721276211),(23305,1554858205,0.3017,722125685),(23306,1554858206,1.7259,722304640),(23310,1554858210,99.9686,726505068),(28680,1554858210,0.0009,728025645),(23252,1554858212,0.0000,727928542),(23253,1554858213,0.0339,728727685),(28653,1554858213,98.8285,731021309),(28654,1554858214,99.9367,732595905),(23255,1554858215,0.0000,731514440),(23256,1554858216,0.0000,733991454),(23257,1554858217,0.1058,734589310),(28657,1554858217,76.0810,736937013),(23258,1554858218,0.0000,736077940),(28658,1554858218,84.0418,738318899),(23259,1554858219,0.0000,736384175),(23260,1554858220,0.0000,736559817),(23620,1554858220,0.4796,736621819),(23264,1554858224,0.0812,749225469),(23265,1554858225,0.0000,749699048),(23625,1554858225,5.5241,750396283),(23266,1554858226,0.0000,750904241),(25667,1554858227,0.0169,752770038),(23268,1554858228,0.0000,753560814),(25668,1554858228,0.0000,753627531),(23628,1554858228,0.0000,753658646),(23269,1554858229,0.0000,754741611),(23270,1554858230,0.0000,755461630),(25371,1554858231,0.0677,756854914),(10073,1554858233,1.1316,758477516),(23273,1554858233,3.9653,758537092),(28673,1554858233,74.2073,761851992),(10074,1554858234,0.0000,759718205),(23274,1554858234,0.0000,760045310),(10075,1554858235,0.0000,761077495),(23275,1554858235,0.2205,761168674),(28675,1554858235,34.1072,768753329),(10076,1554858236,0.6990,761498232),(23276,1554858236,0.3181,761561410),(23277,1554858237,1.8307,764681947),(10077,1554858237,0.0000,764742329),(10078,1554858238,0.0166,765529693),(28498,1554858238,0.0000,768187725),(28619,1554858239,0.0000,771970027),(28500,1554858240,0.0000,769986812),(28620,1554858240,0.0000,772511109),(28680,1554858240,0.0015,773088706),(28621,1554858241,0.0000,772630977),(28623,1554858243,0.0000,775976714),(28624,1554858244,0.0000,776891388),(28625,1554858245,99.9162,777121637),(28626,1554858246,0.0000,779374512),(28627,1554858247,0.0000,780549244),(28628,1554858248,0.0000,781378488),(28629,1554858249,0.0000,782096044),(28630,1554858250,0.0000,783427433),(28631,1554858251,0.0838,810119074),(28632,1554858252,0.0000,795983605),(23295,1554858255,0.0500,797130918),(23296,1554858256,0.0000,799146116),(28636,1554858256,99.8713,799760074),(23297,1554858257,0.0300,800342017),(23299,1554858259,97.2837,802010866),(23300,1554858260,0.0000,803027078),(23301,1554858261,0.5198,804217687),(23302,1554858262,0.0000,806134407),(23303,1554858263,0.0671,806171350),(23664,1554858264,0.0000,807365332),(23304,1554858264,0.0000,807707675),(23305,1554858265,0.3857,808632675),(23306,1554858266,1.7276,809773922),(23310,1554858270,99.9686,811989791),(28680,1554858270,0.0008,814559677),(23252,1554858272,0.0000,814321284),(23253,1554858273,0.0339,815604115),(28653,1554858273,98.8285,817889416),(28654,1554858274,99.9367,822802814),(23255,1554858275,0.0000,821829939),(23256,1554858276,0.0508,823633976),(23257,1554858277,0.0973,824619702),(28657,1554858277,76.0809,826929392),(23258,1554858278,0.0000,827610572),(28658,1554858278,84.0418,829917876),(23259,1554858279,0.0339,828891506),(23620,1554858280,0.4796,829633556),(23260,1554858280,0.0000,829699784),(23264,1554858284,0.0508,835269459),(23625,1554858285,5.5254,836629399),(23265,1554858285,0.0000,836691898),(23266,1554858286,0.0000,837824974),(25667,1554858287,0.0000,838337887),(25668,1554858288,0.0000,839267693),(23628,1554858288,0.0000,839329007),(23268,1554858288,0.0000,839615566),(23269,1554858289,0.0034,840289015),(23270,1554858290,0.0000,841783639),(25371,1554858291,0.0000,842210409),(10073,1554858293,1.1317,844922490),(23273,1554858293,3.9653,844982001),(28673,1554858293,74.2073,848074506),(23274,1554858294,0.0000,845587690),(10074,1554858294,0.0000,845648428),(23275,1554858295,0.2205,846994624),(10075,1554858295,0.0000,848704763),(28675,1554858295,34.1072,854818209),(10076,1554858296,0.6990,849449488),(23276,1554858296,0.3181,849516852),(23277,1554858297,1.8307,850483845),(10077,1554858297,0.0000,853387517),(10078,1554858298,0.0000,855515371),(28498,1554858298,0.0000,856487054),(28619,1554858299,0.0000,858520857),(28500,1554858300,0.0000,859334474),(28620,1554858300,0.0000,861017642),(28680,1554858300,0.0018,861793240),(28621,1554858301,0.0000,861538644),(28623,1554858303,0.0000,863615176),(28624,1554858304,0.0000,864169596),(28625,1554858305,99.8660,865070421),(28626,1554858306,0.0000,866207029),(28627,1554858307,0.0000,867148950),(28628,1554858308,0.0000,868028233),(28629,1554858309,0.0000,868947174),(28630,1554858310,0.0000,870105944),(28631,1554858311,0.0670,891460698),(28632,1554858312,0.0670,879523094),(23295,1554858315,0.0500,880836284),(23296,1554858316,0.0000,882250266),(28636,1554858316,99.8713,883251411),(23297,1554858317,0.0200,883114099),(23299,1554858319,97.4333,885792754),(23300,1554858320,0.0000,886912228),(23301,1554858321,0.3858,887253910),(23302,1554858322,0.0000,888616387),(23303,1554858323,0.0671,889940263),(23664,1554858324,0.0000,890748333),(23304,1554858324,0.0000,891104728),(23305,1554858325,0.6038,892190926),(23306,1554858326,2.1801,899873862),(23310,1554858330,99.9686,904572440),(28680,1554858330,0.0008,906064383),(23252,1554858332,0.0000,905390239),(23253,1554858333,0.0169,906046869),(28653,1554858333,98.8285,908357517),(28654,1554858334,99.9367,909953134),(23255,1554858335,0.0000,911254045),(23256,1554858336,0.0339,912456614),(23257,1554858337,0.1310,913555579),(28657,1554858337,76.0361,915857353),(23258,1554858338,0.0000,916778300),(28658,1554858338,84.0418,917042739),(23259,1554858339,0.0169,917056834),(23620,1554858340,0.4781,917666560),(23260,1554858340,0.0000,917731460),(23264,1554858344,0.0609,921035085),(23265,1554858345,0.0000,922431075),(23625,1554858345,5.3590,922495349),(23266,1554858346,0.0000,923736089),(25667,1554858347,0.0000,924801209),(23268,1554858348,0.0000,926158655),(23628,1554858348,0.0000,926220929),(25668,1554858348,0.0000,926258622),(23269,1554858349,0.0000,927028162),(23270,1554858350,0.0000,928575269),(25371,1554858351,0.0169,929259177),(10073,1554858353,1.1317,931746354),(23273,1554858353,3.9653,931806904),(28673,1554858353,74.2073,934931716),(23274,1554858354,0.0000,932397573),(10074,1554858354,0.0000,932456812),(23275,1554858355,0.2205,933667697),(10075,1554858355,0.0000,933953490),(28675,1554858355,34.1072,941639871),(10076,1554858356,0.6990,939388624),(23276,1554858356,0.3181,939446014),(23277,1554858357,1.8306,940617731),(10077,1554858357,0.0000,940681869),(10078,1554858358,0.0000,943713663),(28498,1554858358,0.0000,944468304),(28619,1554858359,0.0000,946590554),(28500,1554858360,0.0000,947624076),(28620,1554858360,0.0000,949566042),(28680,1554858360,0.0011,951018803),(28621,1554858361,0.0000,950835287),(28623,1554858363,0.0000,953685798),(28624,1554858364,0.0000,954148366),(28625,1554858365,99.8827,954840104),(28626,1554858366,0.0000,955865141),(28627,1554858367,0.0000,957558434),(28628,1554858368,0.0000,957930323),(28629,1554858369,0.0168,958495155),(28630,1554858370,0.0000,959396811),(28631,1554858371,0.0670,970832739),(28632,1554858372,0.0335,974067370),(23295,1554858375,0.0500,974609552),(23296,1554858376,0.0000,975998956),(28636,1554858376,99.8713,976744373),(23297,1554858377,0.0200,976459799),(23299,1554858379,96.1938,977715074),(23300,1554858380,0.0000,979389065),(23301,1554858381,0.6708,979712462),(23302,1554858382,0.0000,981204245),(23303,1554858383,0.0671,981125411),(23664,1554858384,0.0000,982016129),(23304,1554858384,0.0000,982367725),(23305,1554858385,0.3857,982682221),(23306,1554858386,2.1134,983663669),(23310,1554858390,99.9686,986275695),(28680,1554858390,0.0009,987563124),(23252,1554858392,0.0000,987276792),(23253,1554858393,0.0339,987425680),(28653,1554858393,98.8285,990118262),(28654,1554858394,99.9367,995683537),(23255,1554858395,0.0169,993158846),(23256,1554858396,0.0508,994578547),(23257,1554858397,0.1438,997303132),(28657,1554858397,76.0353,999483089),(23258,1554858398,0.0000,998774056),(23259,1554858399,0.0000,772636),(28658,1554858399,84.0418,923735),(23260,1554858400,0.0000,1352561),(23620,1554858400,0.4781,1410859),(23264,1554858404,0.0654,5289304),(23625,1554858405,5.3145,5724200),(23265,1554858405,0.0000,5784105),(23266,1554858406,0.0000,6192351),(25667,1554858407,0.0000,6971738),(23628,1554858408,0.0000,7548740),(25668,1554858408,0.0000,7974831),(23268,1554858408,0.0000,8016055),(23269,1554858409,0.0034,8957731),(23270,1554858410,0.0000,9611611),(25371,1554858411,0.0000,10790525),(10073,1554858413,1.1510,12146142),(23273,1554858413,3.9653,12204698),(28673,1554858413,74.2073,15162063),(23274,1554858414,0.0000,13347889),(10074,1554858414,0.0000,13411701),(10075,1554858415,0.0000,14667645),(23275,1554858415,0.2205,14724604),(28675,1554858415,34.1072,22400871),(23276,1554858416,0.3181,16317753),(10076,1554858416,0.7109,16373022),(10077,1554858417,0.0000,17539115),(23277,1554858417,1.8620,17594333),(10078,1554858418,0.0000,20561873),(28498,1554858418,0.0000,22766282),(28619,1554858419,0.0000,24357365),(28500,1554858420,0.0000,24662028),(28620,1554858420,0.0000,25976483),(28680,1554858420,0.0010,27377371),(28621,1554858421,0.0000,26587770),(28623,1554858423,0.0000,28862717),(28624,1554858424,0.0000,29532732),(28625,1554858425,99.8492,30519605),(28626,1554858426,0.0000,30889186),(28627,1554858427,0.0000,32471222),(28628,1554858428,0.0000,33211222),(28629,1554858429,0.0335,34668547),(28630,1554858430,0.0000,35719480),(28631,1554858431,0.0670,47368895),(28632,1554858432,0.0503,39807900),(23295,1554858435,0.0500,43535447),(28636,1554858436,99.8713,46372173),(23296,1554858436,0.0000,46698823),(23297,1554858437,0.0100,47136883),(23299,1554858439,96.8451,49590021),(23300,1554858440,0.0000,51188112),(23301,1554858441,0.5704,52218174),(23302,1554858442,0.0000,54312229),(23303,1554858443,0.1006,54057554),(23664,1554858444,0.0000,54619183),(23304,1554858444,0.0000,55032516),(23305,1554858445,0.3860,56319118),(23306,1554858446,2.4329,57696215),(23310,1554858450,99.9686,60753792),(28680,1554858450,0.0008,63409469),(23252,1554858452,0.0000,62514415),(23253,1554858453,0.0339,63045560),(28653,1554858453,98.8285,65404541),(28654,1554858454,99.9367,72097803),(23255,1554858455,0.0000,68603354),(23256,1554858456,0.0339,69178782),(23257,1554858457,0.1274,70849358),(28657,1554858457,76.0353,73236772),(23258,1554858458,0.0000,73923122),(28658,1554858458,84.0418,76308089),(23259,1554858459,0.0000,74960886),(23260,1554858460,0.0000,75636816),(23620,1554858460,0.4810,75696496),(23264,1554858464,0.0677,80355504),(23265,1554858465,0.0000,81842949),(23625,1554858465,5.7094,82115997),(23266,1554858466,0.0000,91917301),(25667,1554858467,0.0000,92696335),(25668,1554858468,0.0000,94017047),(23268,1554858468,0.0000,94326638),(23628,1554858468,0.0000,94371205),(23269,1554858469,0.0000,95249385),(23270,1554858470,0.0000,96761494),(25371,1554858471,0.0338,97639562),(10073,1554858473,1.1317,99796027),(23273,1554858473,3.9653,99852354),(28673,1554858473,74.2073,102945115),(10074,1554858474,0.0000,100087946),(23274,1554858474,0.0000,100147825),(23275,1554858475,0.2205,100808811),(10075,1554858475,0.0000,101306341),(28675,1554858475,34.1072,109131715),(10076,1554858476,0.7488,109534936),(23276,1554858476,0.3181,109579496),(10077,1554858477,0.0000,110448561),(23277,1554858477,1.8804,110784504),(10078,1554858478,0.0499,111199019),(28498,1554858478,0.0000,112250173),(28619,1554858479,0.0000,116144816),(28500,1554858480,0.0000,114828443),(28620,1554858480,0.0000,116404075),(28680,1554858480,0.0011,117750090),(28621,1554858481,0.0000,118596914),(28623,1554858483,0.0000,119902583),(28624,1554858484,0.0000,120901942),(28625,1554858485,99.8660,121614172),(28626,1554858486,0.0000,124421667),(28627,1554858487,0.0168,125568734),(28628,1554858488,0.0000,126363870),(28629,1554858489,0.0168,126814380),(28630,1554858490,0.0000,127921064),(28631,1554858491,0.0838,139561474),(28632,1554858492,0.0168,142825664),(23295,1554858495,0.0500,142194229),(23296,1554858496,0.0000,144366357),(28636,1554858496,99.8713,145514122),(23297,1554858497,0.0100,144722871),(23299,1554858499,96.6650,146644164),(23300,1554858500,0.0000,147705886),(23301,1554858501,0.4357,148561932),(23302,1554858502,0.0000,151168804),(23303,1554858503,0.0503,150830109),(23304,1554858504,0.0000,151542641),(23664,1554858504,0.0000,151613603),(23305,1554858505,0.3519,153147076),(23306,1554858506,2.0275,153554407),(23310,1554858510,99.9686,157645392),(28680,1554858510,0.0008,159049652),(23252,1554858512,0.0000,159373453),(23253,1554858513,0.0169,161267037),(28653,1554858513,98.8285,163824901),(28654,1554858514,99.9367,164895670),(23255,1554858515,0.0000,164711443),(23256,1554858516,0.0339,166788669),(23257,1554858517,0.1322,167319564),(28657,1554858517,76.0363,169574448),(23258,1554858518,0.0000,170409073),(28658,1554858518,84.0418,172540123),(23259,1554858519,0.0339,171076304),(23260,1554858520,0.0000,171492335),(23620,1554858520,0.4813,171553509),(23264,1554858524,0.0542,176301262),(23625,1554858525,5.7409,177635869),(23265,1554858525,0.0000,177699434),(23266,1554858526,0.0000,178445812),(25667,1554858527,0.0169,179252589),(23268,1554858528,0.0000,179764409),(25668,1554858528,0.0000,179827287),(23628,1554858528,0.0000,179856599),(23269,1554858529,0.0068,180615967),(23270,1554858530,0.0000,182011707),(25371,1554858531,0.0000,183435957),(10073,1554858533,1.1317,184820396),(23273,1554858533,3.9653,185086150),(28673,1554858533,74.2073,188424333),(23274,1554858534,0.0000,185223827),(10074,1554858534,0.0000,185675627),(10075,1554858535,0.0000,186646375),(23275,1554858535,0.2205,186857959),(28675,1554858535,34.1072,194454531),(23276,1554858536,0.3181,187878827),(10076,1554858536,0.7324,187940190),(23277,1554858537,1.8642,189931570),(10077,1554858537,0.0000,190194682),(28498,1554858538,0.0000,190888676),(10078,1554858538,0.0166,192085139),(28619,1554858539,0.0000,196258076),(28500,1554858540,0.0000,194800788),(28620,1554858540,0.0000,196820587),(28680,1554858540,0.0018,197434212),(28621,1554858541,0.0000,198402331),(28623,1554858543,0.0000,199399394),(28624,1554858544,0.0000,201425278),(28625,1554858545,99.5980,201606246),(28626,1554858546,0.0000,202529115),(28627,1554858547,0.0000,203269067),(28628,1554858548,0.0000,204409277),(28629,1554858549,0.0335,205063318),(28630,1554858550,0.0000,205925487),(28631,1554858551,0.1675,217810566),(28632,1554858552,0.2177,211190356),(23295,1554858555,0.0500,216286548),(23296,1554858556,0.0600,218749549),(28636,1554858556,99.8713,220410775),(23297,1554858557,0.0300,219586779),(23299,1554858559,96.2963,220966503),(23300,1554858560,0.0000,221392990),(23301,1554858561,0.6539,222827468),(23302,1554858562,0.0000,223302939),(23303,1554858563,0.0671,224668768),(23664,1554858564,0.0000,224825991),(23304,1554858564,0.0000,225545474),(23305,1554858565,0.3688,226944150),(23306,1554858566,2.4648,227722628),(23310,1554858570,99.9686,231041378),(28680,1554858570,0.0008,233256764),(23252,1554858572,0.0000,233533075),(23253,1554858573,0.0169,234553359),(28653,1554858573,98.8285,236807753),(28654,1554858574,99.9367,241173330),(23255,1554858575,0.0169,236379948),(23256,1554858576,0.0169,238770436),(23257,1554858577,0.1775,241856692),(28657,1554858577,76.0363,243845963),(23258,1554858578,0.0000,244412705),(28658,1554858578,84.0418,244790270),(23259,1554858579,0.0169,245148169),(23620,1554858580,0.4831,246203904),(23260,1554858580,0.0000,246270651),(23264,1554858584,0.0542,248987586),(23265,1554858585,0.0000,250036909),(23625,1554858585,5.6764,250466669),(23266,1554858586,0.0000,251452290),(25667,1554858587,0.0000,252532787),(23628,1554858588,0.0000,252677372),(23268,1554858588,0.0000,253005680),(25668,1554858588,0.0000,253053004),(23269,1554858589,0.0000,253554994),(23270,1554858590,0.0000,254973036),(25371,1554858591,0.0000,255985365),(23273,1554858593,3.9653,264260419),(10073,1554858593,1.1318,264326246),(28673,1554858593,74.2073,267475547),(23274,1554858594,0.0000,265481551),(10074,1554858594,0.0000,265541200),(23275,1554858595,0.2205,266813834),(10075,1554858595,0.0000,268198579),(28675,1554858595,34.1072,274600801),(23276,1554858596,0.3181,268636128),(10076,1554858596,0.6990,269532378),(10077,1554858597,0.0000,269813992),(23277,1554858597,1.8474,272772362),(28498,1554858598,0.0000,273496448),(10078,1554858598,0.0000,273571565),(28619,1554858599,0.0000,280439625),(28620,1554858600,0.0000,278876059),(28680,1554858600,0.0013,279595675),(28500,1554858600,0.0000,280019292),(28621,1554858601,0.0000,281630543),(28623,1554858603,0.0000,284520182),(28624,1554858604,0.0000,285089474),(28625,1554858605,99.8659,285812408),(28626,1554858606,0.0000,286427966),(28627,1554858607,0.0503,287347331),(28628,1554858608,0.0000,292743520),(28629,1554858609,0.0000,293192783),(28630,1554858610,0.0000,293482747),(28631,1554858611,0.0503,305121793),(28632,1554858612,0.0168,309097388),(23295,1554858615,0.0700,311996979),(23296,1554858616,0.2900,313806227),(28636,1554858616,99.8713,314447380),(23297,1554858617,0.1000,315437162),(23299,1554858619,94.7510,317121054),(23300,1554858620,0.0000,318727246),(23301,1554858621,0.8050,318563878),(23302,1554858622,0.0000,320135225),(23303,1554858623,0.0838,320242119),(23664,1554858624,0.0000,321039971),(23304,1554858624,0.0000,321423993),(23305,1554858625,0.5700,322362998),(23306,1554858626,4.7443,323684774),(23310,1554858630,99.9686,326308299),(28680,1554858630,0.0008,328497304),(23252,1554858632,0.0000,328828867),(23253,1554858633,0.0169,330963447),(28653,1554858633,98.8285,331319241),(28654,1554858634,99.9367,334067544),(23255,1554858635,0.0000,332617634),(23256,1554858636,0.0169,336339818),(23257,1554858637,0.1269,339000449),(28657,1554858637,76.0363,339348114),(23258,1554858638,0.0000,341183400),(28658,1554858638,84.0418,341501550),(23259,1554858639,0.0169,341895375),(23260,1554858640,0.0000,342682134),(23620,1554858640,0.4876,342743895),(23264,1554858644,0.1319,347351606),(23625,1554858645,5.6740,348981527),(23265,1554858645,0.0000,349279702),(23266,1554858646,0.0000,350292641),(25667,1554858647,0.0000,350889699),(25668,1554858648,0.0000,351088637),(23268,1554858648,0.0000,351529376),(23628,1554858648,0.0000,351571382),(23269,1554858649,0.0000,352098310),(23270,1554858650,0.0000,353696592),(25371,1554858651,0.0000,354352048),(23273,1554858653,3.9721,355887166),(10073,1554858653,1.1316,355948714),(28673,1554858653,74.2073,359384059),(10074,1554858654,0.0000,357311689),(23274,1554858654,0.0000,357372725),(10075,1554858655,0.0000,358196022),(23275,1554858655,0.2217,361135363),(28675,1554858655,34.1072,366339578),(10076,1554858656,0.6989,362233990),(23276,1554858656,0.3181,362294306),(23277,1554858657,1.8139,365201056),(10077,1554858657,0.0000,365266144),(10078,1554858658,0.0000,366032610),(28498,1554858658,0.0000,368009734),(28619,1554858659,0.0000,372093347),(28620,1554858660,0.0000,372251704),(28680,1554858660,0.0016,373260683),(28500,1554858660,0.0000,373420524),(28621,1554858661,0.0000,374669667),(28623,1554858663,0.0000,375901017),(28624,1554858664,0.0000,377505904),(28625,1554858665,99.8492,378691238),(28626,1554858666,0.0000,379426142),(28627,1554858667,0.0000,380272886),(28628,1554858668,0.0000,381922053),(28629,1554858669,0.0335,382949934),(28630,1554858670,0.0000,384009186),(28631,1554858671,0.0503,395656756),(28632,1554858672,0.0838,398504945),(23295,1554858675,0.0700,399724056),(23296,1554858676,0.1500,401332411),(28636,1554858676,99.8713,402867604),(23297,1554858677,0.1000,402679470),(23299,1554858679,95.1743,404386302),(23300,1554858680,0.0000,405737732),(23301,1554858681,0.6033,406703342),(23302,1554858682,0.0000,407884074),(23303,1554858683,0.0838,408602401),(23664,1554858684,0.0000,409236105),(23304,1554858684,0.0000,409847751),(23305,1554858685,0.4526,410748180),(23306,1554858686,2.8658,411352676),(23310,1554858690,99.9686,414440206),(28680,1554858690,0.0008,416959588),(23252,1554858692,0.0000,416119205),(23253,1554858693,0.0169,416519296),(28653,1554858693,98.8285,418692209),(28654,1554858694,99.9367,421318546),(23255,1554858695,0.0000,420582963),(23256,1554858696,0.0508,422812522),(23257,1554858697,0.1062,423823084),(28657,1554858697,76.0363,425954143),(23258,1554858698,0.0000,424244542),(28658,1554858698,84.0418,426441706),(23259,1554858699,0.0339,426529064),(23620,1554858700,0.4842,426705946),(23260,1554858700,0.0000,426766389),(23264,1554858704,0.0542,430875243),(23265,1554858705,0.0000,431514124),(23625,1554858705,5.6755,431568206),(23266,1554858706,0.0000,432146811),(25667,1554858707,0.0000,434259253),(25668,1554858708,0.0000,434861369),(23628,1554858708,0.0000,434959780),(23268,1554858708,0.0000,435303943),(23269,1554858709,0.0000,436553564),(23270,1554858710,0.0000,437720360),(25371,1554858711,0.0338,438576237),(10073,1554858713,1.1317,441339236),(23273,1554858713,3.9734,441605834),(28673,1554858713,74.2230,444599085),(10074,1554858714,0.0000,442419210),(23274,1554858714,0.0000,442474369),(23275,1554858715,0.2205,443329863),(10075,1554858715,0.0000,445221703),(28675,1554858715,34.4960,451038264),(10076,1554858716,0.6325,445366900),(23276,1554858716,0.3181,446398971),(23277,1554858717,1.7643,446691914),(10077,1554858717,0.0000,449625066),(10078,1554858718,0.0666,451319921),(28498,1554858718,0.0000,452027708),(28619,1554858719,0.0000,454088324),(28500,1554858720,0.0000,453654133),(28680,1554858720,0.0000,455238918),(28620,1554858720,0.0000,455728901),(28621,1554858721,0.0000,456860254),(28623,1554858723,0.0000,458931802),(28624,1554858724,0.0000,460113193),(28625,1554858725,98.4600,461090462),(28626,1554858726,0.0000,462179500),(28627,1554858727,0.1674,463027103),(28628,1554858728,0.0000,464549552),(28629,1554858729,0.0502,465650712),(28630,1554858730,0.0000,465922442),(28631,1554858731,0.4017,477671931),(28632,1554858732,0.9036,481519666),(23295,1554858735,0.0700,484605862),(28636,1554858736,99.8713,486869413),(23296,1554858736,0.1000,487261358),(23297,1554858737,0.1000,487427255),(23299,1554858739,98.3906,489657898),(23300,1554858740,0.0000,495622850),(23301,1554858741,0.4526,496438578),(23302,1554858742,0.0000,497842564),(23303,1554858743,0.0503,499175251),(23664,1554858744,0.0000,500188461),(23304,1554858744,0.0000,500616422),(23305,1554858745,0.3688,501533673),(23306,1554858746,2.2971,502336044),(23310,1554858750,99.9686,509540037),(28680,1554858750,0.0000,510330297),(23252,1554858752,0.0000,516053059),(23253,1554858753,0.0339,518249209),(28653,1554858753,98.8285,518632776),(28654,1554858754,99.9367,521767910),(23255,1554858755,0.0000,520720374),(23256,1554858756,0.0339,521329420),(23257,1554858757,0.0762,524311968),(28657,1554858757,76.0363,526261748),(23258,1554858758,0.0000,526710649),(28658,1554858758,84.0418,527051461),(23259,1554858759,0.0000,527007342),(23260,1554858760,0.0000,527719057),(23620,1554858760,0.4798,527775339),(23264,1554858764,0.0508,531452527),(23265,1554858765,0.0000,532199133),(23625,1554858765,5.5407,532265720),(23266,1554858766,0.0000,533103982),(25667,1554858767,0.0000,533787360),(23268,1554858768,0.0000,538598781),(23628,1554858768,0.0000,538647599),(25668,1554858768,0.0000,538676102),(23269,1554858769,0.0000,539637606),(23270,1554858770,0.0000,540926957),(25371,1554858771,0.0000,541936115),(23273,1554858773,3.9734,543693631),(10073,1554858773,1.1480,544097620),(28673,1554858773,74.2230,546970459),(10074,1554858774,0.0000,544581265),(23274,1554858774,0.0000,544975949),(23275,1554858775,0.2205,548239051),(10075,1554858775,0.0000,548300203),(28675,1554858775,34.4960,552816037),(23276,1554858776,0.3181,558255601),(10076,1554858776,0.6321,558603041),(10077,1554858777,0.0000,559337390),(23277,1554858777,1.7633,559621957),(10078,1554858778,0.0166,560299480),(28498,1554858778,0.0000,560809341),(28619,1554858779,0.0000,564977359),(28500,1554858780,0.0000,574773980),(28680,1554858780,0.0000,575296447),(28620,1554858780,0.0000,575595662),(28621,1554858781,0.0000,576075312),(28623,1554858783,0.0000,578241532),(28624,1554858784,0.0000,578963063),(28625,1554858785,99.8498,580238850),(28626,1554858786,0.0000,582630231),(28627,1554858787,0.0334,584218196),(28628,1554858788,0.0000,584880318),(28629,1554858789,0.0000,586515357),(28630,1554858790,0.0000,586662443),(28631,1554858791,0.0501,598022082),(28632,1554858792,0.0835,601453206),(23295,1554858795,0.0700,604324659),(23296,1554858796,0.0800,605100609),(28636,1554858796,99.8713,605702520),(23297,1554858797,0.0900,606290092),(23299,1554858799,92.1865,608319121),(23300,1554858800,0.0000,609643929),(23301,1554858801,0.8213,609709125),(23302,1554858802,0.0000,611692374),(23303,1554858803,0.1006,612881697),(23664,1554858804,0.0000,613164374),(23304,1554858804,0.0000,613804860),(23305,1554858805,0.5700,614484431),(23306,1554858806,5.1970,615318124),(23310,1554858810,99.9686,619644295),(28680,1554858810,0.0000,620418534),(23252,1554858812,0.0000,621732443),(23253,1554858813,0.0339,623022319),(28653,1554858813,98.8285,625082109),(28654,1554858814,99.9367,630987048),(23255,1554858815,0.0000,628390053),(23256,1554858816,0.0169,631722513),(23257,1554858817,0.1311,632315549),(28657,1554858817,76.0363,634373508),(23258,1554858818,0.0000,632701113),(28658,1554858818,84.0418,635130846),(23259,1554858819,0.0000,633119664),(23620,1554858820,0.4781,633768326),(23260,1554858820,0.0000,633836060),(23264,1554858824,0.0643,638080991),(23265,1554858825,0.0000,639027664),(23625,1554858825,5.5235,639084732),(23266,1554858826,0.0000,640130850),(25667,1554858827,0.0000,640803873),(23628,1554858828,0.0000,641964011),(25668,1554858828,0.0000,642030650),(23268,1554858828,0.0000,642060931),(23269,1554858829,0.0000,642897218),(23270,1554858830,0.0000,644327709),(25371,1554858831,0.0169,644965736),(10073,1554858833,1.1147,647307346),(23273,1554858833,3.9734,647684774),(28673,1554858833,74.2230,650781345),(10074,1554858834,0.0000,648713856),(23274,1554858834,0.0000,648772920),(23275,1554858835,0.2205,649352781),(10075,1554858835,0.0000,649739976),(28675,1554858835,34.4960,657131137),(10076,1554858836,0.6324,651411801),(23276,1554858836,0.3181,651467077),(23277,1554858837,1.7639,652710500),(10077,1554858837,0.0000,653028894),(28498,1554858838,0.0000,654261600),(10078,1554858838,0.0166,655914603),(28619,1554858839,0.0000,660096515),(28500,1554858840,0.0000,659664034),(28620,1554858840,0.0000,660296124),(28680,1554858840,0.0000,660803223),(28621,1554858841,0.0000,662043043),(28623,1554858843,0.0000,664632967),(28624,1554858844,0.0000,665360588),(28625,1554858845,99.8832,666781754),(28626,1554858846,0.0000,667694522),(28627,1554858847,0.0334,668463427),(28628,1554858848,0.0000,669610014),(28629,1554858849,0.0167,670402019),(28630,1554858850,0.0000,670671462),(28631,1554858851,0.0501,682801406),(28632,1554858852,0.0000,679369645),(23295,1554858855,0.0800,685451185),(28636,1554858856,99.8713,687627705),(23296,1554858856,0.1400,688320585),(23297,1554858857,0.1200,689128866),(23299,1554858859,93.4138,691531311),(23300,1554858860,0.0000,693859914),(23301,1554858861,0.6706,694579352),(23302,1554858862,0.0000,695896132),(23303,1554858863,0.0838,697536946),(23664,1554858864,0.0000,698048283),(23304,1554858864,0.0000,698682515),(23305,1554858865,0.7040,699030231),(23306,1554858866,4.6254,699453217),(23310,1554858870,99.9686,703134703),(28680,1554858870,0.0000,704216132),(23252,1554858872,0.0000,705526389),(23253,1554858873,0.0169,706419194),(28653,1554858873,98.8285,708557230),(28654,1554858874,99.9367,713757435),(23255,1554858875,0.0000,711083000),(23256,1554858876,0.0677,712137150),(23257,1554858877,0.1015,715039925),(28657,1554858877,76.0363,717188701),(23258,1554858878,0.0000,717928494),(28658,1554858878,84.0418,718374852),(23259,1554858879,0.0169,718915568),(23260,1554858880,0.0000,719276945),(23620,1554858880,0.4853,719334422),(23264,1554858884,0.0643,722454382),(23265,1554858885,0.0000,723524759),(23625,1554858885,5.5256,723582182),(23266,1554858886,0.0000,723915001),(25667,1554858887,0.0169,724659813),(25668,1554858888,0.0000,725668294),(23268,1554858888,0.0000,725726349),(23628,1554858888,0.0000,725755725),(23269,1554858889,0.0000,726702031),(23270,1554858890,0.0000,727587133),(25371,1554858891,0.0169,728649106),(10073,1554858893,1.1318,730122472),(23273,1554858893,3.9734,730180964),(28673,1554858893,74.2078,733664201),(10074,1554858894,0.0000,731324346),(23274,1554858894,0.0000,731596835),(10075,1554858895,0.0000,732246715),(23275,1554858895,0.2205,732303984),(28675,1554858895,34.1072,740321887),(23276,1554858896,0.3181,735618875),(10076,1554858896,0.6324,735955052),(10077,1554858897,0.0000,739636856),(23277,1554858897,1.7641,739665223),(10078,1554858898,0.0000,740477206),(28498,1554858898,0.0000,741951913),(28619,1554858899,0.0100,744702399),(28500,1554858900,0.0000,743777303),(28620,1554858900,0.1000,746201541),(28680,1554858900,0.0016,747044961),(28621,1554858901,0.0300,746911094),(28623,1554858903,0.0000,750033329),(28624,1554858904,0.0000,751335619),(28625,1554858905,88.4532,751808404),(28626,1554858906,0.0000,752957664),(28627,1554858907,3.1344,754145115),(28628,1554858908,0.0000,755971345),(28629,1554858909,0.1676,757144847),(28630,1554858910,0.0000,757747970),(28631,1554858911,1.8941,768828711),(28632,1554858912,6.4040,771838484),(23295,1554858915,0.0700,773286671),(23296,1554858916,0.0500,773420007),(28636,1554858916,99.8586,775125062),(23297,1554858917,0.1000,774337715),(23299,1554858919,97.0490,775840641),(23300,1554858920,0.0000,777338260),(23301,1554858921,1.3409,777413426),(23302,1554858922,0.0000,778963416),(23303,1554858923,0.0503,780514258),(23664,1554858924,0.0000,781069176),(23304,1554858924,0.0000,781647317),(23305,1554858925,0.2515,782404696),(23306,1554858926,1.2575,782892142),(23310,1554858930,99.9686,786161685),(28680,1554858930,0.0008,787933454),(23252,1554858932,0.0000,787663930),(23253,1554858933,0.0339,788629012),(28653,1554858933,98.8285,790582299),(28654,1554858934,99.9367,791656019),(23255,1554858935,0.0000,791772627),(23256,1554858936,0.0508,794601831),(23257,1554858937,0.0762,795515036),(28657,1554858937,76.0363,797638612),(23258,1554858938,0.0000,798252467),(28658,1554858938,84.0418,800187285),(23259,1554858939,0.0169,798694034),(23260,1554858940,0.0000,799307713),(23620,1554858940,0.5023,799363567),(23264,1554858944,0.0609,804212454),(23625,1554858945,5.5258,805398688),(23265,1554858945,0.0000,805458842),(23266,1554858946,0.0000,806010965),(25667,1554858947,0.0000,807120004),(23628,1554858948,0.0000,807898211),(23268,1554858948,0.0000,807958089),(25668,1554858948,0.0000,807990079),(23269,1554858949,0.0000,808627660),(23270,1554858950,0.0000,809469170),(25371,1554858951,0.0000,809893146),(23273,1554858953,3.9734,811980514),(10073,1554858953,1.1318,812035764),(28673,1554858953,74.2078,815108737),(23274,1554858954,0.0000,812650739),(10074,1554858954,0.0000,812919739),(10075,1554858955,0.0000,813719180),(23275,1554858955,0.2217,815665083),(28675,1554858955,34.1072,821650264),(10076,1554858956,0.6325,816793301),(23276,1554858956,0.3181,816850905),(10077,1554858957,0.0000,817238726),(23277,1554858957,1.7809,820330110),(10078,1554858958,0.0000,821926151),(28498,1554858958,0.0000,822759941),(28619,1554858959,0.0000,824636260),(28500,1554858960,0.0000,824429260),(28620,1554858960,0.0300,826373490),(28680,1554858960,0.0010,827644152),(28621,1554858961,0.0200,828303216),(28623,1554858963,0.0000,829208059),(28624,1554858964,0.0000,830531007),(28625,1554858965,99.8158,831685077),(28626,1554858966,0.0000,832180438),(28627,1554858967,0.0335,833345644),(28628,1554858968,0.0000,834328795),(28629,1554858969,0.0167,834732564),(28630,1554858970,0.0000,835665299),(28631,1554858971,0.0670,847153165),(28632,1554858972,0.0167,850695838),(23295,1554858975,0.0700,853879945),(23296,1554858976,0.0200,854776935),(28636,1554858976,99.8586,856404343),(23297,1554858977,0.0800,856228038),(23299,1554858979,98.1227,857382771),(23300,1554858980,0.0000,858182483),(23301,1554858981,0.3856,858877120),(23302,1554858982,0.0000,860107437),(23303,1554858983,0.0503,860973209),(23664,1554858984,0.0000,861249943),(23304,1554858984,0.0000,861591162),(23305,1554858985,0.2514,862854519),(23306,1554858986,1.2068,863783727),(23310,1554858990,99.9686,868109137),(28680,1554858990,0.0008,869893292),(23252,1554858992,0.0000,870071592),(23253,1554858993,0.0339,871136158),(28653,1554858993,98.8285,873330350),(28654,1554858994,99.9367,878144578),(23255,1554858995,0.0000,873424724),(23256,1554858996,0.0169,878478783),(23257,1554858997,0.1058,879143778),(28657,1554858997,76.0363,881334194),(23258,1554858998,0.0000,879520534),(28658,1554858998,84.0418,881727703),(23259,1554858999,0.0169,881320108),(23620,1554859000,0.5023,882278664),(23260,1554859000,0.0000,882337424),(23264,1554859004,0.0609,885366070),(23265,1554859005,0.0000,887038647),(23625,1554859005,5.4592,887096564),(23266,1554859006,0.0000,888100782),(25667,1554859007,0.0000,888672481),(23268,1554859008,0.0000,888872643),(25668,1554859008,0.0056,889196329),(23628,1554859008,0.0000,889238454),(23269,1554859009,0.0068,889972311),(23270,1554859010,0.0000,890403158),(25371,1554859011,0.0169,891446890),(10073,1554859013,1.1318,892964462),(23273,1554859013,3.9734,893022288),(28673,1554859013,74.2078,896133179),(10074,1554859014,0.0000,893867001),(23274,1554859014,0.0000,893923296),(23275,1554859015,0.2205,894760492),(10075,1554859015,0.0000,894818474),(28675,1554859015,34.1072,902781561),(23276,1554859016,0.3181,895689049),(10076,1554859016,0.6325,895746633),(10077,1554859017,0.0000,899709487),(23277,1554859017,1.7477,899739970),(10078,1554859018,0.0000,901770243),(28498,1554859018,0.0000,902947961),(28619,1554859019,0.0000,908611269),(28500,1554859020,0.0000,905095733),(28620,1554859020,0.0100,905767926),(28680,1554859020,0.0009,907175016),(28621,1554859021,0.0200,907604058),(28623,1554859023,0.0000,910412536),(28624,1554859024,0.0000,911359892),(28625,1554859025,99.8660,912565682),(28626,1554859026,0.0000,913336310),(28627,1554859027,0.0000,915143542),(28628,1554859028,0.0000,916468981),(28629,1554859029,0.0168,917337071),(28630,1554859030,0.0000,918252178),(28631,1554859031,0.0335,929990882),(28632,1554859032,0.0838,922444764),(23295,1554859035,0.0600,930253016),(23296,1554859036,0.0100,931670969),(28636,1554859036,99.8586,932445278),(23297,1554859037,0.0700,932784104),(23299,1554859039,98.1056,935498651),(23300,1554859040,0.0000,937120528),(23301,1554859041,0.4191,938232385),(23302,1554859042,0.0000,941287840),(23303,1554859043,0.0503,942317962),(23664,1554859044,0.0000,942664954),(23304,1554859044,0.0000,943173140),(23305,1554859045,0.2012,944661207),(23306,1554859046,1.2238,946404677),(23310,1554859050,99.9686,949850250),(28680,1554859050,0.0008,951717361),(23252,1554859052,0.0000,950855378),(23253,1554859053,0.0169,951532429),(28653,1554859053,98.8285,953728971),(28654,1554859054,99.9367,956880226),(23255,1554859055,0.0000,955238859),(23256,1554859056,0.0677,956334716),(23257,1554859057,0.0846,964467472),(28657,1554859057,76.0808,977456159),(23258,1554859058,0.0000,965742330),(28658,1554859058,84.0418,967753884),(23259,1554859059,0.0000,966020877),(23620,1554859060,0.5027,966940804),(23260,1554859060,0.0000,966998076),(23264,1554859064,0.0643,971703059),(23625,1554859065,5.1926,972709089),(23265,1554859065,0.0000,973016046),(23266,1554859066,0.0000,973910792);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_log` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_log_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_log`
--

LOCK TABLES `history_log` WRITE;
/*!40000 ALTER TABLE `history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str`
--

DROP TABLE IF EXISTS `history_str`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_str_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str`
--

LOCK TABLES `history_str` WRITE;
/*!40000 ALTER TABLE `history_str` DISABLE KEYS */;
INSERT INTO `history_str` VALUES (23288,1554852488,'4.0.6',627378269),(23307,1554852507,'localhost.localdomain',646840808),(23312,1554852512,'Linux localhost.localdomain 3.10.0-957.10.1.el7.x86_64 #1 SMP Mon Mar 18 15:06:45 UTC 2019 x86_64',651533150),(23327,1554852527,'Zabbix server',675194917),(28610,1554854210,'Zabbix server',493430371),(28612,1554854212,'3.0.17',495443407),(28633,1554854233,'cep-api',533545387),(28638,1554854238,'Linux cep-api 4.18.0-17-generic #18-Ubuntu SMP Wed Mar 13 14:34:40 UTC 2019 x86_64',539986554),(23288,1554856088,'4.0.6',845535843),(23307,1554856107,'localhost.localdomain',878769928),(23312,1554856112,'Linux localhost.localdomain 3.10.0-957.10.1.el7.x86_64 #1 SMP Mon Mar 18 15:06:45 UTC 2019 x86_64',883356493),(23327,1554856127,'Zabbix server',904676222),(28610,1554857810,'Zabbix server',151196893),(28612,1554857812,'3.0.17',157061057),(28633,1554857833,'cep-api',198899292),(28638,1554857838,'Linux cep-api 4.18.0-17-generic #18-Ubuntu SMP Wed Mar 13 14:34:40 UTC 2019 x86_64',207111157);
/*!40000 ALTER TABLE `history_str` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_text`
--

DROP TABLE IF EXISTS `history_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_text` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_text_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_text`
--

LOCK TABLES `history_text` WRITE;
/*!40000 ALTER TABLE `history_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint`
--

DROP TABLE IF EXISTS `history_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_uint_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint`
--

LOCK TABLES `history_uint` WRITE;
/*!40000 ALTER TABLE `history_uint` DISABLE KEYS */;
INSERT INTO `history_uint` VALUES (23662,1554851602,0,862096919),(28249,1554851629,0,879398461),(23272,1554851632,0,881281208),(23662,1554851662,0,901458440),(28249,1554851689,0,933298918),(23272,1554851692,0,934515971),(23662,1554851722,0,951193094),(28249,1554851749,0,7245872),(23272,1554851752,0,10184136),(23662,1554851782,0,49419737),(28249,1554851809,0,69175650),(23272,1554851812,0,70673347),(23662,1554851842,0,89198287),(28249,1554851869,0,114318591),(23271,1554851871,0,115824496),(23272,1554851872,0,116261440),(23662,1554851902,0,133347317),(23313,1554851913,44783,139896557),(28249,1554851929,0,150067976),(23272,1554851932,0,151468852),(23662,1554851962,0,179050757),(23308,1554851968,1554851968,184714991),(23309,1554851969,859557888,186124927),(23314,1554851974,2,214211407),(23316,1554851976,428490752,190863504),(28249,1554851989,0,199198227),(23272,1554851992,0,201859636),(23287,1554852007,1,210948103),(23291,1554852011,3,223126318),(23292,1554852012,143,215468005),(23662,1554852022,0,221099395),(23308,1554852028,1554852028,225814876),(23309,1554852029,859557888,226597258),(23314,1554852034,2,236442176),(23316,1554852036,421044224,232406445),(28249,1554852049,0,242397075),(23272,1554852052,0,245155245),(23287,1554852067,1,255241405),(23291,1554852071,5,267047556),(23292,1554852072,143,258988227),(23294,1554852074,88,259970799),(23298,1554852078,180,263818968),(23662,1554852082,0,268123347),(23308,1554852088,1554852088,273657725),(23309,1554852089,859557888,274526742),(23314,1554852094,2,284777952),(23316,1554852096,423768064,283174918),(28249,1554852109,0,290764042),(23272,1554852112,0,291947022),(23287,1554852127,1,300828185),(23291,1554852131,8,313074184),(23292,1554852132,144,316028938),(23294,1554852134,93,315606617),(23298,1554852138,183,319258874),(23662,1554852142,0,322441181),(23308,1554852148,1554852148,326804926),(23309,1554852149,859557888,328212875),(23314,1554852154,2,340856842),(23316,1554852156,423743488,334774203),(28249,1554852169,0,369871498),(23272,1554852172,0,371334370),(23287,1554852187,1,383000540),(23291,1554852191,3,396477378),(23292,1554852192,144,389385511),(23294,1554852194,92,388980889),(23298,1554852198,180,393985169),(23662,1554852202,0,397556902),(23308,1554852208,1554852208,402966529),(23309,1554852209,859557888,403652938),(23314,1554852214,2,414170976),(23316,1554852216,423780352,408488637),(28249,1554852229,0,416714313),(23272,1554852232,0,419157074),(23287,1554852247,1,430757954),(23291,1554852251,3,444585627),(23292,1554852252,144,437099632),(23294,1554852254,93,435921968),(23298,1554852258,180,440133582),(23662,1554852262,0,442923157),(23308,1554852268,1554852268,448814229),(23309,1554852269,859557888,449970181),(23314,1554852274,2,460737990),(23316,1554852276,423653376,455426958),(28249,1554852289,0,464258289),(23272,1554852292,0,466462614),(23287,1554852307,1,477024650),(23291,1554852311,2,489949880),(23292,1554852312,144,482207216),(23294,1554852314,86,481163587),(23298,1554852318,178,484482178),(23662,1554852322,0,487986889),(23308,1554852328,1554852328,494112831),(23309,1554852329,859557888,494773722),(23314,1554852334,2,504820456),(23316,1554852336,423686144,499041496),(28249,1554852349,0,507464723),(23272,1554852352,0,508059676),(23287,1554852367,1,519374123),(23291,1554852371,5,531233065),(23292,1554852372,144,523932684),(23294,1554852374,89,523480619),(23298,1554852378,180,527491993),(23662,1554852382,0,531292547),(23308,1554852388,1554852388,537213195),(23309,1554852389,859557888,538565686),(23314,1554852394,2,549318492),(23316,1554852396,423448576,543991713),(28249,1554852409,0,551078466),(23272,1554852412,0,552789962),(23287,1554852427,1,563791911),(23291,1554852431,7,577870064),(23292,1554852432,143,579124077),(23294,1554852434,88,578312392),(23298,1554852438,181,582366457),(23662,1554852442,0,584841548),(23308,1554852448,1554852448,596089880),(23309,1554852449,859557888,596244622),(23314,1554852454,2,606186429),(23316,1554852456,423477248,603712183),(28249,1554852469,0,610923024),(23271,1554852471,0,612493331),(23272,1554852472,0,612650906),(23287,1554852487,1,626550838),(23289,1554852489,97834,628687002),(23290,1554852490,32768,629581975),(23291,1554852491,2,640658282),(23292,1554852492,143,633125122),(23294,1554852494,94,632069541),(23298,1554852498,188,636379313),(23662,1554852502,0,640088041),(23308,1554852508,1554852508,648235386),(23309,1554852509,859557888,648901129),(23311,1554852511,859828224,651083046),(23313,1554852513,45383,653536080),(23314,1554852514,2,663275721),(23315,1554852515,3307433096,657943048),(28655,1554852515,5053915136,659911733),(23316,1554852516,422985728,664456298),(28656,1554852516,893579264,665954120),(23317,1554852517,1039327232,665869837),(28661,1554852521,1587765248,671021039),(28662,1554852522,169676800,671819747),(28249,1554852529,0,676339781),(23272,1554852532,0,678386390),(23287,1554852547,1,688229232),(23291,1554852551,6,701024686),(23292,1554852552,143,692895329),(23294,1554852554,95,692049306),(23298,1554852558,191,696565429),(23662,1554852562,0,700265277),(23308,1554852568,1554852568,706121656),(23309,1554852569,859557888,706710424),(28651,1554852571,1080,709701604),(28652,1554852572,1224,710507916),(23314,1554852574,2,723608273),(28655,1554852575,5053915136,715389252),(23316,1554852576,422891520,714839568),(28656,1554852576,893579264,716938033),(28661,1554852581,1587765248,722018102),(28662,1554852582,169676800,724062558),(28249,1554852589,0,728964484),(23272,1554852592,0,732420399),(23287,1554852607,1,741848799),(23291,1554852611,4,755728826),(23292,1554852612,144,748343888),(23294,1554852614,96,747642771),(23298,1554852618,185,752083417),(23662,1554852622,0,756063205),(23308,1554852628,1554852628,760017853),(23309,1554852629,859557888,760918240),(28651,1554852631,920,761947008),(28652,1554852632,1040,763753352),(23314,1554852634,2,774374391),(28655,1554852635,5053915136,769498900),(23316,1554852636,422842368,769258225),(28656,1554852636,893579264,770617569),(28661,1554852641,1587765248,776081308),(28662,1554852642,169676800,776757721),(28249,1554852649,0,778080462),(23272,1554852652,0,780356672),(23287,1554852667,1,790329427),(23291,1554852671,5,803717495),(23292,1554852672,144,795238385),(23294,1554852674,89,795192594),(23298,1554852678,183,798475160),(23662,1554852682,0,801716337),(23308,1554852688,1554852688,807499227),(23309,1554852689,859557888,808751787),(28651,1554852691,1088,809859643),(28652,1554852692,1152,811011748),(23314,1554852694,2,822366132),(28655,1554852695,5053915136,818273995),(28656,1554852696,893579264,819093338),(23316,1554852696,422862848,819544883),(28661,1554852701,1587765248,825843461),(28662,1554852702,169676800,827113552),(28249,1554852709,0,830965567),(23272,1554852712,0,832955681),(23287,1554852727,1,843062960),(23291,1554852731,1,855961676),(23292,1554852732,144,848833574),(23294,1554852734,91,847917768),(23298,1554852738,185,851875654),(23662,1554852742,0,855513795),(23308,1554852748,1554852748,861951805),(23309,1554852749,859557888,862506035),(28651,1554852751,920,864954530),(28652,1554852752,1032,865771659),(23314,1554852754,2,881980343),(28655,1554852755,5053915136,871436363),(23316,1554852756,422862848,870828494),(28656,1554852756,893579264,872741849),(28661,1554852761,1587765248,879973056),(28662,1554852762,169676800,882034237),(28249,1554852769,0,886555407),(23272,1554852772,0,887504247),(23287,1554852787,1,897587988),(23291,1554852791,5,910260876),(23292,1554852792,144,902302226),(23294,1554852794,88,901482946),(23298,1554852798,183,905097795),(23662,1554852802,0,907614022),(23308,1554852808,1554852808,912498423),(23309,1554852809,859557888,913025313),(28651,1554852811,1056,914565080),(28652,1554852812,1208,915269652),(23314,1554852814,2,926602256),(28655,1554852815,5053915136,920636161),(23316,1554852816,422866944,921996077),(28656,1554852816,893579264,924072134),(28661,1554852821,1587765248,931010296),(28662,1554852822,169676800,932108207),(28249,1554852829,0,935191292),(23272,1554852832,0,937434273),(23287,1554852847,1,948150060),(23291,1554852851,6,960019819),(23292,1554852852,144,952131450),(23294,1554852854,89,954276001),(23298,1554852858,185,958545987),(23662,1554852862,0,963588899),(23308,1554852868,1554852868,969020118),(23309,1554852869,859557888,970455615),(28651,1554852871,912,971239031),(28652,1554852872,1016,972895424),(23314,1554852874,2,983914875),(28655,1554852875,5053915136,980395364),(23316,1554852876,422883328,980605198),(28656,1554852876,893579264,981979306),(28661,1554852881,1587765248,988868891),(28662,1554852882,169676800,989826252),(28249,1554852889,0,992981799),(23272,1554852892,0,994312128),(23287,1554852907,1,2657450),(23291,1554852911,8,17044486),(23292,1554852912,143,14802506),(23294,1554852914,92,14277242),(23298,1554852918,184,17722599),(23662,1554852922,0,21155814),(23308,1554852928,1554852928,26997702),(23309,1554852929,859557888,27888327),(28651,1554852931,984,30043406),(28652,1554852932,1032,31018840),(23314,1554852934,2,41829303),(28655,1554852935,5053915136,36812094),(28656,1554852936,893579264,36372941),(23316,1554852936,422854656,37051320),(28661,1554852941,1587765248,44554472),(28662,1554852942,169676800,45086410),(28249,1554852949,0,48739021),(23272,1554852952,0,50582024),(23287,1554852967,1,58274156),(23291,1554852971,4,72970889),(23292,1554852972,143,64104467),(23294,1554852974,91,63055876),(23298,1554852978,186,66886293),(23662,1554852982,0,69658747),(23308,1554852988,1554852988,74001897),(23309,1554852989,859557888,74865622),(28651,1554852991,1056,76147836),(28652,1554852992,1200,77515129),(23314,1554852994,2,88016482),(28655,1554852995,5053915136,81931610),(28656,1554852996,893579264,84681145),(23316,1554852996,422887424,85036423),(28661,1554853001,1587765248,92257091),(28662,1554853002,169676800,93294729),(28249,1554853009,0,103027020),(23272,1554853012,0,104294399),(23287,1554853027,1,120155749),(23291,1554853031,3,136025444),(23292,1554853032,143,128153283),(23294,1554853034,93,126917825),(23298,1554853038,184,130944257),(23662,1554853042,0,134632580),(23308,1554853048,1554853048,140801699),(23309,1554853049,859557888,141850176),(28651,1554853051,944,143292853),(28652,1554853052,1024,144050350),(23314,1554853054,2,157359183),(28655,1554853055,5053915136,149800573),(23316,1554853056,422838272,151486124),(28656,1554853056,893579264,152934523),(28661,1554853061,1587765248,159919086),(28662,1554853062,169676800,160859474),(28249,1554853069,0,170155115),(23271,1554853071,0,170705927),(23272,1554853072,0,170923659),(23287,1554853087,1,185400451),(23291,1554853091,7,198774970),(23292,1554853092,144,190516080),(23293,1554853093,1554807130,191405583),(23294,1554853094,90,192219181),(23298,1554853098,188,197117875),(23662,1554853102,0,202029249),(23308,1554853108,1554853108,208453715),(23309,1554853109,859557888,209079347),(28651,1554853111,1064,211361884),(28652,1554853112,1184,213033366),(23313,1554853113,45983,213928187),(23314,1554853114,2,223446764),(28655,1554853115,5053915136,216977928),(23316,1554853116,422838272,218116958),(28656,1554853116,893579264,220020426),(28661,1554853121,1587765248,226395079),(28662,1554853122,169676800,226459410),(28249,1554853129,0,228805094),(23272,1554853132,0,231561767),(23287,1554853147,1,243559138),(23291,1554853151,2,254879981),(23292,1554853152,144,247152237),(23294,1554853154,99,247713473),(23298,1554853158,189,258700121),(23662,1554853162,0,262549412),(23308,1554853168,1554853168,269049305),(23309,1554853169,859557888,270034717),(28651,1554853171,1736,271385466),(28652,1554853172,9544,271754449),(23314,1554853174,2,283279646),(28655,1554853175,5053915136,276411644),(23316,1554853176,422301696,277970054),(28656,1554853176,893579264,279237048),(28661,1554853181,1587765248,284492994),(28662,1554853182,169676800,285143175),(28249,1554853189,0,290216141),(23272,1554853192,0,293332603),(23287,1554853207,1,302913173),(23291,1554853211,4,318763539),(23292,1554853212,144,310007712),(23294,1554853214,92,309180974),(23298,1554853218,184,313457786),(23662,1554853222,0,316459020),(23308,1554853228,1554853228,323077780),(23309,1554853229,859557888,324314409),(28651,1554853231,1056,325672494),(28652,1554853232,1208,326565865),(23314,1554853234,2,337612837),(28655,1554853235,5053915136,330703919),(28656,1554853236,893579264,333712941),(23316,1554853236,422301696,334187175),(28661,1554853241,1587765248,342231144),(28662,1554853242,169676800,342884467),(28249,1554853249,0,347565588),(23272,1554853252,0,348928393),(23287,1554853267,1,359371698),(23291,1554853271,2,372617228),(23292,1554853272,144,364270535),(23294,1554853274,91,364125682),(23298,1554853278,186,367660495),(23662,1554853282,0,370232011),(23308,1554853288,1554853288,375947789),(23309,1554853289,859557888,376742100),(28651,1554853291,1952,378749908),(28652,1554853292,2048,379888775),(23314,1554853294,2,391241670),(28655,1554853295,5053915136,385509405),(23316,1554853296,422305792,386336749),(28656,1554853296,893579264,388525726),(28661,1554853301,1587765248,394107727),(28662,1554853302,169676800,395042146),(28249,1554853309,0,398662957),(23272,1554853312,0,400666650),(23287,1554853327,1,409948891),(23291,1554853331,3,425110127),(23292,1554853332,144,415920605),(23294,1554853334,98,414527456),(23298,1554853338,189,418102059),(23662,1554853342,0,421062272),(23308,1554853348,1554853348,428262530),(23309,1554853349,859557888,428763295),(28651,1554853351,1744,430805599),(28652,1554853352,14568,431630600),(23314,1554853354,2,442109142),(28655,1554853355,5053915136,456966195),(23316,1554853356,422051840,445744915),(28656,1554853356,893579264,447212601),(28661,1554853361,1587765248,453580320),(28662,1554853362,169676800,454638976),(28249,1554853369,0,460869283),(23272,1554853372,0,463784550),(23287,1554853387,1,477797896),(23291,1554853391,6,491371730),(23292,1554853392,143,483625274),(23294,1554853394,135,485934522),(23298,1554853398,212,490652547),(23662,1554853402,0,498123892),(23308,1554853408,1554853408,509450530),(23309,1554853409,859557888,510751522),(28651,1554853411,4736,521946493),(28652,1554853412,31064,523632088),(23314,1554853414,2,541037907),(28655,1554853415,5053915136,535946194),(23316,1554853416,430874624,534302432),(28656,1554853416,893579264,536246579),(28661,1554853421,1587765248,558007051),(28662,1554853422,169676800,545786674),(28249,1554853429,0,563483944),(23272,1554853432,0,574827851),(23287,1554853447,1,592377558),(23291,1554853451,4,606499738),(23292,1554853452,143,597672427),(28634,1554853454,1554853454,304266825),(23294,1554853454,338,597170409),(23298,1554853458,351,600567177),(28640,1554853460,3,327794275),(23662,1554853462,0,604584412),(23308,1554853468,1554853468,610748117),(23309,1554853469,859557888,612185278),(28651,1554853471,20080,613869208),(28652,1554853472,222448,614741244),(23314,1554853474,2,625838911),(28655,1554853475,5053784064,619595365),(28656,1554853476,893579264,622722968),(23316,1554853476,427700224,623139307),(28661,1554853481,1587896320,628539043),(28662,1554853482,169676800,630970951),(28249,1554853489,0,634501134),(28611,1554853491,1,348665190),(23272,1554853492,0,636393049),(28615,1554853495,2,359623276),(28618,1554853498,77,643832649),(23287,1554853507,1,651071434),(23291,1554853511,9,667609364),(23292,1554853512,143,669808488),(23294,1554853514,95,668439743),(28634,1554853514,1554853514,670769621),(28635,1554853515,2053607424,672196200),(23298,1554853518,192,674877306),(28640,1554853520,3,681783725),(23662,1554853522,0,677739143),(28642,1554853522,632541184,679868820),(23308,1554853528,1554853528,683238586),(23309,1554853529,859557888,683518491),(28651,1554853531,2120,684989659),(28652,1554853532,2256,686678979),(23314,1554853534,2,697303390),(28655,1554853535,5053784064,690792126),(23316,1554853536,427175936,692616200),(28656,1554853536,893579264,693883044),(28661,1554853541,1587896320,700158948),(28662,1554853542,169676800,700208364),(28249,1554853549,0,702280998),(28611,1554853551,1,705016974),(23272,1554853552,0,705675556),(28615,1554853555,2,712976747),(28616,1554853556,119,711657296),(28618,1554853558,60,711003160),(28622,1554853562,205,715068834),(23287,1554853567,1,719132437),(23291,1554853571,7,736015871),(23292,1554853572,144,726554550),(28634,1554853574,1554853574,731002956),(23294,1554853574,97,731713749),(28635,1554853575,2053607424,734935067),(23298,1554853578,192,736939888),(28640,1554853580,3,744610862),(23662,1554853582,0,741217328),(28642,1554853582,632537088,742764750),(23308,1554853588,1554853588,745838434),(23309,1554853589,859557888,746760985),(28651,1554853591,2456,748619932),(28652,1554853592,2336,749081510),(23314,1554853594,2,760104443),(28655,1554853595,5053784064,756361367),(23316,1554853596,426921984,755691076),(28656,1554853596,893579264,756948539),(28661,1554853601,1587896320,763067073),(28662,1554853602,169676800,765052141),(28249,1554853609,0,767897837),(28611,1554853611,1,770428503),(23272,1554853612,0,768959580),(28615,1554853615,2,775606607),(28616,1554853616,119,775060617),(28618,1554853618,62,774843298),(28622,1554853622,210,779523367),(23287,1554853627,1,782346258),(23291,1554853631,7,798653283),(23292,1554853632,144,791331731),(28634,1554853634,1554853634,794433409),(23294,1554853634,99,795142224),(28635,1554853635,2053607424,797578055),(23298,1554853638,194,801299413),(28640,1554853640,3,808839046),(23662,1554853642,0,805216702),(28642,1554853642,632569856,806021009),(23308,1554853648,1554853648,810287164),(23309,1554853649,859557888,810782121),(28651,1554853651,2320,812802619),(28652,1554853652,2312,813394981),(23314,1554853654,2,823616591),(28655,1554853655,5053784064,820697211),(23316,1554853656,428036096,819945908),(28656,1554853656,893579264,821230248),(28661,1554853661,1587896320,827145751),(28662,1554853662,169676800,826535287),(28249,1554853669,0,830209939),(23271,1554853671,0,832123388),(28611,1554853671,1,833412467),(23272,1554853672,0,832516208),(28615,1554853675,2,840906296),(28616,1554853676,119,839960402),(28618,1554853678,61,839571478),(28622,1554853682,208,844633332),(23287,1554853687,1,847712769),(23291,1554853691,6,863725165),(23292,1554853692,144,854975380),(23293,1554853693,1554807130,856045156),(23294,1554853694,122,857692921),(28634,1554853694,1554853694,858427996),(28635,1554853695,2053607424,860356571),(23298,1554853698,211,863384409),(28640,1554853700,3,870400858),(23662,1554853702,0,869486216),(28642,1554853702,632569856,870143171),(23308,1554853708,1554853708,873942655),(23309,1554853709,859557888,874271523),(28651,1554853711,3960,876752771),(28652,1554853712,35360,876934605),(23313,1554853713,46583,878650013),(23314,1554853714,2,888733907),(28655,1554853715,5053784064,882995350),(23316,1554853716,428892160,881253857),(28656,1554853716,893579264,883296353),(28661,1554853721,1587896320,889265800),(28662,1554853722,169676800,891602474),(28249,1554853729,0,894502662),(28611,1554853731,1,897805930),(23272,1554853732,0,896947715),(28615,1554853735,5,905325297),(28616,1554853736,119,904569874),(28618,1554853738,62,903945926),(28622,1554853742,210,908965262),(23287,1554853747,1,912818169),(23291,1554853751,5,926815873),(23292,1554853752,144,919890859),(28634,1554853754,1554853754,922535390),(23294,1554853754,99,922758610),(28635,1554853755,2053607424,924882335),(23298,1554853758,193,927794285),(28640,1554853760,3,935915754),(23662,1554853762,0,933495177),(28642,1554853762,632578048,934816803),(23308,1554853768,1554853768,938790374),(23309,1554853769,859557888,939480985),(28651,1554853771,2408,941994343),(28652,1554853772,2312,943180428),(23314,1554853774,2,954095469),(28655,1554853775,5053784064,947943283),(23316,1554853776,426729472,947396649),(28656,1554853776,893579264,949414013),(28661,1554853781,1587896320,954344039),(28662,1554853782,169676800,957054406),(28249,1554853789,0,959937651),(28611,1554853791,1,962578366),(23272,1554853792,0,961591460),(28615,1554853795,4,969637868),(28616,1554853796,119,968424713),(28618,1554853798,61,967926715),(28622,1554853802,210,975092341),(23287,1554853807,1,980902280),(23291,1554853811,4,997285013),(23292,1554853812,144,2676186),(28634,1554853814,1554853814,6536949),(23294,1554853814,101,7248473),(28635,1554853815,2053607424,3037512),(23298,1554853818,193,4699555),(28640,1554853820,3,11747528),(23662,1554853822,0,8430075),(28642,1554853822,632578048,9939978),(23308,1554853828,1554853828,16609747),(23309,1554853829,859557888,17449361),(28651,1554853831,2248,20254040),(28652,1554853832,2352,21073437),(23314,1554853834,2,31569113),(28655,1554853835,5053784064,32800784),(23316,1554853836,426369024,32519193),(28656,1554853836,893579264,33880296),(28661,1554853841,1587896320,39268253),(28662,1554853842,169676800,40425336),(28249,1554853849,0,47932177),(28611,1554853851,1,50454550),(23272,1554853852,0,49406569),(28615,1554853855,2,59206361),(28616,1554853856,119,58817688),(28618,1554853858,62,59366666),(28622,1554853862,210,63967911),(23287,1554853867,1,71153255),(23291,1554853871,5,86145414),(23292,1554853872,143,78053862),(23294,1554853874,98,80546565),(28634,1554853874,1554853874,80949584),(28635,1554853875,2053607424,83099468),(23298,1554853878,195,86673658),(28640,1554853880,3,94371501),(23662,1554853882,0,90570284),(28642,1554853882,632578048,92196633),(23308,1554853888,1554853888,96831030),(23309,1554853889,859557888,98179715),(28651,1554853891,4168,100054113),(28652,1554853892,24888,100950822),(23314,1554853894,2,113570907),(28655,1554853895,5053784064,105614321),(23316,1554853896,424513536,104786166),(28656,1554853896,893579264,106858965),(28661,1554853901,1587896320,112389916),(28662,1554853902,169676800,113344549),(28249,1554853909,0,119186513),(28611,1554853911,1,122394723),(23272,1554853912,0,122270193),(28615,1554853915,2,130575331),(28616,1554853916,119,128985089),(28618,1554853918,62,128503864),(28622,1554853922,209,134028845),(23287,1554853927,1,137075798),(23291,1554853931,4,151400574),(23292,1554853932,143,145576668),(23294,1554853934,146,144304498),(28634,1554853934,1554853934,145880413),(28635,1554853935,2053607424,148560938),(23298,1554853938,228,159242734),(28640,1554853940,3,166275491),(28642,1554853942,633085952,165207435),(23662,1554853942,0,165272113),(23308,1554853948,1554853948,178749041),(23309,1554853949,859557888,179751063),(28651,1554853951,6248,181543014),(28652,1554853952,31544,182892327),(23314,1554853954,2,192710564),(28655,1554853955,5053784064,189749596),(28656,1554853956,893579264,190521737),(23316,1554853956,429080576,191150981),(28661,1554853961,1587896320,198871785),(28662,1554853962,169676800,199393606),(28249,1554853969,0,201440800),(28611,1554853971,1,204412879),(23272,1554853972,0,203304989),(28615,1554853975,3,210169331),(28616,1554853976,119,208791837),(28618,1554853978,63,209492315),(28622,1554853982,211,213196214),(23287,1554853987,1,216597971),(23291,1554853991,7,232602988),(23292,1554853992,143,223974297),(28634,1554853994,1554853994,228201581),(23294,1554853994,141,228911672),(28635,1554853995,2053607424,231564031),(23298,1554853998,210,236263194),(28640,1554854000,3,243013259),(23662,1554854002,0,239237149),(28642,1554854002,633085952,241392130),(23308,1554854008,1554854008,244477487),(23309,1554854009,859557888,245573337),(28651,1554854011,3504,247565847),(28652,1554854012,15368,248775940),(23314,1554854014,2,261654175),(28655,1554854015,5053784064,255338594),(23316,1554854016,419323904,254899685),(28656,1554854016,893579264,276077028),(28661,1554854021,1587896320,264324979),(28662,1554854022,169676800,264880975),(28249,1554854029,0,277974784),(28611,1554854031,1,280991364),(23272,1554854032,0,280371672),(28615,1554854035,2,289006015),(28616,1554854036,119,286797299),(28618,1554854038,61,286168569),(28622,1554854042,209,291746286),(23287,1554854047,1,296006193),(23291,1554854051,6,310352985),(23292,1554854052,144,304247651),(28634,1554854054,1554854054,307058636),(23294,1554854054,179,307781907),(28635,1554854055,2053607424,309627151),(23298,1554854058,243,315276784),(28640,1554854060,3,322447140),(23662,1554854062,0,319806284),(28642,1554854062,633085952,321475224),(23308,1554854068,1554854068,325581338),(23309,1554854069,859557888,327192385),(28651,1554854071,7824,329573255),(28652,1554854072,54504,330277055),(23314,1554854074,2,340819973),(28655,1554854075,5053784064,334628558),(23316,1554854076,419459072,334289709),(28656,1554854076,893579264,336363246),(28661,1554854081,1587896320,343093162),(28662,1554854082,169676800,344031873),(28249,1554854089,0,346937147),(28611,1554854091,1,349980074),(23272,1554854092,0,349429947),(28615,1554854095,2,358493722),(28616,1554854096,119,356078962),(28618,1554854098,62,359901822),(28622,1554854102,209,364102632),(23287,1554854107,1,368097967),(23291,1554854111,6,383068374),(23292,1554854112,144,377162979),(28634,1554854114,1554854114,380075736),(23294,1554854114,114,380843718),(28635,1554854115,2053607424,383452624),(23298,1554854118,201,387718388),(28640,1554854120,3,394417934),(23662,1554854122,0,390997144),(28642,1554854122,635244544,392602139),(23308,1554854128,1554854128,396497686),(23309,1554854129,859557888,397051767),(28651,1554854131,4752,399367603),(28652,1554854132,28800,400553962),(23314,1554854134,2,410054267),(28655,1554854135,5053784064,404576835),(28656,1554854136,893579264,405110720),(23316,1554854136,409755648,405520446),(28661,1554854141,1587896320,411810687),(28662,1554854142,169676800,412923780),(28249,1554854149,0,421247921),(28611,1554854151,1,424356197),(23272,1554854152,0,423139672),(28615,1554854155,2,430716291),(28616,1554854156,119,429553823),(28618,1554854158,61,429374648),(28622,1554854162,210,433688381),(23287,1554854167,1,438124065),(23291,1554854171,8,455508809),(23292,1554854172,144,456440769),(23294,1554854174,155,456467342),(28634,1554854174,1554854174,457674515),(28635,1554854175,2053607424,459457285),(23298,1554854178,227,462142302),(28640,1554854180,3,468842028),(23662,1554854182,0,465691215),(28642,1554854182,635244544,467089689),(23308,1554854188,1554854188,469961228),(23309,1554854189,859557888,471249165),(28651,1554854191,4432,473135606),(28652,1554854192,30000,473946615),(23314,1554854194,2,484218701),(28655,1554854195,5053784064,478347432),(28656,1554854196,893579264,478645849),(23316,1554854196,410877952,479273718),(28661,1554854201,1587896320,485837554),(28662,1554854202,169676800,486380388),(28249,1554854209,0,491351080),(28611,1554854211,1,494358187),(23272,1554854212,0,494108008),(28613,1554854213,94140,496381711),(28614,1554854214,32768,497630376),(28615,1554854215,2,502816400),(28616,1554854216,119,501589272),(28617,1554854217,1554847105,500555384),(28618,1554854218,64,502990602),(28622,1554854222,212,508461894),(23287,1554854227,1,513032456),(23291,1554854231,4,527360131),(23292,1554854232,144,531108699),(23294,1554854234,104,534171442),(28634,1554854234,1554854234,534809983),(28635,1554854235,2053607424,536197678),(28637,1554854237,2056253440,539216284),(23298,1554854238,206,539314325),(28639,1554854239,7135,540961486),(28640,1554854240,3,546783343),(28641,1554854241,4286018622,543747739),(23662,1554854242,0,542803580),(28642,1554854242,635084800,545158796),(28643,1554854243,1033146368,546265776),(23308,1554854248,1554854248,550246471),(23309,1554854249,859557888,550650216),(28651,1554854251,3304,553141983),(28652,1554854252,2944,553677395),(23314,1554854254,2,563533854),(28655,1554854255,5053784064,557657384),(23316,1554854256,410345472,559666485),(28656,1554854256,893579264,561071413),(28659,1554854259,6641680384,566864410),(28660,1554854260,1063256064,567744360),(28661,1554854261,1587896320,570528730),(28662,1554854262,169676800,571321925),(28249,1554854269,0,577294025),(23271,1554854271,0,578499503),(28611,1554854271,1,580596555),(23272,1554854272,0,580076956),(28674,1554854274,3392024576,585643329),(28615,1554854275,3,589593275),(28616,1554854276,119,588397512),(28676,1554854276,10498625536,590418454),(28677,1554854277,6553112576,590422042),(28618,1554854278,65,591538063),(28622,1554854282,211,596904853),(23287,1554854287,1,600271182),(23291,1554854291,7,616709634),(23292,1554854292,144,619734489),(23293,1554854293,1554807130,618223893),(23294,1554854294,107,620818829),(28634,1554854294,1554854294,621869794),(28635,1554854295,2053607424,637753824),(23298,1554854298,211,629018962),(28640,1554854300,3,636567255),(23662,1554854302,0,632935857),(28642,1554854302,635084800,634816621),(23308,1554854308,1554854308,642154967),(23309,1554854309,859557888,642589031),(28651,1554854311,6232,643724898),(28652,1554854312,46888,645133099),(23313,1554854313,47183,646464569),(23314,1554854314,2,655019108),(28655,1554854315,5053784064,650338180),(28656,1554854316,893579264,651309095),(23316,1554854316,409108480,651829643),(28661,1554854321,1587896320,657635292),(28662,1554854322,169676800,660271045),(28663,1554854323,0,660677971),(28664,1554854324,2408,661705756),(28665,1554854325,0,662760045),(28666,1554854326,0,663627081),(28667,1554854327,0,664819027),(28668,1554854328,0,666179559),(28249,1554854329,0,666129792),(28669,1554854329,2000,667471348),(28670,1554854330,0,667931974),(28611,1554854331,1,669240526),(28671,1554854331,0,669557774),(23272,1554854332,0,668738874),(28672,1554854332,0,670620651),(28674,1554854334,3392024576,674428460),(28615,1554854335,3,678079988),(28616,1554854336,119,676614994),(28677,1554854337,6553112576,679417083),(28618,1554854338,66,678878613),(28622,1554854342,216,684226296),(23287,1554854347,1,687738775),(23291,1554854351,8,701643283),(23292,1554854352,143,694393888),(23294,1554854354,148,698616593),(28634,1554854354,1554854354,700331384),(28635,1554854355,2053607424,703350656),(23298,1554854358,221,705756593),(28640,1554854360,3,712645618),(23662,1554854362,0,709399450),(28642,1554854362,634892288,711151625),(23308,1554854368,1554854368,715617603),(23309,1554854369,859557888,716000878),(28651,1554854371,3056,718295998),(28652,1554854372,2984,719518585),(23314,1554854374,2,729701170),(28655,1554854375,5053784064,723650906),(28656,1554854376,893579264,724528104),(23316,1554854376,409108480,725215460),(28661,1554854381,1587896320,730675814),(28662,1554854382,169676800,731282542),(28663,1554854383,0,733133398),(28664,1554854384,2600,733561565),(28665,1554854385,0,734452959),(28666,1554854386,0,735032125),(28667,1554854387,0,736722104),(28668,1554854388,0,737371567),(28249,1554854389,0,736429509),(28669,1554854389,2008,738137237),(28670,1554854390,0,739027310),(28611,1554854391,1,740187756),(28671,1554854391,0,740578675),(23272,1554854392,0,739829971),(28672,1554854392,0,741461202),(28674,1554854394,3392024576,743996583),(28615,1554854395,3,748395062),(28616,1554854396,119,746829417),(28677,1554854397,6553112576,748435000),(28678,1554854398,1,747620571),(28618,1554854398,66,749180954),(28622,1554854402,215,753952798),(23287,1554854407,1,757809759),(23291,1554854411,6,772928183),(23292,1554854412,143,764778310),(28634,1554854414,1554854414,769701788),(23294,1554854414,108,770425449),(28635,1554854415,2053607424,772952044),(23298,1554854418,202,777335571),(28640,1554854420,3,786869334),(23662,1554854422,0,781995562),(28642,1554854422,634892288,783969305),(23308,1554854428,1554854428,789038361),(23309,1554854429,859557888,790129431),(28651,1554854431,2744,792118200),(28652,1554854432,2840,793025876),(23314,1554854434,2,803569526),(28655,1554854435,5053784064,797727769),(23316,1554854436,408604672,797173350),(28656,1554854436,893579264,799236838),(28661,1554854441,1587896320,805140123),(28662,1554854442,169676800,805317073),(28663,1554854443,16,807614699),(28664,1554854444,2416,808333769),(28665,1554854445,24,809508561),(28666,1554854446,0,810759037),(28667,1554854447,0,811651075),(28668,1554854448,40,812778220),(28249,1554854449,0,811878833),(28669,1554854449,1976,813375822),(28670,1554854450,40,814264263),(28671,1554854451,8,815722961),(28611,1554854451,1,816140214),(23272,1554854452,0,815226589),(28672,1554854452,0,816680320),(28674,1554854454,3392020480,820484701),(28615,1554854455,3,824256049),(28616,1554854456,119,822769441),(28677,1554854457,6553116672,824948908),(28678,1554854458,1,824477483),(28618,1554854458,69,825879859),(28622,1554854462,226,830158834),(23287,1554854467,1,834090171),(23291,1554854471,4,849134272),(23292,1554854472,143,841077382),(28634,1554854474,1554854474,843792186),(23294,1554854474,107,844092518),(28635,1554854475,2053607424,846167878),(23298,1554854478,210,848379456),(28640,1554854480,3,854944872),(23662,1554854482,0,853196722),(28642,1554854482,632647680,853806751),(23308,1554854488,1554854488,858410263),(23309,1554854489,859557888,858996901),(28651,1554854491,2864,861168698),(28652,1554854492,3008,861828137),(23314,1554854494,2,873141731),(28655,1554854495,5053784064,867105452),(23316,1554854496,408535040,866332330),(28656,1554854496,893579264,868282106),(28661,1554854501,1587896320,874110011),(28662,1554854502,169676800,876693191),(28663,1554854503,16,877771718),(28664,1554854504,2416,878735193),(28665,1554854505,24,879028048),(28666,1554854506,0,880578523),(28667,1554854507,0,881673655),(28668,1554854508,40,883014114),(28249,1554854509,0,883026060),(28669,1554854509,2024,884486483),(28670,1554854510,40,885624297),(28671,1554854511,0,886638175),(28611,1554854511,1,887067654),(23272,1554854512,0,886841683),(28672,1554854512,0,888410863),(28674,1554854514,3392020480,891495060),(28615,1554854515,3,895416327),(28616,1554854516,119,894450911),(28677,1554854517,6553116672,895821080),(28618,1554854518,65,895675069),(28678,1554854518,1,896822724),(28622,1554854522,216,900810358),(23287,1554854527,1,904152180),(23291,1554854531,6,917999060),(23292,1554854532,144,909531677),(28634,1554854534,1554854534,914119554),(23294,1554854534,121,914822253),(28635,1554854535,2053607424,917432581),(23298,1554854538,208,922548614),(28640,1554854540,3,929432643),(23662,1554854542,0,925186107),(28642,1554854542,632774656,927397970),(23308,1554854548,1554854548,930486549),(23309,1554854549,859557888,931037627),(28651,1554854551,4328,932251218),(28652,1554854552,27072,933695092),(23314,1554854554,2,945741429),(28655,1554854555,5053784064,938661741),(28656,1554854556,893579264,939711584),(23316,1554854556,408539136,940245264),(28661,1554854561,1587896320,947076041),(28662,1554854562,169676800,948186909),(28663,1554854563,16,948600498),(28664,1554854564,2456,948965910),(28665,1554854565,24,950597472),(28666,1554854566,0,950928272),(28667,1554854567,0,952202979),(28668,1554854568,40,953165730),(28249,1554854569,0,952743478),(28669,1554854569,1888,953944358),(28670,1554854570,40,955078500),(28671,1554854571,0,955879918),(28611,1554854571,1,956390698),(23272,1554854572,0,955289861),(28672,1554854572,0,957063921),(28674,1554854574,3392020480,960458857),(28615,1554854575,3,964447554),(28616,1554854576,119,964474275),(28677,1554854577,6553116672,965566660),(28618,1554854578,65,964926483),(28678,1554854578,1,966438955),(28622,1554854582,214,971495384),(23287,1554854587,1,974352240),(23291,1554854591,6,988769789),(23292,1554854592,144,980193539),(23294,1554854594,114,983152473),(28634,1554854594,1554854594,984660341),(28635,1554854595,2053607424,986692148),(23298,1554854598,206,992812338),(28640,1554854600,3,999769879),(23662,1554854602,0,995657004),(28642,1554854602,632647680,997837906),(23308,1554854608,1554854608,6359582),(23309,1554854609,859557888,6897701),(28651,1554854611,4336,9389129),(28652,1554854612,32632,985984),(23314,1554854614,2,8367795),(28655,1554854615,5053784064,2585360),(28656,1554854616,893579264,3727125),(23316,1554854616,409169920,4218268),(28661,1554854621,1587896320,10622959),(28662,1554854622,169676800,13781644),(28663,1554854623,16,13743219),(28664,1554854624,2424,16385961),(28665,1554854625,24,16944597),(28666,1554854626,0,17603997),(28667,1554854627,0,18673941),(28668,1554854628,48,19712895),(28249,1554854629,0,18406146),(28669,1554854629,1944,20162464),(28670,1554854630,48,26585698),(28671,1554854631,0,25451270),(28611,1554854631,1,25851502),(23272,1554854632,0,24961155),(28672,1554854632,0,26777370),(28674,1554854634,3392020480,31148480),(28615,1554854635,3,35482512),(28616,1554854636,119,33373800),(28677,1554854637,6553116672,35056201),(28618,1554854638,65,34910595),(28678,1554854638,1,35489516),(28622,1554854642,214,40598239),(23287,1554854647,1,44504749),(23291,1554854651,6,59633631),(23292,1554854652,144,52558410),(23294,1554854654,144,54611180),(28634,1554854654,1554854654,56425100),(28635,1554854655,2053607424,58541681),(23298,1554854658,225,62678589),(28640,1554854660,3,69401544),(23662,1554854662,0,65818705),(28642,1554854662,632774656,66949933),(23308,1554854668,1554854668,70989005),(23309,1554854669,859557888,71205493),(28651,1554854671,4768,73118857),(28652,1554854672,25656,74575753),(23314,1554854674,2,82776074),(28655,1554854675,5053784064,80862349),(23316,1554854676,409190400,81130810),(28656,1554854676,893579264,82465798),(28661,1554854681,1587896320,89324167),(28662,1554854682,169676800,89740428),(28663,1554854683,16,90416241),(28664,1554854684,2432,92617451),(28665,1554854685,24,93648537),(28666,1554854686,0,94422523),(28667,1554854687,0,95583509),(28668,1554854688,40,96686647),(28249,1554854689,0,95837106),(28669,1554854689,1976,97274640),(28670,1554854690,40,98530092),(28671,1554854691,0,99849292),(28611,1554854691,1,100352814),(23272,1554854692,0,99439938),(28672,1554854692,0,100876785),(28674,1554854694,3392020480,104523820),(28615,1554854695,3,109742226),(28616,1554854696,119,108446184),(28677,1554854697,6553116672,109740181),(28618,1554854698,66,108483526),(28678,1554854698,1,110201312),(28622,1554854702,214,116743720),(23287,1554854707,1,119959655),(23291,1554854711,4,134703737),(23292,1554854712,144,127314590),(23294,1554854714,119,129735543),(28634,1554854714,1554854714,131415469),(28635,1554854715,2053607424,132133746),(23298,1554854718,208,136707040),(28640,1554854720,3,143756578),(23662,1554854722,0,140066182),(28642,1554854722,632647680,142007398),(23308,1554854728,1554854728,146939942),(23309,1554854729,859557888,147644140),(28651,1554854731,3944,148955633),(28652,1554854732,10440,150194169),(23314,1554854734,2,161795722),(28655,1554854735,5053784064,154804676),(28656,1554854736,893579264,156389338),(23316,1554854736,408768512,156897105),(28661,1554854741,1587896320,162514433),(28662,1554854742,169676800,163336133),(28663,1554854743,16,165866456),(28664,1554854744,2344,167048159),(28665,1554854745,24,168260882),(28666,1554854746,0,169480059),(28667,1554854747,0,169972852),(28668,1554854748,40,184192638),(28249,1554854749,0,180671635),(28669,1554854749,1920,181727105),(28670,1554854750,40,182643198),(28611,1554854751,1,183798618),(28671,1554854751,0,184217332),(23272,1554854752,0,183767740),(28672,1554854752,0,185679148),(28674,1554854754,3392020480,189156992),(28615,1554854755,3,192916019),(28616,1554854756,119,191459004),(28677,1554854757,6553116672,193666475),(28678,1554854758,1,192204500),(28618,1554854758,66,193583623),(28622,1554854762,214,198474520),(23287,1554854767,1,202259616),(23291,1554854771,7,220991568),(23292,1554854772,144,219977046),(23294,1554854774,124,219442257),(28634,1554854774,1554854774,221205403),(28635,1554854775,2053607424,223660028),(23298,1554854778,215,225567179),(28640,1554854780,3,232678065),(23662,1554854782,0,229886051),(28642,1554854782,632782848,231157132),(23308,1554854788,1554854788,235632782),(23309,1554854789,859557888,237071998),(28651,1554854791,7952,238950507),(28652,1554854792,128272,240036692),(23314,1554854794,2,250352761),(28655,1554854795,5053784064,243945409),(23316,1554854796,411508736,245449799),(28656,1554854796,893579264,246787730),(28661,1554854801,1587896320,254370241),(28662,1554854802,169676800,255196080),(28663,1554854803,16,255630412),(28664,1554854804,2480,256194877),(28665,1554854805,24,258322521),(28666,1554854806,0,258850969),(28667,1554854807,0,260456052),(28668,1554854808,40,261860620),(28249,1554854809,0,261581610),(28669,1554854809,1960,262733567),(28670,1554854810,40,263384171),(28611,1554854811,1,264572492),(28671,1554854811,0,265028552),(23272,1554854812,0,264501192),(28672,1554854812,0,266064519),(28674,1554854814,3392020480,269464392),(28615,1554854815,2,272749411),(28616,1554854816,119,271850381),(28617,1554854817,1554847105,275072265),(28677,1554854817,6553116672,277422913),(28678,1554854818,1,276243999),(28618,1554854818,66,276824869),(28622,1554854822,216,281621483),(23287,1554854827,1,285254642),(23291,1554854831,6,300477459),(23292,1554854832,143,291534240),(23294,1554854834,131,293920574),(28634,1554854834,1554854834,295550265),(28635,1554854835,2053607424,298074283),(23298,1554854838,211,302649547),(28639,1554854839,7734,305082351),(28640,1554854840,3,310441931),(23662,1554854842,0,305651889),(28642,1554854842,632909824,307499528),(23308,1554854848,1554854848,312586726),(23309,1554854849,859557888,313544751),(28651,1554854851,3464,316123948),(28652,1554854852,13152,316553841),(23314,1554854854,2,326721784),(28655,1554854855,5053784064,320505607),(28656,1554854856,893579264,321165016),(23316,1554854856,410845184,321670693),(28661,1554854861,1587896320,328409754),(28662,1554854862,169676800,329802547),(28663,1554854863,16,329887324),(28664,1554854864,2464,332322658),(28665,1554854865,24,333383503),(28666,1554854866,0,334211190),(28667,1554854867,0,335235349),(28668,1554854868,40,335973608),(28249,1554854869,0,336495204),(28669,1554854869,2000,336852743),(28670,1554854870,40,338991662),(23271,1554854871,0,337630321),(28611,1554854871,1,339637316),(28671,1554854871,0,340099551),(23272,1554854872,0,339479991),(28672,1554854872,0,341410906),(28674,1554854874,3392020480,345439580),(28615,1554854875,3,348968936),(28616,1554854876,119,348046143),(28677,1554854877,6553116672,348526798),(28678,1554854878,1,347988158),(28618,1554854878,65,350115726),(28622,1554854882,213,353660108),(23287,1554854887,1,356290785),(23291,1554854891,6,369845353),(23292,1554854892,143,374233763),(23293,1554854893,1554807130,372596090),(23294,1554854894,103,373677125),(28634,1554854894,1554854894,375399155),(28635,1554854895,2053607424,376819295),(23298,1554854898,202,378763093),(28640,1554854900,3,385948578),(23662,1554854902,0,382685276),(28642,1554854902,632909824,384581670),(23308,1554854908,1554854908,388359137),(23309,1554854909,859557888,389620119),(28651,1554854911,2912,390428790),(28652,1554854912,3024,391203084),(23313,1554854913,47783,392690038),(23314,1554854914,2,402865556),(28655,1554854915,5053784064,396137765),(23316,1554854916,410083328,397864033),(28656,1554854916,893579264,399223102),(28661,1554854921,1587896320,404237740),(28662,1554854922,169676800,405929665),(28663,1554854923,16,409130771),(28664,1554854924,2384,408967389),(28665,1554854925,24,409275063),(28666,1554854926,0,409715040),(28667,1554854927,0,410525805),(28668,1554854928,56,412665919),(28249,1554854929,0,412283599),(28669,1554854929,1896,413782998),(28670,1554854930,56,414416042),(28611,1554854931,1,415357659),(28671,1554854931,8,415989466),(23272,1554854932,0,414882116),(28672,1554854932,0,416664911),(28674,1554854934,3392020480,420389682),(28615,1554854935,3,424201647),(28616,1554854936,119,422474613),(28677,1554854937,6553116672,425404613),(28678,1554854938,1,424865378),(28618,1554854938,66,425893160),(28622,1554854942,229,430244805),(23287,1554854947,1,433184388),(23291,1554854951,3,448816280),(23292,1554854952,143,440921496),(23294,1554854954,105,443308182),(28634,1554854954,1554854954,443931098),(28635,1554854955,2053607424,445572925),(23298,1554854958,201,448694967),(28640,1554854960,3,456116589),(23662,1554854962,0,453671337),(28642,1554854962,632414208,456159680),(23308,1554854968,1554854968,459942870),(23309,1554854969,859557888,460961024),(28651,1554854971,3048,462358043),(28652,1554854972,3112,463592740),(23314,1554854974,2,473841888),(28655,1554854975,5053784064,469722038),(23316,1554854976,410025984,469143370),(28656,1554854976,893579264,470561863),(28661,1554854981,1587896320,475918394),(28662,1554854982,169676800,476208797),(28663,1554854983,16,478080852),(28664,1554854984,2448,479744003),(28665,1554854985,24,480453178),(28666,1554854986,0,481579550),(28667,1554854987,0,482065296),(28668,1554854988,40,482774049),(28249,1554854989,0,482646588),(28669,1554854989,1992,484088891),(28670,1554854990,40,485066109),(28611,1554854991,1,486495704),(28671,1554854991,0,487197844),(23272,1554854992,0,485230610),(28672,1554854992,0,486924647),(28674,1554854994,3392020480,490075853),(28615,1554854995,3,494408232),(28616,1554854996,119,492632676),(28677,1554854997,6553116672,495068475),(28678,1554854998,1,493816464),(28618,1554854998,67,494935186),(28622,1554855002,213,500675534),(23287,1554855007,1,503856480),(23291,1554855011,6,518063520),(23292,1554855012,144,510113494),(23294,1554855014,100,512285946),(28634,1554855014,1554855014,512937930),(28635,1554855015,2053607424,514966442),(23298,1554855018,198,518587769),(28640,1554855020,3,525761589),(23662,1554855022,0,522883335),(28642,1554855022,632422400,524462017),(23308,1554855028,1554855028,527824630),(23309,1554855029,859557888,529108230),(28651,1554855031,3336,530985849),(28652,1554855032,11456,532343039),(23314,1554855034,2,543425531),(28655,1554855035,5053521920,536768323),(28656,1554855036,893579264,537567804),(23316,1554855036,410030080,538103207),(28661,1554855041,1588158464,544257888),(28662,1554855042,169676800,545309498),(28663,1554855043,16,545579668),(28664,1554855044,2360,545947965),(28665,1554855045,24,548013896),(28666,1554855046,0,548540461),(28667,1554855047,0,549507436),(28668,1554855048,40,550829408),(28249,1554855049,0,550200507),(28669,1554855049,1952,551556906),(28670,1554855050,40,552049686),(28671,1554855051,0,553432528),(28611,1554855051,1,553640616),(23272,1554855052,0,552830948),(28672,1554855052,0,554250036),(28674,1554855054,3392020480,557579292),(28615,1554855055,3,561388167),(28616,1554855056,119,560745202),(28677,1554855057,6553116672,567079598),(28678,1554855058,1,565807263),(28618,1554855058,66,566993464),(28622,1554855062,215,571185783),(23287,1554855067,1,575299003),(23291,1554855071,6,589751509),(23292,1554855072,144,583277697),(23294,1554855074,205,585622116),(28634,1554855074,1554855074,587348847),(28635,1554855075,2053607424,590672522),(23298,1554855078,255,593120188),(28640,1554855080,3,600381136),(23662,1554855082,0,597553887),(28642,1554855082,632422400,599637309),(23308,1554855088,1554855088,604552158),(23309,1554855089,859557888,605898264),(28651,1554855091,10360,607810085),(28652,1554855092,78048,608824457),(23314,1554855094,2,619979186),(28655,1554855095,5053521920,612964200),(23316,1554855096,410136576,614262465),(28656,1554855096,893579264,616247766),(28661,1554855101,1588158464,619187031),(28662,1554855102,169676800,621404920),(28663,1554855103,16,621910066),(28664,1554855104,2552,623145733),(28665,1554855105,24,624142081),(28666,1554855106,0,625684811),(28667,1554855107,0,626828439),(28668,1554855108,40,627523436),(28249,1554855109,0,627169646),(28669,1554855109,1968,628591379),(28670,1554855110,40,629373927),(28611,1554855111,1,630167578),(28671,1554855111,0,630732279),(23272,1554855112,0,629905175),(28672,1554855112,0,631536945),(28674,1554855114,3392020480,635441204),(28615,1554855115,3,639097589),(28616,1554855116,119,636958931),(28677,1554855117,6553116672,639891778),(28618,1554855118,65,638540370),(28678,1554855118,1,638876234),(28622,1554855122,214,645135874),(23287,1554855127,1,648320144),(23291,1554855131,6,661935886),(23292,1554855132,143,655558350),(23294,1554855134,135,656537761),(28634,1554855134,1554855134,658188098),(28635,1554855135,2053607424,660580795),(23298,1554855138,218,665405520),(28640,1554855140,3,672505929),(23662,1554855142,0,668395692),(28642,1554855142,632422400,670269294),(23308,1554855148,1554855148,673859775),(23309,1554855149,859557888,675067433),(28651,1554855151,3584,676210095),(28652,1554855152,6136,676727710),(23314,1554855154,2,688139677),(28655,1554855155,5053521920,681238871),(23316,1554855156,409444352,680687763),(28656,1554855156,893579264,682668106),(28661,1554855161,1588158464,687913100),(28662,1554855162,169676800,690617488),(28663,1554855163,16,691081256),(28664,1554855164,2600,692406203),(28665,1554855165,24,693177856),(28666,1554855166,0,694090681),(28667,1554855167,0,694861878),(28668,1554855168,40,695713551),(28249,1554855169,0,695533254),(28669,1554855169,1976,696962469),(28670,1554855170,40,698019108),(28611,1554855171,1,699003245),(28671,1554855171,0,699394622),(23272,1554855172,0,698243766),(28672,1554855172,0,699985502),(28674,1554855174,3392020480,703639463),(28615,1554855175,3,707429020),(28616,1554855176,119,706168331),(28677,1554855177,6553116672,707930775),(28678,1554855178,1,707550166),(28618,1554855178,66,708219867),(28622,1554855182,214,713845388),(23287,1554855187,1,716239477),(23291,1554855191,6,731999152),(23292,1554855192,144,725742237),(23294,1554855194,104,727390681),(28634,1554855194,1554855194,728896633),(28635,1554855195,2053607424,731579200),(23298,1554855198,204,734579950),(28640,1554855200,3,740785439),(23662,1554855202,0,737927207),(28642,1554855202,632455168,739007131),(23308,1554855208,1554855208,742951533),(23309,1554855209,859557888,743450310),(28651,1554855211,4016,745927734),(28652,1554855212,4040,746713648),(23314,1554855214,2,758329258),(28655,1554855215,5053521920,752367422),(23316,1554855216,408027136,752451173),(28656,1554855216,893579264,753993702),(28661,1554855221,1588158464,760183400),(28662,1554855222,169676800,760886626),(28663,1554855223,16,760906213),(28664,1554855224,2544,762723479),(28665,1554855225,24,763417981),(28666,1554855226,0,764517670),(28667,1554855227,0,764939073),(28668,1554855228,40,766328438),(28249,1554855229,0,766084386),(28669,1554855229,2144,767404622),(28670,1554855230,40,768591767),(28611,1554855231,1,769683942),(28671,1554855231,0,770072518),(23272,1554855232,0,768534752),(28672,1554855232,0,770335010),(28674,1554855234,3392020480,773917466),(28615,1554855235,3,777985273),(28616,1554855236,119,776817856),(28677,1554855237,6553116672,778127745),(28618,1554855238,65,777203294),(28678,1554855238,1,778677703),(28622,1554855242,213,784053816),(23287,1554855247,1,787744697),(23291,1554855251,5,802042210),(23292,1554855252,144,795316353),(28634,1554855254,1554855254,797604710),(23294,1554855254,109,798263900),(28635,1554855255,2053607424,800699179),(23298,1554855258,203,806101627),(28640,1554855260,3,813652690),(23662,1554855262,0,808935110),(28642,1554855262,632463360,810912510),(23308,1554855268,1554855268,815224175),(23309,1554855269,859557888,815693016),(28651,1554855271,2776,817603002),(28652,1554855272,2864,817904204),(23314,1554855274,2,829293544),(28655,1554855275,5053521920,822864024),(28656,1554855276,893579264,823989563),(23316,1554855276,407994368,824404766),(28661,1554855281,1588158464,829802683),(28662,1554855282,169676800,830804145),(28663,1554855283,16,832995794),(28664,1554855284,2400,833742794),(28665,1554855285,24,834168366),(28666,1554855286,0,835543454),(28667,1554855287,0,836828883),(28668,1554855288,40,837319390),(28249,1554855289,0,836162376),(28669,1554855289,1936,838110606),(28670,1554855290,40,838979963),(28611,1554855291,1,840147224),(28671,1554855291,0,841047351),(23272,1554855292,0,839823712),(28672,1554855292,0,841369485),(28674,1554855294,3392020480,844417999),(28615,1554855295,2,848784288),(28616,1554855296,119,847094083),(28677,1554855297,6553116672,848979491),(28678,1554855298,1,848562799),(28618,1554855298,65,849676655),(28622,1554855302,215,854415558),(23287,1554855307,1,855695692),(23291,1554855311,5,870344132),(23292,1554855312,143,862693588),(28634,1554855314,1554855314,867603042),(23294,1554855314,103,868425833),(28635,1554855315,2053607424,871010149),(23298,1554855318,199,874485844),(28640,1554855320,3,881434216),(23662,1554855322,0,878773618),(28642,1554855322,632471552,880636768),(23308,1554855328,1554855328,883861797),(23309,1554855329,859557888,884597004),(28651,1554855331,3976,886729323),(28652,1554855332,18920,887855313),(23314,1554855334,2,898358593),(28655,1554855335,5053521920,893966603),(23316,1554855336,406659072,893735060),(28656,1554855336,893579264,895650212),(28661,1554855341,1588158464,900239436),(28662,1554855342,169676800,901020262),(28663,1554855343,16,902690527),(28664,1554855344,2384,903448428),(28665,1554855345,24,904805288),(28666,1554855346,0,905876233),(28667,1554855347,0,907472003),(28668,1554855348,40,908977232),(28249,1554855349,0,908207382),(28669,1554855349,1944,909699143),(28670,1554855350,40,910565725),(28671,1554855351,0,911959811),(28611,1554855351,1,912461958),(23272,1554855352,0,910869416),(28672,1554855352,0,912562900),(28674,1554855354,3392020480,915522905),(28615,1554855355,3,919778080),(28616,1554855356,119,918356040),(28677,1554855357,6553116672,921246744),(28678,1554855358,1,919664846),(28618,1554855358,65,921449357),(28622,1554855362,212,925974693),(23287,1554855367,1,929038355),(23291,1554855371,6,942921570),(23292,1554855372,143,934914658),(28634,1554855374,1554855374,940233375),(23294,1554855374,137,940935736),(28635,1554855375,2053607424,943268193),(23298,1554855378,224,946105018),(28640,1554855380,3,953453796),(23662,1554855382,0,950925819),(28642,1554855382,632471552,952872717),(23308,1554855388,1554855388,959193991),(23309,1554855389,859557888,959818797),(28651,1554855391,6192,960608956),(28652,1554855392,32360,961450337),(23314,1554855394,2,971707525),(28655,1554855395,5053521920,970600407),(23316,1554855396,403083264,970744643),(28656,1554855396,893579264,972061082),(28661,1554855401,1588158464,977833124),(28662,1554855402,169676800,980197492),(28663,1554855403,16,980579641),(28664,1554855404,2320,981695053),(28665,1554855405,24,982094456),(28666,1554855406,0,982799726),(28667,1554855407,0,983464583),(28668,1554855408,40,984537812),(28249,1554855409,0,984472045),(28669,1554855409,1896,985931096),(28670,1554855410,40,986874717),(28611,1554855411,1,987647985),(28671,1554855411,0,988032970),(23272,1554855412,0,987532518),(28672,1554855412,0,988809175),(28674,1554855414,3392020480,999654476),(28615,1554855416,3,1824290),(28616,1554855416,120,5057584),(28617,1554855417,1554847105,2551889),(28677,1554855417,6553116672,5798518),(28678,1554855418,1,7570312),(28618,1554855418,65,8329285),(28622,1554855422,214,13977353),(23287,1554855427,1,5112587),(23291,1554855431,3,22116095),(23292,1554855432,143,25538227),(28634,1554855434,1554855434,25236920),(23294,1554855434,135,25969713),(28635,1554855435,2053607424,29884552),(23298,1554855438,215,31578977),(28639,1554855439,8334,33678454),(28640,1554855440,3,38941725),(23662,1554855442,0,35149552),(28642,1554855442,632487936,36796046),(23308,1554855448,1554855448,40503552),(23309,1554855449,859557888,41423712),(28651,1554855451,3576,43177090),(28652,1554855452,9824,44123017),(23314,1554855454,2,54902150),(28655,1554855455,5053521920,49142162),(23316,1554855456,403079168,50163965),(28656,1554855456,893579264,52097869),(28661,1554855461,1588158464,71709861),(28662,1554855462,169676800,61835166),(28663,1554855463,16,61879956),(28664,1554855464,2488,63180759),(28665,1554855465,24,64519894),(28666,1554855466,0,65386482),(28667,1554855467,0,66372354),(28668,1554855468,48,67785505),(28249,1554855469,0,67749726),(28669,1554855469,2024,69120495),(28670,1554855470,48,69832037),(23271,1554855471,0,69738957),(28671,1554855471,0,71828666),(28611,1554855471,1,72520363),(23272,1554855472,0,71304060),(28672,1554855472,0,73360386),(28674,1554855474,3392020480,77189350),(28615,1554855475,3,81220736),(28616,1554855476,119,82054183),(28677,1554855477,6553116672,82644672),(28678,1554855478,1,84718006),(28618,1554855478,64,85607172),(28622,1554855482,215,88708084),(23287,1554855487,1,92930690),(23291,1554855491,5,107838857),(23292,1554855492,144,99857815),(23293,1554855493,1554807130,101175253),(23294,1554855494,106,102841138),(28634,1554855494,1554855494,103529173),(28635,1554855495,2053607424,105129264),(23298,1554855498,203,109031777),(28640,1554855500,3,116485387),(23662,1554855502,0,112760909),(28642,1554855502,634781696,115645103),(23308,1554855508,1554855508,119162928),(23309,1554855509,859557888,120323036),(28651,1554855511,3016,121982618),(28652,1554855512,4592,122786700),(23313,1554855513,48383,124143812),(23314,1554855514,2,135737741),(28655,1554855515,5053521920,129051771),(23316,1554855516,404574208,129058305),(28656,1554855516,893579264,130397738),(28661,1554855521,1588158464,135877193),(28662,1554855522,169676800,136201015),(28663,1554855523,16,136446054),(28664,1554855524,2400,137212977),(28665,1554855525,24,138796759),(28666,1554855526,0,139444037),(28667,1554855527,0,140442237),(28668,1554855528,40,141459910),(28249,1554855529,0,140898618),(28669,1554855529,1960,142680878),(28670,1554855530,40,143565767),(28671,1554855531,0,144933435),(28611,1554855531,1,145477488),(23272,1554855532,0,144403151),(28672,1554855532,0,145925105),(28674,1554855534,3392020480,149440382),(28615,1554855535,3,153495465),(28616,1554855536,119,151837767),(28677,1554855537,6553116672,152590250),(28618,1554855538,65,152917263),(28678,1554855538,1,154491613),(28622,1554855542,216,158668815),(23287,1554855547,1,161701885),(23291,1554855551,6,175940577),(23292,1554855552,144,168566612),(28634,1554855554,1554855554,170756481),(23294,1554855554,103,171460027),(28635,1554855555,2053607424,173477033),(23298,1554855558,201,177025196),(28640,1554855560,3,184178900),(23662,1554855562,0,180474438),(28642,1554855562,634781696,181945074),(23308,1554855568,1554855568,184609158),(23309,1554855569,859557888,185220837),(28651,1554855571,3208,186879433),(28652,1554855572,3016,188237482),(23314,1554855574,2,198682820),(28655,1554855575,5053521920,192035290),(23316,1554855576,404606976,191628696),(28656,1554855576,893579264,194193467),(28661,1554855581,1588158464,198945121),(28662,1554855582,169676800,201532464),(28663,1554855583,16,201671723),(28664,1554855584,2648,202620486),(28665,1554855585,24,203704497),(28666,1554855586,0,204421970),(28667,1554855587,0,205270669),(28668,1554855588,40,205880486),(28249,1554855589,0,205903206),(28669,1554855589,1912,206550422),(28670,1554855590,40,207548861),(28611,1554855591,1,208598688),(28671,1554855591,0,209214847),(23272,1554855592,0,207913815),(28672,1554855592,0,209625076),(28674,1554855594,3392020480,213238505),(28615,1554855595,2,217936218),(28616,1554855596,119,216706575),(28677,1554855597,6553116672,216973586),(28678,1554855598,1,215629566),(28618,1554855598,65,217925686),(28622,1554855602,216,222351171),(23287,1554855607,1,225233339),(23291,1554855611,7,240103970),(23292,1554855612,144,242164858),(23294,1554855614,103,240442024),(28634,1554855614,1554855614,242017678),(28635,1554855615,2053607424,244396624),(23298,1554855618,201,245234849),(28640,1554855620,3,252410916),(23662,1554855622,0,248133209),(28642,1554855622,634781696,249813267),(23308,1554855628,1554855628,253355165),(23309,1554855629,859557888,254444134),(28651,1554855631,2992,256442223),(28652,1554855632,3072,256935685),(23314,1554855634,2,266313514),(28655,1554855635,5053521920,261866856),(23316,1554855636,404611072,261999020),(28656,1554855636,893579264,263336349),(28661,1554855641,1588158464,270156415),(28662,1554855642,169676800,271011483),(28663,1554855643,112,271633746),(28664,1554855644,2696,273506617),(28665,1554855645,136,274341477),(28666,1554855646,0,275469694),(28667,1554855647,0,275989444),(28668,1554855648,152,277182214),(28249,1554855649,0,276966657),(28669,1554855649,2456,278030763),(28670,1554855650,152,279622156),(28611,1554855651,1,280586240),(28671,1554855651,0,281153331),(23272,1554855652,0,280477591),(28672,1554855652,0,281838191),(28674,1554855654,3392020480,285643894),(28615,1554855655,3,289233873),(28616,1554855656,119,287784017),(28677,1554855657,6553116672,288621185),(28678,1554855658,1,289159885),(28618,1554855658,68,289850018),(28622,1554855662,220,301107592),(23287,1554855667,1,304363470),(23291,1554855671,4,322608376),(23292,1554855672,144,314450981),(23294,1554855674,106,317080217),(28634,1554855674,1554855674,318612972),(28635,1554855675,2053607424,321181605),(23298,1554855678,199,325640337),(28640,1554855680,3,345636927),(23662,1554855682,0,336014573),(28642,1554855682,634699776,337625120),(23308,1554855688,1554855688,342821811),(23309,1554855689,859557888,344460908),(28651,1554855691,2928,348398501),(28652,1554855692,3080,348920339),(23314,1554855694,2,359839831),(28655,1554855695,5053521920,354442760),(23316,1554855696,404611072,355763025),(28656,1554855696,893579264,357050571),(28661,1554855701,1588158464,362670612),(28662,1554855702,169676800,362933171),(28663,1554855703,88,363532940),(28664,1554855704,2440,364938455),(28665,1554855705,112,365555745),(28666,1554855706,0,366795115),(28667,1554855707,0,367335434),(28668,1554855708,40,368387030),(28249,1554855709,0,367794329),(28669,1554855709,1936,369173098),(28670,1554855710,40,376412329),(28611,1554855711,1,371456085),(28671,1554855711,0,372063470),(23272,1554855712,0,372574725),(28672,1554855712,0,374004880),(28674,1554855714,3392020480,378389013),(28615,1554855715,2,385151091),(28616,1554855716,119,384404938),(28677,1554855717,6553116672,384947465),(28678,1554855718,1,383424590),(28618,1554855718,65,384673357),(28622,1554855722,214,390077741),(23287,1554855727,1,392502473),(23291,1554855731,6,405812704),(23292,1554855732,144,398329618),(28634,1554855734,1554855734,402583682),(23294,1554855734,104,403254888),(28635,1554855735,2053607424,405469560),(23298,1554855738,197,409751872),(28640,1554855740,3,416693038),(23662,1554855742,0,413524060),(28642,1554855742,634707968,414851595),(23308,1554855748,1554855748,418848904),(23309,1554855749,859557888,419747812),(28651,1554855751,2952,421663135),(28652,1554855752,3032,422496079),(23314,1554855754,2,433225755),(28655,1554855755,5053521920,427892487),(23316,1554855756,404627456,427333978),(28656,1554855756,893579264,429312527),(28661,1554855761,1588158464,434110237),(28662,1554855762,169676800,436820051),(28663,1554855763,16,436896941),(28664,1554855764,2352,438106362),(28665,1554855765,24,438834480),(28666,1554855766,0,439493773),(28667,1554855767,0,440549087),(28668,1554855768,40,440786741),(28249,1554855769,0,440420387),(28669,1554855769,1888,441834382),(28670,1554855770,40,443100478),(28611,1554855771,1,443845631),(28671,1554855771,0,444340729),(23272,1554855772,0,443434741),(28672,1554855772,0,444908598),(28674,1554855774,3392020480,448134772),(28615,1554855775,3,451946315),(28616,1554855776,119,451206625),(28677,1554855777,6553116672,452402641),(28618,1554855778,66,451869159),(28678,1554855778,1,453454289),(28622,1554855782,213,458129250),(23287,1554855787,1,462331923),(23291,1554855791,5,477208768),(23292,1554855792,143,469010988),(28634,1554855794,1554855794,472801749),(23294,1554855794,107,472981921),(28635,1554855795,2053607424,475308925),(23298,1554855798,200,479133228),(28640,1554855800,3,486356149),(23662,1554855802,0,482488740),(28642,1554855802,634707968,483916322),(23308,1554855808,1554855808,487196686),(23309,1554855809,859557888,487637756),(28651,1554855811,3032,489482412),(28652,1554855812,4416,490041793),(23314,1554855814,2,501724752),(28655,1554855815,5053521920,495468872),(28656,1554855816,893579264,496035503),(23316,1554855816,404631552,496432533),(28661,1554855821,1588158464,501198865),(28662,1554855822,169676800,502432182),(28663,1554855823,16,505007408),(28664,1554855824,2336,505565219),(28665,1554855825,24,507021828),(28666,1554855826,0,507769917),(28667,1554855827,0,508723165),(28668,1554855828,40,509429377),(28249,1554855829,0,508553688),(28669,1554855829,1912,510006149),(28670,1554855830,40,511373132),(28611,1554855831,1,512553050),(28671,1554855831,0,512937599),(23272,1554855832,0,511852239),(28672,1554855832,0,513268843),(28674,1554855834,3392020480,516622342),(28615,1554855835,2,520527479),(28616,1554855836,119,518804433),(28677,1554855837,6553116672,521488434),(28678,1554855838,1,520118488),(28618,1554855838,66,521539748),(28622,1554855842,215,526547903),(23287,1554855847,1,530926349),(23291,1554855851,6,545861924),(23292,1554855852,143,537041258),(28634,1554855854,1554855854,541668780),(23294,1554855854,101,542353415),(28635,1554855855,2053607424,544355700),(23298,1554855858,200,548663347),(28640,1554855860,3,556746852),(23662,1554855862,0,552902849),(28642,1554855862,634707968,554609899),(23308,1554855868,1554855868,557649495),(23309,1554855869,859557888,558201695),(28651,1554855871,2912,559477262),(28652,1554855872,3032,560924873),(23314,1554855874,2,571837229),(28655,1554855875,5053521920,565540693),(28656,1554855876,893579264,566285422),(23316,1554855876,404471808,566696556),(28661,1554855881,1588158464,572478247),(28662,1554855882,169676800,572884181),(28663,1554855883,16,574726075),(28664,1554855884,2376,575564829),(28665,1554855885,24,575886096),(28666,1554855886,0,577460474),(28667,1554855887,0,578358093),(28668,1554855888,40,579088166),(28249,1554855889,0,578571678),(28669,1554855889,1944,579811779),(28670,1554855890,40,580855009),(28611,1554855891,1,582410278),(28671,1554855891,0,582699447),(23272,1554855892,0,580969392),(28672,1554855892,0,582825796),(28674,1554855894,3392020480,586525519),(28615,1554855895,3,590436060),(28616,1554855896,119,588769124),(28677,1554855897,6553116672,591211311),(28678,1554855898,1,590442484),(28618,1554855898,65,591527143),(28622,1554855902,215,596370922),(23287,1554855907,1,599039304),(23291,1554855911,6,612427745),(23292,1554855912,143,607054162),(28634,1554855914,1554855914,610536454),(23294,1554855914,100,611216006),(28635,1554855915,2053607424,613235357),(23298,1554855918,198,616758759),(28640,1554855920,3,624115308),(23662,1554855922,0,620294648),(28642,1554855922,634707968,622454346),(23308,1554855928,1554855928,628050861),(23309,1554855929,859557888,628578222),(28651,1554855931,2888,629926815),(28652,1554855932,3032,630882631),(23314,1554855934,2,642545292),(28655,1554855935,5053521920,636174587),(23316,1554855936,404459520,635406701),(28656,1554855936,893579264,637547962),(28661,1554855941,1588158464,644016305),(28662,1554855942,169676800,646852527),(28663,1554855943,16,647928574),(28664,1554855944,2352,648560719),(28665,1554855945,24,649570677),(28666,1554855946,0,650882680),(28667,1554855947,0,651463047),(28668,1554855948,40,652793083),(28249,1554855949,0,652471057),(28669,1554855949,1912,653890895),(28670,1554855950,40,654497549),(28611,1554855951,1,655007970),(28671,1554855951,0,655632635),(23272,1554855952,0,655632770),(28672,1554855952,0,657034129),(28674,1554855954,3392020480,660641718),(28615,1554855955,2,664556051),(28616,1554855956,119,663925603),(28677,1554855957,6553116672,665716963),(28678,1554855958,1,664476268),(28618,1554855958,66,666607996),(28622,1554855962,213,671706907),(23287,1554855967,1,675311205),(23291,1554855971,8,688777431),(23292,1554855972,144,691594713),(23294,1554855974,120,693475569),(28634,1554855974,1554855974,694034961),(28635,1554855975,2053607424,695342387),(23298,1554855978,213,697827896),(28640,1554855980,3,704536736),(23662,1554855982,0,700965423),(28642,1554855982,634707968,702371610),(23308,1554855988,1554855988,706873533),(23309,1554855989,859557888,708410228),(28651,1554855991,5952,710429351),(28652,1554855992,53072,710950405),(23314,1554855994,2,722919642),(28655,1554855995,5053521920,720283377),(23316,1554855996,403484672,721820252),(28656,1554855996,893579264,723779243),(28661,1554856001,1588158464,728996218),(28662,1554856002,169676800,729278761),(28663,1554856003,16,729700420),(28664,1554856004,2360,731261864),(28665,1554856005,24,731797403),(28666,1554856006,0,732397049),(28667,1554856007,0,733747387),(28668,1554856008,40,735157361),(28249,1554856009,0,735238996),(28669,1554856009,1912,736530068),(28670,1554856010,40,737879458),(28671,1554856011,0,739150856),(28611,1554856011,1,739609432),(23272,1554856012,0,739076244),(28672,1554856012,0,740923203),(28674,1554856014,3392020480,743624461),(28615,1554856015,2,747730040),(28616,1554856016,119,748586081),(28617,1554856017,1554847105,750337910),(28677,1554856017,6553116672,750733814),(28678,1554856018,1,751992158),(28618,1554856018,67,752783145),(28622,1554856022,216,756604833),(23287,1554856027,1,760083838),(23291,1554856031,6,775853374),(23292,1554856032,145,767537222),(28634,1554856034,1554856034,772206873),(23294,1554856034,168,772908423),(28635,1554856035,2053607424,775271378),(23298,1554856038,238,779516280),(28639,1554856039,8935,781399812),(28640,1554856040,3,786578412),(23662,1554856042,0,782558047),(28642,1554856042,634707968,784252954),(23308,1554856048,1554856048,788667633),(23309,1554856049,859557888,789809720),(28651,1554856051,7272,790898241),(28652,1554856052,79920,791278612),(23314,1554856054,2,802821040),(28655,1554856055,5053521920,795856104),(28656,1554856056,893579264,797737273),(23316,1554856056,406556672,798170360),(28661,1554856061,1588158464,804150613),(28662,1554856062,169676800,806626836),(28663,1554856063,16,809525367),(28664,1554856064,2488,809088924),(28665,1554856065,24,809996219),(28666,1554856066,0,811257228),(28667,1554856067,0,812103278),(28668,1554856068,40,813199940),(28249,1554856069,0,813036168),(28669,1554856069,2040,814400411),(28670,1554856070,56,814648023),(23271,1554856071,0,814142455),(28671,1554856071,8,816082261),(28611,1554856071,1,816258078),(23272,1554856072,0,815530126),(28672,1554856072,0,837584462),(28674,1554856074,3392020480,821504553),(28615,1554856075,2,828768613),(28616,1554856076,119,832710580),(28677,1554856077,6553116672,833453638),(28678,1554856078,1,833011515),(28618,1554856078,66,834345118),(28622,1554856082,213,840535131),(23287,1554856087,1,844913315),(23289,1554856089,97834,847649365),(23290,1554856090,32768,849044709),(23291,1554856091,5,860097497),(23292,1554856092,144,864221847),(23293,1554856093,1554807130,863050393),(23294,1554856094,126,864634154),(28634,1554856094,1554856094,866323790),(28635,1554856095,2053607424,867835524),(23298,1554856098,217,870356098),(28640,1554856100,3,877632898),(23662,1554856102,0,874375519),(28642,1554856102,634707968,876100579),(23308,1554856108,1554856108,879787492),(23309,1554856109,859557888,881134360),(28651,1554856111,4456,883268734),(23311,1554856111,859828224,883720842),(28652,1554856112,28632,884184004),(23313,1554856113,48983,886356039),(23314,1554856114,2,895907171),(28655,1554856115,5053521920,889155325),(23315,1554856115,3307433096,889455348),(23316,1554856116,406790144,890142303),(28656,1554856116,893579264,892089603),(23317,1554856117,1039327232,891179331),(28661,1554856121,1588158464,898486465),(28662,1554856122,169676800,899830975),(28663,1554856123,16,900862356),(28664,1554856124,2344,902339954),(28665,1554856125,24,903185083),(28666,1554856126,0,904637429),(28667,1554856127,0,905309831),(28668,1554856128,40,906479334),(28249,1554856129,0,905244953),(28669,1554856129,1912,907077085),(28670,1554856130,40,908737963),(28671,1554856131,0,909616047),(28611,1554856131,1,909912112),(23272,1554856132,0,908627605),(28672,1554856132,0,910134673),(28674,1554856134,3392020480,913924477),(28615,1554856135,2,917816015),(28616,1554856136,119,915827006),(28677,1554856137,6553116672,918928284),(28678,1554856138,1,917871198),(28618,1554856138,66,919349460),(28622,1554856142,215,924219206),(23287,1554856147,1,928631880),(23291,1554856151,3,943404027),(23292,1554856152,144,936210480),(23294,1554856154,148,948216498),(28634,1554856154,1554856154,948923518),(28635,1554856155,2053607424,949941840),(23298,1554856158,226,951841536),(28640,1554856160,3,958836952),(23662,1554856162,0,955091242),(28642,1554856162,634707968,957239722),(23308,1554856168,1554856168,962257297),(23309,1554856169,859557888,963133349),(28651,1554856171,7968,964869219),(28652,1554856172,34040,966121445),(23314,1554856174,2,976619844),(28655,1554856175,5053521920,971860109),(23316,1554856176,396775424,971954743),(28656,1554856176,893579264,973799431),(28661,1554856181,1588158464,982276725),(28662,1554856182,169676800,982779635),(28663,1554856183,16,983673606),(28664,1554856184,2528,984453295),(28665,1554856185,24,996642303),(28666,1554856186,0,987881811),(28667,1554856187,0,988275498),(28668,1554856188,40,988964732),(28249,1554856189,0,988856155),(28669,1554856189,2024,990128497),(28670,1554856191,40,3679309),(28611,1554856191,1,5465781),(28671,1554856191,0,5753445),(23272,1554856192,0,6310605),(28672,1554856192,0,8127180),(28674,1554856194,3392020480,13972236),(28615,1554856195,2,23825392),(28616,1554856196,119,23821419),(28677,1554856197,6553116672,27648274),(28678,1554856198,1,26915216),(28618,1554856198,66,29218755),(28622,1554856202,214,35540047),(23287,1554856207,1,1193185),(23291,1554856211,4,16231118),(23292,1554856212,144,15131733),(23294,1554856214,167,18225376),(28634,1554856214,1554856214,18901653),(28635,1554856215,2053607424,21137718),(23298,1554856218,244,22893913),(28640,1554856220,3,31554672),(23662,1554856222,0,29147239),(28642,1554856222,634707968,29751278),(23308,1554856228,1554856228,34133640),(23309,1554856229,859557888,35276964),(28651,1554856231,6480,36895835),(28652,1554856232,48128,37988120),(23314,1554856234,2,48710678),(28655,1554856235,5053521920,44826054),(23316,1554856236,396402688,44342393),(28656,1554856236,893579264,46401214),(28661,1554856241,1588158464,54769393),(28662,1554856242,169676800,55257383),(28663,1554856243,16,55181594),(28664,1554856244,2408,57903618),(28665,1554856245,24,58977025),(28666,1554856246,0,59919757),(28667,1554856247,0,60809515),(28668,1554856248,48,61777984),(28249,1554856249,0,61636328),(28669,1554856249,1952,63250788),(28670,1554856250,48,63718567),(28671,1554856251,0,65036999),(28611,1554856251,1,65675738),(23272,1554856252,0,64437255),(28672,1554856252,0,66399236),(28674,1554856254,3392020480,70579734),(28615,1554856255,3,74482207),(28616,1554856256,119,73341868),(28677,1554856257,6553116672,75592358),(28678,1554856258,1,75500964),(28618,1554856258,65,77458513),(28622,1554856262,214,81652688),(23287,1554856267,1,85820764),(23291,1554856271,7,99025579),(23292,1554856272,143,102663577),(23294,1554856274,115,102022517),(28634,1554856274,1554856274,103459729),(28635,1554856275,2053607424,105337086),(23298,1554856278,207,107249866),(28640,1554856280,3,114433996),(23662,1554856282,0,110639931),(28642,1554856282,634703872,112600235),(23308,1554856288,1554856288,115486104),(23309,1554856289,859557888,116845301),(28651,1554856291,2864,118872826),(28652,1554856292,3048,119866823),(23314,1554856294,2,130914221),(28655,1554856295,5053521920,123982775),(23316,1554856296,397189120,123435195),(28656,1554856296,893579264,125386652),(28661,1554856301,1588158464,132062041),(28662,1554856302,169676800,134563227),(28663,1554856303,16,134938067),(28664,1554856304,2352,136458623),(28665,1554856305,24,137747996),(28666,1554856306,0,138365996),(28667,1554856307,0,139479209),(28668,1554856308,40,140775416),(28249,1554856309,0,140103228),(28669,1554856309,1936,141503265),(28670,1554856310,40,142971553),(28671,1554856311,0,144536445),(28611,1554856311,1,145003045),(23272,1554856312,0,143481276),(28672,1554856312,0,145402792),(28674,1554856314,3392020480,148611566),(28615,1554856315,3,152682098),(28616,1554856316,119,150645906),(28677,1554856317,6553116672,153637891),(28678,1554856318,1,153622768),(28618,1554856318,65,154511712),(28622,1554856322,213,160007414),(23287,1554856327,1,163158295),(23291,1554856331,6,177562401),(23292,1554856332,143,169550174),(23294,1554856334,103,173340323),(28634,1554856334,1554856334,174911239),(28635,1554856335,2053607424,176935064),(23298,1554856338,200,180830686),(28640,1554856340,3,187981753),(23662,1554856342,0,184464898),(28642,1554856342,634703872,186051942),(23308,1554856348,1554856348,190321806),(23309,1554856349,859557888,191073279),(28651,1554856351,2856,192907980),(28652,1554856352,3040,194834040),(23314,1554856354,2,204987142),(28655,1554856355,5053521920,198759921),(23316,1554856356,397189120,199520380),(28656,1554856356,893579264,201696385),(28661,1554856361,1588158464,204892124),(28662,1554856362,169676800,207449162),(28663,1554856363,16,207684809),(28664,1554856364,2312,208792592),(28665,1554856365,24,210575850),(28666,1554856366,0,211247214),(28667,1554856367,0,211970325),(28668,1554856368,40,213557665),(28249,1554856369,0,213097143),(28669,1554856369,1912,214506915),(28670,1554856370,40,215729478),(28671,1554856371,0,217668629),(28611,1554856371,1,218185714),(23272,1554856372,0,217270297),(28672,1554856372,0,218698200),(28674,1554856374,3392020480,222210537),(28615,1554856375,3,226026654),(28616,1554856376,119,224758813),(28677,1554856377,6553116672,227572667),(28618,1554856378,65,226587720),(28678,1554856378,1,227554808),(28622,1554856382,214,232919025),(23287,1554856387,1,236192957),(23291,1554856391,7,249458440),(23292,1554856392,143,252690019),(23294,1554856394,102,251988439),(28634,1554856394,1554856394,253576274),(28635,1554856395,2053607424,256404266),(23298,1554856398,198,258200053),(28640,1554856400,3,265430273),(23662,1554856402,0,260935752),(28642,1554856402,634703872,263060518),(23308,1554856408,1554856408,266621246),(23309,1554856409,859557888,267758035),(28651,1554856411,2856,269258660),(28652,1554856412,3040,270460998),(23314,1554856414,2,280699734),(28655,1554856415,5053521920,274638316),(28656,1554856416,893579264,275802855),(23316,1554856416,397160448,276210657),(28661,1554856421,1588158464,282526301),(28662,1554856422,169676800,283432121),(28663,1554856423,16,283898120),(28664,1554856424,2376,286206207),(28665,1554856425,24,287477948),(28666,1554856426,0,288507622),(28667,1554856427,0,289915188),(28668,1554856428,40,290376684),(28249,1554856429,0,289988238),(28669,1554856429,1968,291486462),(28670,1554856430,40,292732917),(28611,1554856431,1,293630029),(28671,1554856431,0,293974141),(23272,1554856432,0,292494035),(28672,1554856432,0,294406301),(28674,1554856434,3392020480,297704879),(28615,1554856435,3,302487395),(28616,1554856436,119,300373909),(28677,1554856437,6553116672,301737422),(28678,1554856438,1,300434851),(28618,1554856438,66,302823312),(28622,1554856442,216,306828632),(23287,1554856447,1,309885822),(23291,1554856451,6,324635675),(23292,1554856452,144,315802700),(28634,1554856454,1554856454,320727910),(23294,1554856454,103,321410471),(28635,1554856455,2053607424,323499189),(23298,1554856458,202,327933110),(28640,1554856460,3,334746717),(23662,1554856462,0,330996390),(28642,1554856462,634703872,332888294),(23308,1554856468,1554856468,336484384),(23309,1554856469,859557888,337107525),(28651,1554856471,3736,338853355),(28652,1554856472,9472,339998015),(23314,1554856474,2,351171914),(28655,1554856475,5053521920,345271985),(23316,1554856476,396058624,347268651),(28656,1554856476,893579264,348592845),(28661,1554856481,1588158464,353162483),(28662,1554856482,169676800,355793394),(28663,1554856483,16,356614378),(28664,1554856484,2312,357242523),(28665,1554856485,24,357779386),(28666,1554856486,0,358969160),(28667,1554856487,0,359277347),(28668,1554856488,40,360607955),(28249,1554856489,0,359857681),(28669,1554856489,1912,361416136),(28670,1554856490,40,362470780),(28611,1554856491,1,363424857),(28671,1554856491,0,364100613),(23272,1554856492,0,363431028),(28672,1554856492,0,365360894),(28674,1554856494,3392020480,368511916),(28615,1554856495,2,372341320),(28616,1554856496,119,370762164),(28677,1554856497,6553116672,373392361),(28618,1554856498,66,372814306),(28678,1554856498,1,373161808),(28622,1554856502,215,378714860),(23287,1554856507,1,381512726),(23291,1554856511,6,395416189),(23292,1554856512,144,389971071),(23294,1554856514,171,391422952),(28634,1554856514,1554856514,392967532),(28635,1554856515,2053607424,396420521),(23298,1554856518,240,403840744),(28640,1554856520,3,410646382),(23662,1554856522,0,406781410),(28642,1554856522,634703872,408366200),(23308,1554856528,1554856528,412076127),(23309,1554856529,859557888,412266674),(28651,1554856531,7368,415861215),(28652,1554856532,69960,417232144),(23314,1554856534,2,428227907),(28655,1554856535,5053521920,421802207),(28656,1554856536,893579264,424620745),(23316,1554856536,394436608,424987163),(28661,1554856541,1588158464,430452791),(28662,1554856542,169676800,431201077),(28663,1554856543,16,433761569),(28664,1554856544,2360,434545560),(28665,1554856545,24,434980104),(28666,1554856546,0,436470136),(28667,1554856547,0,437066213),(28668,1554856548,40,437864775),(28249,1554856549,0,437698161),(28669,1554856549,1912,439151520),(28670,1554856550,40,439856038),(28611,1554856551,1,441184392),(28671,1554856551,0,441841898),(23272,1554856552,0,441026256),(28672,1554856552,0,442574123),(28674,1554856554,3392020480,445700844),(28615,1554856555,2,449672588),(28616,1554856556,119,448747239),(28677,1554856557,6553116672,450606948),(28618,1554856558,65,451121250),(28678,1554856558,1,451471149),(28622,1554856562,213,457112131),(23287,1554856567,1,460266716),(23291,1554856571,6,474851385),(23292,1554856572,144,465946053),(28634,1554856574,1554856574,470717786),(23294,1554856574,124,471424629),(28635,1554856575,2053607424,473751653),(23298,1554856578,208,477558210),(28640,1554856580,3,484771872),(23662,1554856582,0,481075072),(28642,1554856582,634703872,482785004),(23308,1554856588,1554856588,486425512),(23309,1554856589,859557888,487584725),(28651,1554856591,4416,490016346),(28652,1554856592,12672,490925888),(23314,1554856594,2,501524888),(28655,1554856595,5053521920,495631394),(28656,1554856596,893579264,496353445),(23316,1554856596,395456512,497059587),(28661,1554856601,1588158464,502365981),(28662,1554856602,169676800,502905087),(28663,1554856603,16,504528820),(28664,1554856604,2368,505847439),(28665,1554856605,24,506914806),(28666,1554856606,0,508251333),(28667,1554856607,0,509504458),(28668,1554856608,40,510276587),(28249,1554856609,0,509768607),(28669,1554856609,1960,511073418),(28670,1554856610,40,512428458),(28611,1554856611,1,512774685),(28671,1554856611,0,513525019),(23272,1554856612,0,512537011),(28672,1554856612,0,514202997),(28674,1554856614,3392020480,517589783),(28615,1554856615,3,520951749),(28616,1554856616,119,519486628),(28617,1554856617,1554847105,520619834),(28677,1554856617,6553116672,522198403),(28678,1554856618,1,521867809),(28618,1554856618,67,522770010),(28622,1554856622,215,528357735),(23287,1554856627,1,532283597),(23291,1554856631,7,547508095),(23292,1554856632,144,550696524),(23294,1554856634,121,549758376),(28634,1554856634,1554856634,551458123),(28635,1554856635,2053607424,553914465),(23298,1554856638,209,557249250),(28639,1554856639,9535,558887392),(28640,1554856640,3,564310587),(23662,1554856642,0,561847106),(28642,1554856642,634703872,563861893),(23308,1554856648,1554856648,567898032),(23309,1554856649,859557888,568958712),(28651,1554856651,3568,570673435),(28652,1554856652,14408,571874730),(23314,1554856654,2,581927921),(28655,1554856655,5053521920,577694701),(23316,1554856656,394190848,577486760),(28656,1554856656,893579264,579299999),(28661,1554856661,1588158464,585385123),(28662,1554856662,169676800,586092277),(28663,1554856663,16,586671438),(28664,1554856664,2408,587642940),(28665,1554856665,24,588220303),(28666,1554856666,0,589497048),(28667,1554856667,0,590619926),(28668,1554856668,40,591913207),(28249,1554856669,0,591681053),(28669,1554856669,2008,593077133),(28670,1554856670,40,593877265),(23271,1554856671,0,592939193),(28611,1554856671,1,594534842),(28671,1554856671,0,594806342),(23272,1554856672,0,593608060),(28672,1554856672,0,595639297),(28674,1554856674,3392020480,598587475),(28615,1554856675,3,602554528),(28616,1554856676,119,600478091),(28677,1554856677,6553116672,603961981),(28618,1554856678,64,603263306),(28678,1554856678,1,603653505),(28622,1554856682,213,608758045),(23287,1554856687,1,611973900),(23291,1554856691,7,626997782),(23292,1554856692,144,629194437),(23293,1554856693,1554807130,627047389),(23294,1554856694,99,628424946),(28634,1554856694,1554856694,630011069),(28635,1554856695,2053607424,632087719),(23298,1554856698,199,633905624),(28640,1554856700,3,642365076),(23662,1554856702,0,637332491),(28642,1554856702,634703872,639022827),(23308,1554856708,1554856708,642652421),(23309,1554856709,859557888,643410843),(28651,1554856711,3496,644618246),(28652,1554856712,7448,645401870),(23313,1554856713,49583,647608431),(23314,1554856714,2,657143907),(28655,1554856715,5053521920,653552501),(23316,1554856716,388726784,653711066),(28656,1554856716,893579264,655110165),(28661,1554856721,1588158464,659003842),(28662,1554856722,169676800,661825525),(28663,1554856723,16,661935496),(28664,1554856724,2448,662878567),(28665,1554856725,24,664020848),(28666,1554856726,0,664596785),(28667,1554856727,0,665121890),(28668,1554856728,40,666840000),(28249,1554856729,0,670940711),(28669,1554856729,1968,672569768),(28670,1554856730,40,673632972),(28671,1554856731,0,674751992),(28611,1554856731,1,675233271),(23272,1554856732,0,673890841),(28672,1554856732,0,675826742),(28674,1554856734,3392020480,679181666),(28615,1554856735,2,682908647),(28616,1554856736,119,683425003),(28677,1554856737,6553116672,684146336),(28678,1554856738,1,685911017),(28618,1554856738,66,687080963),(28622,1554856742,229,691535559),(23287,1554856747,1,695072988),(23291,1554856751,5,709840044),(23292,1554856752,145,702810970),(23294,1554856754,143,703645349),(28634,1554856754,1554856754,705208039),(28635,1554856755,2053607424,706609694),(23298,1554856758,231,710587798),(28640,1554856760,3,717955370),(23662,1554856762,0,714594402),(28642,1554856762,632307712,715996227),(23308,1554856768,1554856768,719317045),(23309,1554856769,859557888,719709704),(28651,1554856771,5040,722469627),(28652,1554856772,38584,723849395),(23314,1554856774,2,733345824),(28655,1554856775,5053480960,727722847),(28656,1554856776,893579264,729942166),(23316,1554856776,388804608,730820290),(28661,1554856781,1588199424,735090905),(28662,1554856782,169676800,737422766),(28663,1554856783,16,738559101),(28664,1554856784,2336,738967577),(28665,1554856785,24,739646348),(28666,1554856786,0,740598719),(28667,1554856787,0,740876837),(28668,1554856788,40,742235601),(28249,1554856789,0,741681742),(28669,1554856789,1912,743112416),(28670,1554856790,40,744108175),(28671,1554856791,0,745408512),(28611,1554856791,1,745814728),(23272,1554856792,0,744820048),(28672,1554856792,0,746675962),(28674,1554856794,3392020480,749502031),(28615,1554856795,3,753961064),(28616,1554856796,119,752160049),(28677,1554856797,6553116672,753688411),(28678,1554856798,1,752549604),(28618,1554856798,67,754782322),(28622,1554856802,214,758595402),(23287,1554856807,1,762518235),(23291,1554856811,6,778168090),(23292,1554856812,143,770206142),(28634,1554856814,1554856814,774495594),(23294,1554856814,103,775283177),(28635,1554856815,2053607424,778413518),(23298,1554856818,199,781279439),(28640,1554856820,3,789007878),(23662,1554856822,0,786276917),(28642,1554856822,632315904,787578869),(23308,1554856828,1554856828,791863917),(23309,1554856829,859557888,792568348),(28651,1554856831,2888,794698445),(28652,1554856832,3040,796198683),(23314,1554856834,2,806811581),(28655,1554856835,5053521920,800854615),(23316,1554856836,388845568,800310727),(28656,1554856836,893579264,802417403),(28661,1554856841,1588158464,807377606),(28662,1554856842,169676800,808122461),(28663,1554856843,16,810134963),(28664,1554856844,2320,810536794),(28665,1554856845,24,811516044),(28666,1554856846,0,812415712),(28667,1554856847,0,813568951),(28668,1554856848,40,814568813),(28249,1554856849,0,814505793),(28669,1554856849,1912,815769112),(28670,1554856850,40,816809264),(28611,1554856851,1,817256364),(28671,1554856851,0,817731784),(23272,1554856852,0,817025975),(28672,1554856852,0,818480298),(28674,1554856854,3392020480,821558030),(28615,1554856855,3,824981613),(28616,1554856856,119,824174456),(28677,1554856857,6553116672,825954436),(28618,1554856858,66,825367290),(28678,1554856858,1,825992723),(28622,1554856862,216,831029281),(23287,1554856867,1,833065878),(23291,1554856871,7,847567920),(23292,1554856872,143,850740775),(23294,1554856874,98,852754482),(28634,1554856874,1554856874,853745395),(28635,1554856875,2053607424,855068215),(23298,1554856878,196,856597248),(28640,1554856880,3,863450129),(23662,1554856882,0,860297618),(28642,1554856882,632315904,861398754),(23308,1554856888,1554856888,864451293),(23309,1554856889,859557888,865645026),(28651,1554856891,2896,867808882),(28652,1554856892,3040,869144464),(23314,1554856894,2,879943031),(28655,1554856895,5053521920,873748920),(28656,1554856896,893579264,874738606),(23316,1554856896,388866048,875386180),(28661,1554856901,1588158464,881467516),(28662,1554856902,169676800,882413633),(28663,1554856903,16,884351276),(28664,1554856904,2352,884083118),(28665,1554856905,24,885582847),(28666,1554856906,0,886793296),(28667,1554856907,0,887861685),(28668,1554856908,40,889029152),(28249,1554856909,0,888778119),(28669,1554856909,1936,890033891),(28670,1554856910,40,891025026),(28611,1554856911,1,891652663),(28671,1554856911,0,892062724),(23272,1554856912,0,891588156),(28672,1554856912,0,893435310),(28674,1554856914,3392020480,896725081),(28615,1554856915,3,899397242),(28616,1554856916,119,899670853),(28677,1554856917,6553116672,900835136),(28678,1554856918,1,899546538),(28618,1554856918,66,900798669),(28622,1554856922,213,915967149),(23287,1554856927,1,917688193),(23291,1554856931,6,933770213),(23292,1554856932,144,925311561),(23294,1554856934,123,929525240),(28634,1554856934,1554856934,931172971),(28635,1554856935,2053607424,934061055),(23298,1554856938,217,937874755),(28640,1554856940,3,944765885),(23662,1554856942,0,941555147),(28642,1554856942,632315904,943666257),(23308,1554856948,1554856948,948104448),(23309,1554856949,859557888,948851072),(28651,1554856951,5224,950725014),(28652,1554856952,36192,951827675),(23314,1554856954,2,963320153),(28655,1554856955,5053521920,955955301),(23316,1554856956,385953792,956763045),(28656,1554856956,893579264,958842080),(28661,1554856961,1588158464,966168387),(28662,1554856962,169676800,966882832),(28663,1554856963,16,967753173),(28664,1554856964,2320,968366821),(28665,1554856965,24,969470656),(28666,1554856966,0,970537446),(28667,1554856967,0,971526558),(28668,1554856968,40,972642158),(28249,1554856969,0,971867767),(28669,1554856969,1912,973364709),(28670,1554856970,40,974242935),(28671,1554856971,0,975609910),(28611,1554856971,1,976071534),(23272,1554856972,0,986022012),(28672,1554856972,0,988083135),(28674,1554856975,3392020480,753639),(28616,1554856976,120,5004854),(28615,1554856976,3,7412343),(28677,1554856977,6553116672,16558979),(28678,1554856978,1,16023847),(28618,1554856978,66,16580644),(28622,1554856982,215,10978072),(23287,1554856987,1,17295688),(23291,1554856991,6,34504588),(23292,1554856992,144,37148279),(28634,1554856994,1554856994,36930386),(23294,1554856994,152,37688266),(28635,1554856995,2053607424,40564463),(23298,1554856998,225,42945788),(28640,1554857000,3,50392946),(23662,1554857002,0,46250551),(28642,1554857002,632188928,47825663),(23308,1554857008,1554857008,52788886),(23309,1554857009,859557888,53228816),(28651,1554857011,6168,54503113),(28652,1554857012,55592,55440468),(23314,1554857014,2,67426628),(28655,1554857015,5053521920,60482071),(23316,1554857016,386908160,62150603),(28656,1554857016,893579264,63934132),(28661,1554857021,1588158464,69053819),(28662,1554857022,169676800,69600411),(28663,1554857023,16,70483673),(28664,1554857024,2912,71918388),(28665,1554857025,24,73174712),(28666,1554857026,0,73883414),(28667,1554857027,0,74659299),(28668,1554857028,48,75786200),(28249,1554857029,0,75718451),(28669,1554857029,2576,77081445),(28670,1554857030,48,77673979),(28611,1554857031,1,79168812),(28671,1554857031,0,79680932),(23272,1554857032,0,78529019),(28672,1554857032,0,80002465),(28674,1554857034,3392020480,83328381),(28615,1554857035,3,87537996),(28616,1554857036,119,87063745),(28677,1554857037,6553116672,87784137),(28678,1554857038,1,86770500),(28618,1554857038,68,89129091),(28622,1554857042,221,93472570),(23287,1554857047,1,97254011),(23291,1554857051,5,109113667),(23292,1554857052,144,104345827),(28634,1554857054,1554857054,107214227),(23294,1554857054,105,107632674),(28635,1554857055,2053607424,110423106),(23298,1554857058,200,113325495),(28640,1554857060,3,120078395),(23662,1554857062,0,116268980),(28642,1554857062,632287232,117984040),(23308,1554857068,1554857068,122156340),(23309,1554857069,859557888,122883861),(28651,1554857071,2904,124046007),(28652,1554857072,3040,125709001),(23314,1554857074,2,138871443),(28655,1554857075,5053521920,129878177),(23316,1554857076,386686976,128951499),(28656,1554857076,893579264,131990255),(28661,1554857081,1588158464,138271301),(28662,1554857082,169676800,141124115),(28663,1554857083,16,141963221),(28664,1554857084,2520,142593113),(28665,1554857085,24,143576535),(28666,1554857086,0,144507318),(28667,1554857087,0,144999048),(28668,1554857088,40,145577585),(28249,1554857089,0,145225474),(28669,1554857089,2208,146671398),(28670,1554857090,40,147626413),(28611,1554857091,1,148539824),(28671,1554857091,0,148802854),(23272,1554857092,0,148196360),(28672,1554857092,0,149539961),(28674,1554857094,3392012288,153262146),(28615,1554857095,3,157547466),(28616,1554857096,121,155919875),(28677,1554857097,6553124864,156866091),(28618,1554857098,70,157313569),(28678,1554857098,1,157778240),(28622,1554857102,237,163316060),(23287,1554857107,1,167392082),(23291,1554857111,6,181052999),(23292,1554857112,144,175325151),(28634,1554857114,1554857114,178713821),(23294,1554857114,105,179424729),(28635,1554857115,2053607424,182126470),(23298,1554857118,200,185294007),(28640,1554857120,3,193217616),(23662,1554857122,0,189278654),(28642,1554857122,632360960,191029129),(23308,1554857128,1554857128,193826238),(23309,1554857129,859557888,194590947),(28651,1554857131,2864,196618058),(28652,1554857132,3024,197413942),(23314,1554857134,2,207965659),(28655,1554857135,5053521920,201825023),(23316,1554857136,386691072,203436576),(28656,1554857136,893579264,205117699),(28661,1554857141,1588158464,209165063),(28662,1554857142,169676800,212116982),(28663,1554857143,16,212908422),(28664,1554857144,3168,214360379),(28665,1554857145,24,214938536),(28666,1554857146,0,215477476),(28667,1554857147,0,216150842),(28668,1554857148,40,217193829),(28249,1554857149,0,216657279),(28669,1554857149,9552,217951980),(28670,1554857150,40,218920178),(28671,1554857151,0,220308301),(28611,1554857151,1,220775478),(23272,1554857152,0,219216967),(28672,1554857152,0,220659000),(28674,1554857154,3392012288,223597996),(28615,1554857155,3,228482083),(28616,1554857156,120,227392178),(28677,1554857157,6553124864,228048223),(28618,1554857158,67,227720154),(28678,1554857158,1,229254992),(28622,1554857162,215,234422698),(23287,1554857167,1,238052737),(23291,1554857171,5,252662365),(23292,1554857172,144,245011471),(23294,1554857174,101,246748736),(28634,1554857174,1554857174,248239304),(28635,1554857175,2053607424,250019054),(23298,1554857178,197,253901518),(28640,1554857180,3,260733850),(23662,1554857182,0,257968212),(28642,1554857182,632221696,259817029),(23308,1554857188,1554857188,263208053),(23309,1554857189,859557888,263763141),(28651,1554857191,2888,266036626),(28652,1554857192,3040,267380441),(23314,1554857194,2,278025652),(28655,1554857195,5053521920,273639483),(23316,1554857196,386711552,273393579),(28656,1554857196,893579264,274873681),(28661,1554857201,1588158464,280156525),(28662,1554857202,169676800,281037953),(28663,1554857203,16,281659613),(28664,1554857204,3632,281961272),(28665,1554857205,24,284083947),(28666,1554857206,0,285514090),(28667,1554857207,0,286785312),(28668,1554857208,40,287808413),(28249,1554857209,0,287399178),(28669,1554857209,3200,288726213),(28670,1554857210,40,290000333),(28611,1554857211,1,291260509),(28671,1554857211,0,291760845),(23272,1554857212,0,291065991),(28672,1554857212,0,292562757),(28674,1554857214,3392012288,298825170),(28615,1554857215,3,302765452),(28616,1554857216,120,301689528),(28617,1554857217,1554847105,301433317),(28677,1554857217,6553124864,302968190),(28678,1554857218,1,303093825),(28618,1554857218,72,304365772),(28622,1554857222,225,309097448),(23287,1554857227,1,320153872),(23291,1554857231,5,336622835),(23292,1554857232,143,327405628),(23294,1554857234,114,330768104),(28634,1554857234,1554857234,332381548),(28635,1554857235,2053607424,334378884),(23298,1554857238,205,339921186),(28639,1554857239,10134,342358273),(28640,1554857240,3,347342454),(23662,1554857242,0,343453570),(28642,1554857242,634404864,345148194),(23308,1554857248,1554857248,349342362),(23309,1554857249,859557888,350774822),(28679,1554857249,31576064,356241616),(28651,1554857251,3824,352591541),(28652,1554857252,18576,353535750),(23314,1554857254,2,364884460),(28655,1554857255,5053521920,358352170),(23316,1554857256,386752512,359463670),(28656,1554857256,893579264,361488291),(28661,1554857261,1588158464,367872904),(28662,1554857262,169676800,368399056),(28663,1554857263,16,371222911),(28664,1554857264,2512,372494570),(28665,1554857265,24,373361867),(28666,1554857266,0,378366054),(28667,1554857267,0,376161296),(28668,1554857268,40,376631550),(28249,1554857269,0,376696650),(28669,1554857269,2088,378069209),(28670,1554857270,40,378635646),(23271,1554857271,0,378904735),(28611,1554857271,1,379683688),(28671,1554857271,0,380094675),(23272,1554857272,0,379786528),(28672,1554857272,0,381191359),(28674,1554857274,3392012288,384710833),(28615,1554857275,3,388823080),(28616,1554857276,120,387778571),(28677,1554857277,6553124864,389536105),(28678,1554857278,1,387667164),(28618,1554857278,65,389853556),(28679,1554857279,31576064,396672559),(28622,1554857282,212,394356219),(23287,1554857287,1,404562084),(23291,1554857291,6,419677211),(23292,1554857292,143,411241626),(23293,1554857293,1554807130,413861931),(28634,1554857294,1554857294,426205169),(23294,1554857294,157,426402602),(28635,1554857295,2053607424,427917534),(23298,1554857298,237,431427383),(28640,1554857300,3,440219407),(23662,1554857302,0,435141427),(28642,1554857302,634277888,436189994),(23308,1554857308,1554857308,440953649),(23309,1554857309,859557888,442012387),(28679,1554857309,31576064,447844638),(28651,1554857311,9120,445048142),(28652,1554857312,81336,445790675),(23313,1554857313,50183,447463806),(23314,1554857314,2,457548996),(28655,1554857315,5053521920,452961739),(23316,1554857316,385830912,454617524),(28656,1554857316,893579264,456557801),(28661,1554857321,1588158464,462632697),(28662,1554857322,169676800,463824190),(28663,1554857323,16,465576302),(28664,1554857324,2464,466409945),(28665,1554857325,24,467311506),(28666,1554857326,0,468369327),(28667,1554857327,0,469432591),(28668,1554857328,40,470789306),(28249,1554857329,0,470586564),(28669,1554857329,2016,471979768),(28670,1554857330,40,472918758),(28671,1554857331,0,474741422),(28611,1554857331,1,475011599),(23272,1554857332,0,474100656),(28672,1554857332,0,475508619),(28674,1554857334,3392012288,479252981),(28615,1554857335,3,482999876),(28616,1554857336,120,481239003),(28677,1554857337,6553124864,483563096),(28678,1554857338,1,482579728),(28618,1554857338,67,483503195),(28679,1554857339,31576064,490913343),(28622,1554857342,216,488973455),(23287,1554857347,1,492795106),(23291,1554857351,8,505913468),(23292,1554857352,143,509939946),(23294,1554857354,135,509713558),(28634,1554857354,1554857354,510799278),(28635,1554857355,2053607424,512479545),(23298,1554857358,217,514815661),(28640,1554857360,3,522000156),(23662,1554857362,0,518032381),(28642,1554857362,634413056,520021030),(23308,1554857368,1554857368,524207119),(23309,1554857369,859557888,525870925),(28679,1554857369,31576064,531526214),(28651,1554857371,3360,527058575),(28652,1554857372,3528,527997980),(23314,1554857374,2,538740949),(28655,1554857375,5053521920,532587049),(23316,1554857376,387330048,533509105),(28656,1554857376,893579264,535513186),(28661,1554857381,1588158464,543250319),(28662,1554857382,169676800,544462405),(28663,1554857383,16,545001895),(28664,1554857384,2424,546720075),(28665,1554857385,24,547552787),(28666,1554857386,0,548562499),(28667,1554857387,0,549205557),(28668,1554857388,40,550117407),(28249,1554857389,0,549772677),(28669,1554857389,2008,551070429),(28670,1554857390,40,551763936),(28611,1554857391,1,552406322),(28671,1554857391,0,552852679),(23272,1554857392,0,552168058),(28672,1554857392,0,553585435),(28674,1554857394,3392012288,557103933),(28615,1554857395,3,566507947),(28616,1554857396,119,564993572),(28677,1554857397,6553124864,565875526),(28678,1554857398,1,564180217),(28618,1554857398,66,566243901),(28679,1554857399,31576064,573565317),(28622,1554857402,215,571734040),(23287,1554857407,1,576754215),(23291,1554857411,7,591337402),(23292,1554857412,144,594536014),(23294,1554857414,131,596300227),(28634,1554857414,1554857414,596956326),(28635,1554857415,2053607424,598092652),(23298,1554857418,219,601769284),(28640,1554857420,3,607801665),(23662,1554857422,0,604431697),(28642,1554857422,634286080,606196654),(23308,1554857428,1554857428,610929254),(23309,1554857429,859557888,611921570),(28679,1554857429,31576064,617682516),(28651,1554857431,4712,613992609),(28652,1554857432,30736,614524235),(23314,1554857434,2,624963333),(28655,1554857435,5053521920,618979318),(28656,1554857436,893579264,621917681),(23316,1554857436,387182592,622413952),(28661,1554857441,1588158464,629534599),(28662,1554857442,169676800,629885054),(28663,1554857443,16,630586944),(28664,1554857444,2528,632064520),(28665,1554857445,24,632997698),(28666,1554857446,0,633392693),(28667,1554857447,0,634384515),(28668,1554857448,40,635474193),(28249,1554857449,0,634067631),(28669,1554857449,2056,635844415),(28670,1554857450,40,636321880),(28611,1554857451,1,637002583),(28671,1554857451,0,637235542),(23272,1554857452,0,637290618),(28672,1554857452,0,638793785),(28674,1554857454,3392012288,642886531),(28615,1554857455,2,646670629),(28616,1554857456,119,646273245),(28677,1554857457,6553124864,646935845),(28618,1554857458,66,645997442),(28678,1554857458,1,647575775),(28679,1554857459,31576064,654840763),(28622,1554857462,215,653164967),(23287,1554857467,1,656812808),(23291,1554857471,8,672690568),(23292,1554857472,144,675627365),(23294,1554857474,104,673976813),(28634,1554857474,1554857474,675561542),(28635,1554857475,2053607424,678484347),(23298,1554857478,199,680920962),(28640,1554857480,3,687448220),(23662,1554857482,0,683275218),(28642,1554857482,634413056,685437932),(23308,1554857488,1554857488,687858434),(23309,1554857489,859557888,688954481),(28679,1554857489,31576064,694623114),(28651,1554857491,3024,691108358),(28652,1554857492,3160,692305243),(23314,1554857494,2,703571577),(28655,1554857495,5053521920,697669415),(23316,1554857496,386387968,699023965),(28656,1554857496,893579264,700676591),(28661,1554857501,1588158464,705651090),(28662,1554857502,169676800,706662215),(28663,1554857503,16,706772345),(28664,1554857504,2448,709140989),(28665,1554857505,24,710390084),(28666,1554857506,0,711562411),(28667,1554857507,0,712780786),(28668,1554857508,40,713804967),(28249,1554857509,0,712910181),(28669,1554857509,2008,714182862),(28670,1554857510,40,714855799),(28611,1554857511,1,715448810),(28671,1554857511,0,715939488),(23272,1554857512,0,715377861),(28672,1554857512,0,717262439),(28674,1554857514,3392012288,720340886),(28615,1554857515,2,724106648),(28616,1554857516,119,722520851),(28677,1554857517,6553124864,725174565),(28678,1554857518,1,723387647),(28618,1554857518,65,724875643),(28679,1554857519,31576064,731263468),(28622,1554857522,213,729810855),(23287,1554857527,1,734196825),(23291,1554857531,7,748954460),(23292,1554857532,144,751130510),(23294,1554857534,103,749518525),(28634,1554857534,1554857534,751101583),(28635,1554857535,2053607424,754081204),(23298,1554857538,199,756694096),(28640,1554857540,3,763234791),(23662,1554857542,0,759340791),(28642,1554857542,634286080,761424890),(23308,1554857548,1554857548,766243350),(23309,1554857549,859557888,767861229),(28679,1554857549,31576064,773669110),(28651,1554857551,3456,770487064),(28652,1554857552,6968,771034595),(23314,1554857554,2,782129856),(28655,1554857555,5053521920,776339131),(23316,1554857556,386617344,777199411),(28656,1554857556,893579264,779083644),(28661,1554857561,1588158464,785557290),(28662,1554857562,169676800,786515190),(28663,1554857563,24,787580641),(28664,1554857564,2440,788270886),(28665,1554857565,32,789952130),(28666,1554857566,0,790568267),(28667,1554857567,0,791688783),(28668,1554857568,40,793048807),(28249,1554857569,0,792586815),(28669,1554857569,2016,793855578),(28670,1554857570,40,794812146),(28671,1554857571,0,795844680),(28611,1554857571,1,796445327),(23272,1554857572,0,795930795),(28672,1554857572,0,797365205),(28674,1554857574,3392012288,800979470),(28615,1554857575,2,807967044),(28616,1554857576,119,804151676),(28677,1554857577,6553124864,805084483),(28678,1554857578,1,804613808),(28618,1554857578,66,806192145),(28679,1554857579,31576064,811943608),(28622,1554857582,216,812414078),(23287,1554857587,1,816654525),(23291,1554857591,5,834297290),(23292,1554857592,144,827392422),(28634,1554857594,1554857594,829737928),(23294,1554857594,151,830060880),(28635,1554857595,2053607424,834981461),(23298,1554857598,237,837357702),(28640,1554857600,3,843883778),(23662,1554857602,0,840391351),(28642,1554857602,634540032,841773094),(23308,1554857608,1554857608,851671134),(23309,1554857609,859557888,852308227),(28679,1554857609,31576064,861812104),(28651,1554857611,8880,857486639),(28652,1554857612,88864,857887862),(23314,1554857614,2,868726859),(28655,1554857615,5053063168,863844921),(23316,1554857616,386506752,864746141),(28656,1554857616,893579264,866680603),(28661,1554857621,1588617216,874021886),(28662,1554857622,169676800,874805796),(28663,1554857623,32,874940756),(28664,1554857624,2480,876572896),(28665,1554857625,48,877460603),(28666,1554857626,0,877996741),(28667,1554857627,0,878467121),(28668,1554857628,80,879061078),(28249,1554857629,0,878654226),(28669,1554857629,2056,880062501),(28670,1554857630,80,880883314),(28611,1554857631,1,881399733),(28671,1554857631,0,882020780),(23272,1554857632,0,881000375),(28672,1554857632,0,882831357),(28674,1554857634,3392012288,886052635),(28615,1554857635,3,890468880),(28616,1554857636,119,888529385),(28677,1554857637,6553124864,889858687),(28678,1554857638,1,889720619),(28618,1554857638,66,890817971),(28679,1554857639,31576064,898586691),(28622,1554857642,215,898402179),(23287,1554857647,1,902767064),(23291,1554857651,6,916788174),(23292,1554857652,144,908417861),(28634,1554857654,1554857654,912668679),(23294,1554857654,180,913357946),(28635,1554857655,2053607424,915631202),(23298,1554857658,243,922430148),(28640,1554857660,3,929608880),(23662,1554857662,0,925412797),(28642,1554857662,634540032,927239100),(23308,1554857668,1554857668,930359692),(23309,1554857669,859557888,932142753),(28679,1554857669,31576064,937441501),(28651,1554857671,6856,933705367),(28652,1554857672,67080,934877765),(23314,1554857674,2,945647391),(28655,1554857675,5053063168,939191736),(23316,1554857676,379617280,940470806),(28656,1554857676,893579264,942192471),(28661,1554857681,1588617216,948942077),(28662,1554857682,169676800,951431946),(28663,1554857683,48,952071706),(28664,1554857684,2536,952362287),(28665,1554857685,56,953773498),(28666,1554857686,0,954477125),(28667,1554857687,0,955119350),(28668,1554857688,112,955716492),(28249,1554857689,0,956122101),(28669,1554857689,2136,957103484),(28670,1554857690,112,957725266),(28671,1554857691,0,958960371),(28611,1554857691,1,959171428),(23272,1554857692,0,957971874),(28672,1554857692,0,959713374),(28674,1554857694,3392012288,963021689),(28615,1554857695,3,967634615),(28616,1554857696,119,965887716),(28677,1554857697,6553124864,967622342),(28618,1554857698,66,967438537),(28678,1554857698,1,968050778),(28679,1554857699,31576064,973722850),(28622,1554857702,215,975220126),(23287,1554857707,1,979297289),(23291,1554857711,6,999218684),(23292,1554857712,143,986817860),(23294,1554857714,136,999353019),(28634,1554857715,1554857714,3334401),(28635,1554857715,2053607424,3781583),(23298,1554857718,224,7142246),(28640,1554857720,3,6986469),(28642,1554857722,634540032,6493040),(23662,1554857722,0,6556467),(23308,1554857728,1554857728,13029737),(23309,1554857729,859557888,14008549),(28679,1554857729,31576064,19712966),(28651,1554857731,5264,16069300),(28652,1554857732,36520,16495905),(23314,1554857734,2,27278157),(28655,1554857735,5052588032,21146640),(23316,1554857736,377950208,20195787),(28656,1554857736,893579264,22251419),(28661,1554857741,1589092352,34879511),(28662,1554857742,169676800,35970414),(28663,1554857743,32,36674865),(28664,1554857744,2616,37720083),(28665,1554857745,40,38660430),(28666,1554857746,0,39373724),(28667,1554857747,0,40601915),(28668,1554857748,72,41153908),(28249,1554857749,0,41402922),(28669,1554857749,2112,42611652),(28670,1554857750,72,44025535),(28611,1554857751,1,44409194),(28671,1554857751,0,44952729),(23272,1554857752,0,43879221),(28672,1554857752,0,45771630),(28674,1554857754,3392012288,56123487),(28615,1554857755,2,59945604),(28616,1554857756,119,58838496),(28677,1554857757,6553124864,60715777),(28678,1554857758,1,59856978),(28618,1554857758,66,61381573),(28679,1554857759,31576064,69032394),(28622,1554857762,215,67641626),(23287,1554857767,1,70226702),(23291,1554857771,7,83513389),(23292,1554857772,143,87231138),(23294,1554857774,163,86365495),(28634,1554857774,1554857774,87563667),(28635,1554857775,2053607424,92858958),(23298,1554857778,243,94899422),(28640,1554857780,3,102230317),(23662,1554857782,0,106185341),(28642,1554857782,634540032,117617860),(23308,1554857788,1554857788,111309367),(23309,1554857789,859557888,112080728),(28679,1554857789,31576064,118062940),(28651,1554857791,8616,113840573),(28652,1554857792,82984,114891717),(23314,1554857794,2,126290351),(28655,1554857795,5052559360,121063749),(28656,1554857796,893579264,124259533),(23316,1554857796,380157952,124624513),(28661,1554857801,1589100544,130833203),(28662,1554857802,169676800,132081076),(28663,1554857803,16,132065386),(28664,1554857804,3360,133138959),(28665,1554857805,24,134168166),(28666,1554857806,0,154926409),(28667,1554857807,0,146396826),(28668,1554857808,40,147787112),(28249,1554857809,0,148133512),(28669,1554857809,2088,148880914),(28670,1554857810,40,150738010),(28671,1554857811,0,153262846),(28611,1554857811,1,153706418),(28672,1554857812,0,156484261),(23272,1554857812,0,156591507),(28613,1554857813,94140,159985449),(28614,1554857814,32768,161606261),(28674,1554857814,3392012288,163688341),(28615,1554857815,5,168201011),(28616,1554857816,119,168973095),(28617,1554857817,1554847105,171371906),(28677,1554857817,6553124864,172887210),(28678,1554857818,1,171697119),(28618,1554857818,69,172678762),(28679,1554857819,31576064,179550713),(28622,1554857822,217,176736144),(23287,1554857827,1,180385287),(23291,1554857831,6,200791298),(23292,1554857832,143,199550690),(23294,1554857834,145,200480706),(28634,1554857834,1554857834,201989512),(28635,1554857835,2053607424,203567605),(28637,1554857837,2056253440,206345557),(23298,1554857838,230,206110843),(28639,1554857839,10734,208777324),(28640,1554857840,3,213886697),(28641,1554857841,4286018622,211468876),(23662,1554857842,0,210814125),(28642,1554857842,634540032,211947362),(28643,1554857843,1033146368,213813130),(23308,1554857848,1554857848,216834856),(23309,1554857849,859557888,217872334),(28679,1554857849,31576064,223542843),(28651,1554857851,6896,220067503),(28652,1554857852,24664,220816022),(23314,1554857854,2,230968588),(28655,1554857855,5052579840,227402210),(23316,1554857856,380964864,227131038),(28656,1554857856,893579264,229392727),(28659,1554857859,6641680384,234065440),(28660,1554857860,1063256064,234507278),(28661,1554857861,1589100544,236965342),(28662,1554857862,169676800,238006872),(28663,1554857863,16,239691109),(28664,1554857864,3968,240342009),(28665,1554857865,24,241092747),(28666,1554857866,0,242006852),(28667,1554857867,0,242777041),(28668,1554857868,40,244275708),(28249,1554857869,0,242816658),(28669,1554857869,3208,244733329),(28670,1554857870,40,245719977),(23271,1554857871,0,245380455),(28671,1554857871,0,246656934),(28611,1554857871,1,247127587),(23272,1554857872,0,246632926),(28672,1554857872,0,248219044),(28674,1554857874,3392012288,251870916),(28615,1554857875,2,255611233),(28616,1554857876,120,255572068),(28676,1554857876,10498625536,256769618),(28677,1554857877,6553124864,257322818),(28678,1554857878,1,259353222),(28618,1554857878,67,259959581),(28679,1554857879,31576064,266375655),(28622,1554857882,216,265745352),(23287,1554857887,1,270361872),(23291,1554857891,3,285255339),(23292,1554857892,144,277674378),(23293,1554857893,1554807130,275760335),(23294,1554857894,108,276984497),(28634,1554857894,1554857894,278602621),(28635,1554857895,2053607424,281262481),(23298,1554857898,205,284031875),(28640,1554857900,3,290892427),(23662,1554857902,0,286709580),(28642,1554857902,634540032,289002730),(23308,1554857908,1554857908,294099742),(23309,1554857909,859557888,295591197),(28679,1554857909,31576064,301427652),(28651,1554857911,3312,297432028),(28652,1554857912,3288,298803207),(23313,1554857913,50783,299571825),(23314,1554857914,2,310072232),(28655,1554857915,5052583936,305891206),(23316,1554857916,380301312,306233833),(28656,1554857916,893579264,307700472),(28661,1554857921,1589096448,313457852),(28662,1554857922,169676800,314437319),(28663,1554857923,48,315307324),(28664,1554857924,2672,316249789),(28665,1554857925,64,317561779),(28666,1554857926,0,318103091),(28667,1554857927,0,319263372),(28668,1554857928,112,320165924),(28249,1554857929,0,319637686),(28669,1554857929,2152,320978567),(28670,1554857930,112,321911663),(28671,1554857931,0,323991085),(28611,1554857931,1,324512366),(23272,1554857932,0,323430911),(28672,1554857932,0,324973696),(28674,1554857934,3392012288,328196480),(28615,1554857935,4,332367530),(28616,1554857936,120,330969873),(28677,1554857937,6553124864,332740628),(28678,1554857938,1,330786017),(28618,1554857938,68,333602825),(28679,1554857939,31576064,340464559),(28622,1554857942,218,340071941),(23287,1554857947,1,343939054),(23291,1554857951,6,357620440),(23292,1554857952,144,352299692),(28634,1554857954,1554857954,355458510),(23294,1554857954,106,356059431),(28635,1554857955,2053607424,358926943),(23298,1554857958,201,363550700),(28640,1554857960,3,370732285),(23662,1554857962,0,367593754),(28642,1554857962,634294272,369369104),(23308,1554857968,1554857968,372257546),(23309,1554857969,859557888,373723971),(28679,1554857969,31576064,379165041),(28651,1554857971,3120,375361205),(28652,1554857972,3248,377237271),(23314,1554857974,2,388610017),(28655,1554857975,5052583936,382102561),(23316,1554857976,380301312,383449586),(28656,1554857976,893579264,385192150),(28661,1554857981,1589096448,389757498),(28662,1554857982,169676800,392989813),(28663,1554857983,48,393764365),(28664,1554857984,2672,394269505),(28665,1554857985,64,395388938),(28666,1554857986,0,396197883),(28667,1554857987,0,396574866),(28668,1554857988,112,397332865),(28249,1554857989,0,397266640),(28669,1554857989,2136,398244861),(28670,1554857990,112,399696018),(28611,1554857991,1,400442678),(28671,1554857991,0,401029213),(23272,1554857992,0,400222916),(28672,1554857992,0,401891264),(28674,1554857994,3392012288,405885409),(28615,1554857995,2,409989135),(28616,1554857996,120,412812181),(28677,1554857997,6553124864,416373459),(28678,1554857998,1,414647717),(28618,1554857998,66,415787045),(28679,1554857999,31576064,422473724),(28622,1554858002,215,421170163),(23287,1554858007,1,424928167),(23291,1554858011,3,441581260),(23292,1554858012,144,433929666),(28634,1554858014,1554858014,433563806),(23294,1554858014,135,434321052),(28635,1554858015,2053607424,437145463),(23298,1554858018,224,439546854),(28640,1554858020,3,446664693),(23662,1554858022,0,443961722),(28642,1554858022,634294272,445761463),(23308,1554858028,1554858028,450321035),(23309,1554858029,859557888,452195105),(28679,1554858029,31576064,458913218),(28651,1554858031,5824,455342172),(28652,1554858032,43064,455833051),(23314,1554858034,2,466718436),(28655,1554858035,5052583936,462905508),(23316,1554858036,378523648,462970274),(28656,1554858036,893579264,464298706),(28661,1554858041,1589096448,471265009),(28662,1554858042,169676800,472342225),(28663,1554858043,40,472913742),(28664,1554858044,2584,483638713),(28665,1554858045,48,479618096),(28666,1554858046,0,480931541),(28667,1554858047,0,482041512),(28668,1554858048,104,483026170),(28249,1554858049,0,483033390),(28669,1554858049,2080,484407777),(28670,1554858050,104,485639226),(28611,1554858051,1,486513279),(28671,1554858051,0,487042089),(23272,1554858052,0,486859713),(28672,1554858052,0,488665874),(28674,1554858054,3392012288,492449902),(28615,1554858055,3,497032444),(28616,1554858056,120,494217781),(28677,1554858057,6553124864,497111807),(28618,1554858058,68,495641520),(28678,1554858058,1,496246287),(28679,1554858059,31576064,504463351),(28622,1554858062,215,504645560),(23287,1554858067,1,508566026),(23291,1554858071,6,522580829),(23292,1554858072,144,514299520),(28634,1554858074,1554858074,518880991),(23294,1554858074,119,519617635),(28635,1554858075,2053607424,523305136),(23298,1554858078,212,527056263),(28640,1554858080,3,535956775),(23662,1554858082,0,531052742),(28642,1554858082,634167296,531606997),(23308,1554858088,1554858088,537272999),(23309,1554858089,859557888,539036388),(28679,1554858089,31576064,544585173),(28651,1554858091,3504,540452107),(28652,1554858092,10984,541585423),(23314,1554858094,2,553378153),(28655,1554858095,5052583936,546678378),(23316,1554858096,380100608,548285983),(28656,1554858096,893579264,550443248),(28661,1554858101,1589096448,556481447),(28662,1554858102,169676800,556990782),(28663,1554858103,40,559655192),(28664,1554858104,2680,560965341),(28665,1554858105,48,561101101),(28666,1554858106,0,561665409),(28667,1554858107,0,562596266),(28668,1554858108,104,563891617),(28249,1554858109,0,564375332),(28669,1554858109,2096,565003178),(28670,1554858110,104,565883889),(28671,1554858111,0,566708186),(28611,1554858111,1,567045082),(23272,1554858112,0,566017703),(28672,1554858112,0,567865564),(28674,1554858114,3392012288,570472323),(28615,1554858115,3,575001939),(28616,1554858116,120,573631024),(28677,1554858117,6553124864,574863316),(28678,1554858118,1,573614037),(28618,1554858118,67,575510813),(28679,1554858119,31576064,582738302),(28622,1554858122,216,581824377),(23287,1554858127,1,584236942),(23291,1554858131,7,598692334),(23292,1554858132,144,602670588),(23294,1554858134,115,601485884),(28634,1554858134,1554858134,602436520),(28635,1554858135,2053607424,604478622),(23298,1554858138,207,607259487),(28640,1554858140,3,614434622),(23662,1554858142,0,610810352),(28642,1554858142,634040320,612475568),(23308,1554858148,1554858148,617765188),(23309,1554858149,859557888,619591683),(28679,1554858149,31576064,625363813),(28651,1554858151,3584,622061486),(28652,1554858152,10312,623489606),(23314,1554858154,2,632265509),(28655,1554858155,5052583936,630572210),(23316,1554858156,380121088,633641550),(28656,1554858156,893579264,645285638),(28661,1554858161,1589096448,658244148),(28662,1554858162,169676800,648513582),(28663,1554858163,40,649198643),(28664,1554858164,2816,650735509),(28665,1554858165,48,652329729),(28666,1554858166,0,675233113),(28667,1554858167,0,656711205),(28668,1554858168,104,658976289),(28249,1554858169,0,659991747),(28669,1554858169,2160,661944115),(28670,1554858170,104,664251557),(28671,1554858171,0,667653028),(28611,1554858171,1,668415120),(23272,1554858172,0,667907035),(28672,1554858172,0,669542191),(28674,1554858174,3392012288,673577198),(28615,1554858175,3,677623322),(28616,1554858176,120,684906091),(28677,1554858177,6553124864,682072370),(28618,1554858178,68,681856454),(28678,1554858178,1,682821692),(28679,1554858179,31576064,689910484),(28622,1554858182,217,691739609),(23287,1554858187,1,697127358),(23291,1554858191,6,711388046),(23292,1554858192,143,704254196),(28634,1554858194,1554858194,708109379),(23294,1554858194,116,708868199),(28635,1554858195,2053607424,711867088),(23298,1554858198,208,714598656),(28640,1554858200,3,721460289),(23662,1554858202,0,717416110),(28642,1554858202,634167296,719572924),(23308,1554858208,1554858208,723924704),(23309,1554858209,859557888,725186601),(28679,1554858209,31576064,730684549),(28651,1554858211,3656,727426460),(28652,1554858212,10544,728512897),(23314,1554858214,2,739501647),(28655,1554858215,5053054976,733814704),(23316,1554858216,378056704,735003516),(28656,1554858216,893579264,736161752),(28661,1554858221,1588625408,751937519),(28662,1554858222,169676800,749502011),(28663,1554858223,40,750367913),(28664,1554858224,2728,751153318),(28665,1554858225,48,751751144),(28666,1554858226,0,753162913),(28667,1554858227,0,754431185),(28668,1554858228,104,755137140),(28249,1554858229,0,754927769),(28669,1554858229,2112,756347696),(28670,1554858230,104,756994505),(28671,1554858231,0,758519047),(28611,1554858231,1,758806498),(23272,1554858232,0,757960880),(28672,1554858232,0,759934223),(28674,1554858234,3392012288,763164877),(28615,1554858235,3,766925505),(28616,1554858236,119,765244151),(28677,1554858237,6553124864,767684600),(28678,1554858238,1,766870563),(28618,1554858238,67,767593644),(28679,1554858239,31576064,774970799),(28622,1554858242,216,775483982),(23287,1554858247,1,779554902),(23291,1554858251,4,799073940),(23292,1554858252,144,794984818),(28634,1554858254,1554858254,794722101),(23294,1554858254,125,795438323),(28635,1554858255,2053607424,798372150),(23298,1554858258,218,801624988),(28640,1554858260,3,808764336),(23662,1554858262,0,805156867),(28642,1554858262,634040320,806858668),(23308,1554858268,1554858268,810460621),(23309,1554858269,859557888,812035258),(28679,1554858269,31576064,817879294),(28651,1554858271,5672,813411991),(28652,1554858272,12432,814998138),(23314,1554858274,2,826713047),(28655,1554858275,5053050880,823907516),(23316,1554858276,378265600,823556849),(28656,1554858276,893579264,825615322),(28661,1554858281,1588629504,847345351),(28662,1554858282,169676800,835103722),(28663,1554858283,40,835979168),(28664,1554858284,2592,836914652),(28665,1554858285,48,838210041),(28666,1554858286,0,839487923),(28667,1554858287,0,840117913),(28668,1554858288,104,841006666),(28249,1554858289,0,840228008),(28669,1554858289,2104,842148539),(28670,1554858290,104,843449896),(28671,1554858291,0,844161424),(28611,1554858291,1,844684923),(23272,1554858292,0,843955978),(28672,1554858292,0,845724080),(28674,1554858294,3392012288,848772487),(28615,1554858295,2,853052328),(28616,1554858296,119,853527779),(28677,1554858297,6553124864,854016267),(28678,1554858298,1,855443452),(28618,1554858298,68,856803264),(28679,1554858299,31576064,863725978),(28622,1554858302,217,863049300),(23287,1554858307,1,866456307),(23291,1554858311,3,883828143),(23292,1554858312,144,878699480),(23294,1554858314,127,877299729),(28634,1554858314,1554858314,878897667),(28635,1554858315,2053607424,882008252),(23298,1554858318,223,884680292),(28640,1554858320,3,891522580),(23662,1554858322,0,887649875),(28642,1554858322,634167296,889461839),(23308,1554858328,1554858328,902139000),(23309,1554858329,859557888,903270050),(28679,1554858329,31576064,909143569),(28651,1554858331,7288,905556444),(28652,1554858332,14552,906095149),(23314,1554858334,2,917329326),(28655,1554858335,5050073088,911607807),(23316,1554858336,376045568,912379554),(28656,1554858336,893579264,914538942),(28661,1554858341,1591607296,920519058),(28662,1554858342,169676800,921712269),(28663,1554858343,48,921722258),(28664,1554858344,2640,922940995),(28665,1554858345,56,924513985),(28666,1554858346,0,925620956),(28667,1554858347,0,926572014),(28668,1554858348,112,927711883),(28249,1554858349,0,927502422),(28669,1554858349,2144,928719501),(28670,1554858350,112,929980892),(28611,1554858351,1,930565570),(28671,1554858351,0,931214284),(23272,1554858352,0,930245103),(28672,1554858352,0,932143393),(28674,1554858354,3392012288,935729854),(28615,1554858355,3,939795568),(28616,1554858356,119,949008426),(28677,1554858357,6553124864,943733990),(28618,1554858358,66,942911205),(28678,1554858358,1,943655689),(28679,1554858359,31576064,952056045),(28622,1554858362,215,952630231),(23287,1554858367,1,956235101),(23291,1554858371,7,969865108),(23292,1554858372,144,973391642),(23294,1554858374,135,972143549),(28634,1554858374,1554858374,972754597),(28635,1554858375,2053607424,975238936),(23298,1554858378,277,977046874),(28640,1554858380,3,984452186),(23662,1554858382,0,980430458),(28642,1554858382,634167296,981912471),(23308,1554858388,1554858388,984312050),(23309,1554858389,859557888,985613072),(28679,1554858389,31576064,991090660),(28651,1554858391,5016,986504105),(28652,1554858392,13072,987205394),(23314,1554858394,2,999492502),(28655,1554858395,5050003456,993088513),(23316,1554858396,372772864,994509187),(28656,1554858396,893579264,996520449),(28661,1554858401,1591656448,2415341),(28662,1554858402,169676800,3353548),(28663,1554858403,48,5768611),(28664,1554858404,2664,7033367),(28665,1554858405,56,7643427),(28666,1554858406,0,7900196),(28667,1554858407,0,8607771),(28668,1554858408,112,9267179),(28249,1554858409,0,8898724),(28669,1554858409,2176,10524989),(28670,1554858410,112,11050880),(28671,1554858411,0,12405410),(28611,1554858411,1,12738207),(23272,1554858412,0,11604532),(28672,1554858412,0,12341527),(28674,1554858414,3392012288,16355892),(28615,1554858415,3,20790013),(28616,1554858416,119,19898782),(28617,1554858417,1554847105,19923310),(28677,1554858417,6553124864,21614044),(28678,1554858418,1,21358933),(28618,1554858418,69,22436303),(28679,1554858419,31576064,28971607),(28622,1554858422,219,26963486),(23287,1554858427,1,31135346),(23291,1554858431,5,46568430),(23292,1554858432,146,39064498),(23294,1554858434,132,41605692),(28634,1554858434,1554858434,42268244),(28635,1554858435,2053607424,44763102),(23298,1554858438,221,47896802),(28639,1554858439,11334,50173478),(28640,1554858440,3,56005828),(23662,1554858442,0,52833654),(28642,1554858442,634294272,55160132),(23308,1554858448,1554858448,59677857),(23309,1554858449,859557888,60568435),(28679,1554858449,31576064,66334451),(28651,1554858451,16056,62368881),(28652,1554858452,807272,63201054),(23314,1554858454,2,76044554),(28655,1554858455,5050023936,68923138),(23316,1554858456,372998144,70109670),(28656,1554858456,893579264,72055225),(28661,1554858461,1591656448,79936579),(28662,1554858462,169676800,81102913),(28663,1554858463,48,81864289),(28664,1554858464,2832,82223944),(28665,1554858465,56,83644669),(28666,1554858466,0,97347006),(28667,1554858467,0,94226460),(28668,1554858468,112,95741542),(28249,1554858469,0,95662283),(28669,1554858469,2176,97087461),(28670,1554858470,112,98506331),(23271,1554858471,0,98088828),(28671,1554858471,0,99619328),(28611,1554858471,1,100059122),(23272,1554858472,0,99115453),(28672,1554858472,0,100793989),(28674,1554858474,3392012288,103521825),(28615,1554858475,3,107502519),(28616,1554858476,119,115070383),(28677,1554858477,6553124864,113750531),(28678,1554858478,1,112434447),(28618,1554858478,67,113460975),(28679,1554858479,31576064,120179445),(28622,1554858482,215,119274853),(23287,1554858487,1,124402633),(23291,1554858491,8,138316318),(23292,1554858492,146,142600475),(23293,1554858493,1554807130,140396930),(23294,1554858494,133,141102346),(28634,1554858494,1554858494,142596492),(28635,1554858495,2053607424,143795223),(23298,1554858498,213,145025071),(28640,1554858500,3,152865797),(23662,1554858502,0,149613537),(28642,1554858502,634294272,152932598),(23308,1554858508,1554858508,154646584),(23309,1554858509,859557888,156307207),(28679,1554858509,31576064,161620236),(28651,1554858511,4152,158899735),(28652,1554858512,11320,160419364),(23313,1554858513,51383,162442473),(23314,1554858514,2,171860607),(28655,1554858515,5050085376,166916721),(23316,1554858516,372715520,167968854),(28656,1554858516,893579264,169237769),(28661,1554858521,1591595008,174477764),(28662,1554858522,169676800,175481114),(28663,1554858523,48,176227044),(28664,1554858524,2632,178223427),(28665,1554858525,56,179035581),(28666,1554858526,0,179882302),(28667,1554858527,0,180788155),(28668,1554858528,112,181335358),(28249,1554858529,0,181050232),(28669,1554858529,2136,182704655),(28670,1554858530,112,183552368),(28671,1554858531,0,185001889),(28611,1554858531,1,185492650),(23272,1554858532,0,184619107),(28672,1554858532,0,186017764),(28674,1554858534,3392012288,188570309),(28615,1554858535,3,192667073),(28616,1554858536,119,191409921),(28677,1554858537,6553124864,193226273),(28678,1554858538,1,191849462),(28618,1554858538,68,193545585),(28679,1554858539,31576064,199772457),(28622,1554858542,232,199411666),(23287,1554858547,1,201648167),(23291,1554858551,6,217558265),(23292,1554858552,146,209503498),(23294,1554858554,132,213144036),(28634,1554858554,1554858554,214800037),(28635,1554858555,2053607424,217925695),(23298,1554858558,211,220792802),(28640,1554858560,3,226927140),(23662,1554858562,0,223646922),(28642,1554858562,632152064,224758454),(23308,1554858568,1554858568,228563998),(23309,1554858569,859557888,230482514),(28679,1554858569,31576064,236359459),(28651,1554858571,5568,232672469),(28652,1554858572,25976,234175783),(23314,1554858574,2,245077485),(28655,1554858575,5050085376,238391210),(28656,1554858576,893579264,240958506),(23316,1554858576,372944896,241351762),(28661,1554858581,1591595008,248641895),(28662,1554858582,169676800,248944809),(28663,1554858583,48,249630375),(28664,1554858584,2616,251019750),(28665,1554858585,56,251953218),(28666,1554858586,0,253230472),(28667,1554858587,0,253903445),(28668,1554858588,112,254623295),(28249,1554858589,0,253489104),(28669,1554858589,2104,457018942),(28670,1554858590,112,256893031),(28611,1554858591,1,257768972),(28671,1554858591,0,258436274),(23272,1554858592,0,263139017),(28672,1554858592,0,264431435),(28674,1554858594,3392012288,268629024),(28615,1554858595,3,272949321),(28616,1554858596,119,272351584),(28677,1554858597,6553124864,273285877),(28678,1554858598,1,274668197),(28618,1554858598,68,275630154),(28679,1554858599,31576064,281955960),(28622,1554858602,216,282950789),(23287,1554858607,1,285654332),(23291,1554858611,6,304474189),(23292,1554858612,146,307706819),(23294,1554858614,143,312513665),(28634,1554858614,1554858614,313020585),(28635,1554858615,2053607424,313748816),(23298,1554858618,224,315576542),(28640,1554858620,3,323460338),(23662,1554858622,0,319033982),(28642,1554858622,632160256,320880770),(23308,1554858628,1554858628,324553346),(23309,1554858629,859557888,325295328),(28679,1554858629,31576064,331054915),(28651,1554858631,9248,327005453),(28652,1554858632,48656,328755590),(23314,1554858634,2,340768671),(28655,1554858635,5050085376,334898602),(23316,1554858636,370135040,337354522),(28656,1554858636,893579264,346327910),(28661,1554858641,1591595008,345093820),(28662,1554858642,169676800,346037145),(28663,1554858643,40,348575917),(28664,1554858644,2912,349105533),(28665,1554858645,48,350755809),(28666,1554858646,0,351621356),(28667,1554858647,0,352435531),(28668,1554858648,104,352972637),(28249,1554858649,0,352041921),(28669,1554858649,2184,353923308),(28670,1554858650,104,355205171),(28671,1554858651,0,355866055),(28611,1554858651,1,356363992),(23272,1554858652,0,355745747),(28672,1554858652,0,357174195),(28674,1554858654,3392012288,360863625),(28615,1554858655,2,364605077),(28616,1554858656,119,365570650),(28677,1554858657,6553124864,366790861),(28678,1554858658,1,367030079),(28618,1554858658,68,368247156),(28679,1554858659,31576064,375281626),(28622,1554858662,217,375634635),(23287,1554858667,1,379626078),(23291,1554858671,6,394337838),(23292,1554858672,145,397474598),(23294,1554858674,156,399550241),(28634,1554858674,1554858674,400632103),(28635,1554858675,2053607424,401242955),(23298,1554858678,233,403781214),(28640,1554858680,3,410584367),(23662,1554858682,0,407952648),(28642,1554858682,632127488,409012499),(23308,1554858688,1554858688,412851517),(23309,1554858689,859557888,413243034),(28679,1554858689,31576064,419792585),(28651,1554858691,5784,415528184),(28652,1554858692,25928,416829520),(23314,1554858694,2,428081889),(28655,1554858695,5050085376,422748709),(23316,1554858696,371806208,422742460),(28656,1554858696,893579264,424812568),(28661,1554858701,1591595008,429927496),(28662,1554858702,169676800,429738442),(28663,1554858703,40,431081830),(28664,1554858704,2824,432830933),(28667,1554858707,0,435679972),(28668,1554858708,112,436861517),(28249,1554858709,0,436742370),(28669,1554858709,2384,438025058),(28611,1554858711,1,440734407),(23272,1554858712,0,440034407),(28672,1554858712,0,441966339),(28674,1554858714,3430678528,445550830),(28615,1554858715,3,449366311),(28616,1554858716,105,448907680),(28677,1554858717,6514458624,450354807),(28678,1554858718,0,451250523),(28618,1554858718,74,452481895),(28679,1554858719,0,458656658),(28622,1554858722,236,458242902),(23287,1554858727,1,461897263),(23291,1554858731,7,477112836),(23292,1554858732,145,480811717),(23294,1554858734,105,483037870),(28634,1554858734,1554858734,483745929),(28635,1554858735,2053607424,485032150),(23298,1554858738,204,488036548),(28640,1554858740,3,505360252),(23662,1554858742,0,496669971),(28642,1554858742,694358016,498524437),(23308,1554858748,1554858748,507122577),(23309,1554858749,859557888,507653775),(28679,1554858749,0,513170200),(28651,1554858751,5632,511140088),(28652,1554858752,21544,516930889),(23314,1554858754,2,528425714),(28655,1554858755,5050085376,522837776),(23316,1554858756,372424704,521990518),(28656,1554858756,893579264,523959606),(28661,1554858761,1591595008,530413869),(28662,1554858762,169676800,530916067),(28663,1554858763,0,531602161),(28664,1554858764,2696,533243151),(28667,1554858767,0,535205578),(28668,1554858768,0,540105034),(28249,1554858769,0,540077210),(28669,1554858769,2040,541540785),(28611,1554858771,1,543337662),(23272,1554858772,0,543196308),(28672,1554858772,0,544592675),(28674,1554858774,3430678528,547809866),(28615,1554858775,3,551007424),(28616,1554858776,105,562656152),(28677,1554858777,6514458624,563022880),(28678,1554858778,0,561266590),(28618,1554858778,33,562507603),(28679,1554858779,0,568623870),(28622,1554858782,66,578073727),(23287,1554858787,1,583211600),(23291,1554858791,6,598399021),(23292,1554858792,145,600603680),(23294,1554858794,179,602184344),(28634,1554858794,1554858794,602842716),(28635,1554858795,2053607424,604648328),(23298,1554858798,250,607048965),(28640,1554858800,3,614364659),(23662,1554858802,0,610595848),(28642,1554858802,694239232,612178869),(23308,1554858808,1554858808,616616044),(23309,1554858809,859557888,618541171),(28679,1554858809,0,623046875),(28651,1554858811,7976,621066611),(28652,1554858812,49584,622461150),(23314,1554858814,2,633533769),(28655,1554858815,5050085376,630547023),(23316,1554858816,373313536,629786305),(28656,1554858816,893579264,631869449),(28661,1554858821,1591595008,636895396),(28662,1554858822,169676800,637270092),(28663,1554858823,0,639422473),(28664,1554858824,2584,639852474),(28667,1554858827,0,642563188),(28668,1554858828,0,643550166),(28249,1554858829,0,643306497),(28669,1554858829,2112,644637821),(28611,1554858831,1,646354118),(23272,1554858832,0,646484189),(28672,1554858832,0,647969793),(28674,1554858834,3430678528,651719159),(28615,1554858835,2,655388130),(28616,1554858836,105,654818427),(28677,1554858837,6514458624,656350235),(28678,1554858838,0,655039780),(28618,1554858838,31,657078037),(28679,1554858839,0,663026178),(28622,1554858842,65,663761264),(23287,1554858847,1,667683047),(23291,1554858851,7,682234179),(23292,1554858852,146,675090439),(23294,1554858854,171,681120572),(28634,1554858854,1554858854,682653375),(28635,1554858855,2053607424,684788787),(23298,1554858858,237,690568203),(28640,1554858860,3,697650056),(23662,1554858862,0,695966906),(28642,1554858862,693612544,697012010),(23308,1554858868,1554858868,701261402),(23309,1554858869,859557888,702341205),(28679,1554858869,0,742818719),(28651,1554858871,6840,704740203),(28652,1554858872,14952,706224509),(23314,1554858874,2,716210554),(28655,1554858875,5050085376,713176688),(28656,1554858876,893579264,714355734),(23316,1554858876,392159232,714758564),(28661,1554858881,1591595008,722104325),(28662,1554858882,169676800,722931599),(28663,1554858883,0,723228406),(28664,1554858884,10816,724412698),(28667,1554858887,0,726136090),(28668,1554858888,16,727650329),(28249,1554858889,0,726643478),(28669,1554858889,6312,728137087),(28611,1554858891,1,729988388),(23272,1554858892,0,729432352),(28672,1554858892,0,731258966),(28674,1554858894,3392012288,734664123),(28615,1554858895,2,738565601),(28616,1554858896,120,739294725),(28677,1554858897,6553124864,739563407),(28678,1554858898,1,742089841),(28618,1554858898,133,742953406),(28679,1554858899,31313920,749439095),(28622,1554858902,424,748562148),(23287,1554858907,1,753592411),(23291,1554858911,6,768961488),(23292,1554858912,146,771176337),(23294,1554858914,112,769957605),(28634,1554858914,1554858914,771719371),(28635,1554858915,2053345280,773897443),(23298,1554858918,206,775407902),(28640,1554858920,3,801453114),(23662,1554858922,0,779031094),(28642,1554858922,622837760,779620849),(23308,1554858928,1554858928,784230671),(23309,1554858929,859557888,785208565),(28679,1554858929,31313920,790548294),(28651,1554858931,3376,786937372),(28652,1554858932,3344,788310508),(23314,1554858934,2,798663611),(28655,1554858935,5050085376,793898971),(23316,1554858936,381997056,793839889),(28656,1554858936,893579264,795862959),(28661,1554858941,1591595008,801706463),(28662,1554858942,169676800,802598793),(28663,1554858943,48,804711120),(28664,1554858944,2504,805958292),(28667,1554858947,0,808578264),(28668,1554858948,112,809432976),(28249,1554858949,0,808572144),(28669,1554858949,1912,809899177),(28611,1554858951,1,811603595),(23272,1554858952,0,810937072),(28672,1554858952,0,812848653),(28674,1554858954,3392012288,815939775),(28615,1554858955,4,819873582),(28616,1554858956,120,820322753),(28677,1554858957,6553124864,820737707),(28678,1554858958,1,823020488),(28618,1554858958,68,823631244),(28679,1554858959,31313920,829840112),(28622,1554858962,215,828611758),(23287,1554858967,1,831582352),(23291,1554858971,7,846087937),(23292,1554858972,146,850051581),(23294,1554858974,112,851769679),(28634,1554858974,1554858974,852836601),(28635,1554858975,2053345280,854865813),(23298,1554858978,204,856995980),(28640,1554858980,3,863080108),(23662,1554858982,0,859032209),(28642,1554858982,622329856,861142281),(23308,1554858988,1554858988,865944917),(23309,1554858989,859557888,867379627),(28679,1554858989,31313920,873152941),(28651,1554858991,3256,868806476),(28652,1554858992,3352,870527119),(23314,1554858994,2,882002374),(28655,1554858995,5050085376,875528728),(28656,1554858996,893579264,878945404),(23316,1554858996,380477440,879306440),(28661,1554859001,1591595008,885545419),(28662,1554859002,169676800,885928987),(28663,1554859003,48,886422527),(28664,1554859004,2384,887185781),(28667,1554859007,0,890041392),(28668,1554859008,112,890747566),(28249,1554859009,0,889912654),(28669,1554859009,1912,891384654),(28611,1554859011,1,892689129),(23272,1554859012,0,892011381),(28672,1554859012,0,893874876),(28674,1554859014,3392012288,896919279),(28615,1554859015,4,901156804),(28616,1554859016,119,899363882),(28617,1554859017,1554847105,899632497),(28677,1554859017,6553124864,901878186),(28678,1554859018,1,901694761),(28618,1554859018,68,903216638),(28679,1554859019,31313920,909765585),(28622,1554859022,221,908457451),(23287,1554859027,1,913958338),(23291,1554859031,6,930263036),(23292,1554859032,146,921686416),(23294,1554859034,109,928390431),(28634,1554859034,1554859034,928968951),(28635,1554859035,2053345280,930695821),(23298,1554859038,202,933927707),(28639,1554859039,11935,936136879),(28640,1554859040,3,942457689),(23662,1554859042,0,938907846),(28642,1554859042,621830144,940725552),(23308,1554859048,1554859048,947568392),(23309,1554859049,859557888,948932569),(28679,1554859049,31313920,954432112),(28651,1554859051,3512,950135463),(28652,1554859052,3480,951551294),(23314,1554859054,2,963558994),(28655,1554859055,5053042688,957318067),(23316,1554859056,379117568,956262161),(28656,1554859056,893579264,958774900),(28661,1554859061,1588637696,970054388),(28662,1554859062,169676800,970511917),(28663,1554859063,48,972531332),(28664,1554859064,2664,973631540);
/*!40000 ALTER TABLE `history_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_discovery`
--

DROP TABLE IF EXISTS `host_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_discovery` (
  `hostid` bigint(20) unsigned NOT NULL,
  `parent_hostid` bigint(20) unsigned DEFAULT NULL,
  `parent_itemid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostid`),
  KEY `c_host_discovery_2` (`parent_hostid`),
  KEY `c_host_discovery_3` (`parent_itemid`),
  CONSTRAINT `c_host_discovery_3` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_host_discovery_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_host_discovery_2` FOREIGN KEY (`parent_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_discovery`
--

LOCK TABLES `host_discovery` WRITE;
/*!40000 ALTER TABLE `host_discovery` DISABLE KEYS */;
INSERT INTO `host_discovery` VALUES (10176,NULL,26988,'',0,0),(10177,NULL,26989,'',0,0);
/*!40000 ALTER TABLE `host_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_inventory`
--

DROP TABLE IF EXISTS `host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_inventory` (
  `hostid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '',
  `type_full` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(64) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `os_full` varchar(255) NOT NULL DEFAULT '',
  `os_short` varchar(64) NOT NULL DEFAULT '',
  `serialno_a` varchar(64) NOT NULL DEFAULT '',
  `serialno_b` varchar(64) NOT NULL DEFAULT '',
  `tag` varchar(64) NOT NULL DEFAULT '',
  `asset_tag` varchar(64) NOT NULL DEFAULT '',
  `macaddress_a` varchar(64) NOT NULL DEFAULT '',
  `macaddress_b` varchar(64) NOT NULL DEFAULT '',
  `hardware` varchar(255) NOT NULL DEFAULT '',
  `hardware_full` text NOT NULL,
  `software` varchar(255) NOT NULL DEFAULT '',
  `software_full` text NOT NULL,
  `software_app_a` varchar(64) NOT NULL DEFAULT '',
  `software_app_b` varchar(64) NOT NULL DEFAULT '',
  `software_app_c` varchar(64) NOT NULL DEFAULT '',
  `software_app_d` varchar(64) NOT NULL DEFAULT '',
  `software_app_e` varchar(64) NOT NULL DEFAULT '',
  `contact` text NOT NULL,
  `location` text NOT NULL,
  `location_lat` varchar(16) NOT NULL DEFAULT '',
  `location_lon` varchar(16) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `chassis` varchar(64) NOT NULL DEFAULT '',
  `model` varchar(64) NOT NULL DEFAULT '',
  `hw_arch` varchar(32) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `contract_number` varchar(64) NOT NULL DEFAULT '',
  `installer_name` varchar(64) NOT NULL DEFAULT '',
  `deployment_status` varchar(64) NOT NULL DEFAULT '',
  `url_a` varchar(255) NOT NULL DEFAULT '',
  `url_b` varchar(255) NOT NULL DEFAULT '',
  `url_c` varchar(255) NOT NULL DEFAULT '',
  `host_networks` text NOT NULL,
  `host_netmask` varchar(39) NOT NULL DEFAULT '',
  `host_router` varchar(39) NOT NULL DEFAULT '',
  `oob_ip` varchar(39) NOT NULL DEFAULT '',
  `oob_netmask` varchar(39) NOT NULL DEFAULT '',
  `oob_router` varchar(39) NOT NULL DEFAULT '',
  `date_hw_purchase` varchar(64) NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) NOT NULL DEFAULT '',
  `site_address_a` varchar(128) NOT NULL DEFAULT '',
  `site_address_b` varchar(128) NOT NULL DEFAULT '',
  `site_address_c` varchar(128) NOT NULL DEFAULT '',
  `site_city` varchar(128) NOT NULL DEFAULT '',
  `site_state` varchar(64) NOT NULL DEFAULT '',
  `site_country` varchar(64) NOT NULL DEFAULT '',
  `site_zip` varchar(64) NOT NULL DEFAULT '',
  `site_rack` varchar(128) NOT NULL DEFAULT '',
  `site_notes` text NOT NULL,
  `poc_1_name` varchar(128) NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) NOT NULL DEFAULT '',
  `poc_1_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_1_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_1_notes` text NOT NULL,
  `poc_2_name` varchar(128) NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) NOT NULL DEFAULT '',
  `poc_2_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_2_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_2_notes` text NOT NULL,
  PRIMARY KEY (`hostid`),
  CONSTRAINT `c_host_inventory_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_inventory`
--

LOCK TABLES `host_inventory` WRITE;
/*!40000 ALTER TABLE `host_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  UNIQUE KEY `hostmacro_1` (`hostid`,`macro`),
  CONSTRAINT `c_hostmacro_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
INSERT INTO `hostmacro` VALUES (351,10184,'{$CPU_UTIL_MAX}','90'),(352,10184,'{$MEMORY_UTIL_MAX}','90'),(356,10184,'{$STORAGE_UTIL_CRIT}','90'),(357,10184,'{$STORAGE_UTIL_WARN}','80'),(358,10185,'{$CPU_UTIL_MAX}','90'),(359,10185,'{$MEMORY_UTIL_MAX}','90'),(363,10185,'{$STORAGE_UTIL_CRIT}','90'),(364,10185,'{$STORAGE_UTIL_WARN}','80'),(365,10186,'{$ICMP_LOSS_WARN}','20'),(366,10186,'{$ICMP_RESPONSE_TIME_WARN}','0.15'),(367,10187,'{$IFCONTROL}','1'),(368,10187,'{$IF_UTIL_MAX}','95'),(369,10187,'{$IF_ERRORS_WARN}','2'),(370,10188,'{$IFCONTROL}','1'),(371,10188,'{$IF_UTIL_MAX}','95'),(372,10188,'{$IF_ERRORS_WARN}','2'),(373,10189,'{$IFCONTROL}','1'),(374,10189,'{$IF_UTIL_MAX}','90'),(375,10189,'{$IF_ERRORS_WARN}','2'),(376,10190,'{$IFCONTROL}','1'),(377,10190,'{$IF_UTIL_MAX}','90'),(378,10190,'{$IF_ERRORS_WARN}','2'),(382,10192,'{$IFCONTROL}','1'),(383,10192,'{$IF_UTIL_MAX}','90'),(384,10192,'{$IF_ERRORS_WARN}','2'),(385,10203,'{$SNMP_TIMEOUT}','3m'),(386,10204,'{$SNMP_TIMEOUT}','3m'),(393,10207,'{$TEMP_CRIT}','75'),(394,10207,'{$TEMP_WARN}','65'),(395,10207,'{$PSU_CRIT_STATUS}','4'),(396,10207,'{$FAN_CRIT_STATUS}','4'),(397,10207,'{$CPU_UTIL_MAX}','90'),(398,10207,'{$MEMORY_UTIL_MAX}','90'),(399,10207,'{$TEMP_CRIT_LOW}','5'),(402,10208,'{$TEMP_CRIT}','75'),(403,10208,'{$TEMP_WARN}','65'),(404,10208,'{$HEALTH_CRIT_STATUS}','4'),(405,10208,'{$HEALTH_WARN_STATUS:\"offline\"}','2'),(406,10208,'{$HEALTH_WARN_STATUS:\"testing\"}','3'),(407,10208,'{$TEMP_WARN_STATUS}','5'),(408,10208,'{$PSU_CRIT_STATUS}','2'),(409,10208,'{$FAN_CRIT_STATUS}','2'),(410,10208,'{$PSU_OK_STATUS}','4'),(411,10208,'{$FAN_OK_STATUS}','4'),(412,10208,'{$CPU_UTIL_MAX}','90'),(413,10208,'{$MEMORY_UTIL_MAX}','90'),(414,10208,'{$TEMP_CRIT_LOW}','5'),(417,10210,'{$TEMP_CRIT}','75'),(418,10210,'{$TEMP_WARN}','65'),(419,10210,'{$PSU_CRIT_STATUS}','3'),(420,10210,'{$FAN_CRIT_STATUS}','3'),(421,10210,'{$PSU_OK_STATUS}','2'),(422,10210,'{$FAN_OK_STATUS}','2'),(425,10210,'{$TEMP_CRIT_LOW}','5'),(428,10211,'{$TEMP_CRIT}','75'),(429,10211,'{$TEMP_WARN}','65'),(430,10211,'{$PSU_CRIT_STATUS}','3'),(431,10211,'{$FAN_CRIT_STATUS}','3'),(432,10211,'{$PSU_OK_STATUS}','2'),(433,10211,'{$FAN_OK_STATUS}','2'),(436,10211,'{$TEMP_CRIT_LOW}','5'),(439,10217,'{$TEMP_CRIT:\"CPU\"}','75'),(440,10217,'{$TEMP_WARN:\"CPU\"}','70'),(441,10217,'{$TEMP_WARN_STATUS}','2'),(442,10217,'{$TEMP_CRIT_STATUS}','3'),(443,10217,'{$TEMP_DISASTER_STATUS}','4'),(469,10221,'{$TEMP_CRIT}','65'),(470,10221,'{$TEMP_WARN}','55'),(471,10221,'{$PSU_CRIT_STATUS}','2'),(472,10221,'{$FAN_CRIT_STATUS}','2'),(473,10221,'{$PSU_OK_STATUS}','1'),(474,10221,'{$FAN_OK_STATUS}','1'),(475,10221,'{$CPU_UTIL_MAX}','90'),(476,10221,'{$MEMORY_UTIL_MAX}','90'),(477,10221,'{$TEMP_CRIT_LOW}','5'),(480,10222,'{$TEMP_CRIT}','75'),(481,10222,'{$TEMP_WARN}','65'),(482,10222,'{$PSU_CRIT_STATUS}','5'),(483,10222,'{$FAN_CRIT_STATUS}','5'),(484,10222,'{$CPU_UTIL_MAX}','90'),(485,10222,'{$MEMORY_UTIL_MAX}','90'),(486,10222,'{$TEMP_CRIT_LOW}','5'),(489,10223,'{$TEMP_CRIT}','75'),(490,10223,'{$TEMP_WARN}','65'),(491,10223,'{$PSU_CRIT_STATUS}','4'),(492,10223,'{$FAN_CRIT_STATUS}','2'),(493,10223,'{$CPU_UTIL_MAX}','90'),(494,10223,'{$MEMORY_UTIL_MAX}','90'),(495,10223,'{$TEMP_CRIT_LOW}','5'),(498,10224,'{$TEMP_CRIT}','65'),(499,10224,'{$TEMP_WARN}','55'),(500,10224,'{$TEMP_CRIT_STATUS}','1'),(501,10224,'{$PSU_CRIT_STATUS}','3'),(502,10224,'{$FAN_CRIT_STATUS}','2'),(505,10224,'{$CPU_UTIL_MAX}','90'),(506,10224,'{$MEMORY_UTIL_MAX}','90'),(507,10224,'{$TEMP_CRIT_LOW}','5'),(510,10227,'{$FAN_CRIT_STATUS:\"fanError\"}','41'),(511,10227,'{$FAN_CRIT_STATUS:\"hardwareFaulty\"}','91'),(512,10227,'{$PSU_CRIT_STATUS:\"psuError\"}','51'),(513,10227,'{$PSU_CRIT_STATUS:\"rpsError\"}','61'),(514,10227,'{$PSU_CRIT_STATUS:\"hardwareFaulty\"}','91'),(515,10227,'{$CPU_UTIL_MAX}','90'),(516,10227,'{$MEMORY_UTIL_MAX}','90'),(517,10227,'{$TEMP_CRIT}','60'),(518,10227,'{$TEMP_WARN}','50'),(519,10227,'{$TEMP_CRIT_LOW}','5'),(533,10229,'{$FAN_CRIT_STATUS}','2'),(534,10229,'{$CPU_UTIL_MAX}','90'),(535,10229,'{$MEMORY_UTIL_MAX}','90'),(536,10229,'{$TEMP_CRIT}','60'),(537,10229,'{$TEMP_WARN}','50'),(538,10229,'{$TEMP_CRIT_LOW}','5'),(541,10230,'{$TEMP_CRIT_STATUS}','3'),(542,10230,'{$TEMP_WARN_STATUS}','2'),(543,10230,'{$PSU_CRIT_STATUS}','3'),(544,10230,'{$FAN_CRIT_STATUS}','3'),(547,10230,'{$TEMP_CRIT}','60'),(548,10230,'{$TEMP_WARN}','50'),(549,10230,'{$TEMP_CRIT_LOW}','5'),(552,10231,'{$TEMP_CRIT:\"Routing Engine\"}','80'),(553,10231,'{$TEMP_WARN:\"Routing Engine\"}','70'),(554,10231,'{$HEALTH_CRIT_STATUS}','3'),(555,10231,'{$FAN_CRIT_STATUS}','6'),(556,10231,'{$PSU_CRIT_STATUS}','6'),(557,10231,'{$CPU_UTIL_MAX}','90'),(558,10231,'{$MEMORY_UTIL_MAX}','90'),(559,10231,'{$TEMP_CRIT}','60'),(560,10231,'{$TEMP_WARN}','50'),(561,10231,'{$TEMP_CRIT_LOW}','5'),(572,10233,'{$TEMP_CRIT:\"CPU\"}','75'),(573,10233,'{$TEMP_WARN:\"CPU\"}','70'),(574,10233,'{$CPU_UTIL_MAX}','90'),(575,10233,'{$MEMORY_UTIL_MAX}','90'),(576,10233,'{$TEMP_CRIT}','60'),(577,10233,'{$TEMP_WARN}','50'),(578,10233,'{$TEMP_CRIT_LOW}','5'),(579,10233,'{$STORAGE_UTIL_CRIT}','90'),(580,10233,'{$STORAGE_UTIL_WARN}','80'),(581,10234,'{$TEMP_WARN_STATUS}','2'),(582,10234,'{$TEMP_CRIT_STATUS}','3'),(583,10234,'{$PSU_CRIT_STATUS:\"failed\"}','2'),(584,10234,'{$FAN_CRIT_STATUS:\"failed\"}','2'),(585,10234,'{$CPU_UTIL_MAX}','90'),(586,10234,'{$MEMORY_UTIL_MAX}','90'),(587,10234,'{$TEMP_CRIT}','60'),(588,10234,'{$TEMP_WARN}','50'),(589,10234,'{$TEMP_CRIT_LOW}','5'),(592,10235,'{$TEMP_CRIT}','75'),(593,10235,'{$TEMP_WARN}','65'),(594,10235,'{$PSU_CRIT_STATUS}','1'),(595,10235,'{$FAN_CRIT_STATUS}','1'),(596,10235,'{$CPU_UTIL_MAX}','90'),(597,10235,'{$MEMORY_UTIL_MAX}','90'),(601,10236,'{$CPU_UTIL_MAX}','90'),(602,10236,'{$MEMORY_UTIL_MAX}','90'),(603,10237,'{$CPU_UTIL_MAX}','90'),(604,10237,'{$MEMORY_UTIL_MAX}','90'),(619,10250,'{$FAN_CRIT_STATUS:\"bad\"}','2'),(620,10250,'{$PSU_CRIT_STATUS:\"bad\"}','2'),(621,10250,'{$TEMP_WARN_STATUS}','3'),(622,10250,'{$TEMP_CRIT_STATUS}','2'),(623,10250,'{$CPU_UTIL_MAX}','90'),(624,10250,'{$MEMORY_UTIL_MAX}','90'),(625,10250,'{$TEMP_CRIT}','60'),(626,10250,'{$TEMP_WARN}','50'),(627,10250,'{$TEMP_CRIT_LOW}','5'),(630,10251,'{$PSU_CRIT_STATUS}','2'),(631,10251,'{$FAN_CRIT_STATUS}','3'),(632,10251,'{$TEMP_WARN_STATUS}','3'),(635,10251,'{$TEMP_CRIT}','60'),(636,10251,'{$TEMP_WARN}','50'),(637,10251,'{$TEMP_CRIT_LOW}','5'),(647,10230,'{$PSU_WARN_STATUS}','4'),(648,10217,'{$PSU_CRIT_STATUS:\"critical\"}','3'),(649,10217,'{$PSU_CRIT_STATUS:\"shutdown\"}','4'),(650,10217,'{$PSU_WARN_STATUS:\"warning\"}','2'),(651,10217,'{$PSU_WARN_STATUS:\"notFunctioning\"}','6'),(652,10217,'{$FAN_CRIT_STATUS:\"critical\"}','3'),(653,10217,'{$FAN_CRIT_STATUS:\"shutdown\"}','4'),(654,10217,'{$FAN_WARN_STATUS:\"warning\"}','2'),(655,10217,'{$FAN_WARN_STATUS:\"notFunctioning\"}','6'),(656,10250,'{$FAN_WARN_STATUS:\"warning\"}','3'),(657,10250,'{$PSU_WARN_STATUS:\"warning\"}','3'),(658,10254,'{$CPU_UTIL_MAX}','90'),(659,10254,'{$FAN_CRIT_STATUS}','3'),(660,10254,'{$MEMORY_UTIL_MAX}','90'),(661,10254,'{$PSU_CRIT_STATUS}','2'),(662,10254,'{$STORAGE_UTIL_CRIT}','95'),(663,10254,'{$STORAGE_UTIL_WARN}','90'),(664,10254,'{$TEMP_CRIT_LOW}','5'),(665,10254,'{$TEMP_CRIT}','60'),(666,10254,'{$TEMP_WARN_STATUS}','3'),(667,10254,'{$TEMP_WARN}','50'),(668,10209,'{$CPU_UTIL_MAX}','90'),(669,10209,'{$MEMORY_UTIL_MAX}','90'),(670,10212,'{$MEMORY_UTIL_MAX}','90'),(671,10213,'{$CPU_UTIL_MAX}','90'),(672,10252,'{$CPU_UTIL_MAX}','90'),(673,10215,'{$CPU_UTIL_MAX}','90'),(674,10217,'{$TEMP_CRIT_LOW}','5'),(675,10217,'{$TEMP_CRIT}','60'),(676,10217,'{$TEMP_WARN}','50'),(677,10255,'{$DISK_ARRAY_CACHE_BATTERY_CRIT_STATUS}','3'),(678,10255,'{$DISK_ARRAY_CACHE_BATTERY_OK_STATUS}','2'),(679,10255,'{$DISK_ARRAY_CACHE_BATTERY_WARN_STATUS}','4'),(680,10255,'{$DISK_ARRAY_CRIT_STATUS:\"critical\"}','5'),(681,10255,'{$DISK_ARRAY_FAIL_STATUS:\"nonRecoverable\"}','6'),(682,10255,'{$DISK_ARRAY_WARN_STATUS:\"nonCritical\"}','4'),(683,10255,'{$DISK_FAIL_STATUS:\"critical\"}','5'),(684,10255,'{$DISK_FAIL_STATUS:\"nonRecoverable\"}','6'),(685,10255,'{$DISK_SMART_FAIL_STATUS}','1'),(686,10255,'{$DISK_WARN_STATUS:\"nonCritical\"}','4'),(687,10255,'{$FAN_CRIT_STATUS:\"criticalLower\"}','8'),(688,10255,'{$FAN_CRIT_STATUS:\"criticalUpper\"}','5'),(689,10255,'{$FAN_CRIT_STATUS:\"failed\"}','10'),(690,10255,'{$FAN_CRIT_STATUS:\"nonRecoverableLower\"}','9'),(691,10255,'{$FAN_CRIT_STATUS:\"nonRecoverableUpper\"}','6'),(692,10255,'{$FAN_WARN_STATUS:\"nonCriticalLower\"}','7'),(693,10255,'{$FAN_WARN_STATUS:\"nonCriticalUpper\"}','4'),(694,10255,'{$HEALTH_CRIT_STATUS}','5'),(695,10255,'{$HEALTH_DISASTER_STATUS}','6'),(696,10255,'{$HEALTH_WARN_STATUS}','4'),(697,10255,'{$PSU_CRIT_STATUS:\"critical\"}','5'),(698,10255,'{$PSU_CRIT_STATUS:\"nonRecoverable\"}','6'),(699,10255,'{$PSU_WARN_STATUS:\"nonCritical\"}','4'),(700,10255,'{$TEMP_CRIT:\"Ambient\"}','35'),(701,10255,'{$TEMP_CRIT:\"CPU\"}','75'),(702,10255,'{$TEMP_CRIT_LOW}','5'),(703,10255,'{$TEMP_CRIT_STATUS}','5'),(704,10255,'{$TEMP_CRIT}','60'),(705,10255,'{$TEMP_DISASTER_STATUS}','6'),(706,10255,'{$TEMP_WARN:\"Ambient\"}','30'),(707,10255,'{$TEMP_WARN:\"CPU\"}','70'),(708,10255,'{$TEMP_WARN_STATUS}','4'),(709,10255,'{$TEMP_WARN}','50'),(710,10255,'{$VDISK_CRIT_STATUS:\"failed\"}','3'),(711,10255,'{$VDISK_WARN_STATUS:\"degraded\"}','4'),(712,10256,'{$DISK_ARRAY_CACHE_BATTERY_CRIT_STATUS:\"capacitorFailed\"}','7'),(713,10256,'{$DISK_ARRAY_CACHE_BATTERY_CRIT_STATUS:\"failed\"}','4'),(714,10256,'{$DISK_ARRAY_CACHE_BATTERY_WARN_STATUS:\"degraded\"}','5'),(715,10256,'{$DISK_ARRAY_CACHE_BATTERY_WARN_STATUS:\"notPresent\"}','6'),(716,10256,'{$DISK_ARRAY_CACHE_CRIT_STATUS:\"cacheModCriticalFailure\"}','8'),(717,10256,'{$DISK_ARRAY_CACHE_OK_STATUS:\"enabled\"}','3'),(718,10256,'{$DISK_ARRAY_CACHE_WARN_STATUS:\"cacheModDegradedFailsafeSpeed\"}','7'),(719,10256,'{$DISK_ARRAY_CACHE_WARN_STATUS:\"cacheModFlashMemNotAttached\"}','6'),(720,10256,'{$DISK_ARRAY_CACHE_WARN_STATUS:\"cacheReadCacheNotMapped\"}','9'),(721,10256,'{$DISK_ARRAY_CACHE_WARN_STATUS:\"invalid\"}','2'),(722,10256,'{$DISK_ARRAY_CRIT_STATUS}','4'),(723,10256,'{$DISK_ARRAY_WARN_STATUS}','3'),(724,10256,'{$DISK_FAIL_STATUS}','3'),(725,10256,'{$DISK_SMART_FAIL_STATUS:\"replaceDrive\"}','3'),(726,10256,'{$DISK_SMART_FAIL_STATUS:\"replaceDriveSSDWearOut\"}','4'),(727,10256,'{$DISK_WARN_STATUS}','4'),(728,10256,'{$FAN_CRIT_STATUS}','4'),(729,10256,'{$FAN_WARN_STATUS}','3'),(730,10256,'{$HEALTH_CRIT_STATUS}','4'),(731,10256,'{$HEALTH_WARN_STATUS}','3'),(732,10256,'{$PSU_CRIT_STATUS}','4'),(733,10256,'{$PSU_WARN_STATUS}','3'),(734,10256,'{$TEMP_CRIT:\"Ambient\"}','35'),(735,10256,'{$TEMP_CRIT_LOW}','5'),(736,10256,'{$TEMP_CRIT}','60'),(737,10256,'{$TEMP_WARN:\"Ambient\"}','30'),(738,10256,'{$TEMP_WARN}','50'),(739,10256,'{$VDISK_CRIT_STATUS}','3'),(740,10256,'{$VDISK_OK_STATUS}','2'),(741,10257,'{$DISK_OK_STATUS}','Normal'),(742,10257,'{$FAN_OK_STATUS}','Normal'),(743,10257,'{$HEALTH_CRIT_STATUS}','2'),(744,10257,'{$HEALTH_DISASTER_STATUS}','0'),(745,10257,'{$HEALTH_WARN_STATUS}','4'),(746,10257,'{$PSU_OK_STATUS}','Normal'),(747,10257,'{$TEMP_CRIT:\"Ambient\"}','35'),(748,10257,'{$TEMP_CRIT_LOW}','5'),(749,10257,'{$TEMP_CRIT}','60'),(750,10257,'{$TEMP_WARN:\"Ambient\"}','30'),(751,10257,'{$TEMP_WARN}','50'),(752,10258,'{$DISK_OK_STATUS}','Normal'),(753,10258,'{$FAN_OK_STATUS}','Normal'),(754,10258,'{$HEALTH_CRIT_STATUS}','2'),(755,10258,'{$HEALTH_DISASTER_STATUS}','0'),(756,10258,'{$HEALTH_WARN_STATUS}','4'),(757,10258,'{$PSU_OK_STATUS}','Normal'),(758,10258,'{$TEMP_CRIT:\"Ambient\"}','35'),(759,10258,'{$TEMP_CRIT_LOW}','5'),(760,10258,'{$TEMP_CRIT}','60'),(761,10258,'{$TEMP_WARN:\"Ambient\"}','30'),(762,10258,'{$TEMP_WARN}','50'),(763,10259,'{$TEMP_CRIT_LOW}','5'),(764,10259,'{$TEMP_CRIT}','60'),(765,10259,'{$TEMP_WARN}','50'),(766,10260,'{$PROTOCOL_HANDLER_AJP}','ajp-nio-8009'),(767,10260,'{$PROTOCOL_HANDLER_HTTP}','http-nio-8080'),(768,10260,'{$PROTOCOL_HANDLER_HTTPS}','https-openssl-nio-8443'),(769,10261,'{$ADDRESS}',''),(770,10261,'{$PORT}',''),(771,10262,'{$ADDRESS}',''),(772,10262,'{$PORT}','');
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '-1',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(2048) NOT NULL DEFAULT '',
  `snmp_error` varchar(2048) NOT NULL DEFAULT '',
  `jmx_disable_until` int(11) NOT NULL DEFAULT '0',
  `jmx_available` int(11) NOT NULL DEFAULT '0',
  `jmx_errors_from` int(11) NOT NULL DEFAULT '0',
  `jmx_error` varchar(2048) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `tls_connect` int(11) NOT NULL DEFAULT '1',
  `tls_accept` int(11) NOT NULL DEFAULT '1',
  `tls_issuer` varchar(1024) NOT NULL DEFAULT '',
  `tls_subject` varchar(1024) NOT NULL DEFAULT '',
  `tls_psk_identity` varchar(128) NOT NULL DEFAULT '',
  `tls_psk` varchar(512) NOT NULL DEFAULT '',
  `proxy_address` varchar(255) NOT NULL DEFAULT '',
  `auto_compress` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`),
  KEY `hosts_4` (`name`),
  KEY `hosts_5` (`maintenanceid`),
  KEY `c_hosts_3` (`templateid`),
  CONSTRAINT `c_hosts_3` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_hosts_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10001,NULL,'Template OS Linux',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux',0,NULL,'',1,1,'','','','','',1),(10047,NULL,'Template App Zabbix Server',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Server',0,NULL,'',1,1,'','','','','',1),(10048,NULL,'Template App Zabbix Proxy',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Proxy',0,NULL,'',1,1,'','','','','',1),(10050,NULL,'Template App Zabbix Agent',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Agent',0,NULL,'',1,1,'','','','','',1),(10074,NULL,'Template OS OpenBSD',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS OpenBSD',0,NULL,'',1,1,'','','','','',1),(10075,NULL,'Template OS FreeBSD',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS FreeBSD',0,NULL,'',1,1,'','','','','',1),(10076,NULL,'Template OS AIX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS AIX',0,NULL,'',1,1,'','','','','',1),(10077,NULL,'Template OS HP-UX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS HP-UX',0,NULL,'',1,1,'','','','','',1),(10078,NULL,'Template OS Solaris',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Solaris',0,NULL,'',1,1,'','','','','',1),(10079,NULL,'Template OS Mac OS X',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Mac OS X',0,NULL,'',1,1,'','','','','',1),(10081,NULL,'Template OS Windows',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows',0,NULL,'',1,1,'','','','','',1),(10084,NULL,'Zabbix server',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Zabbix server',0,NULL,'',1,1,'','','','','',1),(10093,NULL,'Template App FTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App FTP Service',0,NULL,'',1,1,'','','','','',1),(10094,NULL,'Template App HTTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTP Service',0,NULL,'',1,1,'','','','','',1),(10095,NULL,'Template App HTTPS Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTPS Service',0,NULL,'',1,1,'','','','','',1),(10096,NULL,'Template App IMAP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App IMAP Service',0,NULL,'',1,1,'','','','','',1),(10097,NULL,'Template App LDAP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App LDAP Service',0,NULL,'',1,1,'','','','','',1),(10098,NULL,'Template App NNTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NNTP Service',0,NULL,'',1,1,'','','','','',1),(10099,NULL,'Template App NTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NTP Service',0,NULL,'',1,1,'','','','','',1),(10100,NULL,'Template App POP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App POP Service',0,NULL,'',1,1,'','','','','',1),(10101,NULL,'Template App SMTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SMTP Service',0,NULL,'',1,1,'','','','','',1),(10102,NULL,'Template App SSH Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SSH Service',0,NULL,'',1,1,'','','','','',1),(10103,NULL,'Template App Telnet Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Telnet Service',0,NULL,'',1,1,'','','','','',1),(10169,NULL,'Template App Generic Java JMX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Generic Java JMX',0,NULL,'',1,1,'','','','','',1),(10170,NULL,'Template DB MySQL',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template DB MySQL',0,NULL,'',1,1,'','','','','',1),(10171,NULL,'Template Server Intel SR1530 IPMI',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Intel SR1530 IPMI',0,NULL,'',1,1,'','','','','',1),(10172,NULL,'Template Server Intel SR1630 IPMI',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Intel SR1630 IPMI',0,NULL,'',1,1,'','','','','',1),(10173,NULL,'Template VM VMware',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware',0,NULL,'',1,1,'','','','','',1),(10174,NULL,'Template VM VMware Guest',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware Guest',0,NULL,'',1,1,'','','','','',1),(10175,NULL,'Template VM VMware Hypervisor',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware Hypervisor',0,NULL,'',1,1,'','','','','',1),(10176,NULL,'{#HV.UUID}',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#HV.NAME}',2,NULL,'',1,1,'','','','','',1),(10177,NULL,'{#VM.UUID}',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#VM.NAME}',2,NULL,'',1,1,'','','','','',1),(10182,NULL,'Template Module EtherLike-MIB SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module EtherLike-MIB SNMPv1',0,NULL,'Template EtherLike-MIB (duplex control only) version: 0.15\r\nMIBs used:\r\nEtherLike-MIB',1,1,'','','','','',1),(10183,NULL,'Template Module EtherLike-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module EtherLike-MIB SNMPv2',0,NULL,'Template EtherLike-MIB (duplex control only) version: 0.15\r\nMIBs used:\r\nEtherLike-MIB',1,1,'','','','','',1),(10184,NULL,'Template Module HOST-RESOURCES-MIB SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module HOST-RESOURCES-MIB SNMPv1',0,NULL,'HOST-RESOURCES-MIB: CPU, Memory and Storage version: 0.15\r\nMIBs used:\r\nHOST-RESOURCES-MIB',1,1,'','','','','',1),(10185,NULL,'Template Module HOST-RESOURCES-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module HOST-RESOURCES-MIB SNMPv2',0,NULL,'HOST-RESOURCES-MIB: CPU, Memory and Storage version: 0.15\r\nMIBs used:\r\nHOST-RESOURCES-MIB',1,1,'','','','','',1),(10186,NULL,'Template Module ICMP Ping',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module ICMP Ping',0,NULL,'Template Module ICMP Ping version: 0.15',1,1,'','','','','',1),(10187,NULL,'Template Module Interfaces Simple SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Simple SNMPv1',0,NULL,'Template Interfaces Simple (no ifXTable) version: 0.15\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10188,NULL,'Template Module Interfaces Simple SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Simple SNMPv2',0,NULL,'Template Interfaces Simple (no ifXTable) version: 0.15\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10189,NULL,'Template Module Interfaces SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces SNMPv1',0,NULL,'Template Interfaces version: 0.15\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10190,NULL,'Template Module Interfaces SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces SNMPv2',0,NULL,'Template Interfaces version: 0.15\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10192,NULL,'Template Module Interfaces Windows SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Windows SNMPv2',0,NULL,'Template Interfaces Windows version: 0.15\r\nOverview: Special version of interfaces template that is required for Windows OS. Since MS doesn\'t support 64 bit counters but supports ifAlias and ifHighSpeed.\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10203,NULL,'Template Module Generic SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Generic SNMPv1',0,NULL,'Template Module Generic version: 0.15\r\nMIBs used:\r\nSNMPv2-MIB',1,1,'','','','','',1),(10204,NULL,'Template Module Generic SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Generic SNMPv2',0,NULL,'Template Module Generic version: 0.15\r\nMIBs used:\r\nSNMPv2-MIB',1,1,'','','','','',1),(10207,NULL,'Template Net Alcatel Timetra TiMOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Alcatel Timetra TiMOS SNMPv2',0,NULL,'Template Net Alcatel Timetra TiMOS version: 0.15\r\nMIBs used:\r\nTIMETRA-CHASSIS-MIB\r\nTIMETRA-SYSTEM-MIB\r\nSNMPv2-MIB',1,1,'','','','','',1),(10208,NULL,'Template Net Brocade FC SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade FC SNMPv2',0,NULL,'Template Net Brocade FC version: 0.15\r\nOverview: https://community.brocade.com/dtscp75322/attachments/dtscp75322/fibre/25235/1/FOS_MIB_Reference_v740.pdf\r\nMIBs used:\r\nSW-MIB\r\nKnown Issues:\r\ndescription : no IF-MIB::ifAlias is available\r\nversion : v6.3.1c, v7.0.0c,  v7.4.1c\r\ndevice : all',1,1,'','','','','',1),(10209,NULL,'Template Module Brocade_Foundry Performance SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Brocade_Foundry Performance SNMPv2',0,NULL,'Template Module Brocade_Foundry Performance version: 0.15\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB',1,1,'','','','','',1),(10210,NULL,'Template Net Brocade_Foundry Nonstackable SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade_Foundry Nonstackable SNMPv2',0,NULL,'Template Net Brocade_Foundry Nonstackable version: 0.15\r\nOverview: For devices(old Foundry devices, MLXe and so on) that doesn\'t support Stackable SNMP Tables: snChasFan2Table, snChasPwrSupply2Table,snAgentTemp2Table -\r\nFOUNDRY-SN-AGENT-MIB::snChasFanTable, snChasPwrSupplyTable,snAgentTempTable are used instead.\r\nFor example:\r\nThe objects in table snChasPwrSupply2Table is not supported on the NetIron and the FastIron SX devices.\r\nsnChasFan2Table is not supported on  on the NetIron devices.\r\nsnAgentTemp2Table is not supported on old versions of MLXe\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB',1,1,'','','','','',1),(10211,NULL,'Template Net Brocade_Foundry Stackable SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade_Foundry Stackable SNMPv2',0,NULL,'Template Brocade_Foundry Stackable version: 0.15\r\nOverview: For devices(most of the IronWare Brocade devices) that support Stackable SNMP Tables in FOUNDRY-SN-AGENT-MIB: snChasFan2Table, snChasPwrSupply2Table,snAgentTemp2Table - so objects from all Stack members are provided.\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB\r\nFOUNDRY-SN-STACKING-MIB\r\nKnown Issues:\r\ndescription : Correct fan(returns fan status as \'other(1)\' and temperature (returns 0) for the non-master Switches are not available in SNMP\r\nversion : Version 08.0.40b and above\r\ndevice : ICX 7750 in stack',1,1,'','','','','',1),(10212,NULL,'Template Module Cisco CISCO-MEMORY-POOL-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-MEMORY-POOL-MIB SNMPv2',0,NULL,'Template Cisco CISCO-MEMORY-POOL-MIB version: 0.15\r\nMIBs used:\r\nCISCO-MEMORY-POOL-MIB',1,1,'','','','','',1),(10213,NULL,'Template Module Cisco CISCO-PROCESS-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-PROCESS-MIB SNMPv2',0,NULL,'Template Cisco CISCO-PROCESS-MIB version: 0.15\r\nMIBs used:\r\nCISCO-PROCESS-MIB',1,1,'','','','','',1),(10215,NULL,'Template Module Cisco OLD-CISCO-CPU-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco OLD-CISCO-CPU-MIB SNMPv2',0,NULL,'Template Cisco OLD-CISCO-CPU-MIB version: 0.15\r\nMIBs used:\r\nOLD-CISCO-CPU-MIB',1,1,'','','','','',1),(10216,NULL,'Template Module Cisco Inventory SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco Inventory SNMPv2',0,NULL,'Template Cisco Inventory version: 0.15\r\nMIBs used:\r\nENTITY-MIB\r\nSNMPv2-MIB',1,1,'','','','','',1),(10217,NULL,'Template Module Cisco CISCO-ENVMON-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-ENVMON-MIB SNMPv2',0,NULL,'Template Cisco CISCO-ENVMON-MIB version: 0.15\r\nMIBs used:\r\nCISCO-ENVMON-MIB',1,1,'','','','','',1),(10218,NULL,'Template Net Cisco IOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS SNMPv2',0,NULL,'Template Cisco IOS Software releases 12.2(3.5) or later version: 0.15\r\nKnown Issues:\r\ndescription : no if(in|out)(Errors|Discards) are available for vlan ifType\r\nversion : IOS for example: 12.1(22)EA11, 15.4(3)M2\r\ndevice : C2911, C7600',1,1,'','','','','',1),(10220,NULL,'Template Net Cisco IOS prior to 12.0_3_T SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS prior to 12.0_3_T SNMPv2',0,NULL,'Cisco IOS Software releases prior to 12.0(3)T version: 0.15',1,1,'','','','','',1),(10221,NULL,'Template Net Dell Force S-Series SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Dell Force S-Series SNMPv2',0,NULL,'Template Dell Force S-Series version: 0.15\r\nMIBs used:\r\nF10-S-SERIES-CHASSIS-MIB',1,1,'','','','','',1),(10222,NULL,'Template Net D-Link DES 7200 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net D-Link DES 7200 SNMPv2',0,NULL,'Template D-Link DES 7200 version: 0.15\r\nMIBs used:\r\nMY-PROCESS-MIB\r\nSNMPv2-MIB\r\nMY-MEMORY-MIB\r\nENTITY-MIB\r\nMY-SYSTEM-MIB',1,1,'','','','','',1),(10223,NULL,'Template Net D-Link DES_DGS Switch SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net D-Link DES_DGS Switch SNMPv2',0,NULL,'Template D-Link DES_DGS Switch version: 0.15\r\nMIBs used:\r\nDLINK-AGENT-MIB\r\nSNMPv2-MIB\r\nENTITY-MIB\r\nEQUIPMENT-MIB\r\nKnown Issues:\r\ndescription : D-Link reports missing PSU as fail(4)\r\nversion : Firmware: 1.73R008,hardware revision: B1\r\ndevice : DGS-3420-26SC Gigabit Ethernet Switch',1,1,'','','','','',1),(10224,NULL,'Template Net Extreme EXOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Extreme EXOS SNMPv2',0,NULL,'Template Extreme EXOS version: 0.15\r\nMIBs used:\r\nEXTREME-SOFTWARE-MONITOR-MIB\r\nEXTREME-SYSTEM-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10225,NULL,'Template Net Network Generic Device SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Network Generic Device SNMPv1',0,NULL,'Template Net Network Generic Device version: 0.15\r\nOverview: Use this template if you can\'t find the template for specific vendor or device family.',1,1,'','','','','',1),(10226,NULL,'Template Net Network Generic Device SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Network Generic Device SNMPv2',0,NULL,'Template Net Network Generic Device version: 0.15\r\nOverview: Use this template if you can\'t find the template for specific vendor or device family.',1,1,'','','','','',1),(10227,NULL,'Template Net HP Comware HH3C SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net HP Comware HH3C SNMPv2',0,NULL,'Template Net HP Comware (HH3C) version: 0.15\r\nOverview: http://certifiedgeek.weebly.com/blog/hp-comware-snmp-mib-for-cpu-memory-and-temperature\r\nhttp://www.h3c.com.hk/products___solutions/technology/system_management/configuration_example/200912/656451_57_0.htm\r\nMIBs used:\r\nENTITY-MIB\r\nHH3C-ENTITY-EXT-MIB\r\nKnown Issues:\r\ndescription : No temperature sensors. All entities of them return 0 for HH3C-ENTITY-EXT-MIB::hh3cEntityExtTemperature\r\nversion : 1910-48 Switch Software Version 5.20.99, Release 1116 Copyright(c)2010-2016 Hewlett Packard Enterprise Development LP\r\ndevice : HP 1910-48',1,1,'','','','','',1),(10229,NULL,'Template Net Huawei VRP SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Huawei VRP SNMPv2',0,NULL,'Template Net Huawei VRP version: 0.15\r\nOverview: Reference: https://www.slideshare.net/Huanetwork/huawei-s5700-naming-conventions-and-port-numbering-conventions\r\nReference: http://support.huawei.com/enterprise/KnowledgebaseReadAction.action?contentId=KB1000090234\r\nMIBs used:\r\nHUAWEI-ENTITY-EXTENT-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10230,NULL,'Template Net Intel_Qlogic Infiniband SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Intel_Qlogic Infiniband SNMPv2',0,NULL,'Template Net Intel_Qlogic Infiniband version: 0.15\r\nMIBs used:\r\nICS-CHASSIS-MIB',1,1,'','','','','',1),(10231,NULL,'Template Net Juniper SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Juniper SNMPv2',0,NULL,'Template Net Juniper version: 0.15\r\nMIBs used:\r\nJUNIPER-ALARM-MIB\r\nJUNIPER-MIB\r\nSNMPv2-MIB',1,1,'','','','','',1),(10233,NULL,'Template Net Mikrotik SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Mikrotik SNMPv2',0,NULL,'Template Net Mikrotik version: 0.15\r\nMIBs used:\r\nHOST-RESOURCES-MIB\r\nMIKROTIK-MIB\r\nKnown Issues:\r\ndescription : Doesn\'t have ifHighSpeed filled. fixed in more recent versions\r\nversion : RotuerOS 6.28 or lower\r\ndevice : \r\ndescription : Doesn\'t have any temperature sensors\r\nversion : RotuerOS 6.38.5\r\ndevice : Mikrotik 941-2nD, Mikrotik 951G-2HnD',1,1,'','','','','',1),(10234,NULL,'Template Net Netgear Fastpath SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Netgear Fastpath SNMPv2',0,NULL,'Template Net Netgear Fastpath version: 0.15\r\nOverview: https://kb.netgear.com/24352/MIBs-for-Smart-switches\r\nMIBs used:\r\nFASTPATH-SWITCHING-MIB\r\nFASTPATH-BOXSERVICES-PRIVATE-MIB',1,1,'','','','','',1),(10235,NULL,'Template Net QTech QSW SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net QTech QSW SNMPv2',0,NULL,'Template Net QTech QSW version: 0.15\r\nMIBs used:\r\nQTECH-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10236,NULL,'Template Net TP-LINK SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net TP-LINK SNMPv2',0,NULL,'Template Net TP-LINK JetStream version: 0.15\r\nOverview: Link to MIBs: http://www.tp-linkru.com/download/T2600G-28TS.html#MIBs_Files\r\nSample device overview page: http://www.tp-linkru.com/products/details/cat-39_T2600G-28TS.html#overview\r\nemulation page(web): http://www.tp-linkru.com/resources/simulator/T2600G-28TS(UN)_1.0/Index.htm\r\nMIBs used:\r\nTPLINK-SYSINFO-MIB\r\nTPLINK-SYSMONITOR-MIB\r\nKnown Issues:\r\ndescription : default sysLocation, sysName and sysContact is not filled with proper data. Real hostname and location can be found only in private branch(TPLINK-SYSINFO-MIB). Please check whether this problem exists in the latest firware: http://www.tp-linkru.com/download/T2600G-28TS.html#Firmware\r\nversion : 2.0.0 Build 20170628 Rel.55184(Beta)\r\ndevice : T2600G-28TS 2.0\r\ndescription : The Serial number of the product(tpSysInfoSerialNum) is missing in HW versions prior to V2_170323\r\nversion : prior to version V2_170323\r\ndevice : T2600G-28TS 2.0',1,1,'','','','','',1),(10237,NULL,'Template Net Ubiquiti AirOS SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Ubiquiti AirOS SNMPv1',0,NULL,'Template Net Ubiquiti AirOS version: 0.15\r\nMIBs used:\r\nIEEE802dot11-MIB\r\nFROGFOOT-RESOURCES-MIB\r\nKnown Issues:\r\ndescription : UBNT unifi reports speed: like IF-MIB::ifSpeed.1 = Gauge32: 4294967295 for all interfaces\r\nversion : Firmware: BZ.ar7240.v3.7.51.6230.170322.1513\r\ndevice : UBNT UAP-LR\r\ndescription : UBNT AirMax(NanoStation, NanoBridge etc) reports ifSpeed: as 0 for VLAN and wireless(ath0) interfaces\r\nversion : Firmware: XW.ar934x.v5.6-beta4.22359.140521.1836\r\ndevice : NanoStation M5\r\ndescription : UBNT AirMax(NanoStation, NanoBridge etc) reports always return ifType: as ethernet(6) even for wifi,vlans and other types\r\nversion : Firmware: XW.ar934x.v5.6-beta4.22359.140521.1836\r\ndevice : NanoStation M5\r\ndescription : ifXTable is not provided in IF-MIB. So Interfaces Simple Template is used instead\r\nversion : all above\r\ndevice : NanoStation, UAP-LR',1,1,'','','','','',1),(10248,NULL,'Template OS Linux SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux SNMPv2',0,NULL,'Template OS Linux version: 0.15',1,1,'','','','','',1),(10249,NULL,'Template OS Windows SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows SNMPv2',0,NULL,'Template OS Windows version: 0.15\r\nKnown Issues:\r\ndescription : Doesn\'t support In/Out 64 bit counters even thoug1h IfxTable is present:\r\nCurrently, Windows gets it’s interface status from MIB-2. Since these 64bit SNMP counters (ifHCInOctets, ifHCOutOctets, etc.) are defined as an extension to IF-MIB, Microsoft has not implemented it.\r\nhttps://social.technet.microsoft.com/Forums/windowsserver/en-US/07b62ff0-94f6-40ca-a99d-d129c1b33d70/windows-2008-r2-snmp-64bit-counters-support?forum=winservergen\r\n\r\nversion : Win2008, Win2012R2\r\ndevice : \r\ndescription : Doesn\'t support ifXTable at all\r\nversion : WindowsXP\r\ndevice : \r\ndescription : EtherLike MIB is not supported\r\nversion : *\r\ndevice : *',1,1,'','','','','',1),(10250,NULL,'Template Net HP Enterprise Switch SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net HP Enterprise Switch SNMPv2',0,NULL,'Template Net HP Enterprise Switch version: 0.15\r\nMIBs used:\r\nSEMI-MIB\r\nNETSWITCH-MIB\r\nHP-ICF-CHASSIS\r\nENTITY-SENSORS-MIB\r\nENTITY-MIB\r\nSTATISTICS-MIB',1,1,'','','','','',1),(10251,NULL,'Template Net Mellanox SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Mellanox SNMPv2',0,NULL,'Template Net Mellanox version: 0.15\r\nMIBs used:\r\nENTITY-SENSORS-MIB\r\nENTITY-STATE-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10252,NULL,'Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 SNMPv2',0,NULL,'Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 version: 0.15\r\nMIBs used:\r\nCISCO-PROCESS-MIB',1,1,'','','','','',1),(10253,NULL,'Template Net Cisco IOS versions 12.0_3_T-12.2_3.5 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS versions 12.0_3_T-12.2_3.5 SNMPv2',0,NULL,'Cisco IOS Software releases later to 12.0(3)T and prior to 12.2(3.5) version: 0.15',1,1,'','','','','',1),(10254,NULL,'Template Net Arista SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Arista SNMPv2',0,NULL,'Template Net Arista version: 0.15\r\nMIBs used:\r\nHOST-RESOURCES-MIB\r\nENTITY-SENSORS-MIB\r\nENTITY-STATE-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10255,NULL,'Template Server Dell iDRAC SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Dell iDRAC SNMPv2',0,NULL,'Template Server iDRAC version: 0.15\r\nOverview: for Dell servers with iDRAC controllers\r\nhttp://www.dell.com/support/manuals/us/en/19/dell-openmanage-server-administrator-v8.3/snmp_idrac8/idrac-mib?guid=guid-e686536d-bc8e-4e09-8e8b-de8eb052efee\r\nSupported systems: http://www.dell.com/support/manuals/us/en/04/dell-openmanage-server-administrator-v8.3/snmp_idrac8/supported-systems?guid=guid-f72b75ba-e686-4e8a-b8c5-ca11c7c21381\r\nMIBs used:\r\nIDRAC-MIB-SMIv2',1,1,'','','','','',1),(10256,NULL,'Template Server HP iLO SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server HP iLO SNMPv2',0,NULL,'Template Server HP iLO version: 0.15\r\nOverview: for HP iLO adapters that support SNMP get. Or via operating system, using SNMP HP subagent\r\nMIBs used:\r\nCPQSINFO-MIB\r\nCPQHLTH-MIB\r\nCPQIDA-MIB',1,1,'','','','','',1),(10257,NULL,'Template Server IBM IMM SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server IBM IMM SNMPv1',0,NULL,'Template Server IBM IMM version: 0.15\r\nOverview: for IMM2 and IMM1 IBM serverX hardware\r\nMIBs used:\r\nIMM-MIB\r\nKnown Issues:\r\ndescription : Some IMMs (IMM1) do not return disks\r\nversion : IMM1\r\ndevice : IBM x3250M3\r\ndescription : Some IMMs (IMM1) do not return fan status: fanHealthStatus\r\nversion : IMM1\r\ndevice : IBM x3250M3\r\ndescription : IMM1 servers (M2, M3 generations) sysObjectID is NET-SNMP-MIB::netSnmpAgentOIDs.10\r\nversion : IMM1\r\ndevice : IMM1 servers (M2,M3 generations)\r\ndescription : IMM1 servers (M2, M3 generations) only Ambient temperature sensor available\r\nversion : IMM1\r\ndevice : IMM1 servers (M2,M3 generations)',1,1,'','','','','',1),(10258,NULL,'Template Server IBM IMM SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server IBM IMM SNMPv2',0,NULL,'Template Server IBM IMM version: 0.15\r\nOverview: for IMM2 and IMM1 IBM serverX hardware\r\nMIBs used:\r\nIMM-MIB\r\nKnown Issues:\r\ndescription : Some IMMs (IMM1) do not return disks\r\nversion : IMM1\r\ndevice : IBM x3250M3\r\ndescription : Some IMMs (IMM1) do not return fan status: fanHealthStatus\r\nversion : IMM1\r\ndevice : IBM x3250M3\r\ndescription : IMM1 servers (M2, M3 generations) sysObjectID is NET-SNMP-MIB::netSnmpAgentOIDs.10\r\nversion : IMM1\r\ndevice : IMM1 servers (M2,M3 generations)\r\ndescription : IMM1 servers (M2, M3 generations) only Ambient temperature sensor available\r\nversion : IMM1\r\ndevice : IMM1 servers (M2,M3 generations)',1,1,'','','','','',1),(10259,NULL,'Template Server Supermicro Aten SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Supermicro Aten SNMPv2',0,NULL,'Template Server Supermicro Aten version: 0.15\r\nOverview: for BMC ATEN IPMI controllers of Supermicro servers\r\nhttps://www.supermicro.com/solutions/IPMI.cfm\r\nMIBs used:\r\nATEN-IPMI-MIB',1,1,'','','','','',1),(10260,NULL,'Template App Apache Tomcat JMX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Apache Tomcat JMX',0,NULL,'',1,1,'','','','','',1),(10261,NULL,'Template App Remote Zabbix server',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Remote Zabbix server',0,NULL,'',1,1,'','','','','',1),(10262,NULL,'Template App Remote Zabbix proxy',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Remote Zabbix proxy',0,NULL,'',1,1,'','','','','',1),(10263,NULL,'API ViaCep',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','API ViaCep',0,NULL,'',1,1,'','','','','',1),(10264,NULL,'ViaCep',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','ViaCep',0,NULL,'Cenário web para aplicação ViaCep',1,1,'','','','','',1);
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hostgroupid`),
  UNIQUE KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`),
  CONSTRAINT `c_hosts_groups_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_groups_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (194,10001,10),(189,10047,12),(188,10048,12),(187,10050,8),(196,10074,10),(192,10075,10),(191,10076,10),(193,10077,10),(197,10078,10),(195,10079,10),(198,10081,10),(92,10084,4),(175,10093,8),(178,10094,8),(177,10095,8),(179,10096,8),(180,10097,8),(181,10098,8),(182,10099,8),(183,10100,8),(184,10101,8),(185,10102,8),(186,10103,8),(176,10169,12),(190,10170,13),(199,10171,11),(200,10172,11),(201,10173,14),(202,10174,14),(203,10175,14),(208,10182,8),(209,10183,8),(210,10184,8),(211,10185,8),(212,10186,8),(213,10187,8),(214,10188,8),(215,10189,8),(216,10190,8),(218,10192,8),(229,10203,8),(230,10204,8),(233,10207,9),(234,10208,9),(235,10209,8),(236,10210,9),(237,10211,9),(238,10212,8),(239,10213,8),(241,10215,8),(242,10216,8),(243,10217,8),(244,10218,9),(246,10220,9),(247,10221,9),(248,10222,9),(249,10223,9),(250,10224,9),(251,10225,9),(252,10226,9),(253,10227,9),(255,10229,9),(256,10230,9),(257,10231,9),(259,10233,9),(260,10234,9),(261,10235,9),(262,10236,9),(263,10237,9),(274,10248,10),(275,10249,10),(276,10250,9),(277,10251,9),(278,10252,8),(279,10253,9),(280,10254,9),(281,10255,11),(282,10256,11),(283,10257,11),(284,10258,11),(285,10259,11),(286,10260,12),(287,10261,12),(288,10262,12),(289,10263,15),(290,10264,15);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`),
  CONSTRAINT `c_hosts_templates_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_templates_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
INSERT INTO `hosts_templates` VALUES (4,10001,10050),(31,10074,10050),(32,10075,10050),(33,10076,10050),(34,10077,10050),(35,10078,10050),(36,10079,10050),(37,10081,10050),(39,10084,10001),(38,10084,10047),(131,10176,10175),(132,10177,10174),(133,10203,10186),(134,10204,10186),(136,10207,10183),(135,10207,10190),(137,10207,10204),(138,10208,10190),(139,10208,10204),(141,10210,10190),(142,10210,10204),(140,10210,10209),(144,10211,10190),(145,10211,10204),(143,10211,10209),(151,10218,10183),(150,10218,10190),(152,10218,10204),(149,10218,10212),(148,10218,10213),(146,10218,10216),(147,10218,10217),(163,10220,10204),(161,10220,10212),(162,10220,10215),(159,10220,10216),(160,10220,10217),(165,10221,10183),(164,10221,10190),(166,10221,10204),(167,10222,10190),(168,10222,10204),(170,10223,10183),(169,10223,10190),(171,10223,10204),(173,10224,10183),(172,10224,10190),(174,10224,10204),(176,10225,10182),(175,10225,10187),(177,10225,10203),(179,10226,10183),(178,10226,10188),(180,10226,10204),(182,10227,10183),(181,10227,10190),(183,10227,10204),(189,10229,10183),(188,10229,10190),(190,10229,10204),(191,10230,10190),(192,10230,10204),(194,10231,10183),(193,10231,10190),(195,10231,10204),(200,10233,10190),(201,10233,10204),(202,10234,10190),(203,10234,10204),(205,10235,10183),(204,10235,10190),(206,10235,10204),(207,10236,10188),(208,10236,10204),(209,10237,10187),(210,10237,10203),(213,10248,10183),(211,10248,10185),(212,10248,10190),(214,10248,10204),(215,10249,10185),(216,10249,10192),(217,10249,10204),(219,10250,10183),(218,10250,10190),(220,10250,10204),(221,10251,10185),(222,10251,10190),(223,10251,10204),(228,10253,10190),(229,10253,10204),(226,10253,10212),(224,10253,10216),(225,10253,10217),(227,10253,10252),(230,10254,10183),(232,10254,10190),(231,10254,10204),(233,10255,10204),(234,10256,10204),(235,10257,10203),(236,10258,10204),(237,10259,10204),(238,10263,10001),(239,10263,10094);
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL,
  `tablename` varchar(64) NOT NULL DEFAULT '',
  `field` varchar(64) NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hstgrp`
--

DROP TABLE IF EXISTS `hstgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hstgrp` (
  `groupid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `hstgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hstgrp`
--

LOCK TABLES `hstgrp` WRITE;
/*!40000 ALTER TABLE `hstgrp` DISABLE KEYS */;
INSERT INTO `hstgrp` VALUES (1,'Templates',0,0),(2,'Linux servers',0,0),(4,'Zabbix servers',0,0),(5,'Discovered hosts',1,0),(6,'Virtual machines',0,0),(7,'Hypervisors',0,0),(8,'Templates/Modules',0,0),(9,'Templates/Network devices',0,0),(10,'Templates/Operating systems',0,0),(11,'Templates/Server hardware',0,0),(12,'Templates/Applications',0,0),(13,'Templates/Databases',0,0),(14,'Templates/Virtualization',0,0),(15,'API',0,0);
/*!40000 ALTER TABLE `hstgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `timeout` varchar(255) NOT NULL DEFAULT '15s',
  `posts` text NOT NULL,
  `required` varchar(255) NOT NULL DEFAULT '',
  `status_codes` varchar(255) NOT NULL DEFAULT '',
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `post_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_1` (`httptestid`),
  CONSTRAINT `c_httpstep_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep_field`
--

DROP TABLE IF EXISTS `httpstep_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep_field` (
  `httpstep_fieldid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httpstep_fieldid`),
  KEY `httpstep_field_1` (`httpstepid`),
  CONSTRAINT `c_httpstep_field_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep_field`
--

LOCK TABLES `httpstep_field` WRITE;
/*!40000 ALTER TABLE `httpstep_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_1` (`httpstepid`,`itemid`),
  KEY `httpstepitem_2` (`itemid`),
  CONSTRAINT `c_httpstepitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_httpstepitem_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(255) NOT NULL DEFAULT '1m',
  `status` int(11) NOT NULL DEFAULT '0',
  `agent` varchar(255) NOT NULL DEFAULT 'Zabbix',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) NOT NULL DEFAULT '',
  `http_password` varchar(64) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `http_proxy` varchar(255) NOT NULL DEFAULT '',
  `retries` int(11) NOT NULL DEFAULT '1',
  `ssl_cert_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestid`),
  UNIQUE KEY `httptest_2` (`hostid`,`name`),
  KEY `httptest_1` (`applicationid`),
  KEY `httptest_3` (`status`),
  KEY `httptest_4` (`templateid`),
  CONSTRAINT `c_httptest_3` FOREIGN KEY (`templateid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptest_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`),
  CONSTRAINT `c_httptest_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest_field`
--

DROP TABLE IF EXISTS `httptest_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest_field` (
  `httptest_fieldid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httptest_fieldid`),
  KEY `httptest_field_1` (`httptestid`),
  CONSTRAINT `c_httptest_field_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest_field`
--

LOCK TABLES `httptest_field` WRITE;
/*!40000 ALTER TABLE `httptest_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_1` (`httptestid`,`itemid`),
  KEY `httptestitem_2` (`itemid`),
  CONSTRAINT `c_httptestitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptestitem_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_map`
--

DROP TABLE IF EXISTS `icon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_map` (
  `iconmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `default_iconid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`iconmapid`),
  UNIQUE KEY `icon_map_1` (`name`),
  KEY `icon_map_2` (`default_iconid`),
  CONSTRAINT `c_icon_map_1` FOREIGN KEY (`default_iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_map`
--

LOCK TABLES `icon_map` WRITE;
/*!40000 ALTER TABLE `icon_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_mapping`
--

DROP TABLE IF EXISTS `icon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_mapping` (
  `iconmappingid` bigint(20) unsigned NOT NULL,
  `iconmapid` bigint(20) unsigned NOT NULL,
  `iconid` bigint(20) unsigned NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `expression` varchar(64) NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iconmappingid`),
  KEY `icon_mapping_1` (`iconmapid`),
  KEY `icon_mapping_2` (`iconid`),
  CONSTRAINT `c_icon_mapping_2` FOREIGN KEY (`iconid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_icon_mapping_1` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_mapping`
--

LOCK TABLES `icon_mapping` WRITE;
/*!40000 ALTER TABLE `icon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('actions','actionid',7),('applications','applicationid',1122),('application_template','application_templateid',338),('auditlog','auditid',39),('auditlog_details','auditdetailid',8),('conditions','conditionid',10),('functions','functionid',18156),('graphs','graphid',822),('graphs_items','gitemid',6571),('hosts','hostid',10264),('hosts_groups','hostgroupid',290),('hosts_templates','hosttemplateid',239),('hstgrp','groupid',15),('interface','interfaceid',2),('items','itemid',28680),('items_applications','itemappid',21993),('item_condition','item_conditionid',474),('item_discovery','itemdiscoveryid',1478),('item_preproc','item_preprocid',5622),('media','mediaid',1),('operations','operationid',12),('opmessage_grp','opmessage_grpid',6),('profiles','profileid',113),('triggers','triggerid',15930),('users','userid',3),('users_groups','id',5),('widget_field','widget_fieldid',135);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL,
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `images_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(64) NOT NULL DEFAULT '127.0.0.1',
  `dns` varchar(255) NOT NULL DEFAULT '',
  `port` varchar(64) NOT NULL DEFAULT '10050',
  `bulk` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`interfaceid`),
  KEY `interface_1` (`hostid`,`type`),
  KEY `interface_2` (`ip`,`dns`),
  CONSTRAINT `c_interface_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,10084,1,1,1,'127.0.0.1','','10050',1),(2,10263,1,1,1,'192.168.15.82','','10050',1);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_discovery`
--

DROP TABLE IF EXISTS `interface_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_discovery` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `parent_interfaceid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interfaceid`),
  KEY `c_interface_discovery_2` (`parent_interfaceid`),
  CONSTRAINT `c_interface_discovery_2` FOREIGN KEY (`parent_interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE,
  CONSTRAINT `c_interface_discovery_1` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_discovery`
--

LOCK TABLES `interface_discovery` WRITE;
/*!40000 ALTER TABLE `interface_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_application_prototype`
--

DROP TABLE IF EXISTS `item_application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_application_prototype` (
  `item_application_prototypeid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`item_application_prototypeid`),
  UNIQUE KEY `item_application_prototype_1` (`application_prototypeid`,`itemid`),
  KEY `item_application_prototype_2` (`itemid`),
  CONSTRAINT `c_item_application_prototype_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_application_prototype_1` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_application_prototype`
--

LOCK TABLES `item_application_prototype` WRITE;
/*!40000 ALTER TABLE `item_application_prototype` DISABLE KEYS */;
INSERT INTO `item_application_prototype` VALUES (1,1,23666);
/*!40000 ALTER TABLE `item_application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `item_conditionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '8',
  `macro` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_conditionid`),
  KEY `item_condition_1` (`itemid`),
  CONSTRAINT `c_item_condition_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (1,22444,8,'{#IFNAME}','@Network interfaces for discovery'),(2,22450,8,'{#FSTYPE}','@File systems for discovery'),(4,22867,8,'{#FSTYPE}','@File systems for discovery'),(5,22907,8,'{#FSTYPE}','@File systems for discovery'),(6,22944,8,'{#IFNAME}','@Network interfaces for discovery'),(7,22947,8,'{#FSTYPE}','@File systems for discovery'),(8,22984,8,'{#IFNAME}','@Network interfaces for discovery'),(9,22987,8,'{#FSTYPE}','@File systems for discovery'),(10,23024,8,'{#IFNAME}','@Network interfaces for discovery'),(11,23027,8,'{#FSTYPE}','@File systems for discovery'),(12,23067,8,'{#FSTYPE}','@File systems for discovery'),(13,23162,8,'{#FSTYPE}','@File systems for discovery'),(14,23163,8,'{#IFNAME}','@Network interfaces for discovery'),(15,23329,8,'{#IFNAME}','@Network interfaces for discovery'),(16,23540,8,'{#IFNAME}','@Network interfaces for discovery'),(19,23278,8,'{#IFNAME}','@Network interfaces for discovery'),(20,23279,8,'{#FSTYPE}','@File systems for discovery'),(21,23665,8,'{#SERVICE.NAME}','@Windows service names for discovery'),(22,23665,8,'{#SERVICE.STARTUPNAME}','@Windows service startup states for discovery'),(215,27029,8,'{#IFOPERSTATUS}','1'),(216,27029,8,'{#SNMPVALUE}','(2|3)'),(217,27031,8,'{#IFOPERSTATUS}','1'),(218,27031,8,'{#SNMPVALUE}','(2|3)'),(219,27034,8,'{#STORAGE_TYPE}','.+2$'),(220,27034,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(221,27035,8,'{#STORAGE_TYPE}','.+(4|9)'),(222,27035,8,'{#STORAGE_TYPE}','.+(hrStorageFixedDisk|hrStorageFlashMemory)'),(223,27050,8,'{#STORAGE_TYPE}','.+2$'),(224,27050,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(225,27051,8,'{#STORAGE_TYPE}','.+(4|9)'),(226,27051,8,'{#STORAGE_TYPE}','.+(hrStorageFixedDisk|hrStorageFlashMemory)'),(227,27068,8,'{#IFADMINSTATUS}','(1|3)'),(228,27068,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(229,27078,8,'{#IFADMINSTATUS}','(1|3)'),(230,27078,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(231,27088,8,'{#IFADMINSTATUS}','(1|3)'),(232,27088,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(233,27098,8,'{#IFADMINSTATUS}','(1|3)'),(234,27098,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(237,27118,8,'{#IFADMINSTATUS}','(1|3)'),(238,27118,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(243,27180,8,'{#IFADMINSTATUS}','(1|3)'),(244,27180,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(245,27190,8,'{#IFOPERSTATUS}','1'),(246,27190,8,'{#SNMPVALUE}','(2|3)'),(247,27209,8,'{#TEMP_SENSOR}','1'),(248,27210,8,'{#SNMPVALUE}','[^1]'),(249,27211,8,'{#ENT_SN}','.+'),(250,27215,8,'{#IFADMINSTATUS}','(1|3)'),(251,27215,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(253,27242,8,'{#SENSOR_TYPE}','1'),(254,27243,8,'{#SENSOR_TYPE}','3'),(255,27244,8,'{#SENSOR_TYPE}','2'),(256,27251,8,'{#IFADMINSTATUS}','(1|3)'),(257,27251,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(258,27272,8,'{#IFADMINSTATUS}','(1|3)'),(259,27272,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(260,27321,8,'{#IFADMINSTATUS}','(1|3)'),(261,27321,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(262,27331,8,'{#IFOPERSTATUS}','1'),(263,27331,8,'{#SNMPVALUE}','(2|3)'),(266,27393,8,'{#ENT_SN}','.+'),(267,27393,8,'{#ENT_CLASS}','[^3]'),(268,27399,8,'{#ENT_SN}','.+'),(269,27399,8,'{#ENT_CLASS}','[^3]'),(272,27410,8,'{#ENT_SN}','.+'),(273,27410,8,'{#ENT_CLASS}','[^3]'),(274,27450,8,'{#IFADMINSTATUS}','(1|3)'),(275,27450,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(276,27460,8,'{#IFOPERSTATUS}','1'),(277,27460,8,'{#SNMPVALUE}','(2|3)'),(278,27486,8,'{#IFADMINSTATUS}','(1|3)'),(279,27486,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(280,27520,8,'{#IFADMINSTATUS}','(1|3)'),(281,27520,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(282,27530,8,'{#IFOPERSTATUS}','1'),(283,27530,8,'{#SNMPVALUE}','(2|3)'),(284,27550,8,'{#STATUS}','[^0]'),(285,27551,8,'{#STATUS}','[^0]'),(286,27556,8,'{#IFADMINSTATUS}','(1|3)'),(287,27556,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(288,27566,8,'{#IFOPERSTATUS}','1'),(289,27566,8,'{#SNMPVALUE}','(2|3)'),(290,27596,8,'{#IFADMINSTATUS}','(1|3)'),(291,27596,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(292,27606,8,'{#IFOPERSTATUS}','1'),(293,27606,8,'{#SNMPVALUE}','(2|3)'),(294,27619,8,'{#IFADMINSTATUS}','(1|3)'),(295,27619,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(296,27629,8,'{#IFOPERSTATUS}','1'),(297,27629,8,'{#SNMPVALUE}','(2|3)'),(298,27642,8,'{#IFADMINSTATUS}','(1|3)'),(299,27642,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(300,27652,8,'{#IFOPERSTATUS}','1'),(301,27652,8,'{#SNMPVALUE}','(2|3)'),(302,27665,8,'{#SNMPVALUE}','^(MODULE|Module) (LEVEL|level)1$'),(303,27665,8,'{#SNMPVALUE}','(Fabric|FABRIC) (.+) (Module|MODULE)'),(304,27666,8,'{#SNMPVALUE}','^(MODULE|Module) (LEVEL|level)1$'),(305,27666,8,'{#SNMPVALUE}','(Fabric|FABRIC) (.+) (Module|MODULE)'),(306,27666,8,'{#SNMPVALUE}','(T|t)emperature.*(s|S)ensor'),(307,27667,8,'{#ENT_CLASS}','7'),(308,27668,8,'{#ENT_CLASS}','6'),(309,27669,8,'{#ENT_CLASS}','3'),(323,27722,8,'{#IFADMINSTATUS}','(1|3)'),(324,27722,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(325,27732,8,'{#IFOPERSTATUS}','1'),(326,27732,8,'{#SNMPVALUE}','(2|3)'),(327,27745,8,'{#ENT_NAME}','MPU.*'),(328,27746,8,'{#ENT_CLASS}','3'),(329,27756,8,'{#IFADMINSTATUS}','(1|3)'),(330,27756,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(331,27779,8,'{#SENSOR_TYPE}','2'),(332,27780,8,'{#ENT_CLASS}','2'),(333,27788,8,'{#IFADMINSTATUS}','(1|3)'),(334,27788,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(335,27798,8,'{#IFOPERSTATUS}','1'),(336,27798,8,'{#SNMPVALUE}','(2|3)'),(337,27815,8,'{#SNMPVALUE}','Routing Engine.*'),(338,27816,8,'{#SNMPVALUE}','[^0]+'),(350,27872,8,'{#IFADMINSTATUS}','(1|3)'),(351,27872,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(352,27903,8,'{#STORAGE_TYPE}','.+4$'),(353,27903,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(354,27909,8,'{#IFADMINSTATUS}','(1|3)'),(355,27909,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(356,27944,8,'{#IFADMINSTATUS}','(1|3)'),(357,27944,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(358,27954,8,'{#IFOPERSTATUS}','1'),(359,27954,8,'{#SNMPVALUE}','(2|3)'),(360,27976,8,'{#IFADMINSTATUS}','(1|3)'),(361,27976,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(362,28005,8,'{#IFADMINSTATUS}','(1|3)'),(363,28005,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(364,28043,8,'{#STORAGE_TYPE}','.+2$'),(365,28043,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(366,28044,8,'{#STORAGE_TYPE}','.+(4|9)'),(367,28044,8,'{#STORAGE_TYPE}','.+(hrStorageFixedDisk|hrStorageFlashMemory)'),(368,28058,8,'{#IFADMINSTATUS}','(1|3)'),(369,28058,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(370,28068,8,'{#IFOPERSTATUS}','1'),(371,28068,8,'{#SNMPVALUE}','(2|3)'),(372,28082,8,'{#STORAGE_TYPE}','.+2$'),(373,28082,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(374,28083,8,'{#STORAGE_TYPE}','.+(4|9)'),(375,28083,8,'{#STORAGE_TYPE}','.+(hrStorageFixedDisk|hrStorageFlashMemory)'),(376,28097,8,'{#IFADMINSTATUS}','(1|3)'),(377,28097,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(378,28118,8,'{#IFADMINSTATUS}','(1|3)'),(379,28118,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(380,28128,8,'{#IFOPERSTATUS}','1'),(381,28128,8,'{#SNMPVALUE}','(2|3)'),(382,28144,8,'{#SENSOR_TYPE}','8'),(383,28144,8,'{#SENSOR_PRECISION}','0'),(384,28146,8,'{#ENT_CLASS}','.+8.3.2$'),(385,28146,8,'{#ENT_STATUS}','(1|2|3|4)'),(386,28147,8,'{#ENT_CLASS}','.+8.3.1$'),(387,28147,8,'{#ENT_STATUS}','(1|2|3|4)'),(388,28148,8,'{#ENT_CLASS}','.+8.3.3$'),(389,28148,8,'{#ENT_STATUS}','(1|2|3|4)'),(390,28149,8,'{#ENT_CLASS}','3'),(391,28160,8,'{#STORAGE_TYPE}','.+2$'),(392,28160,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(393,28161,8,'{#STORAGE_TYPE}','.+(4|9)'),(394,28161,8,'{#STORAGE_TYPE}','.+(hrStorageFixedDisk|hrStorageFlashMemory)'),(395,28175,8,'{#IFADMINSTATUS}','(1|3)'),(396,28175,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(397,28196,8,'{#SENSOR_TYPE}','8'),(398,28196,8,'{#SENSOR_PRECISION}','1'),(399,28197,8,'{#SNMPVALUE}','10'),(400,28198,8,'{#ENT_CLASS}','3'),(401,28199,8,'{#ENT_CLASS}','6'),(402,28207,8,'{#ENT_SN}','.+'),(403,28207,8,'{#ENT_CLASS}','[^3]'),(404,28223,8,'{#IFADMINSTATUS}','(1|3)'),(405,28223,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(406,27088,8,'{#IFNAME}','@Network interfaces for discovery'),(407,27098,8,'{#IFNAME}','@Network interfaces for discovery'),(408,27180,8,'{#IFNAME}','@Network interfaces for discovery'),(409,27215,8,'{#IFNAME}','@Network interfaces for discovery'),(410,27251,8,'{#IFNAME}','@Network interfaces for discovery'),(411,27272,8,'{#IFNAME}','@Network interfaces for discovery'),(412,27321,8,'{#IFNAME}','@Network interfaces for discovery'),(413,27450,8,'{#IFNAME}','@Network interfaces for discovery'),(414,27486,8,'{#IFNAME}','@Network interfaces for discovery'),(415,27520,8,'{#IFNAME}','@Network interfaces for discovery'),(416,27556,8,'{#IFNAME}','@Network interfaces for discovery'),(417,27642,8,'{#IFNAME}','@Network interfaces for discovery'),(418,27722,8,'{#IFNAME}','@Network interfaces for discovery'),(419,27756,8,'{#IFNAME}','@Network interfaces for discovery'),(420,27788,8,'{#IFNAME}','@Network interfaces for discovery'),(421,27872,8,'{#IFNAME}','@Network interfaces for discovery'),(422,27909,8,'{#IFNAME}','@Network interfaces for discovery'),(423,27944,8,'{#IFNAME}','@Network interfaces for discovery'),(424,28058,8,'{#IFNAME}','@Network interfaces for discovery'),(425,28118,8,'{#IFNAME}','@Network interfaces for discovery'),(426,28175,8,'{#IFNAME}','@Network interfaces for discovery'),(427,28223,8,'{#IFNAME}','@Network interfaces for discovery'),(428,27068,8,'{#IFNAME}','@Network interfaces for discovery'),(429,27596,8,'{#IFNAME}','@Network interfaces for discovery'),(430,28005,8,'{#IFNAME}','@Network interfaces for discovery'),(431,27078,8,'{#IFNAME}','@Network interfaces for discovery'),(432,27619,8,'{#IFNAME}','@Network interfaces for discovery'),(433,27976,8,'{#IFNAME}','@Network interfaces for discovery'),(434,27118,8,'{#IFNAME}','@Network interfaces for discovery'),(435,28097,8,'{#IFNAME}','@Network interfaces for discovery'),(436,28280,8,'{#IFOPERSTATUS}','1'),(437,28280,8,'{#SNMPVALUE}','(2|3)'),(438,28293,8,'{#IFADMINSTATUS}','(1|3)'),(439,28293,8,'{#IFOPERSTATUS}','(1|2|3|4|5|7)'),(440,28293,8,'{#IFNAME}','@Network interfaces for discovery'),(441,28303,8,'{#DEVICE_TYPE}','.+3$'),(442,28303,8,'{#DEVICE_TYPE}','.+hrDeviceProcessor'),(443,28304,8,'{#STORAGE_TYPE}','.+2$'),(444,28304,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(445,28304,8,'{#SNMPVALUE}','^RAM$'),(446,28305,8,'{#STORAGE_TYPE}','.+(4|9)$'),(447,28305,8,'{#STORAGE_TYPE}','.+(hrStorageFixedDisk|hrStorageFlashMemory)'),(448,28306,8,'{#SENSOR_TYPE}','8'),(449,28306,8,'{#SENSOR_PRECISION}','1'),(450,28307,8,'{#SNMPVALUE}','10'),(451,28308,8,'{#ENT_CLASS}','3'),(452,28309,8,'{#ENT_CLASS}','6'),(453,28346,8,'{#SENSOR_LOCALE}','.*CPU.*'),(454,28347,8,'{#SENSOR_LOCALE}','.*Inlet Temp.*'),(455,28349,8,'{#TYPE}','3'),(456,28392,8,'{#SENSOR_LOCALE}','(4|8|9|12|13)'),(457,28393,8,'{#SNMPINDEX}','0\\.1'),(458,28393,8,'{#SENSOR_LOCALE}','11'),(459,28394,8,'{#SENSOR_LOCALE}','6'),(460,28395,8,'{#SENSOR_LOCALE}','7'),(461,28396,8,'{#SENSOR_LOCALE}','10'),(462,28397,8,'{#SENSOR_LOCALE}','3'),(463,28440,8,'{#SNMPVALUE}','(DIMM|PSU|PCH|RAID|RR|PCI).*'),(464,28441,8,'{#SNMPVALUE}','Ambient.*'),(465,28442,8,'{#SNMPVALUE}','CPU [0-9]* Temp'),(466,28468,8,'{#SNMPVALUE}','(DIMM|PSU|PCH|RAID|RR|PCI).*'),(467,28469,8,'{#SNMPVALUE}','Ambient.*'),(468,28470,8,'{#SNMPVALUE}','CPU [0-9]* Temp'),(469,28493,8,'{#SNMPVALUE}','[1-9]+'),(470,28493,8,'{#SENSOR_DESCR}','.*Temp.*'),(471,28494,8,'{#SNMPVALUE}','[1-9]+'),(472,28494,8,'{#SENSOR_DESCR}','FAN.*'),(473,28608,8,'{#IFNAME}','@Network interfaces for discovery'),(474,28609,8,'{#FSTYPE}','@File systems for discovery');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discovery`
--

DROP TABLE IF EXISTS `item_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discovery` (
  `itemdiscoveryid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `parent_itemid` bigint(20) unsigned NOT NULL,
  `key_` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemdiscoveryid`),
  UNIQUE KEY `item_discovery_1` (`itemid`,`parent_itemid`),
  KEY `item_discovery_2` (`parent_itemid`),
  CONSTRAINT `c_item_discovery_2` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_discovery_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discovery`
--

LOCK TABLES `item_discovery` WRITE;
/*!40000 ALTER TABLE `item_discovery` DISABLE KEYS */;
INSERT INTO `item_discovery` VALUES (1,22446,22444,'',0,0),(3,22448,22444,'',0,0),(5,22452,22450,'',0,0),(7,22454,22450,'',0,0),(9,22456,22450,'',0,0),(11,22458,22450,'',0,0),(65,22686,22450,'',0,0),(135,22868,22867,'',0,0),(136,22869,22867,'',0,0),(137,22870,22867,'',0,0),(138,22871,22867,'',0,0),(139,22872,22867,'',0,0),(142,22908,22907,'',0,0),(143,22909,22907,'',0,0),(144,22910,22907,'',0,0),(145,22911,22907,'',0,0),(146,22912,22907,'',0,0),(147,22945,22944,'',0,0),(148,22946,22944,'',0,0),(149,22948,22947,'',0,0),(150,22949,22947,'',0,0),(151,22950,22947,'',0,0),(152,22951,22947,'',0,0),(153,22952,22947,'',0,0),(154,22985,22984,'',0,0),(155,22986,22984,'',0,0),(156,22988,22987,'',0,0),(157,22989,22987,'',0,0),(158,22990,22987,'',0,0),(159,22991,22987,'',0,0),(160,22992,22987,'',0,0),(161,23025,23024,'',0,0),(162,23026,23024,'',0,0),(163,23028,23027,'',0,0),(164,23029,23027,'',0,0),(165,23030,23027,'',0,0),(166,23031,23027,'',0,0),(167,23032,23027,'',0,0),(170,23068,23067,'',0,0),(171,23069,23067,'',0,0),(172,23070,23067,'',0,0),(173,23071,23067,'',0,0),(174,23072,23067,'',0,0),(175,23164,23162,'',0,0),(176,23165,23162,'',0,0),(178,23167,23162,'',0,0),(179,23168,23162,'',0,0),(180,23169,23163,'',0,0),(181,23170,23163,'',0,0),(182,23280,23278,'',0,0),(183,23281,23278,'',0,0),(184,23282,23279,'',0,0),(185,23283,23279,'',0,0),(186,23284,23279,'',0,0),(187,23285,23279,'',0,0),(188,23286,23279,'',0,0),(189,23073,23540,'',0,0),(190,23074,23540,'',0,0),(191,23075,23329,'',0,0),(192,23076,23329,'',0,0),(220,23666,23665,'',0,0),(746,26994,26987,'',0,0),(747,26995,26990,'',0,0),(748,26996,26990,'',0,0),(749,26997,26990,'',0,0),(750,26998,26990,'',0,0),(751,26999,26991,'',0,0),(752,27000,26991,'',0,0),(753,27001,26991,'',0,0),(754,27002,26991,'',0,0),(755,27003,26992,'',0,0),(756,27004,26992,'',0,0),(757,27005,26992,'',0,0),(758,27006,26992,'',0,0),(759,27007,26993,'',0,0),(760,27008,26993,'',0,0),(761,27009,26993,'',0,0),(762,27010,26993,'',0,0),(775,27030,27029,'',0,0),(776,27032,27031,'',0,0),(777,27036,27033,'',0,0),(778,27037,27034,'',0,0),(779,27038,27034,'',0,0),(780,27039,27034,'',0,0),(781,27040,27034,'',0,0),(782,27041,27034,'',0,0),(783,27042,27034,'',0,0),(784,27043,27035,'',0,0),(785,27044,27035,'',0,0),(786,27045,27035,'',0,0),(787,27046,27035,'',0,0),(788,27047,27035,'',0,0),(789,27048,27035,'',0,0),(790,27052,27049,'',0,0),(791,27053,27050,'',0,0),(792,27054,27050,'',0,0),(793,27055,27050,'',0,0),(794,27056,27050,'',0,0),(795,27057,27050,'',0,0),(796,27058,27050,'',0,0),(797,27059,27051,'',0,0),(798,27060,27051,'',0,0),(799,27061,27051,'',0,0),(800,27062,27051,'',0,0),(801,27063,27051,'',0,0),(802,27064,27051,'',0,0),(803,27069,27068,'',0,0),(804,27070,27068,'',0,0),(805,27071,27068,'',0,0),(806,27072,27068,'',0,0),(807,27073,27068,'',0,0),(808,27074,27068,'',0,0),(809,27075,27068,'',0,0),(810,27076,27068,'',0,0),(811,27077,27068,'',0,0),(812,27079,27078,'',0,0),(813,27080,27078,'',0,0),(814,27081,27078,'',0,0),(815,27082,27078,'',0,0),(816,27083,27078,'',0,0),(817,27084,27078,'',0,0),(818,27085,27078,'',0,0),(819,27086,27078,'',0,0),(820,27087,27078,'',0,0),(821,27089,27088,'',0,0),(822,27090,27088,'',0,0),(823,27091,27088,'',0,0),(824,27092,27088,'',0,0),(825,27093,27088,'',0,0),(826,27094,27088,'',0,0),(827,27095,27088,'',0,0),(828,27096,27088,'',0,0),(829,27097,27088,'',0,0),(830,27099,27098,'',0,0),(831,27100,27098,'',0,0),(832,27101,27098,'',0,0),(833,27102,27098,'',0,0),(834,27103,27098,'',0,0),(835,27104,27098,'',0,0),(836,27105,27098,'',0,0),(837,27106,27098,'',0,0),(838,27107,27098,'',0,0),(848,27119,27118,'',0,0),(849,27120,27118,'',0,0),(850,27121,27118,'',0,0),(851,27122,27118,'',0,0),(852,27123,27118,'',0,0),(853,27124,27118,'',0,0),(854,27125,27118,'',0,0),(855,27126,27118,'',0,0),(856,27127,27118,'',0,0),(875,27181,27180,'',0,0),(876,27182,27180,'',0,0),(877,27183,27180,'',0,0),(878,27184,27180,'',0,0),(879,27185,27180,'',0,0),(880,27186,27180,'',0,0),(881,27187,27180,'',0,0),(882,27188,27180,'',0,0),(883,27189,27180,'',0,0),(884,27191,27190,'',0,0),(885,27212,27209,'',0,0),(886,27213,27210,'',0,0),(887,27214,27211,'',0,0),(888,27216,27215,'',0,0),(889,27217,27215,'',0,0),(890,27218,27215,'',0,0),(891,27219,27215,'',0,0),(892,27220,27215,'',0,0),(893,27221,27215,'',0,0),(894,27222,27215,'',0,0),(895,27223,27215,'',0,0),(896,27224,27215,'',0,0),(898,27246,27242,'',0,0),(899,27247,27242,'',0,0),(900,27248,27243,'',0,0),(901,27249,27244,'',0,0),(902,27250,27244,'',0,0),(903,27252,27251,'',0,0),(904,27253,27251,'',0,0),(905,27254,27251,'',0,0),(906,27255,27251,'',0,0),(907,27256,27251,'',0,0),(908,27257,27251,'',0,0),(909,27258,27251,'',0,0),(910,27259,27251,'',0,0),(911,27260,27251,'',0,0),(912,27273,27272,'',0,0),(913,27274,27272,'',0,0),(914,27275,27272,'',0,0),(915,27276,27272,'',0,0),(916,27277,27272,'',0,0),(917,27278,27272,'',0,0),(918,27279,27272,'',0,0),(919,27280,27272,'',0,0),(920,27281,27272,'',0,0),(921,27312,27302,'',0,0),(922,27313,27303,'',0,0),(923,27314,27304,'',0,0),(924,27315,27306,'',0,0),(925,27316,27307,'',0,0),(926,27317,27308,'',0,0),(927,27318,27309,'',0,0),(928,27319,27310,'',0,0),(929,27320,27311,'',0,0),(930,27322,27321,'',0,0),(931,27323,27321,'',0,0),(932,27324,27321,'',0,0),(933,27325,27321,'',0,0),(934,27326,27321,'',0,0),(935,27327,27321,'',0,0),(936,27328,27321,'',0,0),(937,27329,27321,'',0,0),(938,27330,27321,'',0,0),(939,27332,27331,'',0,0),(949,27414,27390,'',0,0),(950,27415,27390,'',0,0),(951,27416,27390,'',0,0),(952,27417,27391,'',0,0),(954,27419,27393,'',0,0),(955,27420,27394,'',0,0),(956,27421,27394,'',0,0),(957,27422,27395,'',0,0),(958,27423,27396,'',0,0),(959,27424,27397,'',0,0),(960,27425,27397,'',0,0),(961,27426,27397,'',0,0),(962,27427,27398,'',0,0),(963,27428,27399,'',0,0),(964,27429,27400,'',0,0),(965,27430,27400,'',0,0),(966,27431,27401,'',0,0),(967,27432,27402,'',0,0),(977,27442,27409,'',0,0),(978,27443,27409,'',0,0),(979,27444,27409,'',0,0),(980,27445,27410,'',0,0),(981,27446,27411,'',0,0),(982,27447,27411,'',0,0),(983,27448,27412,'',0,0),(984,27449,27413,'',0,0),(985,27451,27450,'',0,0),(986,27452,27450,'',0,0),(987,27453,27450,'',0,0),(988,27454,27450,'',0,0),(989,27455,27450,'',0,0),(990,27456,27450,'',0,0),(991,27457,27450,'',0,0),(992,27458,27450,'',0,0),(993,27459,27450,'',0,0),(994,27461,27460,'',0,0),(995,27477,27473,'',0,0),(996,27478,27473,'',0,0),(997,27479,27474,'',0,0),(998,27480,27475,'',0,0),(999,27481,27476,'',0,0),(1000,27482,27476,'',0,0),(1001,27483,27476,'',0,0),(1002,27484,27476,'',0,0),(1003,27485,27476,'',0,0),(1004,27487,27486,'',0,0),(1005,27488,27486,'',0,0),(1006,27489,27486,'',0,0),(1007,27490,27486,'',0,0),(1008,27491,27486,'',0,0),(1009,27492,27486,'',0,0),(1010,27493,27486,'',0,0),(1011,27494,27486,'',0,0),(1012,27495,27486,'',0,0),(1013,27516,27512,'',0,0),(1014,27517,27513,'',0,0),(1015,27518,27514,'',0,0),(1016,27519,27515,'',0,0),(1017,27521,27520,'',0,0),(1018,27522,27520,'',0,0),(1019,27523,27520,'',0,0),(1020,27524,27520,'',0,0),(1021,27525,27520,'',0,0),(1022,27526,27520,'',0,0),(1023,27527,27520,'',0,0),(1024,27528,27520,'',0,0),(1025,27529,27520,'',0,0),(1026,27531,27530,'',0,0),(1027,27552,27548,'',0,0),(1028,27553,27549,'',0,0),(1029,27554,27550,'',0,0),(1030,27555,27551,'',0,0),(1031,27557,27556,'',0,0),(1032,27558,27556,'',0,0),(1033,27559,27556,'',0,0),(1034,27560,27556,'',0,0),(1035,27561,27556,'',0,0),(1036,27562,27556,'',0,0),(1037,27563,27556,'',0,0),(1038,27564,27556,'',0,0),(1039,27565,27556,'',0,0),(1040,27567,27566,'',0,0),(1041,27590,27587,'',0,0),(1042,27591,27587,'',0,0),(1043,27592,27587,'',0,0),(1044,27593,27588,'',0,0),(1045,27594,27589,'',0,0),(1046,27595,27589,'',0,0),(1047,27597,27596,'',0,0),(1048,27598,27596,'',0,0),(1049,27599,27596,'',0,0),(1050,27600,27596,'',0,0),(1051,27601,27596,'',0,0),(1052,27602,27596,'',0,0),(1053,27603,27596,'',0,0),(1054,27604,27596,'',0,0),(1055,27605,27596,'',0,0),(1056,27607,27606,'',0,0),(1057,27620,27619,'',0,0),(1058,27621,27619,'',0,0),(1059,27622,27619,'',0,0),(1060,27623,27619,'',0,0),(1061,27624,27619,'',0,0),(1062,27625,27619,'',0,0),(1063,27626,27619,'',0,0),(1064,27627,27619,'',0,0),(1065,27628,27619,'',0,0),(1066,27630,27629,'',0,0),(1067,27643,27642,'',0,0),(1068,27644,27642,'',0,0),(1069,27645,27642,'',0,0),(1070,27646,27642,'',0,0),(1071,27647,27642,'',0,0),(1072,27648,27642,'',0,0),(1073,27649,27642,'',0,0),(1074,27650,27642,'',0,0),(1075,27651,27642,'',0,0),(1076,27653,27652,'',0,0),(1077,27670,27665,'',0,0),(1078,27671,27665,'',0,0),(1079,27672,27666,'',0,0),(1080,27673,27667,'',0,0),(1081,27674,27668,'',0,0),(1082,27675,27669,'',0,0),(1083,27676,27669,'',0,0),(1084,27677,27669,'',0,0),(1085,27678,27669,'',0,0),(1086,27679,27669,'',0,0),(1107,27723,27722,'',0,0),(1108,27724,27722,'',0,0),(1109,27725,27722,'',0,0),(1110,27726,27722,'',0,0),(1111,27727,27722,'',0,0),(1112,27728,27722,'',0,0),(1113,27729,27722,'',0,0),(1114,27730,27722,'',0,0),(1115,27731,27722,'',0,0),(1116,27733,27732,'',0,0),(1117,27748,27745,'',0,0),(1118,27749,27745,'',0,0),(1119,27750,27745,'',0,0),(1120,27751,27745,'',0,0),(1121,27752,27745,'',0,0),(1122,27753,27745,'',0,0),(1123,27754,27746,'',0,0),(1124,27755,27747,'',0,0),(1125,27757,27756,'',0,0),(1126,27758,27756,'',0,0),(1127,27759,27756,'',0,0),(1128,27760,27756,'',0,0),(1129,27761,27756,'',0,0),(1130,27762,27756,'',0,0),(1131,27763,27756,'',0,0),(1132,27764,27756,'',0,0),(1133,27765,27756,'',0,0),(1134,27783,27779,'',0,0),(1135,27784,27779,'',0,0),(1136,27785,27780,'',0,0),(1137,27786,27781,'',0,0),(1138,27787,27782,'',0,0),(1139,27789,27788,'',0,0),(1140,27790,27788,'',0,0),(1141,27791,27788,'',0,0),(1142,27792,27788,'',0,0),(1143,27793,27788,'',0,0),(1144,27794,27788,'',0,0),(1145,27795,27788,'',0,0),(1146,27796,27788,'',0,0),(1147,27797,27788,'',0,0),(1148,27799,27798,'',0,0),(1149,27819,27815,'',0,0),(1150,27820,27815,'',0,0),(1151,27821,27816,'',0,0),(1152,27822,27817,'',0,0),(1153,27823,27818,'',0,0),(1183,27873,27872,'',0,0),(1184,27874,27872,'',0,0),(1185,27875,27872,'',0,0),(1186,27876,27872,'',0,0),(1187,27877,27872,'',0,0),(1188,27878,27872,'',0,0),(1189,27879,27872,'',0,0),(1190,27880,27872,'',0,0),(1191,27881,27872,'',0,0),(1192,27904,27901,'',0,0),(1193,27905,27902,'',0,0),(1194,27906,27903,'',0,0),(1195,27907,27903,'',0,0),(1196,27908,27903,'',0,0),(1197,27910,27909,'',0,0),(1198,27911,27909,'',0,0),(1199,27912,27909,'',0,0),(1200,27913,27909,'',0,0),(1201,27914,27909,'',0,0),(1202,27915,27909,'',0,0),(1203,27916,27909,'',0,0),(1204,27917,27909,'',0,0),(1205,27918,27909,'',0,0),(1206,27940,27937,'',0,0),(1207,27941,27937,'',0,0),(1208,27942,27938,'',0,0),(1209,27943,27939,'',0,0),(1210,27945,27944,'',0,0),(1211,27946,27944,'',0,0),(1212,27947,27944,'',0,0),(1213,27948,27944,'',0,0),(1214,27949,27944,'',0,0),(1215,27950,27944,'',0,0),(1216,27951,27944,'',0,0),(1217,27952,27944,'',0,0),(1218,27953,27944,'',0,0),(1219,27955,27954,'',0,0),(1220,27977,27976,'',0,0),(1221,27978,27976,'',0,0),(1222,27979,27976,'',0,0),(1223,27980,27976,'',0,0),(1224,27981,27976,'',0,0),(1225,27982,27976,'',0,0),(1226,27983,27976,'',0,0),(1227,27984,27976,'',0,0),(1228,27985,27976,'',0,0),(1229,28003,28001,'',0,0),(1230,28004,28002,'',0,0),(1231,28006,28005,'',0,0),(1232,28007,28005,'',0,0),(1233,28008,28005,'',0,0),(1234,28009,28005,'',0,0),(1235,28010,28005,'',0,0),(1236,28011,28005,'',0,0),(1237,28012,28005,'',0,0),(1238,28013,28005,'',0,0),(1239,28014,28005,'',0,0),(1240,28045,28042,'',0,0),(1241,28046,28044,'',0,0),(1242,28047,28044,'',0,0),(1243,28048,28044,'',0,0),(1244,28049,28044,'',0,0),(1245,28050,28044,'',0,0),(1246,28051,28044,'',0,0),(1247,28052,28043,'',0,0),(1248,28053,28043,'',0,0),(1249,28054,28043,'',0,0),(1250,28055,28043,'',0,0),(1251,28056,28043,'',0,0),(1252,28057,28043,'',0,0),(1253,28059,28058,'',0,0),(1254,28060,28058,'',0,0),(1255,28061,28058,'',0,0),(1256,28062,28058,'',0,0),(1257,28063,28058,'',0,0),(1258,28064,28058,'',0,0),(1259,28065,28058,'',0,0),(1260,28066,28058,'',0,0),(1261,28067,28058,'',0,0),(1262,28069,28068,'',0,0),(1263,28084,28081,'',0,0),(1264,28085,28083,'',0,0),(1265,28086,28083,'',0,0),(1266,28087,28083,'',0,0),(1267,28088,28083,'',0,0),(1268,28089,28083,'',0,0),(1269,28090,28083,'',0,0),(1270,28091,28082,'',0,0),(1271,28092,28082,'',0,0),(1272,28093,28082,'',0,0),(1273,28094,28082,'',0,0),(1274,28095,28082,'',0,0),(1275,28096,28082,'',0,0),(1276,28098,28097,'',0,0),(1277,28099,28097,'',0,0),(1278,28100,28097,'',0,0),(1279,28101,28097,'',0,0),(1280,28102,28097,'',0,0),(1281,28103,28097,'',0,0),(1282,28104,28097,'',0,0),(1283,28105,28097,'',0,0),(1284,28106,28097,'',0,0),(1285,28119,28118,'',0,0),(1286,28120,28118,'',0,0),(1287,28121,28118,'',0,0),(1288,28122,28118,'',0,0),(1289,28123,28118,'',0,0),(1290,28124,28118,'',0,0),(1291,28125,28118,'',0,0),(1292,28126,28118,'',0,0),(1293,28127,28118,'',0,0),(1294,28129,28128,'',0,0),(1295,28150,28144,'',0,0),(1296,28151,28145,'',0,0),(1297,28152,28145,'',0,0),(1298,28153,28145,'',0,0),(1299,28154,28146,'',0,0),(1300,28155,28147,'',0,0),(1301,28156,28148,'',0,0),(1302,28157,28149,'',0,0),(1303,28158,28149,'',0,0),(1304,28162,28159,'',0,0),(1305,28163,28161,'',0,0),(1306,28164,28161,'',0,0),(1307,28165,28161,'',0,0),(1308,28166,28161,'',0,0),(1309,28167,28161,'',0,0),(1310,28168,28161,'',0,0),(1311,28169,28160,'',0,0),(1312,28170,28160,'',0,0),(1313,28171,28160,'',0,0),(1314,28172,28160,'',0,0),(1315,28173,28160,'',0,0),(1316,28174,28160,'',0,0),(1317,28176,28175,'',0,0),(1318,28177,28175,'',0,0),(1319,28178,28175,'',0,0),(1320,28179,28175,'',0,0),(1321,28180,28175,'',0,0),(1322,28181,28175,'',0,0),(1323,28182,28175,'',0,0),(1324,28183,28175,'',0,0),(1325,28184,28175,'',0,0),(1326,28200,28196,'',0,0),(1327,28201,28196,'',0,0),(1328,28202,28197,'',0,0),(1329,28203,28197,'',0,0),(1330,28204,28198,'',0,0),(1331,28205,28198,'',0,0),(1332,28206,28199,'',0,0),(1333,28208,28207,'',0,0),(1334,28215,28212,'',0,0),(1335,28216,28213,'',0,0),(1336,28217,28214,'',0,0),(1337,28218,28214,'',0,0),(1338,28220,28219,'',0,0),(1339,28221,28219,'',0,0),(1340,28222,28219,'',0,0),(1341,28224,28223,'',0,0),(1342,28225,28223,'',0,0),(1343,28226,28223,'',0,0),(1344,28227,28223,'',0,0),(1345,28228,28223,'',0,0),(1346,28229,28223,'',0,0),(1347,28230,28223,'',0,0),(1348,28231,28223,'',0,0),(1349,28232,28223,'',0,0),(1350,28246,28244,'',0,0),(1351,28247,28245,'',0,0),(1352,28281,28280,'',0,0),(1353,28294,28293,'',0,0),(1354,28295,28293,'',0,0),(1355,28296,28293,'',0,0),(1356,28297,28293,'',0,0),(1357,28298,28293,'',0,0),(1358,28299,28293,'',0,0),(1359,28300,28293,'',0,0),(1360,28301,28293,'',0,0),(1361,28302,28293,'',0,0),(1362,28310,28303,'',0,0),(1363,28311,28304,'',0,0),(1364,28312,28304,'',0,0),(1365,28313,28304,'',0,0),(1366,28314,28304,'',0,0),(1367,28315,28304,'',0,0),(1368,28316,28304,'',0,0),(1369,28317,28305,'',0,0),(1370,28318,28305,'',0,0),(1371,28319,28305,'',0,0),(1372,28320,28305,'',0,0),(1373,28321,28305,'',0,0),(1374,28322,28305,'',0,0),(1375,28323,28306,'',0,0),(1376,28324,28306,'',0,0),(1377,28325,28307,'',0,0),(1378,28326,28307,'',0,0),(1379,28327,28308,'',0,0),(1380,28328,28308,'',0,0),(1381,28329,28309,'',0,0),(1382,28354,28346,'',0,0),(1383,28355,28346,'',0,0),(1384,28356,28347,'',0,0),(1385,28357,28347,'',0,0),(1386,28358,28348,'',0,0),(1387,28359,28349,'',0,0),(1388,28360,28349,'',0,0),(1389,28361,28350,'',0,0),(1390,28362,28350,'',0,0),(1391,28363,28350,'',0,0),(1392,28364,28350,'',0,0),(1393,28365,28350,'',0,0),(1394,28366,28350,'',0,0),(1395,28367,28350,'',0,0),(1396,28368,28351,'',0,0),(1397,28369,28351,'',0,0),(1398,28370,28351,'',0,0),(1399,28371,28351,'',0,0),(1400,28372,28351,'',0,0),(1401,28373,28351,'',0,0),(1402,28374,28352,'',0,0),(1403,28375,28352,'',0,0),(1404,28376,28353,'',0,0),(1405,28404,28392,'',0,0),(1406,28405,28392,'',0,0),(1407,28406,28393,'',0,0),(1408,28407,28394,'',0,0),(1409,28408,28395,'',0,0),(1410,28409,28396,'',0,0),(1411,28410,28397,'',0,0),(1412,28411,28398,'',0,0),(1413,28412,28399,'',0,0),(1414,28413,28400,'',0,0),(1415,28414,28400,'',0,0),(1416,28415,28401,'',0,0),(1417,28416,28401,'',0,0),(1418,28417,28402,'',0,0),(1419,28418,28402,'',0,0),(1420,28419,28402,'',0,0),(1421,28420,28402,'',0,0),(1422,28421,28402,'',0,0),(1423,28422,28402,'',0,0),(1424,28423,28403,'',0,0),(1425,28424,28403,'',0,0),(1426,28425,28403,'',0,0),(1427,28446,28440,'',0,0),(1428,28447,28441,'',0,0),(1429,28448,28442,'',0,0),(1430,28449,28443,'',0,0),(1431,28450,28444,'',0,0),(1432,28451,28444,'',0,0),(1433,28452,28445,'',0,0),(1434,28453,28445,'',0,0),(1435,28474,28468,'',0,0),(1436,28475,28469,'',0,0),(1437,28476,28470,'',0,0),(1438,28477,28471,'',0,0),(1439,28478,28472,'',0,0),(1440,28479,28472,'',0,0),(1441,28480,28473,'',0,0),(1442,28481,28473,'',0,0),(1443,28495,28493,'',0,0),(1444,28496,28494,'',0,0),(1445,28644,28608,'',0,0),(1446,28645,28608,'',0,0),(1447,28646,28609,'',0,0),(1448,28647,28609,'',0,0),(1449,28648,28609,'',0,0),(1450,28649,28609,'',0,0),(1451,28650,28609,'',0,0),(1452,28651,23280,'net.if.in[{#IFNAME}]',1554856078,0),(1453,28652,23281,'net.if.out[{#IFNAME}]',1554856078,0),(1454,28653,23282,'vfs.fs.inode[{#FSNAME},pfree]',1554856079,0),(1455,28654,23282,'vfs.fs.inode[{#FSNAME},pfree]',1554856079,0),(1456,28655,23283,'vfs.fs.size[{#FSNAME},free]',1554856079,0),(1457,28656,23283,'vfs.fs.size[{#FSNAME},free]',1554856079,0),(1458,28657,23284,'vfs.fs.size[{#FSNAME},pfree]',1554856079,0),(1459,28658,23284,'vfs.fs.size[{#FSNAME},pfree]',1554856079,0),(1460,28659,23285,'vfs.fs.size[{#FSNAME},total]',1554856079,0),(1461,28660,23285,'vfs.fs.size[{#FSNAME},total]',1554856079,0),(1462,28661,23286,'vfs.fs.size[{#FSNAME},used]',1554856079,0),(1463,28662,23286,'vfs.fs.size[{#FSNAME},used]',1554856079,0),(1464,28663,28644,'net.if.in[{#IFNAME}]',1554857808,0),(1465,28664,28644,'net.if.in[{#IFNAME}]',1554857808,0),(1466,28665,28644,'net.if.in[{#IFNAME}]',1554857808,0),(1467,28666,28644,'net.if.in[{#IFNAME}]',1554857808,0),(1468,28667,28644,'net.if.in[{#IFNAME}]',1554857808,0),(1469,28668,28645,'net.if.out[{#IFNAME}]',1554857808,0),(1470,28669,28645,'net.if.out[{#IFNAME}]',1554857808,0),(1471,28670,28645,'net.if.out[{#IFNAME}]',1554857808,0),(1472,28671,28645,'net.if.out[{#IFNAME}]',1554857808,0),(1473,28672,28645,'net.if.out[{#IFNAME}]',1554857808,0),(1474,28673,28646,'vfs.fs.inode[{#FSNAME},pfree]',1554857809,0),(1475,28674,28647,'vfs.fs.size[{#FSNAME},free]',1554857809,0),(1476,28675,28648,'vfs.fs.size[{#FSNAME},pfree]',1554857809,0),(1477,28676,28649,'vfs.fs.size[{#FSNAME},total]',1554857809,0),(1478,28677,28650,'vfs.fs.size[{#FSNAME},used]',1554857809,0);
/*!40000 ALTER TABLE `item_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_preproc`
--

DROP TABLE IF EXISTS `item_preproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_preproc` (
  `item_preprocid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `params` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_preprocid`),
  KEY `item_preproc_1` (`itemid`,`step`),
  CONSTRAINT `c_item_preproc_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_preproc`
--

LOCK TABLES `item_preproc` WRITE;
/*!40000 ALTER TABLE `item_preproc` DISABLE KEYS */;
INSERT INTO `item_preproc` VALUES (4950,28252,1,1,'0.01'),(4951,28253,1,1,'0.01'),(4952,28254,2,1,'0.01'),(4953,28255,1,1,'0.01'),(4954,28256,1,1,'0.01'),(4955,28257,2,1,'0.01'),(4956,28258,3,1,'0.01'),(4957,28259,4,1,'0.01'),(4958,28260,5,1,'0.01'),(4959,28261,6,1,'0.01'),(4960,28262,7,1,'0.01'),(4961,28263,8,1,'0.01'),(4962,28264,9,1,'0.01'),(4963,28265,10,1,'0.01'),(4964,28266,11,1,'0.01'),(4965,28267,12,1,'0.01'),(4966,28268,13,1,'0.01'),(4967,28269,14,1,'0.01'),(4968,28270,15,1,'0.01'),(4969,28271,16,1,'0.01'),(4970,28272,17,1,'0.01'),(4971,28273,18,1,'0.01'),(4972,28274,19,1,'0.01'),(4973,28275,20,1,'0.01'),(4974,28276,21,1,'0.01'),(4975,28277,22,1,'0.01'),(4976,28278,23,1,'0.01'),(4977,28279,24,1,'0.01'),(4978,27094,1,10,''),(4979,27094,2,1,'8'),(4980,27095,3,10,''),(4981,27095,4,1,'8'),(4982,27096,5,10,''),(4983,27093,6,10,''),(4984,27092,7,10,''),(4985,27089,8,10,''),(4986,27091,9,1,'1000000'),(4987,27104,1,10,''),(4988,27104,2,1,'8'),(4989,27105,3,10,''),(4990,27105,4,1,'8'),(4991,27106,5,10,''),(4992,27103,6,10,''),(4993,27102,7,10,''),(4994,27099,8,10,''),(4995,27101,9,1,'1000000'),(4996,27183,1,10,''),(4997,27183,2,1,'8'),(4998,27186,3,10,''),(4999,27186,4,1,'8'),(5000,27182,5,10,''),(5001,27185,6,10,''),(5002,27184,7,10,''),(5003,27181,8,10,''),(5004,27187,9,1,'1000000'),(5005,27218,10,10,''),(5006,27218,11,1,'8'),(5007,27221,12,10,''),(5008,27221,13,1,'8'),(5009,27217,14,10,''),(5010,27220,15,10,''),(5011,27219,16,10,''),(5012,27216,17,10,''),(5013,27222,18,1,'1000000'),(5014,27254,19,10,''),(5015,27254,20,1,'8'),(5016,27257,21,10,''),(5017,27257,22,1,'8'),(5018,27253,23,10,''),(5019,27256,24,10,''),(5020,27255,25,10,''),(5021,27252,26,10,''),(5022,27258,27,1,'1000000'),(5023,27275,28,10,''),(5024,27275,29,1,'8'),(5025,27278,30,10,''),(5026,27278,31,1,'8'),(5027,27274,32,10,''),(5028,27277,33,10,''),(5029,27276,34,10,''),(5030,27273,35,10,''),(5031,27279,36,1,'1000000'),(5032,27324,37,10,''),(5033,27324,38,1,'8'),(5034,27327,39,10,''),(5035,27327,40,1,'8'),(5036,27323,41,10,''),(5037,27326,42,10,''),(5038,27325,43,10,''),(5039,27322,44,10,''),(5040,27328,45,1,'1000000'),(5041,27453,46,10,''),(5042,27453,47,1,'8'),(5043,27456,48,10,''),(5044,27456,49,1,'8'),(5045,27452,50,10,''),(5046,27455,51,10,''),(5047,27454,52,10,''),(5048,27451,53,10,''),(5049,27457,54,1,'1000000'),(5050,27489,55,10,''),(5051,27489,56,1,'8'),(5052,27492,57,10,''),(5053,27492,58,1,'8'),(5054,27488,59,10,''),(5055,27491,60,10,''),(5056,27490,61,10,''),(5057,27487,62,10,''),(5058,27493,63,1,'1000000'),(5059,27523,64,10,''),(5060,27523,65,1,'8'),(5061,27526,66,10,''),(5062,27526,67,1,'8'),(5063,27522,68,10,''),(5064,27525,69,10,''),(5065,27524,70,10,''),(5066,27521,71,10,''),(5067,27527,72,1,'1000000'),(5068,27559,73,10,''),(5069,27559,74,1,'8'),(5070,27562,75,10,''),(5071,27562,76,1,'8'),(5072,27558,77,10,''),(5073,27561,78,10,''),(5074,27560,79,10,''),(5075,27557,80,10,''),(5076,27563,81,1,'1000000'),(5077,27645,82,10,''),(5078,27645,83,1,'8'),(5079,27648,84,10,''),(5080,27648,85,1,'8'),(5081,27644,86,10,''),(5082,27647,87,10,''),(5083,27646,88,10,''),(5084,27643,89,10,''),(5085,27649,90,1,'1000000'),(5086,27725,91,10,''),(5087,27725,92,1,'8'),(5088,27728,93,10,''),(5089,27728,94,1,'8'),(5090,27724,95,10,''),(5091,27727,96,10,''),(5092,27726,97,10,''),(5093,27723,98,10,''),(5094,27729,99,1,'1000000'),(5095,27759,100,10,''),(5096,27759,101,1,'8'),(5097,27762,102,10,''),(5098,27762,103,1,'8'),(5099,27758,104,10,''),(5100,27761,105,10,''),(5101,27760,106,10,''),(5102,27757,107,10,''),(5103,27763,108,1,'1000000'),(5104,27791,109,10,''),(5105,27791,110,1,'8'),(5106,27794,111,10,''),(5107,27794,112,1,'8'),(5108,27790,113,10,''),(5109,27793,114,10,''),(5110,27792,115,10,''),(5111,27789,116,10,''),(5112,27795,117,1,'1000000'),(5113,27875,118,10,''),(5114,27875,119,1,'8'),(5115,27878,120,10,''),(5116,27878,121,1,'8'),(5117,27874,122,10,''),(5118,27877,123,10,''),(5119,27876,124,10,''),(5120,27873,125,10,''),(5121,27879,126,1,'1000000'),(5122,27912,127,10,''),(5123,27912,128,1,'8'),(5124,27915,129,10,''),(5125,27915,130,1,'8'),(5126,27911,131,10,''),(5127,27914,132,10,''),(5128,27913,133,10,''),(5129,27910,134,10,''),(5130,27916,135,1,'1000000'),(5131,27947,136,10,''),(5132,27947,137,1,'8'),(5133,27950,138,10,''),(5134,27950,139,1,'8'),(5135,27946,140,10,''),(5136,27949,141,10,''),(5137,27948,142,10,''),(5138,27945,143,10,''),(5139,27951,144,1,'1000000'),(5140,28061,145,10,''),(5141,28061,146,1,'8'),(5142,28064,147,10,''),(5143,28064,148,1,'8'),(5144,28060,149,10,''),(5145,28063,150,10,''),(5146,28062,151,10,''),(5147,28059,152,10,''),(5148,28065,153,1,'1000000'),(5149,28121,154,10,''),(5150,28121,155,1,'8'),(5151,28124,156,10,''),(5152,28124,157,1,'8'),(5153,28120,158,10,''),(5154,28123,159,10,''),(5155,28122,160,10,''),(5156,28119,161,10,''),(5157,28125,162,1,'1000000'),(5158,28178,163,10,''),(5159,28178,164,1,'8'),(5160,28181,165,10,''),(5161,28181,166,1,'8'),(5162,28177,167,10,''),(5163,28180,168,10,''),(5164,28179,169,10,''),(5165,28176,170,10,''),(5166,28182,171,1,'1000000'),(5167,28226,172,10,''),(5168,28226,173,1,'8'),(5169,28229,174,10,''),(5170,28229,175,1,'8'),(5171,28225,176,10,''),(5172,28228,177,10,''),(5173,28227,178,10,''),(5174,28224,179,10,''),(5175,28230,180,1,'1000000'),(5176,27074,1,10,''),(5177,27074,2,1,'8'),(5178,27075,3,10,''),(5179,27075,4,1,'8'),(5180,27076,5,10,''),(5181,27073,6,10,''),(5182,27072,7,10,''),(5183,27069,8,10,''),(5184,27599,1,10,''),(5185,27599,2,1,'8'),(5186,27602,3,10,''),(5187,27602,4,1,'8'),(5188,27598,5,10,''),(5189,27601,6,10,''),(5190,27600,7,10,''),(5191,27597,8,10,''),(5192,28008,9,10,''),(5193,28008,10,1,'8'),(5194,28011,11,10,''),(5195,28011,12,1,'8'),(5196,28007,13,10,''),(5197,28010,14,10,''),(5198,28009,15,10,''),(5199,28006,16,10,''),(5200,27084,1,10,''),(5201,27084,2,1,'8'),(5202,27085,3,10,''),(5203,27085,4,1,'8'),(5204,27086,5,10,''),(5205,27083,6,10,''),(5206,27082,7,10,''),(5207,27079,8,10,''),(5208,27622,1,10,''),(5209,27622,2,1,'8'),(5210,27625,3,10,''),(5211,27625,4,1,'8'),(5212,27621,5,10,''),(5213,27624,6,10,''),(5214,27623,7,10,''),(5215,27620,8,10,''),(5216,27979,9,10,''),(5217,27979,10,1,'8'),(5218,27982,11,10,''),(5219,27982,12,1,'8'),(5220,27978,13,10,''),(5221,27981,14,10,''),(5222,27980,15,10,''),(5223,27977,16,10,''),(5224,27124,1,10,''),(5225,27124,2,1,'8'),(5226,27125,3,10,''),(5227,27125,4,1,'8'),(5228,27126,5,10,''),(5229,27123,6,10,''),(5230,27122,7,10,''),(5231,27119,8,10,''),(5232,27121,9,1,'1000000'),(5233,28100,1,10,''),(5234,28100,2,1,'8'),(5235,28103,3,10,''),(5236,28103,4,1,'8'),(5237,28099,5,10,''),(5238,28102,6,10,''),(5239,28101,7,10,''),(5240,28098,8,10,''),(5241,28104,9,1,'1000000'),(5242,27207,1,1,'1024'),(5243,27206,2,1,'1024'),(5244,27203,3,5,'^(\\w|-|\\.|/)+ (\\w|-|\\.|/)+ (.+) Copyright\n\\3'),(5245,27204,4,5,'^((\\w|-|\\.|/)+)\n\\1'),(5246,28291,1,1,'0.01'),(5247,28294,1,10,''),(5248,28295,2,10,''),(5249,28296,3,10,''),(5250,28296,4,1,'8'),(5251,28297,5,10,''),(5252,28298,6,10,''),(5253,28299,7,10,''),(5254,28299,8,1,'8'),(5255,28300,9,1,'1000000'),(5256,28323,1,1,'0.1'),(5257,27314,1,1,'0.5'),(5258,27315,2,1,'0.5'),(5259,27318,3,1,'0.5'),(5260,27377,1,5,'Version (.+), RELEASE\n\\1'),(5261,27381,1,5,'Version (.+), RELEASE\n\\1'),(5262,27384,2,5,'Version (.+), RELEASE\n\\1'),(5263,28211,3,5,'Version (.+), RELEASE\n\\1'),(5264,27592,1,1,'1024'),(5265,27591,2,1,'1024'),(5266,27778,1,5,'(.+) - Firmware\n\\1'),(5267,27777,2,5,'Firmware Version: ([0-9.]+),\n\\1'),(5268,27811,1,5,'kernel (JUNOS [0-9a-zA-Z\\.]+)\n\\1'),(5269,28201,1,1,'0.1'),(5270,27900,1,1,'1024'),(5271,27898,2,1,'1024'),(5272,27897,3,1,'0.1'),(5273,27905,1,1,'0.1'),(5274,27908,2,1,'1024'),(5275,27907,3,1,'1024'),(5276,27936,1,5,'60 Secs \\( ([0-9\\.]+)%\\).+300 Secs\n\\1'),(5277,28030,1,1,'1024'),(5278,28029,2,1,'1024'),(5279,28339,1,1,'0.01'),(5280,28354,1,1,'0.1'),(5281,28356,2,1,'0.1'),(5282,28367,3,1,'1048576'),(5283,28372,4,1,'1048576'),(5284,28386,1,1,'0.01'),(5285,28422,1,1,'1048576'),(5286,28425,2,1,'1048576'),(5287,28435,1,1,'0.01'),(5288,28451,1,5,'(\\d{1,3}) *%( of maximum)?\n\\1'),(5289,28463,1,1,'0.01'),(5290,28479,1,5,'(\\d{1,3}) *%( of maximum)?\n\\1'),(5291,28491,1,1,'0.01'),(5406,28501,1,10,''),(5407,28514,2,10,''),(5408,28517,3,10,''),(5409,28519,4,10,''),(5410,28520,5,1,'0.001'),(5411,28521,6,10,''),(5412,28522,7,10,''),(5413,28523,8,10,''),(5414,28524,9,10,''),(5415,28525,10,1,'0.001'),(5416,28526,11,10,''),(5417,28527,12,10,''),(5418,28528,13,10,''),(5419,28529,14,10,''),(5420,28530,15,1,'0.001'),(5421,28531,16,10,''),(5422,26881,1,1,'100'),(5423,26876,2,1,'0.001'),(5424,26896,3,10,''),(5425,26894,4,1,'0.001'),(5426,26895,5,10,''),(5427,26890,6,1,'0.001'),(5428,26889,7,10,''),(5429,26885,8,1,'0.001'),(5430,26884,9,10,''),(5431,26886,10,1,'0.001'),(5432,26887,11,10,''),(5433,26888,12,1,'0.001'),(5434,26897,13,1,'0.001'),(5435,26906,14,10,''),(5436,26905,15,1,'0.001'),(5437,10070,1,10,''),(5438,10071,2,10,''),(5439,10068,3,10,''),(5440,10072,4,10,''),(5441,10069,5,10,''),(5442,10067,6,10,''),(5443,23340,7,10,''),(5444,22196,1,10,''),(5445,22199,2,10,''),(5446,10061,3,10,''),(5447,10063,4,10,''),(5448,10066,5,10,''),(5449,10062,6,10,''),(5450,10065,7,10,''),(5451,10064,8,10,''),(5452,22187,9,10,''),(5453,23625,1,10,''),(5454,23628,2,10,''),(5455,10073,3,10,''),(5456,10075,4,10,''),(5457,10078,5,10,''),(5458,10074,6,10,''),(5459,10077,7,10,''),(5460,10076,8,10,''),(5461,23277,9,10,''),(5462,26920,1,10,''),(5463,26919,2,10,''),(5464,26921,3,10,''),(5465,26922,4,10,''),(5466,26923,5,10,''),(5467,26918,6,10,''),(5468,26917,7,10,''),(5469,26912,8,10,''),(5470,26911,9,10,''),(5471,26913,10,10,''),(5472,22920,1,10,''),(5473,22924,2,10,''),(5474,22945,1,10,''),(5475,22945,2,1,'8'),(5476,22946,3,10,''),(5477,22946,4,1,'8'),(5478,22884,1,10,''),(5479,22880,2,10,''),(5480,23073,1,10,''),(5481,23073,2,1,'8'),(5482,23074,3,10,''),(5483,23074,4,1,'8'),(5484,22985,1,10,''),(5485,22985,2,1,'8'),(5486,22986,3,10,''),(5487,22986,4,1,'8'),(5488,22680,1,10,''),(5489,22683,2,10,''),(5490,23298,1,10,''),(5491,23294,2,10,''),(5492,22446,1,10,''),(5493,22446,2,1,'8'),(5494,22448,3,10,''),(5495,22448,4,1,'8'),(5496,23280,1,10,''),(5497,23280,2,1,'8'),(5498,23281,3,10,''),(5499,23281,4,1,'8'),(5500,23077,1,10,''),(5501,23077,2,1,'8'),(5502,23078,3,10,''),(5503,23078,4,1,'8'),(5504,22844,1,10,''),(5505,22840,2,10,''),(5506,23075,1,10,''),(5507,23075,2,1,'8'),(5508,23076,3,10,''),(5509,23076,4,1,'8'),(5510,23004,1,10,''),(5511,23000,2,10,''),(5512,23025,1,10,''),(5513,23025,2,1,'8'),(5514,23026,3,10,''),(5515,23026,4,1,'8'),(5516,23169,1,10,''),(5517,23169,2,1,'8'),(5518,23170,3,10,''),(5519,23170,4,1,'8'),(5520,28534,1,12,'$.queue'),(5521,28535,2,12,'$.queue'),(5522,28536,1,12,'$.data.wcache.index.pused'),(5523,28537,2,12,'$.data.rcache.pused'),(5524,28538,3,12,'$.data.vcache.buffer.pused'),(5525,28539,4,12,'$.data.vcache.cache.hits'),(5526,28540,5,12,'$.data.vcache.cache.misses'),(5527,28541,6,12,'$.data.vcache.cache.mode'),(5528,28542,7,12,'$.data.vmware.pused'),(5529,28543,8,12,'$.data.wcache.history.pused'),(5530,28544,9,12,'$.data.wcache.values.all'),(5531,28545,10,12,'$.data.wcache.trend.pused'),(5532,28546,11,12,'$.data.process[\'unreachable poller\'].busy.avg'),(5533,28547,12,12,'$.data.wcache.values.float'),(5534,28548,13,12,'$.data.wcache.values.log'),(5535,28549,14,12,'$.data.wcache.values[\'not supported\']'),(5536,28550,15,12,'$.data.wcache.values.str'),(5537,28551,16,12,'$.data.wcache.values.text'),(5538,28552,17,12,'$.data.wcache.values.uint'),(5539,28553,18,12,'$.data.process[\'vmware collector\'].busy.avg'),(5540,28554,19,12,'$.data.preprocessing_queue'),(5541,28555,20,12,'$.data.process.alerter.busy.avg'),(5542,28556,21,12,'$.data.process[\'ipmi manager\'].busy.avg'),(5543,28557,22,12,'$.data.process[\'alert manager\'].busy.avg'),(5544,28558,23,12,'$.data.process[\'configuration syncer\'].busy.avg'),(5545,28559,24,12,'$.data.process.discoverer.busy.avg'),(5546,28560,25,12,'$.data.process.escalator.busy.avg'),(5547,28561,26,12,'$.data.process[\'history syncer\'].busy.avg'),(5548,28562,27,12,'$.data.process.housekeeper.busy.avg'),(5549,28563,28,12,'$.data.process[\'http poller\'].busy.avg'),(5550,28564,29,12,'$.data.process[\'icmp pinger\'].busy.avg'),(5551,28565,30,12,'$.data.process[\'ipmi poller\'].busy.avg'),(5552,28566,31,12,'$.data.process.timer.busy.avg'),(5553,28567,32,12,'$.data.process[\'java poller\'].busy.avg'),(5554,28568,33,12,'$.data.process.poller.busy.avg'),(5555,28569,34,12,'$.data.process[\'preprocessing manager\'].busy.avg'),(5556,28570,35,12,'$.data.process[\'preprocessing worker\'].busy.avg'),(5557,28571,36,12,'$.data.process[\'proxy poller\'].busy.avg'),(5558,28572,37,12,'$.data.process[\'self-monitoring\'].busy.avg'),(5559,28573,38,12,'$.data.process[\'snmp trapper\'].busy.avg'),(5560,28574,39,12,'$.data.process[\'task manager\'].busy.avg'),(5561,28575,40,12,'$.data.process.trapper.busy.avg'),(5562,28577,1,12,'$.queue'),(5563,28578,2,12,'$.queue'),(5564,28579,1,12,'$.data.process[\'vmware collector\'].busy.avg'),(5565,28580,2,12,'$.data.wcache.values.uint'),(5566,28581,3,12,'$.data.wcache.values.text'),(5567,28582,4,12,'$.data.wcache.values.str'),(5568,28583,5,12,'$.data.wcache.values[\'not supported\']'),(5569,28584,6,12,'$.data.wcache.values.log'),(5570,28585,7,12,'$.data.wcache.values.float'),(5571,28586,8,12,'$.data.wcache.values.all'),(5572,28587,9,12,'$.data.wcache.index.pused'),(5573,28588,10,12,'$.data.wcache.history.pused'),(5574,28589,11,12,'$.data.vmware.pused'),(5575,28590,12,12,'$.data.rcache.pused'),(5576,28591,13,12,'$.data.process[\'configuration syncer\'].busy.avg'),(5577,28592,14,12,'$.data.process[\'data sender\'].busy.avg'),(5578,28593,15,12,'$.data.process.trapper.busy.avg'),(5579,28594,16,12,'$.data.process[\'task manager\'].busy.avg'),(5580,28595,17,12,'$.data.process[\'snmp trapper\'].busy.avg'),(5581,28596,18,12,'$.data.process[\'self-monitoring\'].busy.avg'),(5582,28597,19,12,'$.data.process.poller.busy.avg'),(5583,28598,20,12,'$.data.process[\'java poller\'].busy.avg'),(5584,28599,21,12,'$.data.process[\'ipmi poller\'].busy.avg'),(5585,28600,22,12,'$.data.process[\'ipmi manager\'].busy.avg'),(5586,28601,23,12,'$.data.process[\'icmp pinger\'].busy.avg'),(5587,28602,24,12,'$.data.process[\'http poller\'].busy.avg'),(5588,28603,25,12,'$.data.process.housekeeper.busy.avg'),(5589,28604,26,12,'$.data.process[\'history syncer\'].busy.avg'),(5590,28605,27,12,'$.data.process[\'heartbeat sender\'].busy.avg'),(5591,28606,28,12,'$.data.process.discoverer.busy.avg'),(5592,28607,29,12,'$.data.process[\'unreachable poller\'].busy.avg'),(5593,28618,1,10,''),(5594,28622,2,10,''),(5595,28644,1,10,''),(5596,28644,2,1,'8'),(5597,28645,3,10,''),(5598,28645,4,1,'8'),(5599,28651,1,10,''),(5600,28651,2,1,'8'),(5601,28652,3,10,''),(5602,28652,4,1,'8'),(5603,28663,1,10,''),(5604,28663,2,1,'8'),(5605,28664,1,10,''),(5606,28664,2,1,'8'),(5607,28665,1,10,''),(5608,28665,2,1,'8'),(5609,28666,1,10,''),(5610,28666,2,1,'8'),(5611,28667,1,10,''),(5612,28667,2,1,'8'),(5613,28668,3,10,''),(5614,28668,4,1,'8'),(5615,28669,3,10,''),(5616,28669,4,1,'8'),(5617,28670,3,10,''),(5618,28670,4,1,'8'),(5619,28671,3,10,''),(5620,28671,4,1,'8'),(5621,28672,3,10,''),(5622,28672,4,1,'8');
/*!40000 ALTER TABLE `item_preproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) NOT NULL DEFAULT '',
  `snmp_oid` varchar(512) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(1024) NOT NULL DEFAULT '0',
  `history` varchar(255) NOT NULL DEFAULT '90d',
  `trends` varchar(255) NOT NULL DEFAULT '365d',
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) NOT NULL DEFAULT '',
  `units` varchar(255) NOT NULL DEFAULT '',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `formula` varchar(255) NOT NULL DEFAULT '',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `valuemapid` bigint(20) unsigned DEFAULT NULL,
  `params` text NOT NULL,
  `ipmi_sensor` varchar(128) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `interfaceid` bigint(20) unsigned DEFAULT NULL,
  `port` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `lifetime` varchar(255) NOT NULL DEFAULT '30d',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `jmx_endpoint` varchar(255) NOT NULL DEFAULT '',
  `master_itemid` bigint(20) unsigned DEFAULT NULL,
  `timeout` varchar(255) NOT NULL DEFAULT '3s',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `query_fields` varchar(2048) NOT NULL DEFAULT '',
  `posts` text NOT NULL,
  `status_codes` varchar(255) NOT NULL DEFAULT '200',
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `post_type` int(11) NOT NULL DEFAULT '0',
  `http_proxy` varchar(255) NOT NULL DEFAULT '',
  `headers` text NOT NULL,
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `request_method` int(11) NOT NULL DEFAULT '0',
  `output_format` int(11) NOT NULL DEFAULT '0',
  `ssl_cert_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  `allow_traps` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`),
  KEY `items_5` (`valuemapid`),
  KEY `items_6` (`interfaceid`),
  KEY `items_7` (`master_itemid`),
  CONSTRAINT `c_items_5` FOREIGN KEY (`master_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_2` FOREIGN KEY (`templateid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_3` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`),
  CONSTRAINT `c_items_4` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`itemappid`),
  UNIQUE KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`),
  CONSTRAINT `c_items_applications_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_applications_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (21474,1,10016),(21477,1,10025),(21495,1,10055),(21469,1,10056),(21486,1,10057),(21479,1,10058),(21517,1,17318),(21484,1,17352),(21576,5,22452),(21575,5,22454),(21578,5,22456),(21579,5,22458),(21577,5,22686),(21573,7,22446),(21574,7,22448),(21518,9,10009),(21519,9,10013),(21512,13,10010),(21500,13,17354),(21487,13,17356),(21493,13,17358),(21489,13,17360),(21496,13,17362),(21491,13,22665),(21470,13,22668),(21498,13,22671),(21510,13,22674),(21508,13,22677),(21506,13,22680),(21514,13,22683),(21504,13,28497),(21502,13,28499),(21482,15,10014),(21520,15,10026),(21480,15,10030),(21481,15,17350),(21472,15,22181),(21513,17,10010),(21501,17,17354),(21488,17,17356),(21494,17,17358),(21490,17,17360),(21497,17,17362),(21492,17,22665),(21471,17,22668),(21499,17,22671),(21511,17,22674),(21509,17,22677),(21507,17,22680),(21515,17,22683),(21505,17,28497),(21503,17,28499),(21476,21,10025),(21485,21,10057),(21478,21,10058),(21516,21,17318),(21483,21,17352),(21475,23,10016),(21473,23,10019),(21227,179,10061),(21230,179,10062),(21228,179,10063),(21232,179,10064),(21231,179,10065),(21229,179,10066),(21223,179,22183),(21226,179,22185),(21255,179,22187),(21218,179,22189),(21219,179,22191),(21220,179,22196),(21221,179,22199),(21216,179,22219),(21225,179,22396),(21248,179,22399),(21224,179,22400),(21233,179,22401),(21243,179,22402),(21234,179,22404),(21241,179,22406),(21242,179,22408),(21238,179,22412),(21252,179,22414),(21245,179,22416),(21244,179,22418),(21251,179,22420),(21240,179,22422),(21235,179,22424),(21246,179,22426),(21239,179,22430),(21247,179,22689),(21253,179,23171),(21217,179,23251),(21215,179,23634),(21222,179,23661),(21254,179,23663),(21236,179,25366),(21237,179,25370),(21249,179,25665),(21250,179,25666),(21214,179,28248),(21155,206,22231),(21154,206,22232),(21153,206,23318),(21157,207,10020),(21158,207,10059),(21156,207,23319),(21160,252,22833),(21161,252,22834),(21159,252,23320),(21652,253,22840),(21646,253,22841),(21650,253,22842),(21648,253,22843),(21644,253,22844),(21642,253,22845),(21640,253,22846),(21638,253,22848),(21635,253,22851),(21618,253,22852),(21662,254,22868),(21661,254,22869),(21664,254,22870),(21665,254,22871),(21663,254,22872),(21654,255,22839),(21633,255,22853),(21631,255,22854),(21626,255,22858),(21624,255,22859),(21630,256,22855),(21629,256,22856),(21628,256,22857),(21620,256,22862),(21658,256,22863),(21659,257,23075),(21660,257,23076),(21617,258,22835),(21637,258,22836),(21655,258,22839),(21634,258,22853),(21632,258,22854),(21627,258,22858),(21625,258,22859),(21622,258,22860),(21653,259,22840),(21647,259,22841),(21651,259,22842),(21649,259,22843),(21645,259,22844),(21643,259,22845),(21641,259,22846),(21639,259,22848),(21636,259,22851),(21619,259,22852),(21657,260,22837),(21656,260,22838),(21623,261,22860),(21621,261,22861),(21163,262,22873),(21164,262,22874),(21162,262,23321),(21423,263,22880),(21417,263,22881),(21421,263,22882),(21419,263,22883),(21415,263,22884),(21413,263,22885),(21411,263,22886),(21409,263,22888),(21406,263,22891),(21389,263,22892),(21433,264,22908),(21432,264,22909),(21435,264,22910),(21436,264,22911),(21434,264,22912),(21425,265,22879),(21404,265,22893),(21402,265,22894),(21397,265,22898),(21395,265,22899),(21401,266,22895),(21400,266,22896),(21399,266,22897),(21391,266,22902),(21429,266,22903),(21430,267,23073),(21431,267,23074),(21388,268,22875),(21408,268,22876),(21426,268,22879),(21405,268,22893),(21403,268,22894),(21398,268,22898),(21396,268,22899),(21393,268,22900),(21424,269,22880),(21418,269,22881),(21422,269,22882),(21420,269,22883),(21416,269,22884),(21414,269,22885),(21412,269,22886),(21410,269,22888),(21407,269,22891),(21390,269,22892),(21428,270,22877),(21427,270,22878),(21394,271,22900),(21392,271,22901),(21166,272,22913),(21167,272,22914),(21165,272,23322),(21345,273,22920),(21351,273,22921),(21347,273,22922),(21349,273,22923),(21353,273,22924),(21342,273,23108),(21359,273,23109),(21364,273,23110),(21366,273,23111),(21369,273,23112),(21372,273,23113),(21374,273,23114),(21376,273,23115),(21339,273,23118),(21325,273,23119),(21337,273,23120),(21314,273,23121),(21318,273,23123),(21384,274,22948),(21383,274,22949),(21386,274,22950),(21387,274,22951),(21385,274,22952),(21378,274,23116),(21362,274,23117),(21355,275,22933),(21357,275,22934),(21329,275,22938),(21331,275,22939),(21336,276,22942),(21380,276,22943),(21316,276,23122),(21320,276,23124),(21321,276,23125),(21322,276,23126),(21323,276,23127),(21313,276,23128),(21324,276,23129),(21327,276,23130),(21328,276,23131),(21381,277,22945),(21382,277,22946),(21356,278,22933),(21358,278,22934),(21330,278,22938),(21332,278,22939),(21333,278,22940),(21346,279,22920),(21352,279,22921),(21348,279,22922),(21350,279,22923),(21354,279,22924),(21344,279,23108),(21361,279,23109),(21365,279,23110),(21368,279,23111),(21371,279,23112),(21373,279,23113),(21375,279,23114),(21377,279,23115),(21379,279,23116),(21363,279,23117),(21326,279,23119),(21338,279,23120),(21315,279,23121),(21317,279,23122),(21319,279,23123),(21312,280,22917),(21341,280,22918),(21334,281,22940),(21335,281,22941),(21169,282,22953),(21170,282,22954),(21168,282,23323),(21441,283,22961),(21437,283,22962),(21439,283,22963),(21443,283,22965),(21445,283,22968),(21447,283,22971),(21449,283,22972),(21465,284,22988),(21464,284,22989),(21467,284,22990),(21468,284,22991),(21466,284,22992),(21451,285,22973),(21453,285,22974),(21455,285,22978),(21460,286,22982),(21461,286,22983),(21462,287,22985),(21463,287,22986),(21452,288,22973),(21454,288,22974),(21456,288,22978),(21457,288,22980),(21442,289,22961),(21438,289,22962),(21440,289,22963),(21444,289,22965),(21446,289,22968),(21448,289,22971),(21450,289,22972),(21458,291,22980),(21459,291,22981),(21172,292,22993),(21173,292,22994),(21171,292,23324),(21699,293,23000),(21693,293,23001),(21697,293,23002),(21695,293,23003),(21691,293,23004),(21689,293,23005),(21687,293,23007),(21685,293,23011),(21682,293,23012),(21708,294,23028),(21707,294,23029),(21710,294,23030),(21711,294,23031),(21709,294,23032),(21701,295,22999),(21667,295,23013),(21680,295,23014),(21675,295,23018),(21673,295,23019),(21679,296,23015),(21678,296,23016),(21677,296,23017),(21669,296,23022),(21704,296,23023),(21705,297,23025),(21706,297,23026),(21666,298,22996),(21702,298,22999),(21668,298,23013),(21681,298,23014),(21676,298,23018),(21674,298,23019),(21671,298,23020),(21700,299,23000),(21694,299,23001),(21698,299,23002),(21696,299,23003),(21692,299,23004),(21690,299,23005),(21688,299,23007),(21686,299,23011),(21683,299,23012),(21684,300,22997),(21703,300,22998),(21672,301,23020),(21670,301,23021),(21175,302,23033),(21176,302,23034),(21174,302,23325),(21597,303,23041),(21593,303,23042),(21595,303,23043),(21613,304,23068),(21612,304,23069),(21615,304,23070),(21616,304,23071),(21614,304,23072),(21591,305,23039),(21599,305,23053),(21601,305,23054),(21603,305,23058),(21605,305,23059),(21610,306,23062),(21611,306,23063),(21589,307,23077),(21590,307,23078),(21587,308,23035),(21588,308,23036),(21592,308,23039),(21600,308,23053),(21602,308,23054),(21604,308,23058),(21606,308,23059),(21607,308,23060),(21598,309,23041),(21594,309,23042),(21596,309,23043),(21608,311,23060),(21609,311,23061),(21730,319,23149),(21732,319,23150),(21718,320,23134),(21720,320,23135),(21713,320,23136),(21715,320,23137),(21723,320,23143),(21727,320,23144),(21725,320,23145),(21738,321,23666),(21717,322,23134),(21719,322,23135),(21712,322,23136),(21714,322,23137),(21739,322,23164),(21740,322,23165),(21741,322,23167),(21742,322,23168),(21716,323,23138),(21731,323,23149),(21721,324,23140),(21722,325,23143),(21726,325,23144),(21724,325,23145),(21728,328,23147),(21729,328,23148),(21733,328,23158),(21734,328,23159),(21735,328,23668),(21178,329,23160),(21179,329,23161),(21177,329,23326),(21736,330,23169),(21737,330,23170),(21343,331,23108),(21360,331,23109),(21367,331,23111),(21370,331,23112),(21340,331,23118),(21269,345,10073),(21272,345,10074),(21270,345,10075),(21274,345,10076),(21273,345,10077),(21271,345,10078),(21277,345,23252),(21280,345,23253),(21281,345,23255),(21282,345,23256),(21283,345,23257),(21284,345,23258),(21285,345,23259),(21286,345,23260),(21287,345,23261),(21289,345,23262),(21290,345,23264),(21293,345,23265),(21294,345,23266),(21295,345,23267),(21288,345,23268),(21276,345,23269),(21266,345,23270),(21258,345,23271),(21259,345,23272),(21260,345,23273),(21265,345,23274),(21267,345,23275),(21268,345,23276),(21297,345,23277),(21275,345,23328),(21261,345,23620),(21262,345,23625),(21263,345,23628),(21257,345,23635),(21264,345,23662),(21296,345,23664),(21278,345,25367),(21279,345,25371),(21291,345,25667),(21292,345,25668),(21256,345,28249),(21566,346,23294),(21560,346,23295),(21564,346,23296),(21562,346,23297),(21558,346,23298),(21552,346,23299),(21550,346,23300),(21548,346,23301),(21545,346,23302),(21522,346,23303),(21543,346,23304),(21541,346,23305),(21539,346,23306),(21556,346,28498),(21554,346,28500),(21582,347,23282),(21583,347,23283),(21584,347,23284),(21585,347,23285),(21586,347,23286),(21975,347,28653),(21974,347,28654),(21973,347,28655),(21972,347,28656),(21971,347,28657),(21969,347,28658),(21968,347,28659),(21970,347,28660),(21967,347,28661),(21966,347,28662),(21568,348,23293),(21537,348,23307),(21535,348,23308),(21530,348,23312),(21528,348,23313),(21534,349,23309),(21533,349,23310),(21532,349,23311),(21524,349,23316),(21572,349,23317),(21580,350,23280),(21581,350,23281),(21964,350,28651),(21965,350,28652),(21521,351,23289),(21547,351,23290),(21569,351,23293),(21538,351,23307),(21536,351,23308),(21531,351,23312),(21529,351,23313),(21526,351,23314),(21567,352,23294),(21561,352,23295),(21565,352,23296),(21563,352,23297),(21559,352,23298),(21553,352,23299),(21551,352,23300),(21549,352,23301),(21546,352,23302),(21523,352,23303),(21544,352,23304),(21542,352,23305),(21540,352,23306),(21557,352,28498),(21555,352,28500),(21571,353,23291),(21570,353,23292),(21527,354,23314),(21525,354,23315),(21181,355,23287),(21182,355,23288),(21180,355,23327),(21190,356,10067),(21187,356,10068),(21189,356,10069),(21185,356,10070),(21186,356,10071),(21188,356,10072),(21213,356,23340),(21191,356,23341),(21192,356,23342),(21202,356,23343),(21201,356,23344),(21198,356,23345),(21184,356,23346),(21183,356,23347),(21203,356,23348),(21204,356,23349),(21210,356,23350),(21211,356,23351),(21212,356,23352),(21209,356,23353),(21208,356,23354),(21205,356,23355),(21207,356,23356),(21194,356,23357),(21195,356,23358),(21196,356,23359),(21199,356,23360),(21206,356,25368),(21200,356,25369),(21197,356,28250),(21193,356,28251),(21087,446,23644),(21143,447,23645),(21144,448,23646),(21145,449,23647),(21146,450,23648),(21147,451,23649),(21148,452,23650),(21149,453,23651),(21150,454,23652),(21151,455,23653),(21152,456,23654),(21118,732,26891),(21116,732,26892),(21088,732,26910),(21119,733,26893),(21120,733,26894),(21125,734,26884),(21124,734,26885),(21126,734,26886),(21127,734,26887),(21128,734,26888),(21123,734,26889),(21122,734,26890),(21121,734,26895),(21117,734,26896),(21129,734,26897),(21132,734,26905),(21131,734,26906),(21139,735,26898),(21138,735,26899),(21137,735,26903),(21136,735,26904),(21133,735,26907),(21134,735,26908),(21135,735,26909),(21097,736,26856),(21096,736,26857),(21098,736,26858),(21099,736,26859),(21100,736,26860),(21095,736,26861),(21094,736,26862),(21090,736,26863),(21114,736,26864),(21091,736,26865),(21092,736,26866),(21093,736,26867),(21089,736,26868),(21101,736,26869),(21104,736,26877),(21103,736,26878),(21102,736,26882),(21115,736,26883),(21140,736,26900),(21141,736,26901),(21130,736,26902),(21105,737,26879),(21106,737,26880),(21107,737,26881),(21110,738,26871),(21109,738,26875),(21108,738,26876),(21111,739,26870),(21112,739,26872),(21113,739,26873),(21142,739,26874),(21307,740,26911),(21306,740,26912),(21308,740,26913),(21309,740,26914),(21311,740,26915),(21310,740,26916),(21305,740,26917),(21304,740,26918),(21300,740,26919),(21299,740,26920),(21301,740,26921),(21302,740,26922),(21303,740,26923),(21298,740,26924),(21750,741,26927),(21747,742,26928),(21748,743,26925),(21749,743,26926),(21746,743,26929),(21744,743,26930),(21745,743,26931),(21743,743,26932),(21760,744,26935),(21761,744,26936),(21758,745,26933),(21751,745,26943),(21759,746,26934),(21757,746,26937),(21756,746,26938),(21752,746,26939),(21753,746,26940),(21754,746,26941),(21755,746,26942),(21810,747,26994),(21764,748,26944),(21763,748,26945),(21762,749,26946),(21781,750,26957),(21782,750,26958),(21775,750,26959),(21818,751,26999),(21817,751,27000),(21816,751,27001),(21815,751,27002),(21822,752,27003),(21821,752,27004),(21820,752,27005),(21819,752,27006),(21770,753,26950),(21783,753,26952),(21780,753,26960),(21779,753,26961),(21765,753,26965),(21814,754,26995),(21813,754,26996),(21812,754,26997),(21811,754,26998),(21771,755,26947),(21772,755,26948),(21773,755,26949),(21766,755,26955),(21774,755,26956),(21776,755,26962),(21777,755,26963),(21778,755,26964),(21769,757,26951),(21767,757,26953),(21768,757,26954),(21805,758,26977),(21795,758,26980),(21803,758,26981),(21801,758,26982),(21799,758,26985),(21826,759,27007),(21825,759,27008),(21824,759,27009),(21823,759,27010),(21789,760,26970),(21788,760,26971),(21809,760,26972),(21786,760,26973),(21787,760,26974),(21807,760,26978),(21808,760,26979),(21784,760,26986),(21785,761,26975),(21794,761,26976),(21806,761,26977),(21804,761,26981),(21802,761,26982),(21796,761,26983),(21797,761,26984),(21800,761,26985),(21792,762,26968),(21793,762,26969),(21798,762,26984),(21790,763,26966),(21791,763,26967),(19309,770,27030),(19311,771,27032),(19551,772,27040),(19550,772,27041),(19549,772,27042),(19557,772,27046),(19556,772,27047),(19555,772,27048),(19553,773,27037),(19554,773,27038),(19552,773,27039),(19559,774,27043),(19560,774,27044),(19558,774,27045),(19548,775,27036),(19564,776,27056),(19563,776,27057),(19562,776,27058),(19570,776,27062),(19569,776,27063),(19568,776,27064),(19566,777,27053),(19567,777,27054),(19565,777,27055),(19572,778,27059),(19573,778,27060),(19571,778,27061),(19561,779,27052),(19224,780,27065),(19223,780,27066),(19222,780,27067),(19817,781,27069),(19818,781,27070),(19819,781,27071),(19816,781,27072),(19815,781,27073),(19812,781,27074),(19813,781,27075),(19814,781,27076),(19811,781,27077),(19844,782,27079),(19845,782,27080),(19846,782,27081),(19843,782,27082),(19842,782,27083),(19839,782,27084),(19840,782,27085),(19841,782,27086),(19838,782,27087),(19619,783,27089),(19620,783,27090),(19621,783,27091),(19618,783,27092),(19617,783,27093),(19614,783,27094),(19615,783,27095),(19616,783,27096),(19613,783,27097),(19628,784,27099),(19629,784,27100),(19630,784,27101),(19627,784,27102),(19626,784,27103),(19623,784,27104),(19624,784,27105),(19625,784,27106),(19622,784,27107),(19871,786,27119),(19872,786,27120),(19873,786,27121),(19870,786,27122),(19869,786,27123),(19866,786,27124),(19867,786,27125),(19868,786,27126),(19865,786,27127),(19225,797,27138),(19226,797,27139),(19227,797,27140),(19333,797,27143),(19324,797,28252),(19331,798,27141),(19332,798,27142),(19330,798,27144),(19329,798,27145),(19327,798,27146),(19328,798,27147),(19228,799,27149),(19229,799,27150),(19230,799,27151),(19379,799,27154),(19348,799,28255),(19377,800,27152),(19378,800,27153),(19376,800,27155),(19375,800,27156),(19373,800,27157),(19374,800,27158),(19637,803,27181),(19634,803,27182),(19632,803,27183),(19636,803,27184),(19635,803,27185),(19633,803,27186),(19639,803,27187),(19631,803,27188),(19638,803,27189),(19312,803,27191),(19380,804,27195),(19382,804,27196),(19385,804,27197),(19381,804,27198),(19384,804,27199),(19383,804,27200),(19231,805,27192),(19232,805,27193),(19233,805,27194),(19386,805,27202),(19349,805,28256),(19883,806,27208),(19886,807,27205),(19885,807,27206),(19884,807,27207),(19889,808,27212),(19890,809,27213),(19887,810,27203),(19888,810,27204),(19891,810,27214),(19646,811,27216),(19643,811,27217),(19641,811,27218),(19645,811,27219),(19644,811,27220),(19642,811,27221),(19648,811,27222),(19640,811,27223),(19647,811,27224),(19387,812,27228),(19389,812,27229),(19392,812,27230),(19388,812,27231),(19391,812,27232),(19390,812,27233),(19234,813,27225),(19235,813,27226),(19236,813,27227),(19393,813,27235),(19935,813,27238),(19350,813,28257),(19933,814,27240),(19934,815,27239),(19939,816,27246),(19938,816,27247),(19940,817,27248),(19942,818,27249),(19941,818,27250),(19937,819,27236),(19936,819,27237),(19655,820,27252),(19652,820,27253),(19650,820,27254),(19654,820,27255),(19653,820,27256),(19651,820,27257),(19657,820,27258),(19649,820,27259),(19656,820,27260),(19394,821,27264),(19396,821,27265),(19399,821,27266),(19395,821,27267),(19398,821,27268),(19397,821,27269),(19237,822,27261),(19238,822,27262),(19239,822,27263),(19400,822,27271),(19351,822,28258),(19664,823,27273),(19661,823,27274),(19659,823,27275),(19663,823,27276),(19662,823,27277),(19660,823,27278),(19666,823,27279),(19658,823,27280),(19665,823,27281),(19401,824,27285),(19403,824,27286),(19406,824,27287),(19402,824,27288),(19405,824,27289),(19404,824,27290),(19240,825,27282),(19241,825,27283),(19242,825,27284),(19407,825,27292),(19352,825,28259),(19943,826,27294),(19944,827,27293),(19954,828,27314),(19955,828,27315),(19952,829,27312),(19953,830,27313),(19946,831,27295),(19945,831,27296),(19958,832,27318),(19956,833,27316),(19957,834,27317),(19947,835,27297),(19959,835,27319),(19960,835,27320),(19948,836,27299),(19949,837,27298),(19950,838,27301),(19951,839,27300),(19673,840,27322),(19670,840,27323),(19668,840,27324),(19672,840,27325),(19671,840,27326),(19669,840,27327),(19675,840,27328),(19667,840,27329),(19674,840,27330),(19313,840,27332),(19408,841,27336),(19410,841,27337),(19413,841,27338),(19409,841,27339),(19412,841,27340),(19411,841,27341),(19243,842,27333),(19244,842,27334),(19245,842,27335),(19414,842,27343),(19353,842,28260),(19415,846,27368),(19417,846,27369),(19420,846,27370),(19416,846,27371),(19419,846,27372),(19418,846,27373),(19246,847,27365),(19247,847,27366),(19248,847,27367),(19421,847,27375),(19354,847,28261),(19977,848,27414),(19976,848,27415),(19975,848,27416),(19978,849,27417),(19961,851,27376),(19964,852,27377),(19963,852,27378),(19962,852,27379),(19980,852,27419),(19982,853,27420),(19981,853,27421),(19983,854,27422),(19984,855,27423),(19987,856,27424),(19986,856,27425),(19985,856,27426),(19988,857,27427),(19971,858,27384),(19970,858,27385),(19969,858,27386),(19989,858,27428),(19991,859,27429),(19990,859,27430),(19992,860,27431),(19993,861,27432),(19996,868,27442),(19995,868,27443),(19994,868,27444),(19965,869,27380),(19968,870,27381),(19967,870,27382),(19966,870,27383),(19997,870,27445),(19999,871,27446),(19998,871,27447),(20000,872,27448),(20001,873,27449),(19682,874,27451),(19679,874,27452),(19677,874,27453),(19681,874,27454),(19680,874,27455),(19678,874,27456),(19684,874,27457),(19676,874,27458),(19683,874,27459),(19314,874,27461),(19422,875,27465),(19424,875,27466),(19427,875,27467),(19423,875,27468),(19426,875,27469),(19425,875,27470),(19249,876,27462),(19250,876,27463),(19251,876,27464),(19428,876,27472),(19355,876,28262),(20011,877,27478),(20012,878,27477),(20015,879,27485),(20013,880,27479),(20014,881,27480),(20019,882,27481),(20018,882,27482),(20017,882,27483),(20016,882,27484),(19691,883,27487),(19688,883,27488),(19686,883,27489),(19690,883,27490),(19689,883,27491),(19687,883,27492),(19693,883,27493),(19685,883,27494),(19692,883,27495),(19429,884,27499),(19431,884,27500),(19434,884,27501),(19430,884,27502),(19433,884,27503),(19432,884,27504),(19252,885,27496),(19253,885,27497),(19254,885,27498),(19435,885,27506),(19356,885,28263),(20020,886,27511),(20025,887,27516),(20026,888,27517),(20028,889,27519),(20027,890,27518),(20024,891,27507),(20023,891,27508),(20022,891,27509),(20021,891,27510),(19700,892,27521),(19697,892,27522),(19695,892,27523),(19699,892,27524),(19698,892,27525),(19696,892,27526),(19702,892,27527),(19694,892,27528),(19701,892,27529),(19315,892,27531),(19436,893,27535),(19438,893,27536),(19441,893,27537),(19437,893,27538),(19440,893,27539),(19439,893,27540),(19255,894,27532),(19256,894,27533),(19257,894,27534),(19442,894,27542),(19357,894,28264),(20029,895,27547),(20034,896,27552),(20035,897,27553),(20037,898,27555),(20036,899,27554),(20033,900,27543),(20032,900,27544),(20031,900,27545),(20030,900,27546),(19709,901,27557),(19706,901,27558),(19704,901,27559),(19708,901,27560),(19707,901,27561),(19705,901,27562),(19711,901,27563),(19703,901,27564),(19710,901,27565),(19316,901,27567),(19443,902,27571),(19445,902,27572),(19448,902,27573),(19444,902,27574),(19447,902,27575),(19446,902,27576),(19258,903,27568),(19259,903,27569),(19260,903,27570),(19449,903,27578),(19358,903,28265),(20038,904,27586),(20048,905,27590),(20047,905,27591),(20046,905,27592),(20039,906,27584),(20040,906,27585),(20049,907,27593),(20051,908,27594),(20050,908,27595),(20043,909,27579),(20044,909,27580),(20045,909,27581),(20042,909,27582),(20041,909,27583),(19826,910,27597),(19823,910,27598),(19821,910,27599),(19825,910,27600),(19824,910,27601),(19822,910,27602),(19828,910,27603),(19820,910,27604),(19827,910,27605),(19310,910,27607),(19334,911,27611),(19336,911,27612),(19339,911,27613),(19335,911,27614),(19338,911,27615),(19337,911,27616),(19261,912,27608),(19262,912,27609),(19263,912,27610),(19340,912,27618),(19325,912,28253),(19853,913,27620),(19850,913,27621),(19848,913,27622),(19852,913,27623),(19851,913,27624),(19849,913,27625),(19855,913,27626),(19847,913,27627),(19854,913,27628),(19317,913,27630),(19450,914,27634),(19452,914,27635),(19455,914,27636),(19451,914,27637),(19454,914,27638),(19453,914,27639),(19264,915,27631),(19265,915,27632),(19266,915,27633),(19456,915,27641),(19359,915,28266),(19718,916,27643),(19715,916,27644),(19713,916,27645),(19717,916,27646),(19716,916,27647),(19714,916,27648),(19720,916,27649),(19712,916,27650),(19719,916,27651),(19318,916,27653),(19457,917,27657),(19459,917,27658),(19462,917,27659),(19458,917,27660),(19461,917,27661),(19460,917,27662),(19267,918,27654),(19268,918,27655),(19269,918,27656),(19463,918,27664),(19360,918,28267),(20052,919,27671),(20053,920,27670),(20054,921,27672),(20055,922,27673),(20056,923,27674),(20061,924,27675),(20060,924,27676),(20059,924,27677),(20058,924,27678),(20057,924,27679),(19727,934,27723),(19724,934,27724),(19722,934,27725),(19726,934,27726),(19725,934,27727),(19723,934,27728),(19729,934,27729),(19721,934,27730),(19728,934,27731),(19319,934,27733),(19464,935,27737),(19466,935,27738),(19469,935,27739),(19465,935,27740),(19468,935,27741),(19467,935,27742),(19270,936,27734),(19271,936,27735),(19272,936,27736),(19470,936,27744),(19361,936,28268),(20074,937,27753),(20075,938,27752),(20076,939,27751),(20081,940,27755),(20078,941,27748),(20079,941,27749),(20077,941,27750),(20080,941,27754),(19736,942,27757),(19733,942,27758),(19731,942,27759),(19735,942,27760),(19734,942,27761),(19732,942,27762),(19738,942,27763),(19730,942,27764),(19737,942,27765),(19471,943,27769),(19473,943,27770),(19476,943,27771),(19472,943,27772),(19475,943,27773),(19474,943,27774),(19273,944,27766),(19274,944,27767),(19275,944,27768),(19477,944,27776),(19362,944,28269),(20085,945,27783),(20084,945,27784),(20087,946,27786),(20088,947,27787),(20083,948,27777),(20082,948,27778),(20086,948,27785),(19745,949,27789),(19742,949,27790),(19740,949,27791),(19744,949,27792),(19743,949,27793),(19741,949,27794),(19747,949,27795),(19739,949,27796),(19746,949,27797),(19320,949,27799),(19478,950,27803),(19480,950,27804),(19483,950,27805),(19479,950,27806),(19482,950,27807),(19481,950,27808),(19276,951,27800),(19277,951,27801),(19278,951,27802),(19484,951,27810),(20089,951,27814),(19363,951,28270),(20093,952,27820),(20094,953,27819),(20095,954,27821),(20097,955,27823),(20096,956,27822),(20092,957,27811),(20091,957,27812),(20090,957,27813),(19754,969,27873),(19751,969,27874),(19749,969,27875),(19753,969,27876),(19752,969,27877),(19750,969,27878),(19756,969,27879),(19748,969,27880),(19755,969,27881),(19485,970,27885),(19487,970,27886),(19490,970,27887),(19486,970,27888),(19489,970,27889),(19488,970,27890),(19279,971,27882),(19280,971,27883),(19281,971,27884),(19491,971,27892),(19364,971,28271),(20113,972,27904),(20106,973,27898),(20107,973,27899),(20105,973,27900),(20108,974,27897),(20114,974,27905),(20117,975,27906),(20116,975,27907),(20115,975,27908),(20110,976,27893),(20111,976,27894),(20112,976,27895),(20109,976,27896),(19763,977,27910),(19760,977,27911),(19758,977,27912),(19762,977,27913),(19761,977,27914),(19759,977,27915),(19765,977,27916),(19757,977,27917),(19764,977,27918),(19492,978,27922),(19494,978,27923),(19497,978,27924),(19493,978,27925),(19496,978,27926),(19495,978,27927),(19282,979,27919),(19283,979,27920),(19284,979,27921),(19498,979,27929),(19365,979,28272),(20118,980,27936),(20121,981,27933),(20119,981,27934),(20120,981,27935),(20126,982,27940),(20125,982,27941),(20128,983,27943),(20127,984,27942),(20123,985,27930),(20124,985,27931),(20122,985,27932),(19772,986,27945),(19769,986,27946),(19767,986,27947),(19771,986,27948),(19770,986,27949),(19768,986,27950),(19774,986,27951),(19766,986,27952),(19773,986,27953),(19321,986,27955),(19499,987,27959),(19501,987,27960),(19504,987,27961),(19500,987,27962),(19503,987,27963),(19502,987,27964),(19285,988,27956),(19286,988,27957),(19287,988,27958),(19505,988,27966),(19366,988,28273),(20129,989,27975),(20130,990,27972),(20131,990,27973),(20132,990,27974),(20135,991,27967),(20136,991,27968),(20137,991,27969),(20134,991,27970),(20133,991,27971),(19862,992,27977),(19859,992,27978),(19857,992,27979),(19861,992,27980),(19860,992,27981),(19858,992,27982),(19864,992,27983),(19856,992,27984),(19863,992,27985),(19506,993,27989),(19508,993,27990),(19511,993,27991),(19507,993,27992),(19510,993,27993),(19509,993,27994),(19288,994,27986),(19289,994,27987),(19290,994,27988),(19512,994,27996),(19367,994,28274),(20142,995,28003),(20143,996,28004),(20141,997,27997),(20140,997,27998),(20139,997,27999),(20138,997,28000),(19835,998,28006),(19832,998,28007),(19830,998,28008),(19834,998,28009),(19833,998,28010),(19831,998,28011),(19837,998,28012),(19829,998,28013),(19836,998,28014),(19341,999,28018),(19343,999,28019),(19346,999,28020),(19342,999,28021),(19345,999,28022),(19344,999,28023),(19291,1000,28015),(19292,1000,28016),(19293,1000,28017),(19347,1000,28025),(19326,1000,28254),(20144,1001,28031),(20147,1002,28028),(20146,1002,28029),(20145,1002,28030),(20148,1003,28026),(20149,1003,28027),(19574,1014,28045),(19583,1015,28048),(19582,1015,28049),(19581,1015,28050),(19577,1015,28054),(19576,1015,28055),(19575,1015,28056),(19580,1016,28052),(19579,1016,28053),(19578,1016,28057),(19586,1017,28046),(19585,1017,28047),(19584,1017,28051),(19781,1018,28059),(19778,1018,28060),(19776,1018,28061),(19780,1018,28062),(19779,1018,28063),(19777,1018,28064),(19783,1018,28065),(19775,1018,28066),(19782,1018,28067),(19322,1018,28069),(19513,1019,28073),(19515,1019,28074),(19518,1019,28075),(19514,1019,28076),(19517,1019,28077),(19516,1019,28078),(19294,1020,28070),(19295,1020,28071),(19296,1020,28072),(19519,1020,28080),(19368,1020,28275),(19587,1021,28084),(19596,1022,28087),(19595,1022,28088),(19594,1022,28089),(19590,1022,28093),(19589,1022,28094),(19588,1022,28095),(19593,1023,28091),(19592,1023,28092),(19591,1023,28096),(19599,1024,28085),(19598,1024,28086),(19597,1024,28090),(19880,1025,28098),(19877,1025,28099),(19875,1025,28100),(19879,1025,28101),(19878,1025,28102),(19876,1025,28103),(19882,1025,28104),(19874,1025,28105),(19881,1025,28106),(19520,1026,28110),(19522,1026,28111),(19525,1026,28112),(19521,1026,28113),(19524,1026,28114),(19523,1026,28115),(19297,1027,28107),(19298,1027,28108),(19299,1027,28109),(19526,1027,28117),(19369,1027,28276),(19790,1028,28119),(19787,1028,28120),(19785,1028,28121),(19789,1028,28122),(19788,1028,28123),(19786,1028,28124),(19792,1028,28125),(19784,1028,28126),(19791,1028,28127),(19323,1028,28129),(19527,1029,28133),(19529,1029,28134),(19532,1029,28135),(19528,1029,28136),(19531,1029,28137),(19530,1029,28138),(19300,1030,28130),(19301,1030,28131),(19302,1030,28132),(19533,1030,28140),(19370,1030,28277),(20062,1031,28143),(20068,1032,28151),(20067,1032,28152),(20066,1032,28153),(20065,1033,28150),(20071,1033,28156),(20069,1034,28154),(20070,1035,28155),(20064,1036,28141),(20063,1036,28142),(20073,1036,28157),(20072,1036,28158),(19600,1037,28162),(19609,1038,28165),(19608,1038,28166),(19607,1038,28167),(19603,1038,28171),(19602,1038,28172),(19601,1038,28173),(19606,1039,28169),(19605,1039,28170),(19604,1039,28174),(19612,1040,28163),(19611,1040,28164),(19610,1040,28168),(19799,1041,28176),(19796,1041,28177),(19794,1041,28178),(19798,1041,28179),(19797,1041,28180),(19795,1041,28181),(19801,1041,28182),(19793,1041,28183),(19800,1041,28184),(19534,1042,28188),(19536,1042,28189),(19539,1042,28190),(19535,1042,28191),(19538,1042,28192),(19537,1042,28193),(19303,1043,28185),(19304,1043,28186),(19305,1043,28187),(19540,1043,28195),(19371,1043,28278),(20099,1044,28200),(20098,1044,28201),(20101,1045,28202),(20100,1045,28203),(20104,1046,28206),(20103,1047,28204),(20102,1047,28205),(20005,1048,28208),(19972,1048,28209),(19973,1048,28210),(19974,1048,28211),(20009,1049,28215),(20008,1050,28216),(20007,1051,28217),(20006,1051,28218),(20003,1052,28220),(20004,1052,28221),(20002,1052,28222),(19808,1053,28224),(19805,1053,28225),(19803,1053,28226),(19807,1053,28227),(19806,1053,28228),(19804,1053,28229),(19810,1053,28230),(19802,1053,28231),(19809,1053,28232),(19541,1054,28236),(19543,1054,28237),(19546,1054,28238),(19542,1054,28239),(19545,1054,28240),(19544,1054,28241),(19306,1055,28233),(19307,1055,28234),(19308,1055,28235),(19547,1055,28243),(19372,1055,28279),(19979,1056,28246),(20010,1057,28247),(19892,1058,28281),(19904,1058,28294),(19905,1058,28295),(19906,1058,28296),(19907,1058,28297),(19908,1058,28298),(19909,1058,28299),(19910,1058,28300),(19911,1058,28301),(19912,1058,28302),(19896,1059,28285),(19897,1059,28286),(19898,1059,28287),(19899,1059,28288),(19900,1059,28289),(19901,1059,28290),(19893,1060,28282),(19894,1060,28283),(19895,1060,28284),(19902,1060,28291),(19903,1060,28292),(19913,1061,28310),(19928,1062,28325),(19929,1062,28326),(19914,1063,28311),(19915,1063,28312),(19916,1063,28313),(19920,1063,28317),(19921,1063,28318),(19922,1063,28319),(19930,1064,28327),(19931,1064,28328),(19917,1065,28314),(19918,1065,28315),(19919,1065,28316),(19932,1066,28329),(19923,1067,28320),(19924,1067,28321),(19925,1067,28322),(19926,1068,28323),(19927,1068,28324),(20153,1069,28333),(20154,1069,28334),(20155,1069,28335),(20156,1069,28336),(20157,1069,28337),(20158,1069,28338),(20150,1070,28330),(20151,1070,28331),(20152,1070,28332),(20159,1070,28339),(20160,1070,28340),(20161,1070,28341),(20186,1071,28374),(20187,1071,28375),(20188,1071,28376),(20171,1072,28359),(20172,1072,28360),(20162,1073,28342),(20163,1073,28343),(20164,1073,28344),(20165,1073,28345),(20173,1074,28361),(20174,1074,28362),(20175,1074,28363),(20176,1074,28364),(20177,1074,28365),(20178,1074,28366),(20179,1074,28367),(20170,1075,28358),(20166,1076,28354),(20167,1076,28355),(20168,1076,28356),(20169,1076,28357),(20180,1077,28368),(20181,1077,28369),(20182,1077,28370),(20183,1077,28371),(20184,1077,28372),(20185,1077,28373),(20192,1078,28380),(20193,1078,28381),(20194,1078,28382),(20195,1078,28383),(20196,1078,28384),(20197,1078,28385),(20189,1079,28377),(20190,1079,28378),(20191,1079,28379),(20198,1079,28386),(20199,1079,28387),(20201,1079,28389),(20213,1080,28413),(20214,1080,28414),(20215,1080,28415),(20216,1080,28416),(20212,1081,28412),(20202,1082,28390),(20203,1082,28391),(20217,1083,28417),(20218,1083,28418),(20219,1083,28419),(20220,1083,28420),(20221,1083,28421),(20222,1083,28422),(20211,1084,28411),(20200,1085,28388),(20204,1085,28404),(20205,1085,28405),(20206,1085,28406),(20207,1085,28407),(20208,1085,28408),(20209,1085,28409),(20210,1085,28410),(20223,1086,28423),(20224,1086,28424),(20225,1086,28425),(20229,1087,28429),(20230,1087,28430),(20231,1087,28431),(20232,1087,28432),(20233,1087,28433),(20234,1087,28434),(20226,1088,28426),(20227,1088,28427),(20228,1088,28428),(20235,1088,28435),(20236,1088,28436),(20237,1088,28437),(20244,1089,28450),(20245,1089,28451),(20238,1090,28438),(20239,1090,28439),(20246,1091,28452),(20247,1091,28453),(20243,1092,28449),(20240,1093,28446),(20241,1093,28447),(20242,1093,28448),(20251,1094,28457),(20252,1094,28458),(20253,1094,28459),(20254,1094,28460),(20255,1094,28461),(20256,1094,28462),(20248,1095,28454),(20249,1095,28455),(20250,1095,28456),(20257,1095,28463),(20258,1095,28464),(20259,1095,28465),(20266,1096,28478),(20267,1096,28479),(20260,1097,28466),(20261,1097,28467),(20268,1098,28480),(20269,1098,28481),(20265,1099,28477),(20262,1100,28474),(20263,1100,28475),(20264,1100,28476),(20273,1101,28485),(20274,1101,28486),(20275,1101,28487),(20276,1101,28488),(20277,1101,28489),(20278,1101,28490),(20270,1102,28482),(20271,1102,28483),(20272,1102,28484),(20279,1102,28491),(20280,1102,28492),(20282,1103,28496),(20281,1104,28495),(21057,1105,28503),(21058,1105,28504),(21067,1105,28513),(21073,1105,28519),(21074,1105,28520),(21075,1105,28521),(21076,1105,28522),(21077,1105,28523),(21086,1105,28532),(21059,1106,28505),(21060,1106,28506),(21061,1106,28507),(21066,1106,28512),(21078,1106,28524),(21079,1106,28525),(21080,1106,28526),(21081,1106,28527),(21082,1106,28528),(21055,1107,28501),(21062,1107,28508),(21063,1107,28509),(21064,1107,28510),(21071,1107,28517),(21083,1107,28529),(21084,1107,28530),(21085,1107,28531),(21056,1108,28502),(21068,1108,28514),(21069,1108,28515),(21070,1108,28516),(21072,1108,28518),(21065,1109,28511),(21827,1110,28533),(21828,1110,28534),(21829,1110,28535),(21830,1110,28536),(21831,1110,28537),(21832,1110,28538),(21833,1110,28539),(21834,1110,28540),(21835,1110,28541),(21836,1110,28542),(21837,1110,28543),(21838,1110,28544),(21839,1110,28545),(21840,1110,28546),(21841,1110,28547),(21842,1110,28548),(21843,1110,28549),(21844,1110,28550),(21845,1110,28551),(21846,1110,28552),(21847,1110,28553),(21848,1110,28554),(21849,1110,28555),(21850,1110,28556),(21851,1110,28557),(21852,1110,28558),(21853,1110,28559),(21854,1110,28560),(21855,1110,28561),(21856,1110,28562),(21857,1110,28563),(21858,1110,28564),(21859,1110,28565),(21860,1110,28566),(21861,1110,28567),(21862,1110,28568),(21863,1110,28569),(21864,1110,28570),(21865,1110,28571),(21866,1110,28572),(21867,1110,28573),(21868,1110,28574),(21869,1110,28575),(21870,1111,28576),(21871,1111,28577),(21872,1111,28578),(21873,1111,28579),(21874,1111,28580),(21875,1111,28581),(21876,1111,28582),(21877,1111,28583),(21878,1111,28584),(21879,1111,28585),(21880,1111,28586),(21881,1111,28587),(21882,1111,28588),(21883,1111,28589),(21884,1111,28590),(21885,1111,28591),(21886,1111,28592),(21887,1111,28593),(21888,1111,28594),(21889,1111,28595),(21890,1111,28596),(21891,1111,28597),(21892,1111,28598),(21893,1111,28599),(21894,1111,28600),(21895,1111,28601),(21896,1111,28602),(21897,1111,28603),(21898,1111,28604),(21899,1111,28605),(21900,1111,28606),(21901,1111,28607),(21911,1112,28618),(21913,1112,28619),(21915,1112,28620),(21917,1112,28621),(21919,1112,28622),(21921,1112,28623),(21923,1112,28624),(21925,1112,28625),(21927,1112,28626),(21929,1112,28627),(21931,1112,28628),(21933,1112,28629),(21935,1112,28630),(21937,1112,28631),(21939,1112,28632),(21959,1113,28646),(21960,1113,28647),(21961,1113,28648),(21962,1113,28649),(21963,1113,28650),(21987,1113,28673),(21990,1113,28674),(21989,1113,28675),(21986,1113,28676),(21988,1113,28677),(21910,1114,28617),(21942,1114,28633),(21944,1114,28634),(21949,1114,28638),(21951,1114,28639),(21945,1115,28635),(21946,1115,28636),(21947,1115,28637),(21955,1115,28642),(21956,1115,28643),(21957,1116,28644),(21958,1116,28645),(21976,1116,28663),(21978,1116,28664),(21977,1116,28665),(21985,1116,28666),(21979,1116,28667),(21982,1116,28668),(21981,1116,28669),(21980,1116,28670),(21984,1116,28671),(21983,1116,28672),(21905,1117,28613),(21906,1117,28614),(21909,1117,28617),(21941,1117,28633),(21943,1117,28634),(21948,1117,28638),(21950,1117,28639),(21952,1117,28640),(21912,1118,28618),(21914,1118,28619),(21916,1118,28620),(21918,1118,28621),(21920,1118,28622),(21922,1118,28623),(21924,1118,28624),(21926,1118,28625),(21928,1118,28626),(21930,1118,28627),(21932,1118,28628),(21934,1118,28629),(21936,1118,28630),(21938,1118,28631),(21940,1118,28632),(21993,1118,28680),(21907,1119,28615),(21908,1119,28616),(21992,1119,28679),(21953,1120,28640),(21954,1120,28641),(21902,1121,28610),(21903,1121,28611),(21904,1121,28612),(21991,1122,28678);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_tag`
--

DROP TABLE IF EXISTS `maintenance_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_tag` (
  `maintenancetagid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL DEFAULT '2',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`maintenancetagid`),
  KEY `maintenance_tag_1` (`maintenanceid`),
  CONSTRAINT `c_maintenance_tag_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_tag`
--

LOCK TABLES `maintenance_tag` WRITE;
/*!40000 ALTER TABLE `maintenance_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  `tags_evaltype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  UNIQUE KEY `maintenances_2` (`name`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_groupid`),
  UNIQUE KEY `maintenances_groups_1` (`maintenanceid`,`groupid`),
  KEY `maintenances_groups_2` (`groupid`),
  CONSTRAINT `c_maintenances_groups_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_groups_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_hostid`),
  UNIQUE KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`),
  KEY `maintenances_hosts_2` (`hostid`),
  CONSTRAINT `c_maintenances_hosts_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_hosts_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `timeperiodid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_timeperiodid`),
  UNIQUE KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`),
  KEY `maintenances_windows_2` (`timeperiodid`),
  CONSTRAINT `c_maintenances_windows_2` FOREIGN KEY (`timeperiodid`) REFERENCES `timeperiods` (`timeperiodid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_windows_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL,
  `valuemapid` bigint(20) unsigned NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `newvalue` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`),
  CONSTRAINT `c_mappings_1` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','not available'),(4,2,'1','available'),(5,2,'2','unknown'),(13,6,'1','Other'),(14,6,'2','OK'),(15,6,'3','Degraded'),(17,7,'1','Other'),(18,7,'2','Unknown'),(19,7,'3','OK'),(20,7,'4','NonCritical'),(21,7,'5','Critical'),(22,7,'6','NonRecoverable'),(23,5,'1','unknown'),(24,5,'2','batteryNormal'),(25,5,'3','batteryLow'),(26,4,'1','unknown'),(27,4,'2','notInstalled'),(28,4,'3','ok'),(29,4,'4','failed'),(30,4,'5','highTemperature'),(31,4,'6','replaceImmediately'),(32,4,'7','lowCapacity'),(33,3,'0','Running'),(34,3,'1','Paused'),(35,3,'3','Pause pending'),(36,3,'4','Continue pending'),(37,3,'5','Stop pending'),(38,3,'6','Stopped'),(39,3,'7','Unknown'),(40,3,'255','No such service'),(41,3,'2','Start pending'),(49,9,'1','unknown'),(50,9,'2','running'),(51,9,'3','warning'),(52,9,'4','testing'),(53,9,'5','down'),(61,8,'1','up'),(62,8,'2','down'),(63,8,'3','testing'),(64,8,'4','unknown'),(65,8,'5','dormant'),(66,8,'6','notPresent'),(67,8,'7','lowerLayerDown'),(68,10,'1','Up'),(69,11,'1','up'),(70,11,'2','down'),(71,11,'3','testing'),(72,12,'0','poweredOff'),(73,12,'1','poweredOn'),(74,12,'2','suspended'),(75,13,'0','gray'),(76,13,'1','green'),(77,13,'2','yellow'),(78,13,'3','red'),(79,14,'0','normal'),(80,14,'1','in maintenance'),(81,14,'2','no data collection'),(82,15,'0','Normal'),(83,15,'1','Low memory'),(84,16,'0','Automatic'),(85,16,'1','Automatic delayed'),(86,16,'2','Manual'),(87,16,'3','Disabled'),(88,16,'4','Unknown'),(89,17,'100','Continue'),(90,17,'101','Switching Protocols'),(91,17,'102','Processing'),(92,17,'200','OK'),(93,17,'201','Created'),(94,17,'202','Accepted'),(95,17,'203','Non-Authoritative Information'),(96,17,'204','No Content'),(97,17,'205','Reset Content'),(98,17,'206','Partial Content'),(99,17,'207','Multi-Status'),(100,17,'208','Already Reported'),(101,17,'226','IM Used'),(102,17,'300','Multiple Choices'),(103,17,'301','Moved Permanently'),(104,17,'302','Found'),(105,17,'303','See Other'),(106,17,'304','Not Modified'),(107,17,'305','Use Proxy'),(108,17,'306','Switch Proxy'),(109,17,'307','Temporary Redirect'),(110,17,'308','Permanent Redirect/Resume Incomplete'),(111,17,'400','Bad Request'),(112,17,'401','Unauthorized'),(113,17,'402','Payment Required'),(114,17,'403','Forbidden'),(115,17,'404','Not Found'),(116,17,'405','Method Not Allowed'),(117,17,'406','Not Acceptable'),(118,17,'407','Proxy Authentication Required'),(119,17,'408','Request Timeout'),(120,17,'409','Conflict'),(121,17,'410','Gone'),(122,17,'411','Length Required'),(123,17,'412','Precondition Failed'),(124,17,'413','Payload Too Large'),(125,17,'414','Request-URI Too Long'),(126,17,'415','Unsupported Media Type'),(127,17,'416','Requested Range Not Satisfiable'),(128,17,'417','Expectation Failed'),(129,17,'418','I\'m a Teapot'),(130,17,'419','Authentication Timeout'),(131,17,'420','Method Failure/Enhance Your Calm'),(132,17,'421','Misdirected Request'),(133,17,'422','Unprocessable Entity'),(134,17,'423','Locked'),(135,17,'424','Failed Dependency'),(136,17,'426','Upgrade Required'),(137,17,'428','Precondition Required'),(138,17,'429','Too Many Requests'),(139,17,'431','Request Header Fields Too Large'),(140,17,'440','Login Timeout'),(141,17,'444','No Response'),(142,17,'449','Retry With'),(143,17,'450','Blocked by Windows Parental Controls'),(144,17,'451','Unavailable for Legal Reasons/Redirect'),(145,17,'494','Request Header Too Large'),(146,17,'495','Cert Error'),(147,17,'496','No Cert'),(148,17,'497','HTTP to HTTPS'),(149,17,'498','Token Expired/Invalid'),(150,17,'499','Client Closed Request/Token Required'),(151,17,'500','Internal Server Error'),(152,17,'501','Not Implemented'),(153,17,'502','Bad Gateway'),(154,17,'503','Service Unavailable'),(155,17,'504','Gateway Timeout'),(156,17,'505','HTTP Version Not Supported'),(157,17,'506','Variant Also Negotiates'),(158,17,'507','Insufficient Storage'),(159,17,'508','Loop Detected'),(160,17,'509','Bandwidth Limit Exceeded'),(161,17,'510','Not Extended'),(162,17,'511','Network Authentication Required'),(163,17,'520','Unknown Error'),(164,17,'598','Network Read Timeout Error'),(165,17,'599','Network Connect Timeout Error'),(166,18,'1','ok'),(167,18,'2','unavailable'),(168,18,'3','nonoperational'),(169,19,'1','unknown'),(170,19,'2','halfDuplex'),(171,19,'3','fullDuplex'),(172,20,'1','up'),(173,20,'2','down'),(174,20,'3','testing'),(175,20,'4','unknown'),(176,20,'5','dormant'),(177,20,'6','notPresent'),(178,20,'7','lowerLayerDown'),(179,21,'1','other'),(180,21,'2','regular1822'),(181,21,'3','hdh1822'),(182,21,'4','ddnX25'),(183,21,'5','rfc877x25'),(184,21,'6','ethernetCsmacd'),(185,21,'7','iso88023Csmacd'),(186,21,'8','iso88024TokenBus'),(187,21,'9','iso88025TokenRing'),(188,21,'10','iso88026Man'),(189,21,'11','starLan'),(190,21,'12','proteon10Mbit'),(191,21,'13','proteon80Mbit'),(192,21,'14','hyperchannel'),(193,21,'15','fddi'),(194,21,'16','lapb'),(195,21,'17','sdlc'),(196,21,'18','ds1'),(197,21,'19','e1'),(198,21,'20','basicISDN'),(199,21,'21','primaryISDN'),(200,21,'22','propPointToPointSerial'),(201,21,'23','ppp'),(202,21,'24','softwareLoopback'),(203,21,'25','eon'),(204,21,'26','ethernet3Mbit'),(205,21,'27','nsip'),(206,21,'28','slip'),(207,21,'29','ultra'),(208,21,'30','ds3'),(209,21,'31','sip'),(210,21,'32','frameRelay'),(211,21,'33','rs232'),(212,21,'34','para'),(213,21,'35','arcnet'),(214,21,'36','arcnetPlus'),(215,21,'37','atm'),(216,21,'38','miox25'),(217,21,'39','sonet'),(218,21,'40','x25ple'),(219,21,'41','iso88022llc'),(220,21,'42','localTalk'),(221,21,'43','smdsDxi'),(222,21,'44','frameRelayService'),(223,21,'45','v35'),(224,21,'46','hssi'),(225,21,'47','hippi'),(226,21,'48','modem'),(227,21,'49','aal5'),(228,21,'50','sonetPath'),(229,21,'51','sonetVT'),(230,21,'52','smdsIcip'),(231,21,'53','propVirtual'),(232,21,'54','propMultiplexor'),(233,21,'55','ieee80212'),(234,21,'56','fibreChannel'),(235,21,'57','hippiInterface'),(236,21,'58','frameRelayInterconnect'),(237,21,'59','aflane8023'),(238,21,'60','aflane8025'),(239,21,'61','cctEmul'),(240,21,'62','fastEther'),(241,21,'63','isdn'),(242,21,'64','v11'),(243,21,'65','v36'),(244,21,'66','g703at64k'),(245,21,'67','g703at2mb'),(246,21,'68','qllc'),(247,21,'69','fastEtherFX'),(248,21,'70','channel'),(249,21,'71','ieee80211'),(250,21,'72','ibm370parChan'),(251,21,'73','escon'),(252,21,'74','dlsw'),(253,21,'75','isdns'),(254,21,'76','isdnu'),(255,21,'77','lapd'),(256,21,'78','ipSwitch'),(257,21,'79','rsrb'),(258,21,'80','atmLogical'),(259,21,'81','ds0'),(260,21,'82','ds0Bundle'),(261,21,'83','bsc'),(262,21,'84','async'),(263,21,'85','cnr'),(264,21,'86','iso88025Dtr'),(265,21,'87','eplrs'),(266,21,'88','arap'),(267,21,'89','propCnls'),(268,21,'90','hostPad'),(269,21,'91','termPad'),(270,21,'92','frameRelayMPI'),(271,21,'93','x213'),(272,21,'94','adsl'),(273,21,'95','radsl'),(274,21,'96','sdsl'),(275,21,'97','vdsl'),(276,21,'98','iso88025CRFPInt'),(277,21,'99','myrinet'),(278,21,'100','voiceEM'),(279,21,'101','voiceFXO'),(280,21,'102','voiceFXS'),(281,21,'103','voiceEncap'),(282,21,'104','voiceOverIp'),(283,21,'105','atmDxi'),(284,21,'106','atmFuni'),(285,21,'107','atmIma'),(286,21,'108','pppMultilinkBundle'),(287,21,'109','ipOverCdlc'),(288,21,'110','ipOverClaw'),(289,21,'111','stackToStack'),(290,21,'112','virtualIpAddress'),(291,21,'113','mpc'),(292,21,'114','ipOverAtm'),(293,21,'115','iso88025Fiber'),(294,21,'116','tdlc'),(295,21,'117','gigabitEthernet'),(296,21,'118','hdlc'),(297,21,'119','lapf'),(298,21,'120','v37'),(299,21,'121','x25mlp'),(300,21,'122','x25huntGroup'),(301,21,'123','trasnpHdlc'),(302,21,'124','interleave'),(303,21,'125','fast'),(304,21,'126','ip'),(305,21,'127','docsCableMaclayer'),(306,21,'128','docsCableDownstream'),(307,21,'129','docsCableUpstream'),(308,21,'130','a12MppSwitch'),(309,21,'131','tunnel'),(310,21,'132','coffee'),(311,21,'133','ces'),(312,21,'134','atmSubInterface'),(313,21,'135','l2vlan'),(314,21,'136','l3ipvlan'),(315,21,'137','l3ipxvlan'),(316,21,'138','digitalPowerline'),(317,21,'139','mediaMailOverIp'),(318,21,'140','dtm'),(319,21,'141','dcn'),(320,21,'142','ipForward'),(321,21,'143','msdsl'),(322,21,'144','ieee1394'),(323,21,'145','if-gsn'),(324,21,'146','dvbRccMacLayer'),(325,21,'147','dvbRccDownstream'),(326,21,'148','dvbRccUpstream'),(327,21,'149','atmVirtual'),(328,21,'150','mplsTunnel'),(329,21,'151','srp'),(330,21,'152','voiceOverAtm'),(331,21,'153','voiceOverFrameRelay'),(332,21,'154','idsl'),(333,21,'155','compositeLink'),(334,21,'156','ss7SigLink'),(335,21,'157','propWirelessP2P'),(336,21,'158','frForward'),(337,21,'159','rfc1483'),(338,21,'160','usb'),(339,21,'161','ieee8023adLag'),(340,21,'162','bgppolicyaccounting'),(341,21,'163','frf16MfrBundle'),(342,21,'164','h323Gatekeeper'),(343,21,'165','h323Proxy'),(344,21,'166','mpls'),(345,21,'167','mfSigLink'),(346,21,'168','hdsl2'),(347,21,'169','shdsl'),(348,21,'170','ds1FDL'),(349,21,'171','pos'),(350,21,'172','dvbAsiIn'),(351,21,'173','dvbAsiOut'),(352,21,'174','plc'),(353,21,'175','nfas'),(354,21,'176','tr008'),(355,21,'177','gr303RDT'),(356,21,'178','gr303IDT'),(357,21,'179','isup'),(358,21,'180','propDocsWirelessMaclayer'),(359,21,'181','propDocsWirelessDownstream'),(360,21,'182','propDocsWirelessUpstream'),(361,21,'183','hiperlan2'),(362,21,'184','propBWAp2Mp'),(363,21,'185','sonetOverheadChannel'),(364,21,'186','digitalWrapperOverheadChannel'),(365,21,'187','aal2'),(366,21,'188','radioMAC'),(367,21,'189','atmRadio'),(368,21,'190','imt'),(369,21,'191','mvl'),(370,21,'192','reachDSL'),(371,21,'193','frDlciEndPt'),(372,21,'194','atmVciEndPt'),(373,21,'195','opticalChannel'),(374,21,'196','opticalTransport'),(375,21,'197','propAtm'),(376,21,'198','voiceOverCable'),(377,21,'199','infiniband'),(378,21,'200','teLink'),(379,21,'201','q2931'),(380,21,'202','virtualTg'),(381,21,'203','sipTg'),(382,21,'204','sipSig'),(383,21,'205','docsCableUpstreamChannel'),(384,21,'206','econet'),(385,21,'207','pon155'),(386,21,'208','pon622'),(387,21,'209','bridge'),(388,21,'210','linegroup'),(389,21,'211','voiceEMFGD'),(390,21,'212','voiceFGDEANA'),(391,21,'213','voiceDID'),(392,21,'214','mpegTransport'),(393,21,'215','sixToFour'),(394,21,'216','gtp'),(395,21,'217','pdnEtherLoop1'),(396,21,'218','pdnEtherLoop2'),(397,21,'219','opticalChannelGroup'),(398,21,'220','homepna'),(399,21,'221','gfp'),(400,21,'222','ciscoISLvlan'),(401,21,'223','actelisMetaLOOP'),(402,21,'224','fcipLink'),(403,21,'225','rpr'),(404,21,'226','qam'),(405,21,'227','lmp'),(406,21,'228','cblVectaStar'),(407,21,'229','docsCableMCmtsDownstream'),(408,21,'230','adsl2'),(409,21,'231','macSecControlledIF'),(410,21,'232','macSecUncontrolledIF'),(411,21,'233','aviciOpticalEther'),(412,21,'234','atmbond'),(413,21,'235','voiceFGDOS'),(414,21,'236','mocaVersion1'),(415,21,'237','ieee80216WMAN'),(416,21,'238','adsl2plus'),(417,21,'239','dvbRcsMacLayer'),(418,21,'240','dvbTdm'),(419,21,'241','dvbRcsTdma'),(420,21,'242','x86Laps'),(421,21,'243','wwanPP'),(422,21,'244','wwanPP2'),(423,21,'245','voiceEBS'),(424,21,'246','ifPwType'),(425,21,'247','ilan'),(426,21,'248','pip'),(427,21,'249','aluELP'),(428,21,'250','gpon'),(429,21,'251','vdsl2'),(430,21,'252','capwapDot11Profile'),(431,21,'253','capwapDot11Bss'),(432,21,'254','capwapWtpVirtualRadio'),(433,21,'255','bits'),(434,21,'256','docsCableUpstreamRfPort'),(435,21,'257','cableDownstreamRfPort'),(436,21,'258','vmwareVirtualNic'),(437,21,'259','ieee802154'),(438,21,'260','otnOdu'),(439,21,'261','otnOtu'),(440,21,'262','ifVfiType'),(441,21,'263','g9981'),(442,21,'264','g9982'),(443,21,'265','g9983'),(444,21,'266','aluEpon'),(445,21,'267','aluEponOnu'),(446,21,'268','aluEponPhysicalUni'),(447,21,'269','aluEponLogicalLink'),(448,21,'270','aluGponOnu'),(449,21,'271','aluGponPhysicalUni'),(450,21,'272','vmwareNicTeam'),(451,21,'277','docsOfdmDownstream'),(452,21,'278','docsOfdmaUpstream'),(453,21,'279','gfast'),(454,21,'280','sdci'),(455,21,'281','xboxWireless'),(456,21,'282','fastdsl'),(457,21,'283','docsCableScte55d1FwdOob'),(458,21,'284','docsCableScte55d1RetOob'),(459,21,'285','docsCableScte55d2DsOob'),(460,21,'286','docsCableScte55d2UsOob'),(461,21,'287','docsCableNdf'),(462,21,'288','docsCableNdr'),(463,21,'289','ptm'),(464,21,'290','ghn'),(465,22,'0','not available'),(466,22,'1','available'),(467,22,'2','unknown'),(468,23,'1','deviceStateUnknown'),(469,23,'2','deviceNotEquipped'),(470,23,'3','deviceStateOk'),(471,23,'4','deviceStateFailed'),(472,23,'5','deviceStateOutOfService'),(473,24,'1','unknown'),(474,24,'2','faulty'),(475,24,'3','below-min'),(476,24,'4','nominal'),(477,24,'5','above-max'),(478,24,'6','absent'),(479,25,'1','online'),(480,25,'2','offline'),(481,25,'3','testing'),(482,25,'4','faulty'),(483,26,'1','other'),(484,26,'2','normal'),(485,26,'3','failure'),(486,27,'1','other'),(487,27,'2','normal'),(488,27,'3','failure'),(489,28,'1','normal'),(490,28,'2','warning'),(491,28,'3','critical'),(492,28,'4','shutdown'),(493,28,'5','notPresent'),(494,28,'6','notFunctioning'),(495,29,'1','true - on'),(496,29,'2','false - off'),(497,30,'1','up'),(498,30,'2','down'),(499,30,'3','absent'),(500,31,'1','up'),(501,31,'2','down'),(502,31,'3','absent'),(503,32,'1','noexist'),(504,32,'2','existnopower'),(505,32,'3','existreadypower'),(506,32,'4','normal'),(507,32,'5','powerbutabnormal'),(508,32,'6','unknown'),(509,33,'0','other'),(510,33,'1','working'),(511,33,'2','fail'),(512,33,'3','speed-0'),(513,33,'4','speed-low'),(514,33,'5','speed-middle'),(515,33,'6','speed-high'),(516,34,'0','other'),(517,34,'1','lowVoltage'),(518,34,'2','overCurrent'),(519,34,'3','working'),(520,34,'4','fail'),(521,34,'5','connect'),(522,34,'6','disconnect'),(523,35,'1','true'),(524,35,'2','false'),(525,36,'1','true - on'),(526,36,'2','false - off'),(527,37,'1','alarm'),(528,37,'2','normal'),(529,38,'1','notPresent'),(530,38,'2','presentOK'),(531,38,'3','presentNotOK'),(532,38,'4','presentPowerOff'),(533,39,'1','notSupported'),(534,39,'2','normal'),(535,39,'3','postFailure'),(536,39,'4','entityAbsent'),(537,39,'5','poeError'),(538,39,'6','stackError'),(539,39,'7','stackPortBlocked'),(540,39,'8','stackPortFailed'),(541,39,'9','sfpRecvError'),(542,39,'10','sfpSendError'),(543,39,'11','sfpBothError'),(544,39,'12','fanError'),(545,39,'13','psuError'),(546,39,'14','rpsError'),(547,39,'15','moduleFaulty'),(548,39,'16','sensorError'),(549,39,'17','hardwareFaulty'),(550,40,'1','unknown'),(551,40,'2','bad'),(552,40,'3','warning'),(553,40,'4','good'),(554,40,'5','notPresent'),(555,41,'1','normal'),(556,41,'2','abnormal'),(557,42,'1','online'),(558,42,'2','operational'),(559,42,'3','failed'),(560,42,'4','offline'),(561,43,'1','invalid'),(562,43,'2','bad'),(563,43,'3','warning'),(564,43,'4','good'),(565,43,'5','disabled'),(566,44,'1','unknown'),(567,44,'2','disabled'),(568,44,'3','failed'),(569,44,'4','warning'),(570,44,'5','standby'),(571,44,'6','engaged'),(572,44,'7','redundant'),(573,44,'8','notPresent'),(574,45,'1','normal'),(575,45,'2','high'),(576,45,'3','excessivelyHigh'),(577,45,'4','low'),(578,45,'5','excessivelyLow'),(579,45,'6','noSensor'),(580,45,'7','unknown'),(581,46,'1','other'),(582,46,'2','off'),(583,46,'3','on - RedAlarm'),(584,47,'1','unknown'),(585,47,'2','running'),(586,47,'3','ready'),(587,47,'4','reset'),(588,47,'5','runningAtFullSpeed'),(589,47,'6','down or off'),(590,47,'7','standby'),(591,48,'1','unknown'),(592,48,'2','disabled'),(593,48,'3','enabled'),(594,48,'4','testing'),(595,49,'1','operational'),(596,49,'2','failed'),(597,49,'3','powering'),(598,49,'4','notpowering'),(599,49,'5','notpresent'),(600,50,'1','operational'),(601,50,'2','failed'),(602,50,'3','powering'),(603,50,'4','notpowering'),(604,50,'5','notpresent'),(605,51,'1','normal'),(606,51,'2','warning'),(607,51,'3','critical'),(608,51,'4','shutdown'),(609,51,'5','notpresent'),(610,51,'6','notoperational'),(611,52,'0','normal'),(612,52,'1','abnormal'),(613,53,'0','normal'),(614,53,'1','abnormal'),(615,53,'2','not available'),(616,54,'1','other'),(617,54,'2','ok'),(618,54,'3','degraded'),(619,54,'4','failed'),(620,55,'1','other'),(621,55,'2','unknown'),(622,55,'3','system'),(623,55,'4','systemBoard'),(624,55,'5','ioBoard'),(625,55,'6','cpu'),(626,55,'7','memory'),(627,55,'8','storage'),(628,55,'9','removableMedia'),(629,55,'10','powerSupply'),(630,55,'11','ambient'),(631,55,'12','chassis'),(632,55,'13','bridgeCard'),(633,56,'1','other'),(634,56,'2','ida'),(635,56,'3','idaExpansion'),(636,56,'4','ida-2'),(637,56,'5','smart'),(638,56,'6','smart-2e'),(639,56,'7','smart-2p'),(640,56,'8','smart-2sl'),(641,56,'9','smart-3100es'),(642,56,'10','smart-3200'),(643,56,'11','smart-2dh'),(644,56,'12','smart-221'),(645,56,'13','sa-4250es'),(646,56,'14','sa-4200'),(647,56,'15','sa-integrated'),(648,56,'16','sa-431'),(649,56,'17','sa-5300'),(650,56,'18','raidLc2'),(651,56,'19','sa-5i'),(652,56,'20','sa-532'),(653,56,'21','sa-5312'),(654,56,'22','sa-641'),(655,56,'23','sa-642'),(656,56,'24','sa-6400'),(657,56,'25','sa-6400em'),(658,56,'26','sa-6i'),(659,56,'27','sa-generic'),(660,56,'29','sa-p600'),(661,56,'30','sa-p400'),(662,56,'31','sa-e200'),(663,56,'32','sa-e200i'),(664,56,'33','sa-p400i'),(665,56,'34','sa-p800'),(666,56,'35','sa-e500'),(667,56,'36','sa-p700m'),(668,56,'37','sa-p212'),(669,56,'38','sa-p410'),(670,56,'39','sa-p410i'),(671,56,'40','sa-p411'),(672,56,'41','sa-b110i'),(673,56,'42','sa-p712m'),(674,56,'43','sa-p711m'),(675,56,'44','sa-p812'),(676,57,'1','other'),(677,57,'2','ok'),(678,57,'3','failed'),(679,57,'4','predictiveFailure'),(680,58,'0','nonRecoverable'),(681,58,'2','critical'),(682,58,'4','nonCritical'),(683,58,'255','normal'),(684,59,'1','other'),(685,59,'2','unknown'),(686,59,'3','ok'),(687,59,'4','nonCritical'),(688,59,'5','critical'),(689,59,'6','nonRecoverable'),(690,60,'1','other'),(691,60,'2','unknown'),(692,60,'3','ok'),(693,60,'4','nonCriticalUpper'),(694,60,'5','criticalUpper'),(695,60,'6','nonRecoverableUpper'),(696,60,'7','nonCriticalLower'),(697,60,'8','criticalLower'),(698,60,'9','nonRecoverableLower'),(699,60,'10','failed'),(700,61,'1','other'),(701,61,'2','unknown'),(702,61,'3','ok'),(703,61,'4','nonCritical'),(704,61,'5','critical'),(705,61,'6','nonRecoverable'),(706,62,'0','ok'),(707,62,'1','failed'),(708,63,'1','Unknown'),(709,63,'2','HDD'),(710,63,'3','SSD'),(711,64,'1','Unknown'),(712,64,'2','Ready'),(713,64,'3','Failed'),(714,64,'4','Degraded'),(715,64,'5','Missing'),(716,64,'6','Charging'),(717,64,'7','Below threshold'),(718,65,'1','Other'),(719,65,'2','RAID-0'),(720,65,'3','RAID-1'),(721,65,'4','RAID-5'),(722,65,'5','RAID-6'),(723,65,'6','RAID-10'),(724,65,'7','RAID-50'),(725,65,'8','RAID-60'),(726,65,'9','Concatenated RAID 1'),(727,65,'10','Concatenated RAID 5'),(728,66,'1','Not applicable'),(729,66,'2','Reconstructing'),(730,66,'3','Resynching'),(731,66,'4','Initializing'),(732,66,'5','Background init'),(733,67,'1','Write Through'),(734,67,'2','Write Back'),(735,67,'3','Force Write Back'),(736,68,'1','No Read Ahead'),(737,68,'2','Read Ahead'),(738,68,'3','Adaptive Read Ahead'),(739,69,'1','Unknown'),(740,69,'2','Online'),(741,69,'3','Failed'),(742,69,'4','Degraded'),(743,70,'1','other'),(744,70,'2','ok'),(745,70,'3','replaceDrive'),(746,70,'4','replaceDriveSSDWearOut'),(747,71,'1','other'),(748,71,'2','invalid'),(749,71,'3','enabled'),(750,71,'4','tmpDisabled'),(751,71,'5','permDisabled'),(752,71,'6','cacheModFlashMemNotAttached'),(753,71,'7','cacheModDegradedFailsafeSpeed'),(754,71,'8','cacheModCriticalFailure'),(755,71,'9','cacheReadCacheNotMapped'),(756,72,'1','Other'),(757,72,'2','Ok'),(758,72,'3','Recharging'),(759,72,'4','Failed'),(760,72,'5','Degraded'),(761,72,'6','Not Present'),(762,72,'7','Capacitor failed'),(763,73,'1','Other'),(764,73,'2','rotatingPlatters'),(765,73,'3','solidState'),(766,74,'0','other'),(767,74,'2','none'),(768,74,'3','RAID-1/RAID-10'),(769,74,'4','RAID-4'),(770,74,'5','RAID-5'),(771,74,'7','RAID-6'),(772,74,'8','RAID-50'),(773,74,'9','RAID-60'),(774,74,'10','RAID-1 ADM'),(775,74,'11','RAID-10 ADM'),(776,75,'1','other'),(777,75,'2','ok'),(778,75,'3','failed'),(779,75,'4','unconfigured'),(780,75,'5','recovering'),(781,75,'6','readyForRebuild'),(782,75,'7','rebuilding'),(783,75,'8','wrongDrive'),(784,75,'9','badConnect'),(785,75,'10','overheating'),(786,75,'11','shutdown'),(787,75,'12','expanding'),(788,75,'13','notAvailable'),(789,75,'14','queuedForExpansion'),(790,75,'15','multipathAccessDegraded'),(791,75,'16','erasing'),(792,75,'17','predictiveSpareRebuildReady'),(793,75,'18','rapidParityInitInProgress'),(794,75,'19','rapidParityInitPending'),(795,75,'20','noAccessEncryptedNoCntlrKey'),(796,75,'21','unencryptedToEncryptedInProgress'),(797,75,'22','newLogDrvKeyRekeyInProgress'),(798,75,'23','noAccessEncryptedCntlrEncryptnNotEnbld'),(799,75,'24','unencryptedToEncryptedNotStarted'),(800,75,'25','newLogDrvKeyRekeyRequestReceived'),(801,56,'45','sw-1210m'),(802,56,'46','sa-p220i'),(803,56,'47','sa-p222'),(804,56,'48','sa-p420'),(805,56,'49','sa-p420i'),(806,56,'50','sa-p421'),(807,56,'51','sa-b320i'),(808,56,'52','sa-p822'),(809,56,'53','sa-p721m'),(810,56,'54','sa-b120i'),(811,56,'55','hps-1224'),(812,56,'56','hps-1228'),(813,56,'57','hps-1228m'),(814,56,'58','sa-p822se'),(815,56,'59','hps-1224e'),(816,56,'60','hps-1228e'),(817,56,'61','hps-1228em'),(818,56,'62','sa-p230i'),(819,56,'63','sa-p430i'),(820,56,'64','sa-p430'),(821,56,'65','sa-p431'),(822,56,'66','sa-p731m'),(823,56,'67','sa-p830i'),(824,56,'68','sa-p830'),(825,56,'69','sa-p831'),(826,56,'70','sa-p530'),(827,56,'71','sa-p531'),(828,56,'72','sa-p244br'),(829,56,'73','sa-p246br'),(830,56,'74','sa-p440'),(831,56,'75','sa-p440ar'),(832,56,'76','sa-p441'),(833,56,'77','sa-p741m'),(834,56,'78','sa-p840'),(835,56,'79','sa-p841'),(836,56,'80','sh-h240ar'),(837,56,'81','sh-h244br'),(838,56,'82','sh-h240'),(839,56,'83','sh-h241'),(840,56,'84','sa-b140i'),(841,56,'85','sh-generic'),(842,56,'88','sa-p840ar');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `sendto` varchar(1024) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(1024) NOT NULL DEFAULT '1-7,00:00-24:00',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`),
  CONSTRAINT `c_media_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_media_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,3,1,'contato@maxmilhas.com.br',0,63,'1-7,00:00-24:00');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL DEFAULT '',
  `smtp_server` varchar(255) NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) NOT NULL DEFAULT '',
  `smtp_email` varchar(255) NOT NULL DEFAULT '',
  `exec_path` varchar(255) NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `passwd` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_security` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_peer` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_host` int(11) NOT NULL DEFAULT '0',
  `smtp_authentication` int(11) NOT NULL DEFAULT '0',
  `exec_params` varchar(255) NOT NULL DEFAULT '',
  `maxsessions` int(11) NOT NULL DEFAULT '1',
  `maxattempts` int(11) NOT NULL DEFAULT '3',
  `attempt_interval` varchar(32) NOT NULL DEFAULT '10s',
  PRIMARY KEY (`mediatypeid`),
  UNIQUE KEY `media_type_1` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,0,'Email','mail.example.com','example.com','zabbix@example.com','','','','',0,25,0,0,0,0,'',1,3,'10s'),(2,3,'Jabber','','','','','','jabber@example.com','zabbix',0,25,0,0,0,0,'',1,3,'10s'),(3,2,'SMS','','','','','/dev/ttyS0','','',0,25,0,0,0,0,'',1,3,'10s');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand`
--

DROP TABLE IF EXISTS `opcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand` (
  `operationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `scriptid` bigint(20) unsigned DEFAULT NULL,
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` varchar(64) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opcommand_1` (`scriptid`),
  CONSTRAINT `c_opcommand_2` FOREIGN KEY (`scriptid`) REFERENCES `scripts` (`scriptid`),
  CONSTRAINT `c_opcommand_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand`
--

LOCK TABLES `opcommand` WRITE;
/*!40000 ALTER TABLE `opcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_grp`
--

DROP TABLE IF EXISTS `opcommand_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_grp` (
  `opcommand_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opcommand_grpid`),
  KEY `opcommand_grp_1` (`operationid`),
  KEY `opcommand_grp_2` (`groupid`),
  CONSTRAINT `c_opcommand_grp_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`),
  CONSTRAINT `c_opcommand_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_grp`
--

LOCK TABLES `opcommand_grp` WRITE;
/*!40000 ALTER TABLE `opcommand_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_hst`
--

DROP TABLE IF EXISTS `opcommand_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_hst` (
  `opcommand_hstid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcommand_hstid`),
  KEY `opcommand_hst_1` (`operationid`),
  KEY `opcommand_hst_2` (`hostid`),
  CONSTRAINT `c_opcommand_hst_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_opcommand_hst_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_hst`
--

LOCK TABLES `opcommand_hst` WRITE;
/*!40000 ALTER TABLE `opcommand_hst` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_hst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`),
  CONSTRAINT `c_opconditions_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '1',
  `esc_step_to` int(11) NOT NULL DEFAULT '1',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `recovery` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`),
  CONSTRAINT `c_operations_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,2,6,'0',1,1,0,0),(2,2,4,'0',1,1,0,0),(3,3,0,'0',1,1,0,0),(4,4,0,'0',1,1,0,0),(5,5,0,'0',1,1,0,0),(6,6,0,'0',1,1,0,0),(7,3,11,'0',1,1,0,1),(8,4,11,'0',1,1,0,1),(9,5,11,'0',1,1,0,1),(10,6,11,'0',1,1,0,1),(11,7,0,'0',1,1,0,0),(12,7,0,'0',1,1,0,1);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opgroup`
--

DROP TABLE IF EXISTS `opgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opgroup` (
  `opgroupid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opgroupid`),
  UNIQUE KEY `opgroup_1` (`operationid`,`groupid`),
  KEY `opgroup_2` (`groupid`),
  CONSTRAINT `c_opgroup_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`),
  CONSTRAINT `c_opgroup_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opgroup`
--

LOCK TABLES `opgroup` WRITE;
/*!40000 ALTER TABLE `opgroup` DISABLE KEYS */;
INSERT INTO `opgroup` VALUES (1,2,2);
/*!40000 ALTER TABLE `opgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinventory`
--

DROP TABLE IF EXISTS `opinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinventory` (
  `operationid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  CONSTRAINT `c_opinventory_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinventory`
--

LOCK TABLES `opinventory` WRITE;
/*!40000 ALTER TABLE `opinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage`
--

DROP TABLE IF EXISTS `opmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage` (
  `operationid` bigint(20) unsigned NOT NULL,
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opmessage_1` (`mediatypeid`),
  CONSTRAINT `c_opmessage_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`),
  CONSTRAINT `c_opmessage_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage`
--

LOCK TABLES `opmessage` WRITE;
/*!40000 ALTER TABLE `opmessage` DISABLE KEYS */;
INSERT INTO `opmessage` VALUES (3,1,'Problem: {EVENT.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL),(4,1,'','',NULL),(5,1,'','',NULL),(6,1,'','',NULL),(7,1,'Resolved: {EVENT.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL),(8,1,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',NULL),(9,1,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',NULL),(10,1,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',NULL),(11,1,'Problem: {EVENT.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL),(12,1,'Resolved: {EVENT.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL);
/*!40000 ALTER TABLE `opmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_grp`
--

DROP TABLE IF EXISTS `opmessage_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_grp` (
  `opmessage_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_grpid`),
  UNIQUE KEY `opmessage_grp_1` (`operationid`,`usrgrpid`),
  KEY `opmessage_grp_2` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_grp`
--

LOCK TABLES `opmessage_grp` WRITE;
/*!40000 ALTER TABLE `opmessage_grp` DISABLE KEYS */;
INSERT INTO `opmessage_grp` VALUES (1,3,7),(2,4,7),(3,5,7),(4,6,7),(5,11,7),(6,12,7);
/*!40000 ALTER TABLE `opmessage_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_usr`
--

DROP TABLE IF EXISTS `opmessage_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_usr` (
  `opmessage_usrid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_usrid`),
  UNIQUE KEY `opmessage_usr_1` (`operationid`,`userid`),
  KEY `opmessage_usr_2` (`userid`),
  CONSTRAINT `c_opmessage_usr_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_opmessage_usr_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_usr`
--

LOCK TABLES `opmessage_usr` WRITE;
/*!40000 ALTER TABLE `opmessage_usr` DISABLE KEYS */;
/*!40000 ALTER TABLE `opmessage_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optemplate`
--

DROP TABLE IF EXISTS `optemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optemplate` (
  `optemplateid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`optemplateid`),
  UNIQUE KEY `optemplate_1` (`operationid`,`templateid`),
  KEY `optemplate_2` (`templateid`),
  CONSTRAINT `c_optemplate_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_optemplate_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optemplate`
--

LOCK TABLES `optemplate` WRITE;
/*!40000 ALTER TABLE `optemplate` DISABLE KEYS */;
INSERT INTO `optemplate` VALUES (1,1,10001);
/*!40000 ALTER TABLE `optemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `r_clock` int(11) NOT NULL DEFAULT '0',
  `r_ns` int(11) NOT NULL DEFAULT '0',
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(2048) NOT NULL DEFAULT '',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `problem_1` (`source`,`object`,`objectid`),
  KEY `problem_2` (`r_clock`),
  KEY `problem_3` (`r_eventid`),
  CONSTRAINT `c_problem_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_problem_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1,3,4,23261,1554851621,874424918,NULL,0,0,NULL,NULL,'No \"ipmi poller\" processes started.',0,0),(2,3,0,13476,1554851621,874424918,NULL,0,0,NULL,NULL,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,ipmi poller,avg,busy].avg(10m)\": item is not supported.\".',0,0),(3,3,4,23262,1554851622,875064072,NULL,0,0,NULL,NULL,'No \"java poller\" processes started.',0,0),(4,3,0,13477,1554851622,875064072,NULL,0,0,NULL,NULL,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,java poller,avg,busy].avg(10m)\": item is not supported.\".',0,0),(5,3,4,25367,1554851627,877564765,NULL,0,0,NULL,NULL,'No \"ipmi manager\" processes started.',0,0),(6,3,4,23267,1554851627,877667007,NULL,0,0,NULL,NULL,'No \"snmp trapper\" processes started.',0,0),(7,3,0,13482,1554851627,877667007,NULL,0,0,NULL,NULL,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,snmp trapper,avg,busy].avg(10m)\": item is not supported.\".',0,0),(8,3,0,13563,1554851627,877564765,NULL,0,0,NULL,NULL,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,ipmi manager,avg,busy].avg(10m)\": item is not supported.\".',0,0),(9,3,4,23328,1554851628,878260877,NULL,0,0,NULL,NULL,'No \"vmware collector\" processes started.',0,0),(10,3,0,13436,1554851628,878260877,NULL,0,0,NULL,NULL,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,vmware collector,avg,busy].avg(10m)\": item is not supported.\".',0,0),(11,3,0,13491,1554851631,811424317,15,1554851901,38467906,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:agent.ping.nodata(5m)\": item does not have enough data after server start or item creation.\".',0,0),(12,3,4,23635,1554851635,883507770,NULL,0,0,NULL,NULL,'No \"vmware collector\" processes started.',0,0),(13,3,0,13537,1554851635,883507770,NULL,0,0,NULL,NULL,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[vmware,buffer,pused].max(10m)\": item is not supported.\".',0,0),(14,0,0,13491,1554851901,38467906,17,1554852007,210948103,NULL,0,'Zabbix agent on Zabbix server is unreachable for 5 minutes',0,3),(16,3,0,13502,1554851913,139896557,24,1554852513,653536080,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:system.uptime.change(0)\": cannot get values from value cache.\".',0,0),(18,3,0,15908,1554852038,180656451,20,1554852338,439781345,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:agent.ping.nodata(5m)\": item does not have enough data after server start or item creation.\".',0,0),(19,0,0,15908,1554852338,439781345,27,1554853491,348665190,NULL,0,'Zabbix agent on API ViaCep is unreachable for 5 minutes',0,3),(21,3,0,13492,1554852488,627378269,35,1554856088,845535843,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:agent.version.diff(0)\": cannot get values from value cache.\".',0,0),(22,3,0,13499,1554852507,646840808,36,1554856107,878769928,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:system.hostname.diff(0)\": cannot get values from value cache.\".',0,0),(23,3,0,13501,1554852512,651533150,37,1554856112,883356493,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:system.uname.diff(0)\": cannot get values from value cache.\".',0,0),(25,3,0,13503,1554852515,657943048,38,1554856115,889455348,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:vfs.file.cksum[/etc/passwd].diff(0)\": cannot get values from value cache.\".',0,0),(26,3,0,13509,1554852527,675194917,39,1554856127,904676222,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:agent.hostname.diff(0)\": cannot get values from value cache.\".',0,0),(28,3,0,15907,1554854210,493430371,41,1554857810,151196893,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:agent.hostname.diff(0)\": cannot get values from value cache.\".',0,0),(29,3,0,15909,1554854212,495443407,42,1554857812,157061057,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:agent.version.diff(0)\": cannot get values from value cache.\".',0,0),(30,3,0,15916,1554854233,533545387,43,1554857833,198899292,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:system.hostname.diff(0)\": cannot get values from value cache.\".',0,0),(31,3,0,15918,1554854238,539986554,44,1554857838,207111157,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:system.uname.diff(0)\": cannot get values from value cache.\".',0,0),(32,3,0,15919,1554854239,540961486,34,1554854839,305082351,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:system.uptime.change(0)\": cannot get values from value cache.\".',0,0),(33,3,0,15920,1554854241,543747739,45,1554857841,211468876,NULL,0,'Cannot evaluate expression: \"Cannot evaluate function \"API ViaCep:vfs.file.cksum[/etc/passwd].diff(0)\": cannot get values from value cache.\".',0,0),(40,3,4,28680,1554857610,854495521,46,1554857880,263932940,NULL,0,'Value \"0.000824\" of type \"string\" is not suitable for value type \"Numeric (unsigned)\"',0,0),(47,3,4,28665,1554858705,432673506,NULL,0,0,NULL,NULL,'Cannot find information for this network interface in /proc/net/dev.',0,0),(48,3,4,28666,1554858706,433886391,NULL,0,0,NULL,NULL,'Cannot find information for this network interface in /proc/net/dev.',0,0),(49,3,4,28670,1554858710,439470140,NULL,0,0,NULL,NULL,'Cannot find information for this network interface in /proc/net/dev.',0,0),(50,3,4,28671,1554858711,440254304,NULL,0,0,NULL,NULL,'Cannot find information for this network interface in /proc/net/dev.',0,0),(51,0,0,15930,1554858838,655039780,52,1554858898,742089841,NULL,0,'HTTP service is down on API ViaCep',0,5);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_tag`
--

DROP TABLE IF EXISTS `problem_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_tag` (
  `problemtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`problemtagid`),
  KEY `problem_tag_1` (`eventid`,`tag`,`value`),
  CONSTRAINT `c_problem_tag_1` FOREIGN KEY (`eventid`) REFERENCES `problem` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_tag`
--

LOCK TABLES `problem_tag` WRITE;
/*!40000 ALTER TABLE `problem_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `idx` varchar(96) NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(96) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`),
  CONSTRAINT `c_profiles_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'web.login.attempt.failed',0,0,0,'','',2),(2,1,'web.login.attempt.ip',0,0,0,'192.168.15.78','',3),(3,1,'web.login.attempt.clock',0,0,1554851700,'','',2),(4,1,'web.dashbrd.dashboardid',0,1,0,'','',1),(5,1,'web.menu.config.last',0,0,0,'hostgroups.php','',3),(6,1,'web.config.groupid',0,0,0,'','',1),(7,1,'web.latest.groupid',0,4,0,'','',1),(8,1,'web.hosts.php.sort',0,0,0,'name','',3),(9,1,'web.hosts.php.sortorder',0,0,0,'ASC','',3),(10,1,'web.paging.lastpage',0,0,0,'hostgroups.php','',3),(11,1,'web.config.hostid',0,10263,0,'','',1),(12,1,'web.latest.hostid',0,10084,0,'','',1),(13,1,'web.applications.php.sort',0,0,0,'name','',3),(14,1,'web.applications.php.sortorder',0,0,0,'ASC','',3),(15,1,'web.items.filter_groupid',0,0,0,'','',1),(16,1,'web.items.filter_hostid',0,10263,0,'','',1),(17,1,'web.items.filter_application',0,0,0,'','',3),(18,1,'web.items.filter_name',0,0,0,'','',3),(19,1,'web.items.filter_type',0,0,-1,'','',2),(20,1,'web.items.filter_key',0,0,0,'','',3),(21,1,'web.items.filter_snmp_community',0,0,0,'','',3),(22,1,'web.items.filter_snmpv3_securityname',0,0,0,'','',3),(23,1,'web.items.filter_snmp_oid',0,0,0,'','',3),(24,1,'web.items.filter_port',0,0,0,'','',3),(25,1,'web.items.filter_value_type',0,0,-1,'','',2),(26,1,'web.items.filter_delay',0,0,0,'','',3),(27,1,'web.items.filter_history',0,0,0,'','',3),(28,1,'web.items.filter_trends',0,0,0,'','',3),(29,1,'web.items.filter_status',0,0,-1,'','',2),(30,1,'web.items.filter_state',0,0,-1,'','',2),(31,1,'web.items.filter_templated_items',0,0,-1,'','',2),(32,1,'web.items.filter_with_triggers',0,0,-1,'','',2),(33,1,'web.items.filter_discovery',0,0,-1,'','',2),(34,1,'web.items.filter_ipmi_sensor',0,0,0,'','',3),(35,1,'web.items.subfilter_apps',0,0,0,'','',3),(36,1,'web.items.subfilter_types',0,0,0,'','',3),(37,1,'web.items.subfilter_value_types',0,0,0,'','',3),(38,1,'web.items.subfilter_status',0,0,0,'','',3),(39,1,'web.items.subfilter_state',0,0,0,'','',3),(40,1,'web.items.subfilter_templated_items',0,0,0,'','',3),(41,1,'web.items.subfilter_with_triggers',0,0,0,'','',3),(42,1,'web.items.subfilter_hosts',0,0,0,'','',3),(43,1,'web.items.subfilter_interval',0,0,0,'','',3),(44,1,'web.items.subfilter_history',0,0,0,'','',3),(45,1,'web.items.subfilter_trends',0,0,0,'','',3),(46,1,'web.items.subfilter_discovery',0,0,0,'','',3),(47,1,'web.items.php.sort',0,0,0,'name','',3),(48,1,'web.items.php.sortorder',0,0,0,'ASC','',3),(49,1,'web.paging.page',0,0,1,'','',2),(50,1,'web..groupid',0,4,0,'','',1),(51,1,'web.hostgroups.php.sort',0,0,0,'name','',3),(52,1,'web.hostgroups.php.sortorder',0,0,0,'ASC','',3),(53,1,'web.templates.php.groupid',0,0,0,'','',1),(54,1,'web.templates.php.sort',0,0,0,'name','',3),(55,1,'web.templates.php.sortorder',0,0,0,'ASC','',3),(56,1,'web.host_discovery.php.sort',0,0,0,'name','',3),(57,1,'web.host_discovery.php.sortorder',0,0,0,'ASC','',3),(58,1,'web.graphs.php.sort',0,0,0,'name','',3),(59,1,'web.graphs.php.sortorder',0,0,0,'ASC','',3),(60,1,'web.menu.view.last',0,0,0,'latest.php','',3),(61,1,'web.latest.php.sort',0,0,0,'name','',3),(62,1,'web.latest.php.sortorder',0,0,0,'ASC','',3),(63,1,'web.latest.filter.select',0,0,0,'','',3),(64,1,'web.latest.filter.show_without_data',0,0,1,'','',2),(65,1,'web.latest.filter.show_details',0,0,0,'','',2),(66,1,'web.latest.filter.application',0,0,0,'','',3),(67,1,'web.latest.filter.hostids',0,0,0,'10263','',3),(68,1,'web.discoveryconf.php.sort',0,0,0,'name','',3),(69,1,'web.discoveryconf.php.sortorder',0,0,0,'ASC','',3),(70,1,'web.actionconf.php.sort',0,0,0,'name','',3),(71,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(72,1,'web.correlation.php.sort',0,0,0,'name','',3),(73,1,'web.correlation.php.sortorder',0,0,0,'ASC','',3),(74,1,'web.view.groupid',0,15,0,'','',1),(75,1,'web.view.hostid',0,10263,0,'','',1),(76,1,'web.view.graphid',0,812,0,'','',1),(77,1,'web.latest.graphid',0,812,0,'','',1),(78,1,'web.screens.graphid',0,821,0,'','',1),(79,1,'web.triggers.php.sort',0,0,0,'description','',3),(80,1,'web.triggers.php.sortorder',0,0,0,'ASC','',3),(81,1,'web.menu.admin.last',0,0,0,'users.php','',3),(82,1,'web.users.filter.usrgrpid',0,0,0,'','',1),(83,1,'web.users.php.sort',0,0,0,'alias','',3),(84,1,'web.users.php.sortorder',0,0,0,'ASC','',3),(85,1,'web.templates.filter_name',0,0,0,'snmp','',3),(86,1,'web.httpconf.php.sort',0,0,0,'name','',3),(87,1,'web.httpconf.php.sortorder',0,0,0,'ASC','',3),(88,1,'web.trigger_prototypes.php.sort',0,0,0,'description','',3),(89,1,'web.trigger_prototypes.php.sortorder',0,0,0,'ASC','',3),(90,1,'web.item.graph.filter.from',28680,0,0,'now-3h','',3),(91,1,'web.item.graph.filter.to',28680,0,0,'now','',3),(92,1,'web.httpmon.php.sort',0,0,0,'name','',3),(93,1,'web.httpmon.php.sortorder',0,0,0,'ASC','',3),(94,1,'web.problem.sort',0,0,0,'clock','',3),(95,1,'web.problem.sortorder',0,0,0,'DESC','',3),(96,1,'web.problem.filter.application',0,0,0,'','',3),(97,1,'web.problem.filter.name',0,0,0,'','',3),(98,1,'web.problem.filter.severity',0,0,5,'','',2),(99,1,'web.problem.filter.age_state',0,0,0,'','',2),(100,1,'web.problem.filter.age',0,0,14,'','',2),(101,1,'web.problem.filter.evaltype',0,0,0,'','',2),(102,1,'web.problem.filter.show_tags',0,0,3,'','',2),(103,1,'web.problem.filter.tag_name_format',0,0,0,'','',2),(104,1,'web.problem.filter.tag_priority',0,0,0,'','',3),(105,1,'web.problem.filter.show_suppressed',0,0,0,'','',2),(106,1,'web.problem.filter.unacknowledged',0,0,0,'','',2),(107,1,'web.problem.filter.compact_view',0,0,0,'','',2),(108,1,'web.problem.filter.show_timeline',0,0,1,'','',2),(109,1,'web.problem.filter.details',0,0,0,'','',2),(110,1,'web.problem.filter.highlight_row',0,0,0,'','',2),(111,1,'web.problem.filter.show_latest_values',0,0,0,'','',2),(113,1,'web..hostid',0,10084,0,'','',1);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(255) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned DEFAULT NULL,
  `dns` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `test_string` text NOT NULL,
  PRIMARY KEY (`regexpid`),
  UNIQUE KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
INSERT INTO `regexps` VALUES (1,'File systems for discovery','ext3'),(2,'Network interfaces for discovery','eth0'),(3,'Storage devices for SNMP discovery','/boot'),(4,'Windows service names for discovery','SysmonLog'),(5,'Windows service startup states for discovery','automatic');
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`),
  CONSTRAINT `c_rights_2` FOREIGN KEY (`id`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_rights_1` FOREIGN KEY (`groupid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_user`
--

DROP TABLE IF EXISTS `screen_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_user` (
  `screenuserid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenuserid`),
  UNIQUE KEY `screen_user_1` (`screenid`,`userid`),
  KEY `c_screen_user_2` (`userid`),
  CONSTRAINT `c_screen_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_user_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_user`
--

LOCK TABLES `screen_user` WRITE;
/*!40000 ALTER TABLE `screen_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_usrgrp`
--

DROP TABLE IF EXISTS `screen_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_usrgrp` (
  `screenusrgrpid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenusrgrpid`),
  UNIQUE KEY `screen_usrgrp_1` (`screenid`,`usrgrpid`),
  KEY `c_screen_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_screen_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_usrgrp_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_usrgrp`
--

LOCK TABLES `screen_usrgrp` WRITE;
/*!40000 ALTER TABLE `screen_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`),
  KEY `screens_1` (`templateid`),
  KEY `c_screens_3` (`userid`),
  CONSTRAINT `c_screens_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_screens_1` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (3,'System performance',2,3,10001,NULL,0),(4,'Zabbix server health',2,3,10047,NULL,0),(5,'System performance',2,2,10076,NULL,0),(6,'System performance',2,2,10077,NULL,0),(7,'System performance',2,2,10075,NULL,0),(9,'System performance',2,3,10074,NULL,0),(10,'System performance',2,3,10078,NULL,0),(16,'Zabbix server',2,2,NULL,1,0),(17,'Zabbix proxy health',2,2,10048,NULL,0),(18,'System performance',1,2,10079,NULL,0),(19,'System performance',2,2,10081,NULL,0),(20,'MySQL performance',2,1,10170,NULL,1),(21,'Zabbix server health',2,3,10261,NULL,1),(22,'Zabbix proxy health',2,2,10262,NULL,1);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '1',
  `rowspan` int(11) NOT NULL DEFAULT '1',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  `sort_triggers` int(11) NOT NULL DEFAULT '0',
  `application` varchar(255) NOT NULL DEFAULT '',
  `max_columns` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`screenitemid`),
  KEY `screens_items_1` (`screenid`),
  CONSTRAINT `c_screens_items_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (44,16,2,1,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(45,16,0,524,400,156,0,1,1,1,0,0,0,0,'',0,0,'',3),(46,16,0,525,400,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(175,17,0,532,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(176,17,0,530,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(177,17,0,531,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(178,17,0,529,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(179,4,0,392,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(180,4,0,404,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(181,4,0,406,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(182,4,0,410,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(183,4,0,527,500,160,0,2,1,1,0,0,0,0,'',0,0,'',3),(184,4,0,788,500,160,1,2,1,1,0,0,0,0,'',0,0,'',3),(185,20,0,650,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(186,20,0,649,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(187,5,0,469,500,148,0,0,1,1,0,1,0,0,'',0,0,'',3),(188,5,0,471,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(189,5,0,498,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(190,5,0,540,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(191,7,0,463,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(192,7,0,462,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(193,7,0,541,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(194,7,0,464,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(195,6,0,475,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(196,6,0,474,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(197,6,0,542,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(198,3,0,433,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(199,3,0,387,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(200,3,0,533,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(201,3,0,436,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(202,3,1,10009,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(203,3,1,10013,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(204,18,0,487,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(205,18,0,543,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(206,9,0,457,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(207,9,0,456,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(208,9,0,544,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(209,9,0,458,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(210,9,1,22838,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(211,9,1,22837,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(212,10,0,481,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(213,10,0,480,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(214,10,0,545,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(215,10,0,482,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(216,10,1,22998,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(217,10,1,22997,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(218,19,0,495,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(219,19,0,546,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(220,19,1,23140,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(221,19,1,23138,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(222,21,0,802,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(223,21,0,799,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(224,21,0,800,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(225,21,0,798,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(226,21,0,797,500,160,0,2,1,1,0,0,0,0,'',0,0,'',3),(227,21,0,801,500,160,1,2,1,1,0,0,0,0,'',0,0,'',3),(228,22,0,806,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(229,22,0,804,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(230,22,0,805,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(231,22,0,803,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `command` varchar(255) NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `confirmation` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`scriptid`),
  UNIQUE KEY `scripts_3` (`name`),
  KEY `scripts_1` (`usrgrpid`),
  KEY `scripts_2` (`groupid`),
  CONSTRAINT `c_scripts_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`),
  CONSTRAINT `c_scripts_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','ping -c 3 {HOST.CONN}; case $? in [01]) true;; *) false;; esac',2,NULL,NULL,'','',0,2),(2,'Traceroute','/bin/traceroute {HOST.CONN}',2,NULL,NULL,'','',0,2),(3,'Detect operating system','sudo /usr/bin/nmap -O {HOST.CONN}',2,7,NULL,'','',0,2);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`),
  CONSTRAINT `c_service_alarms_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`),
  CONSTRAINT `c_services_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `serviceupid` bigint(20) unsigned NOT NULL,
  `servicedownid` bigint(20) unsigned NOT NULL,
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_1` (`servicedownid`),
  CONSTRAINT `c_services_links_2` FOREIGN KEY (`servicedownid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE,
  CONSTRAINT `c_services_links_1` FOREIGN KEY (`serviceupid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`),
  CONSTRAINT `c_services_times_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL,
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`,`lastaccess`),
  CONSTRAINT `c_sessions_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1e93870c8a4e30ee60953f7076c61204',1,1554859034,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_1` (`slideshowid`),
  KEY `slides_2` (`screenid`),
  CONSTRAINT `c_slides_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_slides_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_user`
--

DROP TABLE IF EXISTS `slideshow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_user` (
  `slideshowuserid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowuserid`),
  UNIQUE KEY `slideshow_user_1` (`slideshowid`,`userid`),
  KEY `c_slideshow_user_2` (`userid`),
  CONSTRAINT `c_slideshow_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_user_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_user`
--

LOCK TABLES `slideshow_user` WRITE;
/*!40000 ALTER TABLE `slideshow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_usrgrp`
--

DROP TABLE IF EXISTS `slideshow_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_usrgrp` (
  `slideshowusrgrpid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowusrgrpid`),
  UNIQUE KEY `slideshow_usrgrp_1` (`slideshowid`,`usrgrpid`),
  KEY `c_slideshow_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_slideshow_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_usrgrp_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_usrgrp`
--

LOCK TABLES `slideshow_usrgrp` WRITE;
/*!40000 ALTER TABLE `slideshow_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(32) NOT NULL DEFAULT '30s',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slideshowid`),
  UNIQUE KEY `slideshows_1` (`name`),
  KEY `c_slideshows_3` (`userid`),
  CONSTRAINT `c_slideshows_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_trigger`
--

DROP TABLE IF EXISTS `sysmap_element_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_trigger` (
  `selement_triggerid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`selement_triggerid`),
  UNIQUE KEY `sysmap_element_trigger_1` (`selementid`,`triggerid`),
  KEY `c_sysmap_element_trigger_2` (`triggerid`),
  CONSTRAINT `c_sysmap_element_trigger_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_element_trigger_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_trigger`
--

LOCK TABLES `sysmap_element_trigger` WRITE;
/*!40000 ALTER TABLE `sysmap_element_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_url`
--

DROP TABLE IF EXISTS `sysmap_element_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_url` (
  `sysmapelementurlid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sysmapelementurlid`),
  UNIQUE KEY `sysmap_element_url_1` (`selementid`,`name`),
  CONSTRAINT `c_sysmap_element_url_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_url`
--

LOCK TABLES `sysmap_element_url` WRITE;
/*!40000 ALTER TABLE `sysmap_element_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_shape`
--

DROP TABLE IF EXISTS `sysmap_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_shape` (
  `sysmap_shapeid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `text` text NOT NULL,
  `font` int(11) NOT NULL DEFAULT '9',
  `font_size` int(11) NOT NULL DEFAULT '11',
  `font_color` varchar(6) NOT NULL DEFAULT '000000',
  `text_halign` int(11) NOT NULL DEFAULT '0',
  `text_valign` int(11) NOT NULL DEFAULT '0',
  `border_type` int(11) NOT NULL DEFAULT '0',
  `border_width` int(11) NOT NULL DEFAULT '1',
  `border_color` varchar(6) NOT NULL DEFAULT '000000',
  `background_color` varchar(6) NOT NULL DEFAULT '',
  `zindex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmap_shapeid`),
  KEY `sysmap_shape_1` (`sysmapid`),
  CONSTRAINT `c_sysmap_shape_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_shape`
--

LOCK TABLES `sysmap_shape` WRITE;
/*!40000 ALTER TABLE `sysmap_shape` DISABLE KEYS */;
INSERT INTO `sysmap_shape` VALUES (1,1,0,0,0,680,15,'{MAP.NAME}',9,11,'000000',0,0,0,0,'000000','',0);
/*!40000 ALTER TABLE `sysmap_shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_url`
--

DROP TABLE IF EXISTS `sysmap_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_url` (
  `sysmapurlid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapurlid`),
  UNIQUE KEY `sysmap_url_1` (`sysmapid`,`name`),
  CONSTRAINT `c_sysmap_url_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_url`
--

LOCK TABLES `sysmap_url` WRITE;
/*!40000 ALTER TABLE `sysmap_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_user`
--

DROP TABLE IF EXISTS `sysmap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_user` (
  `sysmapuserid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapuserid`),
  UNIQUE KEY `sysmap_user_1` (`sysmapid`,`userid`),
  KEY `c_sysmap_user_2` (`userid`),
  CONSTRAINT `c_sysmap_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_user_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_user`
--

LOCK TABLES `sysmap_user` WRITE;
/*!40000 ALTER TABLE `sysmap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_usrgrp`
--

DROP TABLE IF EXISTS `sysmap_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_usrgrp` (
  `sysmapusrgrpid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapusrgrpid`),
  UNIQUE KEY `sysmap_usrgrp_1` (`sysmapid`,`usrgrpid`),
  KEY `c_sysmap_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_sysmap_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_usrgrp_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_usrgrp`
--

LOCK TABLES `sysmap_usrgrp` WRITE;
/*!40000 ALTER TABLE `sysmap_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '600',
  `height` int(11) NOT NULL DEFAULT '400',
  `backgroundid` bigint(20) unsigned DEFAULT NULL,
  `label_type` int(11) NOT NULL DEFAULT '2',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  `expandproblem` int(11) NOT NULL DEFAULT '1',
  `markelements` int(11) NOT NULL DEFAULT '0',
  `show_unack` int(11) NOT NULL DEFAULT '0',
  `grid_size` int(11) NOT NULL DEFAULT '50',
  `grid_show` int(11) NOT NULL DEFAULT '1',
  `grid_align` int(11) NOT NULL DEFAULT '1',
  `label_format` int(11) NOT NULL DEFAULT '0',
  `label_type_host` int(11) NOT NULL DEFAULT '2',
  `label_type_hostgroup` int(11) NOT NULL DEFAULT '2',
  `label_type_trigger` int(11) NOT NULL DEFAULT '2',
  `label_type_map` int(11) NOT NULL DEFAULT '2',
  `label_type_image` int(11) NOT NULL DEFAULT '2',
  `label_string_host` varchar(255) NOT NULL DEFAULT '',
  `label_string_hostgroup` varchar(255) NOT NULL DEFAULT '',
  `label_string_trigger` varchar(255) NOT NULL DEFAULT '',
  `label_string_map` varchar(255) NOT NULL DEFAULT '',
  `label_string_image` varchar(255) NOT NULL DEFAULT '',
  `iconmapid` bigint(20) unsigned DEFAULT NULL,
  `expand_macros` int(11) NOT NULL DEFAULT '0',
  `severity_min` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  `show_suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapid`),
  UNIQUE KEY `sysmaps_1` (`name`),
  KEY `sysmaps_2` (`backgroundid`),
  KEY `sysmaps_3` (`iconmapid`),
  KEY `c_sysmaps_3` (`userid`),
  CONSTRAINT `c_sysmaps_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_sysmaps_1` FOREIGN KEY (`backgroundid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_2` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (1,'Local network',680,200,NULL,0,0,1,1,1,0,50,1,1,0,2,2,2,2,2,'','','','','',NULL,1,0,1,0,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned DEFAULT NULL,
  `iconid_on` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(2048) NOT NULL DEFAULT '',
  `label_location` int(11) NOT NULL DEFAULT '-1',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `iconid_disabled` bigint(20) unsigned DEFAULT NULL,
  `iconid_maintenance` bigint(20) unsigned DEFAULT NULL,
  `elementsubtype` int(11) NOT NULL DEFAULT '0',
  `areatype` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `viewtype` int(11) NOT NULL DEFAULT '0',
  `use_iconmap` int(11) NOT NULL DEFAULT '1',
  `application` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`selementid`),
  KEY `sysmaps_elements_1` (`sysmapid`),
  KEY `sysmaps_elements_2` (`iconid_off`),
  KEY `sysmaps_elements_3` (`iconid_on`),
  KEY `sysmaps_elements_4` (`iconid_disabled`),
  KEY `sysmaps_elements_5` (`iconid_maintenance`),
  CONSTRAINT `c_sysmaps_elements_5` FOREIGN KEY (`iconid_maintenance`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_elements_2` FOREIGN KEY (`iconid_off`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_3` FOREIGN KEY (`iconid_on`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_4` FOREIGN KEY (`iconid_disabled`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
INSERT INTO `sysmaps_elements` VALUES (1,1,10084,0,185,NULL,'{HOST.NAME}\r\n{HOST.CONN}',0,111,61,NULL,NULL,0,0,200,200,0,0,'');
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL,
  `linkid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`),
  KEY `sysmaps_link_triggers_2` (`triggerid`),
  CONSTRAINT `c_sysmaps_link_triggers_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_link_triggers_1` FOREIGN KEY (`linkid`) REFERENCES `sysmaps_links` (`linkid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `selementid1` bigint(20) unsigned NOT NULL,
  `selementid2` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  `label` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`),
  KEY `sysmaps_links_1` (`sysmapid`),
  KEY `sysmaps_links_2` (`selementid1`),
  KEY `sysmaps_links_3` (`selementid2`),
  CONSTRAINT `c_sysmaps_links_3` FOREIGN KEY (`selementid2`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_2` FOREIGN KEY (`selementid1`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_filter`
--

DROP TABLE IF EXISTS `tag_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_filter` (
  `tag_filterid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_filterid`),
  KEY `c_tag_filter_1` (`usrgrpid`),
  KEY `c_tag_filter_2` (`groupid`),
  CONSTRAINT `c_tag_filter_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_tag_filter_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_filter`
--

LOCK TABLES `tag_filter` WRITE;
/*!40000 ALTER TABLE `tag_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ttl` int(11) NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `task_1` (`status`,`proxy_hostid`),
  KEY `c_task_1` (`proxy_hostid`),
  CONSTRAINT `c_task_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_acknowledge`
--

DROP TABLE IF EXISTS `task_acknowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_acknowledge` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_acknowledge_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_acknowledge`
--

LOCK TABLES `task_acknowledge` WRITE;
/*!40000 ALTER TABLE `task_acknowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_acknowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_check_now`
--

DROP TABLE IF EXISTS `task_check_now`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_check_now` (
  `taskid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_check_now_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_check_now`
--

LOCK TABLES `task_check_now` WRITE;
/*!40000 ALTER TABLE `task_check_now` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_check_now` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_close_problem`
--

DROP TABLE IF EXISTS `task_close_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_close_problem` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_close_problem_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_close_problem`
--

LOCK TABLES `task_close_problem` WRITE;
/*!40000 ALTER TABLE `task_close_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_close_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command`
--

DROP TABLE IF EXISTS `task_remote_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command` (
  `taskid` bigint(20) unsigned NOT NULL,
  `command_type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  `alertid` bigint(20) unsigned DEFAULT NULL,
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command`
--

LOCK TABLES `task_remote_command` WRITE;
/*!40000 ALTER TABLE `task_remote_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command_result`
--

DROP TABLE IF EXISTS `task_remote_command_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command_result` (
  `taskid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_result_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command_result`
--

LOCK TABLES `task_remote_command_result` WRITE;
/*!40000 ALTER TABLE `task_remote_command_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL,
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '1',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_avg` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_max` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends`
--

LOCK TABLES `trends` WRITE;
/*!40000 ALTER TABLE `trends` DISABLE KEYS */;
INSERT INTO `trends` VALUES (10073,1554850800,46,0.4163,0.8616,1.0987),(10073,1554854400,60,1.0821,1.1012,1.1338),(10074,1554850800,46,0.0000,0.0029,0.0666),(10074,1554854400,60,0.0000,0.0022,0.0666),(10075,1554850800,46,0.0000,0.0000,0.0000),(10075,1554854400,60,0.0000,0.0000,0.0000),(10076,1554850800,46,0.0500,0.3188,0.6990),(10076,1554854400,60,0.6598,0.6867,0.8322),(10077,1554850800,46,0.0000,0.0000,0.0000),(10077,1554854400,60,0.0000,0.0000,0.0000),(10078,1554850800,46,0.0000,0.0101,0.0500),(10078,1554854400,60,0.0000,0.0100,0.0499),(23252,1554850800,47,0.0000,0.0000,0.0000),(23252,1554854400,60,0.0000,0.0000,0.0000),(23253,1554850800,47,0.0000,0.0289,0.1376),(23253,1554854400,60,0.0169,0.0265,0.0344),(23255,1554850800,47,0.0000,0.0095,0.4289),(23255,1554854400,60,0.0000,0.0000,0.0000),(23256,1554850800,47,0.0000,0.0580,1.2685),(23256,1554854400,60,0.0000,0.0260,0.0846),(23257,1554850800,47,0.0466,0.1551,1.0549),(23257,1554854400,60,0.0804,0.1639,0.5478),(23258,1554850800,47,0.0000,0.0029,0.1354),(23258,1554854400,60,0.0000,0.0003,0.0172),(23259,1554850800,47,0.0000,0.0387,1.1053),(23259,1554854400,60,0.0000,0.0153,0.0846),(23260,1554850800,47,0.0000,0.0152,0.7166),(23260,1554854400,60,0.0000,0.0000,0.0000),(23264,1554850800,47,0.0000,0.0663,1.1051),(23264,1554854400,60,0.0305,0.0537,0.0846),(23265,1554850800,47,0.0000,0.0138,0.6474),(23265,1554854400,60,0.0000,0.0000,0.0000),(23266,1554850800,47,0.0000,0.0034,0.1596),(23266,1554854400,60,0.0000,0.0000,0.0000),(23268,1554850800,47,0.0000,0.0170,0.8006),(23268,1554854400,60,0.0000,0.0000,0.0000),(23269,1554850800,47,0.0000,0.0029,0.1019),(23269,1554854400,60,0.0000,0.0005,0.0034),(23270,1554850800,47,0.0000,2.1958,5.1321),(23270,1554854400,60,0.0000,0.0000,0.0000),(23273,1554850800,47,3.3508,3.7250,3.9758),(23273,1554854400,60,3.9640,3.9702,3.9758),(23274,1554850800,47,0.0000,0.0000,0.0007),(23274,1554854400,60,0.0000,0.0000,0.0003),(23275,1554850800,47,0.2205,0.2206,0.2232),(23275,1554854400,60,0.2205,0.2205,0.2217),(23276,1554850800,47,0.0811,0.1916,0.3119),(23276,1554854400,60,0.3008,0.3140,0.3181),(23277,1554850800,46,0.5329,1.1858,1.7808),(23277,1554854400,60,1.7481,1.7902,1.9638),(23295,1554850800,40,0.0500,0.1190,0.2500),(23295,1554854400,60,0.0500,0.0675,0.1300),(23296,1554850800,40,0.0000,0.1358,0.7600),(23296,1554854400,60,0.0000,0.0398,0.3300),(23297,1554850800,40,0.0100,0.1368,0.4700),(23297,1554854400,60,0.0100,0.0458,0.1300),(23299,1554850800,40,78.7173,96.9904,98.6095),(23299,1554854400,60,90.3453,96.6413,98.6092),(23300,1554850800,40,0.0000,0.0000,0.0000),(23300,1554854400,60,0.0000,0.0000,0.0000),(23301,1554850800,40,0.2848,0.6694,1.3568),(23301,1554854400,60,0.3017,0.7471,2.3135),(23302,1554850800,42,0.0000,0.0000,0.0000),(23302,1554854400,60,0.0000,0.0000,0.0000),(23303,1554850800,41,0.0000,0.0364,0.1507),(23303,1554854400,60,0.0335,0.0626,0.1173),(23304,1554850800,41,0.0000,0.0000,0.0000),(23304,1554854400,60,0.0000,0.0000,0.0000),(23305,1554850800,41,0.1006,0.2926,2.0436),(23305,1554854400,60,0.1843,0.3372,0.8718),(23306,1554850800,41,0.7705,2.0242,17.7722),(23306,1554854400,60,0.7714,2.2001,9.2372),(23310,1554850800,41,99.9686,99.9686,99.9686),(23310,1554854400,60,99.9686,99.9686,99.9686),(23620,1554850800,47,0.2139,0.4054,0.4867),(23620,1554854400,60,0.4688,0.4827,0.5103),(23625,1554850800,46,0.3830,4.4223,5.5937),(23625,1554854400,60,5.1440,5.5161,5.9062),(23628,1554850800,46,0.0000,0.0159,0.1831),(23628,1554854400,60,0.0000,0.0003,0.0166),(23664,1554850800,47,0.0000,0.0058,0.2578),(23664,1554854400,60,0.0000,0.0008,0.0169),(25371,1554850800,47,0.0000,0.0185,0.7853),(25371,1554854400,60,0.0000,0.0071,0.0677),(25667,1554850800,47,0.0000,0.0150,0.5542),(25667,1554854400,60,0.0000,0.0028,0.0169),(25668,1554850800,47,0.0000,0.0054,0.1743),(25668,1554854400,60,0.0000,0.0004,0.0057),(28498,1554850800,41,0.0000,0.0000,0.0000),(28498,1554854400,60,0.0000,0.0000,0.0000),(28500,1554850800,40,0.0000,0.0000,0.0000),(28500,1554854400,60,0.0000,0.0000,0.0000),(28619,1554850800,16,0.0000,0.0000,0.0000),(28619,1554854400,60,0.0000,0.0000,0.0000),(28620,1554850800,15,0.0000,0.0047,0.0500),(28620,1554854400,60,0.0000,0.0012,0.0500),(28621,1554850800,16,0.0000,0.0044,0.0200),(28621,1554854400,60,0.0000,0.0003,0.0100),(28623,1554850800,15,0.0000,0.0000,0.0000),(28623,1554854400,60,0.0000,0.0000,0.0000),(28624,1554850800,16,0.0000,0.0000,0.0000),(28624,1554854400,60,0.0000,0.0000,0.0000),(28625,1554850800,15,96.3100,99.6535,100.0000),(28625,1554854400,60,99.5473,99.8573,99.9497),(28626,1554850800,15,0.0000,0.0000,0.0000),(28626,1554854400,60,0.0000,0.0000,0.0000),(28627,1554850800,16,0.0000,0.1079,1.4425),(28627,1554854400,60,0.0000,0.0131,0.1509),(28628,1554850800,15,0.0000,0.0000,0.0000),(28628,1554854400,60,0.0000,0.0003,0.0168),(28629,1554850800,15,0.0000,0.0179,0.0503),(28629,1554854400,60,0.0000,0.0212,0.0503),(28630,1554850800,16,0.0000,0.0000,0.0000),(28630,1554854400,60,0.0000,0.0000,0.0000),(28631,1554850800,15,0.0168,0.0570,0.3856),(28631,1554854400,60,0.0167,0.0570,0.1677),(28632,1554850800,15,0.0000,0.1542,1.7776),(28632,1554854400,60,0.0000,0.0517,0.1843),(28636,1554850800,15,99.8713,99.8713,99.8713),(28636,1554854400,60,99.8713,99.8713,99.8713),(28653,1554850800,32,98.8285,98.8285,98.8285),(28653,1554854400,60,98.8285,98.8285,98.8285),(28654,1554850800,32,99.9367,99.9367,99.9367),(28654,1554854400,60,99.9367,99.9367,99.9367),(28657,1554850800,32,76.0919,76.0929,76.0939),(28657,1554854400,60,76.0738,76.0872,76.0919),(28658,1554850800,32,84.0418,84.0418,84.0418),(28658,1554854400,60,84.0418,84.0418,84.0418),(28673,1554850800,3,74.2078,74.2078,74.2078),(28673,1554854400,60,74.2073,74.2075,74.2076),(28675,1554850800,3,34.1074,34.1074,34.1074),(28675,1554854400,60,34.1072,34.1073,34.1073),(28680,1554854400,4,0.0008,0.0011,0.0013);
/*!40000 ALTER TABLE `trends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends_uint`
--

DROP TABLE IF EXISTS `trends_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_avg` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends_uint`
--

LOCK TABLES `trends_uint` WRITE;
/*!40000 ALTER TABLE `trends_uint` DISABLE KEYS */;
INSERT INTO `trends_uint` VALUES (23271,1554850800,5,0,0,0),(23271,1554854400,6,0,0,0),(23272,1554850800,47,0,0,0),(23272,1554854400,60,0,0,0),(23287,1554850800,40,1,1,1),(23287,1554854400,60,1,1,1),(23289,1554850800,1,97834,97834,97834),(23290,1554850800,1,32768,32768,32768),(23291,1554850800,40,1,5,9),(23291,1554854400,60,3,5,8),(23292,1554850800,40,143,143,144),(23292,1554854400,60,143,143,145),(23293,1554850800,3,1554807130,1554807130,1554807130),(23293,1554854400,6,1554807130,1554807130,1554807130),(23294,1554850800,39,86,110,338),(23294,1554854400,60,98,122,205),(23298,1554850800,39,178,198,351),(23298,1554854400,60,196,212,255),(23308,1554850800,41,1554851968,1554853168,1554854368),(23308,1554854400,60,1554854428,1554856198,1554857968),(23309,1554850800,41,859557888,859557888,859557888),(23309,1554854400,60,859557888,859557888,859557888),(23311,1554850800,1,859828224,859828224,859828224),(23313,1554850800,5,44783,45983,47183),(23313,1554854400,6,47783,49283,50783),(23314,1554850800,41,2,2,2),(23314,1554854400,60,2,2,2),(23315,1554850800,1,3307433096,3307433096,3307433096),(23316,1554850800,41,409108480,422437563,430874624),(23316,1554854400,60,377950208,397435084,411508736),(23317,1554850800,1,1039327232,1039327232,1039327232),(23662,1554850800,47,0,0,0),(23662,1554854400,60,0,0,0),(28249,1554850800,47,0,0,0),(28249,1554854400,60,0,0,0),(28611,1554850800,16,1,1,1),(28611,1554854400,60,1,1,1),(28613,1554850800,1,94140,94140,94140),(28614,1554850800,1,32768,32768,32768),(28615,1554850800,16,2,2,5),(28615,1554854400,60,2,2,5),(28616,1554850800,15,119,119,119),(28616,1554854400,60,119,119,121),(28617,1554850800,1,1554847105,1554847105,1554847105),(28617,1554854400,6,1554847105,1554847105,1554847105),(28618,1554850800,16,60,63,77),(28618,1554854400,60,64,66,72),(28622,1554850800,14,205,210,216),(28622,1554854400,60,212,215,237),(28634,1554850800,16,1554853454,1554853904,1554854354),(28634,1554854400,60,1554854414,1554856184,1554857954),(28635,1554850800,15,2053607424,2053607424,2053607424),(28635,1554854400,60,2053607424,2053607424,2053607424),(28637,1554850800,1,2056253440,2056253440,2056253440),(28639,1554850800,1,7135,7135,7135),(28639,1554854400,6,7734,9234,10734),(28640,1554850800,16,3,3,3),(28640,1554854400,60,3,3,3),(28641,1554850800,1,4286018622,4286018622,4286018622),(28642,1554850800,15,632537088,633517397,635244544),(28642,1554854400,60,632188928,633733256,634892288),(28643,1554850800,1,1033146368,1033146368,1033146368),(28651,1554850800,31,912,3237,20080),(28651,1554854400,60,2744,4445,10360),(28652,1554850800,31,1016,18607,222448),(28652,1554854400,60,2840,23391,128272),(28655,1554850800,32,5053784064,5053849600,5053915136),(28655,1554854400,60,5052559360,5053471061,5053784064),(28656,1554850800,32,893579264,893579264,893579264),(28656,1554854400,60,893579264,893579264,893579264),(28659,1554850800,1,6641680384,6641680384,6641680384),(28660,1554850800,1,1063256064,1063256064,1063256064),(28661,1554850800,32,1587765248,1587830784,1587896320),(28661,1554854400,60,1587896320,1588208981,1589100544),(28662,1554850800,32,169676800,169676800,169676800),(28662,1554854400,60,169676800,169676800,169676800),(28663,1554850800,2,0,0,0),(28663,1554854400,60,16,21,112),(28664,1554850800,2,2408,2504,2600),(28664,1554854400,60,2312,2520,3968),(28665,1554850800,2,0,0,0),(28665,1554854400,60,24,30,136),(28666,1554850800,2,0,0,0),(28666,1554854400,60,0,0,0),(28667,1554850800,2,0,0,0),(28667,1554854400,60,0,0,0),(28668,1554850800,2,0,0,0),(28668,1554854400,60,40,47,152),(28669,1554850800,2,2000,2004,2008),(28669,1554854400,60,1888,2167,9552),(28670,1554850800,2,0,0,0),(28670,1554854400,60,40,47,152),(28671,1554850800,2,0,0,0),(28671,1554854400,60,0,0,8),(28672,1554850800,2,0,0,0),(28672,1554854400,60,0,0,0),(28674,1554850800,3,3392024576,3392024576,3392024576),(28674,1554854400,60,3392012288,3392018295,3392020480),(28676,1554850800,1,10498625536,10498625536,10498625536),(28677,1554850800,3,6553112576,6553112576,6553112576),(28677,1554854400,60,6553116672,6553118856,6553124864),(28678,1554850800,1,1,1,1),(28678,1554854400,60,1,1,1),(28679,1554854400,26,31576064,31576064,31576064);
/*!40000 ALTER TABLE `trends_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL,
  `triggerid_down` bigint(20) unsigned NOT NULL,
  `triggerid_up` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerdepid`),
  UNIQUE KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`),
  CONSTRAINT `c_trigger_depends_2` FOREIGN KEY (`triggerid_up`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_depends_1` FOREIGN KEY (`triggerid_down`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
INSERT INTO `trigger_depends` VALUES (4422,14195,14205),(4423,14196,14195),(4424,14196,14205),(4425,14197,14205),(4426,14198,14197),(4427,14198,14205),(4428,14200,14199),(4429,14201,14205),(4430,14202,14201),(4431,14202,14205),(4432,14204,14203),(4433,14206,14222),(4434,14207,14206),(4435,14207,14222),(4436,14208,14222),(4437,14209,14208),(4438,14209,14222),(4439,14210,14222),(4440,14211,14210),(4441,14211,14222),(4442,14212,14222),(4443,14213,14212),(4444,14213,14222),(4445,14214,14222),(4446,14215,14214),(4447,14215,14222),(4448,14217,14216),(4449,14218,14222),(4450,14219,14218),(4451,14219,14222),(4452,14220,14222),(4453,14221,14220),(4454,14221,14222),(4455,14223,14222),(4456,14224,14222),(4457,14224,14223),(4458,14225,14222),(4459,14226,14222),(4460,14226,14225),(4164,14246,14245),(4165,14250,14249),(4021,14252,14251),(4079,14253,14251),(4050,14253,14252),(4022,14289,14288),(4080,14290,14288),(4051,14290,14289),(4025,14294,14293),(4083,14295,14293),(4054,14295,14294),(4026,14312,14311),(4084,14313,14311),(4055,14313,14312),(4259,14318,14319),(4027,14328,14327),(4085,14329,14327),(4056,14329,14328),(4028,14348,14347),(4086,14349,14347),(4057,14349,14348),(4029,14357,14356),(4087,14358,14356),(4058,14358,14357),(4276,14372,14373),(4277,14375,14376),(4280,14380,14381),(4030,14390,14389),(4088,14391,14389),(4059,14391,14390),(4031,14404,14403),(4089,14405,14403),(4060,14405,14404),(4032,14452,14451),(4090,14453,14451),(4061,14453,14452),(4295,14460,14461),(4033,14469,14468),(4091,14470,14468),(4062,14470,14469),(4296,14476,14477),(4034,14487,14486),(4092,14488,14486),(4063,14488,14487),(4297,14495,14496),(4035,14506,14505),(4093,14507,14505),(4064,14507,14506),(4298,14511,15368),(4023,14525,14524),(4081,14526,14524),(4052,14526,14525),(4036,14535,14534),(4094,14536,14534),(4065,14536,14535),(4037,14545,14544),(4095,14546,14544),(4066,14546,14545),(4299,14551,14552),(4038,14583,14582),(4096,14584,14582),(4067,14584,14583),(4303,14589,14590),(4039,14599,14598),(4097,14600,14598),(4068,14600,14599),(4040,14616,14615),(4098,14617,14615),(4069,14617,14616),(4306,14624,14625),(4041,14653,14652),(4099,14654,14652),(4070,14654,14653),(4308,14658,14659),(4309,14664,14665),(4310,14668,14667),(4042,14674,14673),(4100,14675,14673),(4071,14675,14674),(4043,14692,14691),(4101,14693,14691),(4072,14693,14692),(4044,14705,14704),(4102,14706,14704),(4073,14706,14705),(4024,14718,14717),(4082,14719,14717),(4053,14719,14718),(4166,14862,14861),(4045,14870,14869),(4103,14871,14869),(4074,14871,14870),(4167,14876,14875),(4046,14883,14882),(4104,14884,14882),(4075,14884,14883),(4047,14907,14906),(4105,14908,14906),(4076,14908,14907),(4300,14914,14915),(4168,14922,14921),(4048,14929,14928),(4106,14930,14928),(4077,14930,14929),(4111,15161,14288),(4112,15162,14524),(4113,15163,14717),(4139,15170,14293),(4140,15171,14311),(4141,15172,14327),(4142,15173,14347),(4143,15174,14356),(4144,15175,14389),(4145,15176,14403),(4146,15177,14451),(4147,15178,14468),(4148,15179,14486),(4149,15180,14505),(4150,15181,14534),(4151,15182,14544),(4152,15183,14582),(4153,15184,14598),(4154,15185,14615),(4155,15186,14652),(4156,15187,14673),(4157,15188,14691),(4158,15189,14704),(4159,15190,14869),(4160,15191,14882),(4161,15192,14906),(4162,15193,14928),(4049,15221,15220),(4107,15222,15220),(4078,15222,15221),(4163,15224,15220),(4293,15332,15331),(4294,15334,15333),(4304,15335,15336),(4305,15338,15337),(4281,15342,15343),(4282,15345,15344),(4283,15347,15346),(4284,15348,15351),(4285,15349,15352),(4286,15350,15353),(4287,15357,15354),(4288,15358,15355),(4289,15359,15356),(4290,15363,15360),(4291,15364,15361),(4292,15365,15362),(4301,15374,15373),(4302,15376,15375),(4274,15380,15379),(4275,15382,15381),(4278,15384,15383),(4279,15386,15385),(4307,15387,14934),(4271,15390,14339),(4272,15392,15391),(4273,15394,15393),(4311,15396,15397),(4235,15550,15490),(4236,15551,15490),(4238,15553,15492),(4239,15554,15493),(4240,15555,15492),(4241,15556,15493),(4244,15559,15496),(4245,15560,15496),(4247,15562,15498),(4248,15563,15499),(4249,15564,15498),(4250,15565,15499),(4253,15568,15502),(4254,15569,15502),(4256,15571,15504),(4257,15572,15504),(4169,15574,15506),(4170,15575,15506),(4172,15577,15508),(4173,15578,15508),(4175,15580,15510),(4176,15581,15511),(4177,15582,15512),(4178,15583,15513),(4179,15584,15514),(4180,15585,15515),(4181,15586,15516),(4182,15587,15517),(4183,15588,15518),(4184,15589,15519),(4185,15590,15520),(4186,15591,15521),(4187,15592,15522),(4188,15593,15523),(4189,15594,15524),(4190,15595,15525),(4191,15596,15526),(4192,15597,15527),(4193,15598,15528),(4194,15599,15529),(4195,15600,15510),(4196,15601,15511),(4197,15602,15512),(4198,15603,15513),(4199,15604,15514),(4200,15605,15515),(4201,15606,15516),(4202,15607,15517),(4203,15608,15518),(4204,15609,15519),(4205,15610,15520),(4206,15611,15521),(4207,15612,15522),(4208,15613,15523),(4209,15614,15524),(4210,15615,15525),(4211,15616,15526),(4212,15617,15527),(4213,15618,15528),(4214,15619,15529),(4108,15642,15161),(4109,15643,15162),(4110,15644,15163),(4114,15645,15170),(4115,15646,15171),(4116,15647,15172),(4117,15648,15173),(4118,15649,15174),(4119,15650,15175),(4120,15651,15176),(4121,15652,15177),(4122,15653,15178),(4123,15654,15179),(4124,15655,15180),(4125,15656,15181),(4126,15657,15182),(4127,15658,15183),(4128,15659,15184),(4129,15660,15185),(4130,15661,15186),(4131,15662,15187),(4132,15663,15188),(4133,15664,15189),(4134,15665,15190),(4135,15666,15191),(4136,15667,15192),(4137,15668,15193),(4138,15669,15224),(4171,15670,15506),(4174,15671,15508),(4215,15672,15510),(4216,15673,15511),(4217,15674,15512),(4218,15675,15513),(4219,15676,15514),(4220,15677,15515),(4221,15678,15516),(4222,15679,15517),(4223,15680,15518),(4224,15681,15519),(4225,15682,15520),(4226,15683,15521),(4227,15684,15522),(4228,15685,15523),(4229,15686,15524),(4230,15687,15525),(4231,15688,15526),(4232,15689,15527),(4233,15690,15528),(4234,15691,15529),(4237,15692,15490),(4242,15693,15492),(4243,15694,15493),(4246,15695,15496),(4251,15696,15498),(4252,15697,15499),(4255,15698,15502),(4258,15699,15504),(4260,15702,15701),(4261,15703,15701),(4262,15703,15702),(4263,15704,15705),(4264,15705,15701),(4265,15706,15709),(4266,15707,15709),(4267,15708,15709),(4268,15713,15712),(4269,15714,15715),(4270,15721,15720),(4312,15724,15723),(4313,15725,15723),(4314,15725,15724),(4315,15726,15727),(4316,15727,15723),(4317,15729,15728),(4318,15730,15728),(4319,15730,15729),(4320,15733,15734),(4321,15736,15737),(4322,15740,15739),(4323,15742,15741),(4324,15744,15743),(4325,15746,15743),(4326,15748,15747),(4327,15750,15749),(4329,15751,15749),(4328,15751,15750),(4330,15752,15754),(4332,15753,15752),(4331,15753,15754),(4333,15756,15755),(4334,15757,15755),(4335,15757,15756),(4336,15758,15759),(4337,15759,15755),(4338,15761,15760),(4339,15763,15764),(4340,15766,15767),(4341,15769,15770),(4342,15772,15773),(4343,15775,15776),(4344,15778,15779),(4345,15782,15781),(4346,15784,15783),(4347,15786,15785),(4348,15788,15787),(4349,15789,15787),(4350,15789,15788),(4351,15791,15790),(4352,15793,15792),(4353,15794,15792),(4354,15797,15796),(4355,15799,15798),(4356,15800,15798),(4357,15800,15799),(4359,15801,15802),(4358,15802,15798),(4360,15804,15803),(4361,15805,15803),(4362,15805,15804),(4363,15807,15808),(4364,15810,15811),(4365,15813,15814),(4366,15820,15819),(4367,15821,15819),(4368,15821,15820),(4369,15822,15823),(4370,15823,15819),(4371,15825,15824),(4372,15826,15824),(4373,15826,15825),(4374,15828,15829),(4375,15831,15832),(4376,15834,15835),(4377,15841,15840),(4378,15842,15840),(4379,15842,15841),(4380,15843,15844),(4381,15844,15840),(4382,15845,15846);
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_discovery`
--

DROP TABLE IF EXISTS `trigger_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_discovery` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `parent_triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `trigger_discovery_1` (`parent_triggerid`),
  CONSTRAINT `c_trigger_discovery_2` FOREIGN KEY (`parent_triggerid`) REFERENCES `triggers` (`triggerid`),
  CONSTRAINT `c_trigger_discovery_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_discovery`
--

LOCK TABLES `trigger_discovery` WRITE;
/*!40000 ALTER TABLE `trigger_discovery` DISABLE KEYS */;
INSERT INTO `trigger_discovery` VALUES (15924,13505),(15925,13505),(15926,13506),(15927,13506),(15928,15922),(15929,15923);
/*!40000 ALTER TABLE `trigger_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_tag`
--

DROP TABLE IF EXISTS `trigger_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_tag` (
  `triggertagid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`triggertagid`),
  KEY `trigger_tag_1` (`triggerid`),
  CONSTRAINT `c_trigger_tag_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_tag`
--

LOCK TABLES `trigger_tag` WRITE;
/*!40000 ALTER TABLE `trigger_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `expression` varchar(2048) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `error` varchar(2048) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `recovery_mode` int(11) NOT NULL DEFAULT '0',
  `recovery_expression` varchar(2048) NOT NULL DEFAULT '',
  `correlation_mode` int(11) NOT NULL DEFAULT '0',
  `correlation_tag` varchar(255) NOT NULL DEFAULT '',
  `manual_close` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`,`lastchange`),
  KEY `triggers_3` (`templateid`),
  CONSTRAINT `c_triggers_1` FOREIGN KEY (`templateid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `alias` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `surname` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` varchar(32) NOT NULL DEFAULT '15m',
  `lang` varchar(5) NOT NULL DEFAULT 'en_GB',
  `refresh` varchar(32) NOT NULL DEFAULT '30s',
  `type` int(11) NOT NULL DEFAULT '1',
  `theme` varchar(128) NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','5fce1b3e34b520afeffb37ce08c7cd66','',1,'0','pt_BR','30s',3,'default',0,'192.168.15.78',1554851700,50),(2,'guest','','','d41d8cd98f00b204e9800998ecf8427e','',0,'15m','en_GB','30s',1,'default',0,'',0,50),(3,'MaxMilhas','MaxMilhas Teste Técnico','','6232a88878f9e0b112e2ff257edf5a68','',0,'0','pt_BR','30s',1,'dark-theme',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_1` (`usrgrpid`,`userid`),
  KEY `users_groups_2` (`userid`),
  CONSTRAINT `c_users_groups_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_groups_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (4,7,1),(5,7,3),(2,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  UNIQUE KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (7,'Zabbix administrators',0,0,0),(8,'Guests',1,0,0),(9,'Disabled',0,1,0),(11,'Enabled debug mode',0,0,1),(12,'No access to the frontend',3,0,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  UNIQUE KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(28,'CISCO-ENVMON-MIB::CiscoEnvMonState'),(55,'CPQHLTH-MIB::cpqHeTemperatureLocale'),(72,'CPQIDA-MIB::cpqDaAccelBattery'),(71,'CPQIDA-MIB::cpqDaAccelStatus'),(56,'CPQIDA-MIB::cpqDaCntlrModel'),(74,'CPQIDA-MIB::cpqDaLogDrvFaultTol'),(75,'CPQIDA-MIB::cpqDaLogDrvStatus'),(73,'CPQIDA-MIB::cpqDaPhyDrvMediaType'),(70,'CPQIDA-MIB::cpqDaPhyDrvSmartStatus'),(57,'CPQIDA-MIB::cpqDaPhyDrvStatus'),(54,'CPQSINFO-MIB::status'),(7,'Dell Open Manage System Status'),(18,'ENTITY-SENSORS-MIB::EntitySensorStatus'),(48,'ENTITY-STATE-MIB::EntityOperState'),(33,'EQUIPMENT-MIB::swFanStatus'),(34,'EQUIPMENT-MIB::swPowerStatus'),(19,'EtherLike-MIB::dot3StatsDuplexStatus'),(36,'EXTREME-SYSTEM-MIB::extremeFanOperational'),(37,'EXTREME-SYSTEM-MIB::extremeOverTemperatureAlarm'),(38,'EXTREME-SYSTEM-MIB::extremePowerSupplyStatus'),(30,'F10-S-SERIES-CHASSIS-MIB::chSysFanTrayOperStatus'),(31,'F10-S-SERIES-CHASSIS-MIB::chSysPowerSupplyOperStatus'),(29,'F10-S-SERIES-CHASSIS-MIB::extremeFanOperational'),(50,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesFanItemState'),(49,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesPowSupplyItemState'),(51,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesTempSensorState'),(27,'FOUNDRY-SN-AGENT-MIB::snChasFanOperStatus'),(26,'FOUNDRY-SN-AGENT-MIB::snChasPwrSupplyOperStatus'),(39,'HH3C-ENTITY-EXT-MIB::hh3cEntityExtErrorStatus'),(2,'Host availability'),(6,'HP Insight System Status'),(40,'HP-ICF-CHASSIS::hpicfSensorStatus'),(17,'HTTP response status code'),(41,'HUAWEI-ENTITY-EXTENT-MIB::hwEntityFanState'),(42,'ICS-CHASSIS-MIB::icsChassisFanOperStatus'),(44,'ICS-CHASSIS-MIB::icsChassisPowerSupplyOperStatus'),(43,'ICS-CHASSIS-MIB::icsChassisSensorSlotOperStatus'),(45,'ICS-CHASSIS-MIB::icsChassisTemperatureStatus'),(64,'IDRAC-MIB-SMIv2::batteryState'),(62,'IDRAC-MIB-SMIv2::BooleanType'),(59,'IDRAC-MIB-SMIv2::ObjectStatusEnum'),(61,'IDRAC-MIB-SMIv2::physicalDiskComponentStatus'),(63,'IDRAC-MIB-SMIv2::physicalDiskMediaType'),(60,'IDRAC-MIB-SMIv2::StatusProbeEnum'),(65,'IDRAC-MIB-SMIv2::virtualDiskLayout'),(66,'IDRAC-MIB-SMIv2::virtualDiskOperationalState'),(68,'IDRAC-MIB-SMIv2::virtualDiskReadPolicy'),(69,'IDRAC-MIB-SMIv2::virtualDiskState'),(67,'IDRAC-MIB-SMIv2::virtualDiskWritePolicy'),(20,'IF-MIB::ifOperStatus'),(21,'IF-MIB::ifType'),(58,'IMM-MIB::systemHealthStat'),(47,'JUNIPER-ALARM-MIB::jnxOperatingState'),(46,'JUNIPER-ALARM-MIB::jnxRedAlarmState'),(14,'Maintenance status'),(32,'MY-SYSTEM-MIB::mySystemFanIsNormal'),(52,'QTECH-MIB::sysFanStatus'),(53,'QTECH-MIB::sysPowerStatus'),(1,'Service state'),(9,'SNMP device status (hrDeviceStatus)'),(11,'SNMP interface status (ifAdminStatus)'),(8,'SNMP interface status (ifOperStatus)'),(25,'SW-MIB::swOperStatus'),(24,'SW-MIB::swSensorStatus'),(23,'TIMETRA-CHASSIS-MIB::TmnxDeviceState'),(35,'TruthValue'),(15,'Value cache operating mode'),(13,'VMware status'),(12,'VMware VirtualMachinePowerState'),(16,'Windows service startup type'),(3,'Windows service state'),(10,'Zabbix agent ping status'),(22,'zabbix.host.available');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widgetid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '1',
  `height` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`widgetid`),
  KEY `widget_1` (`dashboardid`),
  CONSTRAINT `c_widget_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
INSERT INTO `widget` VALUES (1,1,'systeminfo','',0,0,4,4),(2,1,'problemsbysv','',4,0,6,4),(3,1,'clock','',10,0,2,4),(4,1,'problems','',0,4,10,10),(5,1,'favmaps','',10,4,2,5),(6,1,'favgraphs','',10,9,2,5),(7,2,'problems','Zabbix server problems',0,0,10,4),(8,2,'clock','Local time',10,0,2,4),(9,2,'svggraph','Values processed per second',0,4,4,5),(10,2,'svggraph','Utilization of data collectors',4,4,4,5),(11,2,'svggraph','Utilization of internal processes',8,4,4,5),(12,2,'svggraph','Cache usage',0,9,4,5),(13,2,'svggraph','Value cache effectiveness',4,9,4,5),(14,2,'svggraph','Queue size',8,9,4,5);
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_field`
--

DROP TABLE IF EXISTS `widget_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_field` (
  `widget_fieldid` bigint(20) unsigned NOT NULL,
  `widgetid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `value_groupid` bigint(20) unsigned DEFAULT NULL,
  `value_hostid` bigint(20) unsigned DEFAULT NULL,
  `value_itemid` bigint(20) unsigned DEFAULT NULL,
  `value_graphid` bigint(20) unsigned DEFAULT NULL,
  `value_sysmapid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`widget_fieldid`),
  KEY `widget_field_1` (`widgetid`),
  KEY `widget_field_2` (`value_groupid`),
  KEY `widget_field_3` (`value_hostid`),
  KEY `widget_field_4` (`value_itemid`),
  KEY `widget_field_5` (`value_graphid`),
  KEY `widget_field_6` (`value_sysmapid`),
  CONSTRAINT `c_widget_field_6` FOREIGN KEY (`value_sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_1` FOREIGN KEY (`widgetid`) REFERENCES `widget` (`widgetid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_2` FOREIGN KEY (`value_groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_3` FOREIGN KEY (`value_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_4` FOREIGN KEY (`value_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_5` FOREIGN KEY (`value_graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_field`
--

LOCK TABLES `widget_field` WRITE;
/*!40000 ALTER TABLE `widget_field` DISABLE KEYS */;
INSERT INTO `widget_field` VALUES (1,2,0,'hide_empty_groups',1,'',NULL,NULL,NULL,NULL,NULL),(2,4,0,'show',3,'',NULL,NULL,NULL,NULL,NULL),(3,4,0,'show_tags',3,'',NULL,NULL,NULL,NULL,NULL),(4,7,3,'hostids',0,'',NULL,10084,NULL,NULL,NULL),(5,9,0,'ds.axisy.0',0,'',NULL,NULL,NULL,NULL,NULL),(6,9,0,'ds.fill.0',3,'',NULL,NULL,NULL,NULL,NULL),(7,9,0,'ds.missingdatafunc.0',0,'',NULL,NULL,NULL,NULL,NULL),(8,9,0,'ds.transparency.0',0,'',NULL,NULL,NULL,NULL,NULL),(9,9,0,'ds.type.0',0,'',NULL,NULL,NULL,NULL,NULL),(10,9,0,'ds.width.0',1,'',NULL,NULL,NULL,NULL,NULL),(11,9,0,'graph_item_problems',0,'',NULL,NULL,NULL,NULL,NULL),(12,9,0,'legend',0,'',NULL,NULL,NULL,NULL,NULL),(13,9,0,'righty',0,'',NULL,NULL,NULL,NULL,NULL),(14,9,0,'show_problems',1,'',NULL,NULL,NULL,NULL,NULL),(15,9,1,'ds.color.0',0,'00BFFF',NULL,NULL,NULL,NULL,NULL),(16,9,1,'ds.hosts.0.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(17,9,1,'ds.items.0.0',0,'Number of processed *values per second',NULL,NULL,NULL,NULL,NULL),(18,9,1,'ds.timeshift.0',0,'',NULL,NULL,NULL,NULL,NULL),(19,9,1,'lefty_min',0,'0',NULL,NULL,NULL,NULL,NULL),(20,9,1,'problemhosts.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(21,10,0,'ds.axisy.0',0,'',NULL,NULL,NULL,NULL,NULL),(22,10,0,'ds.fill.0',3,'',NULL,NULL,NULL,NULL,NULL),(23,10,0,'ds.missingdatafunc.0',0,'',NULL,NULL,NULL,NULL,NULL),(24,10,0,'ds.transparency.0',0,'',NULL,NULL,NULL,NULL,NULL),(25,10,0,'ds.type.0',0,'',NULL,NULL,NULL,NULL,NULL),(26,10,0,'ds.width.0',1,'',NULL,NULL,NULL,NULL,NULL),(27,10,0,'graph_item_problems',0,'',NULL,NULL,NULL,NULL,NULL),(28,10,0,'legend',0,'',NULL,NULL,NULL,NULL,NULL),(29,10,0,'righty',0,'',NULL,NULL,NULL,NULL,NULL),(30,10,0,'show_problems',1,'',NULL,NULL,NULL,NULL,NULL),(31,10,1,'ds.color.0',0,'E57373',NULL,NULL,NULL,NULL,NULL),(32,10,1,'ds.hosts.0.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(33,10,1,'ds.items.0.0',0,'Utilization of * data collector *',NULL,NULL,NULL,NULL,NULL),(34,10,1,'ds.timeshift.0',0,'',NULL,NULL,NULL,NULL,NULL),(35,10,1,'lefty_max',0,'100',NULL,NULL,NULL,NULL,NULL),(36,10,1,'lefty_min',0,'0',NULL,NULL,NULL,NULL,NULL),(37,10,1,'problemhosts.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(38,11,0,'ds.axisy.0',0,'',NULL,NULL,NULL,NULL,NULL),(39,11,0,'ds.fill.0',3,'',NULL,NULL,NULL,NULL,NULL),(40,11,0,'ds.missingdatafunc.0',0,'',NULL,NULL,NULL,NULL,NULL),(41,11,0,'ds.transparency.0',0,'',NULL,NULL,NULL,NULL,NULL),(42,11,0,'ds.type.0',0,'',NULL,NULL,NULL,NULL,NULL),(43,11,0,'ds.width.0',1,'',NULL,NULL,NULL,NULL,NULL),(44,11,0,'graph_item_problems',0,'',NULL,NULL,NULL,NULL,NULL),(45,11,0,'legend',0,'',NULL,NULL,NULL,NULL,NULL),(46,11,0,'righty',0,'',NULL,NULL,NULL,NULL,NULL),(47,11,0,'show_problems',1,'',NULL,NULL,NULL,NULL,NULL),(48,11,1,'ds.color.0',0,'E57373',NULL,NULL,NULL,NULL,NULL),(49,11,1,'ds.hosts.0.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(50,11,1,'ds.items.0.0',0,'Utilization of * internal *',NULL,NULL,NULL,NULL,NULL),(51,11,1,'ds.timeshift.0',0,'',NULL,NULL,NULL,NULL,NULL),(52,11,1,'lefty_max',0,'100',NULL,NULL,NULL,NULL,NULL),(53,11,1,'lefty_min',0,'0',NULL,NULL,NULL,NULL,NULL),(54,11,1,'problemhosts.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(55,12,0,'ds.axisy.0',0,'',NULL,NULL,NULL,NULL,NULL),(56,12,0,'ds.fill.0',0,'',NULL,NULL,NULL,NULL,NULL),(57,12,0,'ds.missingdatafunc.0',0,'',NULL,NULL,NULL,NULL,NULL),(58,12,0,'ds.transparency.0',0,'',NULL,NULL,NULL,NULL,NULL),(59,12,0,'ds.type.0',0,'',NULL,NULL,NULL,NULL,NULL),(60,12,0,'ds.width.0',2,'',NULL,NULL,NULL,NULL,NULL),(61,12,0,'graph_item_problems',0,'',NULL,NULL,NULL,NULL,NULL),(62,12,0,'legend',0,'',NULL,NULL,NULL,NULL,NULL),(63,12,0,'righty',0,'',NULL,NULL,NULL,NULL,NULL),(64,12,0,'show_problems',1,'',NULL,NULL,NULL,NULL,NULL),(65,12,1,'ds.color.0',0,'4DB6AC',NULL,NULL,NULL,NULL,NULL),(66,12,1,'ds.hosts.0.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(67,12,1,'ds.items.0.0',0,'Zabbix*cache*% used',NULL,NULL,NULL,NULL,NULL),(68,12,1,'ds.timeshift.0',0,'',NULL,NULL,NULL,NULL,NULL),(69,12,1,'lefty_max',0,'100',NULL,NULL,NULL,NULL,NULL),(70,12,1,'lefty_min',0,'0',NULL,NULL,NULL,NULL,NULL),(71,12,1,'problemhosts.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(72,13,0,'ds.axisy.0',0,'',NULL,NULL,NULL,NULL,NULL),(73,13,0,'ds.axisy.1',0,'',NULL,NULL,NULL,NULL,NULL),(74,13,0,'ds.fill.0',3,'',NULL,NULL,NULL,NULL,NULL),(75,13,0,'ds.fill.1',3,'',NULL,NULL,NULL,NULL,NULL),(76,13,0,'ds.missingdatafunc.0',0,'',NULL,NULL,NULL,NULL,NULL),(77,13,0,'ds.missingdatafunc.1',0,'',NULL,NULL,NULL,NULL,NULL),(78,13,0,'ds.transparency.0',0,'',NULL,NULL,NULL,NULL,NULL),(79,13,0,'ds.transparency.1',0,'',NULL,NULL,NULL,NULL,NULL),(80,13,0,'ds.type.0',0,'',NULL,NULL,NULL,NULL,NULL),(81,13,0,'ds.type.1',0,'',NULL,NULL,NULL,NULL,NULL),(82,13,0,'ds.width.0',2,'',NULL,NULL,NULL,NULL,NULL),(83,13,0,'ds.width.1',2,'',NULL,NULL,NULL,NULL,NULL),(84,13,0,'graph_item_problems',0,'',NULL,NULL,NULL,NULL,NULL),(85,13,0,'legend',0,'',NULL,NULL,NULL,NULL,NULL),(86,13,0,'righty',0,'',NULL,NULL,NULL,NULL,NULL),(87,13,0,'show_problems',1,'',NULL,NULL,NULL,NULL,NULL),(88,13,1,'ds.color.0',0,'9CCC65',NULL,NULL,NULL,NULL,NULL),(89,13,1,'ds.color.1',0,'FF465C',NULL,NULL,NULL,NULL,NULL),(90,13,1,'ds.hosts.0.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(91,13,1,'ds.hosts.1.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(92,13,1,'ds.items.0.0',0,'Zabbix value cache hits',NULL,NULL,NULL,NULL,NULL),(93,13,1,'ds.items.1.0',0,'Zabbix value cache misses',NULL,NULL,NULL,NULL,NULL),(94,13,1,'ds.timeshift.0',0,'',NULL,NULL,NULL,NULL,NULL),(95,13,1,'ds.timeshift.1',0,'',NULL,NULL,NULL,NULL,NULL),(96,13,1,'lefty_min',0,'0',NULL,NULL,NULL,NULL,NULL),(97,13,1,'problemhosts.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(98,14,0,'ds.axisy.0',0,'',NULL,NULL,NULL,NULL,NULL),(99,14,0,'ds.axisy.1',0,'',NULL,NULL,NULL,NULL,NULL),(100,14,0,'ds.axisy.2',0,'',NULL,NULL,NULL,NULL,NULL),(101,14,0,'ds.fill.0',0,'',NULL,NULL,NULL,NULL,NULL),(102,14,0,'ds.fill.1',0,'',NULL,NULL,NULL,NULL,NULL),(103,14,0,'ds.fill.2',0,'',NULL,NULL,NULL,NULL,NULL),(104,14,0,'ds.missingdatafunc.0',0,'',NULL,NULL,NULL,NULL,NULL),(105,14,0,'ds.missingdatafunc.1',0,'',NULL,NULL,NULL,NULL,NULL),(106,14,0,'ds.missingdatafunc.2',0,'',NULL,NULL,NULL,NULL,NULL),(107,14,0,'ds.transparency.0',0,'',NULL,NULL,NULL,NULL,NULL),(108,14,0,'ds.transparency.1',0,'',NULL,NULL,NULL,NULL,NULL),(109,14,0,'ds.transparency.2',0,'',NULL,NULL,NULL,NULL,NULL),(110,14,0,'ds.type.0',0,'',NULL,NULL,NULL,NULL,NULL),(111,14,0,'ds.type.1',0,'',NULL,NULL,NULL,NULL,NULL),(112,14,0,'ds.type.2',0,'',NULL,NULL,NULL,NULL,NULL),(113,14,0,'ds.width.0',2,'',NULL,NULL,NULL,NULL,NULL),(114,14,0,'ds.width.1',2,'',NULL,NULL,NULL,NULL,NULL),(115,14,0,'ds.width.2',2,'',NULL,NULL,NULL,NULL,NULL),(116,14,0,'graph_item_problems',0,'',NULL,NULL,NULL,NULL,NULL),(117,14,0,'legend',0,'',NULL,NULL,NULL,NULL,NULL),(118,14,0,'righty',0,'',NULL,NULL,NULL,NULL,NULL),(119,14,0,'show_problems',1,'',NULL,NULL,NULL,NULL,NULL),(120,14,1,'ds.color.0',0,'B0AF07',NULL,NULL,NULL,NULL,NULL),(121,14,1,'ds.color.1',0,'E53935',NULL,NULL,NULL,NULL,NULL),(122,14,1,'ds.color.2',0,'0275B8',NULL,NULL,NULL,NULL,NULL),(123,14,1,'ds.hosts.0.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(124,14,1,'ds.hosts.1.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(125,14,1,'ds.hosts.2.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(126,14,1,'ds.items.0.0',0,'Zabbix queue',NULL,NULL,NULL,NULL,NULL),(127,14,1,'ds.items.1.0',0,'Zabbix queue over 10 minutes',NULL,NULL,NULL,NULL,NULL),(128,14,1,'ds.items.2.0',0,'Zabbix preprocessing queue',NULL,NULL,NULL,NULL,NULL),(129,14,1,'ds.timeshift.0',0,'',NULL,NULL,NULL,NULL,NULL),(130,14,1,'ds.timeshift.1',0,'',NULL,NULL,NULL,NULL,NULL),(131,14,1,'ds.timeshift.2',0,'',NULL,NULL,NULL,NULL,NULL),(132,14,1,'lefty_min',0,'0',NULL,NULL,NULL,NULL,NULL),(133,14,1,'problemhosts.0',0,'Zabbix server',NULL,NULL,NULL,NULL,NULL),(134,4,3,'hostids',0,'',NULL,10263,NULL,NULL,NULL),(135,4,3,'hostids',0,'',NULL,10084,NULL,NULL,NULL);
/*!40000 ALTER TABLE `widget_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-09 22:17:48