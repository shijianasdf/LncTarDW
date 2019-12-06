CREATE TABLE `browser` (
  `id` varchar(45) DEFAULT NULL,
  `pId` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `open` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SELECT * FROM hdfregulatory.hdfregulatory;


SELECT * FROM hdfregulatory WHERE 
(regulator like '%TP%' or regulator like '%HOTAIR%') 
and 
(target like 'TERT' or target like '%TE%');

SELECT * FROM Persons
WHERE LastName IN ('Adams','Carter');

select *¡¡from  daec.driverenhancer where 
diseasetype = "gastric cancer" 
and 
(
	(chr = "chr6" and start < "100000" and end > "100000") 
		or 
	(chr = "chr6" and start < "100200" and end > "100200") 
		or 
	(chr = "chr6" and start > "100000" and end < "100200")
);