<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/login-style.css" />
</head>
<body>
	<div class="page-wrapper">
		<%@ include file="./components/header.jsp" %>
	
		<div id="login-form-wrap">
      	<h2>Register for <img src="../images/loader.png" width = "30" class="main-logo" alt="Awesome Image" />tripo</h2>
      <form id="login-form" action="/Assignment1/servlets/AddUser" method="post">
        <p>
        <input
            type="text"
            id="username"
            name="username"
            placeholder="Username"
            required
          />
        </p>
        <p>
        <input
            type="email"
            id="email"
            name="email"
            placeholder="Email Address"
            required
          />
        </p>
        <p>
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Password"
            required
          />
        </p>
        <%
        	if (request.getParameter("errCode") != null && request.getParameter("errCode").equals("failed")){
        		out.print("<p> <label style=\"color: red\">Failed to register an account.</label></p>");
        	}
        %>
        <p>
          <input type="submit" id="register" value="register" />
        </p>
      </form>
      <div id="create-account-wrap">
        <p>Have an account? <a href="./login.jsp">Login</a></p>
        <p></p>
      </div>
    </div>
	</div>
</body>
</html>