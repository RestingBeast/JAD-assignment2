<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<link
    href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
    rel="stylesheet">

<% String id_h=(String) session.getAttribute("sessUserID"); String
	role_h=(String)session.getAttribute("sessRole"); %>


<header class="main-nav__header-three">
	<nav class="header-navigation stricky">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="main-nav__logo-box">
				<a href="./index.jsp" class="main-nav__logo">
					<img src="../images/logo-light.png" class="main-logo" width="123"
						alt="Awesome Image" />
				</a>
				<a href="#" class="side-menu__toggler"><i class="fa fa-bars"></i>
					<!-- /.smpl-icon-menu -->
				</a>
			</div><!-- /.logo-box -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="main-nav__main-navigation">
				<ul class=" main-nav__navigation-box">
					<li class="dropdown">
						<a href="./index.jsp">Home</a>
					</li>
					<li>
						<a href="./managetours.jsp">Tours</a>
						<ul>
								<li><a href="./bestsellingtours.jsp">Best Selling</a></li>
								<li><a href="./lowslotsavailability.jsp">Slots Availability</a></li>
						</ul>
					</li>
					<li>
						<a href="./managecustomers.jsp">Customer</a>	
						<ul>
							<li><a href="./sortbyaddress.jsp">Residential Address</a></li>
						</ul>
					</li>
					
					<% if (id_h != null) { %>
						<li>
							<a href="./logout.jsp">Logout</a>
						</li>
						<% } else { %>
							<li>
								<a href="./login.jsp">Login</a>
							</li>
					<% } %>
					
				</ul>
			</div> <!-- /.navbar-collapse -->
		</div> <!-- /.container -->
	</nav>
</header><!-- /.site-header -->