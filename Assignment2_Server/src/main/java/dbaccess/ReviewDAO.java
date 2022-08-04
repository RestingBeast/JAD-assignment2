package dbaccess;

import java.sql.*;
import java.util.ArrayList;

public class ReviewDAO {	
	public ArrayList<Review> getReviewsByTour(int tid) {
		ArrayList<Review> reviews = new ArrayList<Review>();
		Review r = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/db1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);

			String sqlStr = "SELECT * FROM reviews WHERE fk_tour_id = ?";
			
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
	
	public int insertReview(int uid, int tid, int rating, String reviewDesc) {
		Connection conn = null;
		int rowsAffected = -1;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/db1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "INSERT INTO reviews (fk_user_id, fk_tour_id, review_desc, rating) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			
			ps.setInt(1, uid);
			ps.setInt(2, tid);
			ps.setInt(3, rating);
			ps.setString(4, reviewDesc);
			
			rowsAffected = ps.executeUpdate();
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
		
		return rowsAffected;
	}
}
