<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" import="beans.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LncTarD</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/test.css"/>
    <link rel="stylesheet" href="css/loading.css" type="text/css" media="screen" />
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="js/Bootstrap-DataTables-1.10.16/DataTables-1.10.16/css/dataTables.bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/css/buttons.bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="js/Bootstrap-DataTables-1.10.16/Responsive-2.2.1/css/responsive.bootstrap.min.css" type="text/css">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="js/Bootstrap-DataTables-1.10.16/datatables.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/datatables.buttons.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.bootstrap.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.colVis.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.flash.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.html5.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Buttons-1.5.1/js/buttons.print.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/JSZip-2.5.0/jszip.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/pdfmake-0.1.32/pdfmake.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/pdfmake-0.1.32/vfs_fonts.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Responsive-2.2.1/js/dataTables.responsive.min.js"></script>
    <script src="js/Bootstrap-DataTables-1.10.16/Responsive-2.2.1/js/responsive.bootstrap.min.js"></script>
	<!-- plotly.js -->
	<script src="plugins/plotly/plotly-latest.min.js"></script>
	<script src="plugins/A_exPackages/plotlyBoxplot.js"></script>
	<script src="plugins/A_exPackages/plotlyHeatmap.js"></script>
	<script src="plugins/A_exPackages/plotlyScatterPlot.js"></script>
	<style>
		.tdDetailType {
		    padding: 1px 7px;
		    color: #ffffff;
		    background-color: #b5b5b5;
		    border-radius: 15px;
		}
		.titleTd {
		    width: 340px;
		    font-weight: bold;
		    padding: 6px 3px;
		}
		/*  .outline {  
    		width:100%;  
    		word-break:keep-all;/* 不换行 */     
    		white-space:nowrap;/* 不换行 */  
    		overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */  
    		text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/  
		}   */ 
	</style>
	<script>
		regulator = '<s:property value="lncRNA"/>';
    	target = '<s:property value="target"/>';
	</script>
	
</head>
<body>


