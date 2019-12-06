function nestTree(expenses){
	var nest = d3.nest()
	.key(function (d) {
	    return d.regulator;
	})
	.key(function (d) {
	    return d.target;
	})
	.key(function (d) {
	    return d.diseasename;
	})
	.key(function (d) {
	    return d.influencedfunction;
	})
	.entries(expenses);
	var nestchange = nest[0];
	//alert(JSON.stringify(nestchange));
	for(var i = 0;i<nestchange.values.length;i++){
		//alert(nestchange.values.length);
		for(var j = 0;j<nestchange.values[i].values.length;j++){
			//alert(nestchange.values[i].values.length);
			for(var k = 0;k<nestchange.values[i].values[j].values.length;k++){
				//alert(nestchange.values[i].values[j].values.length);
				delete nestchange.values[i].values[j].values[k].values;
				//alert(JSON.stringify(nestchange));
			}
		}
	}
	nestchange.name = nestchange.key;
	delete nestchange.key;
	nestchange.children = nestchange.values;
	delete nestchange.values;
	for(var i = 0;i<nestchange.children.length;i++){
		nestchange.children[i].name = nestchange.children[i].key;
		delete nestchange.children[i].key;
		nestchange.children[i].children = nestchange.children[i].values;
		delete nestchange.children[i].values;
	}
	//alert(JSON.stringify(nestchange));
	for(var i = 0;i<nestchange.children.length;i++){
		for(var j = 0;j<nestchange.children[i].children.length;j++){
			nestchange.children[i].children[j].name = nestchange.children[i].children[j].key;
			delete nestchange.children[i].children[j].key;
			nestchange.children[i].children[j].children = nestchange.children[i].children[j].values;
			delete nestchange.children[i].children[j].values;
		}
	}
	//alert(JSON.stringify(nestchange));
	for(var i = 0;i<nestchange.children.length;i++){
		for(var j = 0;j<nestchange.children[i].children.length;j++){
			for(var k = 0;k<nestchange.children[i].children[j].children.length;k++){
				nestchange.children[i].children[j].children[k].name = nestchange.children[i].children[j].children[k].key;
				delete nestchange.children[i].children[j].children[k].key;
				
			}
			
		}
	}
	//alert(JSON.stringify(nestchange));
	return nestchange;
}