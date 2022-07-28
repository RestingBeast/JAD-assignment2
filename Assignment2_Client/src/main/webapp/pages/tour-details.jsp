<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="classes.Tour" %>
<%@ page import="classes.TourUtils" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tour Details</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
	<link
		href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
		rel="stylesheet">
</head>
<body>
	<%	
		int tid = Integer.parseInt(request.getParameter("tourid"));
		Tour tour = TourUtils.getTour(tid);
	%>
	
	<div class="page-wrapper">
		<%@ include file="./components/header.jsp" %>
	
        <div class="tour-details__header"
            style="background-image: url(../images/tour/<%= tour.getImage()%>);">
            <div class="container">
                <ul class="thm-breadcrumb list-unstyled">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="categories.jsp">Categories</a></li>
                    <li><span>Tours</span></li>
                    <li><span>Tour Details</span></li>
                </ul><!-- /.thm-breadcrumb -->
            </div><!-- /.container -->
        </div><!-- /.tour-details__header -->
        
        <section class="tour-two tour-list tour-details-two">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="tour-details__content">
                            <div class="tour-two__top">
                                <div class="tour-two__top-left">
                                    <h3><%= tour.getName() %></h3>

                                </div><!-- /.tour-two__top-left -->
                                <div class="tour-two__right">
                                    <p><span><%= tour.getPrice() %></span> <br> Per Person</p>
                                </div><!-- /.tour-two__right -->
                            </div><!-- /.tour-two__top -->
                            <ul class="tour-one__meta list-unstyled">
                                <li><a href="tour-details.html"><i class="far fa-clock"></i><%= tour.getBriefDescription() %></a></li>
                            </ul><!-- /.tour-one__meta -->

                            <h3 class="tour-details__title">Overview</h3><!-- /.tour-details__title -->
                            <p><%= tour.getDetailedDescription() %></p>
                        </div><!-- /.tour-details__content -->
                    </div><!-- /.col-lg-12 -->
                </div><!-- /.row -->
            </div><!-- /.container -->
        </section><!-- /.tour-two -->
        
        <%@ include file="./components/footer.jsp" %>
	</div>
</body>
</html>