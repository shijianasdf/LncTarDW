锘�##    璇ュ嚱鏁扮敤浜庡湪R涓紝瀵逛簬bed鏍煎紡鐨勪袱涓璞℃壘鍒板叾overlap鐨勮褰曘��
##    鐢ㄤ簬鏁版嵁搴撲腑瀵逛簬楂橀�氶噺鏁版嵁鐨勯澏鍖哄煙杩涜鍖归厤鎼滅储銆�
bed_overlap <- function(input=yourInput, species="Homo sapiens",disease=NULL,variant=NULL,gene=null){
	#####################
	##    闇�瑕佸厛瀹夎璇ュ寘銆�
	library(GenomicRanges)
	##    闇�瑕佺‘瀹氬簱涓墍瀛樼殑涓昏〃璺緞銆�
	mainTablePath <- "/sda/Software/apache-tomcat-7.0.55/webapps/LnChrom/RFunctions/lnChrom_data_high_new_peak.txt"
	#####################
	
	rawCustomData <- read.table(input, sep="\t")
	##    璇诲彇鍓嶄笁鍒楀苟鍔犱竴鍒�'id'鏉ユ爣璇嗚锛屽嵆琛屾爣绛俱��
	customData <- data.frame(rawCustomData[, 1:3], 1:nrow(rawCustomData))
	colnames(customData) <- c("chr", "start", "end", "id")
	##    鐢熸垚鏌ヨGRanges鍨嬬殑瀵硅薄骞跺皢id鍒楀彉涓鸿鍚嶃��
	queryInput <- with(customData, GRanges(chr, IRanges(start, end, names=id)))
	mainTable <- read.csv(mainTablePath, header=F, sep="\t", as.is=T)
	##    鐢熸垚id銆�
	mainTable <- data.frame(mainTable, seq(1:nrow(mainTable)))
	print(head(mainTable))
	print(species)
	homo_idx <- mainTable[, 12]=="hg19"
	mus_idx <- mainTable[, 12]=="mm9"
	##    鏍规嵁鐗╃锛屽彇鍑哄搴旂殑peak鏁版嵁銆�
	if(species=="Homo sapiens"){
		xx <- mainTable[homo_idx, 29:32]
		colnames(xx) <- c("chr", "start", "end", "id")
		mainTable_temp <- with(xx, GRanges(chr, IRanges(start, end, names=id)))
		}
	if(species=="Mus musculus"){
		xx <- mainTable[mus_idx, 29:32]
		colnames(xx) <- c("chr", "start", "end", "id")
		mainTable_temp <- with(xx, GRanges(chr, IRanges(start, end, names=id)))
		}
	overlaps <- findOverlaps(queryInput, mainTable_temp)
	##    Specis, lncRNA, Target region(3), Target gene, PMID
	match_hit <- mainTable[names(mainTable_temp)[subjectHits(overlaps)], c(1, 21, 2, 29:31, 10, 25)]
	##    more details
	match_hit <- as.matrix(t(data.frame(match_hit, rep("more details", nrow(match_hit)))))
	return(match_hit)
	}
