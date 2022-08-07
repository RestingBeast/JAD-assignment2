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
	<% 	
		String error = (String) session.getAttribute("error");
		ArrayList<Tour> cart =  (ArrayList<Tour>) session.getAttribute("cart"); 
		ArrayList<Integer> slots = (ArrayList<Integer>) session.getAttribute("slotsArr");
	%>
	
	<div class="wrapper">
		<%@include file="./components/header.jsp" %>
		
		<section class="page-header"
			style="background-image: url(../images/backgrounds/category-0.jpg);">
			<div class="container">
				<h2>Your Cart</h2>
				<ul class="thm-breadcrumb list-unstyled">
					<li><a href="index.jsp">Home</a></li>
					<li><span>Cart</span></li>
				</ul><!-- /.thm-breadcrumb -->
			</div><!-- /.container -->
		</section><!-- /.tour-details__header -->
	
		<% if (error != null && !error.equals("")) { %>
			<section style="padding-bottom:0px" class="tour-one tour-grid">
				<div class="container">
					<div class="tour-sorter-one">
							<h3><%= error %></h3>
					</div><!-- /.tour-sorter-one -->
				</div>
			</section>
		<% } %>
	
		<% if (cart != null && cart.size() != 0 && 
			slots != null && slots.size() != 0 ) { %>
		<section style="padding-bottom:0px" class="tour-one tour-grid">
			<div class="container">
				<div class="tour-sorter-one">
						<h3>Tour Categories</h3>
				</div><!-- /.tour-sorter-one -->
				<div class="row my-3">
					<div class="col-md-2">
						<h3 class="text-dark" style="font-family: sans-serif;">Item</h3>
					</div>
					<div class="col-md-2">
						<h3 class="text-dark" style="font-family: sans-serif;">Tour</h3>
					</div>
					<div class="col-md-2">
						<h3 class="text-dark" style="font-family: sans-serif;">Category</h3>
					</div>
					<div class="col-md-2">
						<h3 class="text-dark" style="font-family: sans-serif;">Slots</h3>
					</div>
					<div class="col-md-2">
						<h3 class="text-dark" style="font-family: sans-serif;">Total Price</h3>
					</div>
					<div class="col-md-2 text-justify">
						<button class="btn btn-success" onClick="window.location.href='checkout.jsp'">Checkout</button>
					</div>
				</div>
				<% for(int i = 0; i < cart.size(); i++) { %>
					<div class="row my-2">
						<div class="col-md-2">
							<%= (i + 1) %>
						</div>
						<div class="col-md-2">
							<%= cart.get(i).getName() %>
						</div>
						<div class="col-md-2">
							<%= CategoryUtils.getCategoryName(cart.get(i).getCategoryID()) %>
						</div>
						<div class="col-md-2">
							<%= slots.get(i) %>
						</div>
						<div class="col-md-2">
							<%= (cart.get(i).getPrice() * slots.get(i)) %>
						</div>
						<div class="col-md-2">
							<form action="/Assignment2_Client/cart?&action=remove&id=<%= cart.get(i).getId() %>" method="post">
								<button
									type="submit"
									class="btn btn-danger text-justify" 
									onClick= "{	return confirm('Are you sure you want to delete this item?')}">
									Delete
								</button>
							</form>
						</div>
					</div>
				<%	} %>
				<br>
				<a href="./categories.jsp">Continue Shopping</a>
			</div>
		</section>
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