<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Top 10 Customer</title>
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
		<h1>Top 10 Customer</h1>
		<%
			Connection conn = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";		
				conn = DriverManager.getConnection(connURL);		
				String sqlStr = "SELECT p.fullname, SUM(b.price) AS total_spent "
						+ "FROM booking AS b, paymentinfo AS p "
						+ "WHERE b.fk_user_id = p.fk_user_id GROUP BY p.fullname LIMIT 10;";
				PreparedStatement ps = conn.prepareStatement(sqlStr);
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) { %>
					<div style="border: 1px solid red; padding: 5px; margin-bottom: 10px;">
						<p>
							Fullname: <%=rs.getString("fullname") %><br>
							Total Spent: <%=rs.getInt("total_spent") %>
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