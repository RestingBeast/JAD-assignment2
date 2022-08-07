<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, classes.User" %>
<%@ page import="javax.ws.rs.client.Client, javax.ws.rs.client.ClientBuilder, javax.ws.rs.core.GenericType,
 	javax.ws.rs.client.Invocation, javax.ws.rs.client.WebTarget, javax.ws.rs.core.Response, javax.ws.rs.core.MediaType" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Form</title>
<link href="<%= request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />
	<link href="<%= request.getContextPath()%>/css/style.css" rel="stylesheet" />
	<style>
		.image-center{
			margin: auto;
		}
		.no-display{
			display: none;
		}
	</style>
</head>
<body>
	<div class="page-wrapper">
		<%@ include file="./components/adminHeader.jsp" %>
		<%
			String picture = "", username="", email="", password="", roleF="";
			int userid = -1; 
			User u = null;
		%>
		<%
			String userId = (String)session.getAttribute("sessUserID");
			String role = (String)session.getAttribute("sessRole");
			System.out.println(userId + role);
			if (role == null || !role.equals("Admin")){
				response.sendRedirect("./error/401.html");
				return;
			}
		%>
		<%
			if (request.getParameter("userid") != null) {
				userid = Integer.parseInt(request.getParameter("userid"));
				Client client = ClientBuilder.newClient();
				String restUrl = "http://localhost:8080/Assignment2_Server/UserService";
				WebTarget target = client
						.target(restUrl)
						.path("getUser")
						.queryParam("userid", userid);
				
				Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
				Response resp = invocationBuilder.get();
				System.out.println("Status :" + resp.getStatus());
				
				if(resp.getStatus() == Response.Status.OK.getStatusCode()) {
					System.out.println("Successful Retrieval");
					u = new User();
					u = resp.readEntity(User.class);
					username = u.getUsername();
					email = u.getEmail();
					password = u.getPassword();
					roleF = u.getRole();
					picture = u.getProfile_Pic_Url();
				}
			}
		%>
		<%			
			if (request.getParameter("pic_url") != null) {
				picture = request.getParameter("pic_url");
				System.out.println(picture);
			}
		%>
		<div class="form">
			<h2 class="h2" style="text-align: center;">User Form</h2>
			<div class="form-group row" >
				<div class="image-center"><img src="/Assignment2_Client/ServeImage?action=user&picture=<%=picture%>" alt="" ></div>		
			</div>
			<form method="post"action="/Assignment2_Client/FileUploadServlet?action=userForm" enctype="multipart/form-data" >
				<div class="form-group row">
					<div class="col-md-2">
						<input class="no-display" type="text" id="userid" name="userid" value="<%= userid %>" readonly >
					</div>
					<input
				        type="file"
				        class="form-control col-md-6"
				        id="picture"
				        name="picture"
			         />
			         <input class="col-md-2 btn btn-primary" type="submit"  value="Upload" />
			         <div class="col-md-2"></div>
				</div>	
			</form>
			<form  method="post" action="/Assignment2_Client/UserServlet">
				<div class="form-group row">
					<input class="no-display" type="text" id="pic_url" name="pic_url" value="<%=picture%>" readonly >
				  <label for="tourname" class="col-md-2 col-form-label">Username:</label>
				  <div class="col-md-10">
					  <input
				        type="text"
				        class="form-control"
				        id="username"
				        name="username"
				        value="<%= username %>"
				        required
			          />
				  </div>
		        </div>
		        <div class="form-group row">
				  <label for="brief_desc" class="col-md-2 col-form-label">Email:</label>
				  <div class="col-md-10">
				  	<input
				        type="text"
			            class="form-control"
			            id="email"
			            name="email"
			            value="<%= email %>"
		          	/>
				  </div>
		        </div>
		        <div class="form-group row">
				  <label for="detailed_desc" class="col-md-2 col-form-label">Password: </label>
		          <div class="col-md-10">
		          	<input
				        type="text"
			            class="form-control"
			            id="password"
			            name="password"
			            value="<%= password %>"
		          	/>
		          </div>
		        </div>
		        <fieldset class="form-group">
		        	<div class="row">
		        		<legend class="col-md-2 col-form-label">Role:</legend>
						<div class="col-md-10">
							<div class="form-check">
								<input
									class="form-check-input"
									type="radio"
									name="role"
									id="role1"
									value="Member"
									required
									<%
										if (roleF.equals("Member")){
											out.println("checked");
										}
									%>
								/>
								<label class="form-check-label" for="role1">
									Member
								</label>
							</div>
							<div class="form-check">
								<input
									class="form-check-input"
									type="radio"
									name="role"
									id="role2"
									value="Admin"
									required
									<%
										if (roleF.equals("Admin")){
											out.println("checked");
										}
									%>
								/>
								<label class="form-check-label" for="role2">
									Admin
								</label>
							</div>
						</div>
		        	</div>
		        </fieldset>
		        <%
		        	if (request.getParameter("errCode") != null) {
		        		String errCode = request.getParameter("errCode");
		        		if (errCode.equals("invalidField")){
		        			out.println("<div class=\"form-group row\">"
		        						+ "<label class=\"form-label text-danger col-md-12\">One or more Invalid Field</label>"
		        						+ "</div>");
		        		}
		        		if (errCode.equals("failed")){
		        			out.println("<div class=\"form-group row\">"
	        						+ "<label class=\"form-label text-danger col-md-12\">Failed to create tour.</label>"
	        						+ "</div>");
		        		}
		        	}
		        %>
		        <div class="form-group row">
		        	<div class="col-md-2">
		        	</div>
				    <div class="col-md-10">
				      <% if (userid != -1){ %>
				      		<button type="submit" formaction="/Assignment2_Client/UserServlet?action=update&userid=<%=userid%>" class="btn btn-primary mr-4">Update</button>
				      <% } else { %>
				      		<button type="submit" class="btn btn-primary mr-4">Create</button>
				      <%}
				      %>
				      <button type="button" class="btn btn-danger" onClick="window.location.href='managecustomers.jsp'">
				      	Cancel
				      </button>
					</div>
				</div>
			</form>
		</div>
		
		<%@ include file="./components/footer.jsp" %>
	</div>
</body>
</html>