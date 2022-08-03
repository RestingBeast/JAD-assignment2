<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Login</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
   
	<link
	    href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap"
	    rel="stylesheet">
	<link rel="stylesheet" href="../css/login-style.css" />
</head>

<body>
	<div class="page-wrapper">
		<%@ include file="./components/header.jsp" %>
		
		<div id="login-form-wrap">
			<h2>Login to <img src="../images/loader.png" width="30" class="main-logo" alt="Awesome Image"/>tripo</h2>
			<form id="login-form" action="/Assignment2_Client/servlets/VerifyUser" method="post">
				<p>
				  <input type="email" id="email" name="email" placeholder="Email Address" required />
				</p>
				<p>
				  <input type="password" id="password" name="password" placeholder="Password" required />
				</p>
				<% 
					if (request.getParameter("code") !=null){ 
					if (request.getParameter("code").equals("invalidLogin")){
				  		out.print("<p> <label class=\"form-label text-danger\">Wrong Email or Password.</label></p>");
				  	}
				  	if (request.getParameter("code").equals("created")) {
				  		out.print("<p> <label class=\"form-label text-success\">Account Created.</label></p>");
				  	}
				  	if (request.getParameter("code").equals("loggedout")) {
				  		out.print("<p> <label class=\"form-label text-success\">Logged out.</label></p>");
				  	}
				  }
				%>
				<p>
				  <input type="submit" id="login" value="Login" />
				</p>
			</form>
			<div id="create-account-wrap">
				<p>Not a member? <a href="./register.jsp">Create Account</a></p>
				<p></p>
			</div>
		</div>
	</div>
</body>

</html>