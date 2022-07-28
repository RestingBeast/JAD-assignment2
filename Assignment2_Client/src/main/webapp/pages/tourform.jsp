<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tour Form</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
</head>
<body>
	<div class="page-wrapper">
		<%@ page import="java.sql.*" %>
		<%@ include file="./components/header.jsp" %>
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
			String tour = "", b_desc = "", d_desc = "", picture = "";
			double price = 0; int slots = 0, category = -1, tourid = -1;
		%>
		<%
			if (request.getParameter("tourid") != null) {
				tourid = Integer.parseInt(request.getParameter("tourid"));
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String connURL = "jdbc:mysql:// localhost:3306/assignment1?user=root&password=owlciitty&serverTimezone=UTC";
					Connection conn = DriverManager.getConnection(connURL);
					String sqlStr = "SELECT * FROM tour WHERE tourid = ?";
					PreparedStatement ps = conn.prepareStatement(sqlStr);
					ps.setInt(1, tourid);
					ResultSet rs = ps.executeQuery();
					if (rs.next()){
						tour = rs.getString("tour");
						b_desc = rs.getString("brief_desc");
						d_desc = rs.getString("detailed_desc");
						picture = rs.getString("tour_pic_url");
						price = rs.getDouble("price");
						slots = rs.getInt("slots");
						category = rs.getInt("fk_category_id");
					}
				} catch (Exception e){
					System.out.println("Exception: " + e);
				}
			}
		%>
		<div class="form">
			<form  method="post" action="/Assignment1/servlets/createTour">
				<div class="form-group row">
				  <label for="tourname" class="col-md-2 col-form-label">Tour Name:</label>
				  <div class="col-md-10">
					  <input
				        type="text"
				        class="form-control"
				        id="tour"
				        name="tour"
				        value="<%= tour %>"
				        required
			          />
				  </div>
		        </div>
		        <div class="form-group row">
				  <label for="brief_desc" class="col-md-2 col-form-label">Brief Description</label>
				  <div class="col-md-10">
				  	<input
				        type="text"
			            class="form-control"
			            id="brief_desc"
			            name="brief_desc"
			            value="<%= b_desc %>"
		          	/>
				  </div>
		        </div>
		        <div class="form-group row">
				  <label for="detailed_desc" class="col-md-2 col-form-label">Detailed Description</label>
		          <div class="col-md-10">
		          	<textarea id="detailed_desc" name="detailed_desc" class="form-control" rows="3"><%= d_desc %></textarea>
		          </div>
		        </div>
		        <div class="form-group row">
				  <label for="" class="col-md-2 col-form-label">Price</label>
				  <div class="col-md-10">
				  	<input
			            type="text"
			            class="form-control"
			            id="price"
			            name="price"
			            value="<%= price %>"
			            required
		          	/>
				  </div>
		        </div>
		        <div class="form-group row">
				  <label for="slots" class="col-md-2 col-form-label">Slots</label>
				  <div class="col-md-10">
		          	<input
			            type="text"
			            class="form-control"
			            id="slots"
			            name="slots"
			            value="<%= slots %>"
			            required
		          	/>
		          </div>
		        </div>
		        <fieldset class="form-group">
		        	<div class="row">
		        		<legend class="col-md-2 col-form-label">Category</legend>
						<div class="col-md-10">
								<%
									try {
										Class.forName("com.mysql.jdbc.Driver");
										String connURL = "jdbc:mysql:// localhost:3306/assignment1?user=root&password=owlciitty&serverTimezone=UTC";
										Connection conn = DriverManager.getConnection(connURL);
										Statement stmt = conn.createStatement();
										String sqlStr = "SELECT * FROM category";
										ResultSet rs = stmt.executeQuery(sqlStr);
										while (rs.next()) { 
								%>
										<div class="form-check">
											<input
												class="form-check-input"
												type="radio"
												name="category"
												id="category<%= rs.getInt("categoryid") %>"
												value="<%= rs.getInt("categoryid") %>"
												required
												<%
													if (category != -1 && category == rs.getInt("categoryid")){
														out.println("checked");
													}
												%>
											/>
											<label class="form-check-label" for="category<%= rs.getInt("categoryid") %>">
											<%= rs.getString("category") %></label>
										</div>
								<%
										}
									} catch (Exception e) {
										System.out.println("Exception: " + e);
									}
								%>	
						</div>
		        	</div>
		        </fieldset>
		        <div class="form-group row">
				  <label for="picture" class="col-md-2 col-form-label">Tour Picture URL:</label>
				  <div class="col-md-10">
				  	<input
			            type="text"
			            class="form-control"
			            id="picture"
			            name="picture"
		          	/>
				  </div>
		        </div>
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
				      <% if (tourid != -1){ %>
				      		<button type="submit" formaction="/Assignment1/servlets/updateTour?tourid=<%=tourid%>" class="btn btn-primary mr-4">Update</button>
				      <% } else { %>
				      		<button type="submit" class="btn btn-primary mr-4">Create</button>
				      <%}
				      %>
				      <button type="button" class="btn btn-danger" onClick="window.location.href='managetours.jsp'">
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