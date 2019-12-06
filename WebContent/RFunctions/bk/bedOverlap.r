##    该函数用于在R中，对于bed格式的两个对象找到其overlap的记录。
##    用于数据库中对于高通量数据的靶区域进行匹配搜索。
bed_overlap <- function(input=yourInput, species=c("homo", "mus")){
	#####################
	##    需要先安装该包。
	library(GenomicRanges)
	##    需要确定库中所存的主表路径。
	mainTablePath <- "/pub5/xiaoyun/Jobs/temp/YFL/lnChrom/data/high_record/final_df_highPeak.txt"
	#####################
	
	rawCustomData <- read.table(input, sep="\t")
	##    读取前三列并加一列'id'来标识行，即行标签。
	customData <- data.frame(rawCustomData[, 1:3], 1:nrow(rawCustomData))
	colnames(customData) <- c("chr", "start", "end", "id")
	##    生成查询GRanges型的对象并将id列变为行名。
	queryInput <- with(customData, GRanges(chr, IRanges(start, end, names=id)))
	mainTable <- read.csv(mainTablePath, header=F, sep="\t", as.is=T)
	##    生成id。
	mainTable <- data.frame(mainTable, seq(1:nrow(mainTable)))
	homo_idx <- mainTable[, 5]=="hg19"
	mus_idx <- mainTable[, 5]=="mm9"
	##    根据物种，取出对应的peak数据。
	if(species=="homo"){
		xx <- mainTable[homo_idx, 22:25]
		colnames(xx) <- c("chr", "start", "end", "id")
		mainTable_temp <- with(xx, GRanges(chr, IRanges(start, end, names=id)))
		}
	if(species=="mus"){
		xx <- mainTable[mus_idx, 22:25]
		colnames(xx) <- c("chr", "start", "end", "id")
		mainTable_temp <- with(xx, GRanges(chr, IRanges(start, end, names=id)))
		} else {
			print("Your input species is not right!")
			}
	overlaps <- findOverlaps(queryInput, mainTable_temp)
	match_hit <- data.frame(rawCustomData[queryHits(overlaps), ], mainTable[names(mainTable_temp)[subjectHits(overlaps)], c(1:5, 13, 16, 18)])
	colnames(match_hit) <- c(rep("custom_input", ncol(rawCustomData)), c("lncRNA", "ENSEMBL_id", "TargetGene", "Entrez_id", "Ref_genome", "Disease_association", "Cell_type", "PMID"))
	return(match_hit)
	}
#输入:
setwd("/pub5/xiaoyun/Jobs/temp/SYY/lnc2target-lnChrom/")
yourInput="test1.bed"
species="mus"
#运行函数
match_hit<-bed_overlap()
#输出:两个bed文件的行标签
> match_hit
  query subject
1     4   3_yes
2     5   3_yes
3     6   4_yes