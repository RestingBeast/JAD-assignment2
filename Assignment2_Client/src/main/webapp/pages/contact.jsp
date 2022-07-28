<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
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
	
	    <section class="page-header"
	        style="background-image: url(../images/backgrounds/category-0.jpg);">
	        <div class="container">
	            <h2>Contact</h2>
	            <ul class="thm-breadcrumb list-unstyled">
	                <li><a href="index.jsp">Home</a></li>
	                <li><span>Contact</span></li>
	            </ul><!-- /.thm-breadcrumb -->
	        </div><!-- /.container -->
	    </section><!-- /.page-header -->
	
	    <section class="contact-info-one">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-4">
	                    <div class="contact-info-one__single">
	                        <div class="contact-info-one__icon">
	                            <i class="tripo-icon-placeholder"></i>
	                        </div><!-- /.contact-info-one__icon -->
	                        <div class="contact-info-one__content">
	                            <p> Location: Singapore</p>
	                        </div><!-- /.contact-info-one__content -->
	                    </div><!-- /.contact-info-one__single -->
	                </div><!-- /.col-lg-4 -->
	                <div class="col-lg-4">
	                    <div class="contact-info-one__single">
	                        <div class="contact-info-one__icon">
	                            <i class="tripo-icon-phone-call"></i>
	                        </div><!-- /.contact-info-one__icon -->
	                        <div class="contact-info-one__content">
	                            <p>Local: <a href="tel:666-999-0000">666 999 0000</a> <br>
	                                Mobile: <a href="tel:+123-456-hello">+ 123 456 hello</a></p>
	                        </div><!-- /.contact-info-one__content -->
	                    </div><!-- /.contact-info-one__single -->
	                </div><!-- /.col-lg-4 -->
	                <div class="col-lg-4">
	                    <div class="contact-info-one__single">
	                        <div class="contact-info-one__icon">
	                            <i class="tripo-icon-message"></i>
	                        </div><!-- /.contact-info-one__icon -->
	                        <div class="contact-info-one__content">
	                            <p><a href="mailto:needhelp@tripo.com">needhelp@tripo.com</a> <br>
	                                <a href="mailto:info@tripo.com">info@tripo.com</a>
	                            </p>
	                        </div><!-- /.contact-info-one__content -->
	                    </div><!-- /.contact-info-one__single -->
	                </div><!-- /.col-lg-4 -->
	            </div><!-- /.row -->
	        </div><!-- /.container -->
	    </section><!-- /.contact-info-one -->
	
	    <section class="contact-one">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-5">
	                    <div class="contact-one__content">
	                        <div class="block-title text-left">
	                            <p>Contact with us</p>
	                            <h3>Have any Question? <br>
	                                feel free to contact <br>
	                                with us.</h3>
	                        </div><!-- /.block-title -->
	                        <div class="contact-one__content-text">
	                            <p>We will get back to you in three-working days. If you wish to inquire, <br>
								   about the tours, you can give us a call between working hours.	                            
	                            </p>
	                        </div><!-- /.contact-one__content-text -->
	                    </div><!-- /.contact-one__content -->
	                </div><!-- /.col-lg-5 -->
	                <div class="col-lg-7">
	                    <form action="/Assignment1/servlets/addFeedback" method="post"
	                        class="contact-one__form">
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
	                            <div class="col-md-6">
	                                <div class="input-group">
	                                    <input type="text" name="phone" placeholder="Phone Number">
	                                </div><!-- /.input-group -->
	                            </div><!-- /.col-md-6 -->
	                            <div class="col-md-6">
	                                <div class="input-group">
	                                    <input type="text" name="subject" placeholder="Subject">
	                                </div><!-- /.input-group -->
	                            </div><!-- /.col-md-6 -->
	                            <div class="col-md-12">
	                                <div class="input-group">
	                                    <textarea name="message" placeholder="Write Message"></textarea>
	                                </div><!-- /.input-group -->
	                            </div><!-- /.col-md-12 -->
	                            <% if (request.getParameter("code")!=null){ String
	                                code=request.getParameter("code"); %>
	                                <div class="input-group">
	                                    <div class="col-md-12">
	                                        <% if (code.equals("created")){ %>
	                                            <label class="form-label text-success">Feedback Sent!</label>
	                                        <% } if (code.equals("failed")){ %>
	                                               <label class="form-label text-danger">Failed to send feedback!</label>
	                                        <% } %>
	                                    </div>
	                                </div>
	                            <% } %>
								<div class="col-md-12">
								    <div class="input-group">
								        <button type="submit" class="thm-btn contact-one__btn">Send
								            message</button><!-- /.thm-btn contact-one__btn -->
								    </div><!-- /.input-group -->
								</div><!-- /.col-md-12 -->
	                        </div><!-- /.row low-gutters -->
	                    </form>
	                </div><!-- /.col-lg-7 -->
	            </div><!-- /.row -->
	        </div><!-- /.container -->
	    </section><!-- /.contact-one -->
	    
		<%@ include file="./components/footer.jsp" %>
    </div>
</body>

</html>