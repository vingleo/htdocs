/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.0.67-community-nt : Database - printusage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`printusage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `printusage`;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `AdminName` varchar(50) NOT NULL,
  `AdminPWD` varchar(100) default NULL,
  `RealName` varchar(100) default NULL,
  `IsDisabled` int(11) NOT NULL default '0',
  `IsAdmin` int(11) NOT NULL default '0',
  `LastLoginDttm` datetime default NULL,
  PRIMARY KEY  (`AdminName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admins` */

insert  into `admins`(`AdminName`,`AdminPWD`,`RealName`,`IsDisabled`,`IsAdmin`,`LastLoginDttm`) values ('admin','C5DEF5A9EB02E440190FE81F1EA8BB6AB016D','Administrator',0,1,'2015-03-26 15:45:19');

/*Table structure for table `adminsrole` */

DROP TABLE IF EXISTS `adminsrole`;

CREATE TABLE `adminsrole` (
  `AdminRoleID` int(11) NOT NULL auto_increment,
  `AdminName` varchar(255) NOT NULL default '',
  `RoleID` int(11) default NULL,
  PRIMARY KEY  (`AdminRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adminsrole` */

/*Table structure for table `configfee` */

DROP TABLE IF EXISTS `configfee`;

CREATE TABLE `configfee` (
  `ConfigID` int(11) NOT NULL,
  `SimpMode` char(1) default NULL,
  `FeePerPage` float(18,3) default NULL,
  `AdvMode` char(1) default NULL,
  `DuplexDown` float(18,3) default NULL,
  `DuplexDownType` char(1) default NULL,
  `GrayDefault` float(18,3) default NULL,
  `ColorDefault` float(18,3) default NULL,
  `ScanFee` decimal(18,3) default '0.000',
  `FaxRFee` decimal(18,3) default '0.000',
  `FaxSFee` decimal(18,3) default '0.000',
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configfee` */

insert  into `configfee`(`ConfigID`,`SimpMode`,`FeePerPage`,`AdvMode`,`DuplexDown`,`DuplexDownType`,`GrayDefault`,`ColorDefault`,`ScanFee`,`FaxRFee`,`FaxSFee`) values (1,'Y',0.000,'N',0.000,'',0.100,0.500,'0.000','0.000','0.000');

/*Table structure for table `configfeeitem` */

DROP TABLE IF EXISTS `configfeeitem`;

