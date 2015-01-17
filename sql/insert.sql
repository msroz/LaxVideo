-- MySQL dump 10.13  Distrib 5.1.73, for apple-darwin11.4.2 (i386)
--
-- Host: localhost    Database: lax
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `video_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `picture` varchar(255) NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `like` int(10) unsigned NOT NULL DEFAULT '0',
  `dislike` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,0,7182889,'Ryan Powell\'s \"ROOT-B 22\" Training System','Ryan Powell demonstrates his 22 drills for Lacrosse players.','https://vimeo.com/7182889',320,240,'https://i.vimeocdn.com/video/30045445_100x75.jpg',917,0,0,0,1421421356,1421421356),(2,0,21905458,'Practice Made Perfect','Wesleyan Lacrosse','https://vimeo.com/21905458',1280,720,'https://i.vimeocdn.com/video/141580595_100x75.jpg',43,0,0,0,1421421356,1421421356),(3,0,3383076,'LACROSSE','Open title for Lacrosse 2009\'s competition. \n','https://vimeo.com/3383076',504,284,'https://i.vimeocdn.com/video/2659812_100x75.jpg',20,0,0,0,1421421356,1421421356),(4,0,354711,'Tufts Lacrosse Spring \'07','A video spot shot for Tufts University Men\'s Lacrosse Team.  Music by Explosions in the Sky-\"The Only Moment We Were Alone\". For more information visit http://www.jumboslaxtv.com.','https://vimeo.com/354711',1280,720,'https://i.vimeocdn.com/video/49384976_100x75.jpg',0,0,0,0,1421421356,1421421356),(5,0,8936476,'THE BIRTH OF A TEAM','LACROSSE','https://vimeo.com/8936476',1280,720,'https://i.vimeocdn.com/video/45419128_100x75.jpg',862,0,0,0,1421421356,1421421356),(6,0,22829161,'Tufts Lacrosse 2010','A film documenting the Tufts Men\'s Lacrosse 2010 National Championship season. http://jumboslaxtv.com\n\nBy Arlin Ladue - http://www.arlin.com\nProduced by Drew Innis - http://drewinnis.com','https://vimeo.com/22829161',1280,544,'https://i.vimeocdn.com/video/148326963_100x75.jpg',1649,0,0,0,1421421356,1421421356),(7,0,4738328,'Chapel Hill vs. Providence 5.16.09 4A Championship (2009)','Providence 19 - Chapel Hill 13','https://vimeo.com/4738328',640,480,'https://i.vimeocdn.com/video/12806585_100x75.jpg',337,0,0,0,1421421356,1421421356),(8,0,7203006,'LACROSSE','Motion design for the Lacrosse 2009 season on Europsort 2.','https://vimeo.com/7203006',512,288,'https://i.vimeocdn.com/video/30205468_100x75.jpg',20,0,0,0,1421421356,1421421356),(9,0,18694219,'Lacrosse Nation','This video was done in conjunction with a Sports Illustrated story about the history of the game Lacrosse through its founders, the Iroquois Nation.\n\nPublished on SI.com on July 17, 2010.\n\nhttp://sportsillustrated.cnn.com/video/si_video/2010/07/15/071510_iroquois_lacrosse_culture.SportsIllustrated/index.html','https://vimeo.com/18694219',1280,720,'https://i.vimeocdn.com/video/117778353_100x75.jpg',186,0,0,0,1421421356,1421421356),(10,0,64675548,'America’s First Sport','The first sporting event ever observed by Europeans in North America was a lacrosse game in 1637.  Jesuit missionaries from France saw hundreds of native men playing a ball game with sticks that they thought resembled a bishop’s crosier, so they called the game “lacrosse.”\n\nThat makes lacrosse the oldest sport in America, and in the 21st century it is also the fastest growing.  This rapid growth in participation, domestically and globally, presents the sport with a new set of opportunities and several challenges.\n\nStudents in The History of Sport class at Syracuse University’s Department of Sport Management researched the history, current status and future prospects of lacrosse during the 2012-13 academic year.  This film is a product of their research which was led by Sport Management faculty.\n\nAmerica’s First Sport was made possible by funding from members of the David B. Falk College of Sport and Human Dynamics Advisory Board and other generous donors.  \nWe thank you, and enjoy America’s First Sport.\n\n\nNarrated by Mike Tirico\nOriginal Score by Bill DiCosimo\nDirector of Photography Michael Barletta\nEdited by Holly Rodricks\nCoordinating Producer: John Craddock III\nWritten, produced and directed by Dennis Deninger\n\nCopyright Syracuse University 2013','https://vimeo.com/64675548',640,358,'https://i.vimeocdn.com/video/435409667_100x75.jpg',3277,0,0,0,1421421356,1421421356),(11,0,65242990,'LACROSSE','NJ LACROSSE GAME CLIPS','https://vimeo.com/65242990',1280,720,'https://i.vimeocdn.com/video/436205922_100x75.jpg',129,0,0,0,1421421356,1421421356),(12,0,16334234,'BYU Lacrosse Halloween Practice 2010','A short video of the BYU Lacrosse Annual Halloween Costume Practice. ','https://vimeo.com/16334234',1280,720,'https://i.vimeocdn.com/video/99854116_100x75.jpg',175,0,0,0,1421421356,1421421356),(13,0,4032860,'Lacrosse - We are kids','Song: We are kids\nBand: Lacrosse\nAlbum: Bandages for the heart\n2009','https://vimeo.com/4032860',1280,720,'https://i.vimeocdn.com/video/7676867_100x75.jpg',282,0,0,0,1421421356,1421421356),(14,0,38851868,'The Men of Harvard Lacrosse','Made by: Drew Innis - http://drewinnis.com\n\nOriginal Score By: Saunder Jurriaans, Daniel Bensi - http://www.stenfertcharles.com\nand Noel Heroux - http://hoorayforearth.net\n\nAdditional Game Camera: \nArlin Ladue - http://arlin.com\nShawn Tyler\nLuke Boelitz','https://vimeo.com/38851868',1280,720,'https://i.vimeocdn.com/video/267707253_100x75.jpg',1204,0,0,0,1421421356,1421421356),(15,0,107868290,'GoPro: Lacrosse','High school lacrosse players enjoy a friendly pick-up game during the hot Florida summer.\n\nShot 100% on the HD HERO3+® camera from ‪http://GoPro.com.\n\nMusic Courtesy of ExtremeMusic\nhttp://www.extrememusic.com','https://vimeo.com/107868290',1280,720,'https://i.vimeocdn.com/video/491398556_100x75.jpg',103,0,0,0,1421421356,1421421356),(16,0,31380159,'Brown State Lacrosse 2012','Here is a glimpse into the Brown University men\'s lacrosse program.  Produced by Caz Rubacky.','https://vimeo.com/31380159',1280,720,'https://i.vimeocdn.com/video/211443292_100x75.jpg',221,0,0,0,1421421356,1421421356),(17,0,13596724,'Fastec Imaging High Speed Camera - Testing 718 Frames Per Second at 720p','I am playing around with a high speed camera. Not easy to shoot with this thing, but the images coming off it look great.\n\nread the whole blog here: http://www.tomguilmette.com/wp/my-blog/archives/3325\n\nI also will provide an uncompressed .avi file straight off the camera\'s solid state memory for you to look at.','https://vimeo.com/13596724',1280,720,'https://i.vimeocdn.com/video/78237750_100x75.jpg',172,0,0,0,1421421356,1421421356),(18,0,96877522,'Dick\'s Sporting Goods - \"Sports Matter\" Anthem','Anthem film for Dick\'s Sporting Goods \"Sports Matter\" Campaign\n\nFeaturing real high school athletes.\n\nDirected by: The Mercadantes\nAgency: Anomaly','https://vimeo.com/96877522',1920,1080,'https://i.vimeocdn.com/video/485601013_100x75.jpg',91,0,0,0,1421421356,1421421356),(19,0,17742629,'Fall','Some skateboarding from the last time i was in winona. and a couple shots from lacrosse.','https://vimeo.com/17742629',1280,720,'https://i.vimeocdn.com/video/110699623_100x75.jpg',94,0,0,0,1421421356,1421421356),(20,0,44813346,'Syracuse Lacrosse Documentary \"X\"','Syracuse Lacrosse Documentary \"X\"\nTakes you through the ten National Championships in school history, with a precursor for the 11th at the end.','https://vimeo.com/44813346',640,424,'https://i.vimeocdn.com/video/311404910_100x75.jpg',1101,0,0,0,1421421356,1421421356),(21,0,22137223,'ESPNU Lacrosse Hallmark ::National Television, CA','Credit List\n\n3d artists: Gene Arvan, Vinh Chung, Hao Cui, Kimberly Im, Andy Kim, Grace Lee, Yan Ng, Sal Rangel, Catherine Yoo\n3d teams leads: John Nguyen and Hai Ho.\nArt Directors: Brumby Boylston and Brian Won\nProducers: Rebecca Blankenship and Dina Chang','https://vimeo.com/22137223',1280,720,'https://i.vimeocdn.com/video/142862819_100x75.jpg',19,0,0,0,1421421356,1421421356),(22,0,17695280,'Riddell Lacrosse Commercial','Spec commercial for Riddell (or any company who wants it).  Enter the void of lacrosse.\n\n','https://vimeo.com/17695280',1280,720,'https://i.vimeocdn.com/video/110344167_100x75.jpg',37,0,0,0,1421421356,1421421356),(23,0,16666937,'Buick Lacrosse','2006\nDirected by Eric Coignoux\nFlame Artist : Stéphane Pivron\nMade in Mikros Image (www.mikrosimage.eu)','https://vimeo.com/16666937',1280,720,'https://i.vimeocdn.com/video/102421346_100x75.jpg',30,0,0,0,1421421356,1421421356),(24,0,23863608,'Maryland Trick Shot NCAA Tourney','This is the angle I got from the game.....pretty dag on sick..suprised I got it','https://vimeo.com/23863608',1280,720,'https://i.vimeocdn.com/video/155722444_100x75.jpg',18,0,0,0,1421421356,1421421356),(25,0,52423148,'Lacrosse:  Inventors - 100 Seeds','The LaCrosse Inventors series featured inventor Dorn Cox, the director of GreenStart and contributor to FarmHack.org.  He has designed and constructed systems for small-scale grain and oil seeds processing and biofuel production.\n\nDIRECTOR:  Dan Portrait\n\nDP: Greg Schmitt\n\nEDITOR: Jared Evans\n\nCreative  Director Lacrosse:  Haven Anderson\n\n Art Director: Adam Heathcott\nProducers: Jeff Harding, Nick Traeger  & Jamie Boyda\n\nEditor: Jared Evans\n\nColorist: Benji Brucker','https://vimeo.com/52423148',1280,720,'https://i.vimeocdn.com/video/361671882_100x75.jpg',196,0,0,0,1421421356,1421421356);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-17 22:01:58
