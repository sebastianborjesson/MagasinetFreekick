# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Värd: 127.0.0.1 (MySQL 5.6.17)
# Databas: magasinet_freekick
# Genereringstid: 2015-01-26 18:46:47 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Tabelldump footer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `footer`;

CREATE TABLE `footer` (
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postalcode` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Tabelldump images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Tabelldump menu_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_links`;

CREATE TABLE `menu_links` (
  `mlid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `menu` varchar(255) NOT NULL,
  `plid` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `plid` (`plid`),
  KEY `path` (`path`),
  CONSTRAINT `menu_links_ibfk_1` FOREIGN KEY (`plid`) REFERENCES `menu_links` (`mlid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menu_links` WRITE;
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;

INSERT INTO `menu_links` (`mlid`, `title`, `path`, `menu`, `plid`, `weight`)
VALUES
	(3,'fafa','hterbfhtre','efefa',NULL,0),
	(4,'fefeaf','ergrwgwr','sfljnasf',NULL,0);

/*!40000 ALTER TABLE `menu_links` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `menu_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `machine_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`machine_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Tabelldump pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `img_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  KEY `user_id` (`user_id`),
  KEY `img_id` (`img_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`),
  CONSTRAINT `pages_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `images` (`iid`),
  CONSTRAINT `pages_ibfk_3` FOREIGN KEY (`video_id`) REFERENCES `video` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`pid`, `title`, `body`, `img_id`, `user_id`, `video_id`, `created`)
VALUES
	(1,'ngklsdggmsx','fjsoelknfslk',NULL,1,NULL,'2015-01-26 10:34:19'),
	(2,'gwdgw','yjsth',NULL,1,NULL,'2015-01-26 11:14:21'),
	(3,'sepkgnskeg','krnglk',NULL,1,NULL,'2015-01-26 11:14:49'),
	(4,'ehrger','egrherhr',NULL,1,NULL,'2015-01-26 13:13:34'),
	(5,'nkwelgmgwr','agoprdljfm',NULL,1,NULL,'2015-01-26 13:14:25'),
	(6,'egwnjslkgnrs','efnoweklgnwelk',NULL,1,NULL,'2015-01-26 13:15:20'),
	(7,'egpkrwm','w4esjitgkwelsgn',NULL,1,NULL,'2015-01-26 13:16:24'),
	(8,'gioewnklgwelk','w4gjnokwegln',NULL,1,NULL,'2015-01-26 13:21:08'),
	(9,'gwrhreg','5erygs4g',NULL,1,NULL,'2015-01-26 13:21:55'),
	(10,'gnoelkghewknl','egwegewg',NULL,1,NULL,'2015-01-26 13:26:20'),
	(11,'jytrher','grgsvrwsg',NULL,1,NULL,'2015-01-26 13:27:20'),
	(12,'gnoiwsrkgld','esdngioklwrsdg',NULL,1,NULL,'2015-01-26 13:28:00'),
	(13,'ewnglweg','wrgwrhsgd',NULL,1,NULL,'2015-01-26 13:28:18'),
	(14,'rewrhethf','hergherg',NULL,1,NULL,'2015-01-26 13:35:25'),
	(15,'rglskngrlkg','vw ejolsdnwklev',NULL,1,NULL,'2015-01-26 13:57:25'),
	(16,'rgnwsklgwsv','vrneioskglnrsklv',NULL,1,NULL,'2015-01-26 13:59:18'),
	(17,'eiokvnsdlkv','ewsngiklwrsgonlwkds',NULL,1,NULL,'2015-01-26 14:02:42'),
	(18,'rgoiwrlkgn','vewgnko',NULL,1,NULL,'2015-01-26 14:02:56'),
	(19,'gnweiklgewn','ewgnoweklsgn',NULL,1,NULL,'2015-01-26 14:03:25'),
	(20,'wgniowelgkrw','wegiforwlkenf',NULL,1,NULL,'2015-01-26 14:03:55'),
	(21,'wgniowelgkrw','wegiforwlkenf',NULL,1,NULL,'2015-01-26 14:11:52'),
	(22,'vkldgnksgl','tberv',NULL,1,NULL,'2015-01-26 14:12:06'),
	(23,'ndvklsdnvwsfw','erhgefregs',NULL,1,NULL,'2015-01-26 14:13:20'),
	(24,'ewglkwegn','wegowkrlsgn',NULL,1,NULL,'2015-01-26 14:14:06'),
	(25,'rgkrlwngwr','hterg',NULL,1,NULL,'2015-01-26 14:19:11'),
	(26,'regnklregnr','ter',NULL,1,NULL,'2015-01-26 14:19:44'),
	(27,'gwklgnweg','rgwrgrwgreg',NULL,1,NULL,'2015-01-26 14:20:16'),
	(28,'gwiglknwrlk','ewtgiw4eklngw',NULL,1,NULL,'2015-01-26 14:20:41'),
	(29,'4wgegrw','gregerger',NULL,1,NULL,'2015-01-26 14:21:53'),
	(30,'grnlkngsd','rgkjrgns',NULL,1,NULL,'2015-01-26 14:25:30'),
	(31,'vndsionlkdv','gsrfgsrfgrg',NULL,1,NULL,'2015-01-26 14:29:15'),
	(32,'ewlkngwlkgw','wegnklwegnwlk',NULL,1,NULL,'2015-01-26 14:29:41'),
	(33,'wegwrg','rgergerg',NULL,1,NULL,'2015-01-26 14:30:08'),
	(34,'gwenogklweng','rgwwefac',NULL,1,NULL,'2015-01-26 14:31:17'),
	(35,'ewkglweng','gerwwe',NULL,1,NULL,'2015-01-26 14:33:10'),
	(36,'gregwe','gwrgweg',NULL,1,NULL,'2015-01-26 14:33:26'),
	(37,'frgweg','gwregewgg',NULL,1,NULL,'2015-01-26 14:37:28'),
	(38,'ewwegwe','gewgewge',NULL,1,NULL,'2015-01-26 14:40:44'),
	(39,'gwegewg','wgewgwegew',NULL,1,NULL,'2015-01-26 14:41:01'),
	(40,'h5ersgerg','gwregewgwegrwg',NULL,1,NULL,'2015-01-26 15:08:50'),
	(41,'grwegf','rwgewgrwegew',NULL,1,NULL,'2015-01-26 15:44:35'),
	(42,'gwgw','grwgwrg',NULL,1,NULL,'2015-01-26 15:45:38'),
	(43,'hergrg','grwgrwgerg',NULL,1,NULL,'2015-01-26 15:55:08'),
	(44,'tdrherher','rwgergergre',NULL,1,NULL,'2015-01-26 15:56:04'),
	(45,'fwegweg','wegwegewgw',NULL,1,NULL,'2015-01-26 15:56:42'),
	(46,'rgwrgw','fsdfsdbthdryrg4wrtg',NULL,1,NULL,'2015-01-26 15:57:00'),
	(47,'hregwr','gewewgwegewg',NULL,1,NULL,'2015-01-26 15:57:39'),
	(48,'herdsgwe','ewgewgewgewg',NULL,1,NULL,'2015-01-26 15:58:08'),
	(49,'geweg','gewgewgewgegw',NULL,1,NULL,'2015-01-26 15:59:59'),
	(50,'rgwegew','gewgwegewgre',NULL,1,NULL,'2015-01-26 16:00:34'),
	(51,'gwegwe','ewdscdsfs',NULL,1,NULL,'2015-01-26 16:01:04'),
	(52,'regweg','vgdgs',NULL,1,NULL,'2015-01-26 16:01:28'),
	(53,'grwgwee','hregsedfhgrs',NULL,1,NULL,'2015-01-26 16:04:41');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump url_alias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `url_alias`;

CREATE TABLE `url_alias` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `path` (`path`),
  KEY `pid` (`pid`),
  CONSTRAINT `url_alias_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `pages` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;

INSERT INTO `url_alias` (`aid`, `path`, `pid`)
VALUES
	(1,'dnfsklsd',1),
	(2,'gwhrgeta',2),
	(3,'gklnks',3),
	(4,'gerergs',4),
	(5,'etnokwelg',5),
	(6,'nweogklnewlk',6),
	(7,'rgklwengsd',7),
	(8,'ewjgnklweng',8),
	(9,'westfwesfd',9),
	(10,'egwniolewv',10),
	(11,'efwsecs',11),
	(12,'rnoglk w.ns',12),
	(13,'wesdgweg',13),
	(14,'hterbfhtre',14),
	(15,'nvowkldnvl',15),
	(16,'wngklesnslv',16),
	(17,'gnowielkagnweklv',17),
	(18,'gwenoi',18),
	(19,'weniogklwegn',19),
	(20,'fiowlkengweklf',20),
	(22,'thegrwef',22),
	(23,'erhwge',23),
	(24,'wgengklrwg',24),
	(25,'htergw',25),
	(26,'ntergef',26),
	(27,'erherwgwe',27),
	(28,'grgklnwegwe',28),
	(29,'rgerger',29),
	(30,'gw jrdsgm ,sd',30),
	(31,'dfgsrgsr',31),
	(32,'gweolknwrlkg',32),
	(33,'thergrwg',33),
	(34,'egweklgwendg',34),
	(35,'tehrgrwegf',35),
	(36,'grwgwrgw',36),
	(37,'rwgrwgwr',37),
	(38,'gewgew',38),
	(39,'gewewge',39),
	(40,'ergrwgwr',40),
	(41,'wegweg',41),
	(42,'grgrw',42),
	(43,'rgregr',43),
	(44,'ergrg',44),
	(45,'wegewg',45),
	(46,'rgwegew',46),
	(47,'grwgew',47),
	(48,'gregweg',48),
	(49,'wegew',49),
	(50,'gwegew',50),
	(51,'gewgewf',51),
	(52,'weged',52),
	(53,'fdbfhdsgd',53);

/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `description` text,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`uid`, `fname`, `lname`, `email`, `pass`, `description`, `joined`)
VALUES
	(1,'Sebastian','Börjesson','sebastian@borjesson.se','0000',NULL,'2015-01-23 10:24:05');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int(11) NOT NULL,
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
