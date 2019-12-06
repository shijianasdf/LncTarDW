string2table = function(data,id){
	var jsonObj = data;
	if (typeof data === "string") {
		jsonObj =data
	}
	resultTable = "<tr>";

	for(var i=0;i<jsonObj.length;i++){
		tempRow = "";
		for(var j=0;j<jsonObj[i].length;j++){
			tempRow = tempRow+"<td>"+jsonObj[i][j]+"</td>";
		}
		resultTable = resultTable+tempRow+"</tr>";
	}
	$(id).append(resultTable);
};
