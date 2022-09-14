-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: music
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Album id',
  `artist_id` bigint NOT NULL DEFAULT '0' COMMENT 'Artist id',
  `release_date` date NOT NULL COMMENT 'Release date',
  `album_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Album name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `albums_album_name_artist_id_uindex` (`album_name`,`artist_id`),
  KEY `albums_artists_id_fk` (`artist_id`),
  CONSTRAINT `albums_artists_id_fk` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='albums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,1,'1998-07-01','The Rose'),(2,1,'1994-06-15','Coast to Coast'),(3,1,'1994-06-15','You Raise Me Up'),(4,4,'2022-03-04','Hello World'),(6,1,'2019-11-25','Spectrum'),(7,2,'2022-03-03','Attention');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Artist id',
  `artist_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Artist name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `artists_name_uindex` (`artist_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='artists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (4,'Alan Walker'),(3,'Justin Bieber'),(2,'U2'),(1,'Westlife');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Genre id',
  `genre_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Genres name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='genres';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'R & B'),(2,'Pop'),(3,'Rock'),(4,'Classical'),(5,'Jazz'),(6,'Folk'),(7,'Blues'),(8,'Country'),(9,'Soul'),(10,'Dance');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs`
--

DROP TABLE IF EXISTS `playlist_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_songs` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Playlist song id',
  `playlist_id` bigint NOT NULL DEFAULT '0' COMMENT 'Playlist id',
  `song_id` bigint NOT NULL DEFAULT '0' COMMENT 'Song id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `playlist_songs_playlist_id_song_id_uindex` (`playlist_id`,`song_id`),
  KEY `playlist_songs_songs_id_fk` (`song_id`),
  CONSTRAINT `playlist_songs_playlists_id_fk` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`),
  CONSTRAINT `playlist_songs_songs_id_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='playlist songs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs`
--

