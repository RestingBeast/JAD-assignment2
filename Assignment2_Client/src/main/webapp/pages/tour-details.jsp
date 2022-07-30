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
	<link href="../css/fontawesome-all.min.css" rel="stylesheet">
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
                                    <div class="tour-one__stars">
                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star inactive"></i> 2 Reviews
                                    </div><!-- /.tour-one__stars -->
                                </div><!-- /.tour-two__top-left -->
                                <div class="tour-two__right">
                                    <p><span><%= tour.getPrice() %></span> <br> Per Person</p>
                                </div><!-- /.tour-two__right -->
                            </div><!-- /.tour-two__top -->
                            <ul class="tour-one__meta list-unstyled">
                                <li><a href="tour-details.html"><%= tour.getBriefDescription() %></a></li>
                            </ul><!-- /.tour-one__meta -->

                            <h3 class="tour-details__title">Overview</h3><!-- /.tour-details__title -->
                            <p><%= tour.getDetailedDescription() %></p>
                        </div><!-- /.tour-details__content -->
                    </div><!-- /.col-lg-12 -->
                </div><!-- /.row -->
                <div class="row">
                	<div class="col-lg-12">
						<h3 class="tour-details__title">Reviews Scores</h3><!-- /.tour-details__title -->
						<div class="tour-details__review-score">
						    <div class="tour-details__review-score-ave">
						        <div class="my-auto">
						            <h3>7.0</h3>
						            <p><i class="fa fa-star"></i> Super</p>
						        </div><!-- /.my-auto -->
						    </div><!-- /.tour-details__review-score-ave -->
						    <div class="tour-details__review-score__content">
						        <div class="tour-details__review-score__bar">
						            <div class="tour-details__review-score__bar-top">
						                <h3><i class="fa fa-star"></i></h3>
						                <p>50%</p>
						            </div><!-- /.tour-details__review-score__bar-top -->
						        </div><!-- /.tour-details__review-score__bar -->
						        <div class="tour-details__review-score__bar">
						            <div class="tour-details__review-score__bar-top">
						                <h3><i class="fa fa-star"></i></h3>
						                <p>87%</p>
						            </div><!-- /.tour-details__review-score__bar-top -->
						        </div><!-- /.tour-details__review-score__bar -->
						        <div class="tour-details__review-score__bar">
						            <div class="tour-details__review-score__bar-top">
						                <h3><i class="fa fa-star"></i></h3>
						                <p>63%</p>
						            </div><!-- /.tour-details__review-score__bar-top -->
						        </div><!-- /.tour-details__review-score__bar -->
						        <div class="tour-details__review-score__bar">
						            <div class="tour-details__review-score__bar-top">
						                <h3><i class="fa fa-star"></i></h3>
						                <p>34%</p>
						            </div><!-- /.tour-details__review-score__bar-top -->
						        </div><!-- /.tour-details__review-score__bar -->
						        <div class="tour-details__review-score__bar">
						            <div class="tour-details__review-score__bar-top">
						                <h3><i class="fa fa-star"></i></h3>
						                <p>22%</p>
						            </div><!-- /.tour-details__review-score__bar-top -->
						        </div><!-- /.tour-details__review-score__bar -->
						        <div class="tour-details__review-score__bar">
						            <div class="tour-details__review-score__bar-top">
						                <h3><i class="fa fa-star"></i></h3>
						                <p>70%</p>
						            </div><!-- /.tour-details__review-score__bar-top -->
						        </div><!-- /.tour-details__review-score__bar -->
						    </div><!-- /.tour-details__review-score__content -->
						</div><!-- /.tour-details__review-score -->
						
						<div class="tour-details__review-comment">
						    <div class="tour-details__review-comment-single">
						        <div class="tour-details__review-comment-top">
						            <img src="../images/tour/tour-review-1-1.jpg" alt="">
						            <h3>Mike Hardson</h3>
						            <p>06 Dec, 2019</p>
						        </div><!-- /.tour-details__review-comment-top -->
						        <div class="tour-details__review-comment-content">
						            <h3>Fun Was To Discover This</h3>
						            <p>Lorem ipsum is simply free text used by copytyping refreshing. Neque porro
						                est qui
						                dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae
						                vitae dicta
						                sunt explicabo var lla sed sit amet finibus eros.</p>
						        </div><!-- /.tour-details__review-comment-content -->
						        <div class="tour-details__review-form-stars">
						            <div class="row">
						                <div class="col-md-4">
						                    <p><span>Services</span>
						                        <i class="fa fa-star active"></i>
						                    </p>
						                </div><!-- /.col-md-4 -->
						            </div><!-- /.row -->
						        </div><!-- /.tour-details__review-form-stars -->
						    </div><!-- /.tour-details__review-comment-single -->
						</div><!-- /.tour-details__review-comment -->
						
						<h3 class="tour-details__title">Write a Review</h3><!-- /.tour-details__title -->
						<div class="tour-details__review-form">
                                <div class="tour-details__review-form-stars">
                                    <form action="inc/sendemail.php" class="contact-one__form">
                                        <div class="row low-gutters">
                                            <div class="col-md-6">
                                                <div class="input-group">
                                                    <input type="text" name="name" placeholder="Your Name">
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-6 -->
                                            <div class="col-md-6">
                                                <div class="input-group">
                                                    <input type="text" name="email" placeholder="Email Address">
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-6 -->
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" name="rating" placeholder="Rating">
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-12 -->
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <textarea name="message" placeholder="Write Message"></textarea>
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-12 -->
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <button type="submit" class="thm-btn contact-one__btn">Submit a
                                                        review</button>
                                                    <!-- /.thm-btn contact-one__btn -->
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-12 -->
                                        </div><!-- /.row low-gutters -->
                                    </form>
                                </div><!-- /.tour-details__review-form -->
                            </div><!-- /.tour-details__content -->
                	</div>
                </div>
            </div><!-- /.container -->
        </section><!-- /.tour-two -->
        
        <%@ include file="./components/footer.jsp" %>
	</div>
</body>
</html>