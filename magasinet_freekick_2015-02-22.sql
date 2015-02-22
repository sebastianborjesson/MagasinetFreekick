# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Värd: 127.0.0.1 (MySQL 5.6.17)
# Databas: magasinet_freekick
# Genereringstid: 2015-02-22 10:36:08 +0000
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

LOCK TABLES `footer` WRITE;
/*!40000 ALTER TABLE `footer` DISABLE KEYS */;

INSERT INTO `footer` (`name`, `street`, `postalcode`, `city`, `phone`, `email`, `info`)
VALUES
	('Sebastian Börjesson','Regmentsgatan 12',21122,'Malmö','+46 572958374','sebastian@borjesson.se',NULL);

/*!40000 ALTER TABLE `footer` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;

INSERT INTO `images` (`iid`, `title`, `path`, `alt`, `user_id`, `uploaded`)
VALUES
	(2,'Premier-league','barclays.jpg',NULL,1,'2015-02-19 09:42:02'),
	(3,'French-ligue-1','ligue-1.jpg',NULL,1,'2015-02-19 09:42:50'),
	(4,'Stadium','stadium.jpg',NULL,1,'2015-02-19 09:43:15'),
	(5,'Spanish-la-liga','la-liga.jpg',NULL,1,'2015-02-19 09:43:37');

/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'ubjkl','ubjkl','my-menu-machine-name',NULL,0),
	(2,'vhjkb','vhjkb','my-menu-machine-name',1,0),
	(3,'fcghvj','fcghvj','my-menu-machine-name',NULL,0),
	(4,'mtyntbr','mtyntbr','my-menu-machine-name',NULL,0),
	(5,'ivyhkbj-iyvhkjb-','ivyhkbj-iyvhkjb-','my-menu-machine-name',NULL,0),
	(6,'brsdv','brsdv','my-menu-machine-name',NULL,0),
	(7,'bervsd','bervsd','my-menu-machine-name',NULL,0),
	(8,'oivybnuh','oivybnuh','my-menu-machine-name',NULL,0);

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

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`menu_name`, `machine_name`)
VALUES
	('main_menu_menu','my_menu_machine_name');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'gcjvhn','cvjhkb',NULL,1,NULL,'2015-02-20 11:37:12'),
	(2,'vhkbj','yvuhkjb',NULL,1,NULL,'2015-02-20 11:40:12'),
	(3,'cvjhkb','ctvhjbk',NULL,1,NULL,'2015-02-20 11:40:54'),
	(4,'brwvda','bfdgwe',NULL,1,NULL,'2015-02-20 12:15:26'),
	(5,'lbjkcytuv','biujk',NULL,1,NULL,'2015-02-20 12:23:02'),
	(6,'tbrsvd','efwgfbd',2,1,NULL,'2015-02-20 13:48:22'),
	(7,'ntbersv','esbfd',2,1,NULL,'2015-02-20 13:49:53'),
	(8,'vyukj','uvnkbnkb',4,1,NULL,'2015-02-20 13:50:44');

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
	(1,'ubjkl',1),
	(2,'vhjkb',2),
	(3,'fcghvj',3),
	(4,'mtyntbr',4),
	(5,'ivyhkbj-iyvhkjb-',5),
	(6,'brsdv',6),
	(7,'bervsd',7),
	(8,'oivybnuh',8);

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
	(1,'Sebastian','Börjesson','sebastian@borjesson.se','0000',NULL,'2015-01-23 09:24:05');

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
