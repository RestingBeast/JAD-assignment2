<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="classes.User, java.util.ArrayList" %>
<%@ page import="javax.ws.rs.client.Client, javax.ws.rs.client.ClientBuilder, javax.ws.rs.core.GenericType,
 	javax.ws.rs.client.Invocation, javax.ws.rs.client.WebTarget, javax.ws.rs.core.Response, javax.ws.rs.core.MediaType" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Customer</title>
<link href="../css/bootstrap.min.css" rel="stylesheet"/>
<link href="../css/style.css" rel="stylesheet" />
</head>
<body>
	<%
			String userId = (String)session.getAttribute("sessUserID");
			String role = (String)session.getAttribute("sessRole");
			System.out.println(userId + role);
			if (role == null || !role.equals("Admin")){
				response.sendRedirect("./error/401.html");
				return;
			}
	%>
	<div class="page-wrapper">
		<%@ include file="./components/adminHeader.jsp" %>
		
		<%
			System.out.println("You are at MangeCustomer");
			ArrayList<User> userList = new ArrayList<User>();
			Client client = ClientBuilder.newClient();
			String restUrl = "http://localhost:8080/Assignment2_Server/UserService";
			WebTarget target = client
					.target(restUrl)
					.path("listAllUsers");
			
			Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
			Response resp = invocationBuilder.get();
			System.out.println("Status :" + resp.getStatus());
			
			if(resp.getStatus() == Response.Status.OK.getStatusCode()) {
				System.out.println("Successful Retrieval");
				userList = resp.readEntity(new GenericType<ArrayList<User>>() {});
		}
		%>
		
		<div class="container">
			<h1 style="font-family: sans-serif; margin-top: 20px; color: black">Manage Customers</h1>
			<div class="row my-3">
				<div class="col-md-2">
					<h3 class="text-dark" style="font-family: sans-serif;">Username</h3>
				</div>
				<div class="col-md-3">
					<h3 class="text-dark" style="font-family: sans-serif;">Email</h3>
				</div>
				<div class="col-md-2">
					<h3 class="text-dark" style="font-family: sans-serif;">Password</h3>
				</div>
				<div class="col-md-1">
					<h3 class="text-dark" style="font-family: sans-serif;">Role</h3>
				</div>
				<div class="col-md-2">
					<h3 class="text-dark" style="font-family: sans-serif;">Profile_Pic</h3>
				</div>
				<div class="col-md-2 text-justify">
					<button class="btn btn-success" onClick="window.location.href='userform.jsp'">Create New User</button>
				</div>
			</div>
			
			<% for (int i = 0; i < userList.size(); i++) { %>
				<div class="row my-2">
					<div class="col-md-2">
						<%= userList.get(i).getUsername() %>
					</div>
					<div class="col-md-3">
						<%= userList.get(i).getEmail() %>
					</div>
					<div class="col-md-2">
						<%= userList.get(i).getPassword() %>
					</div>
					<div class="col-md-1">
						<%= userList.get(i).getRole() %>
					</div>
					<div class="col-md-2">
						<%= userList.get(i).getProfile_Pic_Url() %>
					</div>
					<div class="col-md-2">
						<form action="../UserServlet?action=delete&userid=<%=userList.get(i).getUserId() %>" method="post">
							<button 
								type="button"
								class="btn btn-primary" 
								onClick= "window.location.href='userform.jsp?userid=<%= userList.get(i).getUserId() %>'">
								Update
							</button>
							<button
								type="submit"
								class="btn btn-danger" 
								onClick= "{	return confirm('Are you sure you want to delete this tour?')}">
								Delete
							</button>
						</form>
					</div>
				</div>
			<% } %>
		</div>
		
		<%@ include file="./components/footer.jsp" %>
	</div>
</body>
</html>