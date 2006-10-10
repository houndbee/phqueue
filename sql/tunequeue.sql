-- phpMyAdmin SQL Dump
-- version 2.8.0.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Oct 10, 2006 at 05:59 PM
-- Server version: 5.0.18
-- PHP Version: 5.1.4
-- 
-- Database: `tunequeue`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `actualsched`
-- 

CREATE TABLE `actualsched` (
  `ID` int(11) NOT NULL auto_increment,
  `showid` int(11) NOT NULL,
  `starttime` int(11) NOT NULL,
  `timest` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `channelid` int(11) default NULL,
  `scheddate` date NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

-- 
-- Dumping data for table `actualsched`
-- 

INSERT INTO `actualsched` (`ID`, `showid`, `starttime`, `timest`, `channelid`, `scheddate`) VALUES (36, 45, 22, '2006-10-09 22:10:42', NULL, '2006-10-09'),
(37, 46, 0, '2006-10-09 22:10:42', NULL, '2006-10-09'),
(38, 47, 2, '2006-10-09 22:10:42', NULL, '2006-10-09'),
(39, 47, 6, '2006-10-09 22:10:42', NULL, '2006-10-09'),
(40, 45, 8, '2006-10-09 22:10:42', NULL, '2006-10-09'),
(41, 45, 22, '2006-10-09 23:31:17', NULL, '2006-10-10'),
(42, 46, 0, '2006-10-09 23:31:17', NULL, '2006-10-10'),
(43, 47, 2, '2006-10-09 23:31:17', NULL, '2006-10-10'),
(44, 46, 6, '2006-10-09 23:31:17', NULL, '2006-10-10'),
(45, 45, 8, '2006-10-09 23:31:17', NULL, '2006-10-10');

-- --------------------------------------------------------

-- 
-- Table structure for table `archivedtunes`
-- 

CREATE TABLE `archivedtunes` (
  `ID` int(11) NOT NULL auto_increment,
  `tuneid` int(11) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `archivedtunes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `artist`
-- 

CREATE TABLE `artist` (
  `ID` int(11) NOT NULL auto_increment,
  `name` varchar(1024) NOT NULL,
  `bandmembers` varchar(1024) default NULL,
  `picture` varchar(255) default NULL,
  `location` varchar(255) default NULL,
  `intro` varchar(255) default NULL,
  `website` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=464 ;

-- 
-- Dumping data for table `artist`
-- 

INSERT INTO `artist` (`ID`, `name`, `bandmembers`, `picture`, `location`, `intro`, `website`) VALUES (419, 'Zero', NULL, NULL, NULL, NULL, NULL),
(420, 'Medicis', NULL, NULL, NULL, NULL, NULL),
(421, 'Asura', NULL, NULL, NULL, NULL, NULL),
(422, 'Phenom', NULL, NULL, NULL, NULL, NULL),
(423, 'RadioVerve', NULL, NULL, NULL, NULL, NULL),
(424, 'NGC992', NULL, NULL, NULL, NULL, NULL),
(425, 'Soulmate', NULL, NULL, NULL, NULL, NULL),
(426, 'Thermal and a Quarter', NULL, NULL, NULL, NULL, NULL),
(427, 'Orange Street', NULL, NULL, NULL, NULL, NULL),
(428, 'Zebediah Plush', NULL, NULL, NULL, NULL, NULL),
(429, 'Parikrama', NULL, NULL, NULL, NULL, NULL),
(430, 'Shrapnel', NULL, NULL, NULL, NULL, NULL),
(431, 'Indus Creed', NULL, NULL, NULL, NULL, NULL),
(432, 'Liquid Groove', NULL, NULL, NULL, NULL, NULL),
(433, 'Envision', NULL, NULL, NULL, NULL, NULL),
(434, 'Pentagram', NULL, NULL, NULL, NULL, NULL),
(435, 'Vinapra', NULL, NULL, NULL, NULL, NULL),
(436, 'Strange Brew', NULL, NULL, NULL, NULL, NULL),
(437, 'Pin Drop Violence', NULL, NULL, NULL, NULL, NULL),
(438, 'Medusa', NULL, NULL, NULL, NULL, NULL),
(439, 'Shoestring', NULL, NULL, NULL, NULL, NULL),
(440, 'NGC 992', NULL, NULL, NULL, NULL, NULL),
(441, 'Shoutcast', NULL, NULL, NULL, NULL, NULL),
(442, 'Bhoomi', NULL, NULL, NULL, NULL, NULL),
(443, 'Indian Ocean', NULL, NULL, NULL, NULL, NULL),
(444, 'Motherjane', NULL, NULL, NULL, NULL, NULL),
(445, 'Aatma', NULL, NULL, NULL, NULL, NULL),
(446, 'p a r i k r a m a', NULL, NULL, NULL, NULL, NULL),
(447, 'MyndSnare', NULL, NULL, NULL, NULL, NULL),
(448, 'Kryptos', NULL, NULL, NULL, NULL, NULL),
(449, 'Cognac', NULL, NULL, NULL, NULL, NULL),
(450, 'Something Relevant', NULL, NULL, NULL, NULL, NULL),
(451, 'Them Clones', NULL, NULL, NULL, NULL, NULL),
(452, 'Bhayanak Maut', NULL, NULL, NULL, NULL, NULL),
(453, 'Skinny Alley', NULL, NULL, NULL, NULL, NULL),
(454, 'Threinody', NULL, NULL, NULL, NULL, NULL),
(455, 'Halfway Through...', NULL, NULL, NULL, NULL, NULL),
(456, 'Demonic Resurrection', NULL, NULL, NULL, NULL, NULL),
(457, 'Usha Uthup &amp; Parikrama', NULL, NULL, NULL, NULL, NULL),
(458, 'a clockwork orange', NULL, NULL, NULL, NULL, NULL),
(459, 'Beatles', NULL, NULL, NULL, NULL, NULL),
(460, 'Colourblind', NULL, NULL, NULL, NULL, NULL),
(461, 'Bombay Black', NULL, NULL, NULL, NULL, NULL),
(462, '13 AD', NULL, NULL, NULL, NULL, NULL),
(463, 'Bhumi', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `channels`
-- 

CREATE TABLE `channels` (
  `ID` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `enabled` tinyint(4) NOT NULL default '0',
  `admin` varchar(30) character set latin1 collate latin1_bin default NULL,
  `password` varchar(30) character set latin1 collate latin1_bin default NULL,
  `ad_freq` tinyint(4) NOT NULL default '0',
  `defaultplaylist` int(11) NOT NULL default '0',
  `incomingpath` varchar(255) character set latin1 collate latin1_bin default NULL,
  `defaultalg` int(11) NOT NULL default '1',
  `url` varchar(255) character set latin1 collate latin1_bin default NULL,
  `maxschedule` int(11) NOT NULL default '5',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `channels`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `channeltunes`
-- 

CREATE TABLE `channeltunes` (
  `ID` int(11) NOT NULL auto_increment,
  `lastplayed` datetime default '0000-00-00 00:00:00',
  `added` datetime default NULL,
  `totalplays` int(11) NOT NULL default '0',
  `disabled` tinyint(4) NOT NULL default '0',
  `requests` int(11) NOT NULL default '0',
  `cancels` int(11) NOT NULL default '0',
  `tuneid` int(11) default NULL,
  `randomplay` tinyint(4) NOT NULL default '1',
  `channelid` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `channeltunes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `chat`
-- 

CREATE TABLE `chat` (
  `ID` int(11) NOT NULL auto_increment,
  `ip` varchar(16) default NULL,
  `time` datetime default NULL,
  `name` varchar(30) default NULL,
  `text` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `chat`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `freetagged_objects`
-- 

CREATE TABLE `freetagged_objects` (
  `tag_id` int(10) unsigned NOT NULL default '0',
  `tagger_id` int(10) unsigned NOT NULL default '0',
  `object_id` int(10) unsigned NOT NULL default '0',
  `tagged_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tag_id`,`tagger_id`,`object_id`),
  KEY `tag_id_index` (`tag_id`),
  KEY `tagger_id_index` (`tagger_id`),
  KEY `object_id_index` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `freetagged_objects`
-- 

INSERT INTO `freetagged_objects` (`tag_id`, `tagger_id`, `object_id`, `tagged_on`) VALUES (1, 4, 28, '2006-09-26 14:03:08'),
(2, 4, 28, '2006-09-26 14:03:08'),
(10, 1, 33, '2006-10-01 21:23:37'),
(9, 1, 31, '2006-09-26 19:53:33'),
(8, 1, 31, '2006-09-26 19:53:33'),
(7, 1, 31, '2006-09-26 19:53:33'),
(11, 1, 34, '2006-10-01 21:23:56'),
(12, 1, 35, '2006-10-01 21:25:12'),
(13, 1, 35, '2006-10-01 21:25:13'),
(14, 1, 35, '2006-10-01 21:25:13'),
(15, 1, 36, '2006-10-01 21:26:14'),
(16, 1, 36, '2006-10-01 21:26:14'),
(17, 1, 36, '2006-10-01 21:26:14'),
(18, 1, 36, '2006-10-01 21:26:14'),
(19, 1, 37, '2006-10-01 21:26:26'),
(20, 1, 38, '2006-10-01 21:26:34'),
(21, 1, 39, '2006-10-01 21:26:42'),
(22, 1, 40, '2006-10-01 21:26:49'),
(23, 1, 41, '2006-10-01 21:26:57'),
(24, 1, 42, '2006-10-01 21:27:08'),
(25, 1, 55, '2006-10-01 21:58:32'),
(26, 1, 55, '2006-10-01 21:58:32'),
(27, 1, 55, '2006-10-01 21:58:32'),
(28, 1, 56, '2006-10-01 21:59:54'),
(29, 1, 57, '2006-10-01 22:00:14'),
(14, 1, 2258, '2006-10-06 15:11:48'),
(13, 1, 2258, '2006-10-06 15:11:48'),
(13, 1, 2204, '2006-10-06 15:18:19'),
(14, 1, 2204, '2006-10-06 15:18:19'),
(30, 1, 2204, '2006-10-06 15:18:19'),
(31, 1, 2204, '2006-10-06 15:18:19'),
(32, 1, 2526, '2006-10-09 21:18:24'),
(33, 1, 2526, '2006-10-09 21:18:24');

-- --------------------------------------------------------

-- 
-- Table structure for table `freetags`
-- 

CREATE TABLE `freetags` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tag` varchar(30) NOT NULL default '',
  `raw_tag` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

-- 
-- Dumping data for table `freetags`
-- 

INSERT INTO `freetags` (`id`, `tag`, `raw_tag`) VALUES (1, 'ww', 'ww'),
(2, 'www', 'www'),
(3, 'so', 'so'),
(4, 'move', 'move'),
(5, 'on', 'on'),
(6, 'time', 'time'),
(7, 'swww', 'swww'),
(8, 'aaa', 'aaa'),
(9, 'bbb', 'bbb'),
(10, 'to', 'to'),
(11, '555', '555'),
(12, 'accoustic', 'accoustic'),
(13, 'progressive', 'progressive'),
(14, 'rock', 'rock'),
(15, 'laxmi', 'laxmi'),
(16, 'hot', 'hot'),
(17, 'singer', 'singer'),
(18, 'pianist', 'pianist'),
(19, '5', '5'),
(20, '6', '6'),
(21, '7', '7'),
(22, '8', '8'),
(23, '9', '9'),
(24, '10', '10'),
(25, 'nice', 'nice'),
(26, 'funny', 'funny'),
(27, 'stuff', 'stuff'),
(28, 'promo1', 'promo1'),
(29, 'promo2', 'promo2'),
(30, 'vague', 'vague'),
(31, 'lyrics', 'lyrics'),
(32, 'cognac', 'Cognac'),
(33, 'oceans', 'Oceans');

-- --------------------------------------------------------

-- 
-- Table structure for table `listeners`
-- 

CREATE TABLE `listeners` (
  `id` int(11) NOT NULL auto_increment,
  `ip` varchar(255) default NULL,
  `channelid` int(11) default NULL,
  `start` datetime NOT NULL default '0000-00-00 00:00:00',
  `end` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` varchar(30) character set latin1 collate latin1_bin default NULL,
  `start_song` int(11) default NULL,
  `end_song` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `listeners`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `masterschedule`
-- 

CREATE TABLE `masterschedule` (
  `ID` int(11) NOT NULL auto_increment,
  `showid` int(11) NOT NULL default '-1',
  `starttime` int(11) NOT NULL,
  `channelid` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- 
-- Dumping data for table `masterschedule`
-- 

INSERT INTO `masterschedule` (`ID`, `showid`, `starttime`, `channelid`) VALUES (30, 45, 22, NULL),
(31, 46, 0, NULL),
(32, 47, 2, NULL),
(33, -1, 6, NULL),
(34, -1, 8, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `news`
-- 

CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `date` date default NULL,
  `author` varchar(40) default NULL,
  `text` mediumtext,
  `title` varchar(255) character set latin1 collate latin1_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `news`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `playlists`
-- 

CREATE TABLE `playlists` (
  `ID` int(11) NOT NULL auto_increment,
  `ShowID` int(11) default NULL,
  `TuneID` int(11) default NULL,
  `seq` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `playlists`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `producer`
-- 

CREATE TABLE `producer` (
  `ID` int(11) NOT NULL auto_increment,
  `tuneid` int(11) NOT NULL,
  `curstatus` int(11) NOT NULL,
  `showid` int(11) NOT NULL default '-1',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=405 ;

-- 
-- Dumping data for table `producer`
-- 

INSERT INTO `producer` (`ID`, `tuneid`, `curstatus`, `showid`) VALUES (395, 2772, -1, -1),
(396, 2665, -1, -1),
(397, 2817, -1, -1),
(398, 2707, -1, -1),
(399, 2685, -1, -1),
(400, 2770, 0, -1),
(401, 2700, 1, -1),
(402, 2798, 1, -1),
(403, 2694, 1, -1),
(404, 2686, 1, -1);

-- --------------------------------------------------------

-- 
-- Table structure for table `promos`
-- 

CREATE TABLE `promos` (
  `ID` int(11) NOT NULL auto_increment,
  `filename` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `promos`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `schedule`
-- 

CREATE TABLE `schedule` (
  `ID` int(11) NOT NULL auto_increment,
  `channelid` int(11) default NULL,
  `showid` int(11) NOT NULL default '-1',
  `starttime` int(11) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `schedule`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `shows`
-- 

CREATE TABLE `shows` (
  `ID` int(11) NOT NULL auto_increment,
  `showname` varchar(255) character set latin1 collate latin1_bin default NULL,
  `showdesc` varchar(255) character set latin1 collate latin1_bin default NULL,
  `logoimg` varchar(255) character set latin1 collate latin1_bin default NULL,
  `channelid` int(11) default NULL,
  `show_dir` varchar(1024) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

-- 
-- Dumping data for table `shows`
-- 

INSERT INTO `shows` (`ID`, `showname`, `showdesc`, `logoimg`, `channelid`, `show_dir`) VALUES (45, 0x53686f772031, 0x53686f772031206974206973, 0x73686f776c6f676f2e706e67, NULL, '/usr/local/phqueue/shows/1'),
(46, 0x53686f77203130, 0x53486f77206e756d626572203130, 0x73686f776c6f676f2e706e67, NULL, '/usr/local/phqueue/shows/10'),
(47, 0x32, 0x5468697320697320746865207365636f6e642073686f77, 0x73686f776c6f676f2e706e67, NULL, '/usr/local/phqueue/shows/2');

-- --------------------------------------------------------

-- 
-- Table structure for table `status`
-- 

CREATE TABLE `status` (
  `ID` int(11) NOT NULL default '0',
  `tune_id` int(11) default NULL,
  `show_id` int(11) default NULL,
  `req` tinyint(4) default NULL,
  `tunes_since_ad` tinyint(4) NOT NULL default '0',
  `songlength` float(10,2) default NULL,
  `started_at` datetime default NULL,
  `seq` int(11) default NULL,
  `actshow_id` int(11) NOT NULL default '-1',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `status`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tunelogging`
-- 

CREATE TABLE `tunelogging` (
  `ID` int(11) NOT NULL auto_increment,
  `datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `tuneid` int(11) NOT NULL default '0',
  `channelid` int(11) NOT NULL default '1',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tunelogging`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tuneratings`
-- 

CREATE TABLE `tuneratings` (
  `id` int(11) NOT NULL auto_increment,
  `tuneid` int(11) default NULL,
  `voteip` char(16) default NULL,
  `rating` int(11) default NULL,
  `time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tuneratings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tunes`
-- 

CREATE TABLE `tunes` (
  `ID` int(11) NOT NULL auto_increment,
  `lastplayed` timestamp NULL default NULL,
  `disabled` tinyint(4) NOT NULL default '0',
  `artistid` int(11) default '0',
  `album` varchar(255) character set latin1 collate latin1_bin default NULL,
  `title` varchar(255) character set latin1 collate latin1_bin default NULL,
  `time` float(12,5) default NULL,
  `showid` int(11) default NULL,
  `pos` int(11) default '0',
  `type` int(11) NOT NULL,
  `fullpath` varchar(1024) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2841 ;

-- 
-- Dumping data for table `tunes`
-- 

INSERT INTO `tunes` (`ID`, `lastplayed`, `disabled`, `artistid`, `album`, `title`, `time`, `showid`, `pos`, `type`, `fullpath`) VALUES (2429, '2006-10-10 16:31:29', 0, 0, 0x496e66696e69747920526164696f, 0x50726f6d6f3a436f6e74616374205573, 19.93144, 45, 1, 0, '/usr/local/phqueue/shows/1/contact_us.mp3'),
(2428, NULL, 0, 429, 0x496e66696e69747920526164696f, 0x576869736b657920426c756573, 349.04819, 45, 2, 0, '/usr/local/phqueue/shows/1/whiskey_blues.mp3'),
(2425, NULL, 0, 427, 0x496e66696e69747920526164696f, 0x43616e647977616c6b, 371.14774, 45, 3, 0, '/usr/local/phqueue/shows/1/candywalk.mp3'),
(2426, '2006-10-10 16:26:29', 0, 0, 0x496e66696e69747920526164696f, 0x50726f6d6f3a5275647261, 8.69875, 45, 4, 0, '/usr/local/phqueue/shows/1/rudra_ad.mp3'),
(2427, NULL, 0, 428, 0x496e66696e69747920526164696f, 0x41747461636b206f6620746865204b696c6c657220427574746572666c696573, 359.91513, 45, 5, 0, '/usr/local/phqueue/shows/1/attack_of_the_killer_butterflies.mp3'),
(2424, '2006-10-10 16:29:29', 0, 423, '', 0x57696e64646f776e202d2053687265796173, 23.79756, 45, 6, 0, '/usr/local/phqueue/shows/1/winddown.mp3'),
(2423, NULL, 0, 426, 0x496e66696e69747920526164696f, 0x53756e736574204d616e, 255.37306, 45, 7, 0, '/usr/local/phqueue/shows/1/sunset_man.mp3'),
(2422, NULL, 0, 425, 0x496e66696e69747920526164696f, 0x546865205072696365, 197.85144, 45, 8, 0, '/usr/local/phqueue/shows/1/the_price.mp3'),
(2421, NULL, 0, 424, 0x496e66696e69747920526164696f, 0x3131746820446179206f662053657074656d626572, 155.01064, 45, 9, 0, '/usr/local/phqueue/shows/1/11th_day_of_september.mp3'),
(2419, '2006-10-10 16:29:29', 0, 0, 0x496e66696e69747920526164696f, 0x50726f6d6f3a53686f7574626f78, 19.51350, 45, 10, 0, '/usr/local/phqueue/shows/1/shoutbox.mp3'),
(2420, '2006-10-10 16:28:29', 0, 423, '', 0x496e74726f3a416469746920616e642053687265796173, 24.73794, 45, 11, 0, '/usr/local/phqueue/shows/1/00-intro-aditi-shreyas.mp3'),
(2417, NULL, 0, 421, 0x496e66696e69747920526164696f, 0x4c61746572616c20446976696e697479, 197.95593, 45, 12, 0, '/usr/local/phqueue/shows/1/lateral_divinity.mp3'),
(2418, NULL, 0, 422, 0x496e66696e69747920526164696f, 0x41204c6974746c652053746570, 347.37631, 45, 13, 0, '/usr/local/phqueue/shows/1/little_step.mp3'),
(2416, NULL, 0, 420, 0x496e66696e69747920526164696f, 0x496e20746865205368616465, 273.76324, 45, 14, 0, '/usr/local/phqueue/shows/1/in_the_shade.mp3'),
(2415, NULL, 0, 419, '', 0x4368726973746d617320696e204a756c79, 257.93307, 45, 15, 0, '/usr/local/phqueue/shows/1/01-christmas_in_july.mp3'),
(2807, NULL, 0, 440, 0x46726f6d20466172204265796f6e64, 0x537461676e6174696e672054696d65, 302.70694, -1, -1, 0, '/usr/local/phqueue/randomizer/NGC992_StagnatingTime-StudioCopy.mp3'),
(2806, NULL, 0, 425, 0x5368696c6c6f6e67, 0x4920416d, 275.06943, -1, -1, 0, '/usr/local/phqueue/randomizer/04 I Am.mp3'),
(2805, NULL, 0, 439, 0x5a6169747a204661726d20526f6164, 0x4c6f6e67204c6f6e672054696d65, 283.03674, -1, -1, 0, '/usr/local/phqueue/randomizer/05 Long Long Time.mp3'),
(2804, NULL, 0, 454, 0x4c69766520617420414d4320436f6c6c656765, 0x426c696e64204c656164696e672074686520426c696e6420284c69766529, 270.70688, -1, -1, 0, '/usr/local/phqueue/randomizer/02-02 _ Blind Leading the Blind.mp3'),
(2803, NULL, 0, 434, 0x5570, 0x4472697665, 295.13141, -1, -1, 0, '/usr/local/phqueue/randomizer/Drive.mp3'),
(2802, NULL, 0, 428, 0x41667465726c6175676873, 0x41205461737465206f662048726f7468676172, 347.76819, -1, -1, 0, '/usr/local/phqueue/randomizer/09 A Taste of Hrothgar.mp3'),
(2801, NULL, 0, 429, '', 0x4c6f6164205570, 262.00015, -1, -1, 0, '/usr/local/phqueue/randomizer/LoadUp.mp3'),
(2800, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x5261636520546f204f626c6976696f6e, 348.18613, -1, -1, 0, '/usr/local/phqueue/randomizer/02 Race To Oblivion.mp3'),
(2799, NULL, 0, 453, 0x4573636170652074686520526f6172, 0x46656e6365, 213.00244, -1, -1, 0, '/usr/local/phqueue/randomizer/Skinny Alley - Fence.mp3'),
(2798, '2006-10-10 17:48:26', 0, 431, '', 0x54726170706564, 227.65714, -1, -1, 0, '/usr/local/phqueue/randomizer/01 _ Trapped.mp3'),
(2797, NULL, 0, 435, '', 0x4775727520427261686d61, 288.87674, -1, -1, 0, '/usr/local/phqueue/randomizer/01 Guru_Brahma.mp3'),
(2796, NULL, 0, 438, 0x537572766976616c204f6666205468652046697474657374, 0x496e657274, 237.06120, -1, -1, 0, '/usr/local/phqueue/randomizer/Medusa - Survival Off The Fittest - 02 - Inert.mp3'),
(2795, NULL, 0, 448, 0x53706972616c20417363656e74, 0x44657363656e73696f6e, 431.33386, -1, -1, 0, '/usr/local/phqueue/randomizer/Kryptos - Descension.mp3'),
(2794, NULL, 0, 439, 0x5a6169747a204661726d20526f6164, 0x54686520526f636b204e20526f6c6c20576179, 233.11674, -1, -1, 0, '/usr/local/phqueue/randomizer/03 The Rock N Roll Way.mp3'),
(2793, NULL, 0, 432, '', 0x5361696c696e67204f6e, 341.65549, -1, -1, 0, '/usr/local/phqueue/randomizer/SAILON_MP3.MP3'),
(2791, NULL, 0, 431, '', 0x506c6179, 254.27594, -1, -1, 0, '/usr/local/phqueue/randomizer/09 _ Play.mp3'),
(2792, NULL, 0, 459, 0x5743425320546f7020353030204f6c6469657320286469736320313029, 0x4120486172642044617973204e69676874, 149.10693, -1, -1, 0, '/usr/local/phqueue/randomizer/HardDaysNight.mp3'),
(2790, NULL, 0, 422, 0x556e626f756e64, 0x4341502035313031, 319.71265, -1, -1, 0, '/usr/local/phqueue/randomizer/phenom-unbound-01-cap_5101.mp3'),
(2788, NULL, 0, 431, '', 0x437279, 232.01956, -1, -1, 0, '/usr/local/phqueue/randomizer/07 _ Cry.mp3'),
(2789, NULL, 0, 425, 0x5368696c6c6f6e67, 0x546865205072696365, 205.06125, -1, -1, 0, '/usr/local/phqueue/randomizer/02 The Price.mp3'),
(2787, NULL, 0, 439, 0x5a6169747a204661726d20526f6164, 0x43616e646c6573204f6e2043616b65, 108.64331, -1, -1, 0, '/usr/local/phqueue/randomizer/08 Candles On Cake.mp3'),
(2786, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x5768656e20446f7562742054616b6573204f766572, 422.34781, -1, -1, 0, '/usr/local/phqueue/randomizer/09 When Doubt Takes Over.mp3'),
(2785, NULL, 0, 442, '', 0x5665727469676f, 316.76080, -1, -1, 0, '/usr/local/phqueue/randomizer/bhoomi+vertigo.mp3'),
(2784, NULL, 0, 422, 0x556e626f756e64, 0x556e626f756e64, 307.77469, -1, -1, 0, '/usr/local/phqueue/randomizer/phenom-unbound-05-unbound.mp3'),
(2783, NULL, 0, 419, 0x486f6f6b, 0x4368726973746d617320496e204a756c79, 259.47430, -1, -1, 0, '/usr/local/phqueue/randomizer/Zero - christmas in july.mp3'),
(2782, NULL, 0, 425, 0x5368696c6c6f6e67, 0x496620596f752057657265204d7920477569746172, 529.08411, -1, -1, 0, '/usr/local/phqueue/randomizer/03 If You Were My Guitar.mp3'),
(2781, NULL, 0, 420, 0x496e20546865205368616465, 0x496e20546865205368616465, 250.09633, -1, -1, 0, '/usr/local/phqueue/randomizer/Medicis - In The Shade.mp3'),
(2780, NULL, 0, 448, 0x53706972616c20417363656e74, 0x436c616e64657374696e6520456c656d656e74, 313.44324, -1, -1, 0, '/usr/local/phqueue/randomizer/Kryptos - Clandestine Element.mp3'),
(2779, NULL, 0, 427, '', 0x4d6f726579205069796161, 355.26532, -1, -1, 0, '/usr/local/phqueue/randomizer/morey_piyaa.mp3'),
(2778, NULL, 0, 431, '', 0x43656c6962617465, 288.99261, -1, -1, 0, '/usr/local/phqueue/randomizer/08 _ Celibate.mp3'),
(2776, NULL, 0, 434, 0x5570, 0x54656e, 250.87421, -1, -1, 0, '/usr/local/phqueue/randomizer/Ten.mp3'),
(2777, '2006-10-10 17:28:50', 0, 431, '', 0x426f776c206f66206d61646e657373, 74.73125, -1, -1, 0, '/usr/local/phqueue/randomizer/02 _ Bowl of madness.mp3'),
(2775, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x4a75737420416e6f74686572204c6965, 334.07999, -1, -1, 0, '/usr/local/phqueue/randomizer/08 Just Another Lie.mp3'),
(2774, NULL, 0, 453, 0x4573636170652054686520526f6172, 0x5573656420546f204265204d696e65, 194.03757, -1, -1, 0, '/usr/local/phqueue/randomizer/Skinny Alley - Used To Be Mine.mp3'),
(2773, NULL, 0, 435, '', 0x41616e6b686f6e204d65696e, 226.68256, -1, -1, 0, '/usr/local/phqueue/randomizer/0002-Vinapra-Aankhon Mein.mp3'),
(2772, '2006-10-10 17:36:25', 0, 448, 0x53706972616c20417363656e74, 0x466f7273616b656e, 364.69547, -1, -1, 0, '/usr/local/phqueue/randomizer/Kryptos - Forsaken.mp3'),
(2771, NULL, 0, 426, 0x506c616e2042, 0x43796e6963616c20576f726c64, 352.44409, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Cynical World - Plan B.mp3'),
(2770, '2006-10-10 17:43:26', 0, 426, '', 0x4a7570697465722043616665, 589.53143, -1, -1, 0, '/usr/local/phqueue/randomizer/JupiterCafe.mp3'),
(2769, NULL, 0, 444, 0x496e73616e652042696f677261706879, 0x536f756c20436f72706f726174696f6e73, 339.54126, -1, -1, 0, '/usr/local/phqueue/randomizer/Motherjane - Soul Corporations.mp3'),
(2768, NULL, 0, 427, 0x43616e647977616c6b, 0x63616e647977616c6b2e6d7033, 359.49716, -1, -1, 0, '/usr/local/phqueue/randomizer/candywalk.mp3'),
(2767, NULL, 0, 0, '', 0x424854202d204461776e204f662041204e657720457261, 188.55183, -1, -1, 0, '/usr/local/phqueue/randomizer/BlackHole Theory - Dawn Of A New Era.MP3'),
(2766, NULL, 0, 458, 0x64656d6f, 0x6d6f7665206f6e, 176.56163, -1, -1, 0, '/usr/local/phqueue/randomizer/01 - a clockwork orange - move on - demo.MP3'),
(2765, NULL, 0, 425, 0x5368696c6c6f6e67, 0x53742e2056616c656e74696e6527732044617920426c756573, 214.56981, -1, -1, 0, '/usr/local/phqueue/randomizer/07 St. Valentine''s Day Blues.mp3'),
(2764, NULL, 0, 420, 0x496e20546865205368616465, 0x446973747572626564, 213.23755, -1, -1, 0, '/usr/local/phqueue/randomizer/Medicis - Disturbed.mp3'),
(2763, NULL, 0, 428, 0x41667465726c6175676873, 0x456c6173746963204d616e, 274.39026, -1, -1, 0, '/usr/local/phqueue/randomizer/08 Elastic Man.mp3'),
(2762, NULL, 0, 0, '', 0x424854202d2054656e646f6e7320536570617261746564, 166.87016, -1, -1, 0, '/usr/local/phqueue/randomizer/BlackHole Theory - Tendons Separated.MP3'),
(2761, NULL, 0, 422, 0x5068656e6f6d204c69766520417420526164696f2043697479202832362d, 0x556e626f756e6420284c69766529, 340.16653, -1, -1, 0, '/usr/local/phqueue/randomizer/phenom-phenom_live_at_radio_city_26feb2005-10-unbound_phenom.mp3'),
(2760, NULL, 0, 425, 0x5368696c6c6f6e67, 0x446f20596f75, 252.42125, -1, -1, 0, '/usr/local/phqueue/randomizer/06 Do You.mp3'),
(2759, NULL, 0, 435, 0x417368612057616c692044686f6f70, 0x446861727469, 366.80362, -1, -1, 0, '/usr/local/phqueue/randomizer/02 Dharti.mp3'),
(2758, NULL, 0, 438, 0x537572766976616c204f6666205468652046697474657374, 0x43726f70, 307.72247, -1, -1, 0, '/usr/local/phqueue/randomizer/Medusa - Survival Off The Fittest - 03 - Crop.mp3'),
(2757, NULL, 0, 431, '', 0x507265747479206368696c64, 273.60651, -1, -1, 0, '/usr/local/phqueue/randomizer/07 _ Pretty child.mp3'),
(2756, NULL, 0, 451, '', 0x496e20546865204e616d65204f6620476f64, 282.66699, -1, -1, 0, '/usr/local/phqueue/randomizer/In the Name of God  --  Them Clones.mp3'),
(2755, NULL, 0, 428, 0x41667465726c6175676873, 0x57656174686572204769726c, 281.96576, -1, -1, 0, '/usr/local/phqueue/randomizer/04 Weather Girl.mp3'),
(2754, NULL, 0, 429, '', 0x4f70656e20536b696573, 345.66370, -1, -1, 0, '/usr/local/phqueue/randomizer/OpenSkies.mp3'),
(2753, NULL, 0, 426, 0x506c616e2042, 0x496e7465726d697373696f6e, 372.03589, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Intermission - Plan B.mp3'),
(2752, NULL, 0, 452, '', 0x454c43495420534554204e4f495320524f54, 304.92737, -1, -1, 0, '/usr/local/phqueue/randomizer/elcit_set_nois_rot.mp3'),
(2751, '2006-10-10 17:29:50', 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x496e74726f7370656374697665205175657374, 74.39675, -1, -1, 0, '/usr/local/phqueue/randomizer/01 Introspective Quest.mp3'),
(2750, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x496e74656c6c65637475616c2050757273756974, 400.09143, -1, -1, 0, '/usr/local/phqueue/randomizer/05 Intellectual Pursuit.mp3'),
(2749, NULL, 0, 457, 0x4348414e4e454c2056204a414d4d494e27, 0x52687974686d20416e6420426c756573, 261.76801, -1, -1, 0, '/usr/local/phqueue/randomizer/RnB64.mp3'),
(2748, NULL, 0, 437, 0x436f6d706f73652e2e2e204f70706f73652e2e2e20446973706f7365, 0x4775747465726d656e74, 228.17957, -1, -1, 0, '/usr/local/phqueue/randomizer/Pin Drop Violence - Gutterment.mp3'),
(2747, NULL, 0, 419, 0x486f6f6b, 0x4e6f74204d79204b696e6461204769726c, 241.16245, -1, -1, 0, '/usr/local/phqueue/randomizer/Zero - Not My Kinda Girl.mp3'),
(2746, NULL, 0, 456, '', 0x46726f7a656e20506f727472616974, 423.70609, -1, -1, 0, '/usr/local/phqueue/randomizer/03-Demonic Resurrection _ Frozen Portrait.mp3'),
(2745, NULL, 0, 431, '', 0x4e657720646179, 303.43839, -1, -1, 0, '/usr/local/phqueue/randomizer/03 _ New day.mp3'),
(2744, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x4265747261796564, 375.11838, -1, -1, 0, '/usr/local/phqueue/randomizer/07 Betrayed.mp3'),
(2743, NULL, 0, 439, '', 0x4c6974746c6520447265616d204f66204d696e65, 181.73389, -1, -1, 0, '/usr/local/phqueue/randomizer/Little dream of mine.mp3'),
(2742, NULL, 0, 450, 0x5363656e657320696e20417072696c, 0x496e20546865204b69746368656e202861636f75737469632f766f6963657329, 356.07507, -1, -1, 0, '/usr/local/phqueue/randomizer/thesomethingrelevantgroup+inthekitchen.mp3'),
(2741, NULL, 0, 428, '', 0x536561206f662053746f72696573, 349.77954, -1, -1, 0, '/usr/local/phqueue/randomizer/Zebediah Plush - Sea of Stories.mp3'),
(2740, NULL, 0, 425, 0x5368696c6c6f6e67, 0x426c756573204973204d7920536f756c6d617465, 225.09718, -1, -1, 0, '/usr/local/phqueue/randomizer/10 Blues Is My Soulmate.mp3'),
(2739, NULL, 0, 448, 0x53706972616c20417363656e74, 0x496e205477696c696768742773204772616365, 470.36078, -1, -1, 0, '/usr/local/phqueue/randomizer/Kryptos - In Twilight''s Grace.mp3'),
(2738, NULL, 0, 440, 0x46726f6d20466172204265796f6e64, 0x53617920536f6d657468696e67, 164.04897, -1, -1, 0, '/usr/local/phqueue/randomizer/NGC992_SaySomething-StudioCopy.mp3'),
(2737, NULL, 0, 449, 0x4f6365616e73, 0x4f6365616e73, 244.48988, -1, -1, 0, '/usr/local/phqueue/randomizer/Cognac_-_Oceans.mp3'),
(2736, NULL, 0, 428, 0x41667465726c6175676873, 0x54656120616e6420546f617374, 332.61719, -1, -1, 0, '/usr/local/phqueue/randomizer/01 Tea and Toast.mp3'),
(2735, '2006-10-10 17:31:50', 0, 0, '', '', 0.25600, -1, -1, 0, '/usr/local/phqueue/randomizer/Beatels - All You Need Is Love.mp3'),
(2734, NULL, 0, 422, 0x4c697665206174204c696e75782042616e67616c6f72652f32303032, 0x4c696e75782043616e21, 182.64816, -1, -1, 0, '/usr/local/phqueue/randomizer/linuxcan-phenom.mp3'),
(2733, NULL, 0, 426, 0x506c616e2042, 0x54686520537465616c, 288.18286, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - The Steal - Plan B.mp3'),
(2732, NULL, 0, 455, '', 0x4a757374205175697428556e706c756767656429, 249.31264, -1, -1, 0, '/usr/local/phqueue/randomizer/Halfway Through...-Just Quit(Unplugged).mp3'),
(2731, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x436174686172736973, 473.31268, -1, -1, 0, '/usr/local/phqueue/randomizer/10 Catharsis.mp3'),
(2730, NULL, 0, 426, 0x506c616e2042, 0x436861696e657365204974656d, 303.43832, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Chainese Item - Plan B.mp3'),
(2729, NULL, 0, 428, '', 0x4179652c2043616e6479, 235.25874, -1, -1, 0, '/usr/local/phqueue/randomizer/Zebediah Plush - Aye, Candy.mp3'),
(2728, NULL, 0, 433, 0x5061747465726e7320616e64204d6f6f647377696e6773, 0x536f6e67203031, 296.72488, -1, -1, 0, '/usr/local/phqueue/randomizer/Envision - Song 01.mp3'),
(2727, NULL, 0, 425, 0x5368696c6c6f6e67, 0x5368696c6c6f6e672853696572204c6170616c616e6729, 433.08414, -1, -1, 0, '/usr/local/phqueue/randomizer/08 Shillong(Sier Lapalang).mp3'),
(2726, NULL, 0, 429, 0x506172696b72616d61, 0x576869736b657920426c756573, 335.73712, -1, -1, 0, '/usr/local/phqueue/randomizer/whiskey128.mp3'),
(2725, NULL, 0, 449, 0x436f676e61632d536f6d6520687568, 0x5369676e73, 323.69238, -1, -1, 0, '/usr/local/phqueue/randomizer/Cognac_-_Signs.mp3'),
(2724, NULL, 0, 429, 0x425554204954205241494e4544, 0x427574204974205261696e6564, 276.28064, -1, -1, 0, '/usr/local/phqueue/randomizer/But It Rained.mp3'),
(2723, NULL, 0, 422, 0x556e626f756e64, 0x436f6c6f7572656420466f72205468697320576f726c64, 277.44653, -1, -1, 0, '/usr/local/phqueue/randomizer/phenom-unbound-02-coloured_for_this_world.mp3'),
(2722, NULL, 0, 438, 0x537572766976616c204f6666205468652046697474657374, 0x496d706f7274, 223.08571, -1, -1, 0, '/usr/local/phqueue/randomizer/Medusa - Survival Off The Fittest - 06 - Import.mp3'),
(2721, NULL, 0, 434, 0x5570, 0x446f6e27742043617265, 208.45711, -1, -1, 0, '/usr/local/phqueue/randomizer/Don''t Care.mp3'),
(2720, NULL, 0, 444, 0x496e73616e652042696f677261706879, 0x5175657374696f6e73, 308.34937, -1, -1, 0, '/usr/local/phqueue/randomizer/Motherjane - Questions.mp3'),
(2719, NULL, 0, 444, '', 0x5373682e2e2e204c697374656e, 210.23343, -1, -1, 0, '/usr/local/phqueue/randomizer/Motherjane - Ssh... Listen.mp3'),
(2718, NULL, 0, 454, 0x4c69766520617420414d4320436f6c6c656765, 0x436f6c6420436f6d666f727420284c69766529, 266.05707, -1, -1, 0, '/usr/local/phqueue/randomizer/06-06_Cold _ Comfort.mp3'),
(2716, '2006-10-10 17:24:15', 0, 434, 0x5570, 0x466c79, 45.92595, -1, -1, 0, '/usr/local/phqueue/randomizer/Fly.mp3'),
(2717, NULL, 0, 428, 0x41667465726c6175676873, 0x536561204f662053746f72696573, 349.77963, -1, -1, 0, '/usr/local/phqueue/randomizer/06 Sea Of Stories.mp3'),
(2715, NULL, 0, 422, 0x556e626f756e64, 0x41204c6974746c652053746570, 343.06613, -1, -1, 0, '/usr/local/phqueue/randomizer/phenom-unbound-04-a_little_step.mp3'),
(2714, NULL, 0, 432, '', 0x4174205374616b65, 375.51019, -1, -1, 0, '/usr/local/phqueue/randomizer/atstake_live_version.MP3'),
(2713, NULL, 0, 450, 0x4d61726368204a616d6d696e67, 0x5768793f202841636f757374696320496d70726f7629, 288.70538, -1, -1, 0, '/usr/local/phqueue/randomizer/thesomethingrelevantgroup+whyacousticimprov.mp3'),
(2712, NULL, 0, 431, '', 0x536c656570, 285.93631, -1, -1, 0, '/usr/local/phqueue/randomizer/02 _ Sleep.mp3'),
(2711, NULL, 0, 451, '', 0x5a6f6f70657274726970, 286.53113, -1, -1, 0, '/usr/local/phqueue/randomizer/Them Clones - Zoopertrip.mp3'),
(2710, NULL, 0, 439, 0x5a6169747a204661726d20526f6164, 0x57696c6c20596f75, 283.45474, -1, -1, 0, '/usr/local/phqueue/randomizer/04 Will You.mp3'),
(2709, NULL, 0, 437, '', 0x496e20446570656e64656e6365202866696e616c206d697829, 291.50043, -1, -1, 0, '/usr/local/phqueue/randomizer/PIN DROP VIOLENCE - In Dependence (final mix).mp3'),
(2708, NULL, 0, 453, 0x4573636170652074686520526f6172, 0x506c65617375726573206f66205375627572626961, 222.01469, -1, -1, 0, '/usr/local/phqueue/randomizer/Skinny Alley - Pleasures of Suburbia.mp3'),
(2707, '2006-10-10 17:36:25', 0, 428, 0x41667465726c6175676873, 0x41747461636b206f6620746865204b696c6c657220427574746572666c696573, 366.83755, -1, -1, 0, '/usr/local/phqueue/randomizer/05 Attack of the Killer Butterflies.mp3'),
(2706, NULL, 0, 428, 0x41667465726c6175676873, 0x53746172205370616e676c65642042616e6e6572, 294.76575, -1, -1, 0, '/usr/local/phqueue/randomizer/10 Star Spangled Banner.mp3'),
(2705, NULL, 0, 452, 0x48656c6c20497320416c6c2050656f706c65, 0x496e7669746174696f6e20546f20426c656564, 210.07669, -1, -1, 0, '/usr/local/phqueue/randomizer/Bhayanak Maut - Invitation To Bleed.MP3'),
(2704, NULL, 0, 434, 0x576520417265204e6f74204c697374656e696e67, 0x596f6f, 289.98529, -1, -1, 0, '/usr/local/phqueue/randomizer/Pentagram - Yoo.mp3'),
(2703, NULL, 0, 451, '', 0x4177616b656e, 199.60338, -1, -1, 0, '/usr/local/phqueue/randomizer/Awaken  --  Them Clones.mp3'),
(2702, NULL, 0, 434, '', 0x4d6f74686572, 317.49225, -1, -1, 0, '/usr/local/phqueue/randomizer/Pentagram - Mother.mp3'),
(2701, NULL, 0, 450, 0x4a6f6a6f53616d6565722053657373696f6e7328556e6d6173746572656429, 0x556e6465727761746572, 406.54370, -1, -1, 0, '/usr/local/phqueue/randomizer/Something Relevant-Underwater.MP3'),
(2700, '2006-10-10 17:48:26', 0, 449, '', 0x5468726f75676820596f75722045796573, 357.66855, -1, -1, 0, '/usr/local/phqueue/randomizer/Cognac - Through Your Eyes.mp3'),
(2699, NULL, 0, 0, '', '', 205.74042, -1, -1, 0, '/usr/local/phqueue/randomizer/Presence.MP3'),
(2698, NULL, 0, 439, 0x5a6169747a204661726d20526f6164, 0x4c6974746c6520447265616d204f66204d696e65, 183.84981, -1, -1, 0, '/usr/local/phqueue/randomizer/01 Little Dream Of Mine.mp3'),
(2697, NULL, 0, 439, 0x5a6169747a204661726d20526f6164, 0x4c6574277320526f636b, 228.44089, -1, -1, 0, '/usr/local/phqueue/randomizer/06 Let''s Rock.mp3'),
(2696, NULL, 0, 434, '', 0x5072696365204f662042756c6c657473, 252.57793, -1, -1, 0, '/usr/local/phqueue/randomizer/renamed_Price of Bullets (feat. Javed Akhtar Shankar Mahadevan).mp3'),
(2695, NULL, 0, 448, 0x53706972616c20417363656e74, 0x416c74657265642044657374696e696573, 379.32404, -1, -1, 0, '/usr/local/phqueue/randomizer/Kryptos - Altered Destinies.mp3'),
(2694, '2006-10-10 17:55:26', 0, 447, 0x41205072656c696d696e617279205175657374, 0x4c6179657273206f66204879706f6372697379, 773.16998, -1, -1, 0, '/usr/local/phqueue/randomizer/02 - MyndSnare - A Preliminary Quest - Layers of Hypocrisy.MP3'),
(2693, NULL, 0, 428, 0x4b6973736572732026616d703b204b696c6c657273, 0x57656174686572204769726c, 281.96567, -1, -1, 0, '/usr/local/phqueue/randomizer/Zebediah-Plush---Weather-Girl.mp3'),
(2692, NULL, 0, 438, 0x537572766976616c204f6666205468652046697474657374, 0x5768697465205369676e, 201.03838, -1, -1, 0, '/usr/local/phqueue/randomizer/Medusa - Survival Off The Fittest - 04 - White Sign.mp3'),
(2691, NULL, 0, 437, '', 0x5065726665637420446566656374, 231.81062, -1, -1, 0, '/usr/local/phqueue/randomizer/13---Pin-Drop-Violence---Perfect-Defect-(randolph-remix).mp3'),
(2690, NULL, 0, 438, 0x537572766976616c204f6666205468652046697474657374, 0x50736575646f2873292057656570, 215.79755, -1, -1, 0, '/usr/local/phqueue/randomizer/Medusa - Survival Off The Fittest - 05 - Pseudo(S) Weep.mp3'),
(2689, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x467574696c65, 451.13474, -1, -1, 0, '/usr/local/phqueue/randomizer/04 Futile.mp3'),
(2688, NULL, 0, 428, '', 0x41747461636b206f6620746865204b696c6c657220427574746572666c696573, 366.86365, -1, -1, 0, '/usr/local/phqueue/randomizer/Zebediah Plush - Attack of the Killer Butterflies.mp3'),
(2687, NULL, 0, 432, '', 0x447265616d73, 324.28406, -1, -1, 0, '/usr/local/phqueue/randomizer/dreams.MP3'),
(2686, '2006-10-10 17:59:26', 0, 431, '', 0x507265747479204368696c64, 276.06207, -1, -1, 0, '/usr/local/phqueue/randomizer/11 _ Pretty Child.mp3'),
(2685, '2006-10-10 17:37:25', 0, 426, 0x506c616e2042, 0x47616c61636b7469717561, 247.64079, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Galacktiqua - Plan B.mp3'),
(2684, NULL, 0, 427, '', 0x4e61617368, 330.18774, -1, -1, 0, '/usr/local/phqueue/randomizer/naash.mp3'),
(2683, NULL, 0, 446, '', 0x54696c6c2049276d206e6f206f6e6520616761696e2e2e, 358.68735, -1, -1, 0, '/usr/local/phqueue/randomizer/TINA160.mp3'),
(2682, NULL, 0, 431, '', 0x5468726f776e20697420616c6c2061776179, 322.92569, -1, -1, 0, '/usr/local/phqueue/randomizer/04 _ Thrown it all away.mp3'),
(2681, NULL, 0, 426, 0x506c616e2042, 0x4d6f746f726279636b6c65, 445.46609, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Motorbyckle - Plan B.mp3'),
(2680, NULL, 0, 426, 0x506c616e2042, 0x50617065722050756c69, 328.62039, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Paper Puli - Plan B.mp3'),
(2679, NULL, 0, 445, '', 0x506f6b6872616e20284c69766529, 228.88487, -1, -1, 0, '/usr/local/phqueue/randomizer/Pokhran.mp3'),
(2678, NULL, 0, 444, 0x496e73616e652042696f677261706879, 0x4d696e64737472656574, 331.44162, -1, -1, 0, '/usr/local/phqueue/randomizer/Motherjane - Mindstreet.mp3'),
(2677, NULL, 0, 439, '', 0x5468696e6b696e67204f6620596f75, 291.05630, -1, -1, 0, '/usr/local/phqueue/randomizer/Thinking of you.mp3'),
(2676, NULL, 0, 443, '', 0x4b616e64697361, 460.40814, -1, -1, 0, '/usr/local/phqueue/randomizer/Hindi Pop - Kandisa.mp3'),
(2675, NULL, 0, 426, 0x506c616e2042, 0x42656e642054686520576f726c64, 241.34529, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Bend the World - Plan B.mp3'),
(2674, NULL, 0, 425, 0x5368696c6c6f6e67, 0x4c6f766520596f75, 193.07106, -1, -1, 0, '/usr/local/phqueue/randomizer/01 Love You.mp3'),
(2673, NULL, 0, 442, 0x446561642054696d652053746f72696573, 0x446561642054696d652053746f72696573, 365.68817, -1, -1, 0, '/usr/local/phqueue/randomizer/bhoomi-dead_time_stories.mp3'),
(2672, NULL, 0, 434, 0x5570, 0x46656172, 278.09955, -1, -1, 0, '/usr/local/phqueue/randomizer/Fear.mp3'),
(2671, NULL, 0, 425, 0x5368696c6c6f6e67, 0x496620596f7520536565204d792042616279, 255.08575, -1, -1, 0, '/usr/local/phqueue/randomizer/09 If You See My Baby.mp3'),
(2670, NULL, 0, 428, 0x41667465726c6175676873, 0x4a6f75726e657920746f20476f6e646f6c696e, 276.11432, -1, -1, 0, '/usr/local/phqueue/randomizer/07 Journey to Gondolin.mp3'),
(2669, NULL, 0, 439, 0x5a6169747a204661726d20526f6164, 0x4e6577204a6572736579, 287.92169, -1, -1, 0, '/usr/local/phqueue/randomizer/07 New Jersey.mp3'),
(2668, NULL, 0, 419, 0x486f6f6b, 0x5053502031322727, 276.71512, -1, -1, 0, '/usr/local/phqueue/randomizer/Zero - PSP 12''''.mp3'),
(2667, NULL, 0, 440, 0x46726f6d20466172204265796f6e64, 0x54686520456c6576656e746820446179206f662053657074656d626572, 164.78041, -1, -1, 0, '/usr/local/phqueue/randomizer/NGC992_TheEleventhDayOfSeptember-StudioCopy.mp3'),
(2666, NULL, 0, 428, 0x41667465726c6175676873, 0x53696e67696e67204c616479, 330.05719, -1, -1, 0, '/usr/local/phqueue/randomizer/03 Singing Lady.mp3'),
(2665, '2006-10-10 17:36:25', 0, 439, 0x5a6169747a204661726d20526f6164, 0x5468696e6b696e67204f6620596f75, 293.17224, -1, -1, 0, '/usr/local/phqueue/randomizer/02 Thinking Of You.mp3'),
(2664, NULL, 0, 438, 0x537572766976616c204f6666205468652046697474657374, 0x44726970, 219.32408, -1, -1, 0, '/usr/local/phqueue/randomizer/Medusa - Survival Off The Fittest - 01 - Drip.mp3'),
(2663, NULL, 0, 426, 0x4a7570697465722043616665, 0x53616e69747920496e2047726176697479, 337.63263, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Sanity In Gravity.mp3'),
(2662, NULL, 0, 431, '', 0x466c79, 274.05063, -1, -1, 0, '/usr/local/phqueue/randomizer/06 _ Fly.mp3'),
(2661, '2006-10-10 17:30:50', 0, 431, 0x526f636b2026616d703b20526f6c6c2052656e6567616465, 0x4b6172656e, 27.50969, -1, -1, 0, '/usr/local/phqueue/randomizer/07 - Karen.mp3'),
(2660, NULL, 0, 437, 0x636f6d706f73652e2e2e6f70706f73652e2e2e646973706f7365, 0x416273757264, 252.05550, -1, -1, 0, '/usr/local/phqueue/randomizer/PIN DROP VIOLENCE - Absurd.mp3'),
(2659, NULL, 0, 436, 0x4a75737420427265776564, 0x4672656520576f726c64, 249.23428, -1, -1, 0, '/usr/local/phqueue/randomizer/strange_brew-just_brewed-03-free_world.mp3'),
(2658, NULL, 0, 0, '', '', 316.18799, -1, -1, 0, '/usr/local/phqueue/randomizer/Anjanee Rahain.mp3'),
(2657, NULL, 0, 428, '', 0x456c6173746963204d616e, 274.39017, -1, -1, 0, '/usr/local/phqueue/randomizer/Zebediah Plush - Elastic Man.mp3'),
(2656, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x506572737065637469766520496e746f6c6572616e6365, 374.38693, -1, -1, 0, '/usr/local/phqueue/randomizer/06 Perspective Intolerance.mp3'),
(2655, NULL, 0, 435, '', 0x4261617465696e2042616e61616e61, 240.76282, -1, -1, 0, '/usr/local/phqueue/randomizer/0001-Vinapra-Baatein Banaana.mp3'),
(2654, NULL, 0, 426, 0x506c616e2042, 0x4465616420496e73696465, 313.36490, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - Dead Inside - Plan B.mp3'),
(2653, NULL, 0, 422, 0x556e626f756e64, 0x526573757267656e6365, 243.85306, -1, -1, 0, '/usr/local/phqueue/randomizer/phenom-unbound-03-resurgence.mp3'),
(2652, NULL, 0, 428, '', 0x54656120616e6420546f617374, 332.61710, -1, -1, 0, '/usr/local/phqueue/randomizer/Zebediah Plush - Tea and Toast.mp3'),
(2651, NULL, 0, 434, 0x576520417265204e6f74204c697374656e696e67, 0x5468652049676e6f72616e74204f6e65, 324.78040, -1, -1, 0, '/usr/local/phqueue/randomizer/Pentagram - The Ignorant One.mp3'),
(2650, NULL, 0, 431, '', 0x5475726e206974206f6e, 328.33307, -1, -1, 0, '/usr/local/phqueue/randomizer/01 _ Turn it on.mp3'),
(2649, NULL, 0, 433, 0x5061747465726e7320616e64204d6f6f647377696e6773, 0x53746172204c69676874, 423.54938, -1, -1, 0, '/usr/local/phqueue/randomizer/Envision - Star Light.mp3'),
(2648, NULL, 0, 432, '', 0x436f6e7461696e656420496e2054696d65, 461.16568, -1, -1, 0, '/usr/local/phqueue/randomizer/containedfinal.MP3'),
(2647, NULL, 0, 428, 0x41667465726c6175676873, 0x4179652c2043616e6479, 235.23270, -1, -1, 0, '/usr/local/phqueue/randomizer/02 Aye, Candy.mp3'),
(2646, NULL, 0, 431, '', 0x426f6f6b206f6620447265616d73, 280.63351, -1, -1, 0, '/usr/local/phqueue/randomizer/10 _ Book of Dreams.mp3'),
(2645, NULL, 0, 430, 0x496e74656c6c65637475616c2050757273756974, 0x50617468204f662056656e6765616e6365, 410.93225, -1, -1, 0, '/usr/local/phqueue/randomizer/03 Path Of Vengeance.mp3'),
(2632, NULL, 0, 460, 0x526164696f5665727665, 0x536f756c73206f6e20706172616465, 310.72650, 46, 1, 0, '/usr/local/phqueue/shows/10/08-colourblind-souls_on_parade.mp3'),
(2633, NULL, 0, 461, 0x526164696f5665727665, 0x4d6f6e6b657920426561747a, 405.86450, 46, 2, 0, '/usr/local/phqueue/shows/10/03-bombay_black-monkey_beatz.mp3'),
(2634, NULL, 0, 426, 0x526164696f5665727665, 0x49276c6c2067657420796f7520696e2074686520656e64, 301.40082, 46, 3, 0, '/usr/local/phqueue/shows/10/05-taaq-ill_get_you_in_the_end.mp3'),
(2635, NULL, 0, 453, 0x526164696f5665727665, 0x556e6976657273616c20506c616e, 277.10693, 46, 4, 0, '/usr/local/phqueue/shows/10/07-skinny_alley-universal_plan.mp3'),
(2636, NULL, 0, 462, 0x526164696f5665727665, 0x47726f756e64205a65726f, 247.56244, 46, 5, 0, '/usr/local/phqueue/shows/10/01-13_ad-ground_zero.mp3'),
(2637, NULL, 0, 423, 0x526164696f5665727665, 0x57696e646f776e202d20476175726176, 24.00650, 46, 6, 0, '/usr/local/phqueue/shows/10/09-windown-gaurav.mp3'),
(2638, NULL, 0, 463, 0x526164696f5665727665, 0x566f696365206f66204268756d69, 280.11099, 46, 7, 0, '/usr/local/phqueue/shows/10/02-bhumi-voice_of_bhumi.mp3'),
(2639, '2006-10-10 16:32:29', 0, 423, 0x526164696f5665727665, 0x496e74726f202d20476175726176, 30.82450, 46, 8, 0, '/usr/local/phqueue/shows/10/00-intro-gaurav.mp3'),
(2640, NULL, 0, 419, 0x526164696f5665727665, 0x437279, 277.10693, 46, 9, 0, '/usr/local/phqueue/shows/10/06-zero-cry.mp3'),
(2641, NULL, 0, 420, 0x526164696f5665727665, 0x4d7920576f726c64, 271.41226, 46, 10, 0, '/usr/local/phqueue/shows/10/04-medicis-my_world.mp3'),
(2642, '2006-10-10 16:30:29', 0, 0, '', '', 27.64800, 47, 1, 0, '/usr/local/phqueue/shows/2/11-coloured_for_this_world.mp3'),
(2643, NULL, 0, 453, 0x496e66696e69747920526164696f, 0x506c65617375726573206f66205375627572626961, 233.97874, 47, 2, 0, '/usr/local/phqueue/shows/2/04-pleasures_of_suburbia.mp3'),
(2644, NULL, 0, 456, 0x496e66696e69747920526164696f, 0x46726f7a656e20506f727472616974, 419.94449, 47, 3, 0, '/usr/local/phqueue/shows/2/05-frozen_portrait.mp3'),
(2808, NULL, 0, 425, 0x5368696c6c6f6e67, 0x4d792042616279, 113.08413, -1, -1, 0, '/usr/local/phqueue/randomizer/05 My Baby.mp3'),
(2809, NULL, 0, 444, 0x52656d656d626572205368616b7469205b426f78205365745d20446973632036, 0x4d617961, 407.11230, -1, -1, 0, '/usr/local/phqueue/randomizer/Motherjane - Maya.mp3'),
(2810, NULL, 0, 448, 0x53706972616c20417363656e74, 0x466f72676f7474656e204c616e64206f6620496365, 330.42282, -1, -1, 0, '/usr/local/phqueue/randomizer/Kryptos - Forgotten Land of Ice.mp3'),
(2811, NULL, 0, 437, 0x416c62756d, 0x547261636b203132, 207.80406, -1, -1, 0, '/usr/local/phqueue/randomizer/12 - Pin Drop Violence - Get them Off.MP3'),
(2812, NULL, 0, 431, '', 0x4265737420667269656e64, 195.26530, -1, -1, 0, '/usr/local/phqueue/randomizer/05 _ Best friend.mp3'),
(2813, NULL, 0, 433, 0x5061747465726e7320616e64204d6f6f647377696e6773, 0x496e2054696d65, 304.11755, -1, -1, 0, '/usr/local/phqueue/randomizer/Envision - In Time.mp3'),
(2814, NULL, 0, 434, 0x5570, 0x49732054686572652041204c696768743f, 262.42609, -1, -1, 0, '/usr/local/phqueue/randomizer/Is-There-a-Light.mp3'),
(2815, NULL, 0, 444, 0x496e73616e652042696f677261706879, 0x446973696c6c7573696f6e6564, 280.81625, -1, -1, 0, '/usr/local/phqueue/randomizer/01-Dissolusioned.mp3'),
(2816, NULL, 0, 426, 0x506c616e2042, 0x49204c6976652048657265, 353.64569, -1, -1, 0, '/usr/local/phqueue/randomizer/Thermal And A Quarter - I Live Here - Plan B.mp3'),
(2817, '2006-10-10 17:36:25', 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d204d796e64536e617265, 53.52488, -1, -1, 1, '/usr/local/phqueue/promos/promo-myndsnare-1.mp3'),
(2818, '2006-10-10 17:01:13', 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20536f756e64636865636b, 29.93631, -1, -1, 1, '/usr/local/phqueue/promos/promo-soundcheck.mp3'),
(2819, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20416476657274697365206f6e20526164696f56655256, 27.92488, -1, -1, 1, '/usr/local/phqueue/promos/promo-advertise.mp3'),
(2820, NULL, 0, 423, 0x526164696f5665727665, 0x5468697320576179, 51.53956, -1, -1, 1, '/usr/local/phqueue/promos/promo-this_way.mp3'),
(2821, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20526164696f5665727665, 35.18694, -1, -1, 1, '/usr/local/phqueue/promos/promo-echo.mp3'),
(2822, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d204c696d656c69676874, 6.45225, -1, -1, 1, '/usr/local/phqueue/promos/promo-limelight_keep_listening.mp3'),
(2823, '2006-10-10 16:21:28', 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20496e7369646520496e646965, 46.88981, -1, -1, 1, '/usr/local/phqueue/promos/promo-inside_indie-1.mp3'),
(2824, '2006-10-10 16:52:11', 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d2052616e646f6d697a6572, 24.89469, -1, -1, 1, '/usr/local/phqueue/promos/promo-randomizer-2.mp3'),
(2825, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20526164696f7665727665, 4.17956, -1, -1, 1, '/usr/local/phqueue/promos/promo-short-justtunein.mp3'),
(2826, '2006-10-10 16:55:12', 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d566572766163697479, 34.97794, -1, -1, 1, '/usr/local/phqueue/promos/promo-vervacity-1.mp3'),
(2827, '2006-10-10 16:20:28', 0, 423, '', 0x50726f6d6f3a2053686f7574626f78, 20.79350, -1, -1, 1, '/usr/local/phqueue/promos/promo-shoutbox.mp3'),
(2828, '2006-10-10 16:24:28', 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d204c696d656c69676874, 23.45794, -1, -1, 1, '/usr/local/phqueue/promos/promo-limelight_main.mp3'),
(2829, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20536f756e64636865636b2032, 28.70856, -1, -1, 1, '/usr/local/phqueue/promos/promo-soundcheck2.mp3'),
(2830, '2006-10-10 16:53:12', 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d2052616e646f6d697a6572, 24.89469, -1, -1, 1, '/usr/local/phqueue/promos/promo-randomizer-1.mp3'),
(2831, '2006-10-10 17:28:50', 0, 423, '', 0x50726f6d6f3a204a7573742054756e6520496e, 29.93631, -1, -1, 1, '/usr/local/phqueue/promos/promo-justtunein.mp3'),
(2832, '2006-10-10 17:09:14', 0, 423, 0x526164696f5665727665, 0x496e74726f202d20496e7369646520496e646965, 19.82694, -1, -1, 1, '/usr/local/phqueue/promos/intro-inside_indie.mp3'),
(2833, '2006-10-10 17:31:50', 0, 423, '', 0x50726f6d6f3a204174756c20436869746e6973, 13.50531, -1, -1, 1, '/usr/local/phqueue/promos/promo-bwahahaha-atul.mp3'),
(2834, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d2053746174697374696373, 39.96737, -1, -1, 1, '/usr/local/phqueue/promos/promo-statistics.mp3'),
(2835, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20526164696f7665727665, 8.46369, -1, -1, 1, '/usr/local/phqueue/promos/promo-radioverve_shoutbox_answeringmachine.mp3'),
(2836, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20526164696f5665727665, 16.66613, -1, -1, 1, '/usr/local/phqueue/promos/promo-radioverve_tamil.mp3'),
(2837, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d204d796e64536e617265, 41.95263, -1, -1, 1, '/usr/local/phqueue/promos/promo-myndsnare-2.mp3'),
(2838, NULL, 0, 423, 0x526164696f5665727665, 0x50726f6d6f202d20466565646261636b, 28.21225, -1, -1, 1, '/usr/local/phqueue/promos/promo-feedback.mp3'),
(2839, NULL, 0, 423, '', 0x50726f6d6f3a20436f6e74616374205573, 19.98369, -1, -1, 1, '/usr/local/phqueue/promos/promo-contact_us.mp3'),
(2840, NULL, 0, 423, '', 0x50726f6d6f3a20526164696f5665727665, 13.53144, -1, -1, 1, '/usr/local/phqueue/promos/promo-from_india.mp3');
