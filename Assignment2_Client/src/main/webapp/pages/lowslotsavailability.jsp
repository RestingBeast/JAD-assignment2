<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "classes.BookedTours,java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tours with Low Slots Availability</title>
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
	<%
	ArrayList<BookedTours> tours = new ArrayList<BookedTours>();
			BookedTours t = null;
			Connection conn = null;
			try {
		Class.forName("com.mysql.cj.jdbc.Driver");	
		String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
		conn = DriverManager.getConnection(connURL);
		String sqlStr = "SELECT t.tourid, t.tour, t.brief_desc, ROUND(b.price , 2) AS total_sale,"
			    + "t.slots - b.slots_taken AS slots_available, t.slots AS max_slots, t.fk_category_id, t.tour_pic_url "
			    + "FROM tour AS t,	booking AS b WHERE t.tourid = b.fk_tour_id AND (b.slots_taken/t.slots) > (75/100);";
		PreparedStatement ps = conn.prepareStatement(sqlStr);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			t = new BookedTours();			
			t.setTourid(rs.getInt("tourid"));
			t.setTour(rs.getString("tour"));
			t.setBrief_desc(rs.getString("brief_desc"));
			t.setTotalSale(rs.getDouble("total_sale"));
			t.setSlotsAvailable(rs.getInt("slots_available"));
			t.setMaxSlots(rs.getInt("max_slots"));
			t.setCategoryid(rs.getInt("fk_category_id"));
			t.setPic_url(rs.getString("tour_pic_url"));
			
			tours.add(t);
		}
			} catch(Exception e) {
		System.out.println("Exception: " + e);
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

	<div class="page-wrapper">
		<%@ include file="./components/adminHeader.jsp" %>
		<section class="page-header"
			style="background-image: url(../images/backgrounds/category-1.jpg);">
			<div class="container">
				<h2>Slots Availability</h2>
			</div>
		</section>
		
		<section style="padding-bottom:0px" class="tour-one tour-grid">
			<div class="container">
				<div class="tour-sorter-one">
					<h3>Tours with less than 75% available slots</h3>
				</div><!-- /.tour-sorter-one -->

				<% int i=0; %>
				<% while (i < tours.size()) { %>
					<div class="row">
					<% for(int j=0; j < 3; j++) {
						if (i==tours.size()){
									break;
						}%>
						<% int categoryid=tours.get(i).getCategoryid(); %>
	
						<div class="col-lg-4 col-md-6">
							<div class="tour-one__single">
								<div class="tour-one__image">
									<img src="../images/tour/<%=tours.get(i).getPic_url()%>"
										alt="">
								</div><!-- /.tour-one__image -->
								<div class="tour-one__content">
									<h3>No.<%=i+1%>: <%=tours.get(i).getTour()%></h3>
									<ul class="tour-one__meta list-unstyled">
										<li>Available Slots: <%= tours.get(i).getSlotsAvailable() %><br /></li>
										<li>Max Slots <%=tours.get(i).getMaxSlots() %></li>
									</ul><!-- /.tour-one__meta -->
								</div><!-- /.tour-one__content -->
							</div><!-- /.tour-one__single -->
						</div><!-- /.col-lg-4 -->
						<% i++; %>
					<% } %>
					</div><!-- /.row -->
				<% } %>
			</div><!-- /.container -->
		</section><!-- /.tour-one -->
		
		<%@ include file="./components/footer.jsp" %>
	</div>
</body>
</html>