LOCK TABLES `playlist_songs` WRITE;
/*!40000 ALTER TABLE `playlist_songs` DISABLE KEYS */;
INSERT INTO `playlist_songs` VALUES (1,1,2),(9,1,3),(10,1,4),(11,1,6),(13,1,7),(12,1,8),(14,1,10),(18,2,5),(15,2,9),(16,2,11),(17,2,12),(19,3,3),(20,3,5),(21,3,7),(22,3,8),(23,3,9),(24,3,10),(25,3,11),(26,3,12),(27,4,2),(28,4,4),(29,4,5),(30,4,6),(31,4,8),(32,4,10),(33,5,1),(34,5,4),(35,5,7),(36,5,10),(37,5,12);
/*!40000 ALTER TABLE `playlist_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Playlist id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT 'User id',
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Title',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created date',
  PRIMARY KEY (`id`),
  UNIQUE KEY `playlists_user_id_title_uindex` (`user_id`,`title`),
  CONSTRAINT `playlists_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='playlists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,1,'Best songs','2022-01-25 02:50:38'),(2,1,'Favorite','2022-01-24 02:50:59'),(3,2,'Singles','2022-02-03 02:52:45'),(4,2,'Soul music','2021-07-25 02:48:05'),(5,3,'Happy music','2020-11-23 23:50:25');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Rating id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT 'User id',
  `rating_type` enum('album','song','playlist') COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Rating type',
  `target_id` bigint NOT NULL DEFAULT '0' COMMENT 'Rating target id',
  `score` tinyint unsigned NOT NULL DEFAULT '5' COMMENT 'Score: 1,2,3,4, or 5',
  `created_date` date NOT NULL COMMENT 'Created date',
  PRIMARY KEY (`id`),
  KEY `ratings_users_id_fk` (`user_id`),
  CONSTRAINT `ratings_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,'song',1,4,'2022-04-13'),(2,1,'playlist',2,4,'2022-04-10'),(3,1,'playlist',0,2,'2021-06-13'),(44,1,'album',1,5,'2020-06-11'),(45,1,'album',2,4,'2020-06-11'),(46,1,'album',3,3,'2020-06-11'),(47,1,'album',4,2,'2020-06-11'),(48,1,'album',6,4,'2020-06-11'),(49,1,'album',7,2,'2020-06-11'),(50,2,'album',1,5,'2020-06-11'),(51,2,'album',2,4,'2020-06-11'),(52,2,'album',3,3,'2020-06-11'),(53,2,'album',4,2,'2020-06-11'),(54,2,'album',6,4,'2020-06-11'),(55,2,'album',7,2,'2020-06-11'),(56,3,'album',1,4,'2020-06-11'),(57,3,'album',2,4,'2020-06-11'),(58,3,'album',3,3,'2020-06-11'),(59,3,'album',4,2,'2020-06-11'),(60,3,'album',6,4,'2020-06-11'),(61,3,'album',7,2,'2020-06-11'),(62,4,'album',1,5,'2020-06-11'),(63,4,'album',2,4,'2020-06-11'),(64,4,'album',3,3,'2020-06-11'),(65,4,'album',4,2,'2020-06-11'),(66,4,'album',6,4,'2020-06-11'),(67,4,'album',7,2,'2020-06-11'),(68,1,'song',6,5,'1989-05-11'),(69,1,'song',7,5,'1991-03-28'),(70,1,'song',8,4,'1989-05-11'),(71,1,'song',9,4,'1991-03-28'),(72,1,'song',10,4,'1989-05-11'),(73,1,'song',11,4,'1991-03-28'),(74,1,'song',12,5,'1989-05-11'),(75,1,'song',24,5,'1991-03-28'),(76,2,'song',6,3,'1989-05-11'),(77,2,'song',7,3,'1991-03-28'),(78,2,'song',8,3,'1989-05-11'),(79,2,'song',9,5,'1991-03-28'),(80,2,'song',10,5,'1991-03-28'),(81,2,'song',11,3,'1989-05-11'),(82,2,'song',12,3,'1989-05-11'),(83,2,'song',24,5,'1991-03-28'),(84,2,'song',25,5,'1989-05-11'),(85,3,'song',6,5,'1989-05-11'),(86,3,'song',7,2,'1989-05-11'),(87,3,'song',8,2,'1991-03-28'),(88,3,'song',9,2,'1991-03-28'),(89,3,'song',10,2,'1991-03-28'),(90,3,'song',11,5,'1991-03-28'),(91,3,'song',12,4,'1989-05-11'),(92,4,'song',6,4,'1991-03-28'),(93,4,'song',7,4,'1989-05-11'),(94,4,'song',8,5,'1989-05-11'),(95,4,'song',9,5,'1991-03-28'),(96,4,'song',10,5,'1989-05-11'),(97,4,'song',11,4,'1991-03-28'),(98,4,'song',12,4,'1989-05-11'),(99,4,'song',24,5,'1991-03-28');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_genres`
--

DROP TABLE IF EXISTS `song_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_genres` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Song genre id',
  `song_id` bigint NOT NULL DEFAULT '0' COMMENT 'Song id',
  `genre_id` int NOT NULL DEFAULT '0' COMMENT 'Genre id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `song_genres_song_id_genre_id_uindex` (`song_id`,`genre_id`),
  KEY `song_genres_genres_id_fk` (`genre_id`),
  CONSTRAINT `song_genres_genres_id_fk` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `song_genres_songs_id_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='song genres';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_genres`
--

LOCK TABLES `song_genres` WRITE;
/*!40000 ALTER TABLE `song_genres` DISABLE KEYS */;
INSERT INTO `song_genres` VALUES (2,1,1),(4,1,2),(6,2,1),(14,2,2),(15,2,3),(16,3,4),(18,4,2),(19,4,4),(17,4,5),(20,5,1),(21,5,3),(27,5,4),(25,5,5),(28,5,6),(26,5,8),(33,6,2),(32,6,4),(29,6,6),(30,6,7),(31,6,8),(39,7,4),(34,7,5),(35,7,6),(36,7,7),(37,7,9),(38,7,10),(40,8,6),(41,9,6),(42,10,4),(43,11,7),(44,12,8),(45,24,8),(46,25,8),(47,26,9);
/*!40000 ALTER TABLE `song_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Song id',
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Song title',
  `artist_id` bigint NOT NULL DEFAULT '0' COMMENT 'Artist id',
  `album_id` bigint DEFAULT NULL COMMENT 'Album id',
  `release_date` date NOT NULL COMMENT 'Release date',
  PRIMARY KEY (`id`),
  UNIQUE KEY `songs_title_artist_id_uindex` (`title`,`artist_id`),
  KEY `songs_albums_id_fk` (`album_id`),
  KEY `songs_artists_id_fk` (`artist_id`),
  CONSTRAINT `songs_albums_id_fk` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`),
  CONSTRAINT `songs_artists_id_fk` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='songs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'PS5',4,NULL,'1992-10-01'),(2,'Hello My Love',1,6,'2019-11-25'),(3,'Better Man ',1,6,'2018-11-08'),(4,'My Blood',1,6,'2019-11-25'),(5,'Dynamite',1,6,'2019-11-25'),(6,'Dance',1,6,'1994-06-10'),(7,'One Last Time',1,6,'2019-11-25'),(8,'Take Me There',1,6,'2019-11-25'),(9,'Repair',1,6,'1994-06-10'),(10,'Without You',1,6,'2019-11-25'),(11,'L.O.V.E.',1,6,'2019-11-13'),(12,'Another Life',1,6,'1990-11-02'),(24,'Tonight',1,NULL,'2020-05-13'),(25,'Hello world',4,4,'1991-06-01'),(26,'Attention',3,7,'2022-03-03');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'User id',
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Username',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Eric'),(2,'Penny'),(1,'Roy'),(4,'Tom');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 14:30:35
