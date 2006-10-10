-- phpMyAdmin SQL Dump
-- version 2.8.0.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Sep 23, 2006 at 12:56 PM
-- Server version: 5.0.18
-- PHP Version: 5.1.2
-- 
-- Database: `tunequeue`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `masterschedule`
-- 

INSERT INTO `masterschedule` (`ID`, `showid`, `starttime`, `channelid`) VALUES (7, 3, 0, NULL),
(6, 2, 5, NULL);

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
  `showdate` date default '0000-00-00',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `shows`
-- 

INSERT INTO `shows` (`ID`, `showname`, `showdesc`, `logoimg`, `channelid`, `showdate`) VALUES (1, 0x53686f77204e756d6265722031, 0x5468697320697320616e20696e746572766965772077697468204d796e64736e617265, 0x736873687373, NULL, '0000-00-00'),
(2, 0x5368726579617327732053686f77, 0x426c6168, 0x626c6168, NULL, '0000-00-00'),
(3, 0x487568, 0x77687768, 0x6168616861, NULL, '0000-00-00');

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
  `filename` varchar(255) character set latin1 collate latin1_bin default NULL,
  `added` datetime default NULL,
  `disabled` tinyint(4) NOT NULL default '0',
  `artist` varchar(255) character set latin1 collate latin1_bin default NULL,
  `album` varchar(255) character set latin1 collate latin1_bin default NULL,
  `title` varchar(255) character set latin1 collate latin1_bin default NULL,
  `time` float(12,5) default NULL,
  `showid` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tunes`
-- 

