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
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		
		
		double count = 0;
		double total = 0;
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
						        <form action="/Assignment2_Client/cart?&action=buy&id=<%= tour.getId() %>" method="post" class="tour-sidebar__search-form">
						            <div class="input-group">
						                <input type="number" name="slots" placeholder="Slots" min="1" max=<%= tour.getSlots() %>>
						            </div><!-- /.input-group -->
						            
						            <% 	String error = (String) request.getSession().getAttribute("error"); %>
						            
						            <% if (error != null && !error.equals("")) { %>
						            		<p><label class="form-label text-danger"><%= error %></label></p>
						            <%	} %>
						            
						            <% request.getSession().removeAttribute("error"); %>
						            
						            <div class="input-group">
						                <input type="submit" class="thm-btn" value="Book Now" />
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
								            <h3>
									           	<%
									           	ArrayList<Review> reviewArr = ReviewUtils.getReviewsByTour(tid);
									           	if (!reviewArr.isEmpty()) {
													for (Review r: reviewArr) { 
										        			count++;
										        			total += r.getRating();
													}
													out.print(total/count);
												%>
													<p><i class="fa fa-star"></i>
									            	<%
									            			if (total/count > 4.5){
										            			out.print("Super");
										            		} else if (total/count > 3.0){
										            			out.print("Decent");
										            		} else if (total/count < 1.5){
										            			out.print("Bad");
										            		}
									            	%>
									            	</p>
												<%
									           	} else {
									           		out.print("0 review");
									           	}
									           	%>
								            </h3>
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
								</div>
						        <%
						        	// @SuppressWarnings("unchecked")
						        	// ArrayList<Review> reviewArr = (ArrayList<Review>) request.getAttribute("reviewArray");
						        %>
						        	<% if (reviewArr != null) {
						        	%>
						        	<%	for (Review r: reviewArr) { 
						        			count++;
						        			total += r.getRating();
						        			
						        	%>
								<div class="tour-details__review-comment">
								    <div class="tour-details__review-comment-single">
								        <div class="tour-details__review-comment-top">
								            <img src="../images/tour/tour-review-1-1.jpg" alt="">
								            <h3><%=r.getUsername()%></h3>
								            <p><%= r.getCreatedAt()%></p>
						        		</div><!-- /.tour-details__review-comment-top -->
						        		
						        		<div class="tour-details__review-comment-content">
								            <h3><%= r.getReviewDesc()%></h3>
								        </div><!-- /.tour-details__review-comment-content -->
								        
								        <div class="tour-details__review-form-stars">
								            <div class="row">
								                <div class="col-md-4">
								                    <p><span>Rating</span>
								                        <i class="fa fa-star active"><%= r.getRating()%></i>
								                    </p>
								                </div><!-- /.col-md-4 -->
								            </div><!-- /.row -->
						        		</div><!-- /.tour-details__review-form-stars -->
						        	</div><!-- /.tour-details__review-comment-single -->
								</div><!-- /.tour-details__review-comment -->
						        <%		}
						        	}
						        %>
						
						<%
							if(userId == null){
						%>
							<h3 class="tour-details__title">You must be logged in to write a review.</h3>
						<%
							} else {
						%>
							<h3 class="tour-details__title">Write a Review</h3><!-- /.tour-details__title -->
						<div class="tour-details__review-form">
                                <div class="tour-details__review-form-stars">
                                    <form action="<%=request.getContextPath()%>/addReview" class="contact-one__form">
                                            <div class="col-md-12">
                                            	<input type="hidden" name="fk_user_id" value=<%=userId %> />
                                            	<input type="hidden" name="fk_tour_id" value=<%=tid %> />
                                                <div class="input-group">
                                                    <input type="text" name="rating" placeholder="Rating" required>
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-12 -->
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <textarea name="message" placeholder="Write Message"></textarea>
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-12 -->
                                            <%
                                            	String errCode = request.getParameter("err");
                                            	if (errCode != null){
                                            %>
                                            	 <div class="col-md-12" style="color: red;">
                                            	 <p>
                                            <%
                                            		if (errCode.equals("InvalidRating")){
                                            			out.print("Invalid Rating! Rating must be greater than 0 and less than 5.");
                                            		}
                                            		if(errCode.equals("Notfound")){
                                            			out.print("failed to create review");
                                            		}
                                            %>
                                            	</p>
                                            	</div>
                                            <%
												}	
                                            %>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <button type="submit" class="thm-btn contact-one__btn">
                                                    Submit a review</button>
                                                    <!-- /.thm-btn contact-one__btn -->
                                                </div><!-- /.input-group -->
                                            </div><!-- /.col-md-12 -->
                                        </div><!-- /.row low-gutters -->
                                    </form>
                                </div><!-- /.tour-details__review-form -->
                            </div><!-- /.tour-details__content -->
						<%
							}
						%>
                	</div>
                </div>
            </div><!-- /.container -->
        </section><!-- /.tour-two -->
        
        <%@ include file="./components/footer.jsp" %>
	</div>
</body>
</html>