<div class="fuzzy-advSearch" id="fuzzy"></div>
	      <div class="loading" id="loading">
		  <img alt="loading" title="loading" src="image/index.gif">
        </div>
       <nav  id="navbar" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
           <div class="container">
               <!-- <div id="navbar-image" class="navbar-header">
                    <a class="navbar-brand" href="/LncTarD/">
                       <img alt="Brand" src="image/home.databaseName.new.png" >
                   </a>
               </div> -->
               <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                   <ul class="nav navbar-nav navbar-right">
                       <li class="active"><a href="/LncTarDW/index.jsp">Home</a></li>
                      <!--  <li><a href="/LncTarD/jsp/Browser.jsp">Browser</a></li>
                       <li><a href="/LncTarD/JumpToAdvancedSearch">Search</a></li>
                       <li><a href="/LncTarD/jsp/Download.jsp">Download</a></li>
                       <li><a href="/LncTarD/jsp/Submit.jsp">Submit</a></li>
                       <li><a href="/LncTarD/jsp/Help.jsp">Help</a></li> -->
                   </ul>
               </div>
           </div>

       </nav>
       <div class="navbar-bottom1"></div>
       <div class="navbar-bottom2"></div>
       <div class="navbar-bottom3"></div>
          
     <div class="container" style="margin-top:10px">
        <div class="row">
        	 <h3><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;Detail Search Results</h3>
  		     <hr>
        </div>
       
       <div class="content">

		  <div class="tab-content">
		    
		    <div role="tabpanel" class="tab-pane active" id="home">
		        <div class="row" style="margin-top:20px;">
        	         <div class="col-md-12" style="margin-top:10px;">
        	    <div class="panel panel-default">
				  <div class="panel-heading">
				  	<h4><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;&nbsp;Differential Expression Table</h4>
				  </div>
				  <div class="panel-body">
                      <div id="DiffExpression" >
                         <table id="DiffExpressionTable" width="100%" class="table table-striped table-bordered table-hover">
                         	<thead>
                         	   <tr>
		        		  	 	       <th rowspan="2">DataSet(Tumour VS Normal)</th>
		        		  	 	       <th colspan="3" style="text-align:center;"><strong><s:property value="target"/></strong></th>
		        		  	 	       <th colspan="3" style="text-align:center;"><strong><s:property value="lncRNA"/></strong></th>
	        		  	 	   </tr>
                         	   
	        		  	 	    <tr>
	        		  	 	       <th>Mean Expression</th>
	        		  	 	       <th>log2FoldChange</th>
	        		  	 	       <th>FDR</th>
	        		  	 	       <th>Mean Expression</th>
	        		  	 	       <th>log2FoldChange</th>
	        		  	 	       <th>FDR</th>
	        		  	 	    </tr>
        		  	 	    </thead>
        		  	 	    <tbody>
        		  	 	        	<tr>
	        		  	 	    	    <td></td>
	        		  	 	    	    <td></td>
		        						<td></td>
		        						<td></td> 
		        						<td></td>
		        						<td></td>
		        						<td></td> 
        		  	 	    	    </tr> 
        		  	 	      </tbody>
        		  	 	      </table> 
        		  	 	  <script>
        		  	 	    var lncdiff = <%=(String)request.getAttribute("lncdiff")%>;
        		  	 	    var targetdiff = <%=(String)request.getAttribute("targetdiff")%>;
        		  	 	    var project = <%=(String)request.getAttribute("project")%>;
        		  	 	    var tumourNum = <%=(String)request.getAttribute("tumourNum")%>;
        		  	 	    var normalNum = <%=(String)request.getAttribute("normalNum")%>;
        		  	 	    if(lncdiff != null && targetdiff != null){
        		  	 	    	$("#DiffExpressionTable tbody td").eq(0).html(project+"(" + tumourNum + " vs " + normalNum + ")");
            		  	 	    $("#DiffExpressionTable tbody td").eq(1).html(JSON.parse(targetdiff).baseMean);
            		  	 	    $("#DiffExpressionTable tbody td").eq(4).html(JSON.parse(lncdiff).baseMean);
            		  	 	    $("#DiffExpressionTable tbody td").eq(2).html(JSON.parse(targetdiff).log2FoldChange);
         		  	 	        $("#DiffExpressionTable tbody td").eq(5).html(JSON.parse(lncdiff).log2FoldChange);
         		  	 	        $("#DiffExpressionTable tbody td").eq(3).html(JSON.parse(targetdiff).padj);
     		  	 	            $("#DiffExpressionTable tbody td").eq(6).html(JSON.parse(lncdiff).padj);
        		  	 	    }
        		  	 	    if(lncdiff != null && targetdiff == null){
        		  	 	    	$("#DiffExpressionTable tbody td").eq(0).html(project+"(" + tumourNum + " vs " + normalNum + ")");
            		  	 	    $("#DiffExpressionTable tbody td").eq(1).html("NA");
            		  	 	    $("#DiffExpressionTable tbody td").eq(4).html(JSON.parse(lncdiff).baseMean);
            		  	 	    $("#DiffExpressionTable tbody td").eq(2).html("NA");
         		  	 	        $("#DiffExpressionTable tbody td").eq(5).html(JSON.parse(lncdiff).log2FoldChange);
         		  	 	        $("#DiffExpressionTable tbody td").eq(3).html("NA");
     		  	 	            $("#DiffExpressionTable tbody td").eq(6).html(JSON.parse(lncdiff).padj);
        		  	 	    }
        		  	 	    
        		  	 	    if(lncdiff == null && targetdiff != null){
        		  	 	    	$("#DiffExpressionTable tbody td").eq(0).html(project+"(" + tumourNum + " vs " + normalNum + ")");
            		  	 	    $("#DiffExpressionTable tbody td").eq(1).html(JSON.parse(targetdiff).baseMean);
            		  	 	    $("#DiffExpressionTable tbody td").eq(4).html("NA");
            		  	 	    $("#DiffExpressionTable tbody td").eq(2).html(JSON.parse(targetdiff).log2FoldChange);
         		  	 	        $("#DiffExpressionTable tbody td").eq(5).html("NA");
         		  	 	        $("#DiffExpressionTable tbody td").eq(3).html(JSON.parse(targetdiff).padj);
     		  	 	            $("#DiffExpressionTable tbody td").eq(6).html("NA");
        		  	 	    }
        		  	 	    
        		  	 	    if(lncdiff == null && targetdiff == null){
        		  	 	    	$("#DiffExpressionTable tbody td").eq(0).html(project+"(" + tumourNum + " vs " + normalNum + ")");
            		  	 	    $("#DiffExpressionTable tbody td").eq(1).html("NA");
            		  	 	    $("#DiffExpressionTable tbody td").eq(4).html("NA");
            		  	 	    $("#DiffExpressionTable tbody td").eq(2).html("NA");
         		  	 	        $("#DiffExpressionTable tbody td").eq(5).html("NA");
         		  	 	        $("#DiffExpressionTable tbody td").eq(3).html("NA");
     		  	 	            $("#DiffExpressionTable tbody td").eq(6).html("NA");
        		  	 	    }
        		  	 	    
        		  	 	  </script> 
        		  	 	        
        		  	 </div>
                     <script>
					    $('#DiffExpressionTable').DataTable({
						    responsive: true,
							dom: '<"top"Bf>rt<"bottom"lp><"clear">',  //B代表button，f代表filter input，l代表length changing input control p代表pagination control
							buttons: [
							  	'copy', 'csv', 'excel', 'pdf', 'print'
					    	]
					    });
				    </script>   
				  </div>
				</div> 
        	</div>
        </div>

        <div class="row">
        	<div class="col-md-12">
        		<div class="panel panel-default">
        		     <div class="panel-heading">
        		      <h4><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Boxplot Display</h4>
        		     </div>
        		     <div class="panel-body">
        		             <div id="boxplotTarget"></div>
        		             <div id="boxplotRegulator"></div>
        		     </div>
        		     <script>
						var lnccancerjson = <%=(String)request.getAttribute("lncRNAcancerjson")%>; //
						var lncnormaljson = <%=(String)request.getAttribute("lncRNAnormaljson")%>;
						var lncRNAyrange = <%=(String)request.getAttribute("lncRNAyrange")%>;
						var tarcancerjson = <%=(String)request.getAttribute("targetcancerjson")%>; //
						var tarnormaljson = <%=(String)request.getAttribute("targetnormaljson")%>;
						var targetyrange = <%=(String)request.getAttribute("targetyrange")%>;
						if(lnccancerjson != null){
							var dataRegulator = [JSON.parse(lnccancerjson[0]),JSON.parse(lncnormaljson[0])];
							$RplotlyBoxplot("boxplotRegulator",dataRegulator,regulator,JSON.parse(lncRNAyrange[0]),project); 
						}
						if(tarcancerjson != null){
							var dataTarget = [JSON.parse(tarcancerjson[0]),JSON.parse(tarnormaljson[0])];
							$RplotlyBoxplot("boxplotTarget",dataTarget,target,JSON.parse(targetyrange[0]),project);
						}
						var ticks = document.getElementsByClassName('xtick');
						for (var i = 0; i < ticks.length; i += 1) {
						    if(ticks[i].getElementsByTagName('text')[0].innerHTML.indexOf("*") != -1){
						    	ticks[i].getElementsByTagName('text')[0].style.fill = "red";
						    }
						}
				    </script>
        		</div>
        	</div>
        </div>
 
	     <div class="row" id="heatmapContainer" style="display:none;">
	        	<div class="col-md-12">
	        		<div class="panel panel-default">
	        		     <div class="panel-heading">
	        		      <h4><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Pearson Expression Correlation</h4>
	        		     </div>
	        		     <div class="panel-body">
	        		             <div id="PearsonCorrelationHeatmap"></div>
	        		     </div>
	        		     <script> 
                            var heatmapdata = <%=request.getAttribute("correlationheatmap")%>;
                            if(heatmapdata != null){ //heatmapdata[0].heatmapdata != null
                            	$("#heatmapContainer").show();
                            	var PCC = JSON.parse(heatmapdata[0]).z[1];
                            	var cancertype = JSON.parse(heatmapdata[0]).x;
                            	var max=Math.abs(PCC[0]),max_index=0;
                            	for(var i=0;i<PCC.length;i++)
                            		if(Math.abs(PCC[i])>max){max=Math.abs(PCC[i]);max_index=i;}
                            	var selectedCancer = cancertype[max_index];
                            	var data = [JSON.parse(heatmapdata[0])];
                            	var sigp = data[0].z[0];
                            	var sig_pos = [];
                            	for(var i=0; i < sigp.length; i++){
                            		if(sigp[i] < 0.05){
                            			sig_pos.push(i);
                            		}
                            	}
                                $plotlyHeatmap('PearsonCorrelationHeatmap',data,"Expression Correlation Heatmap");
                                var PearsonCorrelationHeatmap = document.getElementById('PearsonCorrelationHeatmap');
                                var ticks = PearsonCorrelationHeatmap.getElementsByClassName('xtick');
        						for (var i = 0; i < sig_pos.length; i += 1){
        						    var canty = ticks[sig_pos[i]].getElementsByTagName('text')[0].innerHTML;
        						    ticks[sig_pos[i]].getElementsByTagName('text')[0].innerHTML = "*".concat(canty); 
        						    ticks[sig_pos[i]].getElementsByTagName('text')[0].style.fill = "red";
        						}
                            }
					     </script>
	        		</div>
	        	</div>
	        </div>
	        
	         <div class="row" id="scatterplotContainer" style="display:none;">
	        	<div class="col-md-12">
	        		<div class="panel panel-default">
	        		     <div class="panel-heading">
	        		      <h4><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Scatter Plot</h4>
	        		     </div>
	        		     <div class="panel-body">
	        		        
	        		             <div id="ScatterPlot"></div>
	        		     </div>
	        		</div>
	        	</div>
	        	<script>
		        	var scatterdata = <%=request.getAttribute("scatterplot")%>;
		        	if(scatterdata != null){
		        		$("#scatterplotContainer").show();
		    			$RplotlyScatterPlot("ScatterPlot",[JSON.parse(scatterdata[0])],regulator,target,JSON.parse(scatterdata[0]).name);
		        	}
					
	        	</script>
	        </div>
		    
		    </div>
		    
		    
		  
		  </div>
		
		</div>

        
     </div>
       
    <%-- <script>
                var myPlot = document.getElementById('PearsonCorrelationHeatmap');
    			myPlot.on('plotly_click', function(data){ //对ploty图片加点击事件
    				$.ajax({
    		    		type: 'POST',
    		    		dataType:'json',
    		    		data:{
    						regulator:regulator,
    						target:target,
    						cancertype:data.points[0].x
    		    		},
    		    		url: 'ScatterSearch',
    		    		beforeSend:function(){
    		    			$("#fuzzy").css("display","block");
    		    			$("#loading").css("display","block");
    		    		},
    		    		success:function(returnMsg){
    		    			var scatterdata = JSON.parse(returnMsg.scatterdata);
 
    		    			$("#scatterplotContainer").show();
    		    			$plotlyScatterPlot("ScatterPlot",[JSON.parse(scatterdata[0].acc)],scatterdata[0].regulator,scatterdata[0].target,returnMsg.cancertype);
    		    		},
    		    		complete:function(){
    		    			$("#fuzzy").css("display","none");
    		    			$("#loading").css("display","none");
    		    		},
    		    		error:function(){
    		    			alert("error");
    		    		}
    		    	}); 
    			
    			});
	</script> --%>


    
    
        
</body>
</html>