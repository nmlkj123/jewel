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
<div class="wrapper">
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<tiles:insertAttribute name="header" />
	</nav>
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
	
		<tiles:insertAttribute name="left"/>
	</aside>
	<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    
		<section class="content">
			<tiles:insertAttribute name="body" />
		</section>
	</div>
	<footer class="main-footer">
	<tiles:insertAttribute name="footer" />
	</footer>
</div>
</body>
</html>