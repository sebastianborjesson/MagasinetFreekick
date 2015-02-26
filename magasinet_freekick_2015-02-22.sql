# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Värd: 127.0.0.1 (MySQL 5.6.17)
# Databas: magasinet_freekick
# Genereringstid: 2015-02-22 22:35:04 +0000
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
	('Luka Modric','Regmentsgatan 12',21122,'Malmö','+46 572958374','fotbolls@kungen.boll',NULL);

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
	(10,'premier-league','premier-league','my-menu-machine-name',NULL,0),
	(11,'ligue-1','ligue-1','my-menu-machine-name',NULL,0),
	(12,'la-liga','la-liga','my-menu-machine-name',NULL,0),
	(13,'teams','teams','my-menu-machine-name',10,0),
	(14,'scoring-race','scoring-race','my-menu-machine-name',10,0),
	(15,'team','team','my-menu-machine-name',11,0),
	(16,'scoring-races','scoring-races','my-menu-machine-name',11,0),
	(17,'squads','squads','my-menu-machine-name',12,0),
	(18,'goal-scoring-race','goal-scoring-race','my-menu-machine-name',12,0),
	(19,'about-us','about-us','my-menu-machine-name',NULL,0),
	(20,'liverpool','liverpool','my-menu-machine-name',13,0),
	(21,'psg','psg','my-menu-machine-name',15,0),
	(22,'real-madrid','real-madrid','my-menu-machine-name',17,0);

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
	(10,'Premier League','The Premier League is an English professional league for men\'s association football clubs. At the top of the English football league system, it is the country\'s primary football competition. Contested by 20 clubs, it operates on a system of promotion and relegation with the Football League. Besides English clubs, those Welsh clubs competing in the English football pyramid can also qualify to play.\n\nThe Premier League is a corporation in which the 20 member clubs act as shareholders. Seasons run from August to May, with teams playing 38 matches each (playing each team in the league twice, home and away) totalling 380 matches in the season.[1] Most games are played in the afternoons of Saturdays and Sundays, the other games during weekday evenings. It is currently sponsored by Barclays Bank and thus officially known as the Barclays Premier League. Outside England, it is commonly referred to as the English Premier League (EPL).',2,1,NULL,'2015-02-22 14:01:52'),
	(11,'Ligue 1','Ligue 1\n\ns the French professional league for association football clubs. It is the country\'s primary football competition and serves as the top division of the French football league system. Ligue 1 is one of two divisions making up the Ligue de Football Professionnel, the other being Ligue 2. Contested by 20 clubs, it operates on a system of promotion and relegation with Ligue 2. Seasons run from August to May, with teams playing 38 games each totaling 380 games in the season.\n\nLigue 1 was inaugurated on 11 September 1932 under the name National before switching to Division 1 after a year of existence. The name lasted until 2002 before switching to its current name. The current champions are Paris Saint-Germain, who won the 4th title of their history in the 2013–14 season.',3,1,NULL,'2015-02-22 14:03:08'),
	(12,'La Liga','La Liga is the top professional association football division of the Spanish football league system. It is contested by 20 teams, with the three lowest placed teams relegated to the Segunda División and replaced by the top two teams in that division plus the winner of a play-off. A total of 60 teams have competed in La Liga, nine of which have been crowned champions. Since the 1950s, Real Madrid and Barcelona have dominated the championship. Real Madrid have won the title a record 32 times and Barcelona 22 times. During the 1930s and 1940s and in the last two decades, however, La Liga has seen other champions, including, Atlético Madrid, Athletic Bilbao, Valencia, Real Sociedad, Real Betis, Deportivo La Coruña and Sevilla.',5,1,NULL,'2015-02-22 14:14:53'),
	(13,'Teams','\n\n1	Chelsea\n2	Manchester City\n3	Arsenal\n4	Manchester United\n5	Southampton\n6	Liverpool\n7	Tottenham Hotspur	\n8	West Ham United\n9	Swansea City\n10	Stoke City\n11	Newcastle United\n12	Everton\n13	Crystal Palace\n14	West Bromwich Albion\n15	Hull City\n16	Sunderland\n17	Queens Park Rangers\n18	Burnley\n19	Aston Villa\n20	Leicester City',2,1,NULL,'2015-02-22 19:37:28'),
	(14,'Scoring race','\n1	Argentina Sergio Agüero	Manchester City	17\nSpain Diego Costa	Chelsea\n3	England Charlie Austin	Queens Park Rangers	14\nEngland Harry Kane	Tottenham Hotspur\n5	Chile Alexis Sánchez	Arsenal	12\n6	England Saido Berahino	West Bromwich Albion	10\nSenegal Papiss Cissé	Newcastle United\nNetherlands Robin van Persie	Manchester United\n9	Ivory Coast Wilfried Bony	Swansea City	9\nDenmark Christian Eriksen	Tottenham Hotspur\nBelgium Eden Hazard	Chelsea\nEngland Danny Ings	Burnley\nSenegal Diafra Sakho	West Ham United\nSpain David Silva	Manchester City\n',2,1,NULL,'2015-02-22 19:41:40'),
	(15,'Teams','1	Lyon\n2	Paris Saint-Germain\n3	Marseille\n4	Monaco\n5	Saint-Étienne\n6	Bordeaux	\n7	Montpellier\n8	Guingamp\n9	Nice\n10	Bastia\n11	Nantes\n12	Lille\n13	Rennes\n14	Caen\n15	Reims\n16	Lorient\n17	Toulouse\n18	Evian\n19	Lens\n20	Metz	',3,1,NULL,'2015-02-22 20:14:16'),
	(16,'Scoring race','1	France Alexandre Lacazette	Lyon	21\n2	France André-Pierre Gignac	Marseille	14\n3	Sweden Zlatan Ibrahimović	Paris Saint-Germain	11\nGuadeloupe Claudio Beauvue	Guingamp\n5	France Nabil Fekir	Lyon	9\n6	Denmark Daniel Wass	Evian TG	8\nUruguay Edinson Cavani	Paris Saint-Germain\nMali Cheick Diabaté	Bordeaux\nFrance Mathieu Duhamel	Evian TG\n10	France Paul-Georges Ntep	Rennes	7\nBrazil Carlos Eduardo	Nice\nFrance Wissam Ben Yedder	Toulouse\nGhana Jordan Ayew	Lorient\nFrance Christophe Mandanne	Guingamp\nUruguay Diego Rolán	Bordeaux\nCameroon Benjamin Moukandjo	Reims\nFrance Benjamin Jeannot	Lorient\nBrazil Lucas	Paris Saint-Germain\n',3,1,NULL,'2015-02-22 20:46:08'),
	(17,'Teams','1	Real Madrid\n2	Barcelona\n3	Atlético Madrid\n4	Valencia\n5	Sevilla\n6	Villarreal\n7	Málaga\n8	Celta Vigo\n9	Espanyol\n10	Real Sociedad	\n11	Eibar\n12	Athletic Bilbao\n13	Getafe\n14	Rayo Vallecano\n15	Deportivo La Coruña\n16	Almería\n17	Elche\n18	Granada\n19	Levante\n20	Córdoba',5,1,NULL,'2015-02-22 20:50:03'),
	(18,'Scoring Race','1	Portugal Cristiano Ronaldo	Real Madrid	28\n2	Argentina Lionel Messi	Barcelona	26\n3	Brazil Neymar	Barcelona	17\n4	France Antoine Griezmann	Atlético Madrid	14\n5	Colombia Carlos Bacca	Sevilla	13\n6	France Karim Benzema	Real Madrid	12\nCroatia Mario Mandžukić	Atlético Madrid\n8	Wales Gareth Bale	Real Madrid	10\nArgentina Luciano Vietto	Villarreal\n10	Spain Sergio García	Espanyol	9\nBrazil Jonathas	Elche\nUruguay Christian Stuani	Espanyol\n',5,1,NULL,'2015-02-22 20:51:18'),
	(19,'About us','Bacon ipsum dolor amet bacon doner spare ribs tongue brisket. Salami tongue pork loin shank, tenderloin turducken fatback turkey beef spare ribs ribeye tri-tip sirloin. Ribeye short loin venison, brisket pastrami biltong beef ribs pancetta. Shoulder biltong short ribs drumstick ham hock. Kielbasa bresaola rump prosciutto, ham hock cupim turkey tongue jowl strip steak alcatra tenderloin. Kielbasa ham hock ribeye brisket pork loin salami picanha chicken cupim.\n\nMeatball pork belly strip steak, bresaola beef picanha shoulder salami alcatra tenderloin. Chuck cow porchetta jerky. Pork belly capicola shoulder landjaeger, venison flank jerky porchetta turducken hamburger tail. Frankfurter spare ribs picanha prosciutto. Sausage biltong beef ribs frankfurter rump swine. Kevin drumstick alcatra andouille, cow tenderloin landjaeger ham hock sausage rump tri-tip cupim swine chicken.\n\nFlank alcatra hamburger ball tip. Tenderloin pastrami filet mignon shoulder bacon porchetta. Ham hock frankfurter tail tenderloin jowl pork chop turducken hamburger kielbasa short loin brisket sirloin. Bacon landjaeger fatback alcatra, spare ribs hamburger meatloaf. Boudin chuck kevin ball tip. Shoulder meatball porchetta doner ham bresaola pork jowl picanha. Shank sirloin kielbasa chicken t-bone, fatback biltong.',4,1,NULL,'2015-02-22 20:53:03'),
	(20,'Liverpool','Leberkas pork belly fatback tail, sausage strip steak drumstick andouille pastrami meatball kielbasa beef ribs tri-tip pancetta brisket. Capicola chicken shank ball tip flank swine andouille pork chop. Short loin picanha pork chop capicola, jowl tail tongue salami jerky biltong. Pastrami chuck pork loin meatball landjaeger, pork belly sirloin ground round ribeye chicken jowl corned beef.\n\nChuck kevin beef porchetta leberkas ham tongue brisket capicola venison sirloin ham hock salami. Bresaola shankle brisket, cow pork belly hamburger beef salami doner. Tail bresaola kielbasa pork chop. Andouille kevin cow sausage swine tri-tip ham hock beef cupim capicola pork belly tail frankfurter. Pork pork belly cow bresaola.\n\nMeatloaf porchetta meatball alcatra ground round shankle. Hamburger pork chop kielbasa brisket shoulder filet mignon venison strip steak pancetta beef ribs tail t-bone bacon turducken. Bresaola drumstick turducken swine, pork loin sausage filet mignon tongue beef. Pork chop spare ribs tri-tip, beef ribs pastrami kielbasa filet mignon hamburger jowl. Biltong tail chuck alcatra, ball tip jowl pork loin.',2,1,NULL,'2015-02-22 21:45:35'),
	(21,'PSG','Shankle jowl flank turducken rump capicola pork brisket boudin. Salami leberkas venison, biltong shankle jowl bresaola andouille meatball hamburger swine jerky porchetta cow picanha. Fatback pork belly ball tip tenderloin short ribs rump shoulder tri-tip pork ham hock t-bone, kielbasa ham frankfurter. Shank tongue filet mignon, shoulder pig swine ball tip sausage chuck kevin drumstick flank picanha meatloaf. Boudin salami ribeye jerky t-bone, pork sirloin short ribs tenderloin pork loin pork belly picanha bresaola chuck sausage.\n\nPorchetta brisket beef ribs, pork loin short loin ribeye beef kevin frankfurter swine pork chicken flank drumstick spare ribs. Pork chop prosciutto biltong cow, bacon kevin doner jowl chuck venison salami kielbasa frankfurter meatloaf meatball. Meatloaf landjaeger filet mignon ham pork leberkas swine bresaola biltong tongue pork belly cupim. Porchetta pastrami jerky sausage cupim, drumstick meatloaf ground round.',3,1,NULL,'2015-02-22 21:46:19'),
	(22,'Real Madrid','Kielbasa spare ribs cow pastrami shankle. Corned beef shank t-bone pork belly. Boudin kevin pig, fatback cupim shank bacon pancetta drumstick meatball meatloaf tenderloin. Shank venison beef bacon ham hock, pork belly pork chop brisket corned beef cow pork loin. Ham shoulder cow, short loin prosciutto biltong sausage turkey boudin.\n\nShank tail beef ribs pork chop turkey short ribs sausage rump leberkas cupim. Shank pancetta rump frankfurter strip steak chuck. Pastrami doner kevin, alcatra flank beef ribs kielbasa hamburger ribeye picanha sirloin. Doner shank t-bone, biltong pork belly kevin hamburger sausage salami drumstick short ribs.\n',5,1,NULL,'2015-02-22 21:47:11');

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
	(10,'premier-league',10),
	(11,'ligue-1',11),
	(12,'la-liga',12),
	(13,'teams',13),
	(14,'scoring-race',14),
	(15,'team',15),
	(16,'scoring-races',16),
	(17,'squads',17),
	(18,'goal-scoring-race',18),
	(19,'about-us',19),
	(20,'liverpool',20),
	(21,'psg',21),
	(22,'real-madrid',22);

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