CREATE TABLE `configfeeitem` (
  `ItemID` int(11) NOT NULL auto_increment,
  `ConfigID` int(11) default NULL,
  `PaperTypeID` int(11) default NULL,
  `GrayFee` float(18,3) default NULL,
  `ColorFee` float(18,3) default NULL,
  `PageFee` double(18,3) default NULL,
  `ScanFee` decimal(18,3) default '0.000',
  `FaxRFee` decimal(18,3) default '0.000',
  `FaxSFee` decimal(18,3) default '0.000',
  PRIMARY KEY  (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configfeeitem` */

/*Table structure for table `configfile` */

DROP TABLE IF EXISTS `configfile`;

CREATE TABLE `configfile` (
  `ConfigID` int(11) NOT NULL,
  `AllowOrDenyAllFile` char(1) default NULL,
  `MaxFileSize` float(18,3) default NULL,
  `MaxPages` float(18,3) default NULL,
  `MaxCost` float(18,3) default NULL,
  `DenyKeywords` text,
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configfile` */

insert  into `configfile`(`ConfigID`,`AllowOrDenyAllFile`,`MaxFileSize`,`MaxPages`,`MaxCost`,`DenyKeywords`) values (1,'A',0.000,0.000,0.000,''),(2,'A',0.000,0.000,0.000,'');

/*Table structure for table `configfileitem` */

DROP TABLE IF EXISTS `configfileitem`;

CREATE TABLE `configfileitem` (
  `ItemID` int(11) NOT NULL auto_increment,
  `ConfigID` int(11) default NULL,
  `FileTypeID` int(11) default NULL,
  PRIMARY KEY  (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configfileitem` */

/*Table structure for table `configfunction` */

DROP TABLE IF EXISTS `configfunction`;

CREATE TABLE `configfunction` (
  `ConfigID` int(11) NOT NULL,
  `ColorCopy` char(1) NOT NULL,
  `MonoCopy` char(1) NOT NULL,
  `ColorPrint` char(1) NOT NULL,
  `MonoPrint` char(1) NOT NULL,
  `Scan` char(1) NOT NULL,
  `Fax` char(1) NOT NULL,
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configfunction` */

insert  into `configfunction`(`ConfigID`,`ColorCopy`,`MonoCopy`,`ColorPrint`,`MonoPrint`,`Scan`,`Fax`) values (1,'Y','Y','Y','Y','Y','Y'),(2,'Y','Y','Y','Y','Y','Y');

/*Table structure for table `configkeywords` */

DROP TABLE IF EXISTS `configkeywords`;

CREATE TABLE `configkeywords` (
  `KeyWordsID` int(11) NOT NULL auto_increment,
  `KeyWordsType` int(11) NOT NULL,
  `KeyWordsLevel` int(11) default NULL,
  `KeyWordsValue` varchar(255) default NULL,
  PRIMARY KEY  (`KeyWordsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configkeywords` */

/*Table structure for table `configprinter` */

DROP TABLE IF EXISTS `configprinter`;

CREATE TABLE `configprinter` (
  `ConfigID` int(11) NOT NULL,
  `AllowOrDenyAllPrinter` char(1) default NULL,
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configprinter` */

insert  into `configprinter`(`ConfigID`,`AllowOrDenyAllPrinter`) values (2,'A');

/*Table structure for table `configprinteritem` */

DROP TABLE IF EXISTS `configprinteritem`;

CREATE TABLE `configprinteritem` (
  `ItemID` int(11) NOT NULL auto_increment,
  `ConfigID` int(11) default NULL,
  `ServerID` int(11) default NULL,
  `PrinterID` int(11) default NULL,
  PRIMARY KEY  (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configprinteritem` */

/*Table structure for table `configquota` */

DROP TABLE IF EXISTS `configquota`;

CREATE TABLE `configquota` (
  `ConfigID` int(11) NOT NULL,
  `QuotaValue` float(18,3) default NULL,
  `QuotaType` char(1) default NULL,
  `AllowOver` char(1) default NULL,
  `OverType` char(1) default NULL,
  `MaxOver` float(18,3) default NULL,
  `ColorPrintValue` float(18,3) default '100.000',
  `MonoPrintValue` float(18,3) default '100.000',
  `ColorCopyValue` float(18,3) default '100.000',
  `MonoCopyValue` float(18,3) default '100.000',
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configquota` */

insert  into `configquota`(`ConfigID`,`QuotaValue`,`QuotaType`,`AllowOver`,`OverType`,`MaxOver`,`ColorPrintValue`,`MonoPrintValue`,`ColorCopyValue`,`MonoCopyValue`) values (2,100.000,'U','N','',0.000,100.000,100.000,100.000,100.000);

/*Table structure for table `configs` */

DROP TABLE IF EXISTS `configs`;

CREATE TABLE `configs` (
  `ConfigID` int(11) NOT NULL auto_increment,
  `ConfigName` varchar(255) default NULL,
  `ConfigType` char(1) default NULL,
  `IsTemplate` char(1) NOT NULL default 'N',
  `TargetID` float NOT NULL default '0',
  `ConfigDesc` varchar(255) NOT NULL default '',
  `AddBy` varchar(50) NOT NULL default '',
  `AddDttm` datetime default NULL,
  `AddIP` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `configs` */

insert  into `configs`(`ConfigID`,`ConfigName`,`ConfigType`,`IsTemplate`,`TargetID`,`ConfigDesc`,`AddBy`,`AddDttm`,`AddIP`) values (1,'Server Setup','S','Y',0,'','','2011-02-16 09:06:03',''),(2,'Group Setup','G','Y',0,'','','2011-02-16 09:06:03','');

/*Table structure for table `configtime` */

DROP TABLE IF EXISTS `configtime`;

CREATE TABLE `configtime` (
  `ConfigID` int(11) NOT NULL,
  `NoPrintFlag` char(1) default NULL,
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configtime` */

insert  into `configtime`(`ConfigID`,`NoPrintFlag`) values (1,'N'),(2,'N');

/*Table structure for table `configtimeitem` */

DROP TABLE IF EXISTS `configtimeitem`;

CREATE TABLE `configtimeitem` (
  `ItemID` int(11) NOT NULL auto_increment,
  `ConfigID` int(11) default NULL,
  `WeekDay` int(11) default NULL,
  `ItemTime` int(11) default NULL,
  `IsMonitored` char(1) default NULL,
  PRIMARY KEY  (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configtimeitem` */

/*Table structure for table `configuser` */

DROP TABLE IF EXISTS `configuser`;

CREATE TABLE `configuser` (
  `ConfigID` int(11) NOT NULL,
  `AllowOrDenyAllUser` char(1) default NULL,
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuser` */

insert  into `configuser`(`ConfigID`,`AllowOrDenyAllUser`) values (1,'A');

/*Table structure for table `configuseritem` */

DROP TABLE IF EXISTS `configuseritem`;

CREATE TABLE `configuseritem` (
  `ItemID` int(11) NOT NULL auto_increment,
  `ConfigID` int(11) default NULL,
  `UserID` int(11) default NULL,
  PRIMARY KEY  (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuseritem` */

/*Table structure for table `filetypes` */

DROP TABLE IF EXISTS `filetypes`;

CREATE TABLE `filetypes` (
  `FileTypeID` int(11) NOT NULL auto_increment,
  `FileTypeSuffix` varchar(20) default NULL,
  `FileTypeName` varchar(255) default NULL,
  `FileTypeDesc` varchar(255) default NULL,
  `FileTypeIcon` varchar(255) default NULL,
  `IsDeleted` char(1) default NULL,
  PRIMARY KEY  (`FileTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `filetypes` */

insert  into `filetypes`(`FileTypeID`,`FileTypeSuffix`,`FileTypeName`,`FileTypeDesc`,`FileTypeIcon`,`IsDeleted`) values (1,'doc','DOC','','','N'),(2,'xls','XLS','','','N'),(3,'psd','PSD','','','N'),(4,'jpg','IMAGE','','','N'),(5,'txt','TXT','','','N'),(6,'htm','HTM','','','N'),(7,'html','HTML','','','N'),(8,'pdf','PDF','','','N');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `GroupID` int(11) NOT NULL auto_increment,
  `GroupName` varchar(255) default NULL,
  `GroupType` varchar(5) default NULL,
  `GroupDesc` varchar(255) default NULL,
  `AddDate` datetime default NULL,
  `UpdateDate` datetime default NULL,
  `TotalJobs` float(18,3) default NULL,
  `TotalPages` float(18,3) default NULL,
  `TotalCost` double(18,3) default NULL,
  `IsDeleted` char(1) default NULL,
  `ConfigID` int(11) default NULL,
  `IsManualAudit` char(1) default 'N',
  `IsClientAudit` char(1) default 'N',
  `IsCardAudit` char(1) default 'N',
  `IsFollowMe` char(1) default 'N',
  `IsAudit` char(1) default 'N',
  `Uda01` varchar(255) default NULL,
  `Uda02` varchar(255) default NULL,
  `Uda03` varchar(255) default NULL,
  `Uda04` varchar(255) default NULL,
  `Uda05` varchar(255) default NULL,
  `Uda06` varchar(255) default NULL,
  `Uda07` varchar(255) default NULL,
  `Uda08` varchar(255) default NULL,
  `Uda09` varchar(255) default NULL,
  `Uda10` varchar(255) default NULL,
  PRIMARY KEY  (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`GroupID`,`GroupName`,`GroupType`,`GroupDesc`,`AddDate`,`UpdateDate`,`TotalJobs`,`TotalPages`,`TotalCost`,`IsDeleted`,`ConfigID`,`IsManualAudit`,`IsClientAudit`,`IsCardAudit`,`IsFollowMe`,`IsAudit`,`Uda01`,`Uda02`,`Uda03`,`Uda04`,`Uda05`,`Uda06`,`Uda07`,`Uda08`,`Uda09`,`Uda10`) values (1,'Domain Controllers','USER','','2011-02-16 09:08:30','2011-02-16 09:08:30',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'LocalUser','USER','','2011-02-16 09:08:31','2011-02-16 09:08:31',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'LocalUser\\Acounting','USER','','2011-02-16 09:08:31','2011-02-16 09:08:31',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'LocalUser\\AMAXCHINA_IT','USER','','2011-02-16 09:08:31','2011-02-16 09:08:31',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'LocalUser\\Customer Service','USER','','2011-02-16 09:08:31','2011-02-16 09:08:31',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'LocalUser\\Customer Service\\离职CS','USER','','2011-02-16 09:08:31','2011-02-16 09:08:31',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'LocalUser\\IT','USER','','2011-02-16 09:08:31','2011-02-16 09:08:31',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'LocalUser\\IT\\离职IT','USER','','2011-02-16 09:08:31','2011-02-16 09:08:31',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'LocalUser\\IT\\兄弟公司IT','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'LocalUser\\Marketing','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'LocalUser\\Marketing\\离职Marketing','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'LocalUser\\Research & Development','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'LocalUser\\Research & Development\\离职RD','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'LocalUser\\Sales','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'LocalUser\\Sales\\离职Sales','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'LocalUser\\System Integration','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'LocalUser\\华菁','USER','','2011-02-16 09:08:32','2011-02-16 09:08:32',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'LocalUser\\华菁\\离职华菁','USER','','2011-02-16 09:08:33','2011-02-16 09:08:33',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Temp','USER','','2011-02-16 13:24:46','2011-02-16 13:24:46',0.000,0.000,0.000,'N',2,'N','N','N','N','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `optionnotify` */

DROP TABLE IF EXISTS `optionnotify`;

CREATE TABLE `optionnotify` (
  `NotifyAt` varchar(20) NOT NULL,
  `UsePopup` char(1) default NULL,
  `UseEmail` char(1) default NULL,
  `UsePrintBlank` char(1) default NULL,
  `NofityText` text,
  `InUse` char(1) default NULL,
  PRIMARY KEY  (`NotifyAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `optionnotify` */

insert  into `optionnotify`(`NotifyAt`,`UsePopup`,`UseEmail`,`UsePrintBlank`,`NofityText`,`InUse`) values ('1','Y','N','N','{StartPrint}\r\n{PrinterServer}:%PrinterServer%\r\n{PrinterName}:%PrinterName%\r\n{User}:%User%\r\n{Document}:%Document%,{Copies}:%Copies%,{TotalPages}:%TotalPages%\r\n{TotalCost}:%TotalCost%\r\n{Balance}:%Balance%','N'),('2','Y','N','N','{PrintSuccess}\r\n{PrinterName}:%PrinterName%\r\n{PrinterServer}:%PrinterServer%\r\n{User}:%User%\r\n{PagesPrinted}:%PagesPrinted%\r\n{BytesPrinted}:%BytesPrinted%\r\n{TotalCost}:%TotalCost%\r\n{Balance}:%Balance%','N'),('3','Y','N','N','{PrintFail}\r\n{PrinterName}:%PrinterName%\r\n{PrinterServer}:%PrinterServer%\r\n{Computer}:%Computer%\r\n{User}:%User%\r\n{TotalPages}:%TotalPages%\r\n{PagesPrinted}:%PagesPrinted%\r\n{ResultDesc}:%ResultDesc%\r\n{Balance}:%Balance%','Y'),('4','Y','Y','N','{NeedManualAudit}\r\n{PrinterName}:%PrinterName%\r\n{User}:%User%\r\n{TotalPages}:%TotalPages%\r\n{Document}:%Document%','N'),('5','Y','Y','N','{ManualAuditPass}\r\n{PrinterName}:%PrinterName%\r\n{User}:%User%\r\n{TotalPages}:%TotalPages%\r\n{Document}:%Document%','N');

/*Table structure for table `papertypes` */

DROP TABLE IF EXISTS `papertypes`;

CREATE TABLE `papertypes` (
  `PaperTypeID` int(11) NOT NULL auto_increment,
  `PaperTypeCode` varchar(20) default NULL,
  `PaperTypeName` varchar(50) default NULL,
  `PaperWidth` float(18,3) default NULL,
  `PaperHeight` float(18,3) default NULL,
  `SizeLevel` varchar(5) default NULL,
  `IsDeleted` char(1) default NULL,
  PRIMARY KEY  (`PaperTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `papertypes` */

insert  into `papertypes`(`PaperTypeID`,`PaperTypeCode`,`PaperTypeName`,`PaperWidth`,`PaperHeight`,`SizeLevel`,`IsDeleted`) values (1,'A3','A3',297.000,420.000,'M','N'),(2,'A4','A4',210.000,297.000,'M','N'),(3,'A5','A5',148.000,210.000,'S','N'),(4,'A6','A6',105.000,148.000,'S','N'),(5,'B4','B4',250.000,354.000,'S','N'),(6,'B5','B5',182.000,257.000,'M','N'),(7,'16K','16K',146.000,215.000,'M','N'),(8,'LETTER','LETTER',215.900,279.400,'M','N');

/*Table structure for table `printerconsumable` */

DROP TABLE IF EXISTS `printerconsumable`;

CREATE TABLE `printerconsumable` (
  `ConsumIndex` int(11) NOT NULL auto_increment,
  `PrinterID` int(11) NOT NULL,
  `ConsumType` varchar(50) NOT NULL,
  `ConsumAddDateTime` datetime NOT NULL,
  `ConsumPrice` decimal(18,3) default NULL,
  `ConsumCount` int(11) NOT NULL,
  `ConsumComment` varchar(255) default NULL,
  PRIMARY KEY  (`ConsumIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `printerconsumable` */

/*Table structure for table `printercostcenter` */

DROP TABLE IF EXISTS `printercostcenter`;

CREATE TABLE `printercostcenter` (
  `PrinterName` varchar(50) NOT NULL,
  `CostCenter` varchar(50) NOT NULL,
  PRIMARY KEY  (`PrinterName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `printercostcenter` */

/*Table structure for table `printers` */

DROP TABLE IF EXISTS `printers`;

CREATE TABLE `printers` (
  `PrinterID` int(11) NOT NULL auto_increment,
  `ServerID` int(11) default NULL,
  `PrinterName` varchar(255) default NULL,
  `PrinterModel` varchar(255) default NULL,
  `PrinterDesc` varchar(255) default NULL,
  `AddDate` datetime default NULL,
  `UpdateDate` datetime default NULL,
  `BeginDate` datetime default NULL,
  `TotalJobs` float(18,3) default NULL,
  `TotalPages` float(18,3) default NULL,
  `TotalCost` double(18,3) default NULL,
  `Color` char(1) NOT NULL default 'A',
  `IsMonitored` char(1) default NULL,
  `IsDeleted` char(1) default NULL,
  `ConfigID` int(11) default NULL,
  `IsSaveImg` char(1) NOT NULL default 'N',
  `IsSaveRaw` char(1) NOT NULL default 'N',
  `DPI` int(11) NOT NULL default '0',
  `IsManualAudit` char(1) NOT NULL default 'N',
  `MFPSN` varchar(255) default NULL,
  `IsCopyConfigFee` char(1) default NULL,
  `PrinterType` varchar(255) default NULL,
  `PrinterIP` varchar(255) default NULL,
  `CardReaderURI` varchar(255) default NULL,
  `CardReaderType` varchar(255) default NULL,
  `IsClientAudit` char(1) default 'N',
  `IsCardAudit` char(1) default 'N',
  `IsCardLogin` char(1) default 'N',
  `IsFollowMe` char(1) default 'N',
  `IsAudit` char(1) default 'N',
  `Uda01` varchar(255) default NULL,
  `Uda02` varchar(255) default NULL,
  `Uda03` varchar(255) default NULL,
  `Uda04` varchar(255) default NULL,
  `Uda05` varchar(255) default NULL,
  `Uda06` varchar(255) default NULL,
  `Uda07` varchar(255) default NULL,
  `Uda08` varchar(255) default NULL,
  `Uda09` varchar(255) default NULL,
  `Uda10` varchar(255) default NULL,
  `PrinterGroupID` varchar(255) default NULL,
  `IsVirtualPrinter` varchar(255) default NULL,
  `VPrinterGroupID` varchar(255) default NULL,
  `XpsWaterMark` varchar(255) default NULL,
  `XpsBanner` varchar(255) default NULL,
  `XpsWaterMarkEnabled` char(1) default NULL,
  `XpsBannerEnabled` char(1) default NULL,
  `KeywordAudit` varchar(1000) default NULL,
  `CtDenyKeywords` varchar(1000) default NULL,
  `TopAccessUserName` varchar(255) default NULL,
  `TopAccessPassword` varchar(255) default NULL,
  PRIMARY KEY  (`PrinterID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `printers` */

insert  into `printers`(`PrinterID`,`ServerID`,`PrinterName`,`PrinterModel`,`PrinterDesc`,`AddDate`,`UpdateDate`,`BeginDate`,`TotalJobs`,`TotalPages`,`TotalCost`,`Color`,`IsMonitored`,`IsDeleted`,`ConfigID`,`IsSaveImg`,`IsSaveRaw`,`DPI`,`IsManualAudit`,`MFPSN`,`IsCopyConfigFee`,`PrinterType`,`PrinterIP`,`CardReaderURI`,`CardReaderType`,`IsClientAudit`,`IsCardAudit`,`IsCardLogin`,`IsFollowMe`,`IsAudit`,`Uda01`,`Uda02`,`Uda03`,`Uda04`,`Uda05`,`Uda06`,`Uda07`,`Uda08`,`Uda09`,`Uda10`,`PrinterGroupID`,`IsVirtualPrinter`,`VPrinterGroupID`,`XpsWaterMark`,`XpsBanner`,`XpsWaterMarkEnabled`,`XpsBannerEnabled`,`KeywordAudit`,`CtDenyKeywords`,`TopAccessUserName`,`TopAccessPassword`) values (11,2,'Kyocera KM-3040 (KPDL)','','&nbsp;','2011-02-17 09:45:30','2011-02-17 09:45:30','2011-02-17 09:45:30',0.000,0.000,0.000,'A','Y','N',0,'Y','N',100,'N','','N','','','','',NULL,NULL,NULL,NULL,NULL,'Y','N','N','','','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,2,'KONICA MINOLTA C220ps','','&nbsp;','2011-02-17 09:45:30','2011-02-17 09:45:30','2011-02-17 09:45:30',0.000,0.000,0.000,'A','Y','N',0,'Y','N',100,'N','','N','','','','',NULL,NULL,NULL,NULL,NULL,'Y','N','N','','','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,2,'KONICA MINOLTA C220pcl','','&nbsp;','2011-02-17 09:45:30','2011-02-17 09:45:30','2011-02-17 09:45:30',0.000,0.000,0.000,'A','Y','N',0,'Y','N',100,'N','','N','','','','',NULL,NULL,NULL,NULL,NULL,'Y','N','N','','','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,2,'KONICA MINOLTA 220','','&nbsp;','2011-02-17 09:45:30','2011-02-17 09:45:30','2011-02-17 09:45:30',0.000,0.000,0.000,'A','Y','N',0,'Y','N',100,'N','','N','','','','',NULL,NULL,NULL,NULL,NULL,'Y','N','N','','','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,2,'HP Deskjet 1280','','&nbsp;','2011-02-17 09:45:30','2011-02-17 09:45:30','2011-02-17 09:45:30',0.000,0.000,0.000,'A','Y','N',0,'Y','N',100,'N','','N','','','','',NULL,NULL,NULL,NULL,NULL,'Y','N','N','','','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,2,'HP Color LaserJet 5500 PCL 6','','&nbsp;','2011-02-17 09:45:30','2011-02-17 09:45:30','2011-02-17 09:45:30',0.000,0.000,0.000,'A','Y','N',0,'Y','N',100,'N','','N','','','','',NULL,NULL,NULL,NULL,NULL,'Y','N','N','','','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `printlogs` */

DROP TABLE IF EXISTS `printlogs`;

CREATE TABLE `printlogs` (
  `Pu_JobID` int(11) NOT NULL auto_increment,
  `Pu_PrinterIndex` int(11) default NULL,
  `Pu_PrinterName` varchar(255) default NULL,
  `Pu_PrinterPort` varchar(100) default NULL,
  `Pu_PrinterServer` varchar(255) default NULL,
  `Pu_PrinterShare` varchar(255) default NULL,
  `Pu_Computer` varchar(255) default NULL,
  `Pu_User` varchar(100) default NULL,
  `Pu_UserFullName` varchar(100) default NULL,
  `Pu_GroupName` varchar(255) default NULL,
  `Pu_IP` varchar(50) default NULL,
  `Pu_MAC` varchar(100) default NULL,
  `Pu_Document` varchar(255) default NULL,
  `Pu_TotalBytes` float(18,3) default NULL,
  `Pu_TotalPages` float(18,3) default NULL,
  `Pu_BytesPrinted` float(18,3) default NULL,
  `Pu_PagesPrinted` float(18,3) default NULL,
  `Pu_MonoPages` int(11) default NULL,
  `Pu_ColorPages` int(11) default NULL,
  `Pu_PapersPrinted` int(11) default NULL,
  `Pu_Copies` float(18,3) default NULL,
  `Pu_NotifyName` varchar(100) default NULL,
  `Pu_DataType` varchar(100) default NULL,
  `Pu_PrintProcessor` varchar(100) default NULL,
  `Pu_Parameters` varchar(100) default NULL,
  `Pu_DriverName` varchar(100) default NULL,
  `Pu_Priority` int(11) default NULL,
  `Pu_Position` int(11) default NULL,
  `Pu_StartTime` int(11) default NULL,
  `Pu_UntilTime` int(11) default NULL,
  `Pu_SubmitTime` datetime default NULL,
  `Pu_Orientation` char(1) default NULL,
  `Pu_PaperSize` varchar(50) default NULL,
  `Pu_Color` char(1) default NULL,
  `Pu_Duplex` char(1) default NULL,
  `Pu_Status` char(1) default NULL,
  `Pu_UnitCost` float(18,3) default NULL,
  `Pu_TotalCost` double(18,3) default NULL,
  `Pu_ResultCode` varchar(100) default NULL,
  `Pu_ResultDesc` varchar(250) default NULL,
  `Pu_FileType` varchar(50) NOT NULL,
  `Pu_AppType` varchar(250) NOT NULL,
  `Pu_LogYear` int(11) NOT NULL default '0',
  `Pu_LogQuarter` int(11) NOT NULL default '0',
  `Pu_LogMonth` int(11) NOT NULL default '0',
  `Pu_LogDay` int(11) NOT NULL default '0',
  `Pu_LogHour` int(11) NOT NULL default '0',
  `Pu_LogMinute` int(11) NOT NULL default '0',
  `Pu_LogSecond` int(11) NOT NULL default '0',
  `Pu_WeekOfYear` int(11) NOT NULL default '0',
  `Pu_DayOfYear` int(11) NOT NULL default '0',
  `Pu_WeekDay` int(11) NOT NULL default '0',
  `Pu_ServerID` int(11) NOT NULL default '0',
  `Pu_PrinterID` int(11) NOT NULL default '0',
  `Pu_GroupID` int(11) NOT NULL default '0',
  `Pu_UserID` int(11) NOT NULL default '0',
  `Pu_ImgFileName` varchar(255) NOT NULL default '',
  `Pu_RawFileName` varchar(255) NOT NULL default '',
  `Pu_SiteCode` varchar(50) NOT NULL default '',
  `Pu_TransFlag` char(1) NOT NULL default 'N',
  `Pu_TransDttm` datetime default NULL,
  `Pu_AuditBy` varchar(50) NOT NULL default '',
  `Pu_AuditIP` varchar(15) NOT NULL default '',
  `Pu_AuditTime` datetime default NULL,
  `Pu_ProjectID` varchar(32) default NULL,
  `Pu_ProjectName` varchar(255) default NULL,
  `Pu_VirtualGroupID` varchar(32) default NULL,
  `Pu_VirtualGroupName` varchar(255) default NULL,
  `Pu_LogType` char(1) NOT NULL default 'P',
  `Pu_FunctionJobId` varchar(255) default NULL,
  `Pu_FunctionGuid` varchar(255) default NULL,
  `Pu_Uda01` varchar(255) default NULL,
  `Pu_Uda02` varchar(255) default NULL,
  `Pu_Uda03` varchar(255) default NULL,
  `Pu_Uda04` varchar(255) default NULL,
  `Pu_Uda05` varchar(255) default NULL,
  `Pu_Uda06` varchar(255) default NULL,
  `Pu_Uda07` varchar(255) default NULL,
  `Pu_Uda08` varchar(255) default NULL,
  `Pu_Uda09` varchar(255) default NULL,
  `Pu_Uda10` varchar(255) default NULL,
  `Pu_MonoCost` decimal(18,3) default '0.000',
  `Pu_ColorCost` decimal(18,3) default '0.000',
  `Pu_PaperCost` decimal(18,3) default '0.000',
  PRIMARY KEY  (`Pu_JobID`),
  KEY `df_PrintLogs_PrinterName` (`Pu_PrinterName`),
  KEY `df_Printlogs_Computer` (`Pu_Computer`),
  KEY `df_PrintLogs_User` (`Pu_User`),
  KEY `df_PrintLogs_SubmitTime` (`Pu_SubmitTime`),
  KEY `df_PrintLogs_ImgFileName` (`Pu_ImgFileName`),
  KEY `df_PrintLogs_RawFileName` (`Pu_RawFileName`),
  KEY `df_PrintLogs_LogYear` (`Pu_LogYear`),
  KEY `df_PrintLogs_LogMonth` (`Pu_LogMonth`),
  KEY `df_PrintLogs_LogDay` (`Pu_LogDay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `printlogs` */

/*Table structure for table `printlogscontent` */

DROP TABLE IF EXISTS `printlogscontent`;

CREATE TABLE `printlogscontent` (
  `Pu_ContentID` int(11) NOT NULL auto_increment,
  `Pu_JobID` int(11) NOT NULL,
  `Pu_Content` text,
  `Pu_Uda01` varchar(255) default NULL,
  `Pu_Uda02` varchar(255) default NULL,
  `Pu_Uda03` varchar(255) default NULL,
  `Pu_Uda04` varchar(255) default NULL,
  `Pu_Uda05` varchar(255) default NULL,
  `Pu_Uda06` varchar(255) default NULL,
  `Pu_Uda07` varchar(255) default NULL,
  `Pu_Uda08` varchar(255) default NULL,
  `Pu_Uda09` varchar(255) default NULL,
  `Pu_Uda10` varchar(255) default NULL,
  PRIMARY KEY  (`Pu_ContentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `printlogscontent` */

/*Table structure for table `printlogssum` */

DROP TABLE IF EXISTS `printlogssum`;

CREATE TABLE `printlogssum` (
  `PrintLogSumID` varchar(50) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserFullName` varchar(255) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `GroupName` varchar(50) NOT NULL,
  `PrinterID` int(11) NOT NULL,
  `PrinterName` varchar(50) NOT NULL,
  `Color` char(1) NOT NULL,
  `LogType` char(1) NOT NULL,
  `PaperSize` varchar(50) NOT NULL,
  `SubmitMonth` datetime NOT NULL,
  `TotalPages` decimal(18,0) NOT NULL,
  `TotalCost` decimal(18,3) NOT NULL,
  PRIMARY KEY  (`PrintLogSumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `printlogssum` */

/*Table structure for table `printqueue` */

DROP TABLE IF EXISTS `printqueue`;

CREATE TABLE `printqueue` (
  `QUEUE_ID` varchar(32) NOT NULL,
  `PRINT_SERVER` varchar(100) default NULL,
  `JOB_ID` int(11) default NULL,
  `PRINTER_INDEX` int(11) default NULL,
  `PRINTERID` int(11) default NULL,
  `PRINTER_NAME` varchar(100) default NULL,
  `COMPUTER` varchar(50) default NULL,
  `USERID` int(11) default NULL,
  `USER_NAME` varchar(100) default NULL,
  `IP` varchar(50) default NULL,
  `MAC` varchar(100) default NULL,
  `DOCUMENT_TITLE` varchar(255) default NULL,
  `TOTAL_PAGES` int(11) default NULL,
  `COPIES` int(11) default NULL,
  `NOTIFY_NAME` varchar(100) default NULL,
  `PRINT_PROCESSOR` varchar(50) default NULL,
  `DATA_TYPE` varchar(30) default NULL,
  `DRIVER_NAME` varchar(100) default NULL,
  `SUBMIT_TIME` datetime default NULL,
  `ORIENTATION` char(1) default NULL,
  `PAPER_SIZE` varchar(50) default NULL,
  `COLOR` char(1) default NULL,
  `DUPLEX` char(1) default NULL,
  `QUEUE_STATUS` varchar(50) NOT NULL default 'W',
  `ImgFileName` varchar(255) default NULL,
  `RawFileName` varchar(255) default NULL,
  `AUDIT_BY` varchar(50) default NULL,
  `AUDIT_IP` varchar(15) default NULL,
  `AUDIT_NOTES` varchar(255) default NULL,
  `AUDIT_DTTM` datetime default NULL,
  `Uda01` varchar(255) default NULL,
  `Uda02` varchar(255) default NULL,
  `Uda03` varchar(255) default NULL,
  `Uda04` varchar(255) default NULL,
  `Uda05` varchar(255) default NULL,
  `Uda06` varchar(255) default NULL,
  `Uda07` varchar(255) default NULL,
  `Uda08` varchar(255) default NULL,
  `Uda09` varchar(255) default NULL,
  `Uda10` varchar(255) default NULL,
  `PROJECT_ID` varchar(32) default NULL,
  `PROJECT_NAME` varchar(50) default NULL,
  `AUDIT_LEVEL` int(11) default NULL,
  `CURRENT_AUDIT_LEVEL` int(11) default NULL,
  `CLIENT_IP` varchar(50) default NULL,
  PRIMARY KEY  (`QUEUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `printqueue` */

/*Table structure for table `projectinfo` */

DROP TABLE IF EXISTS `projectinfo`;

CREATE TABLE `projectinfo` (
  `ProjectID` varchar(32) NOT NULL,
  `ProjectName` varchar(50) default NULL,
  `ProjectDesc` varchar(255) default NULL,
  `Status` char(1) default NULL,
  `IsDeleted` char(1) default NULL,
  `UsersCount` int(11) default NULL,
  `TotalJobs` float(18,3) default NULL,
  `TotalPages` float(18,3) default NULL,
  `TotalCost` double(18,3) default NULL,
  `SiteID` varchar(32) default NULL,
  `UpdateBy` varchar(50) default NULL,
  `UpdateIP` varchar(20) default NULL,
  `UpdateDttm` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectinfo` */

/*Table structure for table `projectusers` */

DROP TABLE IF EXISTS `projectusers`;

CREATE TABLE `projectusers` (
  `ProjectUserID` varchar(32) NOT NULL,
  `ProjectID` varchar(32) default NULL,
  `UserID` int(11) default NULL,
  `SiteID` varchar(50) default NULL,
  `UpdateBy` varchar(50) default NULL,
  `UpdateIP` varchar(20) default NULL,
  `UpdateDttm` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectusers` */

/*Table structure for table `reginfo` */

DROP TABLE IF EXISTS `reginfo`;

CREATE TABLE `reginfo` (
  `CompanyName` varchar(255) NOT NULL,
  `RegCode` varchar(255) default NULL,
  `F0` varchar(100) default NULL,
  `F1` varchar(100) default NULL,
  `F2` varchar(100) default NULL,
  `F3` varchar(100) default NULL,
  `F4` varchar(100) default NULL,
  `F5` varchar(100) default NULL,
  `F6` varchar(100) default NULL,
  `F7` varchar(100) default NULL,
  `F8` varchar(100) default NULL,
  `F9` varchar(100) default NULL,
  PRIMARY KEY  (`CompanyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reginfo` */

insert  into `reginfo`(`CompanyName`,`RegCode`,`F0`,`F1`,`F2`,`F3`,`F4`,`F5`,`F6`,`F7`,`F8`,`F9`) values ('Trial Version','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'20141117','V4.1');

/*Table structure for table `roleinfo` */

DROP TABLE IF EXISTS `roleinfo`;

CREATE TABLE `roleinfo` (
  `RoleID` int(11) NOT NULL auto_increment,
  `RoleName` varchar(255) default NULL,
  `RoleDescr` varchar(255) default NULL,
  `RoleLevel` int(11) default NULL,
  PRIMARY KEY  (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roleinfo` */

/*Table structure for table `rolerights` */

DROP TABLE IF EXISTS `rolerights`;

CREATE TABLE `rolerights` (
  `RoleRightsID` varchar(50) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `RightsType` char(1) NOT NULL,
  `RightsID` int(11) NOT NULL,
  `RightsParentID` int(11) NOT NULL,
  `RightsDetail` char(1) NOT NULL,
  PRIMARY KEY  (`RoleRightsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rolerights` */

/*Table structure for table `servers` */

DROP TABLE IF EXISTS `servers`;

CREATE TABLE `servers` (
  `ServerID` int(11) NOT NULL auto_increment,
  `ServerName` varchar(50) default NULL,
  `ServerIP` varchar(50) default NULL,
  `ServerMAC` varchar(50) default NULL,
  `ServerDesc` varchar(255) default NULL,
  `AddDate` datetime default NULL,
  `UpdateDate` datetime default NULL,
  `InstalledPrinters` int(11) default NULL,
  `MonitoredPrinters` int(11) default NULL,
  `TotalJobs` float(18,3) default NULL,
  `TotalPages` float(18,3) default NULL,
  `TotalCost` double(18,3) default NULL,
  `IsMonitored` char(1) default NULL,
  `IsDeleted` char(1) default NULL,
  `ConfigID` int(11) default NULL,
  `Uda01` varchar(255) default NULL,
  `Uda02` varchar(255) default NULL,
  `Uda03` varchar(255) default NULL,
  `Uda04` varchar(255) default NULL,
  `Uda05` varchar(255) default NULL,
  `Uda06` varchar(255) default NULL,
  `Uda07` varchar(255) default NULL,
  `Uda08` varchar(255) default NULL,
  `Uda09` varchar(255) default NULL,
  `Uda10` varchar(255) default NULL,
  PRIMARY KEY  (`ServerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `servers` */

insert  into `servers`(`ServerID`,`ServerName`,`ServerIP`,`ServerMAC`,`ServerDesc`,`AddDate`,`UpdateDate`,`InstalledPrinters`,`MonitoredPrinters`,`TotalJobs`,`TotalPages`,`TotalCost`,`IsMonitored`,`IsDeleted`,`ConfigID`,`Uda01`,`Uda02`,`Uda03`,`Uda04`,`Uda05`,`Uda06`,`Uda07`,`Uda08`,`Uda09`,`Uda10`) values (2,'iprism_demo','192.168.117.15','','','2011-02-17 09:45:30','2011-02-17 09:45:30',25,6,0.000,0.000,0.000,'Y','N',1,NULL,'8082','8081','8100',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `F0` varchar(50) NOT NULL,
  `F1` varchar(255) default NULL,
  `F2` varchar(255) default NULL,
  `F3` varchar(255) default NULL,
  `F4` varchar(255) default NULL,
  `F5` varchar(255) default NULL,
  `F6` varchar(255) default NULL,
  `F7` varchar(255) default NULL,
  `F8` varchar(255) default NULL,
  `F9` varchar(255) default NULL,
  `F10` varchar(255) default NULL,
  `F11` varchar(255) default NULL,
  `F12` varchar(255) default NULL,
  `F13` varchar(255) default NULL,
  `F14` varchar(255) default NULL,
  `F15` varchar(255) default NULL,
  `F16` varchar(255) default NULL,
  `F17` varchar(255) default NULL,
  `F18` varchar(255) default NULL,
  `F19` varchar(255) default NULL,
  `F20` varchar(255) default NULL,
  PRIMARY KEY  (`F0`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `settings` */

insert  into `settings`(`F0`,`F1`,`F2`,`F3`,`F4`,`F5`,`F6`,`F7`,`F8`,`F9`,`F10`,`F11`,`F12`,`F13`,`F14`,`F15`,`F16`,`F17`,`F18`,`F19`,`F20`) values ('CustomerCode','P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RegType','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `syslogs` */

DROP TABLE IF EXISTS `syslogs`;

CREATE TABLE `syslogs` (
  `SysLogID` int(11) NOT NULL auto_increment,
  `LogDate` datetime default NULL,
  `ActionDesc` text,
  PRIMARY KEY  (`SysLogID`),
  KEY `df_SysLogs_LogDate` (`LogDate`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `syslogs` */

insert  into `syslogs`(`SysLogID`,`LogDate`,`ActionDesc`) values (1,'2011-02-16 09:10:22','admin 登录成功。'),(2,'2011-02-16 09:10:23','admin 登录成功。'),(3,'2011-02-16 09:11:25','打印服务器： iprism_demo 被管理员 admin 添加。'),(4,'2011-02-16 09:11:25','打印机： SHARP AR-M256 被管理员 admin 添加.'),(5,'2011-02-16 09:11:25','打印机： Kyocera KM-3040 (KPDL) 被管理员 admin 添加.'),(6,'2011-02-16 09:11:25','打印机： KONICA MINOLTA C220ps 被管理员 admin 添加.'),(7,'2011-02-16 09:11:26','打印机： KONICA MINOLTA C220pcl 被管理员 admin 添加.'),(8,'2011-02-16 09:11:26','打印机： HP Officejet Pro K5300 Series 被管理员 admin 添加.'),(9,'2011-02-16 09:11:26','打印机： HP Color LaserJet 5500 PCL 6 被管理员 admin 添加.'),(10,'2011-02-16 09:11:26','打印机： HP Color LaserJet 4600 PCL6 被管理员 admin 添加.'),(11,'2011-02-16 09:11:26','打印机： EPSON ME Office 70 被管理员 admin 添加.'),(12,'2011-02-16 09:11:26','打印机： Canon LBP3360 PCL6 被管理员 admin 添加.'),(13,'2011-02-16 09:11:26','打印机： Canon 5055 Generic PCL6 Driver 被管理员 admin 添加.'),(14,'2011-02-16 10:03:54','admin 登录成功。'),(15,'2011-02-16 10:03:55','admin 登录成功。'),(16,'2011-02-16 10:03:55','admin 登录成功。'),(17,'2011-02-16 13:23:20','admin 登录成功。'),(18,'2011-02-16 13:23:20','admin 登录成功。'),(19,'2011-02-16 13:23:21','admin 登录成功。'),(20,'2011-02-17 08:44:50','admin 登录成功。'),(21,'2011-02-17 08:44:50','admin 登录成功。'),(22,'2011-02-17 08:44:51','admin 登录成功。'),(23,'2011-02-17 09:39:50','admin 登录成功。'),(24,'2011-02-17 09:39:51','admin 登录成功。'),(25,'2011-02-17 09:43:03','打印服务器：  被管理员 admin 删除。'),(26,'2011-02-17 09:45:30','打印服务器： iprism_demo 被管理员 admin 添加。'),(27,'2011-02-17 09:45:30','打印机： Kyocera KM-3040 (KPDL) 被管理员 admin 添加.'),(28,'2011-02-17 09:45:30','打印机： KONICA MINOLTA C220ps 被管理员 admin 添加.'),(29,'2011-02-17 09:45:30','打印机： KONICA MINOLTA C220pcl 被管理员 admin 添加.'),(30,'2011-02-17 09:45:30','打印机： KONICA MINOLTA 220 被管理员 admin 添加.'),(31,'2011-02-17 09:45:30','打印机： HP Deskjet 1280 被管理员 admin 添加.'),(32,'2011-02-17 09:45:30','打印机： HP Color LaserJet 5500 PCL 6 被管理员 admin 添加.'),(33,'2011-02-18 10:01:05','admin 登录成功。'),(34,'2011-02-21 10:46:59','admin 登录成功。'),(35,'2011-02-21 10:46:59','admin 登录成功。'),(36,'2011-02-21 13:30:57','admin 登录成功。'),(37,'2011-02-21 13:30:57','admin 登录成功。'),(38,'2011-02-21 15:03:41','admin 登录成功。'),(39,'2011-02-21 15:03:41','admin 登录成功。'),(40,'2011-02-21 17:16:03','admin 登录成功。'),(41,'2011-02-21 17:16:03','admin 登录成功。'),(42,'2015-03-26 15:45:19','admin 登录成功。');

/*Table structure for table `usercostcenter` */

DROP TABLE IF EXISTS `usercostcenter`;

CREATE TABLE `usercostcenter` (
  `UserName` varchar(50) NOT NULL,
  `CostCenter` varchar(50) NOT NULL,
  PRIMARY KEY  (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usercostcenter` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL auto_increment,
  `GroupID` int(11) default NULL,
  `UserName` varchar(255) default NULL,
  `UserType` varchar(5) default NULL,
  `UserEmail` varchar(50) default NULL,
  `AddDate` datetime default NULL,
  `UpdateDate` datetime default NULL,
  `TotalJobs` float(18,3) default NULL,
  `TotalPages` float(18,3) default NULL,
  `TotalCost` double(18,3) default NULL,
  `CurrentQuota` double(18,3) default NULL,
  `QuotaLastUpdate` datetime default NULL,
  `IsDeleted` char(1) NOT NULL default 'N',
  `IsMonitored` char(1) NOT NULL default 'Y',
  `ConfigID` int(11) default NULL,
  `UserFullName` varchar(100) NOT NULL default '',
  `IsSaveImg` char(1) NOT NULL default 'Y',
  `IsManualAudit` char(1) NOT NULL default 'N',
  `ClientLanguage` varchar(3) NOT NULL default '',
  `UserPassword` varchar(50) default NULL,
  `IsClientAudit` varchar(1) default NULL,
  `LoginTimes` int(11) default NULL,
  `LoginIP` varchar(20) default NULL,
  `LoginDttm` datetime default NULL,
  `SiteID` varchar(50) default NULL,
  `UpdateBy` varchar(50) default NULL,
  `UpdateIP` varchar(50) default NULL,
  `UpdateDttm` datetime default NULL,
  `CardID` varchar(50) default NULL,
  `IDNumber` int(11) default NULL,
  `MFPLoginID` varchar(5) default NULL,
  `CurrentColorPrintQuota` double(18,3) default '100.000',
  `CurrentMonoPrintQuota` double(18,3) default '100.000',
  `CurrentColorCopyQuota` double(18,3) default '100.000',
  `CurrentMonoCopyQuota` double(18,3) default '100.000',
  `IsReceiveNotify` char(1) default NULL,
  `IsCardAudit` char(1) default 'N',
  `IsFollowMe` char(1) default 'N',
  `IsAudit` char(1) default 'N',
  `Uda01` varchar(255) default NULL,
  `Uda02` varchar(255) default NULL,
  `Uda03` varchar(255) default NULL,
  `Uda04` varchar(255) default NULL,
  `Uda05` varchar(255) default NULL,
  `Uda06` varchar(255) default NULL,
  `Uda07` varchar(255) default NULL,
  `Uda08` varchar(255) default NULL,
  `Uda09` varchar(255) default NULL,
  `Uda10` varchar(255) default NULL,
  `ClientIP` varchar(20) default NULL,
  `ClientHostName` varchar(255) default NULL,
  `ClientLoginStatus` char(1) default NULL,
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`UserID`,`GroupID`,`UserName`,`UserType`,`UserEmail`,`AddDate`,`UpdateDate`,`TotalJobs`,`TotalPages`,`TotalCost`,`CurrentQuota`,`QuotaLastUpdate`,`IsDeleted`,`IsMonitored`,`ConfigID`,`UserFullName`,`IsSaveImg`,`IsManualAudit`,`ClientLanguage`,`UserPassword`,`IsClientAudit`,`LoginTimes`,`LoginIP`,`LoginDttm`,`SiteID`,`UpdateBy`,`UpdateIP`,`UpdateDttm`,`CardID`,`IDNumber`,`MFPLoginID`,`CurrentColorPrintQuota`,`CurrentMonoPrintQuota`,`CurrentColorCopyQuota`,`CurrentMonoCopyQuota`,`IsReceiveNotify`,`IsCardAudit`,`IsFollowMe`,`IsAudit`,`Uda01`,`Uda02`,`Uda03`,`Uda04`,`Uda05`,`Uda06`,`Uda07`,`Uda08`,`Uda09`,`Uda10`,`ClientIP`,`ClientHostName`,`ClientLoginStatus`) values (1,2,'edward','USER','','2011-02-16 09:08:33','2011-02-16 09:08:33',0.000,0.000,0.000,100.000,'2011-02-16 09:08:33','N','Y',0,'edward','Y','A','ENG','','',0,'','2011-02-16 09:08:33','','','','2011-02-16 09:08:33','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,'alane_xu','USER','','2011-02-16 09:08:33','2011-02-16 09:08:33',0.000,0.000,0.000,100.000,'2011-02-16 09:08:33','N','Y',0,'alane_xu','Y','A','ENG','','',0,'','2011-02-16 09:08:33','','','','2011-02-16 09:08:33','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,'betty_jian','USER','betty_jian@amaxit.net','2011-02-16 09:08:33','2011-02-16 09:08:33',0.000,0.000,0.000,100.000,'2011-02-16 09:08:33','N','Y',0,'betty_jian','Y','A','ENG','','',0,'','2011-02-16 09:08:33','','','','2011-02-16 09:08:33','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,3,'dennis_huang','USER','dennis_huang@amaxit.net','2011-02-16 09:08:33','2011-02-16 09:08:33',0.000,0.000,0.000,100.000,'2011-02-16 09:08:33','N','Y',0,'dennis_huang','Y','A','ENG','','',0,'','2011-02-16 09:08:33','','','','2011-02-16 09:08:33','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,3,'jenny_lu','USER','jenny_lu@amaxit.net','2011-02-16 09:08:33','2011-02-16 09:08:33',0.000,0.000,0.000,100.000,'2011-02-16 09:08:33','N','Y',0,'jenny_lu','Y','A','ENG','','',0,'','2011-02-16 09:08:33','','','','2011-02-16 09:08:33','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,3,'jenny3','USER','','2011-02-16 09:08:33','2011-02-16 09:08:33',0.000,0.000,0.000,100.000,'2011-02-16 09:08:33','N','Y',0,'jenny3','Y','A','ENG','','',0,'','2011-02-16 09:08:33','','','','2011-02-16 09:08:33','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,3,'kaipiao','USER','','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'kaipiao','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,3,'kaoqing','USER','','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'kaoqing','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,3,'tom_hang','USER','tom_hang@amaxit.net','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'tom_hang','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,3,'trista_zhang','USER','trista_zhang@amaxit.net','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'trista_zhang','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,3,'vicky_lan','USER','vicky_lan@amaxit.net','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'vicky_lan','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,4,'Alex_Xu','USER','','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'Alex_Xu','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,4,'Hero_Wang','USER','','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'Hero_Wang','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,4,'Jacky_Wu','USER','','2011-02-16 09:08:34','2011-02-16 09:08:34',0.000,0.000,0.000,100.000,'2011-02-16 09:08:34','N','Y',0,'Jacky_Wu','Y','A','ENG','','',0,'','2011-02-16 09:08:34','','','','2011-02-16 09:08:34','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,4,'yong_peng','USER','','2011-02-16 09:08:35','2011-02-16 09:08:35',0.000,0.000,0.000,100.000,'2011-02-16 09:08:35','N','Y',0,'yong_peng','Y','A','ENG','','',0,'','2011-02-16 09:08:35','','','','2011-02-16 09:08:35','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,4,'Zack_Zhang','USER','','2011-02-16 09:08:35','2011-02-16 09:08:35',0.000,0.000,0.000,100.000,'2011-02-16 09:08:35','N','Y',0,'Zack_Zhang','Y','A','ENG','','',0,'','2011-02-16 09:08:35','','','','2011-02-16 09:08:35','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,4,'Zhibin_Chang','USER','','2011-02-16 09:08:35','2011-02-16 09:08:35',0.000,0.000,0.000,100.000,'2011-02-16 09:08:35','N','Y',0,'Zhibin_Chang','Y','A','ENG','','',0,'','2011-02-16 09:08:35','','','','2011-02-16 09:08:35','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,5,'netcsd','USER','','2011-02-16 09:08:35','2011-02-16 09:08:35',0.000,0.000,0.000,100.000,'2011-02-16 09:08:35','N','Y',0,'netcsd','Y','A','ENG','','',0,'','2011-02-16 09:08:35','','','','2011-02-16 09:08:35','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,7,'aaron_liu','USER','','2011-02-16 09:08:35','2011-02-16 09:08:35',0.000,0.000,0.000,100.000,'2011-02-16 09:08:35','N','Y',0,'aaron_liu','Y','A','ENG','','',0,'','2011-02-16 09:08:35','','','','2011-02-16 09:08:35','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,7,'bourne_yin','USER','bourne_yin@amaxit.net','2011-02-16 09:08:35','2011-02-16 09:08:35',0.000,0.000,0.000,100.000,'2011-02-16 09:08:35','N','Y',0,'bourne_yin','Y','A','ENG','','',0,'','2011-02-16 09:08:35','','','','2011-02-16 09:08:35','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,7,'carina_chen','USER','','2011-02-16 09:08:35','2011-02-16 09:08:35',0.000,0.000,0.000,100.000,'2011-02-16 09:08:35','N','Y',0,'carina_chen','Y','A','ENG','','',0,'','2011-02-16 09:08:35','','','','2011-02-16 09:08:35','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,7,'cody_zhu','USER','cody_zhu@amaxit.net','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'cody_zhu','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,7,'fortune','USER','fortune_wang@amaxit.net','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'fortune','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,7,'gary_lin','USER','gary_lin@amaxit.net','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'gary_lin','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,7,'mike_huang','USER','huang_mike@amaxit.net','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'mike_huang','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,7,'kevin_yao','USER','kevin_yao@amaxit.net','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'kevin_yao','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,7,'print','USER','','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'print','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,7,'putest_it','USER','putest_it@amaxit.net','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'putest_it','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,7,'shanghaivpnuser','USER','','2011-02-16 09:08:36','2011-02-16 09:08:36',0.000,0.000,0.000,100.000,'2011-02-16 09:08:36','N','Y',0,'shanghaivpnuser','Y','A','ENG','','',0,'','2011-02-16 09:08:36','','','','2011-02-16 09:08:36','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,7,'Ware_Wang ','USER','','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'Ware_Wang ','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','555888',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,7,'william_zhou','USER','','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'william_zhou','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,9,'andrew_chen','USER','andrew_chen@amaxit.net','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'andrew_chen','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,9,'John_Li','USER','','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'John_Li','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,9,'nick_peng','USER','nick_peng@amaxit.net','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'nick_peng','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,10,'april_song','USER','april_song@amaxit.net','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'april_song','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,10,'chelsea_chen','USER','chelsea_chen@amaxit.net','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'chelsea_chen','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,10,'joanna_zhang','USER','joanna_zhang@amaxit.net','2011-02-16 09:08:37','2011-02-16 09:08:37',0.000,0.000,0.000,100.000,'2011-02-16 09:08:37','N','Y',0,'joanna_zhang','Y','A','ENG','','',0,'','2011-02-16 09:08:37','','','','2011-02-16 09:08:37','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,10,'lucy_lu','USER','lucy_lu@amaxit.net','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'lucy_lu','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,10,'putest_mt','USER','','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'putest_mt','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,10,'susie_wang','USER','susie_wang@amaxit.net','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'susie_wang','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,10,'wilson_gao','USER','wilson_gao@amaxit.net','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'wilson_gao','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,12,'john_lu','USER','john_lu@amaxit.net','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'john_lu','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,14,'bob_chen','USER','','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'bob_chen','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,14,'david_cao','USER','david_cao@amaxit.net','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'david_cao','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,14,'laura_luo','USER','laura_luo@amaxit.net','2011-02-16 09:08:38','2011-02-16 09:08:38',0.000,0.000,0.000,100.000,'2011-02-16 09:08:38','N','Y',0,'laura_luo','Y','A','ENG','','',0,'','2011-02-16 09:08:38','','','','2011-02-16 09:08:38','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,14,'leio_wang','USER','leio_wang@amaxit.net','2011-02-16 09:08:39','2011-02-16 09:08:39',0.000,0.000,0.000,100.000,'2011-02-16 09:08:39','N','Y',0,'leio_wang','Y','A','ENG','','',0,'','2011-02-16 09:08:39','','','','2011-02-16 09:08:39','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,14,'lisa_xie','USER','lisa_xie@amaxit.net','2011-02-16 09:08:39','2011-02-16 09:08:39',0.000,0.000,0.000,100.000,'2011-02-16 09:08:39','N','Y',0,'lisa_xie','Y','A','ENG','','',0,'','2011-02-16 09:08:39','','','','2011-02-16 09:08:39','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,14,'profile','USER','','2011-02-16 09:08:39','2011-02-16 09:08:39',0.000,0.000,0.000,100.000,'2011-02-16 09:08:39','N','Y',0,'profile','Y','A','ENG','','',0,'','2011-02-16 09:08:39','','','','2011-02-16 09:08:39','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,14,'putest_sa','USER','putest_sa@amaxit.net','2011-02-16 09:08:39','2011-02-16 09:08:39',0.000,0.000,0.000,100.000,'2011-02-16 09:08:39','N','Y',0,'putest_sa','Y','A','ENG','','',0,'','2011-02-16 09:08:39','','','','2011-02-16 09:08:39','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,14,'Richard_qian','USER','','2011-02-16 09:08:39','2011-02-16 09:08:39',0.000,0.000,0.000,100.000,'2011-02-16 09:08:39','N','Y',0,'Richard_qian','Y','A','ENG','','',0,'','2011-02-16 09:08:39','','','','2011-02-16 09:08:39','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,14,'roky_feng','USER','roky_feng@amaxit.net','2011-02-16 09:08:39','2011-02-16 09:08:39',0.000,0.000,0.000,100.000,'2011-02-16 09:08:39','N','Y',0,'roky_feng','Y','A','ENG','','',0,'','2011-02-16 09:08:39','','','','2011-02-16 09:08:39','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,14,'sam_liu','USER','sam_liu@amaxit.net','2011-02-16 09:08:39','2011-02-16 09:08:39',0.000,0.000,0.000,100.000,'2011-02-16 09:08:39','N','Y',0,'sam_liu','Y','A','ENG','','',0,'','2011-02-16 09:08:39','','','','2011-02-16 09:08:39','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,14,'sweet_zhang','USER','','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'sweet_zhang','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,14,'testsales','USER','','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'testsales','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,14,'tiger_huang','USER','tiger_huang@amaxit.net','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'tiger_huang','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,14,'danny_wu','USER','','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'danny_wu','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,14,'yolanda_hou','USER','yolanda_hou@amaxit.net','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'yolanda_hou','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,16,'clive_zhang','USER','clive_zhang@amaxit.net','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'clive_zhang','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,16,'gq_shen','USER','gq_shen@amaxit.net','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'gq_shen','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,16,'merlin_yu','USER','merlin_yu@amaxit.net','2011-02-16 09:08:40','2011-02-16 09:08:40',0.000,0.000,0.000,100.000,'2011-02-16 09:08:40','N','Y',0,'merlin_yu','Y','A','ENG','','',0,'','2011-02-16 09:08:40','','','','2011-02-16 09:08:40','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,16,'putest_si','USER','','2011-02-16 09:08:41','2011-02-16 09:08:41',0.000,0.000,0.000,100.000,'2011-02-16 09:08:41','N','Y',0,'putest_si','Y','A','ENG','','',0,'','2011-02-16 09:08:41','','','','2011-02-16 09:08:41','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,16,'simen_zhang','USER','simen_zhang@amaxit.net','2011-02-16 09:08:41','2011-02-16 09:08:41',0.000,0.000,0.000,100.000,'2011-02-16 09:08:41','N','Y',0,'simen_zhang','Y','A','ENG','','',0,'','2011-02-16 09:08:41','','','','2011-02-16 09:08:41','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,16,'steven_xu','USER','steven_xu@amaxit.net','2011-02-16 09:08:41','2011-02-16 09:08:41',0.000,0.000,0.000,100.000,'2011-02-16 09:08:41','N','Y',0,'steven_xu','Y','A','ENG','','',0,'','2011-02-16 09:08:41','','','','2011-02-16 09:08:41','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,16,'sway_wang','USER','sway_wang@amaxit.net','2011-02-16 09:08:41','2011-02-16 09:08:41',0.000,0.000,0.000,100.000,'2011-02-16 09:08:41','N','Y',0,'sway_wang','Y','A','ENG','','',0,'','2011-02-16 09:08:41','','','','2011-02-16 09:08:41','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,17,'aven_lin','USER','','2011-02-16 09:08:41','2011-02-16 09:08:41',0.000,0.000,0.000,100.000,'2011-02-16 09:08:41','N','Y',0,'aven_lin','Y','A','ENG','','',0,'','2011-02-16 09:08:41','','','','2011-02-16 09:08:41','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,17,'changzb','USER','','2011-02-16 09:08:41','2011-02-16 09:08:41',0.000,0.000,0.000,100.000,'2011-02-16 09:08:41','N','Y',0,'changzb','Y','A','ENG','','',0,'','2011-02-16 09:08:41','','','','2011-02-16 09:08:41','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,17,'defeng_zhou','USER','','2011-02-16 09:08:41','2011-02-16 09:08:41',0.000,0.000,0.000,100.000,'2011-02-16 09:08:41','N','Y',0,'defeng_zhou','Y','A','ENG','','',0,'','2011-02-16 09:08:41','','','','2011-02-16 09:08:41','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,17,'Harry_Lin','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'Harry_Lin','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,17,'Jennie_wang','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'Jennie_wang','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,17,'Joe_zhou','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'Joe_zhou','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,17,'Kelvin_yu','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'Kelvin_yu','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,17,'HC_Kemp','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'HC_Kemp','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,17,'Larry_Long','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'Larry_Long','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,17,'Metal_Yang','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'Metal_Yang','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,17,'Pitt_Zhang','USER','','2011-02-16 09:08:42','2011-02-16 09:08:42',0.000,0.000,0.000,100.000,'2011-02-16 09:08:42','N','Y',0,'Pitt_Zhang','Y','A','ENG','','',0,'','2011-02-16 09:08:42','','','','2011-02-16 09:08:42','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,17,'sales_sh','USER','','2011-02-16 09:08:43','2011-02-16 09:08:43',0.000,0.000,0.000,100.000,'2011-02-16 09:08:43','N','Y',0,'sales_sh','Y','A','ENG','','',0,'','2011-02-16 09:08:43','','','','2011-02-16 09:08:43','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,17,'Sean_Wang','USER','','2011-02-16 09:08:43','2011-02-16 09:08:43',0.000,0.000,0.000,100.000,'2011-02-16 09:08:43','N','Y',0,'Sean_Wang','Y','A','ENG','','',0,'','2011-02-16 09:08:43','','','','2011-02-16 09:08:43','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,17,'tony_lee','USER','','2011-02-16 09:08:43','2011-02-16 09:08:43',0.000,0.000,0.000,100.000,'2011-02-16 09:08:43','N','Y',0,'tony_lee','Y','A','ENG','','',0,'','2011-02-16 09:08:43','','','','2011-02-16 09:08:43','',0,'',100.000,100.000,100.000,100.000,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `websites` */

DROP TABLE IF EXISTS `websites`;

CREATE TABLE `websites` (
  `WebID` int(11) NOT NULL auto_increment,
  `WebSite` varchar(255) NOT NULL,
  `WebDescription` varchar(255) default NULL,
  PRIMARY KEY  (`WebID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `websites` */

/*Table structure for table `xpsbannerconfig` */

DROP TABLE IF EXISTS `xpsbannerconfig`;

CREATE TABLE `xpsbannerconfig` (
  `ConfigID` int(11) NOT NULL auto_increment,
  `BannerName` varchar(255) default NULL,
  `BannerType` char(1) default NULL,
  `BannerPosition` varchar(255) default NULL,
  `Showpage` char(1) default NULL,
  `ShowpageDes` varchar(255) default NULL,
  `Textcontent` varchar(255) default NULL,
  `TextFont` varchar(255) default NULL,
  `TextFontsize` varchar(255) default NULL,
  `TextBold` char(1) default NULL,
  `TextItalic` char(1) default NULL,
  `TextUnderline` varchar(255) default NULL,
  `TextFontcolor` varchar(255) default NULL,
  `TextTransparency` varchar(255) default NULL,
  `PicturePath` varchar(255) default NULL,
  `ImageTransparency` varchar(255) default NULL,
  `Barcodecontent` varchar(255) default NULL,
  `Barcodetype` varchar(255) default NULL,
  `IsTemplate` char(1) default NULL,
  `Uda01` varchar(255) default NULL,
  `Uda02` varchar(255) default NULL,
  `Uda03` varchar(255) default NULL,
  `Uda04` varchar(255) default NULL,
  `Uda05` varchar(255) default NULL,
  `Uda06` varchar(255) default NULL,
  `Uda07` varchar(255) default NULL,
  `Uda08` varchar(255) default NULL,
  `Uda09` varchar(255) default NULL,
  `Uda10` varchar(255) default NULL,
  `QRcodecontent` varchar(255) default NULL,
  `QRcodesize` int(11) default NULL,
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xpsbannerconfig` */

/*Table structure for table `xpswatermarkconfig` */

DROP TABLE IF EXISTS `xpswatermarkconfig`;

CREATE TABLE `xpswatermarkconfig` (
  `ConfigID` int(11) NOT NULL auto_increment,
  `WaterMarkName` varchar(255) default NULL,
  `WaterMarkType` char(1) default NULL,
  `Transparency` varchar(255) default NULL,
  `Direction` char(1) default NULL,
  `Showpage` char(1) default NULL,
  `ShowpageDes` varchar(255) default NULL,
  `Textcontent` varchar(255) default NULL,
  `TextFont` varchar(255) default NULL,
  `TextFontsize` varchar(255) default NULL,
  `TextBold` char(1) default NULL,
  `TextItalic` char(1) default NULL,
  `TextUnderline` varchar(255) default NULL,
  `TextFontcolor` varchar(255) default NULL,
  `PicturePath` varchar(255) default NULL,
  `IsTemplate` char(1) default NULL,
  `Uda01` varchar(255) default NULL,
  `Uda02` varchar(255) default NULL,
  `Uda03` varchar(255) default NULL,
  `Uda04` varchar(255) default NULL,
  `Uda05` varchar(255) default NULL,
  `Uda06` varchar(255) default NULL,
  `Uda07` varchar(255) default NULL,
  `Uda08` varchar(255) default NULL,
  `Uda09` varchar(255) default NULL,
  `Uda10` varchar(255) default NULL,
  PRIMARY KEY  (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xpswatermarkconfig` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
