<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Booking Report</title>
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
		<h1>Booking this Month</h1>
		<%
			Connection conn = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";		
				conn = DriverManager.getConnection(connURL);		
				String sqlStr = "SELECT b.booking_id, p.full_name, b.slots_taken, t.tour, b.price, b.created_at "
					+ "FROM booking AS b, payment AS p, tour AS t WHERE "
					+ "'2022-08-01 00:00:00' < b.created_at < '2022-08-31 00:00:00' AND b.fk_user_id = p.fk_user_id AND "
					+ "b.fk_tour_id = t.tourid;";
				PreparedStatement ps = conn.prepareStatement(sqlStr);
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) { %>
					<div style="border: 1px solid red; padding: 5px; margin-bottom: 10px;">
						<p>
							BookingId: <%=rs.getInt("booking_id") %> <br>
							Fullname: <%=rs.getString("full_name") %><br>
							slots: <%=rs.getInt("slots_taken") %> <br>
							Tour: <%=rs.getString("tour") %> <br>
							Paid: S$<%=rs.getDouble("price") %> <br>
							Created At: <%=rs.getTimestamp("created_at") %>
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
		%>
		</div>
		<%@ include file="./components/footer.jsp" %>
		</div>
	</body>
</html>