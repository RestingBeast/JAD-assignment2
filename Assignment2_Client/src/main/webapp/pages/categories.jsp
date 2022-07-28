<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classes.Tour" %>
<%@ page import="classes.TourUtils" %>
<%@ page import="classes.Category" %>
<%@ page import="classes.CategoryUtils" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Tour Categories</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
	<link
		href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
		rel="stylesheet">
</head>

<body>
	<% 
		ArrayList<Tour> tourList = TourUtils.listProducts();
		ArrayList<Category> list = CategoryUtils.listCategories();
	%>

	<div class="page-wrapper">
		<%@ include file="./components/header.jsp" %>

		<section class="page-header"
			style="background-image: url(../images/backgrounds/category-0.jpg);">
			<div class="container">
				<h2>Categories</h2>
				<ul class="thm-breadcrumb list-unstyled">
					<li><a href="index.jsp">Home</a></li>
					<li><span>Categories</span></li>
				</ul><!-- /.thm-breadcrumb -->
			</div><!-- /.container -->
		</section><!-- /.tour-details__header -->

		<section style="padding-bottom:0px" class="tour-one tour-grid">
			<div class="container">
				<div class="tour-sorter-one">
					<h3>Tour Categories</h3>
				</div><!-- /.tour-sorter-one -->

				<% int i=0; %>
				<% while (i < list.size()) { %>
					<div class="row">
					<% for(int j=0; j < 3; j++) { %>
						<% int categoryid=list.get(i).getCategoryID(); %>
	
						<div class="col-lg-4 col-md-6">
							<div class="tour-one__single">
								<div class="tour-one__image">
									<img src="../images/tour/category-<%=list.get(i).getCategoryID()%>.jpg"
										alt="">
								</div><!-- /.tour-one__image -->
								<div class="tour-one__content">
									<h3><a href="tours.jsp?categoryid=<%=categoryid%>">
											<%=list.get(i).getName()%>
									</a></h3>
									<ul class="tour-one__meta list-unstyled">
										<li><a href="tours.jsp?categoryid=<%=categoryid%>">
											<%=list.get(i).getDescription()%>
										</a></li>
									</ul><!-- /.tour-one__meta -->
								</div><!-- /.tour-one__content -->
							</div><!-- /.tour-one__single -->
						</div><!-- /.col-lg-4 -->
						<% i++; %>
					<% } %>
					</div><!-- /.row -->
				<% } %>
			</div><!-- /.container -->
		</section><!-- /.tour-one -->

		<section class="tour-one tour-grid">
			<div class="container">
				<div class="tour-sorter-one">
					<h3>
						<%= tourList.size() %> Tours Found
					</h3>
				</div><!-- /.tour-sorter-one -->

				<% i=0; %>
				<% while (i < tourList.size()) { %>
					<% 
						int remainder = tourList.size() - i;
						int recordsPerRow = 3;
						
						if (remainder < 3) {
							recordsPerRow = remainder;
						}
					%>
					<div class="row">
						<% 
							for (int j = 0; j < 3; j++) { 
								if (i == tourList.size()){
									break;
								}
						%>
						<div class="col-lg-4 col-md-6">
							<div class="tour-one__single">
								<div class="tour-one__image">
									<img src="../images/tour/<%=tourList.get(i).getImage() %>"
										alt="">
									<a href="tour-details.jsp?tourid=<%=tourList.get(i).getId()%>">
									<i class="fa fa-heart"></i></a>
								</div><!-- /.tour-one__image -->
								<div class="tour-one__content">
									<h3><a href="tour-details.jsp?tourid=<%=tourList.get(i).getId()%>">
											<%= tourList.get(i).getName() %>
										</a></h3>
									<p><span>$<%= tourList.get(i).getPrice()
												%></span> / Per Person</p>
									<ul class="tour-one__meta list-unstyled">
										<li><a href="tour-details.jsp?tourid=<%=tourList.get(i).getId()%>">
												<%= tourList.get(i).getBriefDescription()%>
											</a></li>
									</ul><!-- /.tour-one__meta -->
								</div><!-- /.tour-one__content -->
							</div><!-- /.tour-one__single -->
						</div><!-- /.col-lg-4 -->
						<% i++; %>
					<% } %>
					</div><!-- /.row -->
				<% } %>
			</div><!-- /.container -->
		</section><!-- /.tour-one -->
		
		<%@ include file="./components/footer.jsp" %>
	</div>
</body>

</html>