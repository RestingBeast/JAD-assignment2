<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tour Form</title>
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
		<%@ page import="java.sql.*" %>
		<%@ include file="./components/adminHeader.jsp" %>
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
					String connURL = "jdbc:mysql:// localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
					Connection conn = DriverManager.getConnection(connURL);
					String sqlStr = "SELECT * FROM tour WHERE tourid = ?";
					PreparedStatement ps = conn.prepareStatement(sqlStr);
					ps.setInt(1, tourid);
					ResultSet rs = ps.executeQuery();
					if (rs.next()){
						tour = rs.getString("tour");
						b_desc = rs.getString("brief_desc");
						d_desc = rs.getString("detailed_desc");
						price = rs.getDouble("price");
						slots = rs.getInt("slots");
						category = rs.getInt("fk_category_id");
						picture = rs.getString("tour_pic_url");
					}
				} catch (Exception e){
					System.out.println("Exception: " + e);
				}
			}
			
			if (request.getParameter("pic_url") != null) {
				picture = request.getParameter("pic_url");
				System.out.println(picture);
			}
		%>
		<div class="form">
			<h2 class="h2" style="text-align: center;">Tour Form</h2>
			<div class="form-group row" >
				<div class="image-center"><img src="/Assignment2_Client/ServeImage?picture=<%= picture%>" alt="" ></div>		
			</div>
			<form method="post"action="/Assignment2_Client/FileUploadServlet" enctype="multipart/form-data" >
				<div class="form-group row">
					<div class="col-md-2">
						<input class="no-display" type="text" id="tourid" name="tourid" value="<%= tourid %>" readonly >
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
			<form  method="post" action="/Assignment2_Client/TourServlet">
				<div class="form-group row">
					<input class="no-display" type="text" id="pic_url" name="pic_url" value="<%=picture%>" readonly >
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
										String connURL = "jdbc:mysql:// localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
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
				      		<button type="submit" formaction="/Assignment2_Client/TourServlet?action=update&tourid=<%=tourid%>" class="btn btn-primary mr-4">Update</button>
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