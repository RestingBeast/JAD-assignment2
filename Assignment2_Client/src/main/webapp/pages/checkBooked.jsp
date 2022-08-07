<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Check Booked Customer By Tour</title>
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
		<div class="container">
		<h1>Get Booked Customer By Tour</h1>
		<form method="post" action="">
			<input type="text" name="tour" />
			<input type="submit" value="Search" />
		</form>
		<%
		    String tour = request.getParameter("tour");
		    System.out.print(tour);
			if (tour != null){
				Connection conn = null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";		
					conn = DriverManager.getConnection(connURL);		
					String sqlStr = "SELECT t.tour, p.fullname, b.slots_taken "
							+ "FROM booking AS b, paymentinfo AS p, tour AS t "
							+ "WHERE b.fk_user_id = p.fk_user_id AND t.tourid = b.fk_tour_id AND t.tour LIKE ?;";
					PreparedStatement ps = conn.prepareStatement(sqlStr);
					ps.setString(1, "%" + tour  + "%" );
					ResultSet rs = ps.executeQuery();
					
					while (rs.next()) { %>
						<div style="border: 1px solid red; padding: 5px; margin-bottom: 10px;">
							<p>
								Tour: <%=rs.getString("tour") %> <br>
								Fullname: <%=rs.getString("fullname") %><br>
								slots: <%=rs.getInt("slots_taken") %>
							</p>
						</div>
			<%		}
				} catch (Exception e){
					System.out.println("Exception: "+ e);
				} finally{
					try {
						if (conn != null) {
							conn.close();
						}
					}
					catch(Exception e) {
						System.out.println("Closing error :" + e);
					}
				}
			}
		%>
		</div>
		<%@ include file="./components/footer.jsp" %>
		</div>
	</body>
</html>