USE hdfregulatory;
CREATE TABLE `submit` (
  `id` varchar(45) NOT NULL,
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
SELECT * FROM hdfregulatory.browser;

select * from user where id like '%X';   
  
select * from user where username like 'XI%';   
  
select * from user where username like '%huxiao%';

select * from browser where id in ( 'genetype','Disease' );