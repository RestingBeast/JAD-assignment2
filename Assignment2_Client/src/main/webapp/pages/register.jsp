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
		<% 
			String picture = request.getParameter("picture");
			System.out.println(picture);
		%>

		<div id="login-form-wrap">
		<h2>Register for <img src="../images/loader.png" width = "30" class="main-logo" alt="Awesome Image" />tripo</h2>
			<form id="upload-form" method="post" action="/Assignment2_Client/FileUploadServlet?action=user" enctype="multipart/form-data" >
				<p style="border: 1px solid red;">
						<input
					        type="file"
					        id="picture"
					        name="picture"
					        style="height: auto;"
				         />
					</p>	
					<p>
					<input type="submit"  value="Upload" />
					</p>		
			</form>
		
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
        	if (picture != null){
        %>
        	<p>
	        <input
	            type="text"
	            id="pic_url"
	            name="picture"
	            placeholder="pic_url"
	            value="<%=picture %>"
	            readonly
	          />
	        </p>
        <%		
        	}
        %>
        
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