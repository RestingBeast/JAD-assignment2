package dbaccess;

import java.sql.*;

public class UserDAO {
	public User findById(int userID) {
		User u = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "SELECT * FROM user WHERE userid = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, userID);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				u = new User();
		
				u.setUserId(rs.getInt("userid"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setProfile_Pic_Url(rs.getString("profile_pic_url"));
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			}
			catch(Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		
		return u;
	}
}
