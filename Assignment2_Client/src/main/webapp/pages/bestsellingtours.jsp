<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "classes.BestSellingTour, java.sql.*, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Best Selling Tours</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style.css" rel="stylesheet" />
</head>
<body>
	<%
		ArrayList<BestSellingTour> tours = new ArrayList<BestSellingTour>();
		BestSellingTour t = null;
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			String sqlStr = "SELECT t.tourid, t.tour, t.brief_desc, ROUND(t.price * (t.slots - b.slots_taken) , 2) AS total_sale,"
				    + "t.slots - b.slots_taken AS slots_available, t.fk_category_id, t.tour_pic_url	FROM tour AS t,	booking AS b WHERE "
				    + "t.tourid = b.fk_tour_id";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				t = new BestSellingTour();			
				t.setTourid(rs.getInt("tourid"));
				t.setTour(rs.getString("tour"));
				t.setBrief_desc(rs.getString("brief_desc"));
				t.setTotalSale(rs.getDouble("total_sale"));
				t.setSlotsAvailable(rs.getInt("slots_available"));
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
		<%
			String userId = (String)session.getAttribute("sessUserID");
			String role = (String)session.getAttribute("sessRole");
			System.out.println(userId + role);
			if (role == null || !role.equals("Admin")){
				response.sendRedirect("./error/401.html");
				return;
			}
		%>
		<section class="page-header"
			style="background-image: url(../images/backgrounds/category-0.jpg);">
			<div class="container">
				<h2>Best Selling Tours</h2>
			</div>
		</section>
		
		<section style="padding-bottom:0px" class="tour-one tour-grid">
			<div class="container">
				<div class="tour-sorter-one">
					<h3>Tour Categories</h3>
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
									<img src="../images/tour/category-<%=tours.get(i).getCategoryid()%>.jpg"
										alt="">
								</div><!-- /.tour-one__image -->
								<div class="tour-one__content">
									<h3><a href="#">
											No.<%=i+1%>: <%=tours.get(i).getTour()%>
									</a></h3>
									<ul class="tour-one__meta list-unstyled">
										<li>Total Sale: <%= String.format("%.2f", tours.get(i).getTotalSale()) %><br /></li>
										<li>Slots Left: <%=tours.get(i).getSlotsAvailable() %></li>
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