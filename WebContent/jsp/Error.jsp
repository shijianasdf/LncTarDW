<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <style>
        .footer::before{
            content:"";
            background: url("image/gpa.png") no-repeat;
            position:absolute;
            height:90px;
            width:182px;
            left: 100px;
        }
    </style>
</head>
<body>
       <nav  id="navbar" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
           <div class="container">
               <!-- <div id="navbar-image" class="navbar-header">
                   <a class="navbar-brand" href="/LncTarD/">
                       <img alt="Brand" src="image/home.databaseName.new.png" >
                   </a>
               </div> -->
               <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                   <ul class="nav navbar-nav navbar-right">
                       <li><a href="/LncTarDW/index.jsp">Home</a></li>
                       <!-- <li><a href="/LncTarD/jsp/Browser.jsp">Browser</a></li>
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
 
           <div class="container">
	            <div class="alert alert-danger" role="alert" style="text-align:center;margin-top:100px;">
					<s:property value="message"/>		
					<s:property value="exception.message"/>
				</div>
        	</div>

    
       <!-- <div class="footer" > 
            <p> Copyright &copy; 2018 College of Bioinformatics Science and Technology, Harbin Medical University All rights reserved.</p>   
       </div> -->








<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>