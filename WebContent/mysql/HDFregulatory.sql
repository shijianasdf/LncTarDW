CREATE DATABASE `hdfregulatory_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
CREATE TABLE `browser` (
  `id` varchar(45) NOT NULL,
  `pId` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `open` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `des` (
  `attrValue` varchar(45) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attrValue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `hdfregulatory` (
  `id` int(11) NOT NULL,
  `diseasename` varchar(45) DEFAULT NULL,
  `regulator` varchar(45) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `regulatorytype` varchar(45) DEFAULT NULL,
  `levelofregulation` varchar(45) DEFAULT NULL,
  `regulationdiretion` varchar(45) DEFAULT NULL,
  `expressionpattern` varchar(45) DEFAULT NULL,
  `influencedfunction` varchar(45) DEFAULT NULL,
  `pubmedid` varchar(45) DEFAULT NULL,
  `regulatorid` varchar(45) DEFAULT NULL,
  `regulatortype` varchar(45) DEFAULT NULL,
  `targetid` varchar(45) DEFAULT NULL,
  `targettype` varchar(45) DEFAULT NULL,
  `diseasecategory` varchar(45) DEFAULT NULL,
  `iscancer` varchar(45) DEFAULT NULL,
  `checkdisease2` varchar(45) DEFAULT NULL,
  `rid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `regulatortotarget` (
  `id` int(11) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `sourceid` int(11) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `targetid` int(11) DEFAULT NULL,
  `influencedfunction` varchar(45) DEFAULT NULL,
  `diseasename` varchar(45) DEFAULT NULL,
  `checkdisease2` varchar(45) DEFAULT NULL,
  `regulatortype` varchar(45) DEFAULT NULL,
  `iscancer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `submit` (
  `id` int(11) NOT NULL,
  `diseasename` varchar(45) DEFAULT NULL,
  `regulator` varchar(45) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `regulatorytype` varchar(45) DEFAULT NULL,
  `levelofregulation` varchar(45) DEFAULT NULL,
  `regulationdiretion` varchar(45) DEFAULT NULL,
  `expressionpattern` varchar(45) DEFAULT NULL,
  `influencedfunction` varchar(45) DEFAULT NULL,
  `pubmedid` varchar(45) DEFAULT NULL,
  `regulatortype` varchar(45) DEFAULT NULL,
  `targettype` varchar(45) DEFAULT NULL,
  `diseasecategory` varchar(45) DEFAULT NULL,
  `iscancer` varchar(45) DEFAULT NULL,
  `checkdisease2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `tree` (
  `id` int(11) NOT NULL,
  `rid` varchar(45) DEFAULT NULL,
  `regulator` varchar(45) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `diseasename` varchar(45) DEFAULT NULL,
  `influencedfunction` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
