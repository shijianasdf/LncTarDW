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
				  	<h4><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;&nbsp;Differential Expression Across TCGA</h4>
				  </div>
				  <div class="panel-body">
                      <div id="DiffExpression" >
                         <table id="DiffExpressionTable" width="100%" class="table table-striped table-bordered table-hover">
                         	<thead>
                         	   <tr>
		        		  	 	       <th rowspan="2">Cancer Type(Tumour VS Normal)</th>
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
        		  	 	        <s:if test="%{#difftarexp.get(0) != null && #diffregexp.get(0) != null}">
        		  	 	        	<tr>
        		  	 	    	    <td>BLCA(414 vs 19)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getBlca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBlcapadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getBlca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBlcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA(1142 vs 114)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getBrca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBrcapadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getBrca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBrcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC(306 vs 3)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getCesc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCescpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getCesc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCescpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL(36 vs 9)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getChol()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCholpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getChol()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCholpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD(505 vs 41)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getCoad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCoadpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getCoad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCoadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA(185 vs 13)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getEsca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getEscapadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getEsca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getEscapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM(170 vs 5)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getGbm()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getGbmpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getGbm()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getGbmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC(522 vs 44)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getHnsc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getHnscpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getHnsc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getHnscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH(66 vs 25)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getKich()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKichpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getKich()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKichpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC(546 vs 72)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getKirc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKircpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getKirc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKircpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP(291 vs 32)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getKirp()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKirppadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getKirp()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirppadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC(374 vs 50)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getLihc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLihcpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getLihc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLihcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD(542 vs 59)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getLuad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLuadpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getLuad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC(504 vs 51)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getLusc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLuscpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getLusc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD(179 vs 4)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getPaad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPaadpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getPaad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPaadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG(184 vs 3)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getPcpg()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPcpgpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getPcpg()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPcpgpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD(506 vs 52)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getPrad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPradpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getPrad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPradpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ(167 vs 10)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getRead()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getReadpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getRead()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getReadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC(263 vs 2)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getSarc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSarcpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getSarc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSarcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM(472 vs 1)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getSkcm()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSkcmpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getSkcm()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSkcmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD(416 vs 37)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getStad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getStadpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getStad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getStadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA(513 vs 59)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getThca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThcapadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getThca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM(120 vs 2)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getThym()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThympadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getThym()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThympadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC(558 vs 35)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getUcec()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getUcecpadj()"/></td> 
	        						<td><s:property value="#diffregexp.get(0).getUcec()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getUcecpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	        </s:if> 
        		  	 	        
        		  	 	        
        		  	 	        <s:elseif test="%{#difftarexp.get(0) != null}">
        		  	 	        <tr>
        		  	 	    	    <td>BLCA(414 vs 19)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getBlca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBlcapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA(1142 vs 114)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getBrca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getBrcapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC(306 vs 3)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getCesc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCescpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL(36 vs 9)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getChol()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCholpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD(505 vs 41)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getCoad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getCoadpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA(185 vs 13)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getEsca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getEscapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM(170 vs 5)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getGbm()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getGbmpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC(522 vs 44)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getHnsc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getHnscpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH(66 vs 25)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getKich()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKichpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC(546 vs 72)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getKirc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKircpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP(291 vs 32)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getKirp()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getKirppadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC(374 vs 50)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getLihc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLihcpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD(542 vs 59)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getLuad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLuadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC(504 vs 51)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getLusc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getLuscpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD(179 vs 4)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getPaad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPaadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG(184 vs 3)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getPcpg()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPcpgpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD(506 vs 52)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getPrad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getPradpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ(167 vs 10)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getRead()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getReadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC(263 vs 2)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getSarc()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSarcpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM(472 vs 1)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getSkcm()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getSkcmpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD(416 vs 37)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getStad()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getStadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA(513 vs 59)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getThca()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThcapadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM(120 vs 2)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getThym()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getThympadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC(558 vs 35)</td>
        		  	 	    	    <td><s:property value="#difftarexp.get(0).getUcec()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#difftarexp.get(0).getUcecpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	</s:elseif>
        		  	 	        
        		  	 	        <s:elseif test="%{#diffregexp.get(0) != null}">
        		  	 	    		<tr>
        		  	 	    	    <td>BLCA(414 vs 19)</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getBlca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBlcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA(1142 vs 114)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getBrca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBrcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC(306 vs 3)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getCesc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCescpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL(36 vs 9)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getChol()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCholpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD(505 vs 41)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getCoad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCoadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA(185 vs 13)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getEsca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getEscapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM(170 vs 5)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getGbm()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getGbmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC(522 vs 44)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getHnsc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getHnscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH(66 vs 25)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getKich()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKichpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC(546 vs 72)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getKirc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKircpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP(291 vs 32)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getKirp()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirppadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC(374 vs 50)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getLihc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLihcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD(542 vs 59)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getLuad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC(504 vs 51)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getLusc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD(179 vs 4)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getPaad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPaadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG(184 vs 3)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getPcpg()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPcpgpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD(506 vs 52)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getPrad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPradpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ(167 vs 10)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getRead()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getReadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC(263 vs 2)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getSarc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSarcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM(472 vs 1)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getSkcm()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSkcmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD(416 vs 37)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getStad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getStadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA(513 vs 59)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getThca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM(120 vs 2)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getThym()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThympadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC(558 vs 35)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getUcec()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getUcecpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	</s:elseif>
        		  	 	        
        		  	 	       
        		  	 	        
        		  	 	        
        		  	 	        
        		  	 	        
        		  	 	        <%-- <s:if test="%{#diffexpression.size == 2}">	
        		  	 	    	<tr>
        		  	 	    	    <td>BLCA</td>
        		  	 	    	    <td><s:property value="#diffregexp.get(0).getBlca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getBlca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBlcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getBrca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getBrca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBrcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCesc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCescpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getCesc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCescpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getChol()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCholpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getChol()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCholpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCoad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getCoad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCoadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getEsca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getEsca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getEscapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getGbm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getGbm()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getGbmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getHnsc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnscpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getHnsc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getHnscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKich()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getKich()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKichpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKircpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getKirc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKircpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirp()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirppadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getKirp()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirppadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLihc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihcpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getLihc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLihcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLuad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getLuad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLusc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuscpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getLusc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPaad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getPaad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPaadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPcpg()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpgpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getPcpg()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPcpgpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPrad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getPrad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPradpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getRead()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getRead()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getReadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSarc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarcpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getSarc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSarcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSkcm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getSkcm()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSkcmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getStad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getStad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getStadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getThca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThym()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThympadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getThym()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThympadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getUcec()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUcecpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getUcec()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getUcecpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	</s:if>  --%>
        		  	 	    	
        		  	 	    	<%-- <s:elseif test="%{#diffexpression.get(0) != null}">
        		  	 	    		<tr>
        		  	 	    	    <td>BLCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getBlca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getBrca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCesc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCescpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getChol()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCholpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCoad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getEsca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getGbm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getHnsc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnscpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKich()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKircpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirp()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirppadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLihc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihcpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLuad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLusc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuscpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPaad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPcpg()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpgpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPrad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getRead()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSarc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarcpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSkcm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getStad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcapadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThym()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThympadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getUcec()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUcecpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	</s:elseif> --%>
        		  	 	        
        		  	 	        <s:elseif test="%{#difftarexp.get(0) == null && #diffregexp.get(0) == null}">
        		  	 	    		<tr>
        		  	 	    	    <td>BLCA(414 vs 19)</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA(1142 vs 114)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC(306 vs 3)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL(36 vs 9)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD(505 vs 41)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA(185 vs 13)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM(170 vs 5)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC(522 vs 44)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH(66 vs 25)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC(546 vs 72)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP(291 vs 32)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC(374 vs 50)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD(542 vs 59)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC(504 vs 51)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD(179 vs 4)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG(184 vs 3)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD(506 vs 52)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ(167 vs 10)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC(263 vs 2)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM(472 vs 1)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD(416 vs 37)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA(513 vs 59)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM(120 vs 2)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC(558 vs 35)</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	</s:elseif>
        		  	 	        
        		  	 	        <%-- <s:elseif test="%{#difftarexp.get(0) == null && #diffregexp.get(0) != null}">
        		  	 	    		<tr>
        		  	 	    	    <td>BLCA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getBlca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBlcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getBrca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getBrcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getCesc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCescpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getChol()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCholpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getCoad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getCoadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getEsca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getEscapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getGbm()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getGbmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getHnsc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getHnscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getKich()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKichpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getKirc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKircpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getKirp()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getKirppadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getLihc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLihcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getLuad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getLusc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getLuscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getPaad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPaadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getPcpg()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPcpgpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getPrad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getPradpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffregexp.get(0).getRead()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getReadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getSarc()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSarcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getSkcm()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getSkcmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getStad()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getStadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getThca()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getThym()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getThympadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffregexp.get(0).getUcec()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffregexp.get(0).getUcecpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	</s:elseif> --%>
        		  	 	        
        		  	 	        <%-- <s:if test="%{#diffexpression.size == 2}">	
        		  	 	    	<tr>
        		  	 	    	    <td>BLCA</td>
        		  	 	    	    <td><s:property value="#diffregexp.get(0).getBlca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getBlca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBlcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getBrca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getBrca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBrcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCesc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCescpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getCesc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCescpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getChol()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCholpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getChol()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCholpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCoad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getCoad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCoadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getEsca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getEsca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getEscapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getGbm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getGbm()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getGbmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getHnsc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnscpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getHnsc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getHnscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKich()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getKich()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKichpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKircpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getKirc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKircpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirp()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirppadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getKirp()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirppadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLihc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihcpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getLihc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLihcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLuad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getLuad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLusc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuscpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getLusc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPaad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getPaad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPaadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPcpg()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpgpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getPcpg()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPcpgpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPrad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getPrad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPradpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getRead()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getRead()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getReadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSarc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarcpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getSarc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSarcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSkcm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getSkcm()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSkcmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getStad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getStad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getStadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcapadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getThca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThym()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThympadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getThym()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThympadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getUcec()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUcecpadj()"/></td> 
	        						<td><s:property value="#diffexpression.get(1).getUcec()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getUcecpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	</s:if> --%>
        		  	 	    	<%-- <s:elseif test="%{#diffexpression.get(0) != null}">
        		  	 	    		<tr>
        		  	 	    	    <td>BLCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getBlca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBlcapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getBrca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getBrcapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCesc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCescpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getChol()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCholpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getCoad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getCoadpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getEsca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getEscapadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getGbm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getGbmpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getHnsc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getHnscpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKich()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKichpadj()"/></td> 
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKircpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getKirp()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getKirppadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLihc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLihcpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLuad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getLusc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getLuscpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPaad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPaadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPcpg()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPcpgpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getPrad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getPradpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getRead()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getReadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSarc()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSarcpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getSkcm()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getSkcmpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getStad()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getStadpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThca()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThcapadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getThym()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getThympadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC</td>
        		  	 	    	    <td><s:property value="#diffexpression.get(0).getUcec()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(0).getUcecpadj()"/></td> 
	        						<td>NA</td> 
	        						<td>NA</td> 
	        						<td>NA</td>  
        		  	 	    	</tr>
        		  	 	    	</s:elseif> --%>
        		  	 	    	<%-- <s:elseif test="%{#diffexpression.get(1) != null}">
        		  	 	    		<tr>
        		  	 	    	    <td>BLCA</td>
        		  	 	    	    <td>NA</td>
	        						<td>NA</td>
	        						<td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getBlca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBlcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBlcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>BRCA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getBrca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBrcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getBrcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CESC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getCesc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCesclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCescpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>CHOL</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getChol()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getChollog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCholpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>COAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getCoad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCoadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getCoadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>ESCA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getEsca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getEscalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getEscapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>GBM</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getGbm()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getGbmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getGbmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>HNSC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getHnsc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getHnsclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getHnscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KICH</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getKich()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKichlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKichpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KIRC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getKirc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKircpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>KRIP</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getKirp()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirplog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getKirppadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LIHC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getLihc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLihclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLihcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getLuad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>LUSC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getLusc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLusclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getLuscpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PAAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getPaad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPaadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPaadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PCPG</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getPcpg()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPcpglog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPcpgpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>PRAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getPrad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPradlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getPradpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>READ</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
	        						<td><s:property value="#diffexpression.get(1).getRead()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getReadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getReadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SARC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getSarc()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSarclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSarcpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>SKCM</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getSkcm()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSkcmlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getSkcmpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>STAD</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getStad()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getStadlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getStadpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THCA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getThca()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThcalog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThcapadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>THYM</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getThym()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThymlog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getThympadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	<tr>
        		  	 	    	    <td>UCEC</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td>
        		  	 	    	    <td>NA</td> 
	        						<td><s:property value="#diffexpression.get(1).getUcec()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getUceclog2foldchange()"/></td>
	        						<td><s:property value="#diffexpression.get(1).getUcecpadj()"/></td> 
        		  	 	    	</tr>
        		  	 	    	</s:elseif> --%>
        		  	 	    
        		  	 	    </tbody>
                         </table>
                      <%--    
        		  	 	 <table id="DiffExpressionTable" width="100%" class="table table-striped table-bordered table-hover">
        		  	 	 <thead>
        		  	 	    <tr>
        		  	 	       <th>Gene</th>
        		  	 	       <th>Cancer</th>
        		  	 	       <th>Mean Expression</th>
        		  	 	       <th>log2(Fold Change)</th>
        		  	 	       <th>p.adj</th>
        		  	 	    </tr>
        		  	 	 </thead>
        				<tbody>
        				 <s:if test="%{#diffexpression.size == 2}">					
						    <tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td><s:property value="#diffexpression.get(0).getGenename()"/></td>
        						<td>BLCA</td>
        						<td><s:property value="#diffexpression.get(0).getBlca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBlcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBlcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>BLCA</td>
        						<td><s:property value="#diffexpression.get(1).getBlca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBlcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBlcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>BRCA</td>
        						<td><s:property value="#diffexpression.get(0).getBrca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBRcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBRcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>BRCA</td>
        						<td><s:property value="#diffexpression.get(1).getBrca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBRcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBRcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>CESC</td>
        						<td><s:property value="#diffexpression.get(0).getCesc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCesclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCescpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>CESC</td>
        						<td><s:property value="#diffexpression.get(1).getCesc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCesclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCescpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>CHOL</td>
        						<td><s:property value="#diffexpression.get(0).getChol()"/></td>
        						<td><s:property value="#diffexpression.get(0).getChollog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCholpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>CHOL</td>
        						<td><s:property value="#diffexpression.get(1).getChol()"/></td>
        						<td><s:property value="#diffexpression.get(1).getChollog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCholpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>COAD</td>
        						<td><s:property value="#diffexpression.get(0).getCoad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCoadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCoadpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>COAD</td>
        						<td><s:property value="#diffexpression.get(1).getCoad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCoadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCoadpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>ESCA</td>
        						<td><s:property value="#diffexpression.get(0).getEsca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getEscalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getEscapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>ESCA</td>
        						<td><s:property value="#diffexpression.get(1).getEsca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getEscalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getEscapadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>GBM</td>
        						<td><s:property value="#diffexpression.get(0).getGbm()"/></td>
        						<td><s:property value="#diffexpression.get(0).getGbmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getGbmpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>GBM</td>
        						<td><s:property value="#diffexpression.get(1).getGbm()"/></td>
        						<td><s:property value="#diffexpression.get(1).getGbmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getGbmpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>HNSC</td>
        						<td><s:property value="#diffexpression.get(0).getHnsc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getHnsclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getHnscpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>HNSC</td>
        						<td><s:property value="#diffexpression.get(1).getHnsc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getHnsclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getHnscpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>KICH</td>
        						<td><s:property value="#diffexpression.get(0).getKich()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKichlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKichpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>KICH</td>
        						<td><s:property value="#diffexpression.get(1).getKich()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKichlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKichpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>KIRC</td>
        						<td><s:property value="#diffexpression.get(0).getKirc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKirclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKircpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>KIRC</td>
        						<td><s:property value="#diffexpression.get(1).getKirc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKirclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKircpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>KRIP</td>
        						<td><s:property value="#diffexpression.get(0).getKirp()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKirplog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKirppadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>KRIP</td>
        						<td><s:property value="#diffexpression.get(1).getKirp()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKirplog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKirppadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>LIHC</td>
        						<td><s:property value="#diffexpression.get(0).getLihc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLihclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLihcpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>LIHC</td>
        						<td><s:property value="#diffexpression.get(1).getLihc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLihclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLihcpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>LUAD</td>
        						<td><s:property value="#diffexpression.get(0).getLuad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLuadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLuadpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>LUAD</td>
        						<td><s:property value="#diffexpression.get(1).getLuad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLuadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLuadpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>LUSC</td>
        						<td><s:property value="#diffexpression.get(0).getLusc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLusclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLuscpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>LUSC</td>
        						<td><s:property value="#diffexpression.get(1).getLusc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLusclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLuscpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>PAAD</td>
        						<td><s:property value="#diffexpression.get(0).getPaad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPaadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPaadpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>PAAD</td>
        						<td><s:property value="#diffexpression.get(1).getPaad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPaadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPaadpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>PCPG</td>
        						<td><s:property value="#diffexpression.get(0).getPcpg()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPcpglog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPcpgpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>PCPG</td>
        						<td><s:property value="#diffexpression.get(1).getPcpg()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPcpglog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPcpgpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>PRAD</td>
        						<td><s:property value="#diffexpression.get(0).getPrad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPradlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPradpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>PRAD</td>
        						<td><s:property value="#diffexpression.get(1).getPrad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPradlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPradpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>READ</td>
        						<td><s:property value="#diffexpression.get(0).getRead()"/></td>
        						<td><s:property value="#diffexpression.get(0).getReadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getReadpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>READ</td>
        						<td><s:property value="#diffexpression.get(1).getRead()"/></td>
        						<td><s:property value="#diffexpression.get(1).getReadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getReadpadj()"/></td>
        					</tr>	
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>SARC</td>
        						<td><s:property value="#diffexpression.get(0).getSarc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSarclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSarcpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>SARC</td>
        						<td><s:property value="#diffexpression.get(1).getSarc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSarclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSarcpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>SKCM</td>
        						<td><s:property value="#diffexpression.get(0).getSkcm()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSkcmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSkcmpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>SKCM</td>
        						<td><s:property value="#diffexpression.get(1).getSkcm()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSkcmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSkcmpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>STAD</td>
        						<td><s:property value="#diffexpression.get(0).getStad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getStadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getStadpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>STAD</td>
        						<td><s:property value="#diffexpression.get(1).getStad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getStadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getStadpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>THCA</td>
        						<td><s:property value="#diffexpression.get(0).getThca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>THCA</td>
        						<td><s:property value="#diffexpression.get(1).getThca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>THYM</td>
        						<td><s:property value="#diffexpression.get(0).getThym()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThymlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThympadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>THYM</td>
        						<td><s:property value="#diffexpression.get(1).getThym()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThymlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThympadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>UCEC</td>
        						<td><s:property value="#diffexpression.get(0).getUcec()"/></td>
        						<td><s:property value="#diffexpression.get(0).getUceclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getUcecpadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>UCEC</td>
        						<td><s:property value="#diffexpression.get(1).getUcec()"/></td>
        						<td><s:property value="#diffexpression.get(1).getUceclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getUcecpadj()"/></td>
        					</tr>
                           </s:if>
	                  
	                      
	                     <s:elseif test="%{#diffexpression.get(0) != null}">
	                               	<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>BLCA</td>
        						<td><s:property value="#diffexpression.get(0).getBlca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBlcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBlcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>BRCA</td>
        						<td><s:property value="#diffexpression.get(0).getBrca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBRcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getBRcapadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>CESC</td>
        						<td><s:property value="#diffexpression.get(0).getCesc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCesclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCescpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>CHOL</td>
        						<td><s:property value="#diffexpression.get(0).getChol()"/></td>
        						<td><s:property value="#diffexpression.get(0).getChollog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCholpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>COAD</td>
        						<td><s:property value="#diffexpression.get(0).getCoad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCoadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getCoadpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>ESCA</td>
        						<td><s:property value="#diffexpression.get(0).getEsca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getEscalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getEscapadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>GBM</td>
        						<td><s:property value="#diffexpression.get(0).getGbm()"/></td>
        						<td><s:property value="#diffexpression.get(0).getGbmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getGbmpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>HNSC</td>
        						<td><s:property value="#diffexpression.get(0).getHnsc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getHnsclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getHnscpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>KICH</td>
        						<td><s:property value="#diffexpression.get(0).getKich()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKichlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKichpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>KIRC</td>
        						<td><s:property value="#diffexpression.get(0).getKirc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKirclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKircpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>KRIP</td>
        						<td><s:property value="#diffexpression.get(0).getKirp()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKirplog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getKirppadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>LIHC</td>
        						<td><s:property value="#diffexpression.get(0).getLihc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLihclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLihcpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>LUAD</td>
        						<td><s:property value="#diffexpression.get(0).getLuad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLuadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLuadpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>LUSC</td>
        						<td><s:property value="#diffexpression.get(0).getLusc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLusclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getLuscpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>PAAD</td>
        						<td><s:property value="#diffexpression.get(0).getPaad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPaadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPaadpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>PCPG</td>
        						<td><s:property value="#diffexpression.get(0).getPcpg()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPcpglog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPcpgpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>PRAD</td>
        						<td><s:property value="#diffexpression.get(0).getPrad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPradlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getPradpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>READ</td>
        						<td><s:property value="#diffexpression.get(0).getRead()"/></td>
        						<td><s:property value="#diffexpression.get(0).getReadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getReadpadj()"/></td>
        					</tr>
        						
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>SARC</td>
        						<td><s:property value="#diffexpression.get(0).getSarc()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSarclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSarcpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>SKCM</td>
        						<td><s:property value="#diffexpression.get(0).getSkcm()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSkcmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getSkcmpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>STAD</td>
        						<td><s:property value="#diffexpression.get(0).getStad()"/></td>
        						<td><s:property value="#diffexpression.get(0).getStadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getStadpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>THCA</td>
        						<td><s:property value="#diffexpression.get(0).getThca()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThcapadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>THYM</td>
        						<td><s:property value="#diffexpression.get(0).getThym()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThymlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getThympadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(0).getGene()"/></td>
        						<td>UCEC</td>
        						<td><s:property value="#diffexpression.get(0).getUcec()"/></td>
        						<td><s:property value="#diffexpression.get(0).getUceclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(0).getUcecpadj()"/></td>
        					</tr>
        					
	                           </s:elseif>
	                     <s:elseif test="%{#diffexpression.get(1) != null}">
	                               
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>BLCA</td>
        						<td><s:property value="#diffexpression.get(1).getBlca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBlcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBlcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>BRCA</td>
        						<td><s:property value="#diffexpression.get(1).getBrca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBRcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getBRcapadj()"/></td>
        					</tr>
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>CESC</td>
        						<td><s:property value="#diffexpression.get(1).getCesc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCesclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCescpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>CHOL</td>
        						<td><s:property value="#diffexpression.get(1).getChol()"/></td>
        						<td><s:property value="#diffexpression.get(1).getChollog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCholpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>COAD</td>
        						<td><s:property value="#diffexpression.get(1).getCoad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCoadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getCoadpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>ESCA</td>
        						<td><s:property value="#diffexpression.get(1).getEsca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getEscalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getEscapadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>GBM</td>
        						<td><s:property value="#diffexpression.get(1).getGbm()"/></td>
        						<td><s:property value="#diffexpression.get(1).getGbmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getGbmpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>HNSC</td>
        						<td><s:property value="#diffexpression.get(1).getHnsc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getHnsclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getHnscpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>KICH</td>
        						<td><s:property value="#diffexpression.get(1).getKich()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKichlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKichpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>KIRC</td>
        						<td><s:property value="#diffexpression.get(1).getKirc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKirclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKircpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>KRIP</td>
        						<td><s:property value="#diffexpression.get(1).getKirp()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKirplog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getKirppadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>LIHC</td>
        						<td><s:property value="#diffexpression.get(1).getLihc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLihclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLihcpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>LUAD</td>
        						<td><s:property value="#diffexpression.get(1).getLuad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLuadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLuadpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>LUSC</td>
        						<td><s:property value="#diffexpression.get(1).getLusc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLusclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getLuscpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>PAAD</td>
        						<td><s:property value="#diffexpression.get(1).getPaad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPaadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPaadpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>PCPG</td>
        						<td><s:property value="#diffexpression.get(1).getPcpg()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPcpglog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPcpgpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>PRAD</td>
        						<td><s:property value="#diffexpression.get(1).getPrad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPradlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getPradpadj()"/></td>
        					</tr>
        					
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>READ</td>
        						<td><s:property value="#diffexpression.get(1).getRead()"/></td>
        						<td><s:property value="#diffexpression.get(1).getReadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getReadpadj()"/></td>
        					</tr>	
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>SARC</td>
        						<td><s:property value="#diffexpression.get(1).getSarc()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSarclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSarcpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>SKCM</td>
        						<td><s:property value="#diffexpression.get(1).getSkcm()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSkcmlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getSkcmpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>STAD</td>
        						<td><s:property value="#diffexpression.get(1).getStad()"/></td>
        						<td><s:property value="#diffexpression.get(1).getStadlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getStadpadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>THCA</td>
        						<td><s:property value="#diffexpression.get(1).getThca()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThcalog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThcapadj()"/></td>
        					</tr>
        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>THYM</td>
        						<td><s:property value="#diffexpression.get(1).getThym()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThymlog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getThympadj()"/></td>
        					</tr>        					
        					<tr>
        						<td><s:property value="#diffexpression.get(1).getGene()"/></td>
        						<td>UCEC</td>
        						<td><s:property value="#diffexpression.get(1).getUcec()"/></td>
        						<td><s:property value="#diffexpression.get(1).getUceclog2foldchange()"/></td>
        						<td><s:property value="#diffexpression.get(1).getUcecpadj()"/></td>
        					</tr>
	                           </s:elseif>

                           <s:if test="%{#diffexpression.size() == 0}">
                               	<div id="noResults" class="row" style="margin-top:20px">
       			                     <h3><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;Advanced Search Results</h3>
  		                             <hr>
					  		         <div class="alert alert-danger" role="alert" style="text-align:center;">
											found no result in TCGA different expression
								     </div>
  		    					</div>
                           </s:if>
                            
               			</tbody>
        			</table> 
        		  	 --%>
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
        <s:if test="%{#difftarexp.size !=0 || #diffregexp.size !=0}">
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
						var regboxdata = <%=(String)request.getAttribute("regboxdata")%>; 
						/*ENSG00000185186, LINC00313,{"y":[0.193077821546367,0.624013838870167,0,0,0.111119474391875,0.119302253437083,0.151687397231678,0.186262201692154,0.790390882525864,1.34778526181587,0.347475854307556,0.739483495368404,0.178742937158501,1.98334242521517,0.0316100317321399,1.62191073602386,0.153956405897103,0.0259849808193475,0.248817032718922,2.58090547352307,1.96951780709324,0.279528705147285,3.97165390727909,0,3.52762300410261,0,0.107355509076194,0.0582792240442162,0.221691513510904,1.21110566961748,0,0.763341881479852,1.73825291351967,4.0130173230107,3.37570187604246,0.165344715676452,0.0836022561998708,0.519271153700773,0.0743259446187966,0.100082697498095,0.40328234012048,0.674702888284661,0.388584343388806,0.570731529037006,1.73910712741914,0.159724759587419,2.39251086834399,0,0.207984032082834,0,2.16269439884076,0,0.159308838377456,2.70688413801626,2.46128809025974,0.226806162851242,0.707103326453441,0.174026806200496,0.455103237460613,0.0856098423541531,0.216469765414656,0.89782667967617,0.947164913190708,0.14765264357779,0.467859572458511,1.0083611012421,0.11187784581827,2.88313494895496,0.732799718451865,1.85029189077993,0.747536409571498,1.6898631552246,0.780432733409482,0.458999689783316,0.355644190565721,3.59224759955751,0.711886033228395,0.534609881753708,1.64894672127875,3.36083339222564,1.89964781342769,0.725408480436698,0.576175752787187,0.546254903362666,0.405349591141337,0.367883969980016,2.04263768418787,3.30524635142213,0.840422304055819,0.984983007489173,1.47420758222456,0.477939630745039,0.390793131848246,1.18909077175452,3.63900752069003,1.64767323890629,1.23286824438996,0.93394716161795,1.18675275368308,0.872555281357504,2.14115187622011,1.12019930126071,2.05186834522572,0.940891318338799,0.570360918679237,1.1655884817956,0.364599549105081,0.784890297079337,0.565229631722181,0.863414387437526,0.528712331043769,1.14127654500492,0.39378564125911,0.440158417718707,1.58447074645153,0.396509267327472,0.12563219178591,0.862578346870579,0.520451416445053,1.94508217734406,1.8013176128732,0.480892118600135,0,0.431455014352487,0.731398760636322,0.397813145556248,2.01731050322874,2.47292106078751,0.89039797293102,4.49144741757187,0.0378409998766639,0.0355022959694326,1.86911769227467,0.54067841873045,0.733995492341467,1.4310313200787,0.429410397313229,1.42747584165535,0.730678557681227,0.562107192321405,0.690416201530614,0.417039652093578,1.14485751062575,2.63960726150767,0,3.26409950297287,2.62067085842167,2.08047347775344,0.983791500791428,1.00841876128631,1.80190609723079,0.326143026640287,0.211450481845576,0,1.98462872090912,3.43492974440808,1.60970343642945,2.59545448772921,0.784266347926634,2.11269646346251,2.08972253755127,1.59611889459193,3.42701905343428,0.352994172345402,3.0039385864622,0.499595088221681,0.965761386024674,0.705617990056957,2.14959105616372,1.07994971644815,0.892158077435546,0.848387984200128,3.56648274800134,0.953180295398836,2.83790250283629,0.507480168165372,1.35664303157837,0.452687464852666,2.56836245141019,1.18089448226498,1.37052041761426,0.690277624545454,2.02936807084816,0.231038255547702,0.400976136292364,1.36857728059956,2.31452513200463,0.190822289990005,0.29361932910846,0.88583601702075,0.883253253656889,1.00318123930032,0.433634964693547,0.299321099262709,1.1797931921747,0.583962847703023,2.66708371713482,0.748422932377291,0.215589764856633,2.54718056346169,0.666184580555991,0.287762341637313,1.39216242778592,0.583164744861771,0.543309484093988,2.5631434836783,2.33385587638639,0.280341345338195,0.800641014504824,0.0580514171592739,0.238241099764463,0.732358385476497,1.14322164350775,0.154541473852048,1.68359001653602,1.97655628773424,2.05432442832285,1.36539971372748,1.78032395892916,2.23525588630832,0.849507819054558,1.32463781522447,1.23119091500425,0.126429100860305,3.23141243914927,1.51588096003583,0.457669405644958,0.403891246372095,0.240834521751143,1.16030065122302,0.0729878220213023,0.656791423571898,1.15250729937913,0.724608365307719,0.341669628642798,1.12941293608838,0.409787259612159,0.0981626904435048,0.500120919841507,1.52633879078909,0.70279758660257,0.569334370211686,2.6468515754201,1.01172819741845,1.02298204838719,0.506573711519836,0.518382854861367,0.206779610975742,0.152809824891664,0.225599468894781,0.529497146943765,1.99188478135903,1.94438696348547,2.95530759514996,0.251202204695939,0.406944550754483,0.791924899216969,0.405057626074636,0.666247491995537,1.34396404101111,0.130802141430129,0.425756800991698,2.07503829936024,1.17391606179124,1.56841484259435,0.276545499073254,0.501171091086674,0.361884556246879,1.55530081480223,1.55422045697651,0.423923085796132,2.81380129903979,1.43112816016901,0.83211388860873,2.09179155447185,1.21029534185664,1.37164249468299,1.84749788822642,2.08116643910801,1.0542020186917,1.14626484666679,1.08611524408063,0.630290834182377,1.28666354458528,0.652394526631401,0.0602615924114097,0.296275902715492,0.850741346181665,2.69108118583441,0.250982547014553,0.67896339548692,0.924761738845664,1.47560789482618,0.132458526955035,0.407524613337677,0.608391320903694,0.56514450801651,0.226934000447364,2.58594127766149,0.821022373253444,1.16538356665082,0,0.462599339498126,0.687045992489472,2.02688183924775,2.55127236923572,0.462368577343839,0.566587421539547,3.19659151237939,1.70416106288073,0.727738391294032,2.5850742812114,1.32331847125301,0.860238190383397,0.605553216227635,0.68250498119858,1.74685835028708,2.01613688502807,1.61267238061751,1.14136588652092,1.82821764104627,1.13167800553807,0.321671156876041,0.947751425687459,1.85835425710708,0.457991352613308,0.786138808653246,1.91348803219687,1.06240980758122,0.214985190960144,0.748362301952128,0.58687866553665,0.301294395618462,0.105868994419505,0.764694513761242,0.702620046129282,0.731867055992358,0.736163665695517,1.31992019800912,0.232283458052949,0.215950276003608,1.68653414298671,1.36177004349798,1.15787972395299,0.484654778782002,0.9321427554071,0.47758449479359,1.23065432305866,0.607581720295732,0.525581719685821,0.502181894104425,1.09583734945988,0.194678385434472,1.63142096516155,0.702680590869526,1.15898389723953,1.00681719295884,1.32856133810717,1.55570623125185,0.798873456287994,0.210190589359204,3.15617750966356,0.896822080189138,0.108624587211628,0.881201003199896,1.47302991496455,2.16479946954081,3.01284753183779,0.990617284707221,1.83096156876802,2.21099405841443,3.28380327092837,0.839334015371513,0.544248462112173,1.07307436251108,0.764915867196599,2.76669056089221,0.229315969089599,0.334324564326166,1.06417374306972,2.95399580838276,0.0482056292157201,2.30792857280318,0.776161273512632,0.762957659681531,1.70903111522278,2.05759063568382,1.34501876115892,1.02407140647502,1.32129969321284,0.497285343227111,0.393271209748328,1.521481570888,1.74963727992587,0.571703018490554,1.36232736560344,0.952461800229678,2.14332974016406,0.728154576804294,0.457819726531275,0.781404032435581,2.52650455998168,2.5277134479202,1.52490065756771,1.97452967958181,0.716619585789009,0.00428849406478888,1.3536998672919,1.11356915726989,0.829187919283531,1.87999506035681,0.754046005288242,1.81692199870806,0.897526999615436,0.396202243079914,1.62177385784744,2.25530070585464,1.3406368941646,0.654807623854927,2.27126579941218,1.59568759000836,2.97893472999371,0.220720977501212,0.075095409499485,0.646795829052114,0.118273600269824,0.61267521111389,0.16086934454404,0.908861624288834,2.53688345447195,0.535748409708346,0.984675380906524,0.428204257733452,0.805992292197811,0.628285352176925,1.26939048350034,0.670071660415473,0.444351674710421,1.34973779360065,1.96888553640546,1.64742572979381,0.89860075863362,1.61212929432305,1.80656534574572,1.50461174891838,0.779840380199481,1.65310497160735,0.785068973209426,1.38835763509421,1.51697275844813,3.3988031938666,0.987928016343317,1.24286782157647,4.61982322234382,1.65739991711865,1.11424707303367,1.58307999872961,2.52601345720218,0.472580308933566,2.30803651488156,0.285428734613584,1.47566910802775,2.99297684527415,2.01042968317434,2.06992003218373,3.23241210068565,0.936036258007502,0.947705799977671,0.107477642284543,1.71630306411234,2.2393076029564,0.97300284603437,0.566101543547552,3.04378176210447,1.2147340909611,3.56409277208826,0.752370273161901,2.41563618365213,0.448517344083645,0.712722723221984,0.613962134147792,0.763595989677812,1.88934893191004,0.0651590888242552,0.930070421822537,1.5882149943685,1.08313710341573,0.841815359547144,0.681435321819278,0.60355679724971,1.28789658955787,1.22530393157418,2.57159939498929,0.521299442119893,0.535051720555249,1.43053257093129,1.08320315444263,0.557173808522693,0.861015222437716,0.0944558022578097,1.09483397174641,1.14161328001557,0.24427527542778,0.423063925955585,0.83932764539437,1.20744373510446,1.08303359469316,1.3429228815604,0.967281509683192,1.81621810470154,1.678092192869,1.13008990905915,0.712878349330203,1.02080157244776,3.02463386027434,1.89084705066303,1.75833260218146,1.33321991002836,0,0.816014728189659,0.418514888866653,1.91427978316574,0.445806144722262,1.80613458681243,0.774903840708713,2.89244171850914,0.611185602720282,0.953188491930675,1.32362197822903,0.410240144995216,0.828896132754457,2.02129458151197,1.04246132763912,0.546645782637131,1.32808505635657,1.21525613104362,1.08876712672757,1.23728408492837,0.717750067855736,0.273471966652939,0.492085960574938,1.61524301277853,0.139713088887198,0.16523548994791,1.03588181240059,0.621649156149311,1.20418642644585,0.998764307596205,0.448159543065138,0.494356314028723,0.50406995327444,1.00242961550766,0.556732515111537,1.7506159369863,1.50057110140858,0.862816358409759,0.750909589013127,0.887613545380687,0.673167974677061,0.052877427082996,0.901309626868534,0.971883047395275,0.581140456073729,1.14399825721966,0.293622153969768,0.981120601181394,0.408046383347763,0.0525740671831313,2.67981743394763,1.14739657946379,0.545687016139513,0.446287995302223,0.463950922896583,0.785533812613391,1.09840473455708,1.0164913278632,0.934840293199861,1.14480146526267,2.16251395010636,0.327775877411445,1.35849979017937,1.54297612264233,1.22049588622573,0.446560619665538,1.09372579940346,0.461067598730538,0.903384629641659,0.679998419495072,0.682464529322347,3.13002807956077,2.18540354030662,1.21892496523595,0.251276992201425,0.4260206971611,1.62576470897861,1.18071056800569,2.39019166073037,0.229005682431864,0.625680558659619,0.0874290308715543,0.399269264851546,0.872420532336563,0.335104067008391,0.335260854719048,1.90690983141416,0.453319183483441,0.455946583053067,0.924159188882048,0.269332429734163,0.486191561972103,0.476561073533459,0.528700930571685,0.709144152827288,0.821093336139992,1.29257563521351,1.26451060937908,0.75072911798515,1.00822798666754,1.17381374993267,0.87331239982749,1.53567277464518,0.518806531473997,0.451691266353934,0.693200029196484,0.688700306637138,0.314019532623504,0.357099053953818,0.459335085994161,1.07019832990536,0.550151056335729,0.850357707642336,0.53666805363426,1.91485571185804,0.755477369024521,4.18446349077365,0,0.785404077802291,0.570011593197644,2.1026393207819,1.44741362754436,1.1918228681936,0.294723781205774,0.596427606007499,0.891614540192949,0.937568049046646,0.335224032294637,1.11779011114603,0.125218757317726,0.822841888759477,2.23281698913398,0.730414758369865,0.554421071836507,1.13857596554002,0.804522399980682,1.5597392649637,0.674216565962812,0.54441109814071,0.596715740674015,1.39829016557898,0.310015477704254,1.30802238527132,0.18903154644868,0.137474669560574,1.19611221303816,0.274452158982833,1.42028081225343,1.41278369276602,1.23969498253889,0.746718126129463,1.57501601523755,1.70347417457546,1.00357345444714,1.64210958735305,1.5285913214363,0.0544767658716476,0.133745527928319,0.987015775533117,0.563289260784344,0.377452518389237,0.910012669534369,0.353807232761048,2.32467410246228,0.747376399463932,0.884716613670972,0.728533551326375,0.0819483490476073,0.289546369453391,0.516089902900761,0.448327987045706,0.626940990456958,0.839616685026606,1.08822777598373,0.602643298200457,0.410379749652144,0.247929578773955,0.386627991210197,0.757705505524176,0.172844240798755,3.11932845179377,0.212597725580752,0.344679675896413,0.384039083274926,1.0652183839821,0.100863572781876,0.578018571855042,0.878529725840277,0.344135041557808,0.562336805449355,1.74432258224568,0.726267104528721,0.36724334234095,0.358827993051591,2.04897478477927,1.18992131501788,0.167747133112892,0.412173433319898,0.653712087148272,0.777436380717259,0.672603659373317,0.0755320835250079,2.90310114555873,0.822681126067447,0.762435566105407,0.589435608065773,0.420893256348858,0.926046798920587,0.294305137236846,0.736107801272591,0.98142489471812,1.14595716420214,0.745680508167972,0,0.265994662304073,1.1259730604566,0.732742421383389,1.49555608421139,0.832616230476474,0.412324342094693,0.650870230361284,1.08053351119608,0.478339623787384,0.163231809009151,1.14316337898994,0.248608061983144,0.21816118709516,0.654439207155965,0.717159487879779,1.01674019532994,0.374988814459483,0.0326790751440735,0.565144117976517,2.15661934659903,0.311995477549626,0.110241621514571,0.157795475366205,0.750963511604854,1.0976794915445,0.66512794943258,0.966099657949878,0.342305893254753,0.41539632504316,1.89047408708762,0.180476854886753,0.463951968847337,1.08251185216536,0.330247111448371,1.16717741898139,0.448052629620762,0.553031324864281,0.659259669777178,0.750822142688192,0.39072017625498,0.421906527077329,0.939011380045952,0.414879263022795,0.376663124023333,1.58044557238034,0.470647226716574,0.44054903729888,0.894835298614041,0.441959023121108,0.812822338368739,0.801320096433919,0.351424799772508,0.257773415062322,0.499726002912175,0.644271810738322,0.670728413928786,0.865601347136055,0.678216167403732,0.279449543621168,0.775905998818345,1.30406180892515,1.19665299307425,0.58786075115021,0.451453899450689,0.157053026173165,0.751593116581042,0.120759872066622,0.441693494347098,0.232439608456845,0.63685835590373,0.161364413076619,0.429494920022646,0.337187345862233,0.942673638727644,0.887903129371677,1.06414731721317,1.05655446609181,0.09918597960318,0.220564482116995,0.312524730466312,0.735567320381017,0.392078877478378,0.560993959386538,0.476264504343111,0.555731357432506,0.364469338947419,0.471737478953581,1.18470748474724,0.658704326032944,0.59134938782938,0.48166711250473,1.33069778689351,0.815381578284871,0.305043981214421,0.42159204333128,0.729431389722948,0.373642643759872,0.980782178286309,0.98649904163416,0.701988917612012,0,0.419606197734804,1.59679754325722,0.835690637819115,0.462307216039897,0.714255190560446,0.771795761088313,0.606098593632275,0.548978778858256,1.16774328010894,0.615869093069728,0.144776410519556,0.813816071955469,0.781661860916711,0.34434039728146,0.170372231697722,0.443373255458519,0.279067938396171,1.5811588750049,0.40829252194001,0.791296483094767,0.190082560828885,0.314214483494015,0.460882607170365,0.291280211953533,1.572152857186,0.389246299630557,1.06064433523531,1.97676724057797,0.425858971533893,0.892474184927766,0.668633191805498,1.82869372346376,0.852587943846064,0.320760771008855,0.854049123677797,0.605800571803562,0.819370622503342,1.48388850660446,0.701463268928715,0.837592109741585,1.27373673792041,0.137896932389619,0.92983643621692,0.453186728872583,0.0953126551066917,0.378531598892927,0.104840374397642,0.234410083923808,0,0.217811896654074,0.218556021607287,0.198974092071715,0.530479314747651,0.48828053910777,0.601352225073548,0.441488791410277,0.302283601017312,0.744803490140625,3.31517202916897,0.689922359642377,2.0673602691359,0.676055321923427,0.812821845601351,0.455033357377848,0.898534204164263,0.775472012430049,0.461208448918275,0,0.753164644044487,0.0982136362869129,1.07418891298829,0.916638675788004,0,0.305535166931512,1.56601189106603,0,1.77931561978189,0.752768922561466,0.153954071891474,0.698227370000038,0.946900680238398,0.209178712738131,3.17812820308934,0.652242334692255,1.19415603247656,0.621309500326322,0.116887572356574,0.719699782505476,0.340873048744734,1.23980372340776,0.477904203954277,0.615834354569603,0,1.46861198816809,1.1186813227178,0.24279393802139,2.07486195582631,0.174869131740372,0,0.550827789473851,0,1.06909719386084,0.917782542565363,1.01442528341494,0.701607606330054,0.090028352301458,1.07092439981484,0.841913558739304,0.138655907873158,0.441249952310681,0.90147437457,1.24628403142248,0.272108374253258,0.27061014962326,0.348126904848021,0.3446501370581,1.19246626284459,0.555980043760538,0.355873617737087,0.298423242685543,0.249012012393817,0.689434879322617,0.776876223450254,0.297994288469209,1.0072440928517,0.684871239030195,0.913590815905978,0.664571128779207,1.27306764469677,0.061583088138826,0.563135183801736,0.295345935287937,1.14209055175549,0.682321140758817,0.516868505952045,0,0.355274324504256,0.743756136687568,0.424312642491351,0.408560573888592,0,0.451358625217074,0.210651817476145,0.164458063081401,0,0.52267649688936,1.02789743544839,0,0.645610363386628,0.669041918264761,0.395591507957697,0.0958164247488186,1.16589406387358,0.279595977144232,0.0618964459582594,0.322085397778623,1.11188872639517,0.175329141393795,0.447478693668716,0.210601200560776,0.581594206926995,0.781925516740235,0.480543188944501,0.714384097669789,0.179353332471094,0.557029765579697,0.202219727286023,0.944386963485468,0.862921864297238,0.499935462114215,0.398608675012587,0.625768916365714,0.162918961545779,0.252303019780975,0.500338072983144,1.42067480251414,0.13553145509433,0.979225653735882,0.441268865389102,0.921374630279792,0.268962506545439,0.552723512409241,1.0974833754095,1.08702487440195,1.31501257899333,0.0461603653933523,0.778434090282119,0.836123693874904,0.108259344525162,0.185209541438154,1.32410088784723,0.254790661833563,0.396192705757431,0.69731478806474,0.415135599206264,1.06216012798841,1.61922095150968,1.56543437607999,0.629548733463809,0.433431251685358,0.509491747581134,0.464104564936538,0.33206879632061,0.961191381109679,0.413674446516197,0.0941510598301562,0.423298586434314,1.2238685734096,0.22132921683787,0.501866501759593,0.855595811709824,1.05692612775651,0.528353773061333,0.814166966301882,0,0.134989077148486,0.22303250616056,0.37877993957869,0.812246178356381,1.83161745164497,0.297014583858688,0.506745321100982,0.443641657621755,0.485778286698426,0.376931562129203,0.526141445526969,0.232567439029236,0.215251532943717,1.43634203165442,0.59612586160591,0.857576904332655,0.368537052429496,2.40976700620159,0.239550185625674,0.118158492177893,1.26954308792933,0.386492028726803,0.451162570510573,2.19643708309734,0.52336563581315,0.208174867833231,0.11696087648577,0.272580087299918,0.622495603280248,0.762482341150292,0.389983591305661,0.799738527593288,0.0801338324406159,0.819698426644907,0.594274507009512,1.13895270417478,0.563089777749526,0.31413894315791,0.794707640761544,0.68839075958807,0.776066919811965,0.234438657308792,0.645738543886558,0.85723004111753,0.333344841339331,0.575277860514935,0.695842411241792,0.790525674564906,0.973561317550605,2.45322887963038,1.54075884961872,1.09392141314048,1.43817200084445,0.631066089449244,1.02637288756947,0.979928751636617,0.554692771090781,0.382886226997496,0.177319802703168,1.3083360591858,0.0320137850058561,0.625006711614351,0.262743913988401,0.772443960295017,1.13502967388721,0.709763426912919,0.789991103361596,0.454309415277784,0.0787754072394076,1.24925278685413,1.07692981123042,0.405412116275845,1.02299525335096,0.386564315570934,1.47624013318497,0.86402247307297,1.38622823379299,0.639238832514308,0.360069807466567,0.520380406620377,0.724189234091812,0.269160050146969,0.767501411051334,0.319728906473659,0.560164082145327,0.261409858471959,0.313317259070667,0.648435070180422,0.401709643360163,0.176044292854963,0.641057649650963,0.759187713385727,0.116975244190682,1.04906821608096,1.03777424439709,0.370388062298165,0.849763446597733,0.12132433677813,0.328932028124435,0.305935510770933,2.07409949283175,0.467828591426084,0.207519326393142,1.86711482541311,0.726353523084226,2.38861387786986,0.972127962719168,1.01232552225112,0.954791136565426,0.820028035852433,0.296970665868984,2.2127168690526,0.202030234220822,0.414341230933365,0.609906219778043,0.885322895743122,0.588155016196313,0.556275192733007,1.27452646655449,0.708072169051747,0.312216730048037,0.434704866898772,0.601963639892363,0.770224361405917,0.298319770326475,1.0594607760259,0.443836933899795,0.129958996134016,0.520596844921696,0.704211536935639,0.300130637771327,0.795739523019224,1.13026496840444,0.77644008633437,1.42770941027591,0.0555227576302965,0.303317842742069,0.730958998048879,1.33761176964431,0.389305781489664,0.612112493607021,0.789419356826144,1.15535871972704,2.39241772094747,1.20183582433828,0.453715315629582,0.453151215903275,1.11189132971121,0.602744573326109,0.204609015719573,1.71998683184504,0.252646723648857,0.192453258885255,0.269886777764993,0.555281375509785,0.329262892180362,0.107363410550513,0.0323969709044712,0.354547509584258,0.20713070752933,0.529370205672732,1.1487773025422,1.28559042280039,0.540044533867899,0.268988847255194,0.614854082854453,0.281039073469084,0.357449421834922,0.995216035032758,0.722480363914174,0.446835309390274,0.436963682377655,2.54388731291942,0.347690371807841,0.229666545939905,1.39272626583704,1.22842037474013,0.405005436541456,0.395879693117567,0.355943171495167,0.27280042203253,0.349527883036144,0.632291484586712,0.399939305554195,0.0736207780525719,0.506119913995008,0.688001896581803,0.569265920633253,0.229522461659668,0.222098741176576,1.18267945937985,0.284831893879259,0.270687764644615,0.328589025406506,0.55452795024411,0.112248940637153,0.488617834590648,0.264327442762164,0.0242583952725925,0.935368468525602,0.497240780687748,0.892713531785185,0.404681252585293,0.393940022786308,0.519813610878988,0.901225662410744,0.743156457845367,0.530085528774381,0.169995531475813,0.29299219069831,1.6793035309781,1.61070667565286,0.414039169647224,0.71245068931144,1.14536749514249,0.664814030565079,0.294500182331983,0.816756643560059,0.495382033125446,0.212166635337183,1.06481319780059,0.966524084397355,1.05023699042855,1.21913133911756,1.04834710426677,0.0720213977784714,0.812875227756613,0.737886605171793,0.849955557750539,0.349896621480006,0.411800538566445,0.0474683113081008,1.59021539673888,0.478410662222739,0.596694752674671,0.443080077780023,0.730875549699988,0.660204213252548,0.522802783339597,0.588690125296855,0.82526021988301,1.04984611047726,1.21629591935631,0.824505071875316,0.873956476645217,0.284653184340823,0.367101849293849,0.313396789851556,0.456373012919078,0.426632641999366,0.814256703099264,0.371209228059114,0.171150451021972,0.0790937940944467,0.203276844911351,0.976971382769832,0.504461649083006,0.53921222396405,0.331890914993424,0.417538226240241,1.20179882078008,0.87060208134481,0.61894610758096,0.55266017160352,0.628230470498005,0.193654683259886,0.309471449806508,0.057486317447541,0.219118697242106,0.968978183597866,0.142175528793095,1.02677740088784,0.804898354084474,0.433393860227049,0.951339367300285,2.69258409157156,0.14049597763398,0.84369447229157,0.601484493657075,0.7996004494199,0.902898082719778,0.337154912329508,0.754631000244242,1.20120475239989,0,0.547431073492952,0.620746951191709,0.123771597399527,0.937092746108578,2.7859103959767,0.253578962282194,0.345837916712064,0.535935489935295,0.492460721272856,0.497210833070299,0,1.13611787129103,0.300585547403283,0.155075515528441,0,0.141673438026853,0.691337802101398,0.767692930641966,1.46836852582167,0.227223534756892,0.226141274022455,0.391740449243213,0.484153189816625,0.381048202353173,0.634935571700699,0.217561288202077,0.225589598061777,0.81557477309195,0.293655463375545,0,0.324414196579374,0.135801976731946,0.337059092105837,0.389832309296781,0.623754793517999,0.0674265645351538,0.502947269137945,0.389554697478696,0.237963799630737,0.850522216660706,0.423596564217911,0.543064247652792,0.457182409687264,0.622739228008937,0.664680799130531,0.368750248949949,0.953969780173928,0.466022510018524,0.808212864356381,0.408091178478828,0.776405974667588,0.375745657577232,0.56900492681818,0.593698924658511,0.140903225976389,0.714789736975851,0.600653215802704,0.227276283154217,0.613135847576614,1.50065063860041,0.531969274072029,1.15298357641568,1.14631764151063,0.419580526822211,0.750895186453624,0.739727412323547,0.40587399938609,1.34749065159698,0.273564943483404,1.13099279239426,0.941345763422387,0.57891138010164,1.12934039384676,0.692169793333342,0.828205046289637,1.9925933393141,0.514123876493349,0.924490633905957,0.792476996053994,0.23201747836512,0.461395284755663,0.210423777991088,0.466736737209816,0.685617271470224,0.0600107103802443,0.309604624077881,1.07121383290787,0,0,0.10785348521545,0.528554216457291,0.418237452182781,0.86626391184144,0.854882143327015,1.17130804314661,0.102038596810272,0,0.374825827141153,1.23053855775435,0.702554445739018,0.589337805188193,0.395285385253741,0.248298860909669,0.841859791484997,0.9187067977275,0,0.143629821054955,1.31119559450984,0.687075652863016,0.13345988995941,0.773976076617627,0.252558564995975,0.320969018753863,0.664098859447702,0.44456180244514,0.288442552066001,0.364017804149764,0.188701080296033,0.170317361134935,0.527980818225495,1.29826181317769,0.375526708814138,1.10200835241322,0.124259969360105,0.264759798745074,1.39444016695502,0.348303815577535,0.510285567064552,0.570485916812402,1.11084506580338,0.364076956560899,0.490026219179007,0.0547505579081882,1.25461387541876,0.145902400274545,0.864643930172299,0.444810163220801,0.789003360847222,0.331890914993424,0.27496364676484,0.601484493657075,1.42848225011055,0.0911473580884913,0.340828623194007,1.22842037474013,1.66538549387327,0.750994029698465,0.0513204491814095,0.920289488594239,0.145462909676058,0.905442557486072,1.33686606184383,0.315084594673087,0.713678220894117,0.51921276952856,0,1.37908248460307,0.615207128987883,0.399183127624004,1.3117559427666,1.48085914189712,0.0522106607057836,0.584666236921969,0.975312486948439,0.119803160632135,0.464383672565251,0.53910063054263,0.093328528618049,0.0536792641054342,0.059725457235457,0.570115573740032,1.01895813886975,0.663941250215854,0.824915271328915,0.17129894683358,0.486527389695909,0.21095884705841,0,1.91730915452026,0.835733318770177,1.93629871857691,0.289155737326328,1.63410717722104,0.894705718532876,0.747527043196003,0.312701530873846,1.73611949400523,0.774427381857594,0.721603647195534,0.287753596180921,0.804912227493303,0.39428375331464,0.825271130507644,0.509369419004456,1.38848030666942,0.128603553702382,0.306456025051571,1.00014260335674,0.495088284531007,1.08732433587805,0.641557126699001,1.39548539789436,0.908839417737744,0.417180329030785,0.761426471824783,1.15481195354013,0.559078646460611,0.754575675351569,0.116764091045531,0.0326512057008713,0.00796575662696806,0.659291368539612,0.373083772639223,0.848056216131942,1.10403131297173,0.910127831045344,0.766406040740838,1.24693520552187,0.751833024391679,0.0905530747833707,0.0354791684889308,0.199464776533967,1.14426360616076,0.866544836063182,0.636937774623463,0.247730200014654,0.368526548222623,0.340938203744644,1.19115688303738,0.461194301641195,1.0953600555663,0.53291376497531,0.116590060380864,0.54667882026909,0.861533805412542,1.2673847790951,0.0448344501165975,1.6520325625518,1.11100706689335,0.995495300608308,1.5092720656126,0.0605105770193239,0.453560457766362,0.683804141577881,0.403036436240511,2.21237323105121,0.635514161973432,1.7135317429378,1.46083428535426,1.1740509744623,1.07747203422929,1.06187239708575,1.1784505185679,0.969047683512711,0.109622126560201,0.975889136520378,0.65608444004934,0.606061249486934,1.34923674291478,0.520721644256405,0.597716132438087,0.966191228846242,1.57139382470542,0.440109609418382,3.12030664805513,1.75326752580132,0.675377953696001,1.34259980054951,0.0854844840242116,0.876577059652356,1.40335662670453,0.415838693862859,0.427629556051055,0.538320625567862,0.809458897492376,1.66063249227915,0.173901610681257,0.603295001851377,0.459415880060095,1.00914935252203,0.434684693448814,1.26120222245861,0.199118871899683,0.632380275974977,0.877061801765249,3.55167227549411,1.05596400754552,0.835170604828367,0.791803237887632,0.653166621219114,1.42355127986369,0.540043144768959,1.45132818467,0.406928446665488,0.695979118918911,0.562106703743873,0.088416958406958,1.88387078357481,2.59917470744118,2.04629861817358,1.70141598131696,0.0795785468906562,2.03365945199131,1.10123858714447,3.43309345146295,0.377020771186561,2.31009908896435,1.06330557640841,0.081690713248315,0.219654144759638,0.512903239389411,0.720733925932068,1.05031863682564,0.872228315900182,0.335286469764344,1.52789822089997,2.06727489985638,0.402790817813328,1.07605690334636,0.424905861158448,1.31946070886596,1.07113315454938,0.871917358094252,1.5081258829996,2.67814764461414,0.476386872445756,2.25439570418078,3.57988104651682,0.323879836928636,0,1.41570891755989,2.60426683356449,0.739639458359935,1.34268046381816,0.372978500660553,2.57006212673373,2.26258198989685,1.70270230834898,1.90728564759707,2.31293579869341,3.82799121320228,1.93947484286559,0.608043417747613,0.870871827769721,2.17356849165522,3.94239289157795,2.37927993118666,0.791723235805849,5.14234089283373,0.513437180434596,2.5247808319609,0.680937225746916,0.799634431468842,1.62014156955296,0.725465458729466,1.13721298817771,1.1828797721352,1.36414600387251,0.753504416958031,3.35528329036708,2.18054445227846,4.22528835865687,1.03630216881567,2.7676450531278,0.841826628646408,2.83607278137298,0,1.00026975875099,1.03408045633746,1.66189641528677,2.93115580033443,1.68981485979147,2.5028395291759,3.46860286558768,1.45322519148824,1.52475475979928,2.25467173847357,1.86819801502786,0.143226868910058,2.49647947876779,1.39446145985148,0.841688978619317,0.740776484865232,0.0765268068585195,1.68106014621536,2.40059967998174,1.49645723635314,2.63229311340876,1.7495814628689,2.39133385655853,0.771191397063083,1.72728923268611,1.06865223950094,3.65590080701248,1.30494845670146,0.854310092489054,1.84740768577249,0.204421213546318,0.656296168711197,1.71715237944292,2.00042949851001,2.17288685762039,1.22371791691309,2.51277983470751,0.317808807536155,0.403732364399016,0.934335780683251,1.46849104412933,2.49381439207696,1.45616522954835,2.95674492889357,0.901538244965873,1.45912048757805,1.67209399325049,1.68720400535671,1.91253068914958,1.11585759485547,0.568296096241931,2.57236583866282,0.226756356131232,0.726625389481028,0.0401544515431682,1.65966338869979,0.4439964447155,2.22581784379978,2.33699456119389,0.120454664027418,0.249274331387305,0.399052610188426,0.620852217186652,0.055911270083168,1.70711613139968,0.528014135977725,1.32055803842284,0,0.769435776421036,0.57646341311159,0.308414583511151,1.6573674449955,0.67988144225367,1.80231772804395,0.784872378008486,2.10734908072618,3.09287754015884,0.913218400784258,1.21975771684984,0.492571469345345,4.82821985019587,2.64650038341601,0.927397395891029,0.466315761860502,3.34242389575045,0.394035871567008,3.20258556910459,1.32762931033905,0.495680837921341,0.100904334086087,0.800451417310024,1.87573406906019,0.565904982944023,1.49274229183104,1.25210557707968,1.89042957091093,0.325820999938371,2.40460479993841,3.91890043686547,0.611891895270612,1.34627557796707,0.390131114522497,2.1594667604729,1.61160772018999,2.24752745179693,0.725694919731497,1.21215343412323,0.68506031826187,0.213969956066528,0.758912451715815,2.83765608673566,0.760241729643155,1.66448070135152,1.12149688226329,0.398224484785853,0.0316794723573089,1.32687842351251,0.861571917481199,2.33319271227328,4.50118564805839,1.52956710979893,0.650569671854063,2.47837648965109,2.25760900126257,1.72123956225898,0.184783007470902,2.69954941162384,2.02922952905742,0.583003915574817,0.714171649788995,0.701372684733457,2.31218448553825,2.70846058262085,0.197808789304571,1.15557050355029,0.184069890018323,1.9648207505168,0.977076924316489,1.13035235830616,1.26310834206004,0.52773196130823,0.717755068020809,1.39713462300869,2.03791983763332,1.84272384935272,3.02941471968155,2.64291547680878,4.85189927373182,2.32102468499496,1.56639672395015,0.0404132992095772,4.57997233856612,6.21964302131303,2.93051027260661,0.0938473344861266,1.57868854377894,2.73462066619041,0.82379744934149,0.351308096671615,0,0.559659200170726,1.33340770369124,1.7345106365063,3.55555936684247,2.20667103997578,1.97307634148113,1.61444742640963,3.3331214230925,0.735029063916949,0.844856430704379,0.326887855142647,2.01790673290295,0.281689230445083,1.84929554892692,1.05156171055334,1.44826190182708,0.589644615519727,2.20798653009602,3.19492216106183,1.24414604190314,1.132853839845,1.42822012607502,2.80204925051177,0.89251824949056,0.721819727222679,0.451226095997407,0.869883800276125,0.725883347103088,0.576208653273663,1.17711412275484,3.11068061472285,0.306631237776277,3.0873474210302,2.90804429022489,2.78362846837494,1.33062666112359,1.55369078616214,0.491476535844796,0.47022343369488,1.90116193267429,3.54562865348117,0.574555734097906,3.58634201921242,0.631728267294053,2.44419792917995,1.14538856123167,0.681929918662679,0.6454840160655,1.85278910561291,0.381768213780628,0.76194476193055,0.669629033012058,0.913437709931408,3.55679847253974,0.556313651849084,2.26742972687054,0.385885890717104,0.339567278199867,0.844573420137599,2.10194920598218,1.94209331766219,0.709575617053778,1.74264525438073,0.728415132481825,0.45023744069113,0.329990617935585,1.16343690117045,0.689528184173856,3.50020369484464,0.686554043173276,2.84343664139288,2.93937892730873,2.08062730844938,1.32354162571144,1.48762371783552,1.49372776608017,1.39860385958593,2.24301338305462,1.60591574975166,0.609787105740564,3.26655868930438,1.49210801405061,0.764088781010151,3.45155797645851,1.44006292629644,0.713493823397903,1.58547312439057,0.312226258017495,1.36458811976829,0.931643500580097,0.563511754839384,1.30491400560031,2.15390324149899,0.557027706318312,2.22795081194276,0.452641819475496,3.67306564330582,2.91067510643142,0.663213438604572,2.39935241073107,2.19810498209908,0.836880542779999,2.28928312642334,0.879809260257765,1.3632355693336,0.849057698819237,1.06117134834079,1.98108069626019,1.05647324121279,1.3751556765965,1.649651324821,1.18729774963652,0.491531948731977,1.90533510918577,1.5881492581606,1.21578233026139,0.80914563749415,0.260478934344774,0.201613161483609,0.307522137033305,0.427133062864077,0,0.353541909243695,0.0978805688580217,0.350416793376241,0,0.0497847863648323,0.0780202038898744,0.122651649691051,0.858381312330577,0.116156455885669,0.56128859289752,0.696262734897814,0.0725315814217029,0.819610964994743,0.371655986869623,0.920513061004969,0.070530705078036,0.995756136049874,0,0.25583183520657,0.225953293655617,0.182483822554019,0,0,0.26152720474035,0.362952679462482,0.26266526913175,0.121041004425473,0.688116874131417,0,0.131446195404817,0.776380285102154,1.61483844434133,0.107695233400196,1.79245850460474,0.229014175894326,0.67094726534517,0.102790739006532,0.240852590792821,0.358391760561048,0.0827723383392517,0.214393047069526,0.819794873532152,0.417742143649803,0.133857295348383,0.466147838612322,0.399010049980531,0.658974623679094,0.489734973931336,0.636695608092836,0.315390708168296,0.0844281591312155,0.0474324336838752,0.341933843420112,0.240398598582862,0.351731552727493,0.0632168599601458,0.846570337877336,0.25120184105192,0.549913878360348,0.516453841188327,0.25662315125165,0.204750852756157,0.0903888484920782,0.268079455322441,0.08749094807052,0.671034252960763,0.463467194005789,0.524181053004825,0.789959062840737,0.445539204365948,0.804995217420781,0.667046464946119,0.457718779012123,0.458625897700818,0.831659199453835,0.461474077585685,0.479992380373885,0.399607856613783,0.413724049081115,0.448668938672215,0.190888898833829,0.0725753461718177,0.315776388262346,0.215856616366383,0.37729325236752,0.364009811606537,0.470120121782008,0.093004624859284,0.269997932893932,0.177071375412767,0.979384447731764,0.0877632978792116,0.321575457125279,0.499569577351065,0.249038719886303,0.256428714474364,0.613318533203965,0.392211456371457,0.15385137190539,0.100711548520058,0,0.121239183745557,0.176599794559009,0.112209165975717,0.207518076982546,0,0.11574788600814,0.184111160651307,0.256132721732587,0.309793654556077,1.07212302351461,0.178888614449563,0.0851435684898924,0,0.809875374432369,0.176975029743792,0.466964296737144,0.260979386746243,0.679174243888068,0,0.317820729285466,0.0495004314157722,0.653273859579163,0.276124047858132,0.234372557502751,0,0.281343355393505,0.416832501402695,0.330327550355794,0.0651390933959801,0.185996033270379,0.131776081012028,0.0744225440963089,0.806263172105854,0.598021738224593,0.0714679230894711,0,0.482810911879269,0.183472794102291,0.297745492908198,0.480019998203072,0.229113262595237,0.0673188932046664,0.803666309464043,0.253031991244229,0.240712427700932,0.877101705205044,0.968797379694514,0.0849451286213655,0.329169876631948,0.455894729840895,0.292910584974999,0.384493491658321,0.154744694761201,0.4905978545685,0.1474317486418,0.100019164667325,0.326227837297292,0,0.111844736318769,0.236591927487617,0.119914818513601,0.64952211195006,0.398505687043067,0.0767714135714709,0.114183894346959,0.49877351360561,0,0.467516344757212,0.201770471649328,0.230719609855817,0.181526739347279,0.383333919805693,0.412209210534579,0.595018352135072,0.992788729852823,0.247666650597481,0.799708194625464,0.22344207406976,0.127740239878258,0.34120813279697,0.0763144524146883,0.50793972680429,0.108612638294824,0,0.255683694555134,0.0586687957644162,0.681588512962493,0.929434937543212,0.349351688565936,0,0,0.039367522018213,0.491283600298927,0.193175874026582,0.128355304894339,0.761519234842212,0.346491749073705,0.460597998765802,0.50549657305829,0.260226836148239,0.532892226820037,0.110255120708798,0.110532294060209,0.23843384516507,0.174439657022407,0.0977445430884168,0.301921212976637,0.104223252817095,0.34215294219609,0.23056874492923,0.206627221731283,0.472256193824931,0.304271663073995,0.412338651590162,1.27590970138434,0.264965482646753,0.507710828280037,0.28256280693706,0.0729350174291536,0.438835969268617,0.539343166447087,0.155006973311721,1.40343843569722,0.497984161336857,0,0.0900183221721062,0.825715627586915,0.625537024289829,1.28264144202033,0.167635391820145,0.262526608047494,0.112986041570767,0.133852035899229,0,0,0.450332366644593,0,0,0.29079947940788,0.198384768691926,0.3809920349929,0.198243939076813,0,0,0.115687302911422,0.0746461367965353,0,0.219944771998595,0.565881787610975,0.20102529187986,0,0.25739810182091,0.128437399339171,0,0.325770928572532,0.623119575132535,0.194716202346923,0.771953170257458,0.906531223608017,0.468616679758413,0,0,0,0.550132828418793,0.247990686916956,0.107401042402134,0,0,0,0.858833704186502,0.136901925657406,0.109262125126194,0.388707546664598,0,0.0675442778304208,0,0.0824476770640595,0.108391438345073,0.218992644248493,0.624377472419855,0,0.0585585293796182,0.276857517595442,0.392427338213722,0,0.299699260798075,0,0.821536754708384,0.722057640261208,0,0,0.144135148118374,0,0.506422190708947,0,0,0.117794498770624,0,0.40720382360348,0.0705357883534437,0.442731221652044,0.279205018805676,0.579264930525195,0,0,0.16617168103271,0.442305623949654,0.0876594417288046,0.742577051488751,0.594589632334118,0.173553077682583,0.252261110889967,0.240142111647062,0.456678955208398,0,0.500526742223812,0,0.548547103778319,0,0.7086322283196,0,0.273617337285987,0.563818055147364,0,0,0,0.195991312478689,0,0.676605291570904,0,0.382860890090596,0.380393667036379,0,0.518844290761901,2.39976172575335,0,0.310989187351485,0.20670573107991,0.0993500156075646,0.114248672458186,0,0,0,0.130049568578124,0.170890322298328,0.697361053670337,0.21185076938967,0.243458266373974,0,0,0,0,0.203737407110912,0,0,0.524522496211864,0.310380375896023,0,0.28535486809412,0,0,0.28386133782041,0,0,0.259408689100738,0.343867137387307,0,0,0.142012106970273,0.353732269700115,0.406326590675894,0.393891711708832,0,0.13942496268433,0.644279102884943,0.284263001906509,0,0,0.865928313747546,0,0.209966967211411,0,0.389094279292276,0.261158885956083,0.16215588588635,0.62406064369403,0.328834052078172,0,0.161468514549981,0.323133453437039,0.160606580846928,0,0.40905665382587,0.241920703831524,1.52829625546787,0.352651194479048,0.328723892868015,0,0,0.357397170500497,0.533409851250248,0,0,0.0866222350275979,0.537086295662728,0.253645640076939,0.510950782641098,0,0,0.437017818971499,0,0,0.111706282316581,0,0,0,0,0.165803913602603,0.389647203979288,0.330562071297806,0.366763663843596,0.536642195415985,0.153402362637199,0,0.116963803252079,0.463312751579868,0.443535787949444,0.438837565745991,0.723460529143101,0.375385469787864,0.217098044228155,0.424136532453515,0.5786151267895,0.508654800707081,0.265900236408681,0.113157986506111,0.270520570240126,0.264758117611636,0.206345653071881,0.28912421298691,0.566216914195308,0.190278560879442,0.422623336845041,0,0.0820515267796558,0.0972885137955767,0.198876558580448,0.226525792722981,0.025367770276592,0.0516300582876003,0.111469931864447,0.212128774928311,0.293504093592696,0.0930982234615886,0,0.136028729333228,0.216934948934544,0.380552258715798,0.652468138443011,0.154732253487347,0.38507911474104,0.438382285252401,0.702302920383929,0.390472892072369,0.341901516420256,0.334453976741556,0.25279771915528,0.333471937254194,0.968169660235838,0.422462306372078,0.189593203192546,0.945939200308887,0.676942554326999,0.937341378684859,0.402560764944561,1.57663725869856,0.506303765913271,0.0764544292481084,0.379426002082184,0.749310283945066,0.475476952105573,0.149111185694265,0.600203517440483,0.472243194427292,0.240292467376549,0.770221908322764,1.40195806641377,0.770840883481698,0.845036346108793,0.934863084184169,0.16950687989526,0.431348032592057,0.0442779856027779,0.108131334476205,0.35093474166218,0.316597600091168,0.201312292517882,0.302172799740752,0.0852782037149714,0,0.0983508306969479,0.059017270788374,0.107711166475419,0.0323435059334007,0.0585770924011941,0.0909708732388781,0,0,0.0497839501089199,0.203884340117206,0.0434131030104662,0.277924063592936,0.0673188932046664,0,0,0.358597009919986,0,0,0.23361372575021,0.11241737017009,0,0,0.0478952842590038,0,0.123696917122558,0.213772172566791,0.0275733490269419,0.103943656422846,0.0678356973779559,0.0980750809503566,0,0,0.106744285954953,0.258729720673707,0.0312564254896116,0.0754915574142511,0.707135131109722,0.0909307785061065,0.0927588319899715,0.12455908008038,0,0.0651221315395695,0,0.647468235308756,0.262288820769936,0.287038180144449,0.114856458678649,0.092794276363489,0.222553829272142,0.943682076193755,0.418135963959497,0.161590279232144,0.603615663811131,0.994338736004373,1.3889998093092,0.736304919415478,1.05889068824476,0.459466977347905,1.25403451230914,0.641382421892611,1.10302717224116,0.138548312324774,1.88350097769609,1.75635351838541,1.12362077633554,0.929099398604397,0.932344692036268,1.27335415556707,1.65489868709292,0.313256301854638,0.57939354305652,1.95535365070437,0.480625078682339,1.1661252652085,1.58005380523696,1.20483872713665,1.46444452738061,1.50262237039569,0.226503350894109,0.142697047435004,1.05381339346044,0.97581923187149,1.1630684358483,0.308720251754038,0.561380690193006,0.300988203739954,0.315142459740154,1.95409317727451,1.41380689672377,0.229826609040012,0.358470195369676,3.04533462476879,0.973809620973332,1.19903844045566,0.445814406373859,0.541303697907375,1.1256415145178,1.24220791717633,1.15161882373013,0.372755677486685,0.565960240911455,0.160203179003099,0.451318213536598,0.881393672585257,0.588492876686626,0.692383273784909,1.55879308105309,0.708136900870355,0.625835297960517,1.21712088106249,0.20758791737465,0.356948339185471,0.214368550474972,0.218958805139089,0.652997170196569,0.368265482937493,2.8514180454593,0.568544571906393,0.757619835466105,0.0846681648479767,0.446559137575267,0.223779626826872,0.717506003645054,0.204781772129982,0.50427929134867,1.29110371434567,1.1906208648423,0.818019545172111,0.273044363189016,1.59283732042716,1.52156569214243,0.544883172971921,0.592879025889002,0.126465049220165,0.6454840160655,0.118997799622739,0.463406925757855,0.199620210587884,0.705906085741942,1.12686782106459,0.142195791809145,0,0.168934652206662,0.403373316115695,0.686115009974691,0.738736713155727,1.81101416946141,1.91537174763034,2.38484790489453,0.212686243770528,0.0821005915402355,0.642786860426504,0.187898964262256,0.0871325790429411,0.22575369188939,0.613701371763001,0,0.714999720843761,0.615227755212833,0.127063220040172,0.0810827012242709,0.840983054267396,1.23068690535122,1.54457762278877,0.736598814467137,1.11760801295685,0.38440021199898,0.274566183157274,2.23250453822499,0.528490305644152,1.01509145096221,1.89338240446968,1.0302089319569,0,0,0.102216689844392,0.492412215041729,0.551703032922991,1.03973500570366,1.04707814659241,1.01785279946849,0.879966055166484,1.72609311807229,1.51123585346401,1.09105187203607,0.543546661438224,0.638684715253514,1.46749876387569,0.672118439608731,0.187535934575532,0.870255021266926,0.146782934726675,1.54109549992313,0.497930119490907,0.274572265783675,1.23302021933057,1.42266682060181,0.0652552009118555,0.76729520246803,0.286809720790143,0.857075693621794,4.66653909205309,1.7912548012588,0.25561880270891,0.98070169066038,1.0412888981801,0.781328655900758,0.654442873457214,1.26212943204191,1.39482196454127,1.48935904195885,0.977220565682865,0.209369764877908,0.978607873979508,0.619434609776163,0.698094787942152,1.56807248993567,2.43052400720857,0.379542227126409,0.597046738282444,0.529061401887393,1.6761746863998,1.00281123590983,0.53128712857177,0.729109137422866,0.877731687651776,0.709369342076493,0.559553484346649,1.70965510180537,0.378063208345251,1.5082029760793,0.350500189047492,0.583810770477016,0.424712519520621,0.829179803646781,0.396798474603782,0.47895783087877,0.109296845374634,0.859707216182684,1.67794927082213,0.523356200527395,0.178672578553346,0.913533987070269,0.165322974111716,1.22199583179426,0.932119165308615,0,0.668219900996387,0.918780059334655,0.352939274255129,0.231878419821857,0.827357938759231,0.36199602904499,1.07217235847848,0.175067464999918,0.643683979416926,0.625073502458126,0.42930797786383,0.0887295483179243,0.809522282174306,0,1.10758811572142,0.501556339466066,2.12808417525911,0.525730139333085,0.375620119156054,0.796341916700747,0.792983586222481,0.278915505855944,1.15266590281846,0.917382105202786,1.83879408013452,1.70050363921297,1.73349057666018,0.518168602563678,1.02511244711038,0.39032320237007,0.225742588384536,0.383053173917513,0.37246138674833,1.82123794590174,0.607003088204108,0.716893906930789,0.461381453655343,1.19635442445716,1.54466619400297,0.493142097325167,0.57970633649373,0.744689843295467,0.510021684484144,1.29069392555373,0.437236262935237,3.02494301007385,0.754041728135877,0.341205855125957,3.07398299849082,0.0464817006315751,0.366912573656149,0.683246218297485,0.286859861966597,0,0.515003594389458,0.106036829933485,0.741147066340716,0.31102407514223,0.0666275124139002,1.24220065978153,2.77114608702726,0.488083266972546,0.284883051182437,0.845238724123318,3.43914969634818,0.717304193998944,0.83855489562004,0.519035589300231,0.861342912318776,0.663398363594636,0.374431911457271,0.817654607650276,1.5272540631727,0.329038611155242,1.50351004337247,0.197878095064077,0.431107080614438,0.655131789389568,0.73815388537113,2.93216889686855,0.633485243562543,0.335691332906886,1.38577116939968,0.970270496321514,0.0806793547671672,0.292478692555498,0.854121034474813,0.410250892645506,0.679154782249639,0.651965998276985,1.88883596798991,0.449970579775376,0.791329827696496,0.259437374267691,1.22031466099269,0.270721727377582,0.173406093023768,1.02461081319789,0.798868397805373,2.15211460946167,0.321705325574816,0.17418830388232,0.0522870614357772,3.00580507125528,0.645028243750736,0.300720012918968,1.25932612566808,0.513417472000269,1.39071390388243,0.60646231675028,2.15462111964107,1.09926355560467,0.273445468949404,0.572072604984395,0.674277229610166,0.396074086892202,0.277033742511457,0,0.868062937442679,0.299589315804453,0.560779507520217,0,0,0.292056097256637,0.486017180837127,0.440236252376098,0.599577741067475,0.405718167122454,1.12039042941591,3.18688257403763,1.08687613913842,0,0.924768350524877,0,1.1778304307793,1.37707487162642,0.752990019277253,0.750739063769722,0.335857087065014,0.684180717969286,0.0809176660849664,0.227365137659081,0.899533745710371,1.64242340173027,1.22711199265935,0.351213324998621,1.70731362779527,0,0,0.828505015389016,0.864379752482508,0.386400975257341,0.296239011598419,0.904796977059715,0.517028007200399,1.12116264783721,1.39225190919647,0.509099691933148,0.781729331857475,0.61155371115376,0.831133007663529,0.526453479058452,0.660456157488923,0.86810435520291,0.183991663055825,0.769135289986535,0.407328601773053,0.330590293850933,1.00287818908043,1.06733169852815,0.54442484815657,0.234838870483861,0.0733963408036612,0.420074881233503,0.289101425301396,1.09130337276196,0.619622415086843,0.358074264207286,0.598367111128252,0.605304680238342,0.889373854895311,0.454286881659008,0.472161243527854,1.17694376387242,1.78196184745415,0.530438362817695,0.442806338447202,1.30377198240845,0.307034192951885,0.639471866915272,0.49550463244296,2.3390472849455,1.190525103772,0.644278087524964,0.0140569670798809,0.367495311010787,0.777494286587278,1.47277004417361,0.83426333245448,1.90807415866195,1.85412494517011,0.508577731768325,0.717092877820049,1.4852526627566,0.645324636655311,1.50942009490111,1.55233427657386,0.805551663353753,0.886946673013169,1.1841831592061,0.973153728139781,0.425594436959295,0.324826844446893,0,0.303596071392303,0.843495415134722,0.495855691885508,0.433346959284936,1.39127280827163,0.614474188605494,0.716932088298319,0.378841740693398,0.0399853687783515,0.386507479654324,0.799702061652822,1.09786627934042,1.75726267986803,2.96745269086076,1.11101942346396,2.48311666648304,0.822546857955118,2.07422248694157,0.333422130729811,0.743717804439644,0.822501745632935,0.631106145409117,1.25430861997306,1.297852292485,1.15611115609558,0.395196420900516,1.24104633041582,0.52571881548211,1.31511810799076,0.297583635402864,0.303095571978425,0,0.230518944974325,0.543021374022334,0.394779169610021,1.57387647372119,1.69522773460492,1.27733946548524,2.65568246558529,0.507091422937514,0.296794628207945,0.85701914319239,0.676470797678551,0.533820468872867,0.344500161317817,0.954608024721849,0.483160428890017,0.72558935475393,0.841494958326995,1.10897801897559,1.6441710091886,0.12493393970929,0.215617967977277,1.85902652034502,0.395480517192074,0.193047407518222,1.89391495026464,0.830965137240249,0.37954000917885,0.601653829188917,0,1.29231942388928,0.655845741158353,0.172773849898071,0.665249949898724,1.03432278638719,1.37772586186101,0.27011386491039,2.16022383591751,2.43292440813855,0.628215256329657,1.00533832603409,0.217776169000891,1.11044810527867,1.61947700896169,1.04752582532659,0.234349378931513,0.84873810107701,0.134801450195649,0.240660412496939,0.184712435097268,0.270417349714869,0.105989913025942,0.490716959551357,1.23165174532146,1.30213126169432,0.524316376093014,0.679222896835587,2.51543063623248,0.820702384458139,1.22770781092437,0.851466180507897,0.0333681648682148,0.454124924081102,0.275987150977725,0.397602558424295,0.997773647287522,0.25605655462531,1.19150011571628,0.494187423795354,0.722481937746808,0.0695538342836364,0.476388946391947,0.469742220436947,0.244879267331808,0.792803889076052,0.353207870942755,1.05798392731275,0.0714929108984514,0.794568913878697,2.69863744360135,0.687835503185965,0.500840796290681,1.56687213020894,0.501808427823176,0.949150984982663,0.395491704395326,2.38101128391542,1.82871931047581,0.635567745767545,0.451867736521588,1.28454925260986,0.786512892250079,0.893141614953903,0.546560147943544,0.191985796029407,1.91570980590548,0.899712383358088,0.0468602255449764,0.852185855815412,2.09199731172134,0.333197922830273,0.112362919666943,1.4760524096155,0.52061705892293,0,1.56529656682459,1.39762336663378,0.677374734647204,0.113970345900992,0.620083091867712,0.438556345613262,0.409798032355988,0.95645742799128,0.340788980778365,1.05783632557811,0.37369620293878,0.3542591865071,0.55088865034528,0.294571935352094,0.244734868075248,0.197901867053207,1.63834774941547,0.415852968543519,0,0.583707002257589,0,1.24379214345382,0.556985539843655,1.29502413251208,0.251965897303902,0.348469260177484,0,1.44555562474207,0,0.332917671217559,0.0713551979778017,0.634885030402443,0.332497936421582,1.28075503492718,1.05803589615995,1.69378355068606,0,0.204337821543806,0.0872523621502316,0.8474726321078,2.37624981391534,1.17795222516933,0.289802601622283,0.391561197454774,0.156508066795199,0.379638260985536,0.622196169618582,0.1108850317258,0.770131902663708,0.217031020996643,0.614827045077354,0.322072357178457,1.61156853551363,1.21457893406783,0.283635930404098,0.505879347483841,0.339318366217944,0.613095100905191,0.347601371325481,0.634993636264025,1.29274523974853,0.323970543358266,0.56688615477412,1.7963589462453,0.619728420390022,0.484796025452802,0.640845597106776,0.948463672816683,1.02495258131541,1.10361613893187,0.385978080737355,0.687210057789325,0.968137949986363,1.96454834678996,0.863294642853358,0.527654403636173,1.04187838520421,1.18006445493004,0.792387535220779,0.253473070158979,0.439564843521719,0.365407105031874,0.913072150624629,1.61830209518776,1.65366816033305,0.621041432733327,0.172447575218788,1.69907450484279,0.884127429973079,0.505638944083992,0.508622351129402,1.05456372929792,0.40016409198299,0.0864901709232573,0.44577934698827,0.679752567198981,1.62401828539371,1.97600759259407,0.630377698403487,0.294459481491725,1.03988797933747,0.754674608788026,0.848525717658793,0,0.788505310258989,0.88972804012361,0.694756305095098,1.67427623514471,1.99425639396635,0,2.31362693999989,0.40351794959234,0.788339088113379,1.21938787089241,2.27366716333987,1.52031965323122,1.31020224357046,0.388238811171029,0.736642105673624,1.71576732136494,1.73453404778018,0.670686814811592,0.719867446579126,1.19206731619105,0.67476497749309,1.01308273196222,2.00385358910355,1.10011580883897,1.22364990322964,0.707486183050942,1.20215188385365,0.392759232003382,1.13381134026326,0.967151634549952,0.184297943122053,1.10772321658351,2.40431104894736,0.952986545631947,1.94246946440074,1.47033902595651,0.424957765591035,1.35956952182838,2.28501620561039,1.67821165942548,0.153530387320237,0.958817439456539,1.63188375585672,3.31387649387632,0.581902861067335,0.547154547414497,0.753564318242006,4.20853754853732,1.14028393266854,0.32528911869668,0.934298335258993,0.75106209300874,0.951689988310323,0.788225310961186,0.276273797452942,2.15025290880103,0.417499340411229,0.343263744592076,1.29679685964026,0.847568041791681,1.39177761645816,2.43507781143126,0.313901853098212,0.943708328171093,1.12893408987225,1.33038974113006,1.43275688142424,0.681485967549686,1.20416764182704,0.353823489296462,0.776762801748239,0.469407776435696,0.515940488125743,1.5074988415395,0.653713646112963,1.29880433706281,0.609371074807311,1.44307031477659,0.995370401256822,1.29442136752509,0.736500105658682,0.553331698301806,0.94251450533924,1.74324006073805,0.622845098239816,0.891070720302701,0.786807272670001,0.738465736170314,0.300903067339103,0.150343906047284,1.48156554679795,1.5709107289755,0.562323029692178,1.16680624514206,2.2391253947156,0,1.61265256698737,3.03022305988962,0.671546286233342,0.722585719475993,1.30835889459355,0.495294835952073,1.51997107647838,0.855599240038687,2.09211472910495,1.14791881871818,2.00408569235872,0,1.15275973281434,1.2962312572946,0.794503205243971,0.981709472398615,1.89554925456419,0.304082258194004,1.96582380242341,3.73698254573335,0.412918500359309,0.436983717416889,1.7340870002365,0.989805327704827,0,0.442874510160665,0.842569953287607,0.198740302302906,1.03835961985859,3.63589461488522,1.08402615535953,1.04304970577296,1.17632775184484,1.55193233964383,0.36836193507583,0.9110595334276,2.43313519162889,0,0.842123618174718,0.528153601940027,0.851027388527446,1.27260612318412,0.805483976649946,0.462088346447782,0.83313103040724,1.16522699855545,0.621877361446546,1.66927263786266,1.2324728872468,0.084797131019471,1.56754593438288,0.778302201323965,0.858228122545371,3.04885565109344,1.88710019796575,2.82291162042973,1.28532633850606,0.855289700861414,0.468430776849291,1.33080306380436,0.772590995853954,0.567055704875297,0.316716565774123,0.34043060172891,0.912633924274291,0.759849524467219,0.191557597469346,0.856306895930614,0.297894540684614,1.82804658673202,0.339688012978524,0.494150652469947,0.824710836545718,0.463425550589387,1.23840596227135,1.88089079842369,0.731100588422451,0.374830166291275,0.180824992158734,2.06562573098955,1.32545261822044,0.33748035663139,1.75853412631747,1.77687597085058,0.774878545963974,1.10571561965621,1.64322311172423,0.187631577567429,1.65977571572988,0.306836170000905,2.22444813611196,0.74193547610231,0.0692133958144844,1.01269023376302,0.45029319328724,0.592504398748592,0.546488040972424,0.252253358822948,0.101889519398206,0.668683925917548,0.558520389720266,0.822774192802755,1.47133835657537,0.453438350628663,0,1.75540122385554,1.35769162259186,1.48117667933034,1.00218546951434,0.0679415409207027,0.685341872062924,0.959029703197088,0.662228017372048,0.168777313964755,0.292924245129142,1.15519905173475,0.190340516646656,0,1.67570936196884,0.308477376594961,0.245313717219472,0.976074701161925,0.386284528810456,0,0.431773879915728,0,0.439025086330283,0.320391556918101,0,0.123862161910393,0.0648777483524527,0.482166054799852,0.161071676110991,0.190665045529936,0.0337246364344917,0.145973462588712,0.474226068143841,0.169795858426254,0.120469925962965,0.177165673088584,0.131326864907685,0.332104667925631,0.073947431579444,0.174240470291774,0.55027628082558,0.0706856682353103,0.181630540955063,0.483466419005782,0.042091792865185,0,0,0.155731101746626,0.210394350915679,0.44655998448418,0.113373922449071,0.180149516500421,0.144164391605101,0.198236897235181,0.256334385082204,0.0253983890100199,0.104249558666257,0.835406955247063,0.617396590291589,0.163536602530658,0,0.0444229379970099,0.0337635342882444,4.22136593940269,0.337486408058234,0.0820903698527194,0.307638123354618,0.872073042433343,0.0816045517523514,0.0376827492376681,0.353122937447014,1.61806241986737,0,0.0407798154018519,0.0528829901719105,1.34591749104253,0.325096580007975,0.644616993456683,0.117756605209137,0.188274691177668,0.568057309139011,0.145913614009925,0.0309647233334301,0.66509710651767,0.708554541141312,0.0456017703125197,0.259408327519364,0.186271077353706,0.0499980158022749,0.445027430585197,1.26596448748338,0.392785604394096,0.524773912856243,1.12249647068529,0.170105038549334,0.656668614168971,0.867537207963648,0.177699442509916,0.673462984978295,1.15836223532796,0.562782150727699,0.298443185484501,1.2171630786096,0.833909360945511,0.361713345096303,0.432357624519333,0.996833418487981,0.179316002552306,0.592128047350187,0.116718599468444,0.0753543626028535,0.48520638713745,0.748853627037199,0.217991265874069,0,0.368882307721395,0.429568083337906,0.552889522939738,1.01353086435439,0.224896743641007,0.168953259591631,0.161270108975153,0.53488424203267,0.257333890546944,0.189897411163833,0.545507818966289,0.746843907226643,0.137158416053585,0.313931912193504,0.347533908703011,0.55663953208353,0.283305340270383,0.986943860289963,1.89277375079734,0.41825688528346,0.662283535265374,0,0.512409961875521,0.217919322392438,0.435849381499445,0.499150216030541,1.1668561731644,0.274476371982732,0.972544958580075,1.30307113296642,0.385872310132468,0.506956098781343,0.461169360177793,0.525354099868676,1.30867016573928,0.48283940491782,0.854676247110752,1.77360438190683,0.881406203036246,0.662149887588104,0.564078622759873,0.470994914746998,0.552517251153279,0,0.463192408961366,1.12129794252828,0.706953342232696,0.290044864988637,0.814823556069326,0.748186407773966,0.0560808557916187,0.526406402880698,0.0759415250637229,0.447254494121381,0.810675068090619,0.144599840538882,2.47254001947217,0.578843673181729,0.768051325988238,1.25525416984911,0.599575836861444,0.190277422891487,0.154876099165168,0.288254956135715,0,0.200042255451902,0.278344751467195,0.250508205098381,0.465126093213062,0.274586935541838,0.0584165282158564,0.248178976052293,0.154842536456494,1.6149058017899,1.31590121662925,0.209377501270219,2.36351930083208,1.91369596632557,0.10181423550054,0,1.63089420881102,1.76272937327701,0.108684490871645,0.502948999834725,0.374396186665032,0.184627642140329,0.37699422012589,0.254465488703207,2.71049017681247,0.219698746092806,0.333871701129329,0.635041386809732,0.207852630491653,0.22153499964215,0.0840227526829936,0.575695707419626,1.05613816625827,0.44619725025186,0.446752431641821,0.866148297614639,0.240314451466619,0.250355756906317,1.22144962128372,0.581355296833384,0.567911721079951,1.69494346946427,0.679522887094592,0.771943876580696,2.7267881316747,0.447772142454792,0.483730147951509,0.720199651211874,1.46824756137039,0.527246731991489,0.232632516525846,0.84151589123248,1.91815645360495,0.0406778510532175,0.199888776040033,0.727976201400168,0.0480986068194085,0.539053568095709,0.110113306035304,1.0928298551451,0.176366435847331,0.202679248057868,0.464217511208083,1.03890389302795,0.0374058391317559,1.13427746337932,0.889419026708746,0.377353451215255,0.699283856266652,0.803470083205787,0.561918491370324,1.56108560612534,0.301818927487681,0.627731679541584,0.280243695866017,0.682676664317156,1.50898229777393,0.750268278609771,1.22967528158645,0.84707585257013,1.29056477374101,0.417070770754341,0.706650250924984,0.208831609468989,0.408841833575304,0.98690892041638,0.539321624793182,1.78909703928022,0.382836216605141,0,1.26912473373113,0.989194242997536,1.37988541342572,0.223291558400042,0.35647367629122,0.908078886813442,0.74590591636352,1.63459563808784,0.265380123321879,0.910277527267933,1.45825652413059,0.82374446980832,0.690278339815681,1.19170034444442,0.856078169263948,1.0771445367641,0.803720279403549,0.951972661076397,0.882606272395775,1.35170238404001,0.399090792956831,2.55277052443906,0.388245755695546,0.242094539082845,4.08826809009551,2.34353952084066,0.60408840811424,1.83084145208819,0.791739736598362,0.823481988656455,1.80239333950878,2.47225900167944,0.485918084231998,1.09144461107927,2.13318208830015,0.488144878841648,1.15700877450635,1.48794676519606,0.413785779149004,0.650468638449372,2.01848605174345,1.36127034720811,0.159013487354022,0.863296228939291,0.768468579167768,0.287947992804491,0,0.444255506149327,0.411301062094195,1.09182032164134,0.249249813076397,0.757040746548266,0.279127741772318,0.38843412695024,3.3709359299381,0.794744399486434,2.16575021943067,0.069158940206275,0.161552486844851,1.14255655657939,1.24908788465919,0.991607065170383,0.151646747045555,0.315620714357964,0.431932911974553,0.374293681649647,0.669755913468113,0.812687231673324,0.559645398822231,0.725597294206818,0.64337136278549,0.489863498923626,2.68637053870618,0.355527941055377,0.740253123508901,0.580015587771421,0.249511360698461,1.55201696725122,0.82794906450662,0.970327563595654,2.12658901132615,0.323311264708336,0.360302465499993,0.204263440825897,1.97909611757904,0.919031867738453,0.828869574245468,0.3800112464273,1.22992810026825,0.73578114597282,0.456344097491486,0.311745016893627,0.295135484158915,0.703349693660567,1.91929126073948,0.387731108953392,0.552957180520243,0.156844048038768,0.75029606691816,0.428994460592801,0.736637083960275,1.02598413065349,0.557147628880199,0.774253624965214,0.712273883786864,0.6944233598861,0.442642587932022,0.324978764059591,1.9556271264238,0.713379090924389,0,0.399844066888707,0.827335010686982,0.771142959229742,0.334437500474151,1.85983083616182,0.425666616856014,0.575735394645767,0.383886844910452,0.616823838983712,0.643884627899086,0.119020649172112,0.553301712928997,0.198329192932335,1.33785663858865,0.0368588909511768,0.655254729678817,1.08703098648202,1.73383631549151,2.50901048135364,0.322892877497395,1.71799461702943,0.652291904396827,0.553176947424294,1.29001265208822,0.455839824408324,1.02050575723772,0.791005518743507,0.254124395362211,0.336716188587704,0.575685059441495,0.338743754893846,0.52547658403953,1.3798066929279,0.270296776876301,2.67022171120432,2.10558301242195,1.12958814353096,2.30782135108366,0.973759390288346,0,1.23912304171677,2.68292381617471,0.441428235415867,0.218380690724353,0.435993461753014,5.83967648622375,1.15159258830879,1.07269853887275,0.210307562485909,0.179865661255666,0.10347682580275,1.51038994184212,1.84378209375556,2.49368601366819,0.171498796273462,0.718458865713305,0.340378822890729,0.29916258422804,0.453181565320082,0.871045609587841,0.180032109843173,5.26038252071924,2.23708243378616,0.209354666315361,0.714170770386725,1.05126002310871,0.222429559950761,0.0991086688128962,0.652786590163969,0.98668113537601,0.241048771832973,0.409734589293215,0.40209454439029,0.297207854096281,1.3194766055883,0.0771312712083115,0.443962401666687,0.554641892767072,0.846538245913402,0.890805347026973,0.673745183086353,0.267042290992882,0.514275196679838,0.518651959819336,0.763871293863014,0.386602388864647,0.573192238943879,1.10389693988434,2.81749064625566,0.73577213613364,0.474179333620698,0.519946426448922,1.13606667113433,1.13185284596466,0.548239319575263,0.447592102727267,0.759898087364175,0.0633687447175664,0,0.46548629403524,0.831422477435564,1.67081450850926,1.96522759706716,1.34668355253258,1.1711120113069,0.491794617905513,1.55601080761751,1.08539610121433,0.711899245112638,0.229057873352817,1.14526789989976,0.850444205238174,0.859882109508257,2.07113487115717,0.398387586581713,0.932935748005284,0.0548013933277896,1.20942903456687,1.45364663242453,4.39148282278501,2.22011167656435,1.66170035400675,0.931019529493523,0.525169752614806,1.39711457463206,1.1410861362426,2.28326663410526,1.80884507448222,1.64977822726581,0.251598279824288,1.05592445462949,0.136891953754389,1.58450076442632,0.187372503399333,1.18208013447578,0.5434741067325,0.847787700606223,0.575253266124366,0.454018451815313,1.54718426589706,0.641395185585812,0.410002047723887,0.390005280366241,2.71290167419504,0.716511598680345,0.920260519977699,1.12459348707098,0.743628707478883,0.452415468751906,0.301326591753198,0.75590536511315,0.359324374751704,0.662239230517752,0.642174666695514,0.858942206218531,1.21533976419522,2.88069420295265,2.23871918582152,0.63313339396552,2.10166466431629,1.40550502754187,1.67698316132897,5.20241137009824,2.25011449928474,1.72837115830366,0.950685343340219,0.37963925899439,0.877326494906849,3.58529909029677,1.52793259116714,1.98825676767775,5.13645743659596,0.419785881334223,3.04917419053199,1.19546874181942,3.12472647560753,0.333996919375547,0.727886482778114,0.724571259644295,0.828008391312413,0.156347296166425,0.678894908179608,0.721550628284863,2.7054316746505,0.316343650254826,0.842813942932681,1.22072741523893,0.27679142770191,0.189333342345679,1.04537237203811,0.806611124109844,1.31853782070326,0.474953892747511,0.24755643493276,0.34747177226997,0.119791476549366,1.01259935055844,0.751293175705063,1.89409987425165,0.58318487133663,0.213511156360671,0.302405624678042,0.274781802567505,0.745510138148881,1.20445689784049,0.486499381294586,0.405848627425359,0.926492128664753,1.77408153440714,1.70850112877947,0.911585748400849,0.476670975302809,1.33515278623991,0.423397453033992,0.20514862311006,2.93945039440763,5.04993935471839,1.15995204473292,0.113557689288135,0.042600495621205,0.0440984852280754,0.0459750621375322,0.0684434831696541,0,0.93804718634378,1.00920096028597,0.311824518164912,0.105514893957357,1.03627895567329,1.88691492064115,0.650297675247048,0.376566114027608,0.95904825623567,1.03986271875457,1.84598615236975,1.17442175946767,1.32155871767459,0.792565451870365,1.22246208121522,0.174069899591002,0.872324466724363,0.828106722151801,0.851462422513728,1.0803295237541,1.04001567884788,2.35123820599277,0.972260295303928,0.599296748290334,0.362685891088111,1.32680940970845,0.541270586522935,2.30379155921842,0.595747494504541,1.23059468940984,2.70263094968883,0,0,0.239921252073891,0.488024429810084,0,0.452505823532252,0.638505769873897,0.164653585280594,0.181251425382921,0.147190887731079,0.629375739305382,0.111776111791392,0.899387339145966,0.801295095060898,0.340727920214042,0.316760002600045,1.89694411012491,0.439042219515758,0.299576773572334,0.420119196620985,0.0628696742059185,0.0562218382265217,0.0637465922326806,0.237249325831513,0,0.82650968272129,1.88268334645036,0,0.604799795631005,0,0.337008838192978,1.01810214456314,0.539866222163731,0.132924626789946,0,0.295830796592076,0.430307113984131,0,0.384343290760432,0,0.154720589695666,1.34163968656135,1.04687586724216,0.262047024171314,0.315529133625611,0,0.047867651390449,0.0776952915525888,1.17221354385561,1.04292304477029,0.669235442152504,0.958416947814664,0.34536276321443,1.0253276530822,0.0635886731196737,0.49235827173622,0.0854396134281588,0.0433144046666332,0.0737834972162689,0.0982453080604659,0.236472780231401,0.779013400935345,0.803999849389329,0.19444843726874,0.138893087743253,0.39511875086384,0.190010982559927,0.549122937650091,1.36221064324845,0.250460786583324,0.0711389223434724,0,0.366517498218853,0.325702207110181,0.131108330164621,0.771949959721345,0.526230103971612,1.0113339706481,1.02698060619828,0.0820936408006039,0.106278762907255,0.497340226848422,0.117690255839558,0,0.173874498473763,0.151784537446407,0,0.331950173000582,0,0.665139867904483,0.256817320340011,0.125467149622727,0.150751763180929,0.169109167214987,0.916545516038466,0.411388062615589,0.20785587820374,0,0.544596168300447,0,0.420452219323965,0.382393792548164,0.0277536576190775,0.0331833400742544,0.266719867907127,0,0,0.0521930035054774,0.133167881095733,0,0.239756196103708,0.987059592577596,0.365501620798267,0.281568883879789,0.106914297079344,0.902443325062856,0.421067607700415,0.559437090095755,0.261379407059977,0.082889351075164,0.123877123044109,0.0654161088251756,1.34769003168906,1.18161527648113,0,0.1216316151955,0.111749809307605,0.177846883187613,0.140248588810737,0.726378287891561,1.24517094383549,0.0856843451812933,0.814778201592124,0.105041193959467,0.19473637096158,0.0360631259122376,1.07298178730859,0.122368577916421,0.538740474387092,1.22776571602223,0,0,0,0.575455334376626,0.503334486257229,0.0939653448521861,0.0331060760105614,0.142800283157148,0.257778844923238,0.335555171624156,0.435372459612781,0.309906432496369,0.183613548605764,1.08865113245526,0.52626941248099,0.818990407207976,0.296889719397406,0.169560755116297,0.347792970646351,0.121977274918449,0,0.168010012113501,0.207720092619099,0.754922553883835,0.0864468262623003,0.47885255456648,0.308527003332443,0.389963223109249,0.466589535094958,0.150722133085985,0.636812799501388,0.0468531029302446,0.538651389640725,0.229849122255951,0.635012309330971,0,0,0.224471042118683,0.14974477867928,0.240147363979728,0.304347838654352,1.08343669207164,0.0843330437785446,1.05938712178123,0.504211956564816,0.152432404460516,0.534512274589461,0.735581096971928,0.0383791470149484,0.16430113702748,0.158777266380364,0.191899913882049,0.272208726231398,0.162940868231044,0.334010882711166,0,0.486910391211096,0.21020281087583,0.233252324629998,0.133624677881146,1.01101752376513,0.59192868391319,0.145890664876741,0.768550558705296,0.496233259135361,0.778545866828,0.246712100531861,0.114877242278381,0.0459180592374684,0.429737876488788,0.741568893700899,0.0521921686443203,0,0.103758392288446,0.253901552545153,0.396379823085475,0.424202011773028,0,0.181330946133639,0.570249279759356,0.0561000057891893,0.232421310935305,0.125240450362863,0.323911878733128,0.0893761132024003,0.341465600326144,0.134426123069704,0,0.34509054386338,0.347324357617446,0,0.734984077347948,0.476454274170902,0.0745179040446784,0.27616074211624,0.655299341038192,0.282204447107722,0.0723537648951122,0.598585976040513,0,0.169648362191809,0.0860263562320818,1.01871036579411,0.346136553186885,0.204713673522313,0.119429887078187,0.0899237102235698,0,0.645261728592809,0,0.66401673361977,0.408678170582369,0.440229766315035,0.0958447742843998,0.212986990741631,0.0373272544506111,2.04277459428417,1.43094945570579,0.713179255146009,0,0.223838925158003,0.370129677768363,0.425320722040855,0.245913016532544,0.509576469496548,0.171447811675028,0.30902294393454,0.381876832208802,0.0742100167072751,0.303007987190909,0.424926279273993,0.137795967738767,0.206430929666088,1.13474731239313,0.107252250238912,0.139107695368423,0.135299895558342,0.378412850750602,0.253533096819566,0.0531822527378614,0.717866646143722,0.434804342431691,0.069232097266369,0.917957178793653,0.403395350205966,0.277950598155258,0.951731012859814,0.140898253842825,2.15506916676431,0.543737384714034,0,0.0602689258685453,0.210039807233241,0,0.19408452991997,0,0,0.777651580191279,0,0,0.181423184713596,0,0.873125737037726,0.552150786824309,0.186649383357923,0,0,0.300277213297561,0.329520892812963,0,0.78968835878929,0.319614466179068,0.620514156598255,0.103260074825223,0.190030711200588,0.090464188946603,0,0,0.176234676182782,0.230982448461656,0,0.352386788296883,0,0.877288011384079,0,0.842050382534045,0.522494719789551,0,0.332313805690503,0.360635314796769,0,0,0.188214799239876,0,0.370794798598024,0.0581931771309058,0,0,0.127072863793804,0.237271233951403,0.144522837254143,0.352028519709375,0,0.0954767269862323,0.129806579011662,0,0.695709253526288,0.176885696884984,0.96957969283047,0.129173928587717,0,0,0.272844962580616,0.426958691853155,0.142901682193906,0.140791741392756,0,0,0.24629376167655,0.586428591673525,0.130343659096178,0.183918384926831,0.159469537680233,0.336005678052345,0.218553045871895,0.0574901991914495,2.83245460891252,0.108789654113222,0.119735444746577,0,0,0.628026325928035,0.108176093777206,0.052856426229003,0.107119114449504,0.186438436749085,0.268462540527596,0.314945894602941,0,0.173031463878025,0.255054954604406,1.39985248663372,0.115492754052102,0.38639600853918,0.06796493831516,0.273170914547855,0,0.176962268245482,0,0.161837388667551,0.23342058069279,0.164486382618303,0.376509994156066,0.374645573989509,0.086227501335604,0.0565954582952645,1.13762103303295,0.0492653781047476,0.233045015015003,0,0.185659797054586,0.420655833082099,0,0,0,0.215677354243526,0,0.214277772665525,0,0.188248100983637,0,0.189916382508998,0.618100488607542,0.483255999720276,2.35452042885088,0,0.308882728134338,0,0,0.273461463116968,0.166338817059634,0.4381544313926,0.210170635640167,0.140274769529288,0,0.288015936814333,0.111707350479318,0,0,0.439166615238905,1.28723645637575,0.489930582161481,0.557343719523551,0,0.308704527262245,0.290563476266881,0,0,0,0.121901573638461,1.4056874560536,0,0,0.130423663489629,0,0.065024769384239,0.507767447518975,0,0,0.27656991516986,0.165905380485387,0,0.693799872691289,0.0587057802145539,0.306559732090531,0,0.265070174456679,0.111874908715963,0.54926303988193,0.207029724465489,0,0.479245050179901,0,0.746185304815859,0,0.876701992566527,0,0,0.0602887121801277,0.328151710792409,0.603315039376806,0.344639003031328,0.629054409394785,2.46683068815406,1.15907376402867,0.639939211576768,0.368738293794424,0.680357666734988,0.340054259793535,1.33830043609731,0,0.521496445732023,0.587782807887685,0.259318049866973,1.1909049502206,0.230742232086873,0.447470124151839,0.736448150941427,1.05517760308441,0.373799641129974,0.990569146512876,0.381322139220111,0.345617900927052,0.842237085836055,1.69542018327818,2.32906732290991,0.787022918385001,0.520526143973305,0.54215402336984,1.35796181255047,0.575524168607199,1.11020018755534,0.439586331743176,1.81109982790103,0.46322171069736,0.334571707926224,0.78465054827523,0.509393439601373,1.59116327633661,1.09785077640181,0.416464051954806,0.379696587899651,0.434452625119027,0.993668130888491,0.692301760301727,1.09812124507715,0.269760536312094,0.18367007520473,1.4728968669675,0.0973192618751996,1.76383378251074,0.644273472243326,0.145230851584803,0.80222722070808,0.788028477019613,0.538401883348507,0.494643146553296,0.734701383971484,0.689064820989347,0.369155995112109,0.727277468166351,0.264110134957428,0.522226531640579,1.04332742483477,1.34612406867353,0.651189034951158,0.451401462472695,0.825862460630019,1.23164437319502,0.606137642821445,2.51025963678821,0.332265448858097,0.425643416568753,0.113724232769626,0.482308887871209,0.946634302999827,0.962769620872478,0.112013480028935,1.54868223186729,0.718585995037094,1.2454007375434,0.36334290041865,0.989747427449126,0.519370803984932,1.78663638044169,0.387405556331253,1.58897769921636,1.67632518713554,1.01538702229213,1.16758337136942,0.992266880200533,0.176210289111201,1.57091121407346,0.799492281715844,1.20545376053802,2.00765981657513,2.26583472256269,0.342549739271331,0.802279258983466,0.419562405903007,2.13355629252085,0.978241033582678,0.812359884269712,0.25406124796118,0.983197786553978,0.565681980435032,0.451745696992325,0.186054368808061,1.20817973831064,0.626890448579817,0.0653419307143412,0.210637231010265,0.217775424665375,0.215469118852668,1.06443728517865,0.751554556247309,0.151710773816788,0.270875147647561,0.419056654153537,0.377304993039345,0.550399327191151,0.19820294501637,0.248433309582047,0.894380320353146,1.11619106385367,0.573215510971338,0.318492702011535,0.0716185298645634,0.664075096246442,2.18588810630687,0.394451581742714,0.508133693933381,0.478060613928174,0.861327506366984,0.242824418494361,0.917996806896971,0.668437862431243,0.139990421485669,0.526051378997188,0.777612279437235,0.650653366233333,1.00605683037591,1.42235740085085,0.535552347480302,0.388132765231352,0.560230421013339,0.453144576883242,0.781055319976839,0.689144012150344,0.692208098926848,0.0595938148583868,0.224819341483894,2.19497585170908,0.210013365732702,0.384994711283578,0.579592039594468,0.157804062340337,0.687119828663545,1.07724641763704,0.290602282034088,0.184702661312935,0.684042031000949,1.20701760102344,0.236869491408656,0.384986867255997,0.347903610498594,0.730125427924114,0.250644873275028,0.317896771523484,0.758967695804997,0.833417184908877,1.43926812441683,0.588980001111199,0.655648214746901,0.506831422833385,0.354690239216263,0.195835134259279,0.677327913847137,0.249382716749494,0.405659902658859,0.18859791277612,0.243330665930022,0.309680053001956,0.305687964321899,0.327910131278316,0.35684165785631,1.00327192604032,0.526687334745639,0.87055568524142,0,0.634379520013498,1.60643369985985,1.0584851061327,2.37766273594476,0.956845605709788,0.249590968566306,0.950093451352311,0.59285807765405,1.18003007233311,0.632462082071297,0.676105795702114,0.0566532615653826,0.223974807974749,0.799166817937143,0.16592698467961,1.06284474377187,0.885598571771185,1.6209490326044,1.17849398994679,0.495032291513975,0.373048460038023,0.505538340746951,0.518815795177449,0.661218294745334,0.332184315744734,0.223195160806138,0.211666897586353,2.63717758149081,0.83351757654728,0.445888759109325,1.54687865959019,0.769674428090998,0.307464198664934,0.577886647154011,0.105598566580916,0.877102647792641,0.41526228972006,0.59342519875279,0.416901122688201,0.118621792855912,0.993720005617403,0.440721667233247,0.382294289312001,0.882300126457813,0.475522503258974,0.187688580308502,0.938403235467042,0.315876298180216,0.263135390952218,0.115451470632542,0.748001730164506,0.935668687721026,0.790594066699203,0.172267574160119,0.293528224365569,0.775025080694457,0.112114396423831,0.251453703188648,0.599342076479704,0,0.181374839710577,0.463655829904472,0.417206042686992,0.708383173153587,0.0490336332596927,0.340442632887991,0.185725756772055,0.786259693768457,0.424999029894442,1.28794385697884,0.73704205497718,0.723611856110721,1.48971812408262,0.337254380465772,1.20325128165788,0.448040362091757,0.737566495761127,0.985501450391927,0.868470265813713,0.642222827216487,1.14025055238111,1.87906660490413,1.36759069645383,0.527278565153981,0.263598269165587,0.528128391014015,0.496332979314347,1.25588378958081,0.111878379836229,0.37360236728372,0.356071335521205,1.32646026428822,0.277535270347127,1.12582762595593,0.3228638119161,0.295195213074177,2.78164696485469,0.390466178381637,0.874443752491255,0.487431809917387,0.784480531092428,1.88891052851651,2.08006272741825,0.69960404475293,0.372392181944836,1.4349462859827,1.27389478982846,1.35474213739985,0.361708854038554,0.757273348879082,0.273457404912135,0.520918525687794,0.427495687072384,0.924826258420337,1.58885540577216,1.42323392681081,0.590058993516758,1.37691823028944,0.705638247974156,1.38134240825994,0.703607503428473,1.30162685928234,0.521160317240617,0.704415805996236,1.81516920384,0.433182099455805,1.2568341640011,1.44234692590983,1.36648571741327,0.691986287398132,0.43396573675939,1.64943105820777,1.20162068867653,1.38049546251152,0.71443905115526,0.852326263753688,1.14064497947799,0,0.478791683341084,0.785042851370022,2.07645603691877,0.642317017523166,1.15331052030411,1.74794950076629,0.498677739963331,0.399281801032278,0.441778575087056,0.692184347792871,1.03749531361525,0.641853956126362,0.764448582279646,1.42767530249766,0.653099467049613,1.52138749399788,2.00564574598942,0.143569744568032,1.44381455430946,0.431041057884503,1.15077671436784,0.0655520461697786,0.774942625122639,1.67680822724463,0.955416667796466,0.177424162579399,0.423998897922939,0.471310988300476,0.638150778864473,0.551605591136359,0.227529152890492,0.363090205416309,2.09207097786547,1.37432506832373,0.133589170502511,0.431431158107193,0.500440059420357,0.751422500718382,0.600196474921011,0.683265534977482,0.373065726559849,0.126743882913762,1.27214684333659,0.191597770170088,1.98607957796232,1.22857183387399,1.44748292551013,0.3419986090679,0.196631592361792,0.722963449906765,0.375714412985948,1.08228361563299,0.563871733972545,0.419062696603095,0.905611223622806,1.11916424764901,0.392876036056384,1.63886632536203,0.430728238145214,0.762739151647487,0.905749068515398,0.625124108027248,0.696413647517689,0.71934126290561,1.19492543801305,1.01203325743057,2.1971586498878,1.60587214436735,0.203907136565756,0.776156219006529,1.1139231530286,1.17582668114074,0.59645623123095,1.18220462230997,0.849180472811742,0.924068712446681,1.73438750429392,1.12597967076739,0.89020619103396,1.37527532361183,0.643341344330245,0.722028777902844,0.164635179778104,1.54299988722018,1.43637135076422,1.85097459974456,1.53595439562981,1.0944948532861,1.46876732382631,1.25560557021439,2.37550619108963,1.68103000197457,0.21298948010725,1.08565620314219,0.488594185344046,0.509885723063635,0.270157292152701,1.46197010116465,1.2115279193019,0.74303923325981,0.654277880676369,1.36014871309117,1.21166203886725,0.576743858151775,0.647941651955006,0.56816639323663,0.765674765851404,0.321120883207275,1.00488764122391,0.488673974293184,0.515803267138968,1.38490140878373,1.31516101317809,0.421519982436252,0.870104271124584,0.559169709960656,0.568734548115665,0.536503149819056,0.394546408794971,1.2417901611358,0.394155207025061,0,1.27082612189937,0.811428447791365,1.28667489860743,0.382495613004471,0.351973923971068,1.39429242511135,1.28940483802748,0.96842331714322,0.920613516289093,1.18759547466647,0.782965237148602,0.820565644784636,0.606236587976363,0.58071781683521,0.782226539012199,1.19335915245874,2.80833974046435,0.914659424449523,1.08728834946297,0.0701766177423506,0.213659461161376,0.534839332179066,0.712152889830245,0.208405635464282,0.419764204007814,0.654001017060973,2.03704640927079,0.210402580581973,0.862993016919029,0.389696428234861,0.273439500931006,1.05752055961386,2.25629271392439,0.411692650021317,0.731273798262144,1.48532686555084,0.670061233345698,1.64921811717499,0.194753514062355,0.401015470035271,0.838475427570483,0.975373390855019,0.278916338214638,1.63133532795117,1.19953453045358,1.41065642222971,0.393663310167131,0.641543809554984,1.59348094246905,0.899326622081295,0.193437440898208,0.732715508338506,0.251017704189502,1.02141789629802,0.427603920245133,1.12053628032754,1.2686841037337,0.311108034966952,0.133550900460346,0.672498662962138,1.40996306681688,0.50333357025104,0.769408354338848,0.791154509826848,0.277878846622423,0.620052397174209,0.571732915035313,1.36568413964666,0.273755891225375,3.72079842039721,0.774801815858546,1.40980202867599,0.584231349993276,1.55583382060705,0.379579931713219,1.1892712167785,1.77026454062252,0.255006476345209,1.71861724960001,0.440368625448479,0.811540080947694,0.257179626972,0.375355218371715,0.545491015001099,0.49635987701304,2.87261071392375,0.222373047872962,0.278510922689432,0.244837142229038,0.0379236318551971,0.443358401706774,0.542274594226342,1.6595450705696,2.58258249633583,6.20025603145092,1.34502841568623,2.23206145345403,0.479673444065316,0.300795205069363,3.92122265291399,2.12147970821474,2.58503799978609,2.19061226872867,2.26969657374836,1.37294597062258,1.29689081155325,1.15975381792332,0.571224201098462,0.359064000935212,0.781177219421726,0.437435178005044,0.956646995459959,0.596137027845818,0.447154074438044,2.14500730221382,1.32243237293099,1.34886976151828,0.511209940262164,3.88467270086128,3.31245113468553,2.13528278652317,0.894588853700079,1.48678850068413,1.61666257879978,1.74135294696344,6.29748132070726,0.846807796226022,0.778080536789235,4.05190463459886,8.22386968327698,0.741064809443756,0.655294119656732,1.29872047913349,1.00112702584644,0.435546030065827,3.36713898557106,1.13634234283842,0.472762559201309,0.339691547083291,2.85584621773901,1.88347184739959,0.282741064025357,1.45505598458243,2.34699318670414,3.14951464399675,1.95239880304255,2.01295763028658,1.00242507865799,0.455533209626072,2.27038361904309,1.86259270801323,1.25091307876722,4.57168651688557,0.72658101196772,2.39877446910411,1.63375900550806,3.35105795044832,1.44700359055256,2.46748034806383,4.49738243573647,1.97118705502476,2.76150868228585,2.66880285819729,2.84196104611482,1.00820646914998,0.861164542617593,1.66638576024412,1.74957588533484,0.800593886729678,1.68513057727111,4.08533881946313,1.16905335037249,3.11655156961126,0.305438974483119,4.72414207420924,2.96753938047653,1.76487477461129,1.97816926547047,5.63298246357688,0.234808833826521,0.926122953521343,0.789115740841479,0.305355034327435,0.873415565943018,4.04317737077089,1.5000621635377,0.513305785786601,1.34202672260054,0.846248904628113,0.141763931875364,2.36827386547652,1.227164745135,0.3239176415721,0.673371891945624,2.93242537184134,5.96625600343766,1.10205943147052,0.361394220647295,1.46863127571963,3.3274272532765,1.41226721110358,1.85647901473563,2.69258770683902,0.517101400080838,0.675034243823894,0.562525060948784,6.88548268138519,1.8575992771728,1.50411898464367,4.96313856236146,0.910600664616225,1.45754281301552,1.37541371869932,6.36028058867288,2.95085208641487,4.61401272446308,2.70169764355364,1.07783862012896,1.02598462658364,2.23362121052106,1.06624490698725,1.91069812889555,4.7043888185937,2.73152497207504,2.79772999550821,1.65708754313702,2.58496298161942,2.36573480412808,2.75290419715388,3.49224289192627,3.03578576399731,6.25737239731916,3.18038165940367,1.97397290493119,2.64075973101586,0.884692469604726,1.32415562671632,7.86264169648472,2.34033438211824,0.845216504083488,1.55156031291514,1.28812251384071,1.74803050706778,4.30458546718396,2.22198871939628,1.29787400351989,3.34813411599933,1.13099213365752,0.748791812740091,2.08795137387734,3.57022063992346,6.13002649341471,3.97658269186709,1.75714446194511,0.4989738212869,0.0387381748115701,1.43359998194107,3.17499596849157,3.22118309075114,2.21396249303051,4.7368396540159,0.316532031558485,1.4669493707672,0.690399215390176,2.00483321887435,0.833122446514827,2.1553256864198,2.94848348358941,1.23904603236438,1.82149471294824,3.61861431830573,2.03633111437756,1.95191784628036,3.48079600336332,3.06072947530813,2.41722003374858,1.38425431228654,1.39289713229946,6.81190394106231,1.00997342253951,0.506460478636223,0.470969933969941,2.00159365816074,0.398994075902357,3.44143434424987,5.43526371778165,1.55387064054379,2.47421822723509,0.827256467081628,5.73880565976988,1.14344958408858,2.25664838988068,4.54028215552496,1.18586527700744,5.13414494157941,1.48116562044469,4.27343256307859,3.21411452922334,2.66332640052914,1.80124227616621,0.243798722736721,4.16041844826295,1.4130312999272,3.09972104795362,3.63426450095869,2.65053940760939,2.40589163971385,1.37363930320467,0,1.39339972498682,1.17623020737852,5.13812145916342,1.11175982300009,4.32678683572684,2.90336226149341,3.5013839586295,1.19099702106382,2.57062953568155,5.10440876760144,4.79287222534218,0.624132532946166,1.36038562883397,2.21648280302458,0.591145128343478,4.29640745915616,1.9737089824287,0.743058369100028,1.81620810862111,2.14951399366306,4.18269547525507,0.185970288793784,1.26068089428372,6.21078759621619,0.193914271472673,0.343644660690699,0.563511071496398,1.90515997826418,1.3252764524673,1.99759229803945,0.220349066809079,1.95219078095767,4.14540682260807,1.85888891078556,0.588128337104077,1.67288331080645,2.81243723038909,1.74589516295572,0.907594628253397,3.66966290819283,1.63022046287243,1.28123140895222,1.74948020581616,1.58516782970308,0,1.26380369815881,0.49644741890242,1.71553627580385,5.01595693781859,1.49525256594208,0.614997176798109,1.09830501083225,0.837721513900621,4.78365895274872,0.770035292597279,0.904918719575362,1.02613927762526,1.76438310105102,2.6733171609922,5.62789380201778,2.22683371607766,0.924267905160236,0.362511408593398,3.08398814700675,1.09750966959803,1.22212384896236,1.22751898719919,4.16358599981222,1.3602254789517,3.67469226868374,1.65708339709924,0.427769204199045,1.38586060643665,3.6472234315105,1.1676719976796,2.21867269039458,0.149476598983201,0.638050475761033,1.58758356308136,0.588036012121058,0.571076795873386,1.1530562370164,2.6437569289413,0.208678313265102,0.344723983019911,2.46971180069886,1.12508237466618,1.71872459707251,4.63900230949389,1.67031236877031,1.42973217848101,1.31996700567026,1.03196041855383,2.59275122735795,1.4716078491207,1.12430033969238,4.18462703917855,1.4367210018555,2.17396305886927,1.18371008707651,1.73146002126784,0.513047509889461,0.228414833250791,1.27977323453031,2.34592004506746,3.09987014766586,0,0.572058242571682,4.77474026018655,1.18587605755497,0.360026755997052,2.93748940773136,2.38431151336401,1.45283314090023,1.20258697950529,0.290606764091933,0.747818145780999,2.40768884225678,3.35270203626673,0.885199488271948,0.508980777061522,1.46493012375067,2.72524425169515,3.58506036021573,0.220238684503708,3.07744810686934,4.48422096453088,0.731035488128701,5.24648520628044,2.06483733563135,1.1857092671254,0.380815874649941,0,1.89017661201118,1.98826331285079,0.623009134907256,1.38382426442408,0.172003549050302,2.87329546727933,2.02780835431859,0.649243496980662,1.8448708890213,3.58302438137487,0.365657827004069,2.46494972189484,0.0980110552637986,1.49862821698293,2.10813978718381,1.09816282522324,1.05211396784061,2.5140070925213,1.34306722078307,2.96190578365772,1.12463080449468,2.5796240417083,3.21828985499625,1.44843265983725,1.28704669345845,1.12132393887845,1.40640931994498,1.00350584991895,2.01441849877622,0.708332491651711,1.26958018931191,1.47640605633426,1.36256919773747,1.08284426347314,2.06283355601322,0.761502384755759,1.82380804501466,1.60094003224839,3.30217426232622,1.43408800816871,1.7313496633588,0.765713799165299,0.666410030817967,1.24517313483815,1.52437816506853,0.421325109163733,1.79503253215782,0.953162858985297,2.14889418995356,1.23991978607881,3.03560807518606,3.04238921695518,1.1816451692577,0.257885386726159,1.65686792250578,0.655179610925905,2.51703829049373,1.71205425551676,0.976392232708089,3.28073217404282,1.32108531486776,0.593493945839182,0.779012560182656,2.41936899405687,1.64985040954554,0.137511392974151,1.48703330079061,1.71332497696704,2.79847382297938,1.7594541446196,1.16271534232131,0,0.163975902034509,3.64828825907218,3.67739480668286,0.798616861047751,1.68417824522089,0.927310156811231,0.215850032635305,2.99067017678368,0.190300056038872,0.568590487547916,0.885139342830228,1.08116725736954,2.79283765686025,1.73462161991773,2.18756918865267,0.953570696652111,0.418619588456191,1.84585652420611,2.70660039253786,0.628138623017843,1.66423979176922,0.526936472031828,1.51399850509141,2.02706733145752,0.668036501018633,0.594214111276665,0.667543293657609,1.44889619499979,0.453422757256053,0.622659585989285,0.670716994682722,0.359512174639357,1.67218245088806,0.369088751021635,2.06152979533302,1.87095686751633,2.05928566797822,0.882070161247478,1.12160297223944,2.05378281554884,0.58309492596636,0.815468862224941,1.16275722837033,0.924867978022601,1.57032108332838,1.83513421490622,1.33434058417602,0.467319146497384,0.910520846444118,1.51833521241409,2.17731112697017,2.67131753798733,0.556426276220229,1.09806510660919,2.12064788148556,1.8413794193264,2.45343329333709,2.12883876335863,0.357917910125329,2.10340823851816,1.35514879657385,1.72780098357893,1.38052898639517,2.15975349505613,0.639831069984333,0.896528391239622,1.58258153295083,2.40399733968971,0.637237411033554,1.19850232574471,0.407460439342527,1.82516853480709,0.704979321755322,1.29408665071373,0.716989490107943,0.456346831338538,2.14039454025812,1.79728612991462,0.956533257967836,0.462084157232223,2.05301114389361,1.45005607146148,1.77874223278957,0.76400986075346,1.28601586259791,1.21865347354943,1.04329186409775,1.24514933793656,0.926524160383844,1.42224107544613,2.49612407041879,2.09172203708495,2.92225875244234,1.43805369573846,2.7956921517458,1.60827227099626,1.34724344324964,2.83435423910272,3.07995469839845,1.18001924801263,1.41393251283154,1.26183947984667,1.65058627877838,0.370348554226695,2.6600411677342,0.34106577144735,0.165919654721403,1.77827208723078,0.903293612252301,1.24469468695965,1.63050612111372,0.68391855610974,2.35937554420994,1.31116698998467,1.32903918539594,0.152233271502657,1.81833276619435,0.326845872412947,0.303326962010512,1.05492069674477,0.975614779844197,1.75142344340289,0.889031126101467,2.59983811757274,1.8024211344122,0.501420495099785,0.53751117539934,0.423369805494302,0.279381670445713,0.848653423846666,0.610230046802415,3.54678965624448,0.940023056540147,1.10662718232286,0.510650060961236,0.409769015265747,1.33862351150237,2.33361092843658,0.515789443418874,0.361611170073489,0.361890057120717,0.241273608641658,0.260290918795243,0.597496849472906,1.62909251568039,0.539802016615745,0.661645634475207,1.88525416377044,5.17484988161145,1.19559138688513,0.580548031850518,0.862815565103183,0.358738101917639,0.954054677320397,0.991527977374872,0.869232610719485,0.869099130704997,1.35983767401899,0,0.478919013073632,0.492054674833431,0.887311580083454,0.794847518511877,2.48838366425915,0.0881242247074886,0.375389918472032,0.953480258130306,0,0.455977609945997,2.42678081170757,0.299188848277811,0.0698070486028363,1.04561980190296,0.526000682793157,2.19072262376601,0.888539791419954,1.13420450806067,1.51900790292384,1.75745599011143,0.0746638090065125,0.220661798489529,1.61189283928058,1.61872166609985,1.19331883951018,0.559350449085913,0.900370290582718,1.94050130415468,1.08697529768452,0.585549077441933,1.65942135358686,1.00935003901257,1.61700878617372,3.00667682749912,2.71025687364284,0.787452023517515,0.994418249184921,0.426294816127427,1.78269246273157,1.46878765175204,1.40595533910169,0.539229498330718,0.875171408285048,0.210791815113872,0.694901582404941,1.44524519503505,2.15310002623614,0.67257831611162,0.429583936685793,1.38538575380597,1.07793990527122,1.32939402243322,2.73216563437954,0.376287493498174,0.794402640285214,1.61199762054811,4.92248288573768,0.213974807019237,1.15299596790195,0.724746302699898,0.520264228619787,0.081275263817796,0.355418222692497,2.60538315244493,0.807610380121097,1.63999522351289,1.65100483512835,1.28070159333242,0.0426673082922897,0.938823695443203,1.94430824315963,0.101901752660523,1.39385877141025,0.368756058896301,0,0.178536185252398,0.951105075135344,1.99766671901471,0.70899739028821,0.458949940400879,0.326493054191198,3.60236423229587,1.58765974110947,0.869401615031458,0.934136765228486,1.46433212171859,1.58101952175322,0.580438529230451,0.539683223856326,2.15792785004946,0.771130870651263,0.366638348410553,0.585897544928577,2.07051779073023,0.699189136507716,0.237850515693456,0.633653189284724,1.20865646598161,0.400872333766038,0.408757722244539,0.876433884229975,1.1116230299504,0.99185177452783,1.0222945133802,0.484065414444801,2.43283116201704,1.48647755084001,0.506731918010615,0.436269317690857,2.17529656220305,0.605236398833561,0.549468091102962,1.06752169965039,1.88077602141924,0.405724483502367,0.872740521016941,0.265731766222126,0.255665085273897,0.57463216720731,2.56023731890639,0.9061921621742,0.686177775610608,0.190779567708589,1.11371316602491,0.343262266214283,0,0.705234805307585,0.649429218679011,1.10673691701351,1.40686865322174,2.52719848038711,0.75209773349872,0.311812430534733,0.832273198533822,0.801938618269286,1.06997913199202,1.18891251900992,0.723436238463197,0.5741589724804,0.444681589121542,1.94448929348792,0.393584788785116,1.05146579554345,0.411046430671309,0.298594741748191,2.05247084629079,1.88002837640988,1.66626031031947,0.352170820628988,0.766883459924621,2.22611574269354,0.327927486816627,0.938794268738404,0.831604886533942,0.712026953756254,0.950458709053815,1.46727582806285,0.242632990446649,1.49001348163931,2.63631975194635,0.733700979669741,0.685971176704953,1.39372370832223,0.745162279912079,0.508407557082828,0.454213592315475,0.745267369136629,0.847241858903583,0.807064869979173,0.226192828661938,0.692951151194951,3.0714448570355,2.31153217833107,1.82316808979923,0.613236766090207,3.13826516401579,0.0408579317673443,0,4.11198260968207,1.58606958473281,0.566307625683346,1.36493152062136,1.03312073958166,0.988478923338949,0.68765108679264,0.122227418848955,0.919057656542276,1.26260634280584,0.56699201636408,1.46821471151396,1.53408979846441,0.822236590455112,1.10306720085111,0.160948577249637,0.279689510909432,2.11079050916271,0.855336670250248,3.39239986014005,0.51229162299849,0.164106597116159,5.49491115567396,0.311602275547124,0.56022582239965,0.803141298944227,0.821799181886619,0.581585530497287,0.288141654335198,0,1.58931023700281,1.07966551206101,0.715887222062487,1.72575380592883,1.19397417951379,0.770759710450873,0.74372925600624,0.377779880350804,0.236592417281312,1.24469042526054,1.41892554834676,0.782181406453456,1.64979248010401,1.51195678265004,0.680410780916161,0.771594052846857,0.96057324204854,1.14610514679831,1.09764382991974,0.38694776154118,2.12778272462719,1.22399580690467,1.30262262112725,2.96839861704975,2.09937566979851,0.339542309123609,1.35765671936511,1.07651189381047,1.95664142030169,1.47047022757158,0.303465848359329,0.348408070550062,0.126065998645585,0.637640013239945,0.897235390657146,0.393073812212007,0.549222617692842,0.8813483271062,0.461539036523003,0.046040894260673,0.661040845436248,0.178766261808326,0.772072124032699,0.87229215445737,0.765859740460993,1.88192690366629,1.327298761307,0.693784442603681,1.1324551049991,2.2812347330438,0.65324900007029,0.825213319541925,2.06010031611405,1.0800784226862,0.904859313593234,1.24861012633949,1.69092524592594,0.365308663189819,4.41637822182125,1.2127249609901,0.606898890830986,3.99362636168205,0.769310510810309,3.02808286787803,0.955217563083342,1.31926530938851,2.20561959758859,2.52808529631774,2.10163864743048,0.0378883592596352,0.0469662226556284,0.0380253694910204,0,0.23788648369564,0.246695807044533,0.741269364095272,0.483846210554852,0.335432947068013,0.654107459989346,0.433416829380534,0.207000603036224,0.116047781469774,0.55529404053308,0.663183906712738,0.563164965490025,0.582766009443956,0.71779884065584,0.750860293942526,1.79999782357589,1.39613975602731,0.448498525791799,0.697658541659128,0.824762884643701,1.09876179676961,2.25328952557144,1.82814207085716,2.09350778117828,1.21572766914609,0.844706216283723,1.56370825132925,1.83050805765652,1.53771999063101,1.59213311960825,1.41381393584667,1.81066931056428,1.79995804965354,0.0470054633524424,1.11546279039739,1.19107050922227,1.55515241175271,1.60378664805618,1.05676177342478,0.826820578066838,2.78390374719885,1.08056216264033,0.411185414875303,0.756777540595713,1.5904744501901,0.624915500635703,0.387364636492407,0.451496417371634,0.478834541920397,0.599451105892295,0.971683848359667,0.834274337035282,0.139891174490527,0.935394042393758,0.620591102135439,0.211079621544084,1.22588569367784,2.20024067435355,1.66093226671561,0.464889045176673,0.723238577511344,0.337123049099665,1.19783042412777,2.4217215069283,1.03378523770733,0.26235076710846,0.42029806168524,0,0.516481173201311,1.16114644644474,0.252902934427348,1.26021479022008,0.217730019472656,1.68572625052821,0.618631686531855,0,0.860479766648458,0.386896347077336,0.841238102951941,0.329073065192271,0.160025646451159,0.670924702075719,1.26734438483283,4.44848935442858,0.61280644569818,0.542744001347917,0.848432053927522,0.347079616033632,0.369191961594888,0.337160736714802,0,1.24358012827701,1.7998656539142,0.383949201564269,1.04445777140819,0.860224679989998,0.567410127795191,1.18819517237687,2.46142954759217,0.0938957293662839,0.411270903581689,0.795640457107678,1.04653785709553,1.46795814404485,0.481700484009462,0.602432174659625,0.355770351840043,0.818092210652216,1.76180097657461,0.431761687090847,2.55372174630085,0.763167634273754,0.554441406849341,0.687160150221549,0.400516070402357,0.91548609973614,0.48964353031516,0.754071667936143,1.90913468313548,0.622021354102375,0.798454537260701,0.539118104815621,1.2346447858637,0.761162702912601,0.72731363286572,1.16641260788216,0.253153047182698,0.364640895655436,0.477089043924106,0.345712927340636,0.298519552124413,0.940169472333564,0.572629717425329,1.24706224444513,1.15085923214686,0.715001478637476,0.885465816520355,0.962352825266812,2.0236269625537,1.6540995755973,1.17471767980379,0.684870969796725,0.376029718813998,0.734171477254333,0.276107249201267,0.86261960501736,0.396778859876276,1.01100320649929,0.682033331738018,0.836377179065659,1.53927496665196,3.74359811934733,0.394490654755359,1.38739893864623,0.174197509856349,0.440816052206421,0.0780355113746433,0.418381142977979,0.337418927503412,0.461169779365614,0.101999964521463,0.513348237673765,0.6694720268081,0.56193119598969,0.263790901009218,0.10737278512493,0.223706735955567,0.63864477649476,0.0959855687240032,0.830376706675463,0.12412839394488,2.29792563926324,0.677123472282207,0.428248538547864,0.592603900632859,0.808288661814641,1.06967989713026,0.888598704311285,0.95763665346464,2.76920047123286,0.5106156309113,1.20435885781887,0.663432977461518,0.303283235763024,1.95456112648693,1.08811852442141,0.201871321775051,0.411504018994348,1.89828962881312,0.83501112930017,1.89933884304621,0.141868280451742,0.748173524056685,0.934970845949266,1.15025225880005,0.957837578571587,1.62484907670452,2.41449061421708,0.255632252599509,0.382938337752247,0.613947428629621,1.37173894431848,0.748513443879801,1.16113309257964,0.961378845768717,0.364673277356598,0.823131151234704,0,0.689356688251628,0.712161696137461,0.617034089921972,1.55265053254146,0.527710545799992,1.11255602283354,1.61564935090713,0.75458824549026,0.911389399079942,2.33386792381044,0.334283369609707,1.94780976465692,1.11485739128249,0.89756401773169,2.07983034923449,0.424161369786623,0.448912154447733,1.00603290994001,1.52155885810171,0.554237159572049,0.714131196729727,1.06325918218367,4.10057319924634,0.0605506130986391,0.407799659023031,2.62000921698913,0.716256436049834,1.21976700824091,0.713488104587299,1.04565754171162,0.886102149739255,0.727477800487852,0.340596676821619,0.824928953578891,2.0852363185469,0.842684753423837,1.7572016516084,2.24090655239451,1.80658307987896,0.599987562931339,1.10220103197986,0.535772393156912,0.520185866053028,0.838917891953707,0.374369030779447,1.92309554203268,0.284992346472155,0.2628541779213,0.202491696002285,0.447364429258161,1.55005646572291,0.702765597424504,1.00628509614575,0.314807297183629,0.439037217923636,0.939537278585816,0.174568768517487,0.386896016076998,0.428393594263703,2.57789619156192,0.537209776186716,0.207404126186708,1.84856056959072,3.47038861844581,1.30293431362612,0.556461690255133,2.31237009947138,0.346790704025135,0.889834852479052,1.50264171771582,1.94395244868392,0.0893987587439342,0.668608414032571,0.247963474067581,0.268721825970797,2.16406088737481,0.478380631824099,0.187889591999733,0.477971638413194,1.26856194876911,0.124206228738781,0.779658954359687,1.2141353767864,0.495728006584118,1.64547248747438,0.216193961315288,0,0.361351882508628,0.0284438303021993,0.500428841265166,1.23444785462991,1.23044073713116,1.04743857621981,0.339788446583003,0.170449405920094,1.49625166953336,0.281923723117557,1.7312267824944,0.276606478990564,0.448832144048534,0.561909011696835,0.455650689700323,0.349600007855473,0.338081150880652,0.189136581114093,0.418167814755716,0.262661661466677,0.60208435204061,0.170853157222968,0.101352901403878,0.26149663545236,0.433270354695124,1.20316970177565,1.19193906667155,0.496259545020753,0.27064184193145,0.570996289559637,1.11525755592705,0.56737459206173,0.668796823334908,2.30069248833269,0.344718984335615,1.24201598034225,0.58000680533199,0.22709905075267,0.479642094913778,2.96934392343339,0.629558618217771,0.224397568734035,0.193950973325675,0.135772431933231,0.698344202840858,0.57615794750514,0.100426157065173,0.422836760635112,1.55071305285524,0.485403949967495,0.474382565845764,0.302855958246299,0.197701994057604,0.693185841895027,0.391790151930104,2.01083840453936,0.0694827558268735,0.472090936762105,0.464108329954721,0.427734454310352,0.137958163352699,0.0205181314932749,0.760558210207069,0.213115809772192,0.517696168084174,0.153732583510477,1.21301250653559,0.770331193360295,1.57441593531142,0.348243865556717,0.254665027203746,0.278022465101804,0.502371239006108,0.478213485701058,0.519374125542531,0.412678243641703,0.724176134279065,0.198810191816627,0.631145175611845,1.72110487742713,1.87461560960218,0.667173754428567,0.667801844883655,1.51164463336714,0.802306890627467,0.262055565935694,0.216755200039772,0.273979983901184,0.636332653323319,0.412114886872927,1.30985429270744,0.239362722297562,0.0638601894360254,1.79384786819324,2.67928168362483,0.269809119638514,1.08309352170086,0.510522058036342,0.0565943485385984,0.627731119320037,0.724518175059471,0.732992428256575,0.0944718822210032,2.50845677086593,0.509750863423745,0.176389926616582,0.439108196342018,0.331158986830559,0.168720714201657,1.14405746722818,1.68492373859664,0.605350199379543,0.582168759637119,0.963063452326433,0.735945045917206,1.31113396616897,0.133301002376668,0.942432079353825,0.376265930671505,0.552026413745913,0.123022236024902,0.212647027521086,0.0874699019523203,0.42325748863983,0.298237644124094,0.461138968736218,0.0504472274976694,0.127457768665113,0.599937971633641,0.203612132713121,0.868895964637309,0.377155962942066,1.28543258172452,0.385219076606755,0.245205999478864,0.707048525751072,0.239575358115798,0.834583402003828,0.287104629955546,0.14094483421188,1.27233379803241,1.09222909189392,0.097019575027776,0.694928318966178,0.291488515015725,0.119765983676682,0.279169352996937,0.604960964359417,0.565163717355692,0.414352381089439,0.94362874570604,0.23873673117668,0.36148720296766,0.694955411509461,0.505876299508882,0.286578150013695,0.202179723873616,0.976196442070872,0.19223204736912,0,0.126762249687006,0.367839138657625,0.152835389348887,1.04948872148108,0.110551402893178,0.284367842709645,0.137810391692927,1.20463818546362,0.122298198924708,0,0,1.37941635320816,2.14349562502019,0,0.392060957505922,0.783332600302907,0,0.874815847673389,1.41810465232186,0.338687969595059,0.498999240609497,0.145961727768942,0.388892111491269,0.971770651911555,0.286798722610379,0.131734470857234,0.380291254759727,0.510389688637336,0.330326976627684,2.20312283198418,0.698866100694954,0.646394022921239,0.0597510645041769,0.555387797518725,1.78380017813358,0,0.369822681353169,0.397433891335116,1.48479963376324,1.01877444911743,1.31845163120636,0.442039946574371,0.213487640189095,0.698286676741667,0,0.0943895887562346,0,0.0807127780178894,0.414508690710254,0.0868893153926679,0.382632837902529,1.38596991084173,0.276883714553176,0.550348297225926,0.186091905211167,0.297392176433544,0.0993718317989602,4.98531871579285,0.225627847163478,0.355656818464492,1.26680632609122,0.577390637655265,0.823272458556653,0.509025890847875,0.217715380335395,0.72048598822805,0.0504472274976694,1.08019374354901,0.73577213613364,0.405664585684017,0.789010541405828,0.0510443342978055,0.054124552066405,0.391645987426258,0.362529362750106,0.380297461771326,0.570926267749684,0.523189868390181,0.404374872662205,3.51653336481347,1.20461277151369,1.12706731534068,0.269856624412634,1.45716769743475,3.90698356949902,0.667350269364228,0.101861019527619,3.76094903091229,0.179464042488458,1.24172793569386,0.343295245051158,0.950624433275526,1.55745959656455,1.64551168430833,0.920569234510762,0.260165762254738,0.944062233199473,0.893554816140779,0.263343349940133,0.398433996071801,0.85181419230282,0,0.575081481012428,0.480926851867235,1.16329712732765,1.44579502319348,0.201992984807729,0.300882807180423,2.49101816913578,0.887654717570161,0.214302519511405,2.63646755397711,1.46133629209385,2.5638331830184,0.0530063461568933,0.177926719341957,0.49835422717965,2.12825248227193,0.805032540687574,0.0537604379469955,0,1.17505251428044,0.285584978251447,0.415724923935045,2.12266675589316,0.474319844186858,0.200500586941628,0.562675393703153,0.94437541810647,1.43016749714679,0.61511962907441,1.24907817323191,0.939506061063456,1.06722773804788,0.802310696141766,0.220581568672766,3.16121856808201,1.65701843787156,1.34705613771226,0.47691894929181,2.02830498752421,1.89647142880882,0.942883788003543,2.91062541502742,1.29296722666695,0.144274049401301,0.0872888926608158,0.902241095912039,0.406875127790702,0.239153844306781,0.349446809076033,0.983076416084824,0.596111641226554,0.722363720650104,2.40521783287936,1.65285174021154,1.52519641876455,2.45460495217319,2.20425123150328,2.30949607167546,0.989347583462332,0.209794456395573,1.74765636254559,0.195668861445275,3.09952076562513,0.360059353833585,0.255050118940969,0.417223004805967,0.189492376668567,0.540827772644544,1.53093370327309,0.127228079726666,0.592546592212544,1.00268092029237,0.926539948268092,1.26064536968888,0.50543844180502,1.24293840975555,0.625818562606961,0.513435159069107,1.1047620243831,0.693770528625954,0.171707711826448,0.415973324439549,0.483851162351578,0.781085208121647,0.433082298286158,0.674943277060266,0,0.123965695073487,0.0189507347739591,0,0.696512733767564,0.6446025048267,0.0913846372643226,0.454865799777347,0.0702439518667818,0.629269134731446,0.305442009779729,0.251205719916738,0.369905230737783,0.11129787910242,0.396168259229117,0.36383268638207,0.686203239747097,0.186986022705404,0.393705040071555,0.445370540393888,0.599915697828094,0.101208325971329,0.477181079458662,0.948108154030308,0.0928402715805154,0.347281944765641,0.287061709875962,0.622066630072997,0.716966845630133,0.329326782349346,0.614716156628271,0.906039346807397,0.159974254769797,0.32880051126979,0.228252273426433,0.54364672749446,0.0744921465190407,0.188281022104014,0.148408978574062,0.264635749852798,0.673371891945624,0.707107824471094,0.122179965093407,0.0720934491739284,0.0399317633001155,0,0.355452729058593,0.024366775255951,0.237447343566121,0.0851583925797074,0.274142721618971,0.364834950893882,0,0.127674744232321,0.527828427226595,0.793244848259249,0.580089995085467,0.371925692623536,0.212673296301285,0.431364401315443,0.602021145758119,0.829062782330305,0.33809975404299,0.245356680357082,0.635702857244069,0.325818582739942,0.108491671683564,0.0611235025839823,0,0.307742211681553,0.264872190080094,0.362582101793289,0.384612182410288,0.0517880391301014,0.851228608051646,0.504271561231054,0.539119494805521,0.566699441575948,0.284229830348284,0.392473720014784,0.112850765597492,1.28247361082504,0.150749294029593,0.556645907693484,0.34486189443308,1.58263740821714,0.2101789912936,0.161707132705864,0.897926326928018,0.781105357083337,0.428169947209066,1.05805765322805,0.364326676979116,0.351077376716838,0.80701094255587,0.0230350095014029,0.810291319818166,0.290901487805717,0.25005675643464,0.417439065304849,0.447803345645992,0.269435368831602,0.306437475987588,0.463507266811793,0.452868556298272,0.22427432262098,0.706594204319961,0.352988750404766,1.43367389869851,0.516601185874987,0.186287687373613,0.251038313169606,0.271011932633631,0.633904420414998,0.217284575830156,0.558891997280765,0.198933244440359,0.180238265517283,0.286633976399888,0.706578733659098,0,0.468506892546139,0.306543867379706,0.737141592225531,0.616367013783897,0.277006357619584,0.143274549831867,0.24388644364172,0,0.19459392408408,0.115040036785007,0.941944258341325,0,0.0988868150251606,0.206218353997392,0.492935955046071,0.17033389944483,0.311788371200187,0.042567438312723,0.293325748781227,0.354709893052374,0.452267114383435,0.498930842216632,0,0.0537489015321874,0.228798500318404,0.428022831585846,0.276395182097955,0.905703173019317,0.134344500149324,0.684295323501007,0.634185260275087,0.159732121087868,0,0.334096147688984,0.792425602566212,1.38821467042097,0.318443879683805,0.385044536434758,0.354390321406589,0.0801180012993673,0.194059938274647,0.623741779170604,0.852702189275801,1.20762052505826,0.237780656909385,0.363700388800007,0.480481354976658,0.19301005165192,0.408670562953179,0.38694776154118,0.0564228808784855,0.0720805488075839,1.11591683948954,0.389741356290669,1.309087107916,0.043601241149349,1.06888608115797,0.371984778097771,0.0448001852325611,1.52124777447502,0.278786484452065,0.321491411577936,0.0676508310576701,0,0.911426830230801,0.219141378175038,0.0733563031225232,0.593115174673147,0.249704547797331,0.0662987837487913,0.652581210618168,0.243301293074218,0.554839699188204,0.133460153003812,0.456823072548453,0.240650155756485,0.0424852119763232,0,0,0.36151875719995,0.408145865794562,0.235693978553385,0.354762444876537,0.0713531383627686,0.136784620224178,0.31207264088768,0.184318384874716,0.159059615710645,0.151059724186311,0.175696532628771,0,0.229873111361723,0.389069602016052,0.93449989492888,0.209891379327927,0.920465193659419,0.223029539644165,0.0176276394439738,0.345581114828434,0,0.845460825410382,0.314920379760029,0,0.105132137109777,0.503103430712563,0.129345274075638,1.45599743525529,0.403150229270877,0.172204325212959,0.375946451862503,0.492207096669835,0.127347485555806,0.230492015393706,0.0345840909142172,0.219903027355794,0.805365434722866,0.137082090327119,0.683480965815436,0.235065902865426,0.161634132638607,0.28469582083384,0.449586728847913,1.06957995508027,0,0.503604275656115,0.166551566066475,0.31303160872965,0,1.19975713748162,0.257404981430761,1.02305304139421,0.186486865921844,0.391795100112732,0.168300959592565,0.348825694820188,0.176533926886244,0.722001226931205,0,0.389930192990289,0.136218034548155,0.149265869971168,0.208706526981711,0.341646517509173,0.0658883877867071,0,0.127405864012328,0.377702266305287,0.214727377787052,0.0513398016972572,0.3897166900803,0.0389208850910801,1.23810704336424,0.796860189378988,0,0.269777648360013,0.48941417655736,0.703695644309935,0.0556209019490905,0.0877588179642737,0.656348089121219,0.601460437081478,1.07724163144836,0.0730123720696101,0.67693867404254,0.532352870395912,0.562282385556923,0.484550639168564,0.512704249814762,0.455216995836968,0.630263897755313,0.0550133271690804,1.07583654060158,0.408831401428575,0.297039360530376,0.646825038574724,0.292229179548521,0.4861315146163,0.282462460923277,0,0.223177610807521,0.154762967687664,0.950452736654406,0.164309118912299,0.0948926000831844,0.102226904325372,0.192488609180539,0.371499536656982,0.793906450485382,0.175193709342041,0.11717145546978,0.177563084735101,0,1.07692249358702,0.634399966885489,0.170889553375434,0.414530663627508,0.214966919315817,0.152022685110678,0.248103663347014,0.127132442267035,0.550090459938305,0.905445407260368,0.289312640364498,0.139292012330906,0.742689226722908,0.148632196727456,0.527669214971764,0.513561792147914,0.518838350032782,0.586810755167364,0.154244885848886,0.257651901495513,0.254056287990768,0.726430606509341,0.669555384626959,0.613671200983065,0.779139340154343,0.0201223872048168,0.426306625801716,0.28569102489861,0.134020328762717,0.332937715539316,0.281529596979366,0.46677212611707,0.676393074350658,0.555266648598706,0.722951300432549,0.0730488534926421,0.448118407178116,1.88862364026022,0.701551718330392,0.556996620920329,0.391655334913215,0.810065958954444,0.190728375143051,1.23472693478368,0.171091765978534,0.755544708429053,0.912172336201922,0.750267849773658,0.331360120633731,0.428286063597857,2.29477308944451,1.17849794182538,0.178992988344872,1.34996425669735,0.235680378249653,0.535228935869955,0.354443471658743,1.31995371476037,0.896452440832087,0.446100675153999,0.563865780601315,0.547854398274785,0.806219280307188,0.322440564551768,0.293122773803706,0.698386523514248,0.681026672572039,0.120272171856461,0.0688698510199763,0.926133810729231,0.618976731882017,0.336405654659042,0.79307475856003,0.619040514765671,0.210793435665935,0.988700972094507,0.564629856040167,0.556877274227168,0.387672554601377,0,0.561911748103825,0.17629991914863,0.304327276317326,0.787258427885877,0.300388277399983,0.412319030200405,0.177184302211533,0.930588992505271,1.50143608778866,0.448271735499322,0.358165885003004,0.862502174884222,0.601431720802003,0.343089058083894,0.746049488185235,0.222117170086633,1.40844448937761,0.2992277744721,0.78446821872532,0,0.758491913477942,0.369023737974175,0.806713398450182,0.879526515969744,1.47292004730587,0.518255939147151,0.409623269405933,0.973662407178529,0.369766856803862,0,0.692173990033056,1.55335942192808,0.549375920241673,2.05977473352131,2.83971696865017,0.886515810968858,1.49998310397094,1.28310966492277,1.64952027253739,1.18505840978936,2.12912043666338,0.517658177188544,1.52261122045599,1.21030332268748,1.26120697735671,1.37496378347428,1.64718416600669,1.40049393764378,0.138834648146832,0.647471090455557,1.39222453770799,0.628435892731188,3.12843099825215,1.0883059434527,1.41143438120188,0.378003927231735,1.05623599121395,1.18606882551138,0.353992817315615,1.00303987177486,0.945070525126024,1.05311133645956,0.980774063933547,1.43531548725388,1.37997577039243,0.465353279951864,1.13317945734693,1.34737935638397,0.674350366145168,0.619066440433678,0.0812129429019556,0.656110990227795,0.340202647067395,1.48965288043407,0.805803397004591,0.281693028200902,1.40024296666251,1.20182760837597,1.57323868565897,0.501275057133499,0.636665264822763,3.40028242971385,0.366370114423419,1.16705728141936,1.44744325150957,2.38336975577427,2.9013944360518,0.471054783582108,0.844724692697743,0.819233429485327,0.335023893987444,0.770168616176407,0.933358106399301,0.945782898343057,0.575371392832478,0.599228467636001,1.16580712875907,0.735627364559705,0.959569128169885,1.57310302602746,3.39489959569564,0.876000185027702,1.8445863548428,0.156683703114696,0.197597832774024,1.07098277177956,0.721328032586705,1.05644757569734,2.04395862204048,0.981358253784021,1.41056384213862,1.58319170849625,2.47881753839727,2.2280638288892,0.277483732799253,1.83738179313164,1.27396459206712,1.41716336641005,2.32839730006413,1.1070570963008,1.59342357326048,1.16007083862804,1.54912500822547,1.31186731802202,2.85703798030698,1.57587525921459,1.13682175485507,0.997822773836905,1.45738416258525,0.428327876075288,1.88916277474611,0.68111818335302,1.95420263961575,0.37089108179141,0.993080135217939,0.665908901554126,1.37590353804559,0.670639504553868,1.5788740016386,0.907426024638216,1.76345066906365,1.66113755573501,0.440393716484848,1.9207517642487,2.87118324760182,0.333135394904269,0.480789361121972,0.925794921024247,0.0700298459438857,0.877019304959273,0.867904606303333,0.894427431191764,1.63503460521373,2.16789963958816,1.61640945616426,2.54472726590509,1.83573776462997,1.21570344367131,1.51080802359844,0.944208524580289,1.04595523225935,1.32768449027868,2.08136928557539,0.946182120015289,1.05595137848667,1.04709930154485,0.713214543000351,0.573530809943504,1.95112559587391,1.11930039396656,3.8018260327716,1.20276624588018,0.47420114325323,0.181314024485007,0.789498735566442,1.08453034331664,3.66168518094461,1.27247713346736,0.716609928734409,1.52434055034176,0.885809393240938,1.02576236195016,1.94149548555033,1.0362859899983,2.43371074884644,1.12347881269432,1.13004455889717,1.98193336890621,2.3505815432728,0.769788662259177,2.08220321326941,1.9506106236508,2.73830955975359,0.258023891372591,0.48876743279845,2.88655678038974,0.744618378952134,1.02974828556193,0.927831237130739,0.352989767020187,2.6078891721376,1.85700349187205,1.67465227501705,0.940503559309437,1.19179129090304,0.505934616312705,1.41021137563831,1.26366724946306,1.42011801058211,1.11984086770833,0,0.395979031280057,1.112146965817,0.555877394694217,1.37943243462901,3.07632803336221,1.03660953187832,0.955200448914509,1.55909774089656,0.95455070444991,1.79492564289828,0.772074827413606,2.01325499708673,0.286161276249627,0.445289591635908,1.13197410783309,0.704643858993653,2.70698688254555,0.217732748786902,0.0702387851146774,1.21903590261343,1.2822292421635,0.75301056446461,0.283116363729951,1.78514499176895,0.25393712259979,0.561570536766359,1.22103051350563,1.06370380117344,1.38933001413659,1.26855684683841,0.655187306197483,2.83212665187812,2.14362786207853,2.70998858567502,0.86475595733273,2.80231958942408,0.511532911021216,1.18389044427879,2.08602098744811,0.126476150738508,1.84204354165248,1.47024243936508,3.4902427915025,1.12303442387625,1.07563181945932,1.08030086768929,1.28289404156871,2.40608626790039,1.68847356858809,1.43325844162148,1.66191980407454,0.146908029993255,3.57690059921237,0.463693282128798,2.76333648438223,0.608847650963377,1.91839921101005,0.878112433697987,0.59777352186758,0.290928020600003,1.1719866457002,3.52655814292805,2.72930260186775,1.81188199621867,3.43181414759208,2.00155799043884,0.446613338743412,0.750649892218281,0.945784471183164,0.840535019380258,1.10899875366163,1.38949908059649,0.86408350532517,1.11702905529543,0.87110555669801,0.512220109245261,2.76925549207072,1.91070695407606,1.16541096753669,2.80734255604711,0.941615672703852,0.0668912953716363,0.114462979306389,0.429636315765494,0.325101762306784,0.694205366181282,0.790842919981081,1.60262030604664,1.11400913888579,1.1624072814013,0.295037655081839,0.951120745543862,1.20466766758846,2.17700916619693,2.7549238362477,1.13368845745917,0.827351840903244,2.72258930405271,0.719087914914192,1.51792217811731,1.32716479552507,0.474117953313776,0.966857010792626,3.3156817166515,2.47372016432317,0.901474760735666,0.290968113674466,0,1.82937913616601,0.610473956059071,2.27299959000271,1.12751429374548,0.950370240358207,0.411713562916264,3.16423551009869,0.46282294673419,0.682303609517858,1.49769513140593,0.368352658962716,1.17567213645873,1.99891071479716,0.144974618180768,0.800729136828816,1.58384638493579,1.14501284733558,0.378688619979746,2.7215056569225,1.20677198564551,0.693384897502832,0.110209276396671,0.449452451977997,1.12491965104667,1.26449259402169,0.263797990523957,1.89975761925248,0.425839533169676,0,0.566993379756154,3.21683818772341,0.96068317750502,0.316486850093315,0.376987110135485,2.39941120393176,0.458769820692839,0.25263352441324,0.356265532484265,2.18015801601497,1.97786091490045,1.03839052602735,0.105265188145003,0.398511378387386,0.967221739057037,1.1694876382573,1.06366791091927,0.501932112306825,0.701388477490274,0.559057299561229,2.29822247959612,0.335295732235726,1.04301546848915,2.54334514732682,1.27669198945502,1.85848300544863,1.24489089413057,0.149572587551269,1.33654567740365,1.33982788851559,1.17698141045062,0.347656019406036,2.33618768115755,0.441496971586581,0.615403113305389,0.462755114493245,0.575562118002145,0.562576052761406,0.233146771058841,1.43872687246287,0.314832118118618,3.7941019953492,2.27669961131169,1.63857481150305,0.629117841577818,2.10303093336588,0.610891841851916,0.464595084964129,1.30274777404898,1.16561677915173,3.74279742746619,0.493618643731737,0.474905313326359,1.02785682249398,0.231024857127054,2.51721017194697,2.43763816668957,0.455809110113197,0.441209362732319,0.565571928470094,1.07173590163664,0,0.257338235760901,0,0.349825756746235,0.551413641093843,0.403698884633955,0.7130446957809,1.79698599192112,0.179802999275611,0.759702973886171,0.219037885773851,0.397597082529811,0.214548845623209,0,0.113934618105665,0.0509281915237282,0.479307144132794,0.696408572836526,0,1.70289553519979,0.133888325708115,0.935496710498843,0.262306382526341,0.576295739175213,0.957213319276861,0,0.357565516625435,0.290603579473317,0.247002434211664,0.223413405629039,0.4665304412268,0.254507091734423,0,0.472271064992184,0.65586258963287,0.313027776450363,0.404128064713167,0.0307448487979312,0.359609213743917,0.319321388277641,0.223881050199996,0.437407265493109,0.402752732846635,0,0.124435472814423,0.433789733166542,0,0.754279005387487,0.35970534686093,0.198276129915142,0.183391231508402,1.03161398372733,0.326832989796135,1.08692571926339,0,0.475123700264357,0.802965177990235,0.199543576103902,0,0.201857147991619,1.52061419277581,0.117538398704489,0,0.263816975832537,0.30114323979567,0.434856318871375,0.100062238078353,0.133441345208139,0.747254274546221,0.2363010831174,0.423363028000988,0.759922794175581,0,0.166208452619987,0,0.360912031422248,0.438799036932219,1.03196185802604,0.463712530938457,0,0.0911118732296079,1.16906727270661,0.110191232317442,0,0.955959006912729,0.121103352929764,0.115442414756713,0.317829873084686,0.26982168402563,1.12427651471487,0,0.18478618060804,0.447583957037955,0.250837181186484,0.0426245877586763,0.305863387053335,0,0.171843855711576,0.338944404423591,0.0479615730737546,0,1.01888480816871,0.258265398154129,0.147291066785456,0.138756812362544,0.237178825936524,0.111520543496026,0.353296526239504,1.68377818599832,0.307750184094836,0.653035245657493,0.346533617842828,0.252816728696421,0.319691685474971,0.389493904262752,0.360069919870811,0.890661475790871,0.488844025189094,0.0445938794450452,0,0.234422837779305,0.445654460864464,0.169095052815131,0,0.532987151830765,0.121068995257507,0.139400993230376,0.0529156728860718,0.430204972317766,0.0888382110059265,0.503315148225327,0.168372467708223,0.296170161321785,0.570922382945051,0.878814626926938,0.513399784714589,0.137528442812705,0.323266295056421,0.840837671643745,0.136384476586543,0.0462147179909791,0.574884687359673,0.853685524207137,0.0566917264370573,0.137144903886712,0.723404782298747,0.227320895947504,1.77412877699661,0.743757084394757,0.625052548800792,0.411275134490166,0.705937837319111,0.370165843226448,0.297444181597752,0.139498309359217,0,0.11396727974431,0.336370689699068,0.443384820059351,0.188048912182777,0.870015550065181,0,0.504734786593869,0.190400193971987,0.661224498233778,0.18438732604149,0.443859843452586,0.430025082618586,0.112654499500131,0,0.202981962803812,0.0436906821508266,0.264641033856601,0.34135503498193,0.521478957723887,1.0833903960708,0.144481071041561,0,0.756614282675477,0.750756811680467,0.720200167895591,0.542271126840381,0.432498205483712,0.0621848629809557,0.385551086515132,0.55855369530421,0.462528774590174,0.184729697723426,0.396542914352176,0.0784513481271123,0.962144012037607,1.03165068030859,0.714896974079905,0.619987626411937,0.0643986537446763,0.175458428811408,0.536606987712135,0.0841387113758707,0.121455902921321,0.455128494489066,1.27486318813198,0.0895792323608415,0.145902009096156,0.182214540184099,0.167386832736947,0.105463668898755,0.911365620590342,0.216806222202587,1.6068553151524,1.363467156738,0,0,0.576913897963247,0.216986088864741,0,0.608693822455382,1.16126146519918,0.507587333808396,0.612339286767016,0.338134562996869,0.291649879113001,0.155793652496712,0.818547923052414,0.172854863127338,0.342984645501276,0,0.274718360379092,0.568873439620204,0.127164013897387,0,0.143827011070595,0,1.39163356067335,0.632577756722568,0,0.222676727903617,0.0854888350380894,0.184854464828156,0.126410069013031,0.137485948994209,0.292982534850617,0.572831183530297,1.72151309391769,0.665444619805857,0.897074418951866,0.838956606172476,1.00505585585017,0.676284561609332,0.286132171028776,0.873101319443564,0.0460555666870636,0.364663305214658,0.177001318074532,0.11231914424284,0.303089959227599,0.137652769389683,0.527239924808979,0.108533154739442,0,0.00685913481084514,0.441060914156283,0.656917150535849,1.1416466287882,0.223621609581363,1.54856091306876,0.660467110588152,0.0844334658116918,0.494150550041548,0.402923943608205,0.442748735455407,0.517592169407236,0.203622656181045,1.43698851299671,0.29238032973806,1.44416081573497,1.48798071183309,0.35933505863465,0.899819091399642,0.205012457310668,1.27090085560575,0.0628298958017412,0.114035133601202,0.153991415528432,0.367737955615326,0.484100174543288,0.751084037169831,0.0715408258709608,0.250379892578037,0.619222172503951,0.535954395629809,0.345240344680428,0,1.08825491794599,0.330936950253815,0.996296179585678,0,0.656454999736155,1.32498941741246,0.227870924869332,0.917708237488392,0.225552828614492,1.06612777665091,0.185855130536183,0.179000761922599,0.658701401643571,0.358699511139278,0.483938641291373,0.176958822621584,0.496463372225914,0.575142101995098,0.671892974153577,0.336576582265957,0.43421411306361,0.616032042186156,0.235696061471464,0.290700530267187,0.692303099552792,0.169473610710595,0.817949003783888,0.305947647741143,0.528526412100915,0.671193173038803,0.269040449706253,0.148231160276423,0.490769321561389,1.49506525293153,0.142613408015434,1.00381304903118,0.21050931260736,0.26405355027405,0.844119909091612,0.546097020145885,0.582289501306795,0.938687770659518,0.872068313029968,0.437559073209221,0.478025604426896,0.537356467652928,1.12022969763972,0.187573559131533,0.275615712546662,0.121340783202192,0.228928377315429,0.413238563748944,0.637012921489198,0.460057874648581,1.23490041302843,0.274688784871669,1.12230164505697,0.884947173057006,0.990147451165861,0.553796146203144,0.301348835935681,0.214786179157438,0.990779185701665,0.323257070339178,0.782139292643843,0.709778510627213,0.357733167590043,0.748401291214847,0.384890194400328,0.432902980766603,1.82850363430911,0.412370630631404,0.715599092232846,1.09470292744888,2.69228167138656,0.171128668642513,0.794115546569573,0.49406573683101,0.187860968226452,0.629716578587362,0.209079994632241,0.298865802415632,0.0817659640160667,0.232858300398835,0,0.0398951364222192,0.328335569134574,0.432623701174602,0.918603614654539,0.845609676766478,1.4789153900252,0.0701560046269959,0.447415013536294,0.319510074841975,0.781722702389901,0.68133861322129,0.399940398958166,0.317654163103633,0.336443132498708,0.163730832938826,0.53743215366181,0.779124375989578,1.72563166891631,0.0836738676911202,0.586612384792857,0.161786577344877,0.430177026639707,0.80432620752285,0.516187251265045,0.0895494035683081,0.227450659572823,0.507136392821551,0.249105972018257,1.08479087343339,0.651200058633583,3.04984123251829,0.207544314377857,0.149371238324733,0.100896935255031,0.550963098017127,0.135660550145071,0.915998087143777,0.269018180661422,0.888840253182015,1.01166308479456,0.357393229051529,0.19587166132528,0.266766635113274,1.53657018778127,0.0948066830904712,0.524293806408016,0.709723820386088,0.81868428152784,0.239974515551422,0.838161143007184,0.72080640814354,0.561691743962313,0.441445233846343,0.275883129258211,0.802403597214053,0.333570400265593,0.394521605098525,0.755192680034442,0.13100517658889,0.193902037314183,0.634583046415695,0.0546847192107584,1.16874343138014,0.545689388153599,0.532331922384375,2.4331036695672,0.530000803789677,0.626414371193362,0.313480147336431,0.371261093081901,1.04738489794763,0.401380894797275,0.989942622661544,0.667322653424227,0,0.397099784667449,0.239917220583842,0.448151823566487,0.214829824882892,0.372702529076559,0.301542814085042,1.62096075883695,0.878048067197573,0.199588049726381,0.888666497915483,0.646605169406773,0.110682084490951,0,0.515249205579521,0.337011350930196,0.251172506799074,0.0671252848946204,0.664097766895308,0.345419085878252,0.405348392898011,2.28377453287744,0.274453828857941,0.286708013995019,0.221129964387058,0.363500237618396,0.487821772965796,0.451946524061338,0,0.176955759837878,0.796076894468604,0.262472847736779,0.182169527746349,0.416472267165817,1.16855796146753,0.156489039322173,0.46917976829459,0.218699345594719,0.266704998016246,0,0.133745001943519,0.0842143789246623,0.135982252549275,0.0312029182334652,0.119737303656452,0.224404977984482,0.238826105248915,0.439568247617741,0.144041669426112,0.0586165726603417,0.617195120477859,0.25032191777209,0.375162360691673,0.327019316445689,0.203234991112994,0.618026230133626,0.596777748888425,0.554037698298025,0.288444796454021,0.0672269118418684,0.325820539519935,0.674441939792706,0.267811187210326,0.458151406520442,0.38427741405751,0,0.207936818820225,0.40676086642306,0.18905217434182,0.136462702961623,0.137615131567324,0.361679437264607,0.279984334339679,0.583393630840336,0.185131756932907,1.04143511847047,0.143225040021402,0.12686478219675,0.194947998359805,0,0.0995144369236106,0.504204429520578,0.266595147945183,0.427904012974589,2.16971569929997,0.208282514038008,0.544113115965573,0.549836715673309,0.382470158564087,0.285558465371634,0.334608661409304,0.532170013920674,0.206139442939572,0.186928865461095,0.234290633688885,0.510383712991576,0.120094966459308,0.375453533155009,0.202888334841052,0.277470639826385,0.464801971456678,0.31289515008901,0.575092520806003,0.221539701491911,0.198817230860552,0.42234324421125,0.406940089504587,0.237880611430004,0.264777810766125,0.329101776261264,0.612856351332238,0.559247843736918,0.115526445773886,0,0.0423559096380592,0.368835161222593,0.361189593518749,0.145503864901752,0.518145332062906,0.459135494764536,0.385437663911503,0.609085551441319,0.649227684098716,0.27618611779431,0.214278891878775,0.246582841911511,0.24600790810964,0.628639139555358,0.198702842141096,0.432366818826156,0.30473648180064,0.236739960061908,0.237533126495435,0.191294805042974,0.399875777360693,0,0,0.519549955871162,0.0931225689236665,0,0,0,0,0,0.273852429558378,0.451775021174977,0.0790681181369358,0.256974399465848,0,0.682547229725044,0.48783010611806,0.147386158801951,0,0,0.344437666824299,0.368766114517389,0.409376814630071,0,0,0.603665983322363,0,0.40100672929619,0,0.136847079337836,1.12493288129469,0,0.257120476156022,0.40410091762193,0.152422279719116,0,0.162470445695633,0.0738616287930166,0.531455025170101,0.846145061409387,0,0,1.39084704839254,0.384481997808082,0,0.154703741830094,0.469329624139155,0.130286453893645,0,0.221488598987204,0.523040685176409,0.135999451759662,0.686336470823498,0.394908428375025,0.83244286127596,0.630402675558992,0,0.535921559265014,0,0.573335743799915,0,0.216602619351225,0.19263479870361,0.166932636155478,0.190148318652744,0.223794451638154,0.211409985945376,0.514844374005334,0.20486876843219,0.123914723792557,0.819910928187996,0.457957743237945,0.525970624913968,0.578920362378669,1.29175194525673,1.60665115504319,1.12752961324563,1.3402078893494,0.429472423967613,0.798611304020227,1.41260898765977,0.80687174441594,0.568317209581061,0.249737673388773,1.03380031716342,0,0.335013257288995,0.484354609464588,0.26165320595221,1.48708548787221,0.20422161564015,0.418144709502388,2.76196071356474,0.473487693424855,0.235605758085558,1.66664435266061,0.941143129256306,0.616728439862244,0.383942015207886,0.39154997973121,0.284224262190537,0,0.463089952856037,0.738859042502522,0.149196921080651,0.794028184203488,1.28746402072804,0,1.45179084332812,0.239670423073248,1.60989048027271,0.303012196995263,0.910410321684221,1.35523112969247,2.42400459711331,0.122316887466342,0.153618584139873,0.0393955989407391,0.162405476666545,0.157054061283627,0.191193086470864,0.668471538666359,0,0.894110897519058,0.285930666342912,0.827113272548781,0.272142661964176,2.80446230596762,1.01035735006125,0.810025967916573,0.0511333150614035,1.11534958875189,1.05167091226075,1.16179483108248,3.34909630427099,0.219023259901664,0.117355803244303,3.74567427022666,0.66770686720659,0.95691309129236,0.904437853846782,0.287312236336014,0.561148969224379,0.488380913322386,0.3564261225294,0.406511636426349,3.60396501590709,1.17260144167605,1.63538897058708,0.0725056512098892,0.563948735199725,0.0432733833686023,0.875361738795253,1.08943103141641,0.0372301071840979,1.34793149584389,0.527421405320603,0.517580076051262,0.680445889216684,1.05700933800001,0.898202933925618,3.01342831364153,0.516815973551734,0.444850439641807,0.322352992562749,0.212551908125811,0.451925851977313,0.421046272881536,0.0875600586475949,0.472204299530033,3.55292664649631,1.25835067585547,0.865578385436865,0.0382449802864823,0.119049343442454,1.15206332470569,0.329086157510601,1.15726236215121,0,0.209629160955853,1.81194280919671,1.92752938238332,0.200790704574849,0.32075303188329,0.295519916391682,0.534720030479203,0.293308207407612,0.729524579710803,0.882223579821393,1.15802221124175,0.376397414445644,0.0959125409167785,1.61858161909734,0.544400711351195,0.316521952738871,0.189133797161378,0.317315183786504,2.14740797697649,0.692122378707616,0.496426556597816,0.144753443289457,0.77503283700881,0.350191816016751,0.105919936974739,0.781282068211257,0.602756163459355,0.673160193766759,0.067982692555387,0.657812752451927,1.44226941740272,2.76132223396908,1.38253169113753,0.996933136357649,2.2368226019144,0.815988505118458,0.763914029277392,0.699254890096155,0.297535978463764,2.74151297932524,1.19109452001902,2.00021314244678,1.45823027169876,0.518798073258026,0.543737780584596,0.672954617773303,1.51452224479593,0.339840769606816,0.915140338550845,0.16114857531036,0.287396641777367,0.572769107421218,0.7602390891742,2.2668554886285,0.824473786246673,0.0369480478072364,0.590093016494008,0.11225708229506,0.425458230531865,1.31198257785403,0.0691524769041965,0.292415434842528,0.0727185669814304,0.230597763369524,0.593092221444812,0.363394263985418,0.367613954784856,0.347751818618434,1.9291452377196,0.786875924919629,0.404992470581766,0.383987466955875,1.4875377997521,1.57193372998773,0.408527097291422,2.25482107126634,0.244646589910395,1.0573469836524,1.82149144751753,0.240914243589681,0.143222296684071,0.204483691782946,0.521105256673627,0.200456643657952,0.96297612328289,1.07607743232291,1.03431151612462,0.433355292593327,0.430463524469563,0.608553224368399,0.271617026680151,0.431469028375431,0.869841723063304,0.530182037258672,0.148300155336666,0.754079024477689,1.11786656027124,0.846326421045738,0.22937011779527,1.20758966646451,0.289173447327178,0.756681739809004,0.326792615850045,0.23329650755292,0.152570379431039,0.206216853351925,0.874880358539192,2.93400859108396,1.40132682432197,0.237716667699307,0.31438655216574,1.25811304368815,1.30883119190921,0.287333988350645,0.173298243579645,0.134748363631938,0.658216967839345,0.525532911239453,1.61208493245812,0.863568296176282,0.440315465031439,0.31831626281054,0.495839834149371,0.255302639786021,0.466506949175731,0.381774192989365,0.578634447412108,1.19794463049198,0.741039777557994,0.0804408676318934,0.699857906199435,0.123284914406789,0.289968520426936,1.00702322902465,0.0652944988451541,0,1.27839423609431,0.116932140646678,0.0110678048770277,0.808329854415222,0.0968162866329773,0.543622577667227,0.177471619585974,0.297213724597474,0.272918755958245,1.82190813840087,0.471416608245952,0.359480688938786,0.166657607480282,0.445019694309148,0,0.523676363509898,1.67625386600858,1.40613498888965,0.875112101829927,1.06692338682185,0.0431918973306242,0.694213212742939,0.3893542463765,0.272569696701195,0.0777487424052895,0.223326531832135,0.333880514834947,0.859710634755386,0.437292520219519,0.0695180892692132,0,0,0.580315413276062,0,0.128370483479717,0.466927346851192,0.0729358403726879,0,1.24051339224877,0.183138383573709,0.510178095186826,0.200318527480576,0.126713755613904,0.524965730233511,0.171303174704517,0.214563765591538,0.36824201156911,0,0.716680599321396,0.0937437802111684,0.206303888208901,0.403928865142106,0.227315966424882,0.264862704397601,0,1.60985091805511,0,0.802194209763877,1.26678893893921,0.513494990288824,0.476959168480133,0.0394138486473693,0.785258426113781,0.125985487815824,0.262849007608949,0.449904464139094,0.434869872994425,0.633279608971333,0.0926983580905206,0.391432848289736,0.591283028214336,0.167996657422768,0.321416713142673,0.504569852703499,0.723824228795923,0.950896866410799,0.168785527804825,2.09398028132943,0.238178231799384,0.447360302874028,0.159167759604826,0.423871896915629,0.261393609774796,0.352530296810473,1.01724849316916,0.623020282353463,0.0991163462020872,0.2680408776288,0.656488590733726,0,0.191095151876691,0,0.154651901009627,0.606346519079069,0.609460909823551,0,0,0.122749704675306,0.54430237937215,0.0582558075986334,0.235529541060166,0,0,0.113612628093956,0.126387468368296,0,0.0854291434216045,0,0.336614741145598,0.0377398114159015,0.778689759020977,0.576217749158123,0.282089838585671,0.0287838431894815,1.06657351016399,0.35411325388452,0.122949636690091,0.0871549882036068,0.584221727118671,0.449372999825305,0.122273678130539,0.315180030204349,0.129006256759686,0,0.177745615000076,0.290937100599755,0,0.0717785923924992,0.499923219841279,0,0,0.114049797080193,0.0307565706367499,0.169608214953723,0.0952291941020808,0.065076209415305,0,0,0.199107184483926,0.5394397524893,0.465904482305219,0.400263682166163,0.0733988088435379,0.488065770583759,0.218267594720071,0.377978837487514,0.0328855404848466,0.246969732039588,0.478643014246254,0.128575312769688,0.222985535601324,0.49449640929811,0.252904266217056,0.336585607960356,1.22322667611281,0.115135679982239,0.194921278804463,0.102617957037935,0.0736845244776669,0.0746894264769421,0.542065842740358,0.074161231018728,0.109382625949886,0.570872462274618,0.0419834877734714,0,0.157691806898409,1.95391183872675,0.0224641196957901,0.237729392357216,0.0527235991772511,0,0.105669228622723,0.0495316574436168,0.701464777138481,0.0263000744584506,0.866767874676077,0.244277711386828,1.39594844111781,0.22048783775755,0.0371135499497545,0.317521845613725,0.0778514007649745,0.0700613179335577,0.11050623615281,0.212144716274199,0.377145965628931,0.050793097638032,0.316375628150417,1.38613937150096,0.12428578003065,0.132146490170037,0.0948790914610648,0.0617637575279131,0.437539898379134,0.489776789473997,0.39393123907437,0.302763563599596,0,0.0725694469255516,0.418787955366563,0,0.0330922582783268,0.0981372168471417,1.02694095862906,0.418425186576903,0.163636554600735,0.478474863047256,0.414794961856629,0.050927773727088,0,0.161601371690311,0.109159805204842,0.189607371474404,0.133564709355513,1.46723147678839,0.0823836353699012,0.0661396279173512,0.0931481312167009,0.36806160459104,0.278496292777542,0.568608678298344,0.269073373739518,0,0.131195405539359,0,0,0.413800723926196,0.229504373205632,0.23139517316359,0,0.442603842140362,0.134333327570638,0.509098069971848,0,0,0.277490874370736,0.248408655524262,0.162851950796443,0.321057598670637,0.295295735488252,0.31355955305158,0.663567143891936,0.253994105451319,0.225570349743168,0.0954509358527333,0.206091794077787,0.0289135191746581,0.087044976256726,0.298055307243417,0.0604505899917523,0.680407630129464,0.0903496861621788,0.323825779177793,0.188052711336431,0.0949398792645387,0.138476490123798,0.249281492597509,0.489379133188898,0.063721884001706,0.334441276302051,0.0814278500560724,1.16570424019815,0.756575770922863,0,0.0842760259901198,1.01447527450606,0.182979155577749,0.408718164316026,0,0.45796614565519,0.23275284076896,0.517661502691509,0.0251936847569466,0.0557544341331392,0.615850453002928,0.127315917940297,0.0633893169687331,0,0.382007584219195,0.13218935216949,0.118095218691506,0.0778082058606687,0.0879336600782321,0.0981419342137362,0.16939873855816,0.514479842672345,0.365646965901029,0.286248825000385,0.230788950789134,0.386148754734357,0,0.885388500480758,0.0685563534647318,0.401549319532372,0.245805100192626,0,0,0.170686927910116,0,0.117756950909285,0,0.0673862231493622,0.326512152528079,0.31724628993164,0.0735516819720248,0.344517886535904,0.241804802026218,0.846795763803833,0.110714018173669,0.735351469946351,0.0346004296789856,0,0.321097556018634,0,0,0.259743715562567,0.059531519325777,0.0498298040926866,0.237160343623253,0.757428680743141,0.334795359272921,0.438128449508007,0.146063426369345,0.845066062119264,0.171206827418142,0.395462749102724,1.41955884640999,0.0486595838127913,0.271217205343789,0,0.3432106357626,0.190529528515974,0.107763650655182,0.0326806265648698,0.136585809035524,0,0.139599285912614,0.0304927355984235,0.299140306311037,0.553364435718495,0.05154625878381,0,0.221307560295767,0,0.239716731368371,0,0.426025958845781,0.256415429017643,1.1188182453653,0.69584152059556,3.10557248645199,0.96350993196126,0.189705786592215,0.540955494669589,0.277478971731959,0.569853956064523,0,0.111151264822894,0,0.214864618692219,0,0.197628528426576,0.41464950641437,0.722506331933092,0.247452408897039,0.383345422806192,0,0,0.273609221741789,0,0,0.311241290806258,0.0362052338838444,0,1.17397872422174,0.579394991330553,0.255376127257503,0.122811449394383,0.0957576989386304,0.164480461306552,0.0832098274709668,0.217203413346491,0.297828116569793,0,0.358231164084065,1.54562247609296,0.143516587851189,0.365411248625345,0.415788406930815,0.233684522766872,0,0.159674907034465,0.104107152395762,0.0604790896747154,0.387454415966231,0.207176072619648,0.066920907679469,0,0.0834313817234426,3.32626839965499,0.198681346105672,0.908533946923109,0.266812321612291,0.786109526997636,0.507940436982558,0.621519942568436,0.158975498188148,1.6193524372644,0.218048321946523,0.237051403323621,0.463030820127272,0.10835289550138,0.08132544588089,0.200425254778688,0.285534319289302,2.23727429371821,0.334757952996722,0.964786749061792,1.16569202169411,0.44051852727461,0.066803832216025,0.411955498395787,0.129775724451026,0,0.57552242600897,1.45028749141609,0.464140332212567,0,0.588515807263489,0.351818829153812,0,0.299356270356173,0.566382938192156,0.117540659392007,0.675653355793752,0.0693001630039446,0,0,0.230386259666108,0.181545312242372,0.260602136883269,0.303184554548182,0.628724890301183,0.420339351674933,0.370307594151559,0.319130017322341,0.151295133581232,0.106033612822835,0.182262602762147,0.999273131430683,0.315924164401624,0.0386319927962952,0.158806214574756,1.97760964468542,0.178476270100055,0.259142781792982,0.121811548907314,0.576285095624782,0.350734961011136,0,0.157138032146012,0.151585315038212,0,0.104911476036185,2.23114328747918,0.51030096294562,2.04704030428657,0.132569736104527,1.36787033067277,0,0.15336046354098,0,0.334048308362209,0.168003848425447,0.306169362880465,0.0721089569084473,1.42069581949133,0.980192928372351,0.0746979198694032,0.447226876759883,0.0373671799398279,0.586494886716252,0.31619359957604,0.189332456663927,0.279816550238205,0.0633284277772501,0,0,0.230997936988307,1.43486368293828,1.30623015355332,0,0.359551418354148,0.368103075602076,0.269593114730773,0.3568554018282,0.711998770751855,0.822239935793197,0.48958917512713,1.30525205795262,0.894848799102725,0.741219306987466,0.119568265843499,1.05262379698498,0.257108524982376,0.571514015280301,0.445383042545828,0.667442742577663,0.949431615544575,0.463291299935267,0.518521844977098,0.640181204574799,1.03869814679497,0.441832106464127,0.240013362443987,0.206781986070368,0.134418236998736,0.518266213691738,0.4731118165362,0.13144632711073,0.176848685937179,0.222986771688265,0.552114086073767,0.517297062577863,0.688722862125488,0.583921653683094,0.128505763816689,0.768045904121467,0,0.139729196062876,0.0930700904159618,0.245732218638859,0.291940618965089,0.495316635739506,0,0.491780972598798,0.230798417289204,0,0.224993027609838,0.510962526727795,0.502070964541516,0.215049326328898,0.538025655140312,0.139891305427736,0.250889315736801,0.348972616337076,1.74151207328743,1.35799389424707,0.209781482947836,0.345462575463024,0.2455724503648,0.162723075221887,0.151844402690144,0.160559211179604,1.0541432417047,0.199159085940213,0,0.642409260754295,0.26555151493714,1.02760774243645,0.934391946997382,1.09544290134785,0.1847217010914,0.323837305520581,0.269379950206967,0.282268035486731,0.286298039262676,0.766561325310654,0.533247365891204,0.36743346924716,0.482028682107183,0.54459142067216,0.541759942983468,0.960338220428239,0.255499041190906,0.846011113483713,0.143938261358677,2.04924146632477,0.279190395930737,0.103051485052781,0.641048120907905,0.0575317886493343,1.4476819667276,1.27616610321217,0.690689114565493,0.750145626286033,0.612955402770134,0.364903513825299,1.13876670586438,0.271593602237642,0.256175303493677,0.369901167016025,0.157013562032863,0.173955833567753,1.11743254136954,0.438057103401961,0.090516626832819,0.475998888366294,0.366175034357239,0.349700433113057,0.39091515641199,0.266073725739509,0.507390755888893,0.190813442284117,0.327396151795851,0.247208963519714,0.312274594063932,1.74781226072902,0.512243070907422,0.40669774673977,0.326545976673006,0.0564091459367556,0.259838786238782,0.324271781478785,0.575185580971502,1.03630885131773,0.436071414795967,0.817818877788695,0.212116943346777,0.219233709440153,0.706998150855118,0,0.223356067038489,0.895007847072794,0.0971247827223481,0.786965142876482,0,0.692406932367279,0.131352286028586,1.40920309498178,0.101497058943938,0.0457246322672385,0.124994664946656,0.760774494442887,2.78642782853962,0.134344237266114,0.392880541009196,0,0.836360453809299,0.0595475779870695,1.10979641147298,0.363024136263931,0.129342899912301,0,0.0933263784257588,0.0863726345728255,0.630124640523424,0.0449481477583509,0.555519832364846,0.736531277590974,0.396950781010271,0.254515799193781,0.376626009858399,0.196007307196726,0.220921524299522,0.606749875510918,0.240336557352732,0.119583005985406,0,0.169317017840876,0.116356238909941,0.162898343185186,0.798342301704611,0.0822419159834142,0.663756668007305,0.487859631838059,0.342405234474627,0.164844705465878,0.541263052089801,0.284033036242373,0.184990389036502,0.524796675582797,0.212510696074131,0.38529739188396,0.516604412968711,0.0231501541697563,0.0965890877372724,0,0.481367250920485,1.53217629906139,0.331483837248111,0.198479066553233,0.850424201629818,0.673848370598675,0.651212000861157,0.788818490906229,0.157528451868042,0.463150548306121,0.580050910009866,0.482908260771174,1.37654955611432,0.648473818457467,0.674267375331291,0.585705489673791,0.573039991836699,1.08756195948113,0.143812385981569,0.455345055357628,0.328615908002002,0.316121870997198,0.285726884891738,0.143924943114251,0.869600288240942,0.196124932195498,0.318991590000441,0.227886816405249,0.172032745279469,0.361020434144548,0.718288407164553,0.348456682521529,0.798460343740763,0.75075235328864,0.170448123989985,1.61553541827356,0.31013405646767,0.415412171176242,0.189279567825044,0.902416079810495,0.234521431088147,0.879754770037015,0.868083804554471,2.63057414883206,0.725367119592505,0.131319093594799,0.112436053692704,0.124560403441346,0.467370369993338,0.252607367773048,0.741378534348867,0.895286332748958,1.19604924526103,0.62539487846298,0.407226669585453,0.577702898952286,0,0.628906732199644,0.286819063264082,0,0.244006563894872,0.273514457449865,0.77130838505262,0.666957510097432,0.443223119428725,2.09328432056111,0,0.477470103341899,0,0.755664168318757,0.124749631562261,0.378166444919047,0.189321069278674,0.810988736298631,0,0.427263317670015,0.245627574243744,0.843859260545988,0.310686907471165,0,0.991838716671857,0.256780493012461,0,0.338345909498797,1.5554750694884,0.194257794554678,0.380418160670266,0.246326479174545,0.269587370114464,0.149743218126902,0.824507187443448,0.0234652997259483,0.0860688980416944,0.193712331518573,0.172685920439422,0.876487478450447,0.46663223569463,0.421233857626754,1.18502896836461,0.77189064800587,0.453542864018831,1.23077788597006,0.145742660277605,0,0.323407079983778,0.119731063020967,0,2.6059114840657,0,0,0.663563227465535,0.525422459747148,0.584782633527437,0.26640121097221,0.549056973478954,0.139985446205195,0.432923286014748,0.359178166298466,0.763069026530319,1.28065396926544,0,0.788085959316867,0.490699505125681,0.422688884878139,0.302020682755275,1.37107927846983,0.331383053151952,0.0619629238017226,1.88329208677142,1.38445823619274,1.11466419618587,0.251212507905075,0.36511646385259,0,0.395865658035424,0.317006467343814,0.545430222550997,0.672162804163813,0.675419417769059,0.1765921356818,0.426890547300039,0.57700674400832,1.42934761805295,0.888258129619385,0.0846929250704672,1.26312036385251,0.0459061804383126,1.06545443728384,0.224273705128976,0.540278776351914,0.866219592039072,0.240773476017627,0.350904538774851,0.191036135175606,0.512114602285109,0,0.240281719477258,0.445825739588187,0.143356844702076,0.657950551329565,0.377095978024069,0.593951092783838,0.434683199107966,1.46682552101113,0.226579676348251,0.827714821696909,0.182743521813974,0,2.06313014040045,0.171177358213136,0,0.381615403370379,1.50783238441213,0.903546749784516,0.170915568372407,0.873355557237502,0.620926424159035,0.414607187382202,0.302460257046988,0,0.284691912541105,1.18053172231494,0.633960109327159,0.314897184056708,0.219457882511156,1.20434483366958,1.60670989548281,0.699437740401893,0.023326473815648,0.908141927352683,0.78023743746336,0.223107655874654,0.393140266209863,0.510779672603761,0.686380669263479,0.238006248231879,0.231868223305827,0.493174896960633,0.785117782943046,0.0898361412007943,0.29544221526174,0.465453172271926,0.440357568243081,1.1696672168989,0.574741142774989,0.130884360277735,0.554735593926249,0.346867276446814,0.478358885283132,1.26918938007248,1.16444325946587,0.455328219915137,0.323420454413815,0.713865673387795,0.322856891453291,1.04100693016156,0.477892602009141,1.54267606117369,0.277274350016981,0.83227028152138,0.375580642904212,1.83491868688432,0.0469676191400233,1.60562432700348,0,0.341682948684638,2.08772895150917,0.331957393829284,1.03012536240535,0.46410059074002,0.50629279640083,0.456341784232243,1.45127811727795,1.30788953103437,0.560832321500228,0.459125105190521,1.09740651272589,0.772453250750865,0.458844768338146,0.878269413119577,0.256444173760903,0.198893903935938,0.57094238957713,0.289358917008662,0.679733023295819,0.523916790306985,0.874855183910376,0.0771679221375594,0.365716050079934,0.225846834592657,0.416936998974373,0.745603241834311,0.668439042474335,0.0860001237561729,0.640994740280538,0.163331266889329,0.110430866017416,0.1583654671116,0.221140237080614,0.308146371522137,0.521472726313441,1.24416169427037,0.639083023019692,0.601607147430392,0,1.13571806792268,0.768337639376662,0.575532107083607,1.13711066375157,0.565618621161659,0.428991460098395,0.141662714391175,1.02523508158874,0.213038021878286,0.276786188013254,0.225973276984072,1.20483810126967,0.554042611468551,0.628174933340496,0.673240198521941,0.267385977720618,0.213319780826237,0.134288110603811,1.18846992416399,0.866805927838795,0.900505545718553,0.160914897429302,0.361856939297975,0.737867573625191,0.248006358369614,0.418577493658273,1.02239409203417,0.548015740262909,0.351265348406097,0.506714859351875,0,0.782749906451432,0.211197768842574,0.356061529177407,0.405836649091419,0.924527118613832,0.616618356113537,0.512920629450534,0.813122320339269,0.707263262155256,0.648107739169183,0.376336508827882,0.499218195746988,0.803503147629517,0.338631383530015,0.555825576712775,0.678531690882456,0.13939601591678,0.499015676157985,0.869355575164605,0.296700670030849,0.305506333217795,0.359378243207898,0.424219429416722,0.428907229387606,0.654334713653495,0.429300478246067,0.183643908110646,0.148373312532128,0.066465361825894,0.849200253423588,0.584305251530952,0.486751437333516,0.660364604582106,0.332367088000943,0.7719227543654,0.833570927002693,0.486380751448524,0.696266296439452,0.709760868840469,0.545512267041959,0.310591639547177,0.446713796070736,0.319767166809921,1.42028997603976,0.234359067374311,0.581615126548493,0.463775820051074,0.329944478692846,0.958767189237244,0.639501780767605,0.569727309071479,0.323639846545054,0.891118950601664,0.679934483917966,0.997501976165077,0.424900380457187,0.863404078692131,0.712926142893223,0.416711676781506,1.33564560427033,0.576273387628613,0.785956416091592,0.396863234184671,0.16580751457736,0.0900120871916864,0.197611293652883,0.191655626999809,0.719300866916423,0.861464724721792,0.821351027004894,0.50097740886404,0.749278846205062,0.148939309279218,1.15822009432229,0.365018226214797,0.705087025048821,0.600321331789647,0.972681626993658,0.668126660455825,1.18652527848129,0.176921430692297,0.98273553159806,0.672848922938423,0,1.08126599085419,0.359507564276144,1.0370637747512,0.92602067916859,0.252924121845085,0.808477314283714,1.23630892137657,0.286748461044368,0.705255157091428,0.674936951552994,1.36706515950293,0.0644924711470965,0.660036865100642,0.258103392823828,0.297827647130537,0.590119084260449,0.402587941031944,0.766410281393458,0.0131374301549251,1.13820306122064,1.09823762603458,1.31663872371028,0.633309837512747,1.09887226604382,0.789579862636598,1.17954226055511,0.189347639704449,0.232164752789626,1.29547853900374,0.723644237735481,0.155304181978043,0.0924297800579661,0.196563485628867,0.382684515186453,1.66783219141401,0.713281244367292,0.345647306423901,1.1453989963322,0.394301975004386,1.40724831853929,0.682973241465797,0.0701341544031599,0.291388552160891,0.627547074767153,1.69008851253823,0.334745941601401,0,0.368160417650871,2.79955983567729,2.25011662213959,1.48140951637113,0.676577039867332,0.552496298789282,0.202654677117641,0,0.711392967283069,0.679687720050527,0.332039341971686,0.248888423104796,0.39355568536918,0.182534418636423,0.485929209761792,0.163353811439992,0.988353124170433,0.709727613485849,0.508559376585096,0.773627589260247,0.622058849831324,0.653883517319381,0.444035153125225,0.116831028514575,0.709962766196404,2.30028834352453,0.148920441960695,0.687203069041778,1.3988849879144,1.27877756549547,2.72666558090349,2.53542842639127,0.578408476547593,0.306639169673124,0.308848487322208,1.36736435542343,0.771675178948417,1.46432218777378,0.63814011851462,0.299254975285681,0.960004527758028,0.127973808001985,0.394289680877524,1.15799311800705,0.535964345895832,0.501416724293509,1.37826412433755,1.36791504923124,0.80996589699053,0.286374341710637,0.220352245274511,0.188253165820284,0.217720466832131,0.887310800132569,0.631918203150896,0.752898418423465,0.864524921495764,0.482975152066347,1.47148507497618,1.10035402657231,0.522919399701465,0.498384151072051,0.388434457597875,0.574340847211159,1.70302444211689,0.54222000669739,0.357455277469994,0.905102854872198,0.280406987728239,0.437339719241054,0.164399877561189,0.996405378926151,0.107761642367109,0.368483971877483,1.31046053408426,0.429324691157451,0.760999259446773,0.121017258222752,0.227648917823923,1.55847091971318,0.846182779671617,1.12784785227558,1.15494348139661,0.980193513427714,0.458129457921003,0.82754346386921,1.40828795614698,0.363897821666728,1.03871570307933,0.44248441363302,0.497775849020302,2.05435742573671,0.99817455774154,1.23102989691456,0.746511246968712,0.960416070946841,1.2169036682779,1.45618268618541,0.447098306221123,0.861169546164514,0.839924124158808,0.716294897724372,0.844305300163937,0.589721403771671,1.32697158691147,0.504855271999386,1.46746939237017,0.895674649066692,0.407091002664163,1.35943458363744,0.438304137562629,0.824636711599956,0.412546882050456,0.418509491774662,0.200111956339999,0.320713296017644,0.390157314829774,0.315469429131798,0.96372269001378,1.0161225828103,0.567693506116125,1.06475292042548,0.585040404149991,1.21720589544731,0.430462775109992,0.962644520806693,0.697354825694465,0.392817800034242,2.96569045334197,0.345379569400737,0.905003470957499,2.19239966366048,2.48525678523418,0.988758114673169,0,0.825479882089126,0.326802393120154,1.02285283214879,2.90155430865912,0.561306592417181,0.595851736717279,1.05045433239026,1.11316638980625,0.163275870211326,1.00210912039916,0.0948593686456211,2.48006602674354,0.251645176257855,0.19143795704554,0.729436175536553,0.843414691077659,0.893123748323739,0.851171348118645,1.13323602178398,0.697213354429597,0.217328630006537,1.95717096416351,0.773608939016594,0.43353231060626,0.591552086538899,1.36427153597336,0.630513389981892,0.511367942825939,0.600282124851431,0.679334612209508,1.00382671839317,0.483439692607766,2.18747322480162,0.770010758362957,0.828513789277549,0.602382857374067,0.578714625231059,0.0891171069997153,0,1.55759585292067,0.254404533258352,0.0964513208632605,2.49440818568342,0.817029686397146,0.796707384739073,1.72553046184371,0.697014025458099,1.67898592349581,0.106127978420873,0.0284931965466504,1.05477680920919,0.822504845620645,0.305700220095982,0.301937479680088,0.727248274314015,1.66613621324872,1.0700100553455,0.782311263608604,1.02180944859595,0.945011550720507,1.35610943309793,0.133975627885575,0.22640383813929,3.50189971492506,0.514830238182202,0.957696228263217,0.740286891701731,1.08990147958187,1.19718916612775,0.362477743947326,1.57123313426443,0.144667443424487,0.120509871656046,1.44760405670753,0.538513332176161,0.957827700098417,0.400062745628292,0.125313463581666,0.805523598520485,0.979054400069519,0.439997737541779,0.830582855032927,0.0614185722282905,0.244558062795145,0.655961478886153,1.35928276308501,0.527657906330615,0.388375160243577,0.813217647838874,1.25433220579836,0.917651112381171,0.37445250011016,1.0373702727133,1.62886549556412,1.04003321910649,0.0981338472901302,0.316702897382389,0.359710743617949,1.23139738518753,0.101356666895972,1.38561105221419,0.358937452414142,0.392204311053517,0.309342221760043,0.167500905478025,0.0367254266220332,0.225782190494033,0.158273035242068,0.363634571839822,0.304023246658093,0.354311122769779,0.645985651125448,0,0.190087998608766,0.0674473543651799,0.430672794659798,0.363692316012445,0.347825732716364,1.27602075089275,0,0.268689013668018,0.116830230232706,1.43748130704142,0.990761762251834,0.281437962951222,0.528235234296658,0.243884859839328,1.21921951931457,0.311991526303769,2.10172301572864,0.767097102595295,0.295089274856647,0.781976027091961,0.361411178014832,0.927959392533789,0.19968465578152,0.968263975672296,0.621533539607617,0.794738494867521,0.470819207436807,0.176025138211687,0.0523211489646453,0,0.68279440375547,0.0592878487388807,1.34141823248289,0.498503431956095,0.261570650527312,0.926095119215152,0.111997861384644,0.168098355415318,0.82469861841021,0.735096931172918,0.382358043009611,0.255948186243241,0.423389384740582,0.386188605198569,0.6065208753727,0.688200862842419,0.3527763750333,0.11656504316083,0.711602388933233,1.00633608828293,1.19733198613472,1.79905911520582,1.37799326969458,0.519067805505743,0.458234157088787,0.669096811643843,0.326936507572345,1.13465795429466,1.51331690425874,0.596722418609776,0.861220136608625,1.25501143304997,0.0734282878823381,0.556612950390717,0.685932974187065,0.12769402350142,0.849737349525936,0.701293540898691,0.924067191785838,1.43396093112118,1.38204577795537,0.437825896478882,0.876357025700009,1.29332045107342,0.548796834239568,1.0741094286784,1.3084628144349,1.51867008634284,0.774264928234406,0.535819363735144,1.57203398141464,1.28019736351253,0.0916062801570797,1.12930544037363,0.599673519388291,0.682903326648479,0.128826426525957,2.85421911789637,0.43988160280493,0.205587069756736,0.697775598462894,0.535728506128795,0.845375313236154,1.15686902348898,0.148313303077619,0.164749985090809,0.565018032022121,2.09842225287799,0.370467521583736,0.153420263428053,0.426285690403809,0.527761282025896,0.0840498377659305,1.30444445434834,0.209188946087094,0.429268765145687,0.431375848612946,0.925823247142651,0.225286036974262,0.290987098535717,0.800988089237368,0.0665828780461314,1.65616408911893,0.807044915418341,0.115853867021852,0.491450881009572,0.493815058016579,0.688724652228508,0.690326798547695,1.57006057188209,1.86917692972957,0.557995235355581,0.386245012145627,0.0675603852185097,0.733741321483217,0,0.72639267570059,0.761744394384175,0.296072989896744,0.0856226223095618,0.45231551311416,2.38297954927738,0.25332795507194,0,0.345489940299994,0.561805122121036,2.59074092917931,0.136961230814594,0.62906942814894,0.30018699671023,0.141213034603938,0.292045138999394,0.506097159421144,0.39431273227945,1.01109197125716,0.506800759833871,0.890951304479328,0.791894901486003,0.943040629477574,0.689134527336471,0.16374512870625,0.319661746148733,2.60111646975869,0.828186438351199,0.0511171624666345,1.45134300934942,0,0.560746546704722,1.52330952506786,0.475527172430333,0.129401857145658,0,0.311503696731263,0.72882694437997,1.65040480536564,0.966239227397544,0.618600458817952,0.22508979886764,0.395596552789618,0.208260036375666,0.309363760571656,1.23851480033785,0.175632795168902,0.150223008453032,0.837835893315247,0.29471895908123,0.453893960922803,1.03344456911645,0,0.402390384313965,0.038538304555182,0.206377413565537,1.02201619649978,0.108617589145821,0.196954457611523,1.11427906118707,0.256498521500274,0.233611394420212,0.522776916404618,0.605262194410748,0.580415662876655,0.354516818048017,1.17128113839272,0.907496015758392,1.36263708299842,0.337111971037685,2.19181371085049,1.4493960329476,1.48293344859822,0.499712738519465,0.591684203573585,0.406408449135274,0.485118778893688,0.451606662719243,1.25339633889562,0.764535546268707,0.221520399063641,0.246961343630639,1.5339046709104,2.76629323480529,1.28769864041062,0.114452691172733,0.126431479823561,0.407551478552397,0.951461945141035,1.67846723955158,0.146577416142527,0.799309662966345,2.46292382559204,1.07246119833389,0.846242966345694,0.446396204225161,0.725837114887532,1.21574195577386,0,0.291221617613632,0.130140003511238,0.774363026769095,0.305462672975402,0.293116062426362,0.319175809903591,0.816457246666854,0.487844406106689,0.589047234002805,0.312871457231267,0.408772610524607,0.888470121483483,0.418686074147843,0.133386498697653,0.250505658363521,0.0443825078025481,1.10388385092769,0.411589705746151,0.236130222980777,0.111719634293951,1.32988594170909,0.694263322732443,0.142914356572414,0.184080810977614,0.315431982139901,0.373739293807713,0.410106932622776,0.522234668418869,0.426314140998658,0.895817788652135,0.309673185408166,0.443234579125225,1.09219525769354,0.366710853666709,0.932206416504216,0.187020239927704,0.0574455585059155,0.0760882441331306,0.686447009207941,2.14109136938538,0.101401583079551,0.592284322130931,0.688748818401869,0.751109752558851,0.871242952387361,0.187721640866371,0.169546901680185,0.176848430685967,0.422217497011245,0.0844272066480379,0.0685241607409678,0.149022582771706,0.413224696529353,0.725160821220425,0.218690047325021,0.652568178400476,0.517753001402432,0.272840544410741,0.181106368243894,0.316450472193101,0.168772565317131,0.683126179549106,0.393385226404633,0.412811002074048,0.150707967606289,0.142902204850891,0.412365318907544,1.23826348205571,1.04705810844709,0.181989209606755,0.698870988983499,0.379003609341433,1.2259621751691,0.280585202564472,1.17761678751126,0.159263622324369,0.825115361307617,0.174283557300688,0.329382999683408,0.35027771443069,0.216068521927466,0.207466100542936,0.289132005584342,0.306845850199861,0.372608595337212,0.0569056018251723,0.0956451006998467,1.09618762455649,1.10043476942033,0.647735213145314,0,0.171802873015004,0.53836661922587,0.0904870884129951,0.19854683147666,0.15747968751804,0.172612321794312,1.19637035219488,0.408676323018969,0.549817005512973,1.89714692816054,0.520358378783194,0.759494198803761,0.361876073064608,0.117717381000672,0.398674994935575,0,0.123395640937562,0.0724295042432874,2.56935619755483,0.242725781353935,1.59000982650111,0.181612223566963,0.715576601629936,0.128589565272107,0.153212574650768,0.21142842729627,0.0736332533810942,0,0.346779926839532,0.521289088635022,1.09490016485632,0.476868051752946,0,0.400542519969738,0.138897280627767,0,0.371120105095392,0.691913771562856,0.20351403526574,0.0524367622987786,0.176695016537009,0.481625784493964,0.855550445381643,0.132856076660344,1.08660307832999,0.59317944176977,0.0769966941388663,0.377280479226243,0.362127472808863,0.893896472090159,0.436886630139498,0.827804394396245,0.219220733846069,0.600898654290944,0.733675385891394,0.271773781387287,0.333414344726914,0.507968133662326,0.218283592390599,0.588869793774252,0.473462028419638,0.215363250196479,0.132477742402965,0,0.921620350285072,0.14057411227228,0.212034244109678,0.649716524645245,1.44391372189287,0.627992439054467,0.503652000026272,0.796242227529422,0.725461881291841,0.512793940078461,0.394518312540387,0.228691881646846,0.197199862388981,0.677460433524366,0,0.326461414823748,0.161465934678589,0.235674619523851,0.155736282035968,0.299992484614392,0.350765393711819,0.428054357625181,0.126841263785717,0,0.2586331297795,0.88298174461634,0.22924458814493,0,0.137815636731413,0.130495624112796,0,0.408962884428362,0.130925599697952,0.275446466021646,0.172476890476475,0.192059675844808,0.242806374132134,0.716834482424502,0.90421894520601,0.094399318277541,0.522420395483613,0.606958378980323,0.144559381698309,0.0807085489963014,0.86532578262283,0.0438465957712869,0.126294286532554,0.261367491115106,0,0.102847835807914,0.159332091795812,0.487508781950089,0.643138865080716,1.03653709293545,0.984249114917793,0.203773108322471,0.183802808736096,0.0665409976305369,0,0.336330238982241,0.138105395480671,0,0.461635421814387,0,1.13708704939178,0.392991072761552,1.00026182538999,0.49246133656341,0.669021321367129,0.212768781155522,0,0.187200944093069,0.243095544439558,1.57824798579032,0.170391589739392,0,0.22203170248449,1.72774318272706,0.038491809331082,0.234869151705381,0.254523297241671,0,0.163469878093519,0,0.170414537015251,0.894317218911963,0.196839543486886,0.652647104113623,0.105968330736113,0.299753175323716,0.252809827172229,0.592948277249702,0.604568777856482,1.33920866255804,0.30845757202129,0.331213802585102,0.238642582869072,0.119926634359269,0.0706517371232912,0.772231952724966,2.52555075106841,0.0546116541853493,0.110037915368888,0.115899931718466,0.251513692738258,0.10011634722848,0.519199381100871,0,0.070889512854233,0.124987256339997,0.452842100234855,0.426424824579388,0.170021177905859,0.0687599489255034,0.356285029632597,1.49688259505847,0.686575825495254,0.540849589319138,0,0.850780224394479,0.497325203047899,0.584281387906584,0.271910636535877,0.456055121674575,0.28513644255785,0.729423123280235,0,0,0.582620934872204,1.15991588812756,0.453628302304771,0.601956986173168,0.331193046236865,0.158944485882546,0.711206779389785,0,0,0.137323831450135,0.185835852044187,0.239565215854648,0.871480169711924,0.919928482845988,0.295747588344175,0.144283970409796,0.606103522228996,0.230584114938529,0.239037475515924,0.332506300234074,1.12484555941556,0.214477973666432,0.926349191734298,0.424795168449756,0.216718080592787,0,0.130581286841605,1.14444713510349,0.213618529564235,0.985606806926386,0.811165524978765,1.3125768900013,0,0.690849727419751,0,0.372397194197354,0.152550780780214,0.288198247274834,0.859185590184314,0,0,0.303970075781294,0.746432735182835,0.135504268804471,0.185205607901536,0.614311251913785,0.507819092879721,1.08270803859301,0.468089040873484,0.8592371250506,0,0.228290452000638,0.0605901777247718,0.321620825832284,0.701911936154383,0.115440949830281,0.29000557223347,0.577392571369714,0.323934238419724,0.306614557321508,0.467541072400085,0.682622734648345,0,0,0.2324667473064,0.390152581196029,0.570436699968651,0.0903712323506588,0.691046424758829,0.876567316001753,0.118824556382193,0.883246214309714,0,0,0.21623879393591,0,0.130102301006589,0.907236031622422,0.224082763925625,0.347476988204836,0.325274725245589,0,0.199486788581747,0.446350465240178,0.0674889331264838,0,0.270645310104046,0.0831219861575172,0,0.855137378740612,0,0.163957230342009,0,0.339991344452653,0,0.5722814260757,0.25780394268149,1.58006813652554,1.04384281709462,0.333503881223387,0.786725822280514,0.861857725908364,0,1.6901408225948,0.289908338713164,0.41270783086455,0.576948038922355,0.0654252084794824,0.20890787700069,0,0.3111872225124,0.26598638378786,0,0.450957307084809,0.300765807981809,0,0.502545895027488,0.322231605995716,0.385355490457047,0.373217217503695,0.23888344356441,0.123977874957157,1.50132958534903,0.43536904560221,0.185442869794032,0.561353511347876,0,0.527000752082136,0,0,0.0596473868651177,0.216967346042516,1.46112723118051,0.310305565325165,0.429884474635155,0,0,0.0709268720871208,0.481143915843218,0.110196712394996,0,0,0.587941569642954,0.127961265733964,0.195579418899164,0.298114680727076,0.0666965276530419,0.21383785462285,0,0.235671188782659,0.0831070049345445,0,0.385702707674392,0.159443186288424,0.456244729149805,0,0.384465419978184,0.366658489125001,0.112996847092567,0,0.140995861541673,0.221666769365239,0.29512231524647,0,0.653257898172504,0.142250042999464,0.822084818178135,0,0,0.261525158784608,0.136702868180753,0.62032928286246,0.141938887988923,0,0.504256304298425,0.368859963601233,0.433065201033381,0.278059349064976,0.114809428017515,0,0.640337728540218,0.751891795721361,0.166012240931417,0,0.302320220898722,0.448736062289483,0.221828835805966,0.217404449678412,0.113062478893694,0,0.328045751780378,0.594519886450239,0.206218103889923,0,1.18491938260925,0.331159445548444,0.73219624874305,0.16614596607913,0.117387057566147,0,0.125180396866355,0.147370527668066,0.157037240646586,0.191510854239713,0.456466589784784,0,0,0.492504508795457,0.0747292901920216,0.242032204780486,0.214914340435986,0.572609346151878,0,1.41459003212681,0,0.773783701753568,0.122349359888442,1.0855572258133,0,0.484338624805545,0,0.309526280912232,0.0694573207120796,0.437122036851652,0.450520299496318,0,0.246675743915547,0.204562693454857,0.1828676982327,0.291951695855066,0.0643993436007827,0,0.11771950844272,0.0556617124726968,0.318477199366111,0.108510272298066,0.273827012799301,0.0574029960691068,0.240763097986038,0,0.337518149088954,0.137132178720644,0.387008331166027,0,0,0.177255498971794,0.204563569835831,0,0,0,0.484790870707948,0.217461777128555,0,0.54872858676317,0.0770745151335584,0,0.152043199809711,0,0,0.373024509359169,0.521012532624003,1.67860064611117,0.119640106014341,0.260374872391914,0.108171275258871,0.891262076190163,0.265926633088198,0.0618194605114501,0.181811158301077,0.272029162941189,0.304121403128729,0,0.217975140922887,0,0.241373077373887,0.353868645378164,0,0,0.117154429378847,0,0.594922073219401,0,0,0.222952531688365,0.382148176461348,0.200739112843648,0.244448461866913,0,0.453489133282042,0,0.0697864302063921,0.104203523115444,0,1.0012576981089,0.154229328851124,0.142150689869035,0.200739991550377,0,0.0951046688702607,0.412004292656972,0.218281608193039,1.34527089350619,0,0.405042590452839,0.281216331726406,0,0,0,0,0.257220343053008,0.419743820553015,0.166109964374073,0.147395276885175,0.246245109749924,0.226748958946956,0,0.621890111376207,0.145274422391927,0,0.736876288579139,0.228290452000638,0,1.13834069969633,0.971957335415009,0.926349191734298,0.424795168449756,0.435733125654324,0.261961603745875,0.0864651697730574,0.194123623467616,0.39224157624577,0.289908574724787,0.164276547395058,0.277551219238333,0.058857032592284,0.0712726737675075,0.417333307733558,0.303311997026851,0.235943662246598,0.280198670342888,0.363715861516571,0,0.322277184849076,0.386090025728023,0.146644014146976,0.0962831761764521,0.436340965493742,0.233552864532552,0.6512680361473,0.198822887210247,0.103584651984411,0,0,0.0471769368640006,0,0.161111158426689,0.3218280260889,0.0697704713652403,0.519502653882945,0.450904535418209,0.222324819184983,0.514337417198317,0.103726841315102,0.605506376015211,0.0930422273396621,0.205464458259799,0.316507239852789,0.470017323251615,0.183737650164875,0.350531433120241,0.626299883621614,0.222569037618092,0.574017487735157,0.353873273796679,0.446428072429301,0.303396173040801,0.0876975910658673,0.226684725135554,1.37602749545985,0.728151006028648,0.296670719575747,0.488625649039095,0.337571810394315,0,0.154490664151615,0.137660900079479,0.175902670181471,0.723289629410377,0.716031265401088,0.510330032352027,0.923901430144189,0.309895608989812,0.0750995180554249,0,0.447403893823016,0.192737551730764,0,1.13977136196388,0.590891319822174,0.302753505091035,0.382853477024961,0.430116743506194,0.671625086258347,1.1688382749446,0.975570760547251,0.174037164076558,0.403925593983653,0.205282398498186,0.242026837317357,0.434472268042901,0.493938405222253,0.373383170940669,0.459999561446829,0.217328878195269,0.397129473998659,0.439288021080974,0.420565401508635,0.145214414351647,0.738498681527353,0.483726536965194,0.11622660271065,2.1604568512463,0.157848160302889,0.81556510044065,0.635852718678213,0.455928597667255,0.44666235093714,0.063634090439596,0.53901007864704,1.48664410267599,1.30433814167966,0.822896043237856,1.38242378605965,0.370212276559436,0.247753772126869,0.485195049899708,0.520487624075356,1.16901934595013,1.67579335360842,1.4821590315509,0.858644999398351,0.117932768587909,1.07197576336677,0.433527823996724,0.675959516209315,0.416631914018077,0.665612888044675,0.590466162349829,0,0.566040638935929,0.397424033557659,0.344221755924168,0,0.257894226361799,0,0,0.127082243273169,0.203681034978058,0.481977757928776,0.475321610819827,0.0366978602695889,0.0616721124557377,0.278826797448044,0.0813547633980159,0,0,0,0.0391619823045687,0.178903143136464,0.196990704636867,0.226701369487883,0,0.304614421515719,0,0,0.0530352714001557,0,0.105036633237553,0,0.207121959276222,0.0812076243621418,0.371021271441159,0,0,0.0980920641293422,0.207819153648673,0.072310953939402,0,0.649493140928137,0.125908277808006,0,0.257469672297692,0.232312871866902,0,0,0,0,0.0503782664280719,0,0.079119606165595,0.304401229263314,0,0,0,0,0.135700208766885,0,0,0,0,0.0714831629585222,0.0976996477250959,0,0,0.109748346505271,0.0825284745499057,0,0,0,0,0,0.112301259998379,0,0.0891912743240069,0.0290168839395909,0,0,0.0561295628951896,0,0.234810182424545,0.0982081105019929],"x":["ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","ACC","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BLCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","BRCA","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CESC","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","CHOL*","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","COAD","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","DLBC","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","ESCA","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","GBM","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","HNSC*","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KICH","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRC*","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","KIRP","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LAML","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LGG","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LIHC","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUAD","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","LUSC","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","MESO","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","OV","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PAAD","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PCPG*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","PRAD*","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","READ","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SARC","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","SKCM","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","STAD","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","TGCT","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THCA*","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","THYM","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCEC*","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UCS","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM","UVM"],"name":"cancer","boxpoints":"all","pointpos":0,"jitter":0.6,"boxmean":true,"marker":{"color":"rgb(7,40,89)","size":2},"type":"box"}
*/
						var tarboxdata = <%=(String)request.getAttribute("tarboxdata")%>;
						if(regboxdata.length != 0){
							var dataRegulator = [JSON.parse(regboxdata[0].cancer),JSON.parse(regboxdata[0].normal)];
							$plotlyBoxplot("boxplotRegulator",dataRegulator,regboxdata[0].genename,JSON.parse(regboxdata[0].yrange)); 
						}
						if(tarboxdata.length != 0){
							var dataTarget = [JSON.parse(tarboxdata[0].cancer),JSON.parse(tarboxdata[0].normal)];
							$plotlyBoxplot("boxplotTarget",dataTarget,tarboxdata[0].genename,JSON.parse(tarboxdata[0].yrange));
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
        </s:if>
	     <div class="row" id="heatmapContainer" style="display:none;">
	        	<div class="col-md-12">
	        		<div class="panel panel-default">
	        		     <div class="panel-heading">
	        		      <h4><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Pearson Expression Correlation Across TCGA Cancer</h4>
	        		     </div>
	        		     <div class="panel-body">
	        		     <p>You can <b>click</b> the heatmap tile to see the <b><s:property value="#rs.get(0).getRegulator()"/></b>-<b><s:property value="#rs.get(0).getTarget()"/></b> expression associations across TCGA</p>
	        		             <div id="PearsonCorrelationHeatmap"></div>
	        		     </div>
	        		     <script> 
                            var heatmapdata = <%=request.getAttribute("correlationheatmap")%>;
                            //console.log(heatmapdata);
                            if(heatmapdata[0] != null){ //heatmapdata[0].heatmapdata != null
                            	$("#heatmapContainer").show();
                            	var PCC = JSON.parse(heatmapdata[0].heatmapdata).z[1];
                            	var cancertype = JSON.parse(heatmapdata[0].heatmapdata).x;
                            	var max=Math.abs(PCC[0]),max_index=0;
                            	for(var i=0;i<PCC.length;i++)
                            		if(Math.abs(PCC[i])>max){max=Math.abs(PCC[i]);max_index=i;}
                            	var selectedCancer = cancertype[max_index];
                            	var data = [JSON.parse(heatmapdata[0].heatmapdata)];
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
                                $.ajax({
                            		type: 'POST',
                            		dataType:'json',
                            		data:{
                        				regulator:regulator,
                        				target:target,
                        				cancertype:selectedCancer
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
                            			var myPlot = document.getElementById('ScatterPlot'),d3 = Plotly.d3
                            		    
                            		},
                            		complete:function(){
                            			$("#fuzzy").css("display","none");
                            			$("#loading").css("display","none");
                            		},
                            		error:function(){
                            			alert("error");
                            		}
                            	}); 
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
	        </div>
		    
		    </div>
		    
		    
		   <!--  <div role="tabpanel" class="tab-pane" id="messages">...</div>
		    <div role="tabpanel" class="tab-pane" id="settings">...</div> -->
		  </div>
		
		</div>

        
     </div>
       
       
       <!-- <div class="footer" > 
            <p> Copyright &copy; 2019 College of Bioinformatics Science and Technology, Harbin Medical University All rights reserved.</p>   
       </div> -->
        <script> 
    

                            
			</script> 
    <script>
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
    		    			//console.log(scatterdata);
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
   
   
	</script>


    
    
        
</body>
</html>