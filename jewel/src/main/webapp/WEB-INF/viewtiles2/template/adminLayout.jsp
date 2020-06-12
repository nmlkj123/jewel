<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<style>

#left{
            float:left;
             width:15%;
            
        }
        #content{
            float:left;
             width:85%;
           
        }
</style>
</head>
<body>
<div class='wrap'>
	<tiles:insertAttribute name="header" />
	<hr />
	<div id="left">
		<tiles:insertAttribute name="left"/>
	</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
	
	<hr/>
	<tiles:insertAttribute name="footer" />
</div>
</body>
</html>