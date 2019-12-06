function focusLarger(ob){
	ob.style.height='100px';
}
function focusBack(ob){
	ob.style.height='20px';
}


//共计四个函数，分别为toggleCell，toggleRow，toggleCol，toggleAll
//如果用了selected的class属性，那么这次点击就把它变回原来的值

function resetMatrixPram(){
	document.getElementById("geneNames").value="";
	document.getElementById("cellNames").value="";
	document.getElementById("showGeneNum").value=200;
	document.getElementById("showCellLineNum").value=20;
	document.getElementById("organism").value="homo sapiens";
}

function exampleMatrix(){
	document.getElementById("geneNames").value="TP53,AR";
	document.getElementById("cellNames").value="";
	document.getElementById("gene_type").value="protein-coding gene";
	document.getElementById("showGeneNum").value=1000000;
	document.getElementById("showCellLineNum").value=1000000;
	document.getElementById("organism").value="Homo sapiens";
}

function toggleCell(cell){	
	if (cell.className=="cellselected") {
		cell.className = 'cell selectable';
    }else {    
    	cell.className = 'cellselected';
    }		
}

function toggleRow(rowIndex,colNum){
	if(document.getElementById("row_"+rowIndex).className=="headerCell left_header2_selected"){
		document.getElementById("row_"+rowIndex).className="headerCell left_header2";
		for(var i=0;i<colNum;i++){
	        var tmp=document.getElementById("cell_"+rowIndex+"_"+i);
	        if(tmp.className!="cell") tmp.className = 'cell selectable';
		}
	}else{
		document.getElementById("row_"+rowIndex).className="headerCell left_header2_selected";
		for(var i=0;i<colNum;i++){
	        var tmp=document.getElementById("cell_"+rowIndex+"_"+i);
	        if(tmp.className!="cell")  tmp.className = 'cellselected';
		}
	}
	
	
}

function toggleCol(rowNum,colIndex){

	if(document.getElementById("col_"+colIndex).className=="headerCell selected"){
		document.getElementById("col_"+colIndex).className="headerCell ";
		for(var i=0;i<rowNum;i++){
	        var tmp=document.getElementById("cell_"+i+"_"+colIndex);
	        if(tmp.className!="cell") tmp.className = 'cell selectable';
		}
	}else{
		document.getElementById("col_"+colIndex).className="headerCell selected";
		for(var i=0;i<rowNum;i++){
	        var tmp=document.getElementById("cell_"+i+"_"+colIndex);
	        if(tmp.className!="cell")  tmp.className = 'cellselected';
		}
	}	
}

function toggleAll(rowNum,colNum){
	
	if(document.getElementById("organism_matrix").className=="headerCell left_header1_selected"){
		document.getElementById("organism_matrix").className="headerCell left_header1";
		for(var i=0;i<rowNum;i++){
			for(var j=0;j<colNum;j++){
				var tmp=document.getElementById("cell_"+i+"_"+j);
		        if(tmp.className!="cell") tmp.className = 'cell selectable';
			}
		}
	}else{
		document.getElementById("organism_matrix").className="headerCell left_header1_selected";
		for(var i=0;i<rowNum;i++){
			for(var j=0;j<colNum;j++){
				var tmp=document.getElementById("cell_"+i+"_"+j);
		        if(tmp.className!="cell") tmp.className = 'cellselected';
			}
		}
	}	
}

//
function showFilesForDownload(rowNum,colNum,organism,geneType) {
	//遍历所有表格，把标记要下载的id给拼接出来
	var first = true;
	var concatCellIds="";
	var geneNum= {};
	var cellNum= {};
	var sum=0;

	
	for(var i=0;i<rowNum;i++){
		for(var j=0;j<colNum;j++){
			var tmp=document.getElementById("cell_"+i+"_"+j);
	        if(tmp.className=="cellselected" && first) {
	        	concatCellIds+=i+"_"+j;
	        	geneNum[i+'']=1;
	        	cellNum[j+'']=1;
	        	sum+=parseInt(tmp.innerHTML.match(">(\\d+)<")[1]);
	        	
	        	first=false;
	        }
	        else if(tmp.className=="cellselected") {
	        	concatCellIds+=","+i+"_"+j;
	        	geneNum[i+'']=1;
	        	cellNum[j+'']=1;
	        	sum+=parseInt(tmp.innerHTML.match(">(\\d+)<")[1]);
	        }else{
	        	//其它
	        }
	    }
	 }
	
 	 if(concatCellIds == "") {
 	       alert('No datasets have been selected');
 	       return;
 	 }else{
 		document.getElementById('organismSummary').innerHTML=organism;
 		document.getElementById('geneSummary').innerHTML=Object.keys(geneNum).length;
 		document.getElementById('cellSummary').innerHTML=Object.keys(cellNum).length;
 		document.getElementById('sumSummary').innerHTML=sum;
 		document.getElementById('gene_type_2').innerHTML=geneType;
 		document.getElementById('detail').value=concatCellIds;			
 		document.getElementById('overlaySummary').style.display='block'; 		   
 	    return; 			 
 	 }
 	 
 	 
}
	

function concatCellIds() {
    var cellIds = "";
    var key;
    var first = true;
    for (key in selectedCells) {
        if (selectedCells[key] != null && Ext.isPrimitive(selectedCells[key])) {
            if (!first) cellIds += ",";
            first = false;
            cellIds += key;
        }
    }
    var selectedCellsInput = document.getElementById("selectedCells");
    selectedCellsInput.value = cellIds;
    return cellIds;
}





