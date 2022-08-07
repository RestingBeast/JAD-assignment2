<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classes.*" %>
<%@ page import="java.util.*" %>
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
	<style>
		.debugBox {
			border: 1px solid red;
			padding: 1em;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="./components/header.jsp" %>
		
		<section class="page-header"
			style="background-image: url(../images/backgrounds/category-0.jpg);">
			<div class="container">
				<h2>Cart</h2>
				<ul class="thm-breadcrumb list-unstyled">
					<li><a href="index.jsp">Home</a></li>
					<li><span>Cart</span></li>
				</ul><!-- /.thm-breadcrumb -->
			</div><!-- /.container -->
		</section><!-- /.tour-details__header -->
		
		<% 	
			@SuppressWarnings("unchecked")
			ArrayList<Tour> cart =  (ArrayList<Tour>) session.getAttribute("cart"); 
			@SuppressWarnings("unchecked")	
			ArrayList<Integer> slots = (ArrayList<Integer>) session.getAttribute("slots");
		%>
	
		<% if (cart != null) { %>
			<table>
				<tr>
					<th>Items</th>
					<th>Tour</th>
					<th>Slots</th>
					<th>Total Price</th>
					<th>Option</th>
				</tr>
				<tr>
					<% for(int i = 0; i < cart.size(); i++) { %>
							<td><%= (i + 1) %></td>
							<td><%= cart.get(i).getName() %></td>
							<td><%= slots.get(i) %></td>
							<td><%= (cart.get(i).getPrice() * slots.get(i)) %></td>
							<td>Delete</td>
					<%	} %>
				</tr>
			</table>	
		<% } else { %>
			<section style="padding-bottom:0px" class="tour-one tour-grid">
				<div class="container">
					<div class="tour-sorter-one">
						<h3>Your Cart</h3>
					</div><!-- /.tour-sorter-one -->
					<h2>No Tours added to cart :( </h2>
				</div>
			</section>
		<% } %>
	</div>
</body>
</html>