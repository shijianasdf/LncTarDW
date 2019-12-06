vector2array <- function(inputVector, rowCount, colCount){
	idxr <- 0:(rowCount-1)
	idxc <- 0:(colCount-1)
	idx <- sort(paste(rep(idxr, colCount), rep(idxc, rowCount), sep=","))
	result <- paste(idx, inputVector, sep=",")
	result
}

getHeatmapData <- function(data, key, rowCount, colCount){

inputVector <- data[as.character(data[,1])==key, 2:57]
vector2array(inputVector)


}