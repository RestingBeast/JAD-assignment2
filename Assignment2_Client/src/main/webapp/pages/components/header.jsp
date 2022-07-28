<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classes.Category" %>
<%@ page import="classes.CategoryUtils" %>
<%@ page import="java.util.*" %>

<link
    href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
    rel="stylesheet">

<% String id_h=(String) session.getAttribute("sessUserID"); String
role_h=(String)session.getAttribute("sessRole"); %>

<% ArrayList<Category> catList = CategoryUtils.listCategories(); %>

<header class="main-nav__header-three">
	<nav class="header-navigation stricky">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="main-nav__logo-box">
				<a href="../index.jsp" class="main-nav__logo">
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
					<li class="dropdown current">
						<a href="./index.jsp">Home</a>
					</li>
					<li class="dropdown">
						<a href="./categories.jsp?pageid=1">Tours</a>
						<ul>
							<% for(int i=0; i < catList.size(); i++) { %>
								<li><a href="./tours.jsp?categoryid=<%=i+1%>">
										<%=catList.get(i).getName()%>
									</a></li>
								<% } if (role_h !=null && role_h.equals("Admin")){ %>
									<li><a href="./managetours.jsp">Manage Tours</a></li>
									<% } %>
						</ul><!-- /.sub-menu -->
					</li>
					<li>
						<a href="./contact.jsp">Contact</a>
					</li>

					<% if (id_h !=null) { %>
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