<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="classes.UserInfo, java.util.ArrayList" %>
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
		
	%>
	<div class="page-wrapper">
		<%@ include file="./components/adminHeader.jsp" %>
		<%
		ArrayList<UserInfo> users = new ArrayList<UserInfo>();
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/UserInfoService";
		WebTarget target = client
				.target(restUrl)
				.path("getAll");
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.get();
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.OK.getStatusCode()) {
			System.out.println("Success");
			users = resp.readEntity(new GenericType<ArrayList<UserInfo>>() {});
			if (users != null){
				for (UserInfo user : users) {
					out.println("Userid: " + user.getUserid());
					out.println("Fullname: " + user.getFullname());
					out.println("Phone: " + user.getPhone());
					out.println("Zip: " + user.getZip());
					out.println("Address: " + user.getAddress());
				}
	%>
	<%		}
		}
	%>
		
		<%@ include file="./components/footer.jsp" %>
	</div>
</body>
</html>