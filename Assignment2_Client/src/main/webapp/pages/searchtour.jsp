<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, classes.Tour, classes.CategoryUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Tour</title>
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
	<%@ include file="./components/adminHeader.jsp" %>
	<div class="page-wrapper">
		<div class="container">
		<h1>Search Tour</h1>
			<form method="post" action="/Assignment2_Client/TourServlet?action=search">
				<input type="text" name="tour" />
				<input type="submit" value="Search" />
			</form>
			<div>
			<div class="row my-3">
				<div class="col-md-2">
					<h3 class="text-dark" style="font-family: sans-serif;">Tour</h3>
				</div>
				<div class="col-md-4">
					<h3 class="text-dark" style="font-family: sans-serif;">Brief Description</h3>
				</div>
				<div class="col-md-1">
					<h3 class="text-dark" style="font-family: sans-serif;">Price</h3>
				</div>
				<div class="col-md-1">
					<h3 class="text-dark" style="font-family: sans-serif;">Slots</h3>
				</div>
				<div class="col-md-2">
					<h3 class="text-dark" style="font-family: sans-serif;">Category</h3>
				</div>
				<div class="col-md-2 text-justify">
					<button class="btn btn-success" onClick="window.location.href='tourform.jsp'">Create New Tour</button>
				</div>
			</div>
				<%
					ArrayList<Tour> tourlist = (ArrayList<Tour>)session.getAttribute("tourArray");
				session.removeAttribute("tourArray");
					if (tourlist != null){
						for (int i = 0; i < tourlist.size(); i++){
				%>
						<div class="row my-2">
					<div class="col-md-2">
						<%= tourlist.get(i).getName() %>
					</div>
					<div class="col-md-4">
						<%= tourlist.get(i).getBriefDescription() %>
					</div>
					<div class="col-md-1">
						<%= tourlist.get(i).getPrice() %>
					</div>
					<div class="col-md-1">
						<%= tourlist.get(i).getSlots() %>
					</div>
					<div class="col-md-2">
						<%= CategoryUtils.getCategoryName(tourlist.get(i).getCategoryID()) %>
					</div>
					<div class="col-md-2">
						<form action="../TourServlet?action=delete&tourid=<%=tourlist.get(i).getId() %>" method="post">
							<button 
								type="button"
								class="btn btn-primary" 
								onClick= "window.location.href='tourform.jsp?tourid=<%= tourlist.get(i).getId() %>'">
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
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
	<%@ include file="./components/footer.jsp" %>
</body>
</html>