package classes;

//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ReviewUtils {
	
	public ReviewUtils() {
		
	}
	
	public static ArrayList<Review> getReviewsByTour(int tid) {
		ArrayList<Review> reviews = new ArrayList<Review>();
		Review r = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);

			String sqlStr = "SELECT r.*, u.username FROM reviews AS r, user AS u WHERE r.fk_user_id = u.userid AND fk_tour_id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, tid);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				r = new Review();
				
				r.setUserid(rs.getInt("fk_user_id"));
				r.setTourid(rs.getInt("fk_tour_id"));
				r.setId(rs.getInt("review_id"));
				r.setReviewDesc(rs.getString("review_desc"));
				r.setRating(rs.getInt("rating"));
				r.setUsername(rs.getString("username"));
				r.setCreatedAt(rs.getTimestamp("created_at").toString());
				
				reviews.add(r);
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		
		return reviews;
	}
	
//	public void getReviewsByTour(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		PrintWriter out = response.getWriter();
//		Client client = ClientBuilder.newClient();
//		String restURL = "http://localhost:8080/Assignment2_Server/ReviewService/getReviewsByTour";
//		WebTarget target = client.target(restURL);
//		
//		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
//		Response resp = invocationBuilder.get();
//		
//		if (resp.getStatus() == Response.Status.OK.getStatusCode()) {
//			try {
//				ArrayList<Review> rl = resp.readEntity(new GenericType<ArrayList<Review>>() {});
//				for(Review review : rl) {
//					out.println(review.getUserid());
//					out.print("<br>Userid: " + review.getUserid());
//					out.print("<br>Age: " + review.getReviewDesc());
//					out.print("<br>Gender: " + review.getRating() + "<br>");
//				}
//				request.setAttribute("reviewArray", rl);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		String url = "tour-details.jsp";
//		RequestDispatcher rd = request.getRequestDispatcher(url);
//		rd.forward(request, response);
//	}
}

