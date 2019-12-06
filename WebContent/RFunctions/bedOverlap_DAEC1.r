bed_overlap <- function(filepath,gene,variant,disease){
	#�û��ϴ��ļ�·��
	#�����л���
	#��������
	#��������
	tablepath <-"D:/TomcatZip/apache-tomcat-7.0.70/webapps/DAEC/RFunctions/mainTable.txt"
	#��������(��������)
	#���� chr start end TargetGene VarSite DiseaseType ...
	mainTable <- read.table(tablepath,sep="\t",header=T,stringsAsFactors=F)
	#���� chr start end strand
	queryTable  <- read.table(filepath,sep="\t",header=T,stringsAsFactors=F)
	library(GenomicRanges)
	queryInput <- with(queryTable, GRanges(chr, IRanges(start,end))) #Ĭ������ϢΪ*
	#mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end)))
	mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end))) #Ĭ������ϢΪ*
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
	#��java�ӿ� ��Ҫas.matrix����ת��
	return(as.matrix(t(match_hit)))
}