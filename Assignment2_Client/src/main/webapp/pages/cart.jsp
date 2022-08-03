<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Cart</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
	<link
		href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
		rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<%@include file="./components/header.jsp" %>
		
		<section class="page-header"
			style="background-image: url(../images/backgrounds/category-0.jpg);">
			<div class="container">
				<h2>Categories</h2>
				<ul class="thm-breadcrumb list-unstyled">
					<li><a href="index.jsp">Home</a></li>
					<li><span>Cart</span></li>
				</ul><!-- /.thm-breadcrumb -->
			</div><!-- /.container -->
		</section><!-- /.tour-details__header -->
		
		<section style="padding-bottom:0px" class="tour-one tour-grid">
			<div class="container">
				<div class="tour-sorter-one">
					<h3>Your Cart</h3>
				</div><!-- /.tour-sorter-one -->
				<h2>No Tours added to cart :( </h2>
			</div>
		</section>
	</div>
</body>
</html>