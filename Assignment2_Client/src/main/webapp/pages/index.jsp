<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
   <html>

<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
	<link
	    href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
	    rel="stylesheet">
</head>

 <body>
	<div class="page-wrapper">
    	<%@include file="./components/header.jsp" %>
    
	    <div class="home-7-content-wrap">
	        <section class="tour-search-one__home-four tour-search-one__home-seven">
	
	            <div class="container">
	                <div class="row">
	                    <div class="col-lg-6">
	                        <div class="block-title">
	                            <p>Find Adventure That Suits You </p>
	                            <h3 class="text-uppercase">Ultimate Travel & <br> Tour Booking</h3>
	                        </div><!-- /.block-title -->
	                        <form class="tour-search-one" action="./tours.jsp?">
	                            <div class="tour-search-one__inner">
	                                <div class="tour-search-one__inputs">
	                                    <div class="tour-search-one__col">
	                                        <div class="tour-search-one__input-box">
	                                            <label for="place">Where to</label>
	                                            <input type="text" placeholder="Enter keywords" name="place"
	                                                id="place">
	                                        </div><!-- /.tour-search-one__input-box -->
	                                    </div><!-- /.tour-search-one__col -->
	                                </div><!-- /.tour-search-one__inputs -->
		                             <% if (request.getParameter("errCode") !=null){ %>
		                                    <div class="tour-search-one__inputs">
		                                        <div class="tour-search-one__col">
		                                            <label class="form-label text-danger">One or more invalid
		                                                fields</label>
		                                        </div>
		                                    </div>
		                             <% } %>
	                                <div class="tour-search-one__btn-wrap">
	                                    <button type="submit" class="thm-btn tour-search-one__btn">Find
	                                        now</button>
	                                </div><!-- /.tour-search-one__btn-wrap -->
	                            </div><!-- /.tour-search-one__inner -->
							</form><!-- /.tour-search-one -->
	                    </div><!-- /.col-lg-6 -->
	                    <div class="col-lg-6 features-two pt-0 pb-0">
	                        <div class="row no-gutters tour-search-one__home-seven-content">
	                            <div class="col-lg-12">
	                                <div class="features-two__single">
	                                    <h3>Many Choices</h3>
	                                    <p>Our website offers many varieties of tours. <br> 
	                                    	You can choose to go on a tour with a group or 
	                                        <br> privately with your family and friends.
	                                    </p>
	                                </div><!-- /.features-two__single -->
	                            </div><!-- /.col-lg-12 -->
	                            <div class="col-lg-12">
	                                <div class="features-two__single">
	                                    <h3>Best Prices</h3>
	                                    <p>Our prices are relatively cheap and affordable <br>
	                                         and we guarantee that you will get 
	                                        <br> your money worth when you go on our tours.
	                                    </p>
	                                </div><!-- /.features-two__single -->
	                            </div><!-- /.col-lg-12 -->
	                            <div class="col-lg-12">
	                                <div class="features-two__single">
	                                    <h3>Pack Up & Go</h3>
	                                    <p>Our tours don't usually go on for so long. So, <br>
	                                        you can pack light and travel lightly.
	                                    </p>
	                                </div><!-- /.features-two__single -->
	                            </div><!-- /.col-lg-12 -->
	                        </div><!-- /.row -->
	                    </div><!-- /.col-lg-6 -->
	                </div><!-- /.row -->
	            </div><!-- /.container -->
	        </section>
	        
    		<%@ include file="./components/footer.jsp" %>
        </div><!-- /.home-7-content-wrap -->
    </div><!-- ./page-wrapper -->
</body>

</html>