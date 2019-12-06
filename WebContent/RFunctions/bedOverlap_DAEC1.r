bed_overlap <- function(filepath,gene,variant,disease){
	#用户上传文件路径
	#参数靶基因
	#参数变异
	#参数疾病
	tablepath <-"D:/TomcatZip/apache-tomcat-7.0.70/webapps/DAEC/RFunctions/mainTable.txt"
	#读入数据(两个表格)
	#主表 chr start end TargetGene VarSite DiseaseType ...
	mainTable <- read.table(tablepath,sep="\t",header=T,stringsAsFactors=F)
	#附表 chr start end strand
	queryTable  <- read.table(filepath,sep="\t",header=T,stringsAsFactors=F)
	library(GenomicRanges)
	queryInput <- with(queryTable, GRanges(chr, IRanges(start,end))) #默认链信息为*
	#mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end)))
	mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end))) #默认链信息为*
	overlaps <- findOverlaps(queryInput, mainTable.Temp)
	#match_hit <- mainTable[names(mainTable.Temp)[subjectHits(overlaps)], c(1, 21, 2, 29:31, 10, 25)]
	match_hit <- mainTable[subjectHits(overlaps),]
	if(gene!="NULL"&variant!="NULL"&disease!="NULL"){
		match_hit <- match_hit[which(match_hit$TargetGene==gene & match_hit$varSite==variant & match_hit$DiseaseType==disease),]
	}
	if(gene!="NULL"&variant=="NULL"&disease!="NULL"){
		match_hit <- match_hit[which(match_hit$TargetGene==gene & match_hit$DiseaseType==disease),]
	}
	if(gene!="NULL"&variant!="NULL"&disease=="NULL"){
		match_hit <- match_hit[which(match_hit$varSite==variant & match_hit$TargetGene==gene),]
	}
	if(gene!="NULL"&variant=="NULL"&disease=="NULL"){
		match_hit <- match_hit[which(match_hit$TargetGene==gene),]
	}
	if(gene=="NULL"&variant!="NULL"&disease!="NULL"){
		match_hit <- match_hit[which(match_hit$varSite==variant & match_hit$DiseaseType==disease),]
	}
	if(gene=="NULL"&variant=="NULL"&disease!="NULL"){
		match_hit <- match_hit[which(match_hit$DiseaseType==disease),]
	}
	if(gene=="NULL"&variant!="NULL"&disease=="NULL"){
		match_hit <- match_hit[which(match_hit$varSite==variant),]
	}
	if(gene=="NULL"&variant=="NULL"&disease=="NULL"){
		match_hit <- match_hit
	}
	#与java接口 需要as.matrix并且转置
	return(as.matrix(t(match_hit)))
}