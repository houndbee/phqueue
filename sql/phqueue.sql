-- phpMyAdmin SQL Dump
-- version 2.8.0.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Oct 17, 2006 at 11:07 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `archivedtunes`
-- 

CREATE TABLE `archivedtunes` (
  `ID` int(11) NOT NULL auto_increment,
  `tuneid` int(11) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

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

-- --------------------------------------------------------

-- 
-- Table structure for table `producer`
-- 

CREATE TABLE `producer` (
  `ID` int(11) NOT NULL auto_increment,
  `tuneid` int(11) NOT NULL,
  `curstatus` int(11) NOT NULL,
  `showid` int(11) NOT NULL default '-1',
  `starttime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1199 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3036 ;
