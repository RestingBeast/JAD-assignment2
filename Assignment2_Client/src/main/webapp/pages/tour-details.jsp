<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="classes.*" %>
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
                    <div class="col-lg-8">
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
                    </div><!-- /.col-lg-8 -->
                    <div class="col-lg-4">
						<div class="tour-sidebar">
						    <div class="tour-sidebar__search tour-sidebar__single">
						        <h3>Book This Tour</h3>
						        <form action="<%=request.getContextPath()%>/addReview" class="tour-sidebar__search-form">
						            <div class="input-group">
						                <input type="number" placeholder="Slots" min="1" max=<%= tour.getSlots() %>>
						            </div><!-- /.input-group -->
						            <div class="input-group">
						                <button type="submit" class="thm-btn">Book Now</button>
						            </div><!-- /.input-group -->
						        </form>
						    </div><!-- /.tour-sidebar__search -->
						    <div class="offer-sidebar wow fadeInUp" data-wow-duration="1500ms" style="background-image: url(assets/images/backgrounds/offer-sidebar-bg.jpg);">
						        <h3><span class="offer-sidebar__price">20%</span><!-- /.offer-sidebar__price --> Off <br>On <span>Paris <br>Tour</span></h3>
						    </div><!-- /.offer-sidebar -->
						</div><!-- /.tour-sidebar -->
                    </div><!-- /.col-lg-4 -->
                </div><!-- /.row -->
                <div class="row">
                	<div class="col-lg-12">
                		<div class="tour-details__spacer"></div><!-- /.tour-details__spacer -->
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
						    </div><!-- /.tour-details__review-score__content -->
						</div><!-- /.tour-details__review-score -->
						        <%
						        	// @SuppressWarnings("unchecked")
						        	// ArrayList<Review> reviewArr = (ArrayList<Review>) request.getAttribute("reviewArray");
						        	ArrayList<Review> reviewArr = ReviewUtils.getReviewsByTour(tour.getId());
						        %>
						        	<% if (reviewArr != null) { %>
						        	<%	for (Review r: reviewArr) { %>
								<div class="tour-details__review-comment">
								    <div class="tour-details__review-comment-single">
								        <div class="tour-details__review-comment-top">
								            <img src="../images/tour/tour-review-1-1.jpg" alt="">
								            <h3>Mike Hardson</h3>
								            <p>06 Dec, 2019</p>
						        		</div><!-- /.tour-details__review-comment-top -->
						        		
						        		<div class="tour-details__review-comment-content">
								            <h3>Fun Was To Discover This</h3>
								            <p><%= r.getReviewDesc() %></p>
								        </div><!-- /.tour-details__review-comment-content -->
								        
								        <div class="tour-details__review-form-stars">
								            <div class="row">
								                <div class="col-md-4">
								                    <p><span>Rating</span>
								                        <i class="fa fa-star active"></i>
								                    </p>
								                </div><!-- /.col-md-4 -->
								            </div><!-- /.row -->
						        		</div><!-- /.tour-details__review-form-stars -->
						        	</div><!-- /.tour-details__review-comment-single -->
								</div><!-- /.tour-details__review-comment -->
						        <%		}
						        	}
						        %>
						
						<h3 class="tour-details__title">Write a Review</h3><!-- /.tour-details__title -->
						<div class="tour-details__review-form">
                                <div class="tour-details__review-form-stars">
                                    <form action="<%=request.getContextPath()%>/addReview" class="contact-one__form">
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