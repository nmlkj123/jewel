<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>

</head>
<body>
<div class='wrap'>
	<tiles:insertAttribute name="header" />
	<hr />
	<div class='content'>
		<tiles:insertAttribute name="left"/>
		<div class='page_content'>
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<hr/>
	<tiles:insertAttribute name="footer" />
</div>
</body>
</html>