<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classes.Tour" %>
<%@ page import="classes.TourUtils" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Tours</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/fontawesome-all.min.css" rel="stylesheet">
	<link href="../css/style.css" rel="stylesheet" />
	<link
	    href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
	    rel="stylesheet">
</head>

<body>
	<% 		
		int catid=0; 
		ArrayList<Tour> tourList = new ArrayList<Tour>();
		ArrayList<Category> list = CategoryUtils.listCategories();
		if (request.getParameter("categoryid") != null){
			catid = Integer.parseInt(request.getParameter("categoryid"));
			tourList = TourUtils.getTourByCategory(catid);
		}
		
		String place = request.getParameter("place");
		if (place != null){
			if (place.equals("")){
				response.sendRedirect("./index.jsp?errCode=invalidField");
			} else {
				tourList = TourUtils.searchTour(place);
			}
		}
	%>
	
	<div class="page-wrapper">
		<%@include file="./components/header.jsp" %>

		<section class="page-header"
			style="background-image: url(../images/backgrounds/category-<%=catid %>.jpg); background-size:150% 150%;">
			<div class="container">
				<h2>
					<% if (catid==0) { out.print(tourList.size() + " Tours Found!" ); }
						else { out.print(list.get(catid - 1).getName()); } %>
				</h2>
				<ul class="thm-breadcrumb list-unstyled">
					<li><a href="index.jsp">Home</a></li>
					<%if (catid !=0){ %>
						<li><a href="categories.jsp">Categories</a></li>
						<%} %>
							<li><span>Tours</span></li>
				</ul><!-- /.thm-breadcrumb -->
			</div><!-- /.container -->
		</section><!-- /.page-header -->

		<section class="tour-one tour-grid">
			<div class="container">
				<div class="tour-sorter-one">
					<%if (catid !=0){ %>
						<h3>
							<%=tourList.size()%> Tours Found
						</h3>
						<%} %>
				</div><!-- /.tour-sorter-one -->

				<% int i=0; %>
				<% while (i < tourList.size()) { %>
					<div class="row">
						<% 
							for(int j=0; j < 3; j++) { 
								if (i==tourList.size()){
									break;
								}
						%>
						<div class="col-lg-4 col-md-6">
							<div class="tour-one__single">
								<div class="tour-one__image">
									<img src="../images/tour/<%= tourList.get(i).getImage() %>"
										alt="">
									<a href="tour-details.jsp?tourid=<%=tourList.get(i).getId()%>">
									<i class="fa fa-heart"></i></a>
								</div><!-- /.tour-one__image -->
								<div class="tour-one__content">
									<h3><a href="tour-details.jsp?tourid=<%=tourList.get(i).getId()%>">
											<%=tourList.get(i).getName()%>
										</a></h3>
									<p><span>$<%=tourList.get(i).getPrice()%>
												</span> / Per Person</p>
									<ul class="tour-one__meta list-unstyled">
										<li><a href="tour-details.jsp?tourid=<%=tourList.get(i).getId()%>">
												<%=tourList.get(i).getBriefDescription()%>
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