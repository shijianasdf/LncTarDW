deseq2.diff <- function(filepath,lncRNA,target){
  ## 读入数据
  exprSet <- read.table(filepath,sep="\t",header=T,fill=T,quote=NULL,stringsAsFactors=F) #记录转录因子结合位点以及TFClass
  
  library(DESeq2)
  library(rjson)
  
  ##分组信息
  group_list1 <- colnames(exprSet) #untrt trt   untrt trt   untrt trt   untrt trt
  group_list <- group_list1
  group_list[grep("normal",group_list)] <- "normal"
  group_list[grep("tumour",group_list)] <- "tumour"
  #group_list <- c("normal","tumour","normal","tumour","normal","tumour","normal","tumour")
  (colData <- data.frame(row.names=group_list1, group_list=group_list))
  colData
  group_list
  #产生DESeq对象
  dds <- DESeqDataSetFromMatrix(countData = exprSet,
                                colData = colData,
                                design = ~ group_list)
  #计算差异
  dds <- DESeq(dds)
  #替换异常值
  dds <- replaceOutliersWithTrimmedMean(dds)
  #提取结果tumour相对于normal的差异表达
  #res <- results(dds, contrast=c("group_list","trt","untrt")) 
  res <- results(dds, contrast=c("group_list","tumour","normal")) 
  resOrdered <- res[order(res$padj),]
  DEG <- as.data.frame(resOrdered)
  
  project <- NULL
  tumourNum <- NULL
  normalNum <- NULL
  lncRNA.diff <- NULL
  target.diff <- NULL
  diff.table <- NULL
  jsonHeatmap <- NULL
  scatterplotdata <- NULL
  lncRNA.cancer.json <- NULL
  lncRNA.normal.json <- NULL
  lncRNA.yrange <- NULL
  target.cancer.json <- NULL
  target.normal.json <- NULL
  target.yrange <- NULL
  if(lncRNA != "" & target != ""){
    ## 差异表达表格 返回diff.table
    lncRNA.diff <- round(DEG[rownames(DEG) == lncRNA,c("baseMean","log2FoldChange","padj")],digits = 2)
    target.diff <- round(DEG[rownames(DEG) == target,c("baseMean","log2FoldChange","padj")],digits = 2)
    ## diff.table <- rbind.data.frame(lncRNA.diff,target.diff)
    lncRNA.diff <- toJSON(lncRNA.diff)
    target.diff <- toJSON(target.diff)
    ## 相关性 返回jsonHeatmap
    lncRNA.expression <- as.numeric(exprSet[rownames(exprSet)==lncRNA,])
    target.expression <- as.numeric(exprSet[rownames(exprSet)==target,])
    correlation <- cor(lncRNA.expression,target.expression)
    correlation.p <- cor.test(lncRNA.expression,target.expression)$p.value
    ##{"z":[[0,0.702,0.893,0.504,0.516,0.901,0.628,0.902,0.583,0.891,0.818,0.559,0.39,0.804,0.838,0.486,0.597,0.026,0.119,0.568,0.897],[0.104,-0.022,0.006,-0.099,0.048,0.01,0.021,-0.005,0.032,0.01,-0.01,-0.03,-0.037,-0.011,-0.01,0.031,0.033,0.109,-0.125,-0.025,0.006]],"x":["BRCA","CESC","COAD","DLBC","ESCA","GBM","HNSC","KIRC","KIRP","LAML","LGG","LIHC","LUAD","LUSC","OV","PRAD","SARC","STAD","TGCT","THCA","UCEC"],"y":["correlation p value","LINC00313_miR-4429 PCC"],"type":"heatmap","zmin":-1,"zmid":0,"zmax":1,"colorscale":[["-1","#c4463a"],["0","#fffbbc"],["0.9","#c4463a"],["1","#3060cf"]]}
    x <- list(substring(basename(filepath),1,nchar(basename(filepath))-4)) 
    #x <- "test"
    y <- c("correlation p value",paste(paste(lncRNA,target,sep="_"),"PCC",sep=" "))
    z <- list(list(correlation.p),list(correlation))
    testHeatmap <- list(z=z,
                        x=x, #TCGA cancer type
                        y=y, #regulator_target
                        type='heatmap',
                        zmin = -1,
                        zmid = 0,
                        zmax = 1, 
                        colorscale= list(c(-1, '#c4463a'),c(0,'#fffbbc'),c(0.9, '#c4463a'),c(1, '#3060cf')) #'YlGnBu'
                        #reversescale=TRUE
    )
    jsonHeatmap <- toJSON(testHeatmap)
    
    ## scatterplot  返回scatterplotdata
    scatterplotdata <- list( x = unname(lncRNA.expression),
                             y = unname(target.expression),  
                             text = group_list1,   
                             name = substring(basename(filepath),1,nchar(basename(filepath))-4),   
                             mode = 'markers',
                             marker = list(size = 10),
                             type = 'scatter')
    scatterplotdata <- toJSON(scatterplotdata)
    
    ## boxplotdata 返回lncRNA和target的boxplotdata
    
    normal.x <- group_list[grep("normal",colnames(exprSet))] 
    cancer.x <- group_list[grep("tumour",colnames(exprSet))]
    
    lncRNA.normal.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==lncRNA),grep("normal",colnames(exprSet))])+1)
    lncRNA.cancer.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==lncRNA),grep("tumour",colnames(exprSet))])+1)
    
    lncRNA.normal.range <- range(boxplot.stats(lncRNA.normal.y)$stats)
    lncRNA.cancer.range <- range(boxplot.stats(lncRNA.cancer.y)$stats)
    lncRNA.yrange <- range(boxplot.stats(c(lncRNA.normal.range,lncRNA.cancer.range))$stats)
    
    lncRNA.cancer <- list( y= lncRNA.cancer.y, x = cancer.x, 
                           name = 'cancer', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='rgb(7,40,89)',size=2),
                           type = 'box')
    lncRNA.normal <- list( y= lncRNA.normal.y, x = normal.x, 
                           name = 'normal', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='#3D9970',size=2),
                           type = 'box')
    
    lncRNA.cancer.json <- toJSON(lncRNA.cancer) # x是向量或者列表
    lncRNA.normal.json <- toJSON(lncRNA.normal)
    lncRNA.yrange <- toJSON(lncRNA.yrange)
    
    target.normal.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==target),grep("normal",colnames(exprSet))])+1)
    target.cancer.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==target),grep("tumour",colnames(exprSet))])+1)
    
    target.normal.range <- range(boxplot.stats(target.normal.y)$stats)
    target.cancer.range <- range(boxplot.stats(target.cancer.y)$stats)
    target.yrange <- range(boxplot.stats(c(target.normal.range,target.cancer.range))$stats)
    
    target.cancer <- list( y= target.cancer.y, x = cancer.x, 
                           name = 'cancer', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='rgb(7,40,89)',size=2),
                           type = 'box')
    target.normal <- list( y= target.normal.y, x = normal.x, 
                           name = 'normal', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='#3D9970',size=2),
                           type = 'box')
    
    target.cancer.json <- toJSON(target.cancer) # x是向量或者列表
    target.normal.json <- toJSON(target.normal)
    target.yrange <- toJSON(target.yrange)
    
  }
  if(lncRNA != "" & target == ""){
    ## 差异表达表格 返回diff.table
    lncRNA.diff <- round(DEG[rownames(DEG) == lncRNA,c("baseMean","log2FoldChange","padj")],digits = 2)
    lncRNA.diff <- toJSON(lncRNA.diff)
    ## boxplotdata 返回lncRNA和target的boxplotdata
    normal.x <- group_list[grep("normal",colnames(exprSet))] 
    cancer.x <- group_list[grep("tumour",colnames(exprSet))]
    
    lncRNA.normal.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==lncRNA),grep("normal",colnames(exprSet))])+1)
    lncRNA.cancer.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==lncRNA),grep("tumour",colnames(exprSet))])+1)
    
    lncRNA.normal.range <- range(boxplot.stats(lncRNA.normal.y)$stats)
    lncRNA.cancer.range <- range(boxplot.stats(lncRNA.cancer.y)$stats)
    lncRNA.yrange <- range(boxplot.stats(c(lncRNA.normal.range,lncRNA.cancer.range))$stats)
    
    lncRNA.cancer <- list( y= lncRNA.cancer.y, x = cancer.x, 
                           name = 'cancer', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='rgb(7,40,89)',size=2),
                           type = 'box')
    lncRNA.normal <- list( y= lncRNA.normal.y, x = normal.x, 
                           name = 'normal', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='#3D9970',size=2),
                           type = 'box')
    
    lncRNA.cancer.json <- toJSON(lncRNA.cancer) # x是向量或者列表
    lncRNA.normal.json <- toJSON(lncRNA.normal)
    lncRNA.yrange <- toJSON(lncRNA.yrange)
  }
  if(lncRNA == "" & target != ""){
    ## 差异表达表格 返回diff.table
    target.diff <- round(DEG[rownames(DEG) == target,c("baseMean","log2FoldChange","padj")],digits = 2)
    target.diff <- toJSON(target.diff)
    
    normal.x <- group_list[grep("normal",colnames(exprSet))] 
    cancer.x <- group_list[grep("tumour",colnames(exprSet))]
    
    target.normal.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==target),grep("normal",colnames(exprSet))])+1)
    target.cancer.y <- log2(as.numeric(exprSet[which(rownames(exprSet)==target),grep("tumour",colnames(exprSet))])+1)
    
    target.normal.range <- range(boxplot.stats(target.normal.y)$stats)
    target.cancer.range <- range(boxplot.stats(target.cancer.y)$stats)
    target.yrange <- range(boxplot.stats(c(target.normal.range,target.cancer.range))$stats)
    
    target.cancer <- list( y= target.cancer.y, x = cancer.x, 
                           name = 'cancer', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='rgb(7,40,89)',size=2),
                           type = 'box')
    target.normal <- list( y= target.normal.y, x = normal.x, 
                           name = 'normal', 
                           boxpoints = 'all',
                           pointpos = 0,
                           jitter = 0.6,
                           boxmean = TRUE,
                           marker = list(color='#3D9970',size=2),
                           type = 'box')
    
    target.cancer.json <- toJSON(target.cancer) # x是向量或者列表
    target.normal.json <- toJSON(target.normal)
    target.yrange <- toJSON(target.yrange)
  }
  results <- list(
    lncRNA.diff = lncRNA.diff,
    jsonHeatmap = jsonHeatmap,
    scatterplotdata = scatterplotdata,
    lncRNA.cancer.json = lncRNA.cancer.json,
    lncRNA.normal.json = lncRNA.normal.json,
    lncRNA.yrange = lncRNA.yrange,
    target.cancer.json = target.cancer.json,
    target.normal.json = target.normal.json,
    target.yrange = target.yrange,
    project = substring(basename(filepath),1,nchar(basename(filepath))-4),
    tumourNum = length(which(group_list == "normal")),
    normalNum = length(which(group_list == "tumour")),
    target.diff = target.diff
  )
  return(results)
}