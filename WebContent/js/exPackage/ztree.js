//設置ztree，即網頁中顯示的那棵樹
var setting = {
	view: {
		showIcon: false,
		fontCss: getFontCss	//用於查找節點，高亮显示字体
	},
	data: {
		simpleData: {
			enable: true    //数据是否采用简单 Array 格式，默认false 
		}
	},
	callback: {
		onClick: onClick
	}
};
// 查找節點用的函數
// value, 搜索的值
// likely, 是否模糊匹配
function searchNode(key, value, likely) {
	// 获取树对象
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	//alert("search "+key);
	var nodeList;
	//alert(key+"    "+value);
	if(likely)
		nodeList = zTree.getNodesByParamFuzzy(key, value);	//模糊搜索
	else
		nodeList = zTree.getNodesByParam(key, value);	//精確搜索
	if (nodeList.length > 0) {
		// 遍历找到的节点集合
		for (var i = 0, l = nodeList.length; i < l; i++) {
			if (nodeList[i].getParentNode()) {
				// 展开其父节点
				zTree.expandNode(nodeList[i].getParentNode(), true, false, false);
			}
			nodeList[i].highlight = true;
			// 高亮
			zTree.updateNode(nodeList[i]);
		}
	}
	zTree.refresh(); // 很重要，否则节点状态更新混乱。
}
// 重置节点属性，包括
// 取消所有展开
// 取消节点高亮
function resetNodeCss(){
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	// 获取所有节点
	var allNodes = zTree.transformToArray(zTree.getNodes());
	// API文档的例子很坑，写得很不清晰
	// zTree.getNodes()返回的是一个JSON对象，我们使用的时候还需要额外调用transformToArray
	// 将之转化为可用的array才成
	// Traverse all the nodes need to use recursion, or the use of transformToArray() method make the nodes to be a simple array.
    for(var i = 0, l = allNodes.length; i < l; i++){
    	allNodes[i].highlight = false;
        // 取消高亮
        zTree.updateNode(allNodes[i]);
    }
    // 是否展开全部
    zTree.expandAll(false); 
}

function getFontCss(treeId, treeNode) {
	return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
}
//點擊樹節點調用的函數
function onClick(event, treeId, treeNode, clickFlag) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	// 返回被选中节点的JSON对象，包括该结点的所有信息
	// 调用方法如alert
	var nodes = zTree.getSelectedNodes();
	//alert(nodes[0].name);
	// 获取选中节点的id及其父节点的id
	var child = nodes[0].id;
	var parent = nodes[0].pId;
	$.ajax({
		url: "showChild",
		type: "POST",
		data: {
			child: child,
			parent: parent
		},
		dataType: "json",
		success: function(returnMsg) {
			//alert(returnMsg.ajaxResultTable);
			$("#results").html("<div id='results' style='width:100%;padding-top:10px'><table id='testTable'></table></div>");
			//addTitle = "<h5 style='width:97%;margin-top:30px'>Result<span id='targetTypeBtnDiv'><a id='tarTypeHelp'><span class='icon-help' style='margin-right:3px;'></span></a>Target gene type:&nbsp;&nbsp;<input type='button' class='targetType awesome' value='P'/><input type='button' class='targetType awesome disabled' value='B'/><input type='button' class='targetType awesome disabled' value='10'/><input type='button' class='targetType awesome disabled' value='C'/></span></h5>";
			if(returnMsg.parent=="LncRNAs")
				addTitle = "<h5 style='width:97%;margin-top:30px'>Result<span id='targetTypeBtnDiv'><a id='tarTypeHelp'><span class='icon-help' style='margin-right:3px;'></span></a>Target gene type:&nbsp;&nbsp;<input type='button' id='targetP' class='targetType awesome' onclick='querySearch(\"P-type\")' value='P'/><input type='button' id='targetB' class='targetType awesome' onclick='querySearch(\"B-type\")' value='B'/><input type='button' id='target10' class='targetType awesome' onclick='querySearch(\"10-type\")' value='10'/><input type='button' id='targetC' class='targetType awesome' onclick='querySearch(\"C-type\")' value='C'/></span></h5>";
			else
				addTitle = "<h5 style='width:97%;margin-top:30px'>Result<span id='targetTypeBtnDiv'><a id='tarTypeHelp'><span class='icon-help' style='margin-right:3px;'></span></a>Target gene type:&nbsp;&nbsp;<input type='button' id='targetP' class='targetType awesome' value='P'/><input type='button' id='targetB' class='targetType awesome disabled' value='B'/><input type='button' id='target10' class='targetType awesome disabled' value='10'/><input type='button' id='targetC' class='targetType awesome disabled' value='C'/></span></h5>";
			$("#results").prepend(addTitle);
			/*addTitle = "<h5 style='width:97%;margin-top:30px'>Result</h5>";
			$("#results").prepend(addTitle);*/
			var header = "<table id='testTable' class='table tablesorter'><thead><tr><th>ID</th><th>Species</th><th>LncRNA</th><th>Target gene</th><th>Associated Factors</th><th>Epigenetic Modifications</th><th>PMID</th><th>Details</th></tr></thead><tbody></tbody></table>";
			$("#testTable").html(header);
			//alert();
			json2table(returnMsg.ajaxResultTable,'#testTable');
			initTable("testTable", 2, 3, 7);

			if(returnMsg.ajaxNode.length>0){
				$("#nodesCount").html(returnMsg.nodesCount);
				$("#edgeCount").html(returnMsg.edgeCount);
				if(returnMsg.edgeCount<350){
					drawPPI(returnMsg.ajaxNode,returnMsg.ajaxEdge,returnMsg.ajaxDes);
					$("#cytoscapeWebDiv").show();
					$("#networkDesc").hide();
				}else{
					$("#networkDesc").show();
					$("#cytoscapeWebDiv").show();
					$("#cytoscapeWebDivChild").hide();	
				}
			}
			qtip('tarTypeHelp','tarSearchHelp.txt','top left','top right');
			$("#targetP").addClass('targetType awesome visited');
			//alert(returnMsg.initChild);
			resetNodeCss();
			//alert("searching nodes ..."+returnMsg.initChild);
			searchNode("id", returnMsg.initChild, false);
			$("#highlightNodeName").html(returnMsg.initChild);
		}
	});
